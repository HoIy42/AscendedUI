-- Cache Lua / WoW API
local format = string.format
local GetCVarBool = GetCVarBool
local ReloadUI = ReloadUI
local StopMusic = StopMusic
local GetAddOnMetadata = (C_AddOns and C_AddOns.GetAddOnMetadata) or GetAddOnMetadata

-- Don't worry about this
local addon, ns = ...
local Version = GetAddOnMetadata(addon, "Version")

-- Change this line and use a unique name for your plugin.
local MyPluginName = "Ascended UI"

-- Create references to ElvUI internals
local E, L, V, P, G = unpack(ElvUI)

-- Create reference to LibElvUIPlugin
local EP = LibStub("LibElvUIPlugin-1.0")

-- Create a new ElvUI module so ElvUI can handle initialization when ready
local mod = E:NewModule(MyPluginName, "AceHook-3.0", "AceEvent-3.0", "AceTimer-3.0");

-- This function will hold your layout settings
local function SetupLayout(layout)

	-- PUT YOUR EXPORTED PROFILE/SETTINGS BELOW HERE

	-- LAYOUT GOES HERE
E.db["actionbar"]["bar1"]["backdrop"] = true
E.db["actionbar"]["bar1"]["backdropSpacing"] = 1
E.db["actionbar"]["bar1"]["buttonHeight"] = 36
E.db["actionbar"]["bar1"]["buttonSize"] = 37
E.db["actionbar"]["bar1"]["buttonSpacing"] = 1
E.db["actionbar"]["bar1"]["buttons"] = 8
E.db["actionbar"]["bar1"]["keepSizeRatio"] = false
E.db["actionbar"]["bar2"]["backdrop"] = true
E.db["actionbar"]["bar2"]["backdropSpacing"] = 0
E.db["actionbar"]["bar2"]["buttonHeight"] = 31
E.db["actionbar"]["bar2"]["buttonSize"] = 37
E.db["actionbar"]["bar2"]["buttonSpacing"] = 1
E.db["actionbar"]["bar2"]["buttons"] = 7
E.db["actionbar"]["bar2"]["enabled"] = true
E.db["actionbar"]["bar2"]["keepSizeRatio"] = false
E.db["actionbar"]["bar2"]["targetReticle"] = false
E.db["actionbar"]["bar3"]["backdropSpacing"] = 1
E.db["actionbar"]["bar3"]["buttonSize"] = 25
E.db["actionbar"]["bar3"]["buttonSpacing"] = 1
E.db["actionbar"]["bar3"]["buttons"] = 12
E.db["actionbar"]["bar3"]["enabled"] = false
E.db["actionbar"]["bar4"]["backdrop"] = false
E.db["actionbar"]["bar4"]["backdropSpacing"] = 1
E.db["actionbar"]["bar4"]["buttonSize"] = 25
E.db["actionbar"]["bar4"]["buttonSpacing"] = 1
E.db["actionbar"]["bar4"]["buttonsPerRow"] = 12
E.db["actionbar"]["bar4"]["enabled"] = false
E.db["actionbar"]["bar4"]["point"] = "BOTTOMLEFT"
E.db["actionbar"]["bar5"]["backdropSpacing"] = 1
E.db["actionbar"]["bar5"]["buttonSize"] = 25
E.db["actionbar"]["bar5"]["buttonSpacing"] = 1
E.db["actionbar"]["bar5"]["buttons"] = 12
E.db["actionbar"]["bar5"]["buttonsPerRow"] = 12
E.db["actionbar"]["bar5"]["enabled"] = false
E.db["actionbar"]["bar6"]["backdropSpacing"] = 1
E.db["actionbar"]["bar6"]["buttonSize"] = 25
E.db["actionbar"]["bar6"]["buttonSpacing"] = 1
E.db["actionbar"]["bar6"]["buttonsPerRow"] = 1
E.db["actionbar"]["bar6"]["mouseover"] = true
E.db["actionbar"]["bar6"]["point"] = "TOPRIGHT"
E.db["actionbar"]["barPet"]["backdrop"] = false
E.db["actionbar"]["barPet"]["backdropSpacing"] = 1
E.db["actionbar"]["barPet"]["buttonSize"] = 17
E.db["actionbar"]["barPet"]["buttonSpacing"] = 1
E.db["actionbar"]["barPet"]["buttonsPerRow"] = 10
E.db["actionbar"]["barPet"]["mouseover"] = true
E.db["actionbar"]["barPet"]["point"] = "BOTTOMLEFT"
E.db["actionbar"]["colorSwipeNormal"]["a"] = 0.80000001192093
E.db["actionbar"]["equippedItem"] = true
E.db["actionbar"]["flyoutSize"] = 19
E.db["actionbar"]["font"] = "Expressway"
E.db["actionbar"]["fontOutline"] = "OUTLINE"
E.db["actionbar"]["fontSize"] = 11
E.db["actionbar"]["globalFadeAlpha"] = 1
E.db["actionbar"]["movementModifier"] = "ALT"
E.db["actionbar"]["stanceBar"]["backdropSpacing"] = 1
E.db["actionbar"]["stanceBar"]["buttonSize"] = 25
E.db["actionbar"]["stanceBar"]["buttonSpacing"] = 1
E.db["actionbar"]["stanceBar"]["point"] = "BOTTOMLEFT"
E.db["actionbar"]["vehicleExitButton"]["size"] = 50
E.db["actionbar"]["zoneActionButton"]["scale"] = 2
E.db["auras"]["buffs"]["countFontSize"] = 11
E.db["auras"]["buffs"]["horizontalSpacing"] = 1
E.db["auras"]["buffs"]["maxWraps"] = 2
E.db["auras"]["buffs"]["wrapAfter"] = 15
E.db["auras"]["debuffs"]["countFontSize"] = 11
E.db["auras"]["debuffs"]["horizontalSpacing"] = 1
E.db["auras"]["debuffs"]["wrapAfter"] = 15
E.db["bags"]["bagSize"] = 32
E.db["bags"]["bagWidth"] = 350
E.db["bags"]["bankSize"] = 32
E.db["bags"]["bankWidth"] = 550
E.db["bags"]["countFont"] = "Expressway"
E.db["bags"]["countFontOutline"] = "OUTLINE"
E.db["bags"]["countFontSize"] = 11
E.db["bags"]["itemLevelFont"] = "Expressway"
E.db["bags"]["itemLevelFontOutline"] = "OUTLINE"
E.db["bags"]["itemLevelFontSize"] = 11
E.db["bags"]["junkIcon"] = true
E.db["bags"]["vendorGrays"]["enable"] = true
E.db["chat"]["emotionIcons"] = false
E.db["chat"]["fadeChatToggles"] = false
E.db["chat"]["font"] = "Expressway"
E.db["chat"]["fontOutline"] = "OUTLINE"
E.db["chat"]["fontSize"] = 11
E.db["chat"]["lfgIcons"] = false
E.db["chat"]["panelBackdrop"] = "HIDEBOTH"
E.db["chat"]["panelColor"]["a"] = 0.90000000596047
E.db["chat"]["panelColor"]["b"] = 0.03921568627451
E.db["chat"]["panelColor"]["g"] = 0.03921568627451
E.db["chat"]["panelColor"]["r"] = 0.03921568627451
E.db["chat"]["panelHeight"] = 141
E.db["chat"]["panelHeightRight"] = 200
E.db["chat"]["panelWidth"] = 333
E.db["chat"]["panelWidthRight"] = 350
E.db["chat"]["tabFont"] = "Expressway"
E.db["chat"]["tabFontOutline"] = "OUTLINE"
E.db["chat"]["tabFontSize"] = 11
E.db["convertPages"] = true
E.db["cooldown"]["daysColor"]["g"] = 1
E.db["cooldown"]["daysColor"]["r"] = 1
E.db["cooldown"]["expiringColor"]["b"] = 1
E.db["cooldown"]["expiringColor"]["g"] = 1
E.db["cooldown"]["hoursColor"]["r"] = 1
E.db["cooldown"]["secondsColor"]["b"] = 1
E.db["cooldown"]["threshold"] = -1
E.db["databars"]["azerite"]["height"] = 5
E.db["databars"]["azerite"]["orientation"] = "HORIZONTAL"
E.db["databars"]["azerite"]["width"] = 152
E.db["databars"]["experience"]["font"] = "Expressway"
E.db["databars"]["experience"]["height"] = 15
E.db["databars"]["experience"]["orientation"] = "HORIZONTAL"
E.db["databars"]["experience"]["showLevel"] = true
E.db["databars"]["experience"]["textFormat"] = "PERCENT"
E.db["databars"]["experience"]["width"] = 512
E.db["databars"]["honor"]["enable"] = false
E.db["databars"]["honor"]["font"] = "Expressway"
E.db["databars"]["honor"]["height"] = 32
E.db["databars"]["honor"]["orientation"] = "HORIZONTAL"
E.db["databars"]["honor"]["textFormat"] = "PERCENT"
E.db["databars"]["honor"]["width"] = 395
E.db["databars"]["reputation"]["font"] = "Expressway"
E.db["databars"]["reputation"]["height"] = 32
E.db["databars"]["reputation"]["orientation"] = "HORIZONTAL"
E.db["databars"]["reputation"]["textFormat"] = "PERCENT"
E.db["databars"]["reputation"]["width"] = 395
E.db["databars"]["transparent"] = false
E.db["datatexts"]["font"] = "Expressway"
E.db["datatexts"]["fontOutline"] = "OUTLINE"
E.db["datatexts"]["fontSize"] = 11
E.db["datatexts"]["panels"]["BottomMiniPanel"] = "Time"
E.db["datatexts"]["panels"]["Info Panel"][1] = "DPS"
E.db["datatexts"]["panels"]["Info Panel"][2] = "Durability"
E.db["datatexts"]["panels"]["Info Panel"][3] = "Time"
E.db["datatexts"]["panels"]["Info Panel"]["battleground"] = false
E.db["datatexts"]["panels"]["Info Panel"]["enable"] = false
E.db["datatexts"]["panels"]["LeftChatDataPanel"]["enable"] = false
E.db["datatexts"]["panels"]["LeftChatDataPanel"]["left"] = ""
E.db["datatexts"]["panels"]["LeftChatDataPanel"]["middle"] = ""
E.db["datatexts"]["panels"]["LeftChatDataPanel"]["right"] = ""
E.db["datatexts"]["panels"]["LeftMiniPanel"] = ""
E.db["datatexts"]["panels"]["MinimapPanel"][1] = "Time"
E.db["datatexts"]["panels"]["MinimapPanel"][2] = "System"
E.db["datatexts"]["panels"]["MinimapPanel"]["border"] = false
E.db["datatexts"]["panels"]["RightChatDataPanel"]["enable"] = false
E.db["datatexts"]["panels"]["RightChatDataPanel"]["left"] = ""
E.db["datatexts"]["panels"]["RightChatDataPanel"]["middle"] = ""
E.db["datatexts"]["panels"]["RightChatDataPanel"]["right"] = ""
E.db["datatexts"]["panels"]["RightMiniPanel"] = ""
E.db["general"]["afk"] = false
E.db["general"]["autoAcceptInvite"] = true
E.db["general"]["autoRepair"] = "GUILD"
E.db["general"]["backdropcolor"]["b"] = 0
E.db["general"]["backdropcolor"]["g"] = 0
E.db["general"]["backdropcolor"]["r"] = 0
E.db["general"]["backdropfadecolor"]["a"] = 1
E.db["general"]["backdropfadecolor"]["b"] = 0
E.db["general"]["backdropfadecolor"]["g"] = 0
E.db["general"]["backdropfadecolor"]["r"] = 0
E.db["general"]["bottomPanel"] = false
E.db["general"]["bottomPanelSettings"]["transparent"] = false
E.db["general"]["font"] = "Expressway"
E.db["general"]["fontSize"] = 11
E.db["general"]["minimap"]["icons"]["classHall"]["position"] = "BOTTOMRIGHT"
E.db["general"]["minimap"]["icons"]["classHall"]["scale"] = 1.7
E.db["general"]["minimap"]["icons"]["classHall"]["yOffset"] = 100
E.db["general"]["minimap"]["locationFontSize"] = 11
E.db["general"]["minimap"]["size"] = 150
E.db["general"]["objectiveFrameHeight"] = 500
E.db["general"]["smoothingAmount"] = 0.5
E.db["general"]["talkingHeadFrameScale"] = 0.75
E.db["general"]["totems"]["growthDirection"] = "HORIZONTAL"
E.db["general"]["totems"]["size"] = 43
E.db["general"]["valuecolor"]["b"] = 1
E.db["general"]["valuecolor"]["g"] = 0.054901964962482
E.db["general"]["valuecolor"]["r"] = 0
if not E.db['movers'] then E.db['movers'] = {} end
E.db["movers"]["AlertFrameMover"] = "TOP,UIParent,TOP,0,-175"
E.db["movers"]["AltPowerBarMover"] = "BOTTOM,UIParent,BOTTOM,0,61"
E.db["movers"]["ArenaHeaderMover"] = "TOPRIGHT,ElvUIParent,TOPRIGHT,-238,-297"
E.db["movers"]["ArtifactBarMover"] = "BOTTOM,ElvUIParent,BOTTOM,0,99"
E.db["movers"]["AzeriteBarMover"] = "TOPRIGHT,ElvUIParent,TOPRIGHT,-30,-183"
E.db["movers"]["BNETMover"] = "BOTTOMLEFT,ElvUIParent,BOTTOMLEFT,109,157"
E.db["movers"]["BossBannerMover"] = "TOP,UIParent,TOP,0,-142"
E.db["movers"]["BossButton"] = "BOTTOMLEFT,UIParent,BOTTOMLEFT,290,280"
E.db["movers"]["BossHeaderMover"] = "BOTTOM,UIParent,BOTTOM,284,294"
E.db["movers"]["BuffsMover"] = "TOPRIGHT,UIParent,TOPRIGHT,-223,-4"
E.db["movers"]["CM_MOVER"] = "BOTTOM,ElvUIParent,BOTTOM,0,150"
E.db["movers"]["ClassBarMover"] = "BOTTOM,ElvUIParent,BOTTOM,0,335"
E.db["movers"]["ComboBarMover"] = "BOTTOM,ElvUIParent,BOTTOM,-250,313"
E.db["movers"]["DTPanelInfo PanelMover"] = "BOTTOM,UIParent,BOTTOM,0,106"
E.db["movers"]["DebuffsMover"] = "TOPRIGHT,ElvUIParent,TOPRIGHT,-183,-127"
E.db["movers"]["ElvAB_1"] = "BOTTOM,ElvUIParent,BOTTOM,0,293"
E.db["movers"]["ElvAB_2"] = "BOTTOM,ElvUIParent,BOTTOM,0,263"
E.db["movers"]["ElvAB_3"] = "BOTTOM,UIParent,BOTTOM,220,464"
E.db["movers"]["ElvAB_4"] = "BOTTOM,ElvUIParent,BOTTOM,0,30"
E.db["movers"]["ElvAB_5"] = "BOTTOM,ElvUIParent,BOTTOM,0,56"
E.db["movers"]["ElvAB_6"] = "TOPRIGHT,ElvUIParent,TOPRIGHT,-4,-384"
E.db["movers"]["ElvUF_AssistMover"] = "TOPLEFT,ElvUIParent,TOPLEFT,30,-340"
E.db["movers"]["ElvUF_FocusCastbarMover"] = "BOTTOM,UIParent,BOTTOM,0,344"
E.db["movers"]["ElvUF_FocusMover"] = "BOTTOM,ElvUIParent,BOTTOM,0,363"
E.db["movers"]["ElvUF_PartyMover"] = "BOTTOM,ElvUIParent,BOTTOM,-283,348"
E.db["movers"]["ElvUF_PetCastbarMover"] = "BOTTOMLEFT,ElvUIParent,BOTTOMLEFT,573,343"
E.db["movers"]["ElvUF_PetMover"] = "BOTTOM,UIParent,BOTTOM,-205,376"
E.db["movers"]["ElvUF_PlayerCastbarMover"] = "BOTTOM,ElvUIParent,BOTTOM,-284,294"
E.db["movers"]["ElvUF_PlayerMover"] = "BOTTOM,ElvUIParent,BOTTOM,-284,313"
E.db["movers"]["ElvUF_Raid1Mover"] = "BOTTOM,UIParent,BOTTOM,0,48"
E.db["movers"]["ElvUF_Raid2Mover"] = "BOTTOM,UIParent,BOTTOM,0,49"
E.db["movers"]["ElvUF_Raid3Mover"] = "BOTTOM,UIParent,BOTTOM,0,47"
E.db["movers"]["ElvUF_RaidpetMover"] = "TOPLEFT,ElvUIParent,BOTTOMLEFT,4,736"
E.db["movers"]["ElvUF_TargetCastbarMover"] = "BOTTOM,ElvUIParent,BOTTOM,284,294"
E.db["movers"]["ElvUF_TargetMover"] = "BOTTOM,ElvUIParent,BOTTOM,284,313"
E.db["movers"]["ElvUF_TargetTargetMover"] = "BOTTOMRIGHT,ElvUIParent,BOTTOMRIGHT,-541,345"
E.db["movers"]["EventToastMover"] = "TOP,UIParent,TOP,0,-68"
E.db["movers"]["ExperienceBarMover"] = "BOTTOM,ElvUIParent,BOTTOM,0,0"
E.db["movers"]["GMMover"] = "TOPLEFT,UIParent,TOPLEFT,4,-4"
E.db["movers"]["GhostFrameMover"] = "TOP,ElvUIParent,TOP,0,-147"
E.db["movers"]["HonorBarMover"] = "TOP,ElvUIParent,TOP,0,-66"
E.db["movers"]["LeftChatMover"] = "BOTTOMLEFT,ElvUIParent,BOTTOMLEFT,26,17"
E.db["movers"]["LootFrameMover"] = "BOTTOMRIGHT,UIParent,BOTTOMRIGHT,-208,64"
E.db["movers"]["LossControlMover"] = "TOP,UIParent,TOP,0,-508"
E.db["movers"]["MicrobarMover"] = "TOPLEFT,ElvUIParent,TOPLEFT,30,-30"
E.db["movers"]["MinimapMover"] = "TOPRIGHT,UIParent,TOPRIGHT,-4,-4"
E.db["movers"]["ObjectiveFrameMover"] = "TOPRIGHT,ElvUIParent,TOPRIGHT,-82,-260"
E.db["movers"]["PetAB"] = "BOTTOMRIGHT,ElvUIParent,BOTTOMRIGHT,-115,11"
E.db["movers"]["PlayerPowerBarMover"] = "BOTTOM,ElvUIParent,BOTTOM,0,329"
E.db["movers"]["PowerBarContainerMover"] = "TOP,UIParent,TOP,0,-96"
E.db["movers"]["PrivateRaidWarningMover"] = "TOP,UIParent,TOP,0,-243"
E.db["movers"]["ReputationBarMover"] = "TOP,ElvUIParent,TOP,0,-33"
E.db["movers"]["RightChatMover"] = "BOTTOMRIGHT,UIParent,BOTTOMRIGHT,-4,4"
E.db["movers"]["ShiftAB"] = "BOTTOM,ElvUIParent,BOTTOM,0,0"
E.db["movers"]["TalkingHeadFrameMover"] = "TOP,ElvUIParent,TOP,0,-4"
E.db["movers"]["TargetPowerBarMover"] = "BOTTOMRIGHT,UIParent,BOTTOMRIGHT,-399,224"
E.db["movers"]["TooltipMover"] = "BOTTOMRIGHT,UIParent,BOTTOMRIGHT,-195,4"
E.db["movers"]["TopCenterContainerMover"] = "TOP,UIParent,TOP,72,-51"
E.db["movers"]["TorghastChoiceToggle"] = "BOTTOM,ElvUIParent,BOTTOM,0,429"
E.db["movers"]["TotemBarMover"] = "BOTTOM,ElvUIParent,BOTTOM,-182,325"
E.db["movers"]["TotemTrackerMover"] = "BOTTOM,UIParent,BOTTOM,0,141"
E.db["movers"]["VOICECHAT"] = "TOPLEFT,UIParent,TOPLEFT,4,-83"
E.db["movers"]["VehicleLeaveButton"] = "BOTTOMLEFT,UIParent,BOTTOMLEFT,428,299"
E.db["movers"]["VehicleSeatMover"] = "TOPLEFT,ElvUIParent,TOPLEFT,30,-410"
E.db["movers"]["WTCombatAlertFrameMover"] = "TOP,ElvUIParent,TOP,0,-317"
E.db["movers"]["WTCustomEmoteFrameMover"] = "BOTTOMLEFT,UIParent,BOTTOMLEFT,372,4"
E.db["movers"]["WTExtraItemsBar1Mover"] = "BOTTOMRIGHT,UIParent,BOTTOMRIGHT,-4,117"
E.db["movers"]["WTGameBarAnchor"] = "TOP,UIParent,TOP,0,-84"
E.db["movers"]["WTSwitchButtonBarMover"] = "TOPRIGHT,UIParent,TOPRIGHT,-45,-278"
E.db["movers"]["WatchFrameMover"] = "TOPRIGHT,ElvUIParent,TOPRIGHT,-30,-300"
E.db["movers"]["ZoneAbility"] = "BOTTOMLEFT,UIParent,BOTTOMLEFT,165,252"
E.db["nameplates"]["cooldown"]["fonts"]["font"] = "Expressway"
E.db["nameplates"]["cooldown"]["fonts"]["fontSize"] = 11
E.db["nameplates"]["font"] = "Expressway"
E.db["nameplates"]["loadDistance"] = 65
E.db["nameplates"]["lowHealthThreshold"] = 0
E.db["nameplates"]["motionType"] = "OVERLAP"
E.db["nameplates"]["statusbar"] = "ElvUI Norm1"
E.db["nameplates"]["units"]["ENEMY_NPC"]["castbar"]["castTimeFormat"] = "REMAINING"
E.db["nameplates"]["units"]["ENEMY_NPC"]["castbar"]["channelTimeFormat"] = "REMAINING"
E.db["nameplates"]["units"]["ENEMY_PLAYER"]["castbar"]["castTimeFormat"] = "REMAINING"
E.db["nameplates"]["units"]["ENEMY_PLAYER"]["castbar"]["channelTimeFormat"] = "REMAINING"
E.db["tooltip"]["colorAlpha"] = 0.9
E.db["tooltip"]["font"] = "Expressway"
E.db["tooltip"]["guildRanks"] = false
E.db["tooltip"]["headerFontSize"] = 11
E.db["tooltip"]["healthBar"]["font"] = "Expressway"
E.db["tooltip"]["healthBar"]["height"] = 0
E.db["tooltip"]["healthBar"]["text"] = false
E.db["tooltip"]["itemCount"]["bank"] = true
E.db["tooltip"]["playerTitles"] = false
E.db["tooltip"]["smallTextFontSize"] = 11
E.db["tooltip"]["textFontSize"] = 11
E.db["unitframe"]["colors"]["castColor"]["b"] = 0.8
E.db["unitframe"]["colors"]["castColor"]["g"] = 0.8
E.db["unitframe"]["colors"]["castColor"]["r"] = 0.8
E.db["unitframe"]["colors"]["castNoInterrupt"]["b"] = 0.23921568627451
E.db["unitframe"]["colors"]["castNoInterrupt"]["g"] = 0.19607843137255
E.db["unitframe"]["colors"]["castNoInterrupt"]["r"] = 0.91372549019608
E.db["unitframe"]["colors"]["classResources"]["MONK"][1]["b"] = 0.58823529411765
E.db["unitframe"]["colors"]["classResources"]["MONK"][1]["g"] = 1
E.db["unitframe"]["colors"]["classResources"]["MONK"][1]["r"] = 0
E.db["unitframe"]["colors"]["classResources"]["MONK"][2]["b"] = 0.58823529411765
E.db["unitframe"]["colors"]["classResources"]["MONK"][2]["g"] = 1
E.db["unitframe"]["colors"]["classResources"]["MONK"][2]["r"] = 0
E.db["unitframe"]["colors"]["classResources"]["MONK"][3]["b"] = 0.58823529411765
E.db["unitframe"]["colors"]["classResources"]["MONK"][3]["g"] = 1
E.db["unitframe"]["colors"]["classResources"]["MONK"][3]["r"] = 0
E.db["unitframe"]["colors"]["classResources"]["MONK"][4]["b"] = 0.58823529411765
E.db["unitframe"]["colors"]["classResources"]["MONK"][4]["g"] = 1
E.db["unitframe"]["colors"]["classResources"]["MONK"][4]["r"] = 0
E.db["unitframe"]["colors"]["classResources"]["MONK"][5]["b"] = 0.58823529411765
E.db["unitframe"]["colors"]["classResources"]["MONK"][5]["g"] = 1
E.db["unitframe"]["colors"]["classResources"]["MONK"][5]["r"] = 0
E.db["unitframe"]["colors"]["classResources"]["MONK"][6]["b"] = 0.58823529411765
E.db["unitframe"]["colors"]["classResources"]["MONK"][6]["g"] = 1
E.db["unitframe"]["colors"]["classResources"]["MONK"][6]["r"] = 0
E.db["unitframe"]["colors"]["colorhealthbyvalue"] = false
E.db["unitframe"]["colors"]["customhealthbackdrop"] = true
E.db["unitframe"]["colors"]["disconnected"]["b"] = 0.85098039215686
E.db["unitframe"]["colors"]["disconnected"]["g"] = 0.7921568627451
E.db["unitframe"]["colors"]["disconnected"]["r"] = 0.76470588235294
E.db["unitframe"]["colors"]["health"]["b"] = 0.40392156862745
E.db["unitframe"]["colors"]["health"]["g"] = 1
E.db["unitframe"]["colors"]["health"]["r"] = 0.41960784313726
E.db["unitframe"]["colors"]["health_backdrop"]["b"] = 0.070588235294118
E.db["unitframe"]["colors"]["health_backdrop"]["g"] = 0.070588235294118
E.db["unitframe"]["colors"]["health_backdrop"]["r"] = 0.070588235294118
E.db["unitframe"]["colors"]["healthclass"] = true
E.db["unitframe"]["colors"]["power"]["ENERGY"]["b"] = 0.27450980392157
E.db["unitframe"]["colors"]["power"]["ENERGY"]["g"] = 0.27450980392157
E.db["unitframe"]["colors"]["power"]["ENERGY"]["r"] = 0.27450980392157
E.db["unitframe"]["colors"]["power"]["FOCUS"]["b"] = 0.23529411764706
E.db["unitframe"]["colors"]["power"]["FOCUS"]["g"] = 0.54901960784314
E.db["unitframe"]["colors"]["power"]["FOCUS"]["r"] = 0.90196078431373
E.db["unitframe"]["colors"]["power"]["MANA"]["b"] = 0.90196078431373
E.db["unitframe"]["colors"]["power"]["MANA"]["g"] = 0.74509803921569
E.db["unitframe"]["colors"]["power"]["MANA"]["r"] = 0
E.db["unitframe"]["colors"]["power"]["RAGE"]["b"] = 0.27450980392157
E.db["unitframe"]["colors"]["power"]["RAGE"]["g"] = 0.27450980392157
E.db["unitframe"]["colors"]["power"]["RAGE"]["r"] = 0.27450980392157
E.db["unitframe"]["colors"]["power"]["RUNIC_POWER"]["b"] = 0.27450980392157
E.db["unitframe"]["colors"]["power"]["RUNIC_POWER"]["g"] = 0.27450980392157
E.db["unitframe"]["colors"]["power"]["RUNIC_POWER"]["r"] = 0.27450980392157
E.db["unitframe"]["colors"]["reaction"]["BAD"]["b"] = 0.25098039215686
E.db["unitframe"]["colors"]["reaction"]["BAD"]["g"] = 0.25098039215686
E.db["unitframe"]["colors"]["reaction"]["BAD"]["r"] = 0.78039215686274
E.db["unitframe"]["colors"]["tapped"]["b"] = 0.85098039215686
E.db["unitframe"]["colors"]["tapped"]["g"] = 0.7921568627451
E.db["unitframe"]["colors"]["tapped"]["r"] = 0.76470588235294
E.db["unitframe"]["debuffHighlighting"] = "NONE"
E.db["unitframe"]["font"] = "Expressway"
E.db["unitframe"]["fontOutline"] = "OUTLINE"
E.db["unitframe"]["fontSize"] = 11
E.db["unitframe"]["smoothbars"] = true
E.db["unitframe"]["statusbar"] = "ElvUI Norm1"
E.db["unitframe"]["units"]["arena"]["buffs"]["anchorPoint"] = "RIGHT"
E.db["unitframe"]["units"]["arena"]["buffs"]["sizeOverride"] = 18
E.db["unitframe"]["units"]["arena"]["buffs"]["xOffset"] = 2
E.db["unitframe"]["units"]["arena"]["buffs"]["yOffset"] = 10
E.db["unitframe"]["units"]["arena"]["castbar"]["format"] = ""
E.db["unitframe"]["units"]["arena"]["castbar"]["height"] = 10
E.db["unitframe"]["units"]["arena"]["castbar"]["icon"] = false
E.db["unitframe"]["units"]["arena"]["castbar"]["spark"] = false
E.db["unitframe"]["units"]["arena"]["castbar"]["width"] = 225
E.db["unitframe"]["units"]["arena"]["debuffs"]["sizeOverride"] = 18
E.db["unitframe"]["units"]["arena"]["debuffs"]["xOffset"] = 2
E.db["unitframe"]["units"]["arena"]["debuffs"]["yOffset"] = -10
E.db["unitframe"]["units"]["arena"]["enable"] = false
E.db["unitframe"]["units"]["arena"]["health"]["text_format"] = "[health:current]"
E.db["unitframe"]["units"]["arena"]["height"] = 40
E.db["unitframe"]["units"]["arena"]["name"]["text_format"] = "[name:veryshort]"
E.db["unitframe"]["units"]["arena"]["power"]["height"] = 3
E.db["unitframe"]["units"]["arena"]["power"]["text_format"] = ""
E.db["unitframe"]["units"]["arena"]["width"] = 225
E.db["unitframe"]["units"]["assist"]["enable"] = false
E.db["unitframe"]["units"]["boss"]["buffs"]["sizeOverride"] = 30
E.db["unitframe"]["units"]["boss"]["buffs"]["xOffset"] = -1
E.db["unitframe"]["units"]["boss"]["buffs"]["yOffset"] = 0
E.db["unitframe"]["units"]["boss"]["castbar"]["height"] = 24
E.db["unitframe"]["units"]["boss"]["castbar"]["icon"] = false
E.db["unitframe"]["units"]["boss"]["castbar"]["spark"] = false
E.db["unitframe"]["units"]["boss"]["castbar"]["width"] = 184
E.db["unitframe"]["units"]["boss"]["debuffs"]["anchorPoint"] = "RIGHT"
E.db["unitframe"]["units"]["boss"]["debuffs"]["enable"] = false
E.db["unitframe"]["units"]["boss"]["debuffs"]["sizeOverride"] = 35
E.db["unitframe"]["units"]["boss"]["debuffs"]["xOffset"] = 3
E.db["unitframe"]["units"]["boss"]["debuffs"]["yOffset"] = 0
E.db["unitframe"]["units"]["boss"]["growthDirection"] = "UP"
E.db["unitframe"]["units"]["boss"]["health"]["position"] = "TOPRIGHT"
E.db["unitframe"]["units"]["boss"]["health"]["text_format"] = "[perhp]%"
E.db["unitframe"]["units"]["boss"]["health"]["yOffset"] = -2
E.db["unitframe"]["units"]["boss"]["height"] = 30
E.db["unitframe"]["units"]["boss"]["name"]["position"] = "LEFT"
E.db["unitframe"]["units"]["boss"]["name"]["text_format"] = "[name]"
E.db["unitframe"]["units"]["boss"]["name"]["xOffset"] = 2
E.db["unitframe"]["units"]["boss"]["power"]["height"] = 3
E.db["unitframe"]["units"]["boss"]["power"]["position"] = "BOTTOMRIGHT"
E.db["unitframe"]["units"]["boss"]["power"]["text_format"] = "[power:current]"
E.db["unitframe"]["units"]["boss"]["power"]["xOffset"] = 2
E.db["unitframe"]["units"]["boss"]["spacing"] = 30
E.db["unitframe"]["units"]["boss"]["width"] = 184
E.db["unitframe"]["units"]["focus"]["aurabar"]["anchorPoint"] = "Below"
E.db["unitframe"]["units"]["focus"]["aurabar"]["attachTo"] = "Debuffs"
E.db["unitframe"]["units"]["focus"]["aurabar"]["detachedWidth"] = 270
E.db["unitframe"]["units"]["focus"]["aurabar"]["maxBars"] = 6
E.db["unitframe"]["units"]["focus"]["buffs"]["growthX"] = "LEFT"
E.db["unitframe"]["units"]["focus"]["buffs"]["maxDuration"] = 0
E.db["unitframe"]["units"]["focus"]["buffs"]["perrow"] = 8
E.db["unitframe"]["units"]["focus"]["buffs"]["priority"] = "Blacklist,Whitelist,blockNoDuration,Personal,nonPersonal"
E.db["unitframe"]["units"]["focus"]["buffs"]["yOffset"] = -1
E.db["unitframe"]["units"]["focus"]["castbar"]["height"] = 20
E.db["unitframe"]["units"]["focus"]["castbar"]["icon"] = false
E.db["unitframe"]["units"]["focus"]["castbar"]["spark"] = false
E.db["unitframe"]["units"]["focus"]["castbar"]["width"] = 184
E.db["unitframe"]["units"]["focus"]["debuffs"]["anchorPoint"] = "BOTTOMLEFT"
E.db["unitframe"]["units"]["focus"]["debuffs"]["enable"] = false
E.db["unitframe"]["units"]["focus"]["debuffs"]["maxDuration"] = 0
E.db["unitframe"]["units"]["focus"]["debuffs"]["perrow"] = 8
E.db["unitframe"]["units"]["focus"]["debuffs"]["priority"] = "Blacklist,Personal,nonPersonal"
E.db["unitframe"]["units"]["focus"]["debuffs"]["yOffset"] = -16
E.db["unitframe"]["units"]["focus"]["disableTargetGlow"] = true
E.db["unitframe"]["units"]["focus"]["fader"]["enable"] = false
E.db["unitframe"]["units"]["focus"]["fader"]["range"] = false
E.db["unitframe"]["units"]["focus"]["healPrediction"]["enable"] = false
E.db["unitframe"]["units"]["focus"]["health"]["position"] = "LEFT"
E.db["unitframe"]["units"]["focus"]["health"]["text_format"] = "[health:current-percent]"
E.db["unitframe"]["units"]["focus"]["health"]["xOffset"] = 2
E.db["unitframe"]["units"]["focus"]["height"] = 30
E.db["unitframe"]["units"]["focus"]["infoPanel"]["height"] = 20
E.db["unitframe"]["units"]["focus"]["name"]["position"] = "TOPRIGHT"
E.db["unitframe"]["units"]["focus"]["name"]["text_format"] = "[name:long]"
E.db["unitframe"]["units"]["focus"]["name"]["xOffset"] = 2
E.db["unitframe"]["units"]["focus"]["name"]["yOffset"] = 6
E.db["unitframe"]["units"]["focus"]["orientation"] = "RIGHT"
E.db["unitframe"]["units"]["focus"]["power"]["detachFromFrame"] = true
E.db["unitframe"]["units"]["focus"]["power"]["detachedWidth"] = 301
E.db["unitframe"]["units"]["focus"]["power"]["height"] = 8
E.db["unitframe"]["units"]["focus"]["power"]["position"] = "RIGHT"
E.db["unitframe"]["units"]["focus"]["power"]["powerPrediction"] = true
E.db["unitframe"]["units"]["focus"]["power"]["text_format"] = "[power:current]"
E.db["unitframe"]["units"]["focus"]["threatStyle"] = "NONE"
E.db["unitframe"]["units"]["focus"]["width"] = 184
E.db["unitframe"]["units"]["focustarget"]["power"]["height"] = 3
E.db["unitframe"]["units"]["party"]["buffIndicator"]["size"] = 7
E.db["unitframe"]["units"]["party"]["buffs"]["anchorPoint"] = "RIGHT"
E.db["unitframe"]["units"]["party"]["buffs"]["perrow"] = 2
E.db["unitframe"]["units"]["party"]["buffs"]["sizeOverride"] = 20
E.db["unitframe"]["units"]["party"]["buffs"]["xOffset"] = -47
E.db["unitframe"]["units"]["party"]["debuffs"]["countFontSize"] = 11
E.db["unitframe"]["units"]["party"]["debuffs"]["perrow"] = 3
E.db["unitframe"]["units"]["party"]["debuffs"]["sizeOverride"] = 20
E.db["unitframe"]["units"]["party"]["debuffs"]["xOffset"] = 1
E.db["unitframe"]["units"]["party"]["growthDirection"] = "DOWN_RIGHT"
E.db["unitframe"]["units"]["party"]["healPrediction"]["enable"] = true
E.db["unitframe"]["units"]["party"]["health"]["text_format"] = ""
E.db["unitframe"]["units"]["party"]["height"] = 30
E.db["unitframe"]["units"]["party"]["horizontalSpacing"] = -5
E.db["unitframe"]["units"]["party"]["name"]["text_format"] = "[name:long]"
E.db["unitframe"]["units"]["party"]["power"]["height"] = 14
E.db["unitframe"]["units"]["party"]["power"]["text_format"] = ""
E.db["unitframe"]["units"]["party"]["privateAuras"]["enable"] = false
E.db["unitframe"]["units"]["party"]["rdebuffs"]["font"] = "Expressway"
E.db["unitframe"]["units"]["party"]["roleIcon"]["position"] = "BOTTOMLEFT"
E.db["unitframe"]["units"]["party"]["threatStyle"] = "BORDERS"
E.db["unitframe"]["units"]["party"]["verticalSpacing"] = 1
E.db["unitframe"]["units"]["party"]["width"] = 104
E.db["unitframe"]["units"]["pet"]["castbar"]["enable"] = false
E.db["unitframe"]["units"]["pet"]["castbar"]["height"] = 25
E.db["unitframe"]["units"]["pet"]["castbar"]["icon"] = false
E.db["unitframe"]["units"]["pet"]["castbar"]["spark"] = false
E.db["unitframe"]["units"]["pet"]["castbar"]["width"] = 85
E.db["unitframe"]["units"]["pet"]["enable"] = false
E.db["unitframe"]["units"]["pet"]["fader"]["enable"] = false
E.db["unitframe"]["units"]["pet"]["fader"]["range"] = false
E.db["unitframe"]["units"]["pet"]["healPrediction"]["enable"] = false
E.db["unitframe"]["units"]["pet"]["height"] = 15
E.db["unitframe"]["units"]["pet"]["name"]["text_format"] = ""
E.db["unitframe"]["units"]["pet"]["power"]["enable"] = false
E.db["unitframe"]["units"]["pet"]["power"]["height"] = 3
E.db["unitframe"]["units"]["pet"]["threatStyle"] = "NONE"
E.db["unitframe"]["units"]["pet"]["width"] = 184
E.db["unitframe"]["units"]["pettarget"]["power"]["height"] = 3
E.db["unitframe"]["units"]["player"]["RestIcon"]["enable"] = false
E.db["unitframe"]["units"]["player"]["aurabar"]["anchorPoint"] = "Below"
E.db["unitframe"]["units"]["player"]["aurabar"]["attachTo"] = "Debuffs"
E.db["unitframe"]["units"]["player"]["aurabar"]["enable"] = false
E.db["unitframe"]["units"]["player"]["buffs"]["anchorPoint"] = "BOTTOMLEFT"
E.db["unitframe"]["units"]["player"]["buffs"]["attachTo"] = "FRAME"
E.db["unitframe"]["units"]["player"]["buffs"]["growthX"] = "LEFT"
E.db["unitframe"]["units"]["player"]["buffs"]["yOffset"] = -1
E.db["unitframe"]["units"]["player"]["castbar"]["height"] = 20
E.db["unitframe"]["units"]["player"]["castbar"]["icon"] = false
E.db["unitframe"]["units"]["player"]["castbar"]["latency"] = false
E.db["unitframe"]["units"]["player"]["castbar"]["spark"] = false
E.db["unitframe"]["units"]["player"]["castbar"]["width"] = 184
E.db["unitframe"]["units"]["player"]["classbar"]["detachFromFrame"] = true
E.db["unitframe"]["units"]["player"]["classbar"]["detachedWidth"] = 301
E.db["unitframe"]["units"]["player"]["classbar"]["height"] = 8
E.db["unitframe"]["units"]["player"]["debuffs"]["anchorPoint"] = "BOTTOMLEFT"
E.db["unitframe"]["units"]["player"]["debuffs"]["enable"] = false
E.db["unitframe"]["units"]["player"]["debuffs"]["growthX"] = "LEFT"
E.db["unitframe"]["units"]["player"]["debuffs"]["yOffset"] = -16
E.db["unitframe"]["units"]["player"]["healPrediction"]["enable"] = false
E.db["unitframe"]["units"]["player"]["health"]["text_format"] = "[health:current-percent]"
E.db["unitframe"]["units"]["player"]["height"] = 30
E.db["unitframe"]["units"]["player"]["name"]["position"] = "TOPRIGHT"
E.db["unitframe"]["units"]["player"]["name"]["text_format"] = "[name:long]"
E.db["unitframe"]["units"]["player"]["name"]["xOffset"] = 2
E.db["unitframe"]["units"]["player"]["name"]["yOffset"] = 6
E.db["unitframe"]["units"]["player"]["orientation"] = "RIGHT"
E.db["unitframe"]["units"]["player"]["power"]["detachFromFrame"] = true
E.db["unitframe"]["units"]["player"]["power"]["detachedWidth"] = 301
E.db["unitframe"]["units"]["player"]["power"]["height"] = 8
E.db["unitframe"]["units"]["player"]["power"]["powerPrediction"] = true
E.db["unitframe"]["units"]["player"]["power"]["text_format"] = "[power:current]"
E.db["unitframe"]["units"]["player"]["power"]["xOffset"] = 2
E.db["unitframe"]["units"]["player"]["pvp"]["text_format"] = ""
E.db["unitframe"]["units"]["player"]["stagger"]["enable"] = false
E.db["unitframe"]["units"]["player"]["threatStyle"] = "NONE"
E.db["unitframe"]["units"]["player"]["width"] = 184
E.db["unitframe"]["units"]["raid1"]["buffIndicator"]["enable"] = false
E.db["unitframe"]["units"]["raid1"]["health"]["text_format"] = ""
E.db["unitframe"]["units"]["raid1"]["height"] = 23
E.db["unitframe"]["units"]["raid1"]["horizontalSpacing"] = 1
E.db["unitframe"]["units"]["raid1"]["name"]["position"] = "TOP"
E.db["unitframe"]["units"]["raid1"]["name"]["text_format"] = "[name:veryshort]"
E.db["unitframe"]["units"]["raid1"]["name"]["yOffset"] = -4
E.db["unitframe"]["units"]["raid1"]["numGroups"] = 8
E.db["unitframe"]["units"]["raid1"]["power"]["enable"] = false
E.db["unitframe"]["units"]["raid1"]["power"]["height"] = 3
E.db["unitframe"]["units"]["raid1"]["raidRoleIcons"]["enable"] = false
E.db["unitframe"]["units"]["raid1"]["rdebuffs"]["font"] = "Expressway"
E.db["unitframe"]["units"]["raid1"]["rdebuffs"]["fontSize"] = 11
E.db["unitframe"]["units"]["raid1"]["rdebuffs"]["size"] = 16
E.db["unitframe"]["units"]["raid1"]["rdebuffs"]["yOffset"] = 1
E.db["unitframe"]["units"]["raid1"]["roleIcon"]["enable"] = false
E.db["unitframe"]["units"]["raid1"]["threatStyle"] = "BORDERS"
E.db["unitframe"]["units"]["raid1"]["verticalSpacing"] = 1
E.db["unitframe"]["units"]["raid1"]["width"] = 64
E.db["unitframe"]["units"]["raid2"]["buffIndicator"]["enable"] = false
E.db["unitframe"]["units"]["raid2"]["health"]["text_format"] = ""
E.db["unitframe"]["units"]["raid2"]["height"] = 23
E.db["unitframe"]["units"]["raid2"]["horizontalSpacing"] = 1
E.db["unitframe"]["units"]["raid2"]["name"]["position"] = "TOP"
E.db["unitframe"]["units"]["raid2"]["name"]["text_format"] = "[name:veryshort]"
E.db["unitframe"]["units"]["raid2"]["name"]["yOffset"] = -4
E.db["unitframe"]["units"]["raid2"]["numGroups"] = 8
E.db["unitframe"]["units"]["raid2"]["power"]["height"] = 3
E.db["unitframe"]["units"]["raid2"]["raidRoleIcons"]["enable"] = false
E.db["unitframe"]["units"]["raid2"]["rdebuffs"]["enable"] = true
E.db["unitframe"]["units"]["raid2"]["rdebuffs"]["font"] = "Expressway"
E.db["unitframe"]["units"]["raid2"]["rdebuffs"]["fontSize"] = 11
E.db["unitframe"]["units"]["raid2"]["rdebuffs"]["size"] = 16
E.db["unitframe"]["units"]["raid2"]["rdebuffs"]["yOffset"] = 1
E.db["unitframe"]["units"]["raid2"]["threatStyle"] = "BORDERS"
E.db["unitframe"]["units"]["raid2"]["verticalSpacing"] = 1
E.db["unitframe"]["units"]["raid2"]["width"] = 64
E.db["unitframe"]["units"]["raid3"]["buffIndicator"]["enable"] = false
E.db["unitframe"]["units"]["raid3"]["health"]["text_format"] = ""
E.db["unitframe"]["units"]["raid3"]["height"] = 23
E.db["unitframe"]["units"]["raid3"]["horizontalSpacing"] = 1
E.db["unitframe"]["units"]["raid3"]["name"]["position"] = "TOP"
E.db["unitframe"]["units"]["raid3"]["name"]["text_format"] = "[name:veryshort]"
E.db["unitframe"]["units"]["raid3"]["name"]["yOffset"] = -4
E.db["unitframe"]["units"]["raid3"]["power"]["height"] = 3
E.db["unitframe"]["units"]["raid3"]["raidRoleIcons"]["enable"] = false
E.db["unitframe"]["units"]["raid3"]["rdebuffs"]["enable"] = true
E.db["unitframe"]["units"]["raid3"]["rdebuffs"]["font"] = "Expressway"
E.db["unitframe"]["units"]["raid3"]["rdebuffs"]["fontSize"] = 11
E.db["unitframe"]["units"]["raid3"]["rdebuffs"]["size"] = 16
E.db["unitframe"]["units"]["raid3"]["rdebuffs"]["yOffset"] = 1
E.db["unitframe"]["units"]["raid3"]["threatStyle"] = "BORDERS"
E.db["unitframe"]["units"]["raid3"]["verticalSpacing"] = 1
E.db["unitframe"]["units"]["raid3"]["width"] = 64
E.db["unitframe"]["units"]["tank"]["enable"] = false
E.db["unitframe"]["units"]["target"]["aurabar"]["anchorPoint"] = "Below"
E.db["unitframe"]["units"]["target"]["aurabar"]["attachTo"] = "Debuffs"
E.db["unitframe"]["units"]["target"]["aurabar"]["enable"] = false
E.db["unitframe"]["units"]["target"]["buffs"]["anchorPoint"] = "BOTTOMLEFT"
E.db["unitframe"]["units"]["target"]["buffs"]["enable"] = false
E.db["unitframe"]["units"]["target"]["buffs"]["priority"] = "Blacklist,Whitelist,blockNoDuration,Personal,nonPersonal"
E.db["unitframe"]["units"]["target"]["buffs"]["yOffset"] = -1
E.db["unitframe"]["units"]["target"]["castbar"]["height"] = 20
E.db["unitframe"]["units"]["target"]["castbar"]["icon"] = false
E.db["unitframe"]["units"]["target"]["castbar"]["spark"] = false
E.db["unitframe"]["units"]["target"]["castbar"]["width"] = 184
E.db["unitframe"]["units"]["target"]["debuffs"]["anchorPoint"] = "BOTTOMLEFT"
E.db["unitframe"]["units"]["target"]["debuffs"]["attachTo"] = "FRAME"
E.db["unitframe"]["units"]["target"]["debuffs"]["enable"] = false
E.db["unitframe"]["units"]["target"]["debuffs"]["maxDuration"] = 0
E.db["unitframe"]["units"]["target"]["debuffs"]["priority"] = "Blacklist,Personal,nonPersonal"
E.db["unitframe"]["units"]["target"]["debuffs"]["yOffset"] = -16
E.db["unitframe"]["units"]["target"]["fader"]["enable"] = false
E.db["unitframe"]["units"]["target"]["fader"]["range"] = false
E.db["unitframe"]["units"]["target"]["healPrediction"]["enable"] = false
E.db["unitframe"]["units"]["target"]["health"]["position"] = "LEFT"
E.db["unitframe"]["units"]["target"]["health"]["text_format"] = "[health:current-percent]"
E.db["unitframe"]["units"]["target"]["health"]["xOffset"] = 2
E.db["unitframe"]["units"]["target"]["height"] = 30
E.db["unitframe"]["units"]["target"]["name"]["position"] = "TOPRIGHT"
E.db["unitframe"]["units"]["target"]["name"]["text_format"] = "[name:long]"
E.db["unitframe"]["units"]["target"]["name"]["xOffset"] = 2
E.db["unitframe"]["units"]["target"]["name"]["yOffset"] = 6
E.db["unitframe"]["units"]["target"]["power"]["detachFromFrame"] = true
E.db["unitframe"]["units"]["target"]["power"]["detachedWidth"] = 301
E.db["unitframe"]["units"]["target"]["power"]["enable"] = false
E.db["unitframe"]["units"]["target"]["power"]["height"] = 13
E.db["unitframe"]["units"]["target"]["power"]["position"] = "RIGHT"
E.db["unitframe"]["units"]["target"]["power"]["powerPrediction"] = true
E.db["unitframe"]["units"]["target"]["power"]["text_format"] = "[power:current]"
E.db["unitframe"]["units"]["target"]["threatStyle"] = "NONE"
E.db["unitframe"]["units"]["target"]["width"] = 184
E.db["unitframe"]["units"]["targettarget"]["debuffs"]["enable"] = false
E.db["unitframe"]["units"]["targettarget"]["enable"] = false
E.db["unitframe"]["units"]["targettarget"]["fader"]["enable"] = false
E.db["unitframe"]["units"]["targettarget"]["fader"]["range"] = false
E.db["unitframe"]["units"]["targettarget"]["height"] = 30
E.db["unitframe"]["units"]["targettarget"]["name"]["text_format"] = "[name:veryshort]"
E.db["unitframe"]["units"]["targettarget"]["power"]["enable"] = false
E.db["unitframe"]["units"]["targettarget"]["power"]["height"] = 3
E.db["unitframe"]["units"]["targettarget"]["width"] = 75
E.db["unitframe"]["units"]["targettargettarget"]["power"]["height"] = 3
E.global["datatexts"]["customPanels"]["Info Panel"]["name"] = "Info Panel"
E.global["datatexts"]["settings"]["System"]["ShowOthers"] = false
E.global["datatexts"]["settings"]["System"]["latency"] = "HOME"
E.private["WT"]["maps"]["minimapButtons"]["enable"] = false
E.private["general"]["minimap"]["enable"] = false
E.private["general"]["worldMap"] = false
E.private["install_complete"] = 13.7
E.private["skins"]["parchmentRemoverEnable"] = true

		-- If you want to modify the base layout according to
		-- certain conditions then this is how you could do it
		if layout == "tank" then
			-- Make some changes to the layout posted above
		elseif layout == "dps" then
			-- Make some other changes
		elseif layout == "healer" then
			-- Make some different changes
		end

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
			PluginInstallFrame.Option1:SetScript("OnClick", function() SetupLayout("tank") end)
			PluginInstallFrame.Option1:SetText("AscendedUI Basic")
		end,
		[3] = function()
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
		[3] = "Installation Complete",
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
