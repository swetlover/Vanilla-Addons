local _G = getfenv();
local MasterLute = _G.MasterLute;

local LocaleTable = {};

function LocaleTable:new(defaultLocale)
    local localeTable = {
        DEFAULT = defaultLocale,
    };

    setmetatable(localeTable, {
        __index = function (self, key)
            return self.DEFAULT;
        end,
    });

    return localeTable;
end

MasterLute.LocaleTable = LocaleTable;