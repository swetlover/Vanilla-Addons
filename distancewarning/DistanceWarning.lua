DISTANCEWARNING_VERSION="DistanceWarning V 1.7.4 ";
DISTANCEWARNING_SAVE={};
DISTANCEWARNING_PROFILE="";
DW_CFG_LOADED=false;
DW_LOCK=nil;
DW_SCALE=nil;
DW_SHOWMOD=2;
DW_NEEDSCAN=false;
DW_MAX_DISTANCE=nil;
DW_MIN_DISTANCE=nil;
DW_ATTACK_ACTION_SLOT={};
DW_ASSIST_ACTION_SLOT={};
DW_ATTACK_NEEDSCAN={};
DW_ASSIST_NEEDSCAN={};
DW_PLAYER_CLASS=nil;
DW_PLAYER_LEVEL=nil; 
DW_TALENTTAB_LOADED=false;
DW_TOWNWATCH_RANK=0;
DW_EVILSTRATAGEM_RANK=0;
DW_EVILSTRATAGEM_INCREASE_RANGE=0; 
DW_FRAMETHROWING_RANK=0;
DW_ARCTICREACH_RANK=0;
DW_NATUREREACH_RANK=0;
DW_GRIMREACH_RANK=0;
DW_DESTRUCTIVEREACH_RANK=0;
DW_HOLYREACH_RANK=0;
DW_SHADOWREACH_RANK=0;
DW_STORMREACH_RANK=0;
DW_MELEE_MODIFYER=nil;
DW_RANGE_MODIFYER=nil;
DW_MELEE_ATTACK_BAR=nil;
DW_RANGE_ATTACK_BAR=nil;
DW_ASSIST_BAR=nil;
DW_MSG1="于动作栏探测到--";
DW_MSG2="--可对敌对目标提示";
DW_MSG3="--可对友方目标提示";

function DistanceWarning_OnLoad()
	this:RegisterEvent("PLAYER_TARGET_CHANGED");
	this:RegisterEvent("ACTIONBAR_SLOT_CHANGED");
	this:RegisterEvent("PLAYER_ENTERING_WORLD");
	this:RegisterEvent("CHARACTER_POINTS_CHANGED"); 
	
	for i=5,41 do
		DW_ATTACK_ACTION_SLOT[i]=nil;
		DW_ATTACK_NEEDSCAN[i]=false;
		DW_ASSIST_ACTION_SLOT[i]=nil;
		DW_ASSIST_NEEDSCAN[i]=false;
	end
	DW_NEEDSCAN=false;
	
	SLASH_DISTANCEWARNING1="/distancewarning";
	SLASH_DISTANCEWARNING2="/dw";
	SLASH_DISTANCEWARNING3="/DW";
	SlashCmdList["DISTANCEWARNING"]=function(msg)
		DistanceWarning_SlashCommanHandler(msg);
	end
	
	ChatFrame1:AddMessage(DISTANCEWARNING_VERSION.." 已加载");
	DistanceWarning_ShowCmd();
end

function DistanceWarning_LoadCfg()
	if(DISTANCEWARNING_SAVE[DISTANCEWARNING_PROFILE]==nil) then
		DISTANCEWARNING_SAVE[DISTANCEWARNING_PROFILE]={};
	end
	if(DISTANCEWARNING_SAVE[DISTANCEWARNING_PROFILE].lock==nil) then
		DW_LOCK=0;
		DISTANCEWARNING_SAVE[DISTANCEWARNING_PROFILE].lock=0;
	else
		DW_LOCK=DISTANCEWARNING_SAVE[DISTANCEWARNING_PROFILE].lock;
	end
	if(DISTANCEWARNING_SAVE[DISTANCEWARNING_PROFILE].scale==nil) then
		DW_SCALE=1;
		DISTANCEWARNING_SAVE[DISTANCEWARNING_PROFILE].scale=1;
	else
		DW_SCALE=DISTANCEWARNING_SAVE[DISTANCEWARNING_PROFILE].scale;
		DistanceWarningBar:SetScale(DW_SCALE*UIParent:GetScale());
	end
	if(DISTANCEWARNING_SAVE[DISTANCEWARNING_PROFILE].showmod==nil) then
		DW_SHOWMOD=1;
		DISTANCEWARNING_SAVE[DISTANCEWARNING_PROFILE].showmod=1;
	else
		DW_SHOWMOD=DISTANCEWARNING_SAVE[DISTANCEWARNING_PROFILE].showmod;
	end
	if(DISTANCEWARNING_SAVE[DISTANCEWARNING_PROFILE].meleeattackbar==nil) then
		DW_MELEE_ATTACK_BAR=0;
	else
		DW_MELEE_ATTACK_BAR=DISTANCEWARNING_SAVE[DISTANCEWARNING_PROFILE].meleeattackbar;
	end
	if(DISTANCEWARNING_SAVE[DISTANCEWARNING_PROFILE].rangeattackbar==nil) then
		DW_RANGE_ATTACK_BAR=0;
	else
		DW_RANGE_ATTACK_BAR=DISTANCEWARNING_SAVE[DISTANCEWARNING_PROFILE].rangeattackbar;
	end
	if(DISTANCEWARNING_SAVE[DISTANCEWARNING_PROFILE].assistbar==nil) then
		DW_ASSIST_BAR=0;
	else
		DW_ASSIST_BAR=DISTANCEWARNING_SAVE[DISTANCEWARNING_PROFILE].assistbar;
	end
end

function DistanceWarning_SlashCommanHandler(msg)
	if(msg) then
		if(string.lower(msg)=="lock" or msg=="锁定") then
			DW_LOCK=1;
			DISTANCEWARNING_SAVE[DISTANCEWARNING_PROFILE].lock=1; 
			ChatFrame1:AddMessage("DistanceWarning 锁定",1,1,0);
		elseif(string.lower(msg)=="unlock" or msg=="解锁") then
			DW_LOCK=0;
			DISTANCEWARNING_SAVE[DISTANCEWARNING_PROFILE].lock=0;
			ChatFrame1:AddMessage("DistanceWarning 解除锁定",1,1,0);
		elseif(string.sub(string.lower(msg),1,5)=="scale" or string.sub(msg,1,6)=="缩放") then
			if(string.sub(string.lower(msg),1,5)=="scale") then
				DW_SCALE=tonumber(string.sub(string.lower(msg),7)); 
			else
				DW_SCALE=tonumber(string.sub(string.lower(msg),8));
 			end
 			if(DW_SCALE and DW_SCALE>=0.5 and DW_SCALE<=3) then
				DISTANCEWARNING_SAVE[DISTANCEWARNING_PROFILE].scale=DW_SCALE; 
				DistanceWarningBar:ClearAllPoints();
				DistanceWarningBar:SetPoint("CENTER","UIParent",0,0);
				DistanceWarningBar:SetScale(DW_SCALE*UIParent:GetScale());
				ChatFrame1:AddMessage("DistanceWarning 缩放比例:"..DW_SCALE,1,1,0);
			else
				DistanceWarning_ShowCmd();
			end
		elseif(string.lower(msg)=="usedefault" or string.lower(msg)=="默认设置") then
			DW_LOCK=0;
			DISTANCEWARNING_SAVE[DISTANCEWARNING_PROFILE].lock=0;
			ChatFrame1:AddMessage("DistanceWarning 解除锁定",1,1,0);
			
			DW_SCALE=1;
			DISTANCEWARNING_SAVE[DISTANCEWARNING_PROFILE].scale=0.8;
			DistanceWarningBar:ClearAllPoints();
			DistanceWarningBar:SetPoint("CENTER","UIParent",0,0);
			DistanceWarningBar:SetScale(DW_SCALE*UIParent:GetScale());
			ChatFrame1:AddMessage("DistanceWarning 缩放比例:"..DW_SCALE,1,1,0);
			
			DW_SHOWMOD=1;
			DISTANCEWARNING_SAVE[DISTANCEWARNING_PROFILE].showmod=1;
			ChatFrame1:AddMessage("DistanceWarning 显示模式1",1,1,0);
			
			DW_MELEE_ATTACK_BAR=0;
			DISTANCEWARNING_SAVE[DISTANCEWARNING_PROFILE].meleeattackbar=0;
			ChatFrame1:AddMessage("DistanceWarning 近身攻击动作栏取消",1,1,0);
			DW_RANGE_ATTACK_BAR=0;
			DISTANCEWARNING_SAVE[DISTANCEWARNING_PROFILE].rangeattackbar=0;
			ChatFrame1:AddMessage("DistanceWarning 远程攻击动作栏取消",1,1,0);
			DW_ASSIST_BAR=0;
			DISTANCEWARNING_SAVE[DISTANCEWARNING_PROFILE].assistbar=0;
			ChatFrame1:AddMessage("DistanceWarning 援助动作栏取消",1,1,0);
			
		elseif(string.lower(msg)=="showmod1" or string.lower(msg)=="显示模式1") then
			DW_SHOWMOD=1;
			DISTANCEWARNING_SAVE[DISTANCEWARNING_PROFILE].showmod=1;
			ChatFrame1:AddMessage("DistanceWarning 显示模式1",1,1,0);
		elseif(string.lower(msg)=="showmod2" or string.lower(msg)=="显示模式2") then
			DW_SHOWMOD=2;
			DISTANCEWARNING_SAVE[DISTANCEWARNING_PROFILE].showmod=2;
			ChatFrame1:AddMessage("DistanceWarning 显示模式2",1,1,0); 
								
		elseif(string.sub(string.lower(msg),1,8)=="meleebar" or string.sub(msg,1,15)=="近战动作栏") then
			if(string.sub(string.lower(msg),1,8)=="meleebar") then 
				DW_MELEE_ATTACK_BAR=tonumber(string.sub(msg,10));
			else
				DW_MELEE_ATTACK_BAR=tonumber(string.sub(msg,17));
			end
 			if(DW_MELEE_ATTACK_BAR and DW_MELEE_ATTACK_BAR>=1 and DW_MELEE_ATTACK_BAR<=10) then
				DISTANCEWARNING_SAVE[DISTANCEWARNING_PROFILE].meleeattackbar=DW_MELEE_ATTACK_BAR;
				ChatFrame1:AddMessage("DistanceWarning 当可攻击目标距离小于8时自动切换到动作栏"..DW_MELEE_ATTACK_BAR,1,1,0); 
				ChatFrame1:AddMessage("由于暴雪将用于切换动作栏的函数ChangeActionBarPage()设置为在战斗状态下禁用，导致现在无法在战斗中通过宏或插件切换动作栏，故该功能暂时取消!敬请谅解",1,0,0);
 				else
				DW_MELEE_ATTACK_BAR=0;
				DISTANCEWARNING_SAVE[DISTANCEWARNING_PROFILE].meleeattackbar=0;
				ChatFrame1:AddMessage("DistanceWarning 近身攻击动作栏取消",1,1,0);
			end
		elseif(string.sub(string.lower(msg),1,8)=="rangebar" or string.sub(msg,1,15)=="远程动作栏") then
			if(string.sub(string.lower(msg),1,8)=="rangebar") then 
				DW_RANGE_ATTACK_BAR=tonumber(string.sub(msg,10));
			else
				DW_RANGE_ATTACK_BAR=tonumber(string.sub(msg,17));
			end
 			if(DW_RANGE_ATTACK_BAR and DW_RANGE_ATTACK_BAR>=1 and DW_RANGE_ATTACK_BAR<=10) then
				DISTANCEWARNING_SAVE[DISTANCEWARNING_PROFILE].rangeattackbar=DW_RANGE_ATTACK_BAR;
				ChatFrame1:AddMessage("DistanceWarning 当可攻击目标距离大于8时自动切换到动作栏"..DW_RANGE_ATTACK_BAR,1,1,0); 
				ChatFrame1:AddMessage("由于暴雪将用于切换动作栏的函数ChangeActionBarPage()设置为在战斗状态下禁用，导致现在无法在战斗中通过宏或插件切换动作栏，故该功能暂时取消!敬请谅解",1,0,0);
			else
				DW_RANGE_ATTACK_BAR=0;
				DISTANCEWARNING_SAVE[DISTANCEWARNING_PROFILE].rangeattackbar=0;
				ChatFrame1:AddMessage("DistanceWarning 远程攻击动作栏取消",1,1,0);
			end
		elseif(string.sub(string.lower(msg),1,9)=="assistbar" or string.sub(msg,1,15)=="援助动作栏") then
			if(string.sub(string.lower(msg),1,9)=="assistbar") then 
				DW_ASSIST_BAR=tonumber(string.sub(msg,11));
			else
				DW_ASSIST_BAR=tonumber(string.sub(msg,17));
			end
 			if(DW_ASSIST_BAR and DW_ASSIST_BAR>=1 and DW_ASSIST_BAR<=10) then 
				DISTANCEWARNING_SAVE[DISTANCEWARNING_PROFILE].assistbar=DW_ASSIST_BAR;
				ChatFrame1:AddMessage("DistanceWarning 对可援助目标将自动切换到动作栏"..DW_ASSIST_BAR,1,1,0); 
				ChatFrame1:AddMessage("由于暴雪将用于切换动作栏的函数ChangeActionBarPage()设置为在战斗状态下禁用，导致现在无法在战斗中通过宏或插件切换动作栏，故该功能暂时取消!敬请谅解",1,0,0);
			else
				DW_ASSIST_BAR=0;
				DISTANCEWARNING_SAVE[DISTANCEWARNING_PROFILE].assistbar=0;
				ChatFrame1:AddMessage("DistanceWarning 援助动作栏取消",1,1,0);
			end 
		
		elseif(string.lower(msg)=="扫描结果" or string.lower(msg)=="showresult") then
			local ActionName=nil; 
			DWSpelltip:SetOwner(UIParent,"ANCHOR_NONE");
			for yard=5,41 do 
				if(DW_ATTACK_ACTION_SLOT[yard]~=nil) then
					DWSpelltip:SetAction(DW_ATTACK_ACTION_SLOT[yard]);
					ActionName=DWSpelltipTextLeft1:GetText(); 
					ChatFrame1:AddMessage(DW_MSG1..ActionName..DW_MSG2..yard.."码",1,1,0);
 				end
				if(DW_ASSIST_ACTION_SLOT[yard]~=nil) then
					DWSpelltip:SetAction(DW_ASSIST_ACTION_SLOT[yard]);
					ActionName=DWSpelltipTextLeft1:GetText();
					ChatFrame1:AddMessage(DW_MSG1..ActionName..DW_MSG3..yard.."码",1,1,0); 
				end
			end
	
		else 
			DistanceWarning_ShowCmd();
		end	
	end
