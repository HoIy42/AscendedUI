local E, L, V, P, G = unpack(ElvUI)
local AddonName, NS = ...
local ACR = LibStub("AceConfigRegistry-3.0")
local ACD = LibStub("AceConfigDialog-3.0")

-- Initialize database
NS.db = LibStub("AceDB-3.0"):New("AscendedUI", {
    profile = {
        addons = {
            ['*'] = true, -- Default all addons to enabled
            -- Add specific addon overrides here if needed
        },
        -- Add other settings here
    },
})

-- Options table
function NS:GetOptions()
    local options = {
        name = AddonName,
        type = "group",
        childGroups = "tab",
        args = {
            header = {
                order = 1,
                type = "header",
                name = "My Addon Installer Settings",
            },
            general = {
                order = 2,
                type = "group",
                name = "General",
                args = {
                    description = {
                        order = 1,
                        type = "description",
                        name = "Configure your addon installation preferences",
                    },
                    selectAll = {
                        order = 2,
                        type = "execute",
                        name = "Select All",
                        func = function()
                            for addon in pairs(NS.db.profile.addons) do
                                NS.db.profile.addons[addon] = true
                            end
                            ACR:NotifyChange(AddonName)
                        end,
                    },
                    deselectAll = {
                        order = 3,
                        type = "execute",
                        name = "Deselect All",
                        func = function()
                            for addon in pairs(NS.db.profile.addons) do
                                NS.db.profile.addons[addon] = false
                            end
                            ACR:NotifyChange(AddonName)
                        end,
                    },
                },
            },
            addons = {
                order = 3,
                type = "group",
                name = "Addons",
                childGroups = "tree",
                args = {
                    -- This will be populated dynamically with your addons
                },
            },
        },
    }

    -- Add your addons dynamically
    for addonName, _ in pairs(NS.db.profile.addons) do
        options.args.addons.args[addonName] = {
            order = 1,
            type = "toggle",
            name = addonName,
            get = function() return NS.db.profile.addons[addonName] end,
            set = function(_, value) NS.db.profile.addons[addonName] = value end,
        }
    end

    return options
end

-- Register with ElvUI
E.Options.args.yourAddonName = {
    type = "group",
    name = "My Addon Installer",
    childGroups = "tab",
    args = NS:GetOptions().args
}

-- Register with Blizzard Addon Menu
local blizzardOptions = {
    name = "My Addon Installer",
    handler = NS,
    type = "group",
    args = NS:GetOptions().args
}

LibStub("AceConfig-3.0"):RegisterOptionsTable(AddonName, NS:GetOptions())
LibStub("AceConfigDialog-3.0"):AddToBlizOptions(AddonName, "My Addon Installer")