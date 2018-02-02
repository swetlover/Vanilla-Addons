local _G = getfenv();
local MasterLute = _G.MasterLute;

local Locale = {};

function Locale:new()
    local locale = {
        Strings = {},
    };

    setmetatable(locale.Strings, {
        __index = function (self, str)
            return str;
        end,
    });

    return locale;
end

MasterLute.Locale = Locale;