end

function DistanceWarning_ShowCmd()
	ChatFrame1:AddMessage("**************************************************************",1,1,0);
	ChatFrame1:AddMessage("DistanceWarning命令列表(格式:/dw 命令 参数):",1,1,0);
	ChatFrame1:AddMessage("lock/锁定 锁定进度条",1,1,0);
	ChatFrame1:AddMessage("unlock/解锁 解除锁定",1,1,0);
	ChatFrame1:AddMessage("scale/缩放 对距离进度条进行缩放(参数范围:0.5~3)",1,1,0);
	ChatFrame1:AddMessage("showmod1/显示模式1 提示距离上限及下限",1,1,0);
	ChatFrame1:AddMessage("showmod2/显示模式2 仅提示距离上限",1,1,0);
	ChatFrame1:AddMessage("usedefault/默认设置 使用默认设置",1,1,0);
	ChatFrame1:AddMessage("meleebar/近战动作栏 设置近身攻击动作栏(暂时无效)",1,1,0);
	ChatFrame1:AddMessage("rangebar/远程动作栏 设置远程攻击动作栏(暂时无效)",1,1,0);
	ChatFrame1:AddMessage("assistbar/援助动作栏 设置援助动作栏(暂时无效)",1,1,0);
	ChatFrame1:AddMessage("showresult/扫描结果 显示动作栏技能扫描结果",1,1,0);
 	ChatFrame1:AddMessage("**************************************************************",1,1,0);
end

