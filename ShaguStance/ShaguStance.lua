local function strsplit(delimiter, subject)
  local delimiter, fields = delimiter or ":", {}
  local pattern = string.format("([^%s]+)", delimiter)
  string.gsub(subject, pattern, function(c) fields[table.getn(fields)+1] = c end)
  return unpack(fields)
end

ShaguStanceDance = CreateFrame("Frame")
ShaguStanceDance:RegisterEvent("UI_ERROR_MESSAGE")
ShaguStanceDance:SetScript("OnEvent", function()
  ShaguStanceDance.lastError = arg1
end)

ShaguStanceDance.lastError = ""
ShaguStanceDance.scanString = string.gsub(SPELL_FAILED_ONLY_SHAPESHIFT, "%%s", "(.+)")
ShaguStanceDance.CastSpell = CastSpell
ShaguStanceDance.CastSpellByName = CastSpellByName
ShaguStanceDance.UseAction = UseAction

function ShaguStanceDance:SwitchStance()
  for stance in string.gfind(ShaguStanceDance.lastError, ShaguStanceDance.scanString) do
    for _, stance in pairs({ strsplit(",", stance)}) do
      ShaguStanceDance.CastSpellByName(string.gsub(stance,"^%s*(.-)%s*$", "%1"))
    end
  end
  ShaguStanceDance.lastError = ""
end

function CastSpell(spellId, spellbookTabNum)
  ShaguStanceDance:SwitchStance()
  ShaguStanceDance.CastSpell(spellId, spellbookTabNum)
end

function CastSpellByName(spellName, onSelf)
  ShaguStanceDance:SwitchStance()
  ShaguStanceDance.CastSpellByName(spellName, onSelf)
end

function UseAction(slot, checkCursor, onSelf)
  ShaguStanceDance:SwitchStance()
  ShaguStanceDance.UseAction(slot, checkCursor, onSelf)
end
