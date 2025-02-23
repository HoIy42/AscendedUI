-- Cache Lua / WoW API
local format = string.format
local GetCVarBool = GetCVarBool
local ReloadUI = ReloadUI
local StopMusic = StopMusic
local GetAddOnMetadata = (C_AddOns and C_AddOns.GetAddOnMetadata) or GetAddOnMetadata

-- Don't worry about this
local addon, Private = ...
local Version = GetAddOnMetadata(addon, "Version")

-- Change this line and use a unique name for your plugin.
local MyPluginName = "AscendedUI"

-- Create references to ElvUI internals
local E, L, V, P, G = unpack(ElvUI)

-- Create reference to LibElvUIPlugin
local EP = LibStub("LibElvUIPlugin-1.0")

-- Create a new ElvUI module so ElvUI can handle initialization when ready
local mod = E:NewModule(MyPluginName, "AceHook-3.0", "AceEvent-3.0", "AceTimer-3.0");

-- This function will hold your layout settings
local D = E:GetModule('Distributor')
local function SetupLayout(layout)

	--datext panels need to be created first,so create them here using E.DataTexts:BuildPanelFrame('nameofdatatextpanel')
	E.DataTexts:BuildPanelFrame('Info Panel')

	local profile = ""
	local private = ""
	local global = ""

	--profile import
	D:ImportProfile(private)
	D:ImportProfile(profile)
	D:ImportProfile(global)

	E:SetupChat()

	-- Setup UI Scale
	E.global["general"]["UIScale"] = 0.85

	-- This section at the bottom is just to update ElvUI and display a message

	-- Update ElvUI
	E:StaggeredUpdateAll()

	-- Show message about layout being set
	PluginInstallStepComplete.message = "Layout Set"
	PluginInstallStepComplete:Show()
end

-- This function is executed when you press "Skip Process" or "Finished" in the installer.
local function InstallComplete()
	if GetCVarBool("Sound_EnableMusic") then
		StopMusic()
	end

	-- Set a variable tracking the version of the addon when layout was installed
	E.db[MyPluginName].install_version = Version

	ReloadUI()
end

-- This is the data we pass on to the ElvUI Plugin Installer.
-- The Plugin Installer is reponsible for displaying the install guide for this layout.
local InstallerData = {
	Title = format("|cff4beb2c%s %s|r", "AscendedUI", "Installation"),
	Name = MyPluginName,
	-- Uncomment the line below f you have a logo you want to use, otherwise it uses the one from ElvUI
	tutorialImage = "Interface\\AddOns\\AscendedUI\\logo.png",
	tutorialImageSize = {158, 128},
	tutorialImagePoint = {0, 17},
	Pages = {
		[1] = function()
			PluginInstallFrame.SubTitle:SetFormattedText("Welcome to the installation for %s.", MyPluginName)
			PluginInstallFrame.Desc1:SetText("This installation process will guide you through a few steps and apply settings to your current ElvUI profile. If you want to be able to go back to your original settings then create a new profile before going through this installation process.")
			PluginInstallFrame.Desc2:SetText("Please press the continue button if you wish to go through the installation process, otherwise click the 'Skip Process' button.")
			PluginInstallFrame.Option1:Show()
			PluginInstallFrame.Option1:SetScript("OnClick", InstallComplete)
			PluginInstallFrame.Option1:SetText("Skip Process")
		end,
		[2] = function()
			PluginInstallFrame.SubTitle:SetText("Layouts")
			PluginInstallFrame.Desc1:SetText("These are the layouts that are available. Please click a button below to apply the layout of your choosing.")
			PluginInstallFrame.Desc2:SetText("Importance: |cff07D400High|r")
			PluginInstallFrame.Option1:Show()
			PluginInstallFrame.Option1:SetScript("OnClick", function()
				--here we create a new profile, so that your installer doesn't override the current profile and they can keep the old profile around
				E.data:SetProfile('AscendedUI')

				--call the layout function
				SetupLayout()
			end)
			PluginInstallFrame.Option1:SetText("AscendedUI")
		end,
		[3] = function()
			PluginInstallFrame.SubTitle:SetText(L["Details profile"])
			PluginInstallFrame.Desc1:SetText(L["Please click the button below to apply AscendedUI profile for Details! Damage Meter."])
			PluginInstallFrame.Desc2:SetText(format('|cff4beb2c%s', L["Recommended step. Should not be skipped."]))
			PluginInstallFrame.Option1:Show()
			PluginInstallFrame.Option1:SetScript('OnClick', function() Private:Setup_Details(true) end)
			PluginInstallFrame.Option1:SetText(L["Setup Details"])
		end,
		[4] = function()
			PluginInstallFrame.SubTitle:SetText("Installation Complete")
			PluginInstallFrame.Desc1:SetText("You have completed the installation process.")
			PluginInstallFrame.Desc2:SetText("Please click the button below in order to finalize the process and automatically reload your UI.")
			PluginInstallFrame.Option1:Show()
			PluginInstallFrame.Option1:SetScript("OnClick", InstallComplete)
			PluginInstallFrame.Option1:SetText("Finished")
		end,
	},
	StepTitles = {
		[1] = "Welcome",
		[2] = "Layouts",
		[3] = 'Details',
		[4] = "Installation Complete",
	},
	StepTitlesColor = {1, 1, 1},
	StepTitlesColorSelected = {0, 179/255, 1},
	StepTitleWidth = 200,
	StepTitleButtonWidth = 180,
	StepTitleTextJustification = "RIGHT",
}

-- This function holds the options table which will be inserted into the ElvUI config
local function InsertOptions()
	E.Options.args.MyPluginName = {
		order = 100,
		type = "group",
		name = format("|cff4beb2c%s|r", MyPluginName),
		args = {
			header1 = {
				order = 1,
				type = "header",
				name = MyPluginName,
			},
			description1 = {
				order = 2,
				type = "description",
				name = format("%s is a layout for ElvUI.", MyPluginName),
			},
			spacer1 = {
				order = 3,
				type = "description",
				name = "\n\n\n",
			},
			header2 = {
				order = 4,
				type = "header",
				name = "Installation",
			},
			description2 = {
				order = 5,
				type = "description",
				name = "The installation guide should pop up automatically after you have completed the ElvUI installation. If you wish to re-run the installation process for this layout then please click the button below.",
			},
			spacer2 = {
				order = 6,
				type = "description",
				name = "",
			},
			install = {
				order = 7,
				type = "execute",
				name = "Install",
				desc = "Run the installation process.",
				func = function() E:GetModule("PluginInstaller"):Queue(InstallerData); E:ToggleOptions(); end,
			},
		},
	}
end

-- Create a unique table for our plugin
P[MyPluginName] = {}

-- This function will handle initialization of the addon
function mod:Initialize()
	-- Initiate installation process if ElvUI install is complete and our plugin install has not yet been run
	if E.private.install_complete and E.db[MyPluginName].install_version == nil then
		E:GetModule("PluginInstaller"):Queue(InstallerData)
	end

	-- Insert our options table when ElvUI config is loaded
	EP:RegisterPlugin(addon, InsertOptions)
end

-- Register module with callback so it gets initialized when ready
E:RegisterModule(mod:GetName())