function DistanceWarning_OnEvent(event,arg1)
	if(event=="PLAYER_ENTERING_WORLD") then
		if(DW_PLAYER_CLASS==nil) then
			DW_PLAYER_CLASS=UnitClass("player"); 
			--ChatFrame1:AddMessage("职业:"..DW_PLAYER_CLASS,1,1,0);
		end
		if(DW_PLAYER_LEVEL==nil) then
			DW_PLAYER_LEVEL=UnitLevel("player");
			--ChatFrame1:AddMessage("等级:"..DW_PLAYER_LEVEL,1,1,0);
		end
	end
		
	if(event=="PLAYER_TARGET_CHANGED") then
		if(UnitExists("target")) then
			DistanceWarningFrameStatusBar:SetMinMaxValues(0,41);
			local melee_mod1,melee_mod2,range_mod1,range_mod2;
			if(UnitIsPlayer("target")) then
				if(UnitRace("target")=="牛头人") then
					melee_mod1=2.4;
					range_mod1=3.4;
 				else
					melee_mod1=0;
					range_mod1=1;
				end
				if(UnitRace("player")=="牛头人") then
					melee_mod2=2.4;
					range_mod2=3.4;
				else
					melee_mod2=0;
					range_mod2=1;
				end
			else
				melee_mod1=0;
				range_mod1=0;
				melee_mod2=0;
				range_mod2=0;
			end
			DW_MELEE_MODIFYER=melee_mod1+melee_mod2;
			DW_RANGE_MODIFYER=range_mod1+range_mod2;
			DistanceWarningBar:Show();
		else
			DistanceWarningBar:Hide();
		end
		DW_MAX_DISTANCE=nil;
		DW_MIN_DISTANCE=nil;
	end

	if(event=="CHARACTER_POINTS_CHANGED") then
		if(DW_PLAYER_CLASS=="猎人") then
			local rank0=DW_TOWNWATCH_RANK;
			local _,texture,_,_,rank,_,_,_=GetTalentInfo(3,3);
			if(not(texture) or rank==nil) then
				DW_TOWNWATCH_RANK=0;
			else
				DW_TOWNWATCH_RANK=rank;
			end
			if(DW_TOWNWATCH_RANK~=rank0) then
				--ChatFrame1:AddMessage("天赋配置改变:",1,0,0); 
				--ChatFrame1:AddMessage("鹰眼等级:"..DW_TOWNWATCH_RANK,1,1,0);
				if(DW_ATTACK_ACTION_SLOT[15+rank0*2]~=nil) then
					if(DW_ATTACK_ACTION_SLOT[15+DW_TOWNWATCH_RANK*2]==nil) then
						DW_ATTACK_NEEDSCAN[15+DW_TOWNWATCH_RANK*2]=true;
					end
					DW_ATTACK_ACTION_SLOT[15+rank0*2]=nil;
					DW_ATTACK_NEEDSCAN[15+rank0*2]=true;
					DW_NEEDSCAN=true;
				end
				if(DW_ATTACK_ACTION_SLOT[35+rank0*2]~=nil) then
					if(DW_ATTACK_ACTION_SLOT[35+DW_TOWNWATCH_RANK*2]==nil) then
						DW_ATTACK_NEEDSCAN[35+DW_TOWNWATCH_RANK*2]=true;
					end
					DW_ATTACK_ACTION_SLOT[35+rank0*2]=nil;
					DW_ATTACK_NEEDSCAN[35+rank0*2]=true;
					DW_NEEDSCAN=true;
				end
			end
		elseif(DW_PLAYER_CLASS=="盗贼") then 
			local evilStratagemRange0=DW_EVILSTRATAGEM_INCREASE_RANGE;
 			local _,texture,_,_,rank,_,_,_=GetTalentInfo(3,4);
			if(not(texture) or rank==nil) then
				DW_EVILSTRATAGEM_RANK=0;
			else
				DW_EVILSTRATAGEM_RANK=rank;
			end
			if(DW_EVILSTRATAGEM_RANK==0) then
				DW_EVILSTRATAGEM_INCREASE_RANGE=0;
			elseif(DW_EVILSTRATAGEM_RANK==1) then
				DW_EVILSTRATAGEM_INCREASE_RANGE=2;
			elseif(DW_EVILSTRATAGEM_RANK==2) then
				DW_EVILSTRATAGEM_INCREASE_RANGE=5;
			end 
			if(DW_EVILSTRATAGEM_INCREASE_RANGE~=evilStratagemRange0) then
				--ChatFrame1:AddMessage("天赋配置改变:",1,0,0); 
				--ChatFrame1:AddMessage("邪恶计谋等级:"..DW_EVILSTRATAGEM_RANK,1,1,0);
				if(DW_ATTACK_ACTION_SLOT[5+evilStratagemRange0]~=nil) then
					if(DW_ATTACK_ACTION_SLOT[5+DW_EVILSTRATAGEM_INCREASE_RANGE]==nil) then
						DW_ATTACK_NEEDSCAN[5+DW_EVILSTRATAGEM_INCREASE_RANGE]=true;
					end
					DW_ATTACK_ACTION_SLOT[5+evilStratagemRange0]=nil;
					DW_ATTACK_NEEDSCAN[5+evilStratagemRange0]=true;
					DW_NEEDSCAN=true;
				end 
				if(DW_ATTACK_ACTION_SLOT[10+evilStratagemRange0]~=nil) then
					if(DW_ATTACK_ACTION_SLOT[10+DW_EVILSTRATAGEM_INCREASE_RANGE]==nil) then
						DW_ATTACK_NEEDSCAN[10+DW_EVILSTRATAGEM_INCREASE_RANGE]=true;
					end
					DW_ATTACK_ACTION_SLOT[10+evilStratagemRange0]=nil;
					DW_ATTACK_NEEDSCAN[10+evilStratagemRange0]=true;
					DW_NEEDSCAN=true;
  			end
  		end 
		elseif(DW_PLAYER_CLASS=="法师") then
			local rank0_1=DW_FRAMETHROWING_RANK;
			local rank0_2=DW_ARCTICREACH_RANK;
			local _,texture1,_,_,rank1,_,_,_=GetTalentInfo(2,4);
			local _,texture2,_,_,rank2,_,_,_=GetTalentInfo(3,11);
			if(not(texture1) or rank1==nil) then
				DW_FRAMETHROWING_RANK=0;
			else
				DW_FRAMETHROWING_RANK=rank1;
			end
			if(not(texture2) or rank2==nil) then
				DW_ARCTICREACH_RANK=0;
			else
				DW_ARCTICREACH_RANK=rank2;
			end
			if(DW_FRAMETHROWING_RANK~=rank0_1) then
				--ChatFrame1:AddMessage("天赋配置改变:",1,1,0); 
				--ChatFrame1:AddMessage("火焰投掷等级:"..DW_FRAMETHROWING_RANK,1,1,0);
				if(DW_ATTACK_ACTION_SLOT[20+rank0_1*3]~=nil) then
					if(DW_ATTACK_ACTION_SLOT[20+DW_FRAMETHROWING_RANK*3]==nil) then
						DW_ATTACK_NEEDSCAN[20+DW_FRAMETHROWING_RANK*3]=true;
					end
					DW_ATTACK_ACTION_SLOT[20+rank0_1*3]=nil;
					DW_ATTACK_NEEDSCAN[20+rank0_1*3]=true;
					DW_NEEDSCAN=true;
				end
				if(DW_ATTACK_ACTION_SLOT[30+rank0_1*3]~=nil) then
					if(DW_ATTACK_ACTION_SLOT[30+DW_FRAMETHROWING_RANK*3]==nil) then
						DW_ATTACK_NEEDSCAN[30+DW_FRAMETHROWING_RANK*3]=true;
					end
					DW_ATTACK_ACTION_SLOT[30+rank0_1*3]=nil;
					DW_ATTACK_NEEDSCAN[30+rank0_1*3]=true;
					DW_NEEDSCAN=true;
				end
				if(DW_ATTACK_ACTION_SLOT[35+rank0_1*3]~=nil) then
					if(DW_ATTACK_ACTION_SLOT[35+DW_FRAMETHROWING_RANK*3]==nil) then
						DW_ATTACK_NEEDSCAN[35+DW_FRAMETHROWING_RANK*3]=true;
					end
					DW_ATTACK_ACTION_SLOT[35+rank0_1*3]=nil;
					DW_ATTACK_NEEDSCAN[35+rank0_1*3]=true;
					DW_NEEDSCAN=true;
				end
			end
			if(DW_ARCTICREACH_RANK~=rank0_2) then
				--ChatFrame1:AddMessage("天赋配置改变:",1,1,0); 
				--ChatFrame1:AddMessage("极寒延伸等级:"..DW_ARCTICREACH_RANK,1,1,0);
				if(DW_ATTACK_ACTION_SLOT[30*(1+rank0_2*0.1)]~=nil) then
					if(DW_ATTACK_ACTION_SLOT[30*(1+DW_ARCTICREACH_RANK*0.1)]==nil) then
						DW_ATTACK_NEEDSCAN[30*(1+DW_ARCTICREACH_RANK*0.1)]=true;
					end
					DW_ATTACK_ACTION_SLOT[30*(1+rank0_2*0.1)]=nil;
					DW_ATTACK_NEEDSCAN[30*(1+rank0_2*0.1)]=true;
					DW_NEEDSCAN=true;
				end
			end
		elseif(DW_PLAYER_CLASS=="德鲁伊") then
			local rank0=DW_NATUREREACH_RANK;
			local _,texture,_,_,rank,_,_,_=GetTalentInfo(1,9); 
			if(not(texture) or rank==nil) then
				DW_NATUREREACH_RANK=0;
			else 
				DW_NATUREREACH_RANK=rank;
			end 
			if(DW_NATUREREACH_RANK~=rank0) then
				--ChatFrame1:AddMessage("天赋配置改变:",1,1,0);
				--ChatFrame1:AddMessage("自然延伸等级:"..DW_NATUREREACH_RANK,1,1,0);
				if(DW_ATTACK_ACTION_SLOT[30*(1+rank0*0.1)]~=nil) then
					if(DW_ATTACK_ACTION_SLOT[30*(1+DW_NATUREREACH_RANK *0.1)]==nil) then
						DW_ATTACK_NEEDSCAN[30*(1+DW_NATUREREACH_RANK*0.1)]=true;
					end
					DW_ATTACK_ACTION_SLOT[30*(1+rank0*0.1)]=nil;
					DW_ATTACK_NEEDSCAN[30*(1+rank0*0.1)]=true;
					DW_NEEDSCAN=true; 
				end
				if(DW_ASSIST_ACTION_SLOT[30*(1+rank0*0.1)]~=nil) then
					if(DW_ASSIST_NEEDSCAN[30*(1+DW_NATUREREACH_RANK*0.1)]==nil) then
						DW_ASSIST_NEEDSCAN[30*(1+DW_NATUREREACH_RANK*0.1)]=true;
					end
					DW_ASSIST_ACTION_SLOT[30*(1+rank0*0.1)]=nil;
					DW_ASSIST_NEEDSCAN[30*(1+rank0*0.1)]=true;
					DW_NEEDSCAN=true;
				end
			end
		elseif(DW_PLAYER_CLASS=="术士") then
			local rank0_1=DW_GRIMREACH_RANK;
			local rank0_2=DW_DESTRUCTIVEREACH_RANK;
			local _,texture1,_,_,rank1,_,_,_=GetTalentInfo(1,10);
			local _,texture2,_,_,rank2,_,_,_=GetTalentInfo(3,10);
			if(not(texture1) or rank1==nil) then
				DW_GRIMREACH_RANK=0;
			else
				DW_GRIMREACH_RANK=rank1;
			end
			if(not(texture2) or rank2==nil) then
				DW_DESTRUCTIVEREACH_RANK=0; 
			else
				DW_DESTRUCTIVEREACH_RANK=rank2;
			end
			if(DW_GRIMREACH_RANK~=rank0_1) then
				--ChatFrame1:AddMessage("天赋配置改变:",1,1,0);
				--ChatFrame1:AddMessage("无情延伸等级:"..DW_GRIMREACH_RANK,1,1,0);
				if(DW_ATTACK_ACTION_SLOT[20*(1+rank0_1*0.1)]~=nil) then
					if(DW_ATTACK_ACTION_SLOT[20*(1+DW_GRIMREACH_RANK*0.1)]==nil) then
						DW_ATTACK_NEEDSCAN[20*(1+DW_GRIMREACH_RANK*0.1)]=true;
					end 
					DW_ATTACK_ACTION_SLOT[20*(1+rank0_1*0.1)]=nil;
					DW_ATTACK_NEEDSCAN[20*(1+rank0_1*0.1)]=true;
					DW_NEEDSCAN=true;
				end
				if(DW_ATTACK_ACTION_SLOT[30*(1+rank0_1*0.1)]~=nil) then
					if(DW_ATTACK_ACTION_SLOT[30*(1+DW_GRIMREACH_RANK*0.1)]==nil) then
						DW_ATTACK_NEEDSCAN[30*(1+DW_GRIMREACH_RANK*0.1)]=true;
					end
					DW_ATTACK_ACTION_SLOT[30*(1+rank0_1*0.1)]=nil;
					DW_ATTACK_NEEDSCAN[30*(1+rank0_1*0.1)]=true;
					DW_NEEDSCAN=true;
				end 
			end
			if(DW_DESTRUCTIVEREACH_RANK~=rank0_2) then
				--ChatFrame1:AddMessage("天赋配置改变:",1,1,0);
				ChatFrame1:Addmessage("毁灭延伸等级:"..DW_DESTRUCTIVEREACH_RANK,1,1,0);
				if(DW_ATTACK_ACTION_SLOT[20*(1+rank0_2*0.1)]~=nil) then
					if(DW_ATTACK_ACTION_SLOT[20*(1+DW_DESTRUCTIVEREACH_RANK*0.1)]==nil) then
						DW_ATTACK_NEEDSCAN[20*(1+DW_DESTRUCTIVEREACH_RANK*0.1)]=true;
					end
					DW_ATTACK_ACTION_SLOT[20*(1+rank0_2*0.1)]=nil;
					DW_ATTACK_NEEDSCAN[20*(1+rank0_2*0.1)]=true;
					DW_NEEDSCAN=true;
				end
				if(DW_ATTACK_ACTION_SLOT[30*(1+rank0_2*0.1)]~=nil) then
					if(DW_ATTACK_ACTION_SLOT[30*(1+DW_DESTRUCTIVEREACH_RANK*0.1)]==nil) then
						DW_ATTACK_NEEDSCAN[30*(1+DW_DESTRUCTIVEREACH_RANK*0.1)]=true;
					end
					DW_ATTACK_ACTION_SLOT[30*(1+rank0_2*0.1)]=nil;
					DW_ATTACK_NEEDSCAN[30*(1+rank0_2*0.1)]=true;
					DW_NEEDSCAN=true;
				end 
			end
		elseif(DW_PLAYER_CLASS=="牧师") then
			local rank0_1=DW_HOLYREACH_RANK;
			local rank0_2=DW_SHADOWREACH_RANK;
			local _,texture1,_,_,rank1,_,_,_=GetTalentInfo(2,9);
			local _,texture2,_,_,rank2,_,_,_=GetTalentInfo(3,10); 
			if(texture1==nil or rank1==nil) then
				DW_HOLYREACH_RANK=0;
			else
				DW_HOLYREACH_RANK=rank1;
			end 
			if(texture2==nil or rank2==nil) then
				DW_SHADOWREACH_RANK=0;
			else
				DW_SHADOWREACH_RANK=rank2;
			end 
			if(DW_HOLYREACH_RANK~=rank0_1) then
				--ChatFrame1:AddMessage("天赋配置改变:",1,1,0);
				--ChatFrame1:AddMessage("神圣延伸等级:"..DW_HOLYREACH_RANK,1,1,0); 
				if(DW_ATTACK_ACTION_SLOT[30*(1+rank0_1*0.1)]~=nil) then
					if(DW_ATTACK_ACTION_SLOT[30*(1+DW_HOLYREACH_RANK*0.1)]==nil) then
						DW_ATTACK_NEEDSCAN[30*(1+DW_HOLYREACH_RANK*0.1)]=true;
					end 
					DW_ATTACK_ACTION_SLOT[30*(1+rank0_1*0.1)]=nil;
					DW_ATTACK_NEEDSCAN[30*(1+rank0_1*0.1)]=true;
					DW_NEEDSCAN=true;
				end
			end
			if(DW_SHADOWREACH_RANK~=rank0_2) then
				local shadowrange0;
				--ChatFrame1:AddMessage("天赋配置改变:",1,1,0);
				--ChatFrame1:AddMessage("暗影延伸等级:"..DW_SHADOWREACH_RANK,1,1,0);
				if(DW_ATTACK_ACTION_SLOT[20*(1+rank0_2*0.1)]~=nil) then
					if(DW_ATTACK_ACTION_SLOT[20*(1+DW_SHADOWREACH_RANK*0.1)]==nil) then
						DW_ATTACK_NEEDSCAN[20*(1+DW_SHADOWREACH_RANK*0.1)]=true;
					end
					DW_ATTACK_ACTION_SLOT[20*(1+rank0_2*0.1)]=nil;
					DW_ATTACK_NEEDSCAN[20*(1+rank0_2*0.1)]=true;
					DW_NEEDSCAN=true;
				end 
				if(DW_ATTACK_ACTION_SLOT[30*(1+rank0_2*0.1)]~=nil) then
					if(DW_ATTACK_ACTION_SLOT[30*(1+DW_SHADOWREACH_RANK*0.1)]==nil) then
						DW_ATTACK_NEEDSCAN[30*(1+DW_SHADOWREACH_RANK*0.1)]=true;
					end
					DW_ATTACK_ACTION_SLOT[30*(1+rank0_2*0.1)]=nil;
					DW_ATTACK_NEEDSCAN[30*(1+rank0_2*0.1)]=true;
					DW_NEEDSCAN=true; 
				end 
			end
		elseif(DW_PLAYER_CLASS=="萨满祭司") then
			local rank0=DW_STORMREACH_RANK;
			local _,texture,_,_,rank,_,_,_=GetTalentInfo(1,12); 
			if(not(texture) or rank==nil) then 
				DW_STORMREACH_RANK=0;
			else
				DW_STORMREACH_RANK=rank;
			end 
			if(DW_STORMREACH_RANK~=rank0) then
				--ChatFrame1:AddMessage("天赋配置改变:",1,1,0);
				--ChatFrame1:AddMessage("风暴来临等级:"..DW_STORMREACH_RANK,1,1,0); 
				if(DW_ATTACK_ACTION_SLOT[30+rank0*3]~=nil) then
					if(DW_ATTACK_ACTION_SLOT[30+DW_STORMREACH_RANK*3]==nil) then
						DW_ATTACK_NEEDSCAN[30+DW_STORMREACH_RANK*3]=true;
					end
					DW_ATTACK_ACTION_SLOT[30+rank0*3]=nil;
					DW_ATTACK_NEEDSCAN[30+rank0*3]=true;
					DW_NEEDSCAN=true;
				end
			end
		end
	end
	
	if(event=="ACTIONBAR_SLOT_CHANGED") then
		if(DW_PLAYER_CLASS) then
			for i=5,41 do
				if(arg1==DW_ATTACK_ACTION_SLOT[i]) then
					DW_ATTACK_ACTION_SLOT[i]=nil;
					DW_ATTACK_NEEDSCAN[i]=true;
  			end
 				if(arg1==DW_ASSIST_ACTION_SLOT[i]) then
					DW_ASSIST_ACTION_SLOT[i]=nil;
					DW_ASSIST_NEEDSCAN[i]=true;
				end
			end
			DistanceWarning_SpellDetector(arg1);
			DW_NEEDSCAN=DistanceWarning_CheckScanNeed();
		end
	end	
