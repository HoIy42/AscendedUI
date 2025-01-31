local addonName, addon = ...
addon = LibStub("AceAddon-3.0"):NewAddon(addon, addonName, "AceEvent-3.0")

function addon:OnInitialize()
   -- Saved variables
    if not QuestTrackerDB then
        QuestTrackerDB = {
            trackerHidden = false
        }
    end
    
    -- The slash command
    SLASH_QUESTTRACKERTOGGLE1 = "/quests"
    SlashCmdList["QUESTTRACKERTOGGLE"] = function()
        addon:ToggleQuestTracker()
    end
    
    -- Apply saved state when addon loads
    self:ApplyTrackerState()
end

function addon:ApplyTrackerState()
    if QuestTrackerDB.trackerHidden then
        ObjectiveTrackerFrame:Hide()
    else
        ObjectiveTrackerFrame:Show()
    end
end

function addon:ToggleQuestTracker()
    QuestTrackerDB.trackerHidden = not QuestTrackerDB.trackerHidden
    self:ApplyTrackerState()⁄
end

-- Handle reload scenarios
addon:RegisterEvent("ADDON_LOADED")
addon:SetScript("OnEvent", function(self, event, arg1)
    if event == "ADDON_LOADED" and arg1 == addonName then
        self:ApplyTrackerState()
    end
end)