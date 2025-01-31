-- Create a basic addon frame
local frame = CreateFrame("Frame")
frame:RegisterEvent("ADDON_LOADED")
frame:RegisterEvent("PLAYER_LOGIN")

-- Main function to hide the health bar
local function HidePetHealthBar()
    -- Find the ElvUI pet health bar frame
    local petHealthBar = _G.ElvUF_Pet.Health
    
    if petHealthBar then
        -- Hide the health bar
        petHealthBar:Hide()
        petHealthBar:SetAlpha(0)  -- Ensure it's hidden
        petHealthBar.Show = function() end  -- Block attempts to show it
        
        -- Optional: Disable health bar updates
        petHealthBar:UnregisterAllEvents()
    end
end

-- Event handler
frame:SetScript("OnEvent", function(self, event, addon)
    if event == "PLAYER_LOGIN" then
        -- Initial hide attempt
        HidePetHealthBar()
        
        -- Set up periodic checks in case ElvUI loads slowly
        C_Timer.NewTicker(0.5, function()
            if _G.ElvUF_Pet and _G.ElvUF_Pet.Health and not _G.ElvUF_Pet.Health.manuallyHidden then
                HidePetHealthBar()
                _G.ElvUF_Pet.Health.manuallyHidden = true
            end
        end, 3)  -- Check 3 times (total 1.5 seconds)
        
    elseif event == "ADDON_LOADED" and addon == "ElvUI" then
        -- Extra check when ElvUI loads
        HidePetHealthBar()
    end
end)

-- Slash command for manual control (optional)
SLASH_HIDEPETHEALTH1 = "/hidepethealth"
SlashCmdList["HIDEPETHEALTH"] = function()
    HidePetHealthBar()
    print("ElvUI Pet Health Bar Hidden")
end