end
	
function DistanceWarning_OnUpdate()
	--装载配置变量 
	if(DW_CFG_LOADED==false) then
		DISTANCEWARNING_PROFILE=UnitName("player").." 在 "..GetCVar("RealmName");
		if(UnitName("player") and GetCVar("RealmName")) then
			DistanceWarning_LoadCfg();
			DW_CFG_LOADED=true;
		end
	end
		
	--等天赋树装载完毕以初始化需要扫描的技能
	if(not(DW_TALENTTAB_LOADED)) then
		if(DW_PLAYER_CLASS=="猎人") then
			local _,texture,_,_,rank,_,_,_=GetTalentInfo(3,3);
			if(DW_PLAYER_LEVEL<10) then
				DW_TOWNWATCH_RANK=0;
				DW_TALENTTAB_LOADED=true;
			elseif(texture) then
				DW_TOWNWATCH_RANK=rank;
				DW_TALENTTAB_LOADED=true;
			end
			if(DW_TALENTTAB_LOADED) then
				--ChatFrame1:AddMessage("鹰眼等级:"..DW_TOWNWATCH_RANK,1,1,0);
				DW_ATTACK_NEEDSCAN[5]=true;
				DW_ATTACK_NEEDSCAN[8]=true;
				DW_ATTACK_NEEDSCAN[15+DW_TOWNWATCH_RANK*2]=true;
				DW_ATTACK_NEEDSCAN[30]=true;
				DW_ATTACK_NEEDSCAN[35+DW_TOWNWATCH_RANK*2]=true;
				DW_ASSIST_NEEDSCAN[15]=true;
				DW_ASSIST_NEEDSCAN[30]=true; 
 				DW_NEEDSCAN=true;
			end
		elseif(DW_PLAYER_CLASS=="战士") then
			DW_TALENTTAB_LOADED=true;
			DW_ATTACK_NEEDSCAN[5]=true;
			DW_ATTACK_NEEDSCAN[8]=true;
			DW_ATTACK_NEEDSCAN[10]=true;
			DW_ATTACK_NEEDSCAN[25]=true;
			DW_ATTACK_NEEDSCAN[30]=true;
			DW_ASSIST_NEEDSCAN[8]=true;
			DW_ASSIST_NEEDSCAN[15]=true;
			DW_ASSIST_NEEDSCAN[25]=true;
  		DW_ASSIST_NEEDSCAN[30]=true;
 			DW_NEEDSCAN=true;
		elseif(DW_PLAYER_CLASS=="盗贼") then 
			local _,texture,_,_,rank,_,_,_=GetTalentInfo(3,4); 
			if(DW_PLAYER_LEVEL<10) then
				DW_EVILSTRATAGEM_RANK=0;
				DW_TALENTTAB_LOADED=true; 
			elseif(texture) then
				DW_EVILSTRATAGEM_RANK=rank;
				DW_TALENTTAB_LOADED=true;
			end  
			if(DW_EVILSTRATAGEM_RANK==0) then 
				DW_EVILSTRATAGEM_INCREASE_RANGE=0;
			elseif(DW_EVILSTRATAGEM_RANK==1) then 
				DW_EVILSTRATAGEM_INCREASE_RANGE=2;  
			elseif(DW_EVILSTRATAGEM_RANK==2) then 
				DW_EVILSTRATAGEM_INCREASE_RANGE=5; 
			end
			if(DW_TALENTTAB_LOADED) then
				--ChatFrame1:AddMessage("邪恶计谋等级:"..DW_EVILSTRATAGEM_RANK,1,1,0); 	
				DW_ATTACK_NEEDSCAN[5]=true;
				DW_ATTACK_NEEDSCAN[5+DW_EVILSTRATAGEM_INCREASE_RANGE]=true; 
				DW_ATTACK_NEEDSCAN[8]=true; 
				DW_ATTACK_NEEDSCAN[10+DW_EVILSTRATAGEM_INCREASE_RANGE]=true;
				DW_ATTACK_NEEDSCAN[20]=true;
				DW_ATTACK_NEEDSCAN[30]=true;
				DW_ASSIST_NEEDSCAN[15]=true;
	 			DW_ASSIST_NEEDSCAN[30]=true;
 				DW_NEEDSCAN=true;
 			end
		elseif(DW_PLAYER_CLASS=="法师") then
			local _,texture1,_,_,rank1,_,_,_=GetTalentInfo(2,4);
			local _,texture2,_,_,rank2,_,_,_=GetTalentInfo(3,11);
			if(DW_PLAYER_LEVEL<10) then
				DW_FRAMETHROWING_RANK=0;
				DW_ARCTICREACH_RANK=0;
				DW_TALENTTAB_LOADED=true;
			elseif(texture1 and texture2) then
				DW_FRAMETHROWING_RANK=rank1;
				DW_ARCTICREACH_RANK=rank2;
				DW_TALENTTAB_LOADED=true;
			end
			if(DW_TALENTTAB_LOADED) then
				--ChatFrame1:AddMessage("烈焰投掷等级:"..DW_FRAMETHROWING_RANK,1,1,0); 
				--ChatFrame1:AddMessage("极寒延伸等级:"..DW_ARCTICREACH_RANK,1,1,0);
				DW_ATTACK_NEEDSCAN[20+DW_FRAMETHROWING_RANK*3]=true;
				DW_ATTACK_NEEDSCAN[30+DW_FRAMETHROWING_RANK*3]=true;
				DW_ATTACK_NEEDSCAN[35+DW_FRAMETHROWING_RANK*3]=true;
				DW_ATTACK_NEEDSCAN[30*(1+DW_ARCTICREACH_RANK*0.1)]=true;
				DW_ATTACK_NEEDSCAN[30]=true;
				DW_ATTACK_NEEDSCAN[40]=true;
				DW_ASSIST_NEEDSCAN[30]=true;
				DW_ASSIST_NEEDSCAN[15]=true;
				DW_NEEDSCAN=true;
			end
		elseif(DW_PLAYER_CLASS=="萨满祭司") then
			local _,texture,_,_,rank,_,_,_=GetTalentInfo(1,12);
			if(DW_PLAYER_LEVEL<10) then
				DW_TALENTTAB_LOADED=true;
				DW_STORMREACH_RANK=0;
			elseif(texture) then 
				DW_TALENTTAB_LOADED=true;
				DW_STORMREACH_RANK=rank;
			end
			if(DW_TALENTTAB_LOADED) then
				--ChatFrame1:AddMessage("风暴来临等级:"..DW_STORMREACH_RANK,1,1,0);
				DW_ATTACK_NEEDSCAN[30+DW_STORMREACH_RANK*3]=true;
				DW_ATTACK_NEEDSCAN[20]=true;
				DW_ATTACK_NEEDSCAN[30]=true;
				DW_ASSIST_NEEDSCAN[40]=true;
				DW_ASSIST_NEEDSCAN[30]=true;
				DW_ASSIST_NEEDSCAN[15]=true;
				DW_NEEDSCAN=true;
			end
		elseif(DW_PLAYER_CLASS=="德鲁伊") then
			local _,texture,_,_,rank,_,_,_=GetTalentInfo(1,9); 
			if(DW_PLAYER_LEVEL<10) then
				DW_NATUREREACH_RANK=0;
				DW_TALENTTAB_LOADED=true;
			elseif(texture) then
				DW_NATUREREACH_RANK=rank; 
				DW_TALENTTAB_LOADED=true;
			end 
			if(DW_TALENTTAB_LOADED) then
				--ChatFrame1:AddMessage("自然延伸等级:"..DW_NATUREREACH_RANK,1,1,0);
				DW_ATTACK_NEEDSCAN[5]=true;
				DW_ATTACK_NEEDSCAN[8]=true;
				DW_ATTACK_NEEDSCAN[25]=true;
				DW_ATTACK_NEEDSCAN[30]=true;
				DW_ATTACK_NEEDSCAN[30*(1+DW_NATUREREACH_RANK*0.1)]=true;
				DW_ASSIST_NEEDSCAN[15]=true;
				DW_ASSIST_NEEDSCAN[30]=true;
				DW_ASSIST_NEEDSCAN[40]=true;
				DW_NEEDSCAN=true;
			end 
		elseif(DW_PLAYER_CLASS=="圣骑士") then
			DW_TALENTTAB_LOADED=true;
			DW_ATTACK_NEEDSCAN[10]=true;
			DW_ATTACK_NEEDSCAN[20]=true;
			DW_ATTACK_NEEDSCAN[30]=true;
			DW_ASSIST_NEEDSCAN[20]=true;
			DW_ASSIST_NEEDSCAN[15]=true;
			DW_ASSIST_NEEDSCAN[30]=true;
			DW_ASSIST_NEEDSCAN[40]=ture; 
			DW_NEEDSCAN=true;
		elseif(DW_PLAYER_CLASS=="术士") then
			local _,texture1,_,_,rank1,_,_,_=GetTalentInfo(1,10);
			local _,texture2,_,_,rank2,_,_,_=GetTalentInfo(3,10); 
			if(DW_PLAYER_LEVEL<10) then
				DW_TALENTTAB_LOADED=true;
				DW_GRIMREACH_RANK=0;
				DW_DESTRUCTIVEREACH_RANK=0;
			elseif(texture1 and texture2) then
				DW_TALENTTAB_LOADED=true;
				DW_GRIMREACH_RANK=rank1;
				DW_DESTRUCTIVEREACH_RANK=rank2;
			end
			if(DW_TALENTTAB_LOADED) then
				--ChatFrame1:AddMessage("无情延伸等级:"..DW_GRIMREACH_RANK,1,1,0); 
				--ChatFrame1:AddMessage("毁灭延伸等级:"..DW_DESTRUCTIVEREACH_RANK,1,1,0);
				DW_ATTACK_NEEDSCAN[20*(1+DW_GRIMREACH_RANK*0.1)]=true;
				DW_ATTACK_NEEDSCAN[30*(1+DW_GRIMREACH_RANK*0.1)]=true;
				DW_ATTACK_NEEDSCAN[20*(1+DW_DESTRUCTIVEREACH_RANK*0.1)]=true;
				DW_ATTACK_NEEDSCAN[30*(1+DW_DESTRUCTIVEREACH_RANK*0.1)]=true;
				DW_ATTACK_NEEDSCAN[30]=true;
				DW_ASSIST_NEEDSCAN[30]=true;
				DW_ASSIST_NEEDSCAN[15]=true;
				DW_NEEDSCAN=true;
			end	
		elseif(DW_PLAYER_CLASS=="牧师") then
			local _,texture1,_,_,rank1,_,_,_=GetTalentInfo(2,9); 
			local _,texture2,_,_,rank2,_,_,_=GetTalentInfo(3,10);
			if(DW_PLAYER_LEVEL<10) then
				DW_TALENTTAB_LOADED=true;
				DW_HOLYREACH_RANK=0;
				DW_SHADOWREACH_RANK=0;
			elseif(texture1 and texture2) then
				DW_TALENTTAB_LOADED=true;
				DW_HOLYREACH_RANK=rank1;
				DW_SHADOWREACH_RANK=rank2;
			end
			if(DW_TALENTTAB_LOADED) then
				--ChatFrame1:AddMessage("神圣延伸等级:"..DW_HOLYREACH_RANK,1,1,0);
				--ChatFrame1:AddMessage("暗影延伸等级:"..DW_SHADOWREACH_RANK,1,1,0);
				DW_ATTACK_NEEDSCAN[30*(1+DW_HOLYREACH_RANK*0.1)]=true;
				DW_ATTACK_NEEDSCAN[20*(1+DW_SHADOWREACH_RANK*0.1)]=true;
				DW_ATTACK_NEEDSCAN[30*(1+DW_SHADOWREACH_RANK*0.1)]=true;
				DW_ATTACK_NEEDSCAN[20]=true;
				DW_ATTACK_NEEDSCAN[30]=true;
				DW_ASSIST_NEEDSCAN[15]=true;
				DW_ASSIST_NEEDSCAN[30]=true;
				DW_ASSIST_NEEDSCAN[40]=true;
				DW_NEEDSCAN=true;
			end
		end
	end

	if(DW_NEEDSCAN) then
		local slotnum=1;
		while(slotnum<=120 and DistanceWarning_CheckScanNeed()) do
			DistanceWarning_SpellDetector(slotnum);
			slotnum=slotnum+1;
		end
		for j=5,41 do
			if(DW_ATTACK_NEEDSCAN[j]) then
				--ChatFrame1:AddMessage("未扫描到"..j.."码攻击技能--无法对敌对目标准确提示"..j.."码距离",1,0,0);
				DW_ATTACK_NEEDSCAN[j]=false;
			end
			if(DW_ASSIST_NEEDSCAN[j]) then
				--ChatFrame1:AddMessage("未扫描到"..j.."码援助技能--无法对友方目标准确提示"..j.."码距离",1,0,0);
				DW_ASSIST_NEEDSCAN[j]=false;
			end
		end
		DW_NEEDSCAN=false;
	end
	
	if(UnitExists("target")) then
		local MaxDis,MinDis=DistanceWarning_GetDistance();
		--DistanceWarning_SetCurrentBarPage(MaxDis);
		if(MaxDis~=DW_MAX_DISTANCE) then
			DW_MAX_DISTANCE=MaxDis;
			DistanceWarning_SetStatusBar(MaxDis,MinDis);
		end
		if(MinDis~=DW_MIN_DISTANCE) then
			DW_MIN_DISTANCE=MinDis;
			DistanceWarning_SetStatusBar(MaxDis,MinDis);
		end
	end
