local L = AceLibrary("AceLocale-2.2"):new("Automaton_Gossip")
Automaton_Gossip = Automaton:NewModule("跳过闲谈", "AceEvent-2.0", "AceDebug-2.0")
local module = Automaton_Gossip

local GossipData = {}
local QuestData = {}

module.description = L['Automatically complete quests and skip gossip text']
module.options = {
}

function module:OnInitialize()
	GossipData = module:GetGossipData()
	QuestData = module:GetQuestData()
	self:RegisterOptions(self.options)
end

function module:OnEnable()
	self:RegisterEvent("GOSSIP_SHOW")
	self:RegisterEvent("QUEST_PROGRESS")
	self:RegisterEvent("QUEST_COMPLETE")
	self:RegisterEvent("QUEST_DETAIL")
end

local alpha
function module:GOSSIP_SHOW()
	alpha = GossipFrame:GetAlpha()
	if IsShiftKeyDown() then return end
	GossipFrame:SetAlpha(0)

	local g = self:ProcessGossip(GetGossipOptions())

	if table.getn(g) > 1 then
		self:Debug("Too many gossips to pick from, doing nothing.")
		GossipFrame:SetAlpha(alpha)
		return
	elseif table.getn(g) == 1 then
		local z,_ = GetGossipAvailableQuests()
		local x,_ = GetGossipActiveQuests()
		if (x or z) and not (g[1][2] == "gossip") then
			self:Debug("Not AutoGossiping because there's an available or active quest.")
		else
			self:Debug(g[1][1])
			SelectGossipOption(g[1][3])
			GossipFrame:SetAlpha(alpha)
			return
		end
	end

	if self:CheckQuests(self:ProcessQuests(GetGossipActiveQuests()), SelectGossipActiveQuest) then
		GossipFrame:SetAlpha(alpha)
		return
	end
	if self:CheckQuests(self:ProcessQuests(GetGossipAvailableQuests()), SelectGossipAvailableQuest) then
		GossipFrame:SetAlpha(alpha)
		return
	end
	GossipFrame:SetAlpha(alpha)
end

function Automaton_Gossip:GOSSIP_CLOSED()
	GossipFrame:SetAlpha(alpha)
end

function module:QUEST_DETAIL()
	local q = GetTitleText()
	if QuestData[q] then
		self:Debug("Accepting "..q..".")
		AcceptQuest()
	end
end

function module:QUEST_PROGRESS()
	local q = GetTitleText()
	if QuestData[q] and IsQuestCompletable() then
		self:Debug("Completing "..q..".")
		CompleteQuest()
	end
end

function module:QUEST_COMPLETE()
	local q = GetTitleText()
	if QuestData[q] then
		self:Debug("RewardPicking "..q..".")
		GetQuestReward(0)
	end
end

function module:ProcessGossip(...)
	local arg = {}
	local gossips = {}
	for i = 1, table.getn(arg), 2 do
		local title, type = arg[i], arg[i+1]
		if GossipData[type] then
			if table.getn(GossipData[type]) == 0 then
				tinsert(gossips, {title, type, (i+1)/2})
			else
				for k,v in pairs(GossipData[type]) do
					if v == title then
						tinsert(gossips, {title, type, (i+1)/2})
					end
				end
			end
		end
	end
	return gossips
end

function module:ProcessQuests(...)
	local arg = {}
	local quests = {}
	for i = 1, table.getn(arg), 3 do
		local title, level = arg[i], arg[i+1]
		if QuestData[title] then
			local good = true
			if QuestData[title].items then
				for k, v in pairs(QuestData[title].items) do
					if tonumber(self:SearchBagsForQuantity(k)) < v then
						good = false
						break
					end
				end
			end
			if good then
				tinsert(quests, {title, level, (i+2)/3})
			end
		end
	end
	return quests
end

function module:CheckQuests(quests, func)
	if table.getn(quests) > 1 then
		local quest, priority = nil, 0
		for k,v in pairs(quests) do
			self:Debug(k,v)
			if QuestData[v[1]].priority and QuestData[v[1]].priority > priority then
				priority = QuestData[v[1]].priority
				quest = k
			end
		end
		self:Debug("ActiveQuest: "..quests[quest][1])
		func(quests[quest][3])
		return true
	elseif table.getn(quests) == 1 then
		self:Debug("ActiveQuest: "..quests[1][1])
		func(quests[1][3])
		return true
	end
	return false
end

function module:SearchBagsForQuantity(itemname)
	local quantity = 0
	for bag = 0, 4 do
		if GetContainerNumSlots(bag) > 0 then
			for slot = 0, GetContainerNumSlots(bag) do
				if GetContainerItemLink(bag, slot) then
					local _,_,link = string.find(GetContainerItemLink(bag, slot), "(item:%d+:%d+:%d+:%d+)")
					local item = GetItemInfo(link)

					if item == itemname then
						local _,q = GetContainerItemInfo(bag, slot)
						quantity = quantity + q
					end
				end
			end
		end
	end
	return quantity
end