end

--返回对目标的距离
function DistanceWarning_GetDistance()
	local MaxDistance;
	local MinDistance;
	
	--以内定距离进行预判
	if(CheckInteractDistance("target",3)) then
		MaxDistance=10;
		MinDistance=0;
 
		if(MaxDistance-DW_RANGE_MODIFYER<=5) then 
			MaxDistance=MaxDistance-DW_MELEE_MODIFYER;
		else
			MaxDistance=MaxDistance-DW_RANGE_MODIFYER;
		end
	elseif(CheckInteractDistance("target",2)) then
		MaxDistance=11;
		MinDistance=10;
		if(MaxDistance-DW_RANGE_MODIFYER<=5) then
			MaxDistance=MaxDistance-DW_MELEE_MODIFYER;
		else
			MaxDistance=MaxDistance-DW_RANGE_MODIFYER;
		end
		if(MinDistance-DW_RANGE_MODIFYER<=5) then
			MinDistance=MinDistance-DW_MELEE_MODIFYER;
		else
			MinDistance=MinDistance-DW_RANGE_MODIFYER;
		end
	elseif(CheckInteractDistance("target",4)) then
		MaxDistance=30-DW_RANGE_MODIFYER;
		if(11-DW_RANGE_MODIFYER<=5) then
			MinDistance=11-DW_MELEE_MODIFYER;
		else
			MinDistance=11-DW_RANGE_MODIFYER;
		end
	else
		MaxDistance=200;
		MinDistance=30-DW_RANGE_MODIFYER;
		--表示大于30码内定距离
	end
	
	--对可攻击目标进行技能距离判定
	if(UnitCanAttack("player","target")) then
		if(DW_ATTACK_ACTION_SLOT[5]~=nil and IsActionInRange(DW_ATTACK_ACTION_SLOT[5])==1) then
			if(MaxDistance>5) then
				MaxDistance=5;
				MinDistance=0;
			end
		elseif(DW_ATTACK_ACTION_SLOT[8]~=nil and IsActionInRange(DW_ATTACK_ACTION_SLOT[8])==0 
		and MaxDistance<=30) then
			if(MaxDistance>8) then
				MaxDistance=8;
			end
			if(MinDistance<5 and DW_ATTACK_ACTION_SLOT[5]~=nil and IsActionInRange(DW_ATTACK_ACTION_SLOT[5])==0) then
				MinDistance=5;
			end
		else
			if(MinDistance<5 and DW_ATTACK_ACTION_SLOT[5]~=nil and IsActionInRange(DW_ATTACK_ACTION_SLOT[5])==0) then
				MinDistance=5;
			end
			if(MinDistance<8 and DW_ATTACK_ACTION_SLOT[8]~=nil and IsActionInRange(DW_ATTACK_ACTION_SLOT[8])==1) then
				MinDistance=8;
			end
			local i=9;
			while(i<=42 and IsActionInRange(DW_ATTACK_ACTION_SLOT[i])~=1) do 
				if(DW_ATTACK_ACTION_SLOT[i]~=nil and IsActionInRange(DW_ATTACK_ACTION_SLOT[i])==0 and MinDistance<i) then
					MinDistance=i;
				end
				i=i+1;
			end
			if(i<=41) then
				if(MaxDistance>i) then
					MaxDistance=i;
				end
			end
		end
	end
	
	--对可援助目标进行技能距离判定
	if(UnitCanAssist("player","target")) then
		local i=15;
		while(i<=42 and IsActionInRange(DW_ASSIST_ACTION_SLOT[i])~=1) do
			if(DW_ASSIST_ACTION_SLOT[i]~=nil and IsActionInRange(DW_ASSIST_ACTION_SLOT[i])==0 and MinDistance<i) then
				MinDistance=i;
			end
			i=i+1;
		end
		if(i<=41) then
			if(MaxDistance>i) then
				MaxDistance=i;
			end
		end
	end 
	--返回距离范围
	return MaxDistance,MinDistance
end

--探测动作栏上可用于提示距离的攻击技能
function DistanceWarning_SpellDetector(slot)
	local ico=nil;
	local lab=nil;
	local ActionName=nil;
	local yard;
	DWSpelltip:SetOwner(UIParent,"ANCHOR_NONE");
	DWSpelltip:SetAction(slot);
	ActionName=DWSpelltipTextLeft1:GetText();
	ico=GetActionTexture(slot);
	lab=GetActionText(slot);
	if(DW_PLAYER_CLASS=="猎人") then
		--如果lab值不为空则说明该动作是宏，不作为距离参考
		if(ico~=nil and lab==nil) then
			if(DW_ATTACK_ACTION_SLOT[5]==nil and (ActionName=="摔绊" or ActionName=="翅夹" 
			or ActionName=="猫鼬撕咬" or ActionName=="反击" or ActionName=="逃脱")) then
				DW_ATTACK_ACTION_SLOT[5]=slot;
				DW_ATTACK_NEEDSCAN[5]=false;
				yard=5; 
			end
			if(DW_ATTACK_ACTION_SLOT[8]==nil and (ActionName=="蝰蛇钉刺" or ActionName=="毒蛇钉刺" 
			or ActionName=="奥术射击" or ActionName=="震荡射击" or ActionName=="多重射击" 
			or ActionName=="瞄准射击" or ActionName=="毒蝎钉刺" or ActionName=="自动射击" 
			or ActionName=="翼龙钉刺" or ActionName=="宁神射击" or ActionName=="稳固射击" 
			or ActionName=="扰乱射击")) then
				DW_ATTACK_ACTION_SLOT[8]=slot;
				DW_ATTACK_NEEDSCAN[8]=false;
				yard=8; 
			end
			if(DW_ATTACK_ACTION_SLOT[15+DW_TOWNWATCH_RANK*2]==nil and (ActionName=="驱散射击")) then
				yard=15+DW_TOWNWATCH_RANK*2;
				DW_ATTACK_ACTION_SLOT[yard]=slot;
				DW_ATTACK_NEEDSCAN[yard]=false;
			end
			if(DW_ATTACK_ACTION_SLOT[35+DW_TOWNWATCH_RANK*2]==nil and (ActionName=="蝰蛇钉刺" 
			or ActionName=="毒蛇钉刺" or ActionName=="奥术射击" or ActionName=="震荡射击" 
			or ActionName=="多重射击" or ActionName=="瞄准射击" or ActionName=="毒蝎钉刺" 
			or ActionName=="自动射击" or ActionName=="翼龙钉刺" or ActionName=="宁神射击" 
			or ActionName=="稳固射击" or ActionName=="扰乱射击")) then
				yard=35+DW_TOWNWATCH_RANK*2;
				DW_ATTACK_ACTION_SLOT[yard]=slot;
				DW_ATTACK_NEEDSCAN[yard]=false;
			end 
		end 
	elseif(DW_PLAYER_CLASS=="盗贼") then
		if(ico~=nil and lab==nil) then
			if(DW_ATTACK_ACTION_SLOT[5]==nil and(ActionName=="割裂" or ActionName=="险恶攻击" 
			or ActionName=="背刺" or ActionName=="脚踢" or ActionName=="凿击" or ActionName=="刺骨" 
			or ActionName=="锁喉" or ActionName=="绞杀" or ActionName=="偷袭" or ActionName=="卸甲" 
			or ActionName=="破甲" or ActionName=="佯攻" or ActionName=="肾击" or ActionName=="伏击" 
			or ActionName=="出血" or ActionName=="放血" or ActionName=="毒刃" or ActionMame=="毒伤" 
			or ActionName=="影袭" or ActionName=="毁伤" or ActionName=="还击" or ActionName=="鬼魅攻击")) then 
				yard=5;
				DW_ATTACK_ACTION_SLOT[yard]=slot;
				DW_ATTACK_NEEDSCAN[yard]=false; 
			end 
			if(DW_ATTACK_ACTION_SLOT[5+DW_EVILSTRATAGEM_INCREASE_RANGE]==nil and ActionName=="闷棍") then 
				yard=5+DW_EVILSTRATAGEM_INCREASE_RANGE;
				DW_ATTACK_ACTION_SLOT[yard]=slot;
				DW_ATTACK_NEEDSCAN[yard]=false;
			end
			if(DW_ATTACK_ACTION_SLOT[8]==nil and (ActionName=="射击" or ActionName=="投掷" 
			or ActionName=="致命投掷")) then
				DW_ATTACK_ACTION_SLOT[8]=slot;
				DW_ATTACK_NEEDSCAN[8]=false;
				yard=8;
			end
			if(DW_ATTACK_ACTION_SLOT[10+DW_EVILSTRATAGEM_INCREASE_RANGE]==nil and (ActionName=="致盲")) then
				DW_ATTACK_ACTION_SLOT[10+DW_EVILSTRATAGEM_INCREASE_RANGE]=slot;
				DW_ATTACK_NEEDSCAN[10+DW_EVILSTRATAGEM_INCREASE_RANGE]=false;
				yard=10+DW_EVILSTRATAGEM_INCREASE_RANGE;
			end
			if(DW_ATTACK_ACTION_SLOT[20]==nil and ActionName=="暗影步") then
				DW_ATTACK_ACTION_SLOT[20]=slot;
				DW_ATTACK_NEEDSCAN[20]=false;
				yard=20;
			end
			if(DW_ATTACK_ACTION_SLOT[30]==nil and (ActionName=="射击" or ActionName=="投掷" 
			or ActionName=="致命投掷")) then
				DW_ATTACK_ACTION_SLOT[30]=slot;
				DW_ATTACK_NEEDSCAN[30]=false;
				yard=30;
			end
		end	
	elseif(DW_PLAYER_CLASS=="战士") then
		if(ico~=nil and lab==nil) then
			if(DW_ATTACK_ACTION_SLOT[5]==nil and (ActionName=="致死打击" or ActionName=="破甲攻击" 
			or ActionName=="断筋" or ActionName=="嘲讽" or ActionName=="压制" 
			or ActionName=="盾击" or ActionName=="复仇" or ActionName=="惩戒痛击"
			or ActionName=="缴械" or ActionName=="斩杀" or ActionName=="处决" 
			or ActionName=="盾牌猛击" or ActionName=="撕裂" or ActionName=="拳击" 
			or ActionName=="嗜血" or ActionName=="震荡猛击" or ActionName=="毁灭打击" 
			or ActionName=="顺劈斩" or ActionName=="破甲")) then
				DW_ATTACK_ACTION_SLOT[5]=slot;
				DW_ATTACK_NEEDSCAN[5]=false;
				yard=5;
			end
			if(DW_ATTACK_ACTION_SLOT[8]==nil and (ActionName=="射击" or ActionName=="投掷")) then
				DW_ATTACK_ACTION_SLOT[8]=slot;
				DW_ATTACK_NEEDSCAN[8]=false;
				yard=8;
			end
			if(DW_ATTACK_ACTION_SLOT[10]==nil and (ActionName=="胁迫吼叫" or ActionName=="破胆怒吼")) then
				DW_ATTACK_ACTION_SLOT[10]=slot;
				DW_ATTACK_NEEDSCAN[10]=false;
				yard=10;
			end
			if(DW_ATTACK_ACTION_SLOT[25]==nil and (ActionName=="冲锋" or ActionName=="拦截")) then
				DW_ATTACK_ACTION_SLOT[25]=slot;
				DW_ATTACK_NEEDSCAN[25]=false;
				yard=25;
			end
			if(DW_ATTACK_ACTION_SLOT[30]==nil and (ActionName=="射击" or ActionName=="投掷")) then
				DW_ATTACK_ACTION_SLOT[30]=slot;
				DW_ATTACK_NEEDSCAN[30]=false;
				yard=30;
			end
			if(DW_ASSIST_ACTION_SLOT[8]==nil and ActionName=="援护") then
				DW_ASSIST_ACTION_SLOT[8]=slot;
				DW_ASSIST_NEEDSCAN[8]=false;
				yard=8;
			end
			if(DW_ASSIST_ACTION_SLOT[25]==nil and ActionName=="援护") then
				DW_ASSIST_ACTION_SLOT[25]=slot;
				DW_ASSIST_NEEDSCAN[25]=false;
				yard=25;
			end  
		end 
	elseif(DW_PLAYER_CLASS=="法师") then
		if(ico~=nil and lab==nil) then
			if(DW_ATTACK_ACTION_SLOT[20+DW_FRAMETHROWING_RANK*3]==nil and ActionName=="火焰冲击") then
				yard=20+DW_FRAMETHROWING_RANK*3;
				DW_ATTACK_ACTION_SLOT[yard]=slot; 
				DW_ATTACK_NEEDSCAN[yard]=false;
			end 
			if(DW_ATTACK_ACTION_SLOT[30+DW_FRAMETHROWING_RANK*3]==nil and ActionName=="灼烧") then
				yard=30+DW_FRAMETHROWING_RANK*3;
				DW_ATTACK_ACTION_SLOT[yard]=slot;
				DW_ATTACK_NEEDSCAN[yard]=false;
			end 
			if(DW_ATTACK_ACTION_SLOT[35+DW_FRAMETHROWING_RANK*3]==nil and (ActionName=="炎爆术" 
			or ActionName=="火球术")) then
				yard=35+DW_FRAMETHROWING_RANK*3;
				DW_ATTACK_ACTION_SLOT[yard]=slot;
				DW_ATTACK_NEEDSCAN[yard]=false;
			end
			if(DW_ATTACK_ACTION_SLOT[30*(1+DW_ARCTICREACH_RANK*0.1)]==nil and (ActionName=="寒冰箭" 
			or ActionName=="冰枪术")) then
				yard=30*(1+DW_ARCTICREACH_RANK*0.1);
				DW_ATTACK_ACTION_SLOT[yard]=slot;
				DW_ATTACK_NEEDSCAN[yard]=false;
			end
			if(DW_ATTACK_ACTION_SLOT[30]==nil and (ActionName=="法术反制" or ActionName=="法术偷取" 
			or ActionName=="奥术冲击" or ActionName=="减速")) then
				yard=30;
				DW_ATTACK_ACTION_SLOT[yard]=slot;
				DW_ATTACK_NEEDSCAN[yard]=false;
			end
			if(DW_ATTACK_ACTION_SLOT[40]==nil and ActionName=="侦测魔法") then
				yard=40;
				DW_ATTACK_ACTION_SLOT[yard]=slot;
				DW_ATTACK_NEEDSCAN[yard]=false; 
			end
			if(DW_ASSIST_ACTION_SLOT[30]==nil and (ActionName=="奥术智慧" 
			or ActionName=="解除次级诅咒" or ActionName=="解除诅咒")) then
				yard=30;
				DW_ASSIST_ACTION_SLOT[yard]=slot;
				DW_ASSIST_NEEDSCAN[yard]=false;
			end
		end
	elseif(DW_PLAYER_CLASS=="萨满祭司") then
		if(ico~=nil and lab==nil) then
			if(DW_ATTACK_ACTION_SLOT[30+DW_STORMREACH_RANK*3]==nil and (ActionName=="闪电链" 
			or ActionName=="闪电箭")) then
				yard=30+DW_STORMREACH_RANK*3;
				DW_ATTACK_ACTION_SLOT[yard]=slot;
				DW_ATTACK_NEEDSCAN[yard]=false; 
			end
			if(DW_ATTACK_ACTION_SLOT[20]==nil and (ActionName=="地震术" or ActionName=="烈焰震击" 
			or ActionName=="冰霜震击")) then
				yard=20;
				DW_ATTACK_ACTION_SLOT[yard]=slot;
				DW_ATTACK_NEEDSCAN[yard]=false;
			end
			if(DW_ATTACK_ACTION_SLOT[30]==nil and ActionName=="净化术") then 
				yard=30;
				DW_ATTACK_ACTION_SLOT[yard]=slot;
				DW_ATTACK_NEEDSCAN[yard]=false;
			end
			if(DW_ASSIST_ACTION_SLOT[30]==nil and (ActionName=="消毒术" or ActionName=="祛病术" 
			or ActionName=="水下呼吸" or ActionName=="水上行走" or ActionName=="先祖之魂")) then
				yard=30;
				DW_ASSIST_ACTION_SLOT[yard]=slot;
				DW_ASSIST_NEEDSCAN[yard]=false;
			end
			if(DW_ASSIST_ACTION_SLOT[40]==nil and (ActionName=="治疗波" or ActionName=="次级治疗波" 
			or ActionName=="治疗链" or ActionName=="大地之盾")) then
				yard=40;
				DW_ASSIST_ACTION_SLOT[yard]=slot;
				DW_ASSIST_NEEDSCAN[yard]=false;
			end
		end 
	elseif(DW_PLAYER_CLASS=="德鲁伊") then
		if(ico~=nil and lab==nil) then  
			if(DW_ATTACK_ACTION_SLOT[5]==nil and (ActionName=="捶击" or ActionName=="挥击" 
			or ActionName=="低吼" or ActionName=="重击" or ActionName=="扫击" or ActionName=="爪击" 
			or ActionName=="撕碎" or ActionName=="毁灭" or ActionName=="突袭" or ActionName=="撕扯" 
			or ActionName=="凶猛撕咬" or ActionName=="畏缩" or ActionName=="割伤" or ActionName=="斜掠" 
			or ActionName=="横扫" or ActionName=="割裂"))then
				yard=5;
				DW_ATTACK_ACTION_SLOT[yard]=slot;
				DW_ATTACK_NEEDSCAN[yard]=false; 
			end
			if(DW_ATTACK_ACTION_SLOT[8]==nil and (ActionName=="投掷" or ActionName=="野性冲锋"))then
				yard=8;
				DW_ATTACK_ACTION_SLOT[yard]=slot;
				DW_ATTACK_NEEDSCAN[yard]=false; 
			end
			if(DW_ATTACK_ACTION_SLOT[25]==nil and ActionName=="野性冲锋") then
				yard=25;
				DW_ATTACK_ACTION_SLOT[yard]=slot;
				DW_ATTACK_NEEDSCAN[yard]=false;
			end
			if(DW_ATTACK_ACTION_SLOT[30*(1+DW_NATUREREACH_RANK*0.1)]==nil and (ActionName=="愤怒" 
			or ActionName=="月火术" or ActionName=="星火术" or ActionName=="纠缠根须" 
			or ActionName=="精灵之火" or ActionName=="虫群" or ActionName=="飓风术")) then
				yard=30*(1+DW_NATUREREACH_RANK*0.1); 
				DW_ATTACK_ACTION_SLOT[yard]=slot;
				DW_ATTACK_NEEDSCAN[yard]=false;
			end
			if(DW_ASSIST_ACTION_SLOT[30]==nil and (ActionName=="野性印记" or ActionName=="废毒术" 
			or ActionName=="驱毒术" or ActionName=="解除诅咒" or ActionName=="消毒术")) then
				yard=30;
				DW_ASSIST_ACTION_SLOT[yard]=slot;
				DW_ASSIST_NEEDSCAN[yard]=false;
			end
			if(DW_ASSIST_ACTION_SLOT[30*(1+DW_NATUREREACH_RANK*0.1)]==nil and (ActionName=="荆棘术" 
			or ActionName=="激活")) then
				yard=30*(1+DW_NATUREREACH_RANK*0.1);
				DW_ASSIST_ACTION_SLOT[yard]=slot;
				DW_ASSIST_NEEDSCAN[yard]=false;
			end
			if(DW_ASSIST_ACTION_SLOT[40]==nil and (ActionName=="愈合" or ActionName=="治疗之触" 
			or ActionName=="回春术")) then
				yard=40;
				DW_ASSIST_ACTION_SLOT[yard]=slot;
				DW_ASSIST_NEEDSCAN[yard]=false; 
			end
		end
	elseif(DW_PLAYER_CLASS=="圣骑士") then
		if(ico~=nil and lab==nil) then
			if(DW_ATTACK_ACTION_SLOT[10]==nil and (ActionName=="制裁之锤" or ActionName=="审判")) then
				yard=10;
				DW_ATTACK_ACTION_SLOT[yard]=slot;
				DW_ATTACK_NEEDSCAN[yard]=false;
			end
			if(DW_ATTACK_ACTION_SLOT[20]==nil and ActionName=="神圣震击") then
				yard=20;
				DW_ATTACK_ACTION_SLOT[yard]=slot;
				DW_ATTACK_NEEDSCAN[yard]=false;
			end
			if(DW_ATTACK_ACTION_SLOT[30]==nil and (ActionName=="愤怒之锤" or ActionName=="复仇者之盾")) then
				yard=30;
				DW_ATTACK_ACTION_SLOT[yard]=slot;
				DW_ATTACK_NEEDSCAN[yard]=false;
			end
			if(DW_ASSIST_ACTION_SLOT[20]==nil and ActionName=="神圣震击") then
				yard=20;
				DW_ASSIST_ACTION_SLOT[yard]=slot;
				DW_ASSIST_NEEDSCAN[yard]=false;
			end
			if(DW_ASSIST_ACTION_SLOT[30]==nil and (ActionName=="清洁术" or ActionName=="纯净术" 
			or ActionName=="力量祝福" or ActionName=="智慧祝福" or ActionName=="庇护祝福" 
			or ActionName=="自由祝福" or ActionName=="光明祝福" or ActionName=="王者祝福")) then
				yard=30;
				DW_ASSIST_ACTION_SLOT[yard]=slot;
				DW_ASSIST_NEEDSCAN[yard]=false;
			end
			if(DW_ASSIST_ACTION_SLOT[40]==nil and (ActionName=="圣光术" or ActionName=="圣疗术" 
			or ActionName=="圣光闪现" or ActionName=="强效力量祝福" or ActionName=="强效智慧祝福" 
			or ActionName=="强效庇护祝福" or ActionName=="强效光明祝福" or ActionName=="强效王者祝福" 
			or ActionName=="正义防御")) then
				yard=40;
				DW_ASSIST_ACTION_SLOT[yard]=slot;
				DW_ASSIST_NEEDSCAN[yard]=false;
			end
		end
	elseif(DW_PLAYER_CLASS=="术士") then
		if(ico~=nil and lab==nil) then 
			if(DW_ATTACK_ACTION_SLOT[20*(1+DW_GRIMREACH_RANK*0.1)]==nil and ActionName=="恐惧") then
				yard=20*(1+DW_GRIMREACH_RANK*0.1);
				DW_ATTACK_ACTION_SLOT[yard]=slot;
				DW_ATTACK_NEEDSCAN[yard]=false; 
			end
			if(DW_ATTACK_ACTION_SLOT[30*(1+DW_GRIMREACH_RANK*0.1)]==nil and (ActionName=="虚弱诅咒" 
			or ActionName=="腐蚀术" or ActionName=="痛苦诅咒" or ActionName=="吸取灵魂" 
			or ActionName=="鲁莽诅咒" or ActionName=="舌之诅咒" or ActionName=="生命虹吸" 
			or ActionName=="元素诅咒" or ActionName=="死亡缠绕" or ActionName=="阴影诅咒" 
			or ActionName=="吸取生命" or ActionName=="吸取法力" or ActionName=="腐蚀之种" 
			or ActionName=="痛苦无常")) then
				yard=30*(1+DW_GRIMREACH_RANK*0.1);
				DW_ATTACK_ACTION_SLOT[yard]=slot;
				DW_ATTACK_NEEDSCAN[yard]=false; 
			end
			if(DW_ATTACK_ACTION_SLOT[20*(1+DW_DESTRUCTIVEREACH_RANK*0.1)]==nil and (ActionName=="暗影燃烧" 
			or ActionName=="暗影灼烧")) then
				yard=20*(1+DW_DESTRUCTIVEREACH_RANK*0.1);
				DW_ATTACK_ACTION_SLOT[yard]=slot;
				DW_ATTACK_NEEDSCAN[yard]=false; 
			end
			if(DW_ATTACK_ACTION_SLOT[30*(1+DW_DESTRUCTIVEREACH_RANK*0.1)]==nil and (ActionName=="暗影箭" 
			or ActionName=="献祭" or ActionName=="灼热之痛" or ActionName=="灵魂之火" or ActionName=="燃烧" 
			or ActionName=="烧尽")) then
				yard=30*(1+DW_DESTRUCTIVEREACH_RANK*0.1); 
				DW_ATTACK_ACTION_SLOT[yard]=slot;
				DW_ATTACK_NEEDSCAN[yard]=false; 
			end
			if(DW_ASSIST_ACTION_SLOT[30]==nil and (ActionName=="无尽呼吸" or ActionName=="侦测次极隐形" 
			or ActionName=="侦测隐形" or ActionName=="侦测高级隐形")) then
				yard=30;
				DW_ASSIST_ACTION_SLOT[yard]=slot;
				DW_ASSIST_NEEDSCAN[yard]=false; 
			end 
		end
	elseif(DW_PLAYER_CLASS=="牧师") then
		if(ico~=nil and lab==nil) then
			if(DW_ATTACK_ACTION_SLOT[30*(1+DW_HOLYREACH_RANK*0.1)]==nil and (ActionName=="神圣之火" 
			or ActionName=="惩击")) then
				yard=30*(1+DW_HOLYREACH_RANK*0.1);
				DW_ATTACK_ACTION_SLOT[yard]=slot;
				DW_ATTACK_NEEDSCAN[yard]=false; 
			end
			if(DW_ATTACK_ACTION_SLOT[20*(1+DW_SHADOWREACH_RANK*0.1)]==nil and ActionName=="精神鞭笞") then
				yard=20*(1+DW_SHADOWREACH_RANK*0.1);
				DW_ATTACK_ACTION_SLOT[yard]=slot;
				DW_ATTACK_NEEDSCAN[yard]=false; 
			end
			if(DW_ATTACK_ACTION_SLOT[30*(1+DW_SHADOWREACH_RANK*0.1)]==nil and (ActionName=="暗言术：痛" 
			or ActionName=="心灵震爆" or ActionName=="噬灵瘟疫" or ActionName=="暗言术：灭" 
			or ActionName=="吸血鬼之触")) then
				yard=30*(1+DW_SHADOWREACH_RANK*0.1);
				DW_ATTACK_ACTION_SLOT[yard]=slot;
				DW_ATTACK_NEEDSCAN[yard]=false;
			end
			if(DW_ATTACK_ACTION_SLOT[20]==nil and ActionName=="沉默") then
				yard=20;
				DW_ATTACK_ACTION_SLOT[yard]=slot;
				DW_ATTACK_NEEDSCAN[yard]=false; 
			end
			if(DW_ATTACK_ACTION_SLOT[30]==nil and (ActionName=="驱散魔法" or ActionName=="法力燃烧")) then
				yard=30;
				DW_ATTACK_ACTION_SLOT[yard]=slot;
				DW_ATTACK_NEEDSCAN[yard]=false; 
			end
			if(DW_ASSIST_ACTION_SLOT[30]==nil and (ActionName=="真言术：韧" or ActionName=="神圣精神" 
			or ActionName=="驱散魔法" or ActionName=="祛病术" or ActionName=="驱除疾病" 
			or ActionName=="神圣之灵" or ActionName=="暗影防护" or ActionName=="防护恐惧结界")) then
				yard=30;
				DW_ASSIST_ACTION_SLOT[yard]=slot;
				DW_ASSIST_NEEDSCAN[yard]=false;  
			end
			if(DW_ASSIST_ACTION_SLOT[40]==nil and (ActionName=="治疗术" or ActionName=="次级治疗术" 
			or ActionName=="快速治疗" or ActionName=="强效治疗术" or ActionName=="恢复" 
			or ActionName=="治疗之环" or ActionName=="联结治疗")) then
				yard=40;
				DW_ASSIST_ACTION_SLOT[yard]=slot;
				DW_ASSIST_NEEDSCAN[yard]=false; 
			end 
		end
	end
	--如果lab值不为空则说明该动作是宏，不作为距离参考
	if(ico~=nil and lab==nil) then
		if(DW_ATTACK_ACTION_SLOT[30]==nil and (ActionName=="地精火箭头盔" or ActionName=="侏儒撒网器" 
		or ActionName=="侏儒缩小射线" or ActionName=="射击" or ActionName=="投掷" or ActionName=="雪球" 
		or ActionName=="大雪球")) then
			yard=30;
			DW_ATTACK_ACTION_SLOT[yard]=slot;
			DW_ATTACK_NEEDSCAN[yard]=false;
		end 
		if(DW_ASSIST_ACTION_SLOT[15]==nil and (ActionName=="亚麻绷带" or ActionName=="厚亚麻绷带" 
		or ActionName=="绒线绷带" or ActionName=="厚绒线绷带" or ActionName=="丝质绷带" 
		or ActionName=="厚丝质绷带" or ActionName=="魔纹绷带" or ActionName=="厚魔纹绷带" 
		or ActionName=="厚魔纹绷带" or ActionName=="符文布绷带" or ActionName=="厚符文布绷带" 
		or ActionName=="灵纹布绷带" or ActionName=="厚灵纹布绷带" or ActionName=="晶纹绷带")) then
			yard=15;
			DW_ASSIST_ACTION_SLOT[yard]=slot;
			DW_ASSIST_NEEDSCAN[yard]=false;
		end 
		if(DW_ASSIST_ACTION_SLOT[30]==nil and ActionName=="雪球") then
			yard=30;
			DW_ASSIST_ACTION_SLOT[yard]=slot;
			DW_ASSIST_NEEDSCAN[yard]=false;
		end
	end
end

--检测是否需要扫描
function DistanceWarning_CheckScanNeed()
	local needscan 
	if(DW_PLAYER_CLASS=="猎人") then
		needscan=(DW_ATTACK_NEEDSCAN[5] or DW_ATTACK_NEEDSCAN[8] 
		or DW_ATTACK_NEEDSCAN[15+DW_TOWNWATCH_RANK*2] or DW_ATTACK_NEEDSCAN[30] 
		or DW_ATTACK_NEEDSCAN[35+DW_TOWNWATCH_RANK*2] or DW_ASSIST_NEEDSCAN[15] 
		or DW_ASSIST_NEEDSCAN[30]);
	elseif(DW_PLAYER_CLASS=="战士") then
		needscan=(DW_ATTACK_NEEDSCAN[5] or DW_ATTACK_NEEDSCAN[8] or DW_ATTACK_NEEDSCAN[10] 
		or DW_ATTACK_NEEDSCAN[25] or DW_ATTACK_NEEDSCAN[300] or DW_ASSIST_NEEDSCAN[15] 
		or DW_ASSIST_NEEDSCAN[30] or DW_ASSIST_NEEDSCAN[8] or DW_ASSIST_NEEDSCAN[25]);
	elseif(DW_PLAYER_CLASS=="盗贼") then
		needscan=(DW_ATTACK_NEEDSCAN[5] or DW_ATTACK_NEEDSCAN[5+DW_EVILSTRATAGEM_INCREASE_RANGE] 
		or DW_ATTACK_NEEDSCAN[8] or DW_ATTACK_NEEDSCAN[10+DW_EVILSTRATAGEM_INCREASE_RANGE] 
		or DW_ATTACK_NEEDSCAN[20] or DW_ATTACK_NEEDSCAN[30] or DW_ASSIST_NEEDSCAN[15] or DW_ASSIST_NEEDSCAN[30]);
	elseif(DW_PLAYER_CLASS=="法师") then
		needscan=(DW_ATTACK_NEEDSCAN[20+DW_FRAMETHROWING_RANK*3] 
		or DW_ATTACK_NEEDSCAN[30+DW_FRAMETHROWING_RANK*3] 
		or DW_ATTACK_NEEDSCAN[35+DW_FRAMETHROWING_RANK*3] 
		or DW_ATTACK_NEEDSCAN[30*(1+DW_ARCTICREACH_RANK*0.1)] or DW_ATTACK_NEEDSCAN[30] 
		or DW_ATTACK_NEEDSCAN[40] or DW_ASSIST_NEEDSCAN[30] or DW_ASSIST_NEEDSCAN[15]);
	elseif(DW_PLAYER_CLASS=="萨满祭司") then
		needscan=(DW_ATTACK_NEEDSCAN[20] or DW_ATTACK_NEEDSCAN[30] or DW_ASSIST_NEEDSCAN[40] 
		or DW_ASSIST_NEEDSCAN[30] or DW_ASSIST_NEEDSCAN[15] 
		or DW_ATTACK_NEEDSCAN[30+DW_STORMREACH_RANK*3]);
	elseif(DW_PLAYER_CLASS=="德鲁伊") then
		needscan=(DW_ATTACK_NEEDSCAN[5] or DW_ATTACK_NEEDSCAN[8] or DW_ATTACK_NEEDSCAN[25] 
		or DW_ATTACK_NEEDSCAN[30] or DW_ATTACK_NEEDSCAN[30*(1+DW_NATUREREACH_RANK*0.1)] 
		or DW_ASSIST_NEEDSCAN[15] or DW_ASSIST_NEEDSCAN[30] or DW_ASSIST_NEEDSCAN[30*(1+DW_NATUREREACH_RANK*0.1)] 
		or DW_ASSIST_NEEDSCAN[40]);
	elseif(DW_PLAYER_CLASS=="圣骑士") then
		needscan=(DW_ATTACK_NEEDSCAN[10] or DW_ATTACK_NEEDSCAN[20] or DW_ATTACK_NEEDSCAN[30] 
		or DW_ASSIST_NEEDSCAN[15] or DW_ASSIST_NEEDSCAN[20] or DW_ASSIST_NEEDSCAN[30] 
		or DW_ASSIST_NEEDSCAN[40]);
	elseif(DW_PLAYER_CLASS=="术士") then
		needscan=(DW_ATTACK_NEEDSCAN[200*(1+DW_GRIMREACH_RANK*0.1)] 
		or DW_ATTACK_NEEDSCAN[30*(1+DW_GRIMREACH_RANK*0.1)] 
		or DW_ATTACK_NEEDSCAN[20*(1+DW_DESTRUCTIVEREACH_RANK*0.1)] 
		or DW_ATTACK_NEEDSCAN[30*(1+DW_DESTRUCTIVEREACH_RANK*0.1)] or DW_ATTACK_NEEDSCAN[30] 
		or DW_ASSIST_NEEDSCAN[30] or DW_ASSIST_NEEDSCAN[15]);
	elseif(DW_PLAYER_CLASS=="牧师") then
		needscan=(DW_ATTACK_NEEDSCAN[30*(1+DW_HOLYREACH_RANK*0.1)] 
		or DW_ATTACK_NEEDSCAN[20*(1+DW_SHADOWREACH_RANK*0.1)] 
		or DW_ATTACK_NEEDSCAN[30*(1+DW_SHADOWREACH_RANK*0.1)] or DW_ATTACK_NEEDSCAN[30] 
		or DW_ASSIST_NEEDSCAN[15] or DW_ASSIST_NEEDSCAN[30] or DW_ASSIST_NEEDSCAN[40]);
	end
	return needscan;
end

--根据不同职业设置进度条
function DistanceWarning_SetStatusBar(maxdis,mindis)
	local text;
	if(DW_PLAYER_CLASS=="猎人") then
		if(maxdis<=5) then
			DistanceWarningFrameStatusBar:SetStatusBarColor(1,1,0);
		elseif(maxdis<=8) then
			DistanceWarningFrameStatusBar:SetStatusBarColor(1,0,0);
		elseif(maxdis<=15+DW_TOWNWATCH_RANK*2) then
			DistanceWarningFrameStatusBar:SetStatusBarColor(1,1,0);
		elseif(maxdis<=30) then
			DistanceWarningFrameStatusBar:SetStatusBarColor(1,0.5,0);
		elseif(maxdis<=35+DW_TOWNWATCH_RANK*2) then
			DistanceWarningFrameStatusBar:SetStatusBarColor(0,1,0);
		else
			DistanceWarningFrameStatusBar:SetStatusBarColor(0,0,1);
		end
	elseif(DW_PLAYER_CLASS=="战士") then
		if(maxdis<=5) then
			DistanceWarningFrameStatusBar:SetStatusBarColor(0,1,0);
		elseif(maxdis<=8) then
			DistanceWarningFrameStatusBar:SetStatusBarColor(1,0,0);
		elseif(maxdis<=25) then
			DistanceWarningFrameStatusBar:SetStatusBarColor(1,1,0);
		elseif(maxdis<=41) then
			DistanceWarningFrameStatusBar:SetStatusBarColor(1,0,0);
		else
			DistanceWarningFrameStatusBar:SetStatusBarColor(1,0,0);
		end
	elseif(DW_PLAYER_CLASS=="盗贼") then
		if(maxdis<=8) then
			DistanceWarningFrameStatusBar:SetStatusBarColor(0,1,0);
		elseif(maxdis<=20) then
			DistanceWarningFrameStatusBar:SetStatusBarColor(1,1,0); 
		elseif(maxdis<=41) then
			DistanceWarningFrameStatusBar:SetStatusBarColor(1,0,0);
		else
			DistanceWarningFrameStatusBar:SetStatusBarColor(1,0,0);
		end
	elseif(DW_PLAYER_CLASS=="法师") then
		if(maxdis<=6) then
			DistanceWarningFrameStatusBar:SetStatusBarColor(1,0,0);
		elseif(maxdis<=10) then
			DistanceWarningFrameStatusBar:SetStatusBarColor(1,0.5,0);
		elseif(maxdis<=26) then
			DistanceWarningFrameStatusBar:SetStatusBarColor(1,1,0);
		elseif(maxdis<=30) then
			DistanceWarningFrameStatusBar:SetStatusBarColor(0,1,0);
		elseif(maxdis<=41) then
			DistanceWarningFrameStatusBar:SetStatusBarColor(1,1,0);
		else
			DistanceWarningFrameStatusBar:SetStatusBarColor(0,0,1);
		end
	elseif(DW_PLAYER_CLASS=="萨满祭司") then
		if(maxdis<=5.55) then
			DistanceWarningFrameStatusBar:SetStatusBarColor(1,1,0);
		elseif(maxdis<=20) then
			DistanceWarningFrameStatusBar:SetStatusBarColor(0,1,0);
		elseif(maxdis<=30) then
			DistanceWarningFrameStatusBar:SetStatusBarColor(1,1,0);
		elseif(maxdis<=41) then
			DistanceWarningFrameStatusBar:SetStatusBarColor(1,1,0);
		else
			DistanceWarningFrameStatusBar:SetStatusBarColor(1,0,0);
		end
	elseif(DW_PLAYER_CLASS=="德鲁伊") then
		if(maxdis<=10) then
			DistanceWarningFrameStatusBar:SetStatusBarColor(1,0,0);
		elseif(maxdis<=30) then
			DistanceWarningFrameStatusBar:SetStatusBarColor(1,1,0);
		elseif(maxdis<=41) then
			DistanceWarningFrameStatusBar:SetStatusBarColor(0,1,0);
		else
			DistanceWarningFrameStatusBar:SetStatusBarColor(0,0,1);
		end
	elseif(DW_PLAYER_CLASS=="圣骑士") then
		if(maxdis<=10) then
			DistanceWarningFrameStatusBar:SetStatusBarColor(0,1,0);
		elseif(maxdis<=30) then
			DistanceWarningFrameStatusBar:SetStatusBarColor(1,1,0);
		elseif(maxdis<=41) then
			DistanceWarningFrameStatusBar:SetStatusBarColor(1,0,0);
		else
			DistanceWarningFrameStatusBar:SetStatusBarColor(1,0,0);
		end
	elseif(DW_PLAYER_CLASS=="术士") then
		if(maxdis<=10) then
			DistanceWarningFrameStatusBar:SetStatusBarColor(1,0,0);
		elseif(maxdis<=24) then
			DistanceWarningFrameStatusBar:SetStatusBarColor(0,1,0);
		elseif(maxdis<=41) then
			DistanceWarningFrameStatusBar:SetStatusBarColor(1,1,0);
		else
			DistanceWarningFrameStatusBar:SetStatusBarColor(0,0,1);
		end
	elseif(DW_PLAYER_CLASS=="牧师") then
		if(maxdis<=10) then
			DistanceWarningFrameStatusBar:SetStatusBarColor(1,0,0);
		elseif(maxdis<=24) then
			DistanceWarningFrameStatusBar:SetStatusBarColor(0,1,0);
		elseif(maxdis<=41) then
			DistanceWarningFrameStatusBar:SetStatusBarColor(1,1,0);
		else
			DistanceWarningFrameStatusBar:SetStatusBarColor(0,0,1);
		end
	end
	if(maxdis<=41) then
		if(mindis<maxdis) then 
			if(DW_SHOWMOD==1) then
				text=mindis.."-"..maxdis.."码"; 
			elseif(DW_SHOWMOD==2) then
				text="<"..maxdis.."码";
			end
		else
			text=">"..""..maxdis.."码";
		end
	else
		text=">"..mindis.."码";
	end
	DistanceWarningFrameStatusBar:SetValue(maxdis);
	DistanceWarningText:SetText(text);
end

--切换当前动作栏
--function DistanceWarning_SetCurrentBarPage(dis)
--	if(UnitCanAttack("player","target")) then
--		if(dis<=8) then
--			if(DW_MELEE_ATTACK_BAR>=1 and DW_MELEE_ATTACK_BAR<=10 
--			and GetActionBarPage()~=DW_MELEE_ATTACK_BAR) then
--				ChatFrame1:AddMessage("haha1",1,1,0);
--				ChangeActionBarPage(DW_MELEE_ATTACK_BAR); 
--			end
--		else
--			if(DW_RANGE_ATTACK_BAR>=1 and DW_RANGE_ATTACK_BAR<=10 
--			and GetActionBarPage()~=DW_RANGE_ATTACK_BAR) then
--				ChatFrame1:AddMessage("haha2",1,1,0);
--				ChangeActionBarPage(DW_RANGE_ATTACK_BAR); 
--			end
--		end
--		if(DW_ASSIST_BAR>=1 and DW_ASSIST_BAR<=10 and GetActionBarPage()~=DW_ASSIST_BAR) then
--			ChangeActionBarPage(DW_ASSIST_BAR); 
--		end
--	end
--end