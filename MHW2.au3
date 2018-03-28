#Region ;**** Directives created by AutoIt3Wrapper_GUI ****
#AutoIt3Wrapper_Outfile_x64=..\..\..\MHW Builder\MHWBuilder.Exe
#AutoIt3Wrapper_Compression=4
#AutoIt3Wrapper_UseUpx=y
#AutoIt3Wrapper_Run_Obfuscator=Y
#Obfuscator_Parameters=/SF /SV /OM /CS=0 /CN=0
#AutoIt3Wrapper_Add_Constants=n
#EndRegion ;**** Directives created by AutoIt3Wrapper_GUI ****
; *** Start added by AutoIt3Wrapper ***
#include <GUIConstantsEx.au3>
#include <WindowsConstants.au3>
#include <StaticConstants.au3>
#include <ColorConstants.au3>
#include <GuiButton.au3>
#include <MsgBoxConstants.au3>
#include <StructureConstants.au3>
#include <WinAPIConstants.au3>
#include <GDIPlus.au3>
#include <GuiComboBox.au3>
#include <ComboConstants.au3>
#include <WinAPISysWin.au3>
#include <File.au3>
#include <EditConstants.au3>

#include <string.au3>
#include <array.au3>

Global Enum $GUI_EN_TITLE_SLIDE, $GUI_EN_TITLE_DROP, $GUI_EN_TITLE_BLINK

;thanks to raindancer for these
Global Const $GUI_EN_ANI_FADEIN = 0x80000
Global Const $GUI_EN_ANI_FADEOUT = 0x90000
Global Const $GUI_EN_ANI_FROM_LEFT = 0x40001
Global Const $GUI_EN_ANI_FROM_RIGHT = 0x40002
Global Const $GUI_EN_ANI_FROM_TOP = 0x40004
Global Const $GUI_EN_ANI_FROM_BOTTOM = 0x40008
Global Const $GUI_EN_ANI_FROM_TOPLEFT = 0x40005
Global Const $GUI_EN_ANI_FROM_TOPRIGHT = 0x40006
Global Const $GUI_EN_ANI_FROM_BOTTOMLEFT = 0x40009
Global Const $GUI_EN_ANI_FROM_BOTTOMRIGHT = 0x4000A
Global Const $GUI_EN_ANI_TO_LEFT = 0x50002
Global Const $GUI_EN_ANI_TO_RIGHT = 0x50001
Global Const $GUI_EN_ANI_TO_TOP = 0x50008
Global Const $GUI_EN_ANI_TO_BOTTOM = 0x50004
Global Const $GUI_EN_ANI_TO_TOPLEFT = 0x5000A
Global Const $GUI_EN_ANI_TO_TOPRIGHT = 0x50009
Global Const $GUI_EN_ANI_TO_BOTTOMLEFT = 0x50006
Global Const $GUI_EN_ANI_TO_BOTTOMRIGHT = 0x50005
Global Const $GUI_EN_ANI_EXPLODE = 0x40010
Global Const $GUI_EN_ANI_IMPLODE = 0x50010


Opt("GUIOnEventMode", 1)
HotKeySet("!{ESCape}", "quit")
GLobal $quit_flag = true

Global $SkillsWeHadCounter = 0

Global $label_fade_delay = 15
Global $gui_fade_delay = 150
Global $button_fade_delay = 25

Global $MySetName = "test set"

GLobal $MainFrame = GUICreate("MHW Builder", 750, 464, -1, -1, BitOR($WS_POPUP,$WS_BORDER))
;~ GUISetBkColor($Color_black)
GLobal $pic = GUICtrlCreatePic(@WorkingDir & "\Images\BG.bmp", 0, 0, 750, 465)
GUICtrlSetState(-1, $GUI_DISABLE)

Opt("GUICoordMode", 1)
GLobal $MenuGroup = GUICtrlCreateGroup("", 5, 0, 740, 60)
GUICtrlCreateGroup("", 400, 396, 150, 62)

;; Equip Group

GLobal $winpos = WinGetPos("MHW Builder")

GUISetState(@SW_ENABLE, $MainFrame)
Global $OpenMenuButtonGui = GUICreate("SetGUI", 45, 45, $winpos[0]+10, $winpos[1]+10, $WS_POPUP, '', $MainFrame)
GUICtrlCreatePic(@WorkingDir & "\Images\UI\BorderMenu.bmp", 0, 0, 45, 45)
GUICtrlSetState(-1, $GUI_DISABLE)
GLobal $OpenMenuButton = GUICtrlCreatePic(@WorkingDir & "\Images\UI\OpenMenu.bmp", 3, 3, 39, 39)
GUICtrlSetOnEvent($OpenMenuButton, "show_sets_gui")
GUISetState(@SW_SHOW, $OpenMenuButtonGui)
;~ GUICtrlSetState(-1, $GUI_DISABLE)

Global $SaveMenuButtonGui = GUICreate("SetGUI", 45, 45, $winpos[0]+59, $winpos[1]+10, $WS_POPUP, '', $MainFrame)
GUICtrlCreatePic(@WorkingDir & "\Images\UI\BorderMenu.bmp", 0, 0, 45, 45)
GUICtrlSetState(-1, $GUI_DISABLE)
GLobal $SaveMenuButton = GUICtrlCreatePic(@WorkingDir & "\Images\UI\SaveMenu.bmp", 3, 3, 39, 39)
GUICtrlSetOnEvent($SaveMenuButton, "save_set")
GUISetState(@SW_SHOW, $SaveMenuButtonGui)
GUISetState(@SW_ENABLE, $MainFrame)


Global $SaveMenuButtonGui = GUICreate("SetGUI", 45, 45, $winpos[0]+108, $winpos[1]+10, $WS_POPUP, '', $MainFrame)
GUICtrlCreatePic(@WorkingDir & "\Images\UI\BorderMenu.bmp", 0, 0, 45, 45)
GUICtrlSetState(-1, $GUI_DISABLE)
GLobal $SaveMenuButton = GUICtrlCreatePic(@WorkingDir & "\Images\UI\SaveAsMenu.bmp", 3, 3, 39, 39)
GUICtrlSetOnEvent($SaveMenuButton, "save_set_as_menu")
GUISetState(@SW_SHOW, $SaveMenuButtonGui)
GUISetState(@SW_ENABLE, $MainFrame)

Global $ExitMenuButtonGui = GUICreate("SetGUI", 45, 45, $winpos[0]+697, $winpos[1]+10, $WS_POPUP, '', $MainFrame)
GUICtrlCreatePic(@WorkingDir & "\Images\UI\BorderMenu.bmp", 0, 0, 45, 45)
GUICtrlSetState(-1, $GUI_DISABLE)
GLobal $ExitMenuButton = GUICtrlCreatePic(@WorkingDir & "\Images\UI\CloseMenu.bmp", 3, 3, 39, 39)
GUICtrlSetOnEvent($ExitMenuButton, "quit")
GUISetState(@SW_SHOW, $ExitMenuButtonGui)
GUISetState(@SW_ENABLE, $MainFrame)

Opt("GUICoordMode", 1)
GLobal $EquipGroup = GUICtrlCreateGroup("", 5, 60, 390, 398)

;; buttons
Opt("GUICoordMode", 0)
GUICtrlCreatePic(@WorkingDir & "\Images\UI\ArmorBorder.bmp", 6, 12, 50, 50)
GUICtrlSetState(-1, $GUI_DISABLE)
GLobal $WeaponButton = GUICtrlCreatePic(@WorkingDir & "\Images\UI\Weapon.bmp", 3, 3, 44, 44)

GUICtrlCreatePic(@WorkingDir & "\Images\UI\ArmorBorder.bmp", -3, 52, 50, 50)
GUICtrlSetState(-1, $GUI_DISABLE)
GLobal $HeadButton = GUICtrlCreatePic(@WorkingDir & "\Images\UI\ArmorHead.bmp", 3, 3, 44, 44)

GUICtrlCreatePic(@WorkingDir & "\Images\UI\ArmorBorder.bmp", -3, 52, 50, 50)
GUICtrlSetState(-1, $GUI_DISABLE)
GLobal $ChestButton = GUICtrlCreatePic(@WorkingDir & "\Images\UI\ArmorChest.bmp", 3, 3, 44, 44)

GUICtrlCreatePic(@WorkingDir & "\Images\UI\ArmorBorder.bmp", -3, 52, 50, 50)
GUICtrlSetState(-1, $GUI_DISABLE)
GLobal $HandsButton = GUICtrlCreatePic(@WorkingDir & "\Images\UI\ArmorHands.bmp", 3, 3, 44, 44)

GUICtrlCreatePic(@WorkingDir & "\Images\UI\ArmorBorder.bmp", -3, 52, 50, 50)
GUICtrlSetState(-1, $GUI_DISABLE)
GLobal $BeltButton = GUICtrlCreatePic(@WorkingDir & "\Images\UI\ArmorBelt.bmp", 3, 3, 44, 44)

GUICtrlCreatePic(@WorkingDir & "\Images\UI\ArmorBorder.bmp", -3, 52, 50, 50)
GUICtrlSetState(-1, $GUI_DISABLE)
GLobal $CharmButton = GUICtrlCreatePic(@WorkingDir & "\Images\UI\ArmorBoots.bmp", 3, 3, 44, 44)

GUICtrlCreatePic(@WorkingDir & "\Images\UI\ArmorBorder.bmp", -3, 52, 50, 50)
GUICtrlSetState(-1, $GUI_DISABLE)
GLobal $HeadButton = GUICtrlCreatePic(@WorkingDir & "\Images\UI\Charm.bmp", 3, 3, 44, 44)

;; dropdown
Opt("GUICoordMode", 1)
GLobal $WeaponCombo = GUICtrlCreateCombo("", 66, 72, 231, 17, BitOR($CBS_DROPDOWNLIST,$WS_VSCROLL))
Opt("GUICoordMode", 0)
GLobal $HeadCombo = GUICtrlCreateCombo("", 0, 55, 324, 17, BitOR($CBS_DROPDOWNLIST,$WS_VSCROLL))
GLobal $ChestCombo = GUICtrlCreateCombo("", 0, 55, 324, 17, BitOR($CBS_DROPDOWNLIST,$WS_VSCROLL))
GLobal $HandsCombo = GUICtrlCreateCombo("", 0, 55, 324, 17, BitOR($CBS_DROPDOWNLIST,$WS_VSCROLL))
GLobal $BeltCombo = GUICtrlCreateCombo("", 0, 55, 324, 17, BitOR($CBS_DROPDOWNLIST,$WS_VSCROLL))
GLobal $BootsCombo = GUICtrlCreateCombo("", 0, 55, 324, 17, BitOR($CBS_DROPDOWNLIST,$WS_VSCROLL))
GLobal $CharmCombo = GUICtrlCreateCombo("", 0, 55, 324, 17, BitOR($CBS_DROPDOWNLIST,$WS_VSCROLL))

;; Quick Status Group
Opt("GUICoordMode", 1)
GLobal $QuickStatWepGroup = GUICtrlCreateGroup("", 400, 60, 150, 64)
Opt("GUICoordMode", 0)

; Total Stats Group
Opt("GUICoordMode", 1)
GLobal $QuickStatWepGroup = GUICtrlCreateGroup("", 555, 60, 190, 398)
;~ $Graphic1 = GUICtrlCreateGraphic(555, 66, 190, 394)
;~ GUICtrlSetColor(-1, 0xD4D0C8)
;~ GUICtrlSetBkColor(-1, 0xA6CAF0)

; Creating Weapon Var and Dropdown

;~ GUISetState(@SW_SHOW, $MainFrame)



;GUIS

;; socket
create_slots_gui()
create_quick_stat_gui()
create_augment_gui()
create_stat_defense_gui()
create_stat_attack_gui()
create_stat_health_gui()
create_bonus_stat_gui()
Global $GemListSorted[150][150]
create_jewel_gui()
create_upgrade_gui()
create_save_as_gui()


;~ GUISetState(@SW_SHOW, $AugmentFrame1
Opt("GUICoordMode", 1)
GLobal $SkillsFrame = GUICreate("Test", 195, 404, $winpos[0]+765, $winpos[1]+60, BitOR($WS_POPUP,$WS_BORDER,$WS_EX_TOOLWINDOW), "", $MainFrame)
GLobal $pic3 = GUICtrlCreatePic(@WorkingDir & "\Images\BG.bmp", 0, -60, 750, 466)
GLobal $MenuGroup = GUICtrlCreateGroup("", 6, 0, 183, 398)
GUISetState(@SW_DISABLE, $SkillsFrame)

Local $init_trigger = true

init_skills()


GUISetState(@SW_SHOW, $MainFrame)
create_additional_buttons()

Global $WeaponName
Global $WeaponType
Global $WeaponBloatMod
Global $WeaponRaw
Global $WeaponElementalType
Global $WeaponElementalRaw
Global $WeaponElementalHidden
Global $WeaponAffinity
Global $WeaponDefenseBonus
Global $WeaponRarity
Global $WeaponSlotLevels[4]
Global $WeaponSlotLevelsOld[4] = [0,0,0,0]
Global $WeaponSlotsGems[4]
Global $WeaponAugments[4]

init_weapon()

Global $HeadDef
Global $HeadRarity
Global $HeadSkills[3][3]
Global $HeadSlotLevels[4]
Global $HeadSlotLevelsOld[4] = [0,0,0,0]
Global $HeadSlotsGems[4]
Global $HeadList = IniReadSectionNames(@WorkingDir & "\DB\Head.ini")
Global $HeadUpgrade = 0
init_head()


Global $ChestDef
Global $ChestRarity
Global $ChestSkills[3][3]
Global $ChestSlotLevels[4]
Global $ChestSlotLevelsOld[4] = [0,0,0,0]
Global $ChestSlotsGems[4]
Global $ChestList = IniReadSectionNames(@WorkingDir & "\DB\Chest.ini")
Global $ChestUpgrade = 0
init_chest()


Global $HandsDef
Global $HandsRarity
Global $HandsSkills[3][3]
Global $HandsSlotLevels[4]
Global $HandsSlotLevelsOld[4] = [0,0,0,0]
Global $HandsSlotsGems[4]
Global $HandsList = IniReadSectionNames(@WorkingDir & "\DB\Hands.ini")
Global $HandsUpgrade = 0
init_hands()


Global $BeltDef
Global $BeltRarity
Global $BeltSkills[3][3]
Global $BeltSlotLevels[4]
Global $BeltSlotLevelsOld[4] = [0,0,0,0]
Global $BeltSlotsGems[4]
Global $BeltList = IniReadSectionNames(@WorkingDir & "\DB\Belt.ini")
Global $BeltUpgrade = 0
init_belt()


Global $BootsDef
Global $BootsRarity
Global $BootsSkills[3][3]
Global $BootsSlotLevels[4]
Global $BootsSlotLevelsOld[4] = [0,0,0,0]
Global $BootsSlotsGems[4]
Global $BootsList = IniReadSectionNames(@WorkingDir & "\DB\Boots.ini")
Global $BootsUpgrade = 0
init_boots()

Global $CharmList = IniReadSectionNames(@WorkingDir & "\DB\Charms.ini")
Global $CharmSkills[3][3]
Global $CharmUpgrade
Global $CharmUpgradeMax
init_charm()

$init_trigger = false
init_skills_template()
;~ GUISetState(@SW_SHOW, $SkillsFrame)

Global $update_skills_running = False
Global $update_skills_required = False
Global $skills_menu_shown = False
Global $skills_menu_show_initiated = False
compile_skills()

Global $Defense_stats[7]
Global $Attack_stats[15]
Global $update_defense_stats_running = False
Global $update_defense_stats_required = False

update_defense_stats()
create_loading_gui()

;~ GUICtrlSetState(-1, $GUI_DISABLE)
;~ show_sets_gui()



while $quit_flag

;~ 	Switch GUIGetMsg()
;~         Case $GUI_EVENT_CLOSE
;~             ExitLoop
;~ 	EndSwitch
	If $update_skills_required and not($update_skills_running) and not($update_defense_stats_running) Then
		$update_skills_required = False
		compile_skills()
	EndIf


	If $update_defense_stats_required and not($update_defense_stats_running) and Not ($update_skills_running) Then
		$update_defense_stats_required = False
		update_defense_stats()
	EndIf
	sleep(500)
WEnd

Func quit()
	$quit_flag = false
endfunc

Func create_save_as_gui()

	Global $SaveAsGui = GUICreate("", 150, 77, $winpos[0]+300, $winpos[1]+196, $WS_POPUP, '', $MainFrame)
	Global $SaveAsGuiBG = GUICtrlCreatePic(@WorkingDir & "\Images\UI\SaveAsBorder.bmp", 0, 0, 150, 77)
	GUICtrlSetState($SaveAsGuiBG, $GUI_DISABLE)
	GUICtrlCreateLabel("Name your Set", 25, 5, 100, 20, $SS_CENTER)
	GUICtrlSetColor(-1, $COLOR_WHITE)
	GUICtrlSetBkColor(-1, $GUI_BKCOLOR_TRANSPARENT)
	GUICtrlSetFont(-1,9, 800)
	Global $MyNewSetName = GUICtrlCreateEdit("My New Set", 25, 23, 100, 17, $ES_WANTRETURN)

	Global $SaveAsOkButton = GUICtrlCreateButton("OK", 18, 48, 55, 25, $BS_BITMAP)
	GUICtrlSetImage($SaveAsOkButton, @WorkingDir & "\Images\UI\SaveButton.bmp")
	GUICtrlSetOnEvent($SaveAsOkButton, "save_as")
	Global $SaveAsCancelButton = GUICtrlCreateButton("Cancel", 77, 48, 55, 25, $BS_BITMAP)
	GUICtrlSetImage($SaveAsCancelButton, @WorkingDir & "\Images\UI\CancelButton.bmp")
	GUICtrlSetOnEvent($SaveAsCancelButton, "save_set_as_close")
;~ 	GUICtrlCreatePic(@WorkingDir & "\Images\UI\HealthBorder.bmp",  0, 0, 188, 39)
;~ 	$Defenses[11] = GUICtrlCreatePic(@WorkingDir & "\Images\UI\bk\HealthIcon.bmp",  5, 6, 12, 12)
;~ 	Opt("GUICoordMode", 0)
;~ 	$Defenses[13] = GUICtrlCreatePic(@WorkingDir & "\Images\UI\bk\StaminaIcon.bmp", 0, 15, 12, 12)
;~ 	Opt("GUICoordMode", 1)
;~ 	$Healths[21] = GUICtrlCreateLabel("Health", 20, 5, 100, 13)
;~ 	Opt("GUICoordMode", 0)
;~ 	$Healths[22] = GUICtrlCreateLabel("Stamina", 0, 15, 100, 12)

;~ 	For $i = 21 to 22
;~ 		GUICtrlSetColor($Healths[$i], $COLOR_WHITE)
;~ 		GUICtrlSetBkColor($Healths[$i], 0x2B2C2A)
;~ 		GUICtrlSetFont ($Healths[$i], 8.5, 800)
;~ 	Next

;~ 	Opt("GUICoordMode", 1)
;~ 	$Healths[31] = GUICtrlCreateLabel("100", 162, 5, 17, 13,$SS_RIGHT)
;~ 	Opt("GUICoordMode", 0)
;~ 	$Healths[32] = GUICtrlCreateLabel("100", 0, 15, 17, 13,$SS_RIGHT)

;~ 	For $i = 31 to 32
;~ 		GUICtrlSetColor($Healths[$i], $COLOR_WHITE)
;~ 		GUICtrlSetBkColor($Healths[$i], 0x2B2C2A)
;~ 		GUICtrlSetFont ($Healths[$i], 8.5, 800)
;~ 	Next

;~ 	GUISetState(@SW_SHOW, $SaveAsGui)
EndFunc

Func create_additional_buttons()
;~ 	GUICtrlSetState(@SW_SHOW, $MainFrame)
	Opt("GUICoordMode", 1)
	Global $ShowBuffsButton = GUICtrlCreateButton('',475,67,74,28, $BS_BITMAP)
	GUICtrlSetImage($ShowBuffsButton, @WorkingDir & "\Images\UI\BuffsButton.bmp")
	Global $ShowSKillsButton = GUICtrlCreateButton('',475,95,74,28, $BS_BITMAP)
	GUICtrlSetImage($ShowSKillsButton, @WorkingDir & "\Images\UI\ShowSkillsButton.bmp")
	GUICtrlSetOnEvent($ShowSKillsButton, "show_skills")
;~ 	)

;~ _GUICtrlButton_SetImage(

EndFunc

Func create_stat_defense_gui()
	Global $Defenses[50]
	Opt("GUICoordMode", 1)
	$Defenses[1] = GUICreate("", 188, 100, $winpos[0]+557, $winpos[1]+358, $WS_POPUP, '', $MainFrame)
	GUICtrlCreatePic(@WorkingDir & "\Images\UI\DefBorder.bmp",  0, 0, 188, 100)
	$Defenses[11] = GUICtrlCreatePic(@WorkingDir & "\Images\UI\bk\DefDef.bmp",  4, 5, 15, 15)
	Opt("GUICoordMode", 0)
	$Defenses[13] = GUICtrlCreatePic(@WorkingDir & "\Images\UI\bk\DefFire.bmp", 0, 15, 15, 15)
	$Defenses[14] = GUICtrlCreatePic(@WorkingDir & "\Images\UI\bk\DefWater.bmp", 0, 15, 15, 15)
	$Defenses[15] = GUICtrlCreatePic(@WorkingDir & "\Images\UI\bk\DefThu.bmp", 0, 15, 15, 15)
	$Defenses[16] = GUICtrlCreatePic(@WorkingDir & "\Images\UI\bk\DefIce.bmp", 0, 15, 15, 15)
	$Defenses[16] = GUICtrlCreatePic(@WorkingDir & "\Images\UI\bk\DefDrg.bmp", 0, 15, 15, 15)
	Opt("GUICoordMode", 1)
	$Defenses[21] = GUICtrlCreateLabel("Defense", 20, 5, 100, 13)
	Opt("GUICoordMode", 0)
	$Defenses[22] = GUICtrlCreateLabel("vs. Fire", 0, 15, 100, 13)
	$Defenses[23] = GUICtrlCreateLabel("vs. Water", 0, 15, 100, 13)
	$Defenses[24] = GUICtrlCreateLabel("vs. Thunder", 0, 15, 100, 13)
	$Defenses[25] = GUICtrlCreateLabel("vs. Ice", 0, 15, 100, 13)
	$Defenses[26] = GUICtrlCreateLabel("vs. Dragon", 0, 15, 100, 13)

	For $i = 21 to 26
		GUICtrlSetColor($Defenses[$i], $COLOR_WHITE)
		GUICtrlSetBkColor($Defenses[$i], 0x2B2C2A)
		GUICtrlSetFont ($Defenses[$i], 8.5, 800)
	Next

	Opt("GUICoordMode", 1)
	$Defenses[31] = GUICtrlCreateLabel("160", 159, 5, 20, 13,$SS_RIGHT)
	Opt("GUICoordMode", 0)
	$Defenses[32] = GUICtrlCreateLabel("10", 0, 15, 20, 13,$SS_RIGHT)
	$Defenses[33] = GUICtrlCreateLabel("0", 0, 15, 20, 13,$SS_RIGHT)
	$Defenses[34] = GUICtrlCreateLabel("0", 0, 15, 20, 13,$SS_RIGHT)
	$Defenses[35] = GUICtrlCreateLabel("0", 0, 15, 20, 13,$SS_RIGHT)
	$Defenses[36] = GUICtrlCreateLabel("0", 0, 15, 20, 13,$SS_RIGHT)

	For $i = 31 to 36
		GUICtrlSetColor($Defenses[$i], $COLOR_WHITE)
		GUICtrlSetBkColor($Defenses[$i], 0x2B2C2A)
		GUICtrlSetFont ($Defenses[$i], 8.5, 800)
	Next

	GUISetState(@SW_SHOW, $Defenses[1])
EndFunc

Func create_stat_attack_gui()
	Global $Attacks[100]
	Opt("GUICoordMode", 1)
	$Attacks[1] = GUICreate("", 188, 69, $winpos[0]+557, $winpos[1]+289, $WS_POPUP, '', $MainFrame)
	GUICtrlCreatePic(@WorkingDir & "\Images\UI\AttBorder.bmp",  0, 0, 188, 69)
	GUISetBkColor(0x000000, $Attacks[1])
	$Attacks[11] = GUICtrlCreatePic(@WorkingDir & "\Images\UI\bk\AttAtt.bmp",  4, 7, 13, 13)
	Opt("GUICoordMode", 0)
	$Attacks[13] = GUICtrlCreatePic(@WorkingDir & "\Images\UI\bk\AttSharp.bmp", 0, 15, 13, 13)
	$Attacks[14] = GUICtrlCreatePic(@WorkingDir & "\Images\UI\bk\AttElem.bmp", 0, 15, 13, 13)
	$Attacks[17] = GUICtrlCreatePic(@WorkingDir & "\Images\UI\bk\AttAff.bmp", 0, 15, 13, 13)

	Opt("GUICoordMode", 1)
	$Attacks[21] = GUICtrlCreateLabel("Attack", 20, 6, 100, 13)
	Opt("GUICoordMode", 0)
	$Attacks[22] = GUICtrlCreateLabel("Sharpness", 0, 15, 100, 13)
	$Attacks[23] = GUICtrlCreateLabel("Element", 0, 15, 100, 13)
	$Attacks[24] = GUICtrlCreateLabel("Affinity", 0, 15, 100, 13)

	For $i = 21 to 27
		GUICtrlSetColor($Attacks[$i], $COLOR_WHITE)
		GUICtrlSetBkColor($Attacks[$i], 0x2B2C2A)
		GUICtrlSetFont ($Attacks[$i], 8.5, 800)
	Next

	Opt("GUICoordMode", 1)
	$Attacks[31] = GUICtrlCreateLabel("864", 149, 6, 30, 13,$SS_RIGHT)
	Opt("GUICoordMode", 0)
	$Attacks[32] = GUICtrlCreateLabel("Soon", 0, 15, 30, 13,$SS_RIGHT)
	$Attacks[33] = GUICtrlCreateLabel("420", 0, 15, 30, 13,$SS_RIGHT)
	$Attacks[34] = GUICtrlCreateLabel("0%", 0, 15, 30, 13,$SS_RIGHT)

	For $i = 31 to 37
		GUICtrlSetColor($Attacks[$i], $COLOR_WHITE)
		GUICtrlSetBkColor($Attacks[$i], 0x2B2C2A)
		GUICtrlSetFont ($Attacks[$i], 8.5, 800)
	Next

	GUISetState(@SW_SHOW, $Attacks[1])
EndFunc

Func create_stat_health_gui()
	Global $Healths[50]
	Opt("GUICoordMode", 1)
	$Healths[1] = GUICreate("", 188, 39, $winpos[0]+557, $winpos[1]+250, $WS_POPUP, '', $MainFrame)
	GUICtrlCreatePic(@WorkingDir & "\Images\UI\HealthBorder.bmp",  0, 0, 188, 39)
	$Defenses[11] = GUICtrlCreatePic(@WorkingDir & "\Images\UI\bk\HealthIcon.bmp",  5, 6, 12, 12)
	Opt("GUICoordMode", 0)
	$Defenses[13] = GUICtrlCreatePic(@WorkingDir & "\Images\UI\bk\StaminaIcon.bmp", 0, 15, 12, 12)
	Opt("GUICoordMode", 1)
	$Healths[21] = GUICtrlCreateLabel("Health", 20, 5, 100, 13)
	Opt("GUICoordMode", 0)
	$Healths[22] = GUICtrlCreateLabel("Stamina", 0, 15, 100, 12)

	For $i = 21 to 22
		GUICtrlSetColor($Healths[$i], $COLOR_WHITE)
		GUICtrlSetBkColor($Healths[$i], 0x2B2C2A)
		GUICtrlSetFont ($Healths[$i], 8.5, 800)
	Next

	Opt("GUICoordMode", 1)
	$Healths[31] = GUICtrlCreateLabel("100", 162, 5, 17, 13,$SS_RIGHT)
	Opt("GUICoordMode", 0)
	$Healths[32] = GUICtrlCreateLabel("100", 0, 15, 17, 13,$SS_RIGHT)

	For $i = 31 to 32
		GUICtrlSetColor($Healths[$i], $COLOR_WHITE)
		GUICtrlSetBkColor($Healths[$i], 0x2B2C2A)
		GUICtrlSetFont ($Healths[$i], 8.5, 800)
	Next

	GUISetState(@SW_SHOW, $Healths[1])
EndFunc

Func create_bonus_stat_gui()
	Global $Attack_bonus[100]
	Opt("GUICoordMode", 1)
	$Attack_bonus[1] = GUICreate("", 188, 129, $winpos[0]+557, $winpos[1]+95, $WS_POPUP, '', $MainFrame)
	GUICtrlCreatePic(@WorkingDir & "\Images\UI\BonusAttBorder.bmp",  0, 0, 188, 129)
;~ 	GUISetBkColor(0x000000, $Attack_bonus[1])
	$Attack_bonus[11] = GUICtrlCreatePic(@WorkingDir & "\Images\UI\bk\AttAtt.bmp",  4, 7, 13, 13)
	Opt("GUICoordMode", 0)
	$Attack_bonus[12] = GUICtrlCreatePic(@WorkingDir & "\Images\UI\bk\AttElem.bmp", 0, 15, 13, 13)
	$Attack_bonus[13] = GUICtrlCreatePic(@WorkingDir & "\Images\UI\bk\AttAtt.bmp", 0, 15, 13, 13)
	$Attack_bonus[14] = GUICtrlCreatePic(@WorkingDir & "\Images\UI\bk\AttElem.bmp", 0, 15, 13, 13)
	$Attack_bonus[15] = GUICtrlCreatePic(@WorkingDir & "\Images\UI\bk\AttAff.bmp", 0, 15, 13, 13)
	$Attack_bonus[16] = GUICtrlCreatePic(@WorkingDir & "\Images\UI\bk\AttAff.bmp", 0, 15, 13, 13)
	$Attack_bonus[17] = GUICtrlCreatePic(@WorkingDir & "\Images\UI\bk\AttSharp.bmp", 0, 15, 13, 13)
	$Attack_bonus[18] = GUICtrlCreatePic(@WorkingDir & "\Images\UI\bk\AttSharp.bmp", 0, 15, 13, 13)

	Opt("GUICoordMode", 1)
	$Attack_bonus[21] = GUICtrlCreateLabel("Effective Raw", 20, 6, 150, 13)
	Opt("GUICoordMode", 0)

	$Attack_bonus[22] = GUICtrlCreateLabel("Effective Element", 0, 15, 150, 13)
	$Attack_bonus[23] = GUICtrlCreateLabel("True Raw", 0, 15, 150, 13)
	$Attack_bonus[24] = GUICtrlCreateLabel("True Element", 0, 15, 150, 13)
	$Attack_bonus[25] = GUICtrlCreateLabel("Raw Crit Mod", 0, 15, 150, 13)
	$Attack_bonus[26] = GUICtrlCreateLabel("Elem. Crit Mod", 0, 15, 150, 13)
	$Attack_bonus[27] = GUICtrlCreateLabel("Sharp. Raw Mod", 0, 15, 150, 13)
	$Attack_bonus[28] = GUICtrlCreateLabel("Sharp. Elem. Mod", 0, 15, 150, 13)

	For $i = 21 to 28
		GUICtrlSetColor($Attack_bonus[$i], $COLOR_WHITE)
		GUICtrlSetBkColor($Attack_bonus[$i], 0x2B2C2A)
		GUICtrlSetFont ($Attack_bonus[$i], 8.5, 800)
	Next

	Opt("GUICoordMode", 1)
	$Attack_bonus[31] = GUICtrlCreateLabel("180", 144, 6, 35, 13, $SS_RIGHT)
	Opt("GUICoordMode", 0)
	$Attack_bonus[32] = GUICtrlCreateLabel("42", 0, 15, 35, 13, $SS_RIGHT)
	$Attack_bonus[33] = GUICtrlCreateLabel("180", 0, 15, 35, 13, $SS_RIGHT)
	$Attack_bonus[34] = GUICtrlCreateLabel("42", 0, 15, 35, 13, $SS_RIGHT)
	$Attack_bonus[35] = GUICtrlCreateLabel("x1.25", 0, 15, 35, 13, $SS_RIGHT)
	$Attack_bonus[36] = GUICtrlCreateLabel("x1.00", 0, 15, 35, 13, $SS_RIGHT)
	$Attack_bonus[37] = GUICtrlCreateLabel("x1.32", 0, 15, 35, 13, $SS_RIGHT)
	$Attack_bonus[38] = GUICtrlCreateLabel("x1.125", 0, 15, 35, 13, $SS_RIGHT)

	For $i = 31 to 38
		GUICtrlSetColor($Attack_bonus[$i], $COLOR_WHITE)
		GUICtrlSetBkColor($Attack_bonus[$i], 0x2B2C2A)
		GUICtrlSetFont ($Attack_bonus[$i], 8.5, 800)
	Next

	GUISetState(@SW_SHOW, $Attack_bonus[1])

	$Attack_bonus[48] = GUICreate("", 188, 26, $winpos[0]+557, $winpos[1]+224, $WS_POPUP, '', $MainFrame)
	GUICtrlCreatePic(@WorkingDir & "\Images\UI\Menus\StatsBorder.bmp",  1, 1, 188, 26)
	$Attack_bonus[49] = GUICreate("", 188, 27, $winpos[0]+557, $winpos[1]+68, $WS_POPUP, '', $MainFrame)
	GUICtrlCreatePic(@WorkingDir & "\Images\UI\Menus\InfoBorder.bmp",  1, 1, 188, 27)
	GUISetState(@SW_SHOW, $Attack_bonus[48])
	GUISetState(@SW_SHOW, $Attack_bonus[49])
EndFunc

func create_quick_stat_gui()
	Global $ArmorQuickStats[7][8]
	Opt("GUICoordMode", 1)
	; Armor labels
	for $i = 1 To 5
		Opt("GUICoordMode", 1)
		GUICtrlCreateGroup("", 400, 121+($i-1)*55, 150, 56)
		Opt("GUICoordMode", 0)
		GUICtrlCreatePic(@WorkingDir & "\Images\UI\ArmorStat.bmp", 1, 7, 148, 48)
;~ 		GUICtrlCreateGroup("", 0, 55, 150, 59)
;~ 		GUICtrlCreateGroup("", 0, 55, 150, 59)
;~ 		GUICtrlCreateGroup("", 0, 55, 150, 59)
;~ 		GUICtrlCreateGroup("", 0, 55, 150, 59)
;~ 		GUICtrlCreateGroup("", 0, 55, 150, 63)

		$ArmorQuickStats[$i][0]= GUICreate("", 150, 59, $winpos[0]+400, $winpos[1]+121+($i-1)*55, $WS_POPUP, $WS_ex_layered, $MainFrame)
		GUISetState(@SW_SHOW,$ArmorQuickStats[$i][0])
		GUISetBkColor(0x2B2C2A)
		_WinAPI_SetLayeredWindowAttributes($ArmorQuickStats[$i][0], 0x2B2C2A, 255)
		GUICtrlSetState($ArmorQuickStats[$i][0], $GUI_DISABLE)

		GUICtrlCreatePic(@WorkingDir & "\Images\UI\bk\DefDef.bmp", 12, 15, 15, 15)
		GUICtrlCreatePic(@WorkingDir & "\Images\UI\bk\DefFire.bmp", 25, 0, 15, 15)
		GUICtrlCreatePic(@WorkingDir & "\Images\UI\bk\DefWater.bmp", 23, 0, 15, 15)
		GUICtrlCreatePic(@WorkingDir & "\Images\UI\bk\DefThu.bmp", 23, 0, 15, 15)
		GUICtrlCreatePic(@WorkingDir & "\Images\UI\bk\DefIce.bmp", 23, 0, 15, 15)
		GUICtrlCreatePic(@WorkingDir & "\Images\UI\bk\DefDrg.bmp", 23, 0, 15, 15)

		$ArmorQuickStats[$i][1] = GUICtrlCreateLabel("32", -121, 20, 25, 17, $SS_CENTER)
		$ArmorQuickStats[$i][2] = GUICtrlCreateLabel("2", 24, 0, 25, 17, $SS_CENTER)
		$ArmorQuickStats[$i][3] = GUICtrlCreateLabel("0", 23, 0, 25, 17, $SS_CENTER)
		$ArmorQuickStats[$i][4] = GUICtrlCreateLabel("0", 23, 0, 25, 17, $SS_CENTER)
		$ArmorQuickStats[$i][5] = GUICtrlCreateLabel("0", 23, 0, 25, 17, $SS_CENTER)
		$ArmorQuickStats[$i][6] = GUICtrlCreateLabel("0", 23, 0, 25, 17, $SS_CENTER)

		For $j = 1 to 6
			GUICtrlSetColor($ArmorQuickStats[$i][$j], $COLOR_WHITE)
			GUICtrlSetBkColor($ArmorQuickStats[$i][$j], $GUI_BKCOLOR_TRANSPARENT)
			GUICtrlSetFont ($ArmorQuickStats[$i][$j],9, 800)
		Next
		GUISetState(@SW_DISABLE, -1)
		GUISetState(@SW_ENABLE, $MainFrame)
	Next



;~ 	GLobal $QuickStatCharmNumber = GUICtrlCreateLabel("500   25   25   25   25   25", -0, 55, 140, 17)
;~ 	GUICtrlSetColor(-1, $COLOR_WHITE)
;~ 	GUICtrlSetBkColor(-1, $GUI_BKCOLOR_TRANSPARENT)
;~ 	GUICtrlSetFont (-1,8,5, 800)

EndFunc

Func create_augment_gui()
	Global $WeaponAugmentButtons[4][6]

	Global $AugmentFrame = GUICreate("Augment Menu", 181, 152, $winpos[0]+110, $winpos[1]+100, BitOR($WS_POPUP,$WS_EX_TOOLWINDOW), "", $MainFrame)
	;~ GUISetBkColor($Color_black)
	GUICtrlCreatePic(@WorkingDir & "\Images\UI\AugmentMenuBorder.bmp", 1, 1, 181, 152)
	GUICtrlSetState(-1, $GUI_DISABLE)
	Opt("GUICoordMode", 1)
	GLobal $augmentFrameAtt = GUICtrlCreatePic(@WorkingDir & "\Images\UI\Menus\AttAug.bmp", 3, 3, 175, 29)
	GUICtrlSetOnEvent(-1, "augment_add_raw")
	Opt("GUICoordMode", 0)
	GLobal $augmentFrameAff = GUICtrlCreatePic(@WorkingDir & "\Images\UI\Menus\AffAug.bmp", 0, 29, 175, 29)
	GUICtrlSetOnEvent(-1, "augment_add_aff")
	GLobal $augmentFrameDef = GUICtrlCreatePic(@WorkingDir & "\Images\UI\Menus\DefAug.bmp", 0, 29, 175, 29)
	GUICtrlSetOnEvent(-1, "augment_add_def")
	GLobal $augmentFrameSlot = GUICtrlCreatePic(@WorkingDir & "\Images\UI\Menus\SlotAug.bmp", 0, 29, 175, 29)
	GUICtrlSetOnEvent(-1, "augment_add_slot")
	GLobal $augmentFrameHealth = GUICtrlCreatePic(@WorkingDir & "\Images\UI\Menus\HAug.bmp", 0, 29, 175, 29)
	GUICtrlSetOnEvent(-1, "augment_add_h")
	Global $AugmentSelected

	Opt("GUICoordMode", 1)
	for $i = 1 to 3
		$WeaponAugmentButtons[$i][1] = GUICreate("", 90, 18, $winpos[0]+301, $winpos[1]+69+($i-1)*20, $WS_POPUP, '', $MainFrame)
		$WeaponAugmentButtons[$i][2] = GUICtrlCreatePic(@WorkingDir & "\Images\UI\AugmentBorder.bmp",  0, 0, 90, 18)
		GUISetState(@SW_DISABLE, $WeaponAugmentButtons[$i][1])
		$WeaponAugmentButtons[$i][3] = GUICreate("", 90, 18, $winpos[0]+301, $winpos[1]+69+($i-1)*20, $WS_POPUP, '', $MainFrame)
		GUISetState(@SW_DISABLE, $WeaponAugmentButtons[$i][3])
		_GUIEnhanceAnimateWin ($WeaponAugmentButtons[$i][3], 1, $GUI_EN_ANI_FADEOUT)
		$WeaponAugmentButtons[$i][2] = GUICreate("", 80, 14, $winpos[0]+306, $winpos[1]+71+($i-1)*20, $WS_POPUP, '', $MainFrame)
;~ 		GUISetState(@SW_SHOW,$WeaponAugmentButtons[$i][2])
		GUISetBkColor(0x2B2C2A)
		_WinAPI_SetLayeredWindowAttributes($WeaponAugmentButtons[$i][2], 0x2B2C2A, 255)
		$WeaponAugmentButtons[$i][5] = GUICtrlCreateLabel("- - - - -", 0, 1, 80, 18,$SS_CENTER)
		Select
			Case $i = 1
				GUICtrlSetOnEvent(-1, "init_augment1")
			Case $i = 2
				GUICtrlSetOnEvent(-1, "init_augment2")
			Case $i = 3
				GUICtrlSetOnEvent(-1, "init_augment3")
		EndSelect
		GUICtrlSetColor(-1, $COLOR_WHITE)
		GUICtrlSetBkColor(-1, $GUI_BKCOLOR_TRANSPARENT)
		GUICtrlSetFont (-1, 9, 800)
	Next

EndFunc

Func create_slots_gui()

	Global $WeaponSlotBorder[4]
	Global $HeadSlotBorder[4]
	Global $ChestSlotBorder[4]
	Global $HandsSlotBorder[4]
	Global $BeltSlotBorder[4]
	Global $BootsSlotBorder[4]

	Global $WeaponSlotButton[4][2]
	Global $HeadSlotButton[4][2]
	Global $ChestSlotButton[4][2]
	Global $HandsSlotButton[4][2]
	Global $BeltSlotButton[4][2]
	Global $BootsSlotButton[4][2]

	For $i = 1 to 3
		Opt("GUICoordMode", 1)
		$WeaponSlotBorder[$i] = GUICreate("", 71, 23, $winpos[0]+67+($i-1)*78, $winpos[1]+100, $WS_POPUP, '', $MainFrame)
		GUICtrlCreatePic(@WorkingDir & "\Images\UI\SlotBorder.bmp",  0, 0, 71, 23)
		GUISetState(@SW_DISABLE, $WeaponSlotBorder[$i])
		$HeadSlotBorder[$i] = GUICreate("", 71, 23, $winpos[0]+67+($i-1)*78, $winpos[1]+155, $WS_POPUP, '', $MainFrame)
		GUICtrlCreatePic(@WorkingDir & "\Images\UI\SlotBorder.bmp",  0, 0, 71, 23)
		GUISetState(@SW_DISABLE, $HeadSlotBorder[$i])
		$ChestSlotBorder[$i] = GUICreate("", 71, 23,  $winpos[0]+67+($i-1)*78, $winpos[1]+210, $WS_POPUP, '', $MainFrame)
		GUICtrlCreatePic(@WorkingDir & "\Images\UI\SlotBorder.bmp",  0, 0, 71, 23)
		GUISetState(@SW_DISABLE, $ChestSlotBorder[$i])
		$HandsSlotBorder[$i] = GUICreate("", 71, 23,  $winpos[0]+67+($i-1)*78, $winpos[1]+265, $WS_POPUP, '', $MainFrame)
		GUICtrlCreatePic(@WorkingDir & "\Images\UI\SlotBorder.bmp",  0, 0, 71, 23)
		GUISetState(@SW_DISABLE, $HandsSlotBorder[$i])
		$BeltSlotBorder[$i] = GUICreate("", 71, 23,  $winpos[0]+67+($i-1)*78, $winpos[1]+320, $WS_POPUP, '', $MainFrame)
		GUICtrlCreatePic(@WorkingDir & "\Images\UI\SlotBorder.bmp",  0, 0, 71, 23)
		GUISetState(@SW_DISABLE, $BeltSlotBorder[$i])
		$BootsSlotBorder[$i] = GUICreate("", 71, 23,  $winpos[0]+67+($i-1)*78, $winpos[1]+375, $WS_POPUP, '', $MainFrame)
		GUICtrlCreatePic(@WorkingDir & "\Images\UI\SlotBorder.bmp",  0, 0, 71, 23)
		GUISetState(@SW_DISABLE, $BootsSlotBorder[$i])
	Next

	For $i = 1 to 3
		Opt("GUICoordMode", 1)
		$WeaponSlotButton[$i][0] = GUICreate("", 19, 19, $winpos[0]+93+($i-1)*78, $winpos[1]+102, $WS_POPUP, '', $MainFrame)
		$WeaponSlotButton[$i][1] = GUICtrlCreatePic(@WorkingDir & "\Images\UI\bk\Gem1.bmp",  0, 0, 19, 19)
;~ 		GUISetState(@SW_SHOW, $WeaponSlotButton[$i][0])
		$HeadSlotButton[$i][0] = GUICreate("", 19, 19, $winpos[0]+93+($i-1)*78, $winpos[1]+157, $WS_POPUP, '', $MainFrame)
		$HeadSlotButton[$i][1] = GUICtrlCreatePic(@WorkingDir & "\Images\UI\bk\Gem1.bmp",  0, 0, 19, 19)
;~ 		GUISetState(@SW_SHOW, $WeaponSlotButton[$i][0])
		$ChestSlotButton[$i][0] = GUICreate("", 19, 19,  $winpos[0]+93+($i-1)*78, $winpos[1]+212, $WS_POPUP, '', $MainFrame)
		$ChestSlotButton[$i][1] = GUICtrlCreatePic(@WorkingDir & "\Images\UI\bk\Gem1.bmp",  0, 0, 19, 19)
;~ 		GUISetState(@SW_SHOW, $WeaponSlotButton[$i][0])
		$HandsSlotButton[$i][0] = GUICreate("", 19, 19,  $winpos[0]+93+($i-1)*78, $winpos[1]+267, $WS_POPUP, '', $MainFrame)
		$HandsSlotButton[$i][1] = GUICtrlCreatePic(@WorkingDir & "\Images\UI\bk\Gem1.bmp",  0, 0, 19, 19)
;~ 		GUISetState(@SW_SHOW, $WeaponSlotButton[$i][0])
		$BeltSlotButton[$i][0] = GUICreate("", 19, 19,  $winpos[0]+93+($i-1)*78, $winpos[1]+322, $WS_POPUP, '', $MainFrame)
		$BeltSlotButton[$i][1] = GUICtrlCreatePic(@WorkingDir & "\Images\UI\bk\Gem1.bmp",  0, 0, 19, 19)
;~ 		GUISetState(@SW_SHOW, $WeaponSlotButton[$i][0])
		$BootsSlotButton[$i][0] = GUICreate("", 19, 19,  $winpos[0]+93+($i-1)*78, $winpos[1]+377, $WS_POPUP, '', $MainFrame)
		$BootsSlotButton[$i][1] = GUICtrlCreatePic(@WorkingDir & "\Images\UI\bk\Gem1.bmp",  0, 0, 19, 19)
;~ 		GUISetState(@SW_SHOW, $WeaponSlotButton[$i][0])
	Next
	GUISetState(@SW_ENABLE, $MainFrame)

EndFunc

Func create_jewel_gui()
	Opt("GUICoordMode", 1)

	Global $GemList[150][6]
	Global $GemListNumber = 1
	Global $GemListMaxNumber
	Global $GemPieceChosen
	Global $GemNumberChosen
	Global $SlotHandle
	Global $SlotGUIhandle

	local $SkillsShortBulk = IniReadSection(@WorkingDir & "\DB\Skills.ini", "Skills")
	local $SkillsShortBulkSplit

	Local $GemListCounter = 1
	For $i = 1 to $SkillsShortBulk[0][0]
		$SkillsShortBulkSplit = StringSplit($SkillsShortBulk[$i][1],",")
		If $SkillsShortBulkSplit[4] <> "0" Then
			$GemList[$GemListCounter][1] = $SkillsShortBulk[$i][0]
			$GemList[$GemListCounter][2] = $SkillsShortBulkSplit[5]
			$GemList[$GemListCounter][3] = $SkillsShortBulkSplit[4]
			$GemList[$GemListCounter][4] = $SkillsShortBulkSplit[3]
			$GemList[$GemListCounter][5] = $SkillsShortBulkSplit[1]
			$GemListCounter = $GemListCounter + 1
		EndIf
	Next
	$GemList[0][0] = $GemListCounter - 1
	$GemListMaxNumber = Ceiling($GemList[0][0]/10)
;~ 	MsgBox('','',"Max Number: " & $GemList[0][0] & " Pages: " & $GemListMaxNumber)

	Global $JewelList[11][5]
	Global $JewelFrame = GUICreate("JewelGUI", 250, 300, $winpos[0] - 260, $winpos[1]+100, $WS_POPUP, '', $MainFrame)
	GUICtrlCreatePic(@WorkingDir & "\Images\UI\JewelFrameBorder.bmp", 0, 0, 250, 300)
	GUICtrlSetState(-1, $GUI_DISABLE)
	local $JewelFramePos=WinGetPos("JewelGUI")

	Global $JewelFramePrevButton = GUICtrlCreateButton("Prev", 50, 271, 25, 25)
	GUICtrlSetOnEvent(-1, "jewel_prev")
	Global $JewelFrameNextButton = GUICtrlCreateButton("Next", 80, 271, 25, 25)
	GUICtrlSetOnEvent(-1, "jewel_next")

	Global $JewelFramePageNumberGUI = GUICreate("JewelGUI", 50, 20, $JewelFramePos[0]+120, $JewelFramePos[1]+276, $WS_POPUP, $WS_EX_LAYERED, $JewelFrame)
	GUISetState(@SW_DISABLE, $JewelFramePageNumberGUI)
	GUISetState(@SW_SHOW, $JewelFramePageNumberGUI)
	GUISetBkColor(0x2B2C2A)
	_WinAPI_SetLayeredWindowAttributes($JewelFramePageNumberGUI, 0x2B2C2A, 255)
	Global $JewelFramePageNumber = GUICtrlCreateLabel("123123", 0, 0, 50, 20)
	GUICtrlSetColor(-1, 0x2B2C2A)
	GUICtrlSetBkColor(-1, $GUI_BKCOLOR_TRANSPARENT)
	GUICtrlSetFont (-1, 8.5, 800)

;~ 	GUISetState(@SW_SHOW,$JewelFrame)

	For $i = 1 to 10
		$JewelList[$i][0] = GUICreate("", 230, 25, $JewelFramePos[0]+10, $JewelFramePos[1]+15+($i-1)*25, $WS_POPUP, '', $JewelFrame)
		GUICtrlCreatePic(@WorkingDir & "\Images\UI\Menus\JewelBorder.bmp", 0, 0, 230, 25)
		GUISetState(@SW_DISABLE, $JewelList[$i][0])
;~ 		GUISetState(@SW_SHOW, $JewelList[$i][0])

		$JewelList[$i][1] = GUICreate("", 15, 15, $JewelFramePos[0]+18, $JewelFramePos[1]+20+($i-1)*25, $WS_POPUP, '', $JewelFrame)
		GUISetBkColor(0x2B2C2A)
		_WinAPI_SetLayeredWindowAttributes($JewelList[$i][1], 0x2B2C2A, 255)
		$JewelList[$i][4] = GUICtrlCreatePic(@WorkingDir & "\Images\UI\bk\Gem" & "White" & "Lvl" & "3" & ".bmp", 0, 0, 15, 15)
		GUISetState(@SW_DISABLE, $JewelList[$i][1])
;~ 		GUISetState(@SW_SHOW, $JewelList[$i][1])

		$JewelList[$i][2]=GUICreate("", 200, 19, $JewelFramePos[0]+35, $JewelFramePos[1]+18+($i-1)*25, $WS_POPUP, '', $JewelFrame)
		GUISetBkColor(0x2B2C2A)
		_WinAPI_SetLayeredWindowAttributes($JewelList[$i][2], 0x2B2C2A, 255)
;~ 		GUISetState(@SW_SHOW, $JewelList[$i][2])
		$JewelList[$i][3] = GUICtrlCreateLabel("Test Jewel 123", 5, 2, 200, 17)
		GUICtrlSetOnEvent($JewelList[$i][3], "choose_gem")
		GUICtrlSetColor(-1, 0x2B2C2A)
		GUICtrlSetBkColor(-1, $GUI_BKCOLOR_TRANSPARENT)
		GUICtrlSetFont (-1, 8.5, 800)
;~ 		GUISetState(@SW_SHOW, $JewelList[$i][2])
	Next

;~ 	show_jewels()
EndFunc

Func show_jewels_gui()
	local $test
	local $test2

	For $i = 1 to 3
		GUICtrlSetOnEvent($WeaponSlotButton[$i][1], "show_jewels_gui")
		GUICtrlSetOnEvent($HeadSlotButton[$i][1], "show_jewels_gui")
		GUICtrlSetOnEvent($ChestSlotButton[$i][1], "show_jewels_gui")
		GUICtrlSetOnEvent($HandsSlotButton[$i][1], "show_jewels_gui")
		GUICtrlSetOnEvent($BeltSlotButton[$i][1], "show_jewels_gui")
		GUICtrlSetOnEvent($BootsSlotButton[$i][1], "show_jewels_gui")
	Next

	GUICtrlSetOnEvent(@GUI_CTRLID, "choose_gem")
	_GUIEnhanceAnimateWin ($JewelFrame, 200, $GUI_EN_ANI_FADEIN)
	GUISetState(@SW_SHOW, $JewelFrame)

	$SlotGUIhandle = @GUI_WinHandle
	show_jewels(@GUI_CTRLID)

EndFunc

Func hide_jewels_gui()
;~ 	GUICtrlSetOnEvent(@GUI_CTRLID, "show_jewels_gui")
	hide_jewels()
	_GUIEnhanceAnimateWin ($JewelFrame, 200, $GUI_EN_ANI_FADEOUT)
	GUISetState(@SW_HIDE, $JewelFrame)
EndFunc

Func show_jewels($handle_id)

	$SlotHandle = $handle_id

	For $i = 1 to 3
		Select
			Case $handle_id = $WeaponSlotButton[$i][1]
				sort_jewels($WeaponSlotLevels[$i])
				$GemPieceChosen = 'weapon'
				$GemNumberChosen = $i
			Case $handle_id = $HeadSlotButton[$i][1]
				sort_jewels($HeadSlotLevels[$i])
				$GemPieceChosen = 'head'
				$GemNumberChosen = $i
			Case $handle_id = $ChestSlotButton[$i][1]
				sort_jewels($ChestSlotLevels[$i])
				$GemPieceChosen = 'chest'
				$GemNumberChosen = $i
			Case $handle_id = $HandsSlotButton[$i][1]
				sort_jewels($HandsSlotLevels[$i])
				$GemPieceChosen = 'hands'
				$GemNumberChosen = $i
			Case $handle_id = $BeltSlotButton[$i][1]
				sort_jewels($BeltSlotLevels[$i])
				$GemPieceChosen = 'belt'
				$GemNumberChosen = $i
			Case $handle_id = $BootsSlotButton[$i][1]
				sort_jewels($BootsSlotLevels[$i])
				$GemPieceChosen = 'boots'
				$GemNumberChosen = $i
		EndSelect
	Next

	For $i = 1 to 10
		_GUIEnhanceAnimateWin ($JewelList[$i][0], 1, $GUI_EN_ANI_FADEIN)
		_GUIEnhanceAnimateWin ($JewelList[$i][2], 1, $GUI_EN_ANI_FADEIN)
		GUISetState(@SW_SHOW, $JewelList[$i][2])
	Next

	refresh_jewel_list()
EndFunc

Func refresh_jewel_list()
	Local $temp_name
	For $i = 1 to 10
		$temp_name = $GemListSorted[$i + ($GemListNumber-1)*10][4] & " (" & $GemListSorted[$i + ($GemListNumber-1)*10][5] & ")"
		If $temp_name <> " ()" Then
			_GUIEnhanceAnimateWin ($JewelList[$i][1], 1, $GUI_EN_ANI_FADEOUT)
			GUICtrlDelete($JewelList[$i][4])
			GUISetState(@SW_DISABLE, $JewelList[$i][1])
			$JewelList[$i][4] = GUICtrlCreatePic(@WorkingDir & "\Images\UI\bk\Gem" & "White" & "Lvl" & $GemListSorted[$i+($GemListNumber-1)*10][3] & ".bmp", 0, 0, 15, 15)
			_GUIEnhanceAnimateWin ($JewelList[$i][0], 1, $GUI_EN_ANI_FADEIN)
			_GUIEnhanceAnimateWin ($JewelList[$i][1], 1, $GUI_EN_ANI_FADEIN)
			_GUIEnhanceAnimateWin ($JewelList[$i][2], 1, $GUI_EN_ANI_FADEIN)
			_GuiCtrlFadeSetData($JewelList[$i][3], 0xFFFFFF, 0x2B2C2A, 0xFFFFFF, $temp_name, 0)
		Else
			_GUIEnhanceAnimateWin ($JewelList[$i][0], 1, $GUI_EN_ANI_FADEOUT)
			_GUIEnhanceAnimateWin ($JewelList[$i][1], 1, $GUI_EN_ANI_FADEOUT)
			_GUIEnhanceAnimateWin ($JewelList[$i][2], 1, $GUI_EN_ANI_FADEOUT)
			_GuiCtrlFadeSetData($JewelList[$i][3], 0xFFFFFF, 0x2B2C2A, 0xFFFFFF, "", 0)
		EndIf
	Next
		_GuiCtrlFadeSetData($JewelFramePageNumber, 0xFFFFFF, 0x2B2C2A, 0xFFFFFF, "Page: " & $GemListNumber, 0)
EndFunc

Func choose_gem()
	Local $gem_slot_choosen
	If @GUI_CTRLID <> $SlotHandle Then
		For $i = 1 to 10
			if @GUI_CTRLID = $JewelList[$i][3] Then $gem_slot_choosen = $i
		Next

		Select
			Case $GemPieceChosen = 'weapon'
				$WeaponSlotsGems[$GemNumberChosen] = $GemListSorted[$gem_slot_choosen+($GemListNumber-1)*10][1]
			Case $GemPieceChosen = 'head'
				$headSlotsGems[$GemNumberChosen] = $GemListSorted[$gem_slot_choosen+($GemListNumber-1)*10][1]
			Case $GemPieceChosen = 'chest'
				$chestSlotsGems[$GemNumberChosen] = $GemListSorted[$gem_slot_choosen+($GemListNumber-1)*10][1]
			Case $GemPieceChosen = 'hands'
				$handsSlotsGems[$GemNumberChosen] = $GemListSorted[$gem_slot_choosen+($GemListNumber-1)*10][1]
			Case $GemPieceChosen = 'belt'
				$beltSlotsGems[$GemNumberChosen] = $GemListSorted[$gem_slot_choosen+($GemListNumber-1)*10][1]
			Case $GemPieceChosen = 'boots'
				$bootsSlotsGems[$GemNumberChosen] = $GemListSorted[$gem_slot_choosen+($GemListNumber-1)*10][1]
		EndSelect

		_GUIEnhanceAnimateWin ($SlotGUIhandle, $button_fade_delay, $GUI_EN_ANI_FADEOUT)
		GUISetState(@SW_SHOW, $SlotGUIhandle)
		GUICtrlDelete($SlotHandle)
		$SlotHandle = GUICtrlCreatePic(@WorkingDir & "\Images\UI\bk\Gem" & "White" & "Lvl" & $GemListSorted[$gem_slot_choosen+($GemListNumber-1)*10][3] & ".bmp",  0, 0, 19, 19)
		GUICtrlSetOnEvent($SlotHandle, "show_jewels_gui")
		_GUIEnhanceAnimateWin ($SlotGUIhandle, $button_fade_delay, $GUI_EN_ANI_FADEIN)
	Else

		_GUIEnhanceAnimateWin ($SlotGUIhandle, $button_fade_delay, $GUI_EN_ANI_FADEOUT)
		GUISetState(@SW_SHOW, $SlotGUIhandle)
		GUICtrlDelete($SlotHandle)
		Select
			Case $GemPieceChosen = 'weapon'
				$WeaponSlotsGems[$GemNumberChosen] = 'none'
				$SlotHandle = GUICtrlCreatePic(@WorkingDir & "\Images\UI\bk\Gem" & $WeaponSlotLevels[$GemNumberChosen] &".bmp",  0, 0, 19, 19)
			Case $GemPieceChosen = 'head'
				$headSlotsGems[$GemNumberChosen] = 'none'
				$SlotHandle = GUICtrlCreatePic(@WorkingDir & "\Images\UI\bk\Gem" & $HeadSlotLevels[$GemNumberChosen] &".bmp",  0, 0, 19, 19)
			Case $GemPieceChosen = 'chest'
				$chestSlotsGems[$GemNumberChosen] = 'none'
				$SlotHandle = GUICtrlCreatePic(@WorkingDir & "\Images\UI\bk\Gem" & $ChestSlotLevels[$GemNumberChosen] &".bmp",  0, 0, 19, 19)
			Case $GemPieceChosen = 'hands'
				$handsSlotsGems[$GemNumberChosen] = 'none'
				$SlotHandle = GUICtrlCreatePic(@WorkingDir & "\Images\UI\bk\Gem" & $HandsSlotLevels[$GemNumberChosen] &".bmp",  0, 0, 19, 19)
			Case $GemPieceChosen = 'belt'
				$beltSlotsGems[$GemNumberChosen] = 'none'
				$SlotHandle = GUICtrlCreatePic(@WorkingDir & "\Images\UI\bk\Gem" & $BeltSlotLevels[$GemNumberChosen] &".bmp",  0, 0, 19, 19)
			Case $GemPieceChosen = 'boots'
				$bootsSlotsGems[$GemNumberChosen] = 'none'
				$SlotHandle = GUICtrlCreatePic(@WorkingDir & "\Images\UI\bk\Gem" & $BootsSlotLevels[$GemNumberChosen] &".bmp",  0, 0, 19, 19)
		EndSelect
		GUICtrlSetOnEvent($SlotHandle, "show_jewels_gui")
		_GUIEnhanceAnimateWin ($SlotGUIhandle, $button_fade_delay, $GUI_EN_ANI_FADEIN)

;~ 		$SlotHandle = GUICtrlCreatePic(@WorkingDir & "\Images\UI\bk\Gem" & "White" & "Lvl" & $GemListSorted[$gem_slot_choosen+($GemListNumber-1)*10][3] & ".bmp",  0, 0, 19, 19)
;~ 		$WeaponSlotButton[$i][1] = GUICtrlCreatePic(@WorkingDir & "\Images\UI\bk\Gem" & $WeaponSlotLevels[$i] &".bmp",  0, 0, 19, 19)

	EndIf

	$update_skills_required = True
	$update_defense_stats_required = True
	hide_jewels_gui()
EndFunc

Func hide_jewels()
	For $i = 10 to 1 Step -1
		_GUIEnhanceCtrlFade ($JewelList[$i][3], 1, True, False, 0xFFFFFF, 0x2B2C2A, 3)
		_GUIEnhanceAnimateWin ($JewelList[$i][2], 1, $GUI_EN_ANI_FADEOUT)
		GUISetState(@SW_HIDE, $JewelList[$i][0])
		GUISetState(@SW_HIDE, $JewelList[$i][1])
	Next
	_GUIEnhanceCtrlFade ($JewelFramePageNumber, 1, True, False, 0xFFFFFF, 0x2B2C2A, 3)
EndFunc

Func sort_jewels($socket_size = 3)
;~ 	Global $GemListSorted[150][150]
	local $TempGemListCounter = 1
	local $GemListSortingDone = False
	Local $temp

	For $i = 1 to $GemList[0][0]
		If $GemList[$i][3] <= $socket_size Then
			For $j = 1 to 5
				$GemListSorted[$TempGemListCounter][$j] = $GemList[$i][$j]
			Next
			$TempGemListCounter = $TempGemListCounter + 1
		EndIf
	Next
	$GemListSorted[0][0] = $TempGemListCounter - 1

	While Not($GemListSortingDone)
		$GemListSortingDone = True
		For $i = 1 to $GemListSorted[0][0] - 1
			If $GemListSorted[$i][3] < $GemListSorted[$i+1][3] Then
				for $j = 1 to 5
					$temp = $GemListSorted[$i][$j]
					$GemListSorted[$i][$j] = $GemListSorted[$i+1][$j]
					$GemListSorted[$i+1][$j] = $temp
				Next
				$GemListSortingDone = False
			EndIf
		Next
	WEnd


	$GemListMaxNumber = Ceiling($GemListSorted[0][0]/10)
EndFunc

Func jewel_next()
	$GemListNumber = $GemListNumber + 1

	If $GemListNumber > $GemListMaxNumber Then
		$GemListNumber = $GemListMaxNumber
	Else
		refresh_jewel_list()
	EndIf
EndFunc

Func jewel_prev()
	$GemListNumber = $GemListNumber - 1
	If $GemListNumber < 1 Then
		$GemListNumber = 1
	Else
		refresh_jewel_list()
	EndIf

EndFunc

Func create_upgrade_gui()

	Opt("GUICoordMode", 1)
;~ 	GLobal $HeadUpgrade = GUICtrlCreatePic(@WorkingDir & "\Images\UI\UpgradeBorder.bmp",  300, 154, 90, 23)
;~ 	Opt("GUICoordMode", 0)

;~ 	GLobal $ChestUpgrade = GUICtrlCreatePic(@WorkingDir & "\Images\UI\UpgradeBorder.bmp",  -15, 52, 90, 23)
;~ 	GLobal $CharmUpgrade = GUICtrlCreatePic(@WorkingDir & "\Images\UI\UpgradeBorder.bmp",  -137, 52, 90, 23)
;~ 	GLobal $CharmUpgradeLabel = GUICtrlCreateLabel("Upgrade", 15, 3, 60, 18,$SS_CENTER)

	Global $Upgrade_buttons[7][10]
	Global $Upgrade_levels[9][3]
	$Upgrade_levels[5][1] = 12
	$Upgrade_levels[5][2] = 20
	$Upgrade_levels[6][1] = 11
	$Upgrade_levels[6][2] = 17
	$Upgrade_levels[7][1] = 7
	$Upgrade_levels[7][2] = 14
	$Upgrade_levels[8][1] = 4
	$Upgrade_levels[8][2] = 11

	For $i = 1 to 5
		$Upgrade_buttons[$i][0] = GUICreate("", 90, 23, $winpos[0]+301, $winpos[1]+155+($i-1)*55, $WS_POPUP, '', $MainFrame)
		GUICtrlCreatePic(@WorkingDir & "\Images\UI\UpgradeBorder.bmp",  0, 0, 90, 23)
		GUISetState(@SW_DISABLE, $Upgrade_buttons[$i][0])
		$Upgrade_buttons[$i][1] = GUICreate("", 21, 18, $winpos[0]+325, $winpos[1]+158+($i-1)*55, $WS_POPUP, '', $MainFrame)
		$Upgrade_buttons[$i][3] = GUICtrlCreatePic(@WorkingDir & "\Images\UI\bk\UpgradeRed.bmp",  0, 0, 21, 18)
		GUICtrlSetOnEvent(-1, "upgrade_head")
		$Upgrade_buttons[$i][2] = GUICreate("", 21, 18, $winpos[0]+350, $winpos[1]+158+($i-1)*55, $WS_POPUP, '', $MainFrame)
		$Upgrade_buttons[$i][4] = GUICtrlCreatePic(@WorkingDir & "\Images\UI\bk\UpgradeBlue.bmp",  0, 0, 21, 18)
		_GUIEnhanceAnimateWin ($Upgrade_buttons[$i][0], 5, $GUI_EN_ANI_FADEIN)
		_GUIEnhanceAnimateWin ($Upgrade_buttons[$i][1], 5, $GUI_EN_ANI_FADEIN)
		GUISetState(@SW_SHOW, $Upgrade_buttons[$i][1])
		_GUIEnhanceAnimateWin ($Upgrade_buttons[$i][2], 5, $GUI_EN_ANI_FADEIN)
		GUISetState(@SW_SHOW, $Upgrade_buttons[$i][2])
	Next

	$Upgrade_buttons[6][0] = GUICreate("", 90, 23, $winpos[0]+180, $winpos[1]+155+($i-1)*55, $WS_POPUP, '', $MainFrame)
	GUICtrlCreatePic(@WorkingDir & "\Images\UI\UpgradeBorder.bmp",  0, 0, 90, 23)
	$Upgrade_buttons[6][1] = GUICreate("", 15, 15, $winpos[0]+199, $winpos[1]+159+($i-1)*55, $WS_POPUP, '', $MainFrame)
	GUICtrlCreatePic(@WorkingDir & "\Images\UI\bk\UpgradeCheck.bmp",  0, 0, 15, 15)
	$Upgrade_buttons[6][2] = GUICreate("", 15, 15, $winpos[0]+218, $winpos[1]+159+($i-1)*55, $WS_POPUP, '', $MainFrame)
	$Upgrade_buttons[6][3] = GUICtrlCreatePic(@WorkingDir & "\Images\UI\bk\UpgradeAvail.bmp",  0, 0, 15, 15)
	$Upgrade_buttons[6][4] = GUICreate("", 15, 15, $winpos[0]+237, $winpos[1]+159+($i-1)*55, $WS_POPUP, '', $MainFrame)
	$Upgrade_buttons[6][5] = GUICtrlCreatePic(@WorkingDir & "\Images\UI\Skills\SkillEmpty.bmp",  0, 0, 15, 15)
	$Upgrade_buttons[6][6] = GUICreate("", 23, 23, $winpos[0]+155, $winpos[1]+155+($i-1)*55, $WS_POPUP, '', $MainFrame)
	$Upgrade_buttons[6][7] = GUICtrlCreatePic(@WorkingDir & "\Images\UI\ButtonLeft.bmp",  0, 0, 23, 23)
	GUISetState(@SW_SHOW, $Upgrade_buttons[6][6])
	GUICtrlSetOnEvent($Upgrade_buttons[6][7], "charm_downgrade")
	$Upgrade_buttons[6][8] = GUICreate("", 23, 23, $winpos[0]+272, $winpos[1]+155+($i-1)*55, $WS_POPUP, '', $MainFrame)
	$Upgrade_buttons[6][9] = GUICtrlCreatePic(@WorkingDir & "\Images\UI\ButtonRight.bmp",  0, 0, 23, 23)
	GUISetState(@SW_SHOW, $Upgrade_buttons[6][8])
	GUICtrlSetOnEvent($Upgrade_buttons[6][9], "charm_upgrade")
	_GUIEnhanceAnimateWin ($Upgrade_buttons[6][0], 5, $GUI_EN_ANI_FADEIN)
	_GUIEnhanceAnimateWin ($Upgrade_buttons[6][1], 5, $GUI_EN_ANI_FADEIN)
	_GUIEnhanceAnimateWin ($Upgrade_buttons[6][2], 5, $GUI_EN_ANI_FADEIN)
	_GUIEnhanceAnimateWin ($Upgrade_buttons[6][4], 5, $GUI_EN_ANI_FADEIN)
	_GUIEnhanceAnimateWin ($Upgrade_buttons[6][6], 5, $GUI_EN_ANI_FADEIN)

	GUICtrlSetOnEvent($Upgrade_buttons[1][3], "upgrade_head")
	GUICtrlSetOnEvent($Upgrade_buttons[2][3], "upgrade_chest")
	GUICtrlSetOnEvent($Upgrade_buttons[3][3], "upgrade_hands")
	GUICtrlSetOnEvent($Upgrade_buttons[4][3], "upgrade_belt")
	GUICtrlSetOnEvent($Upgrade_buttons[5][3], "upgrade_boots")

	GUICtrlSetOnEvent($Upgrade_buttons[1][4], "augment_head")
	GUICtrlSetOnEvent($Upgrade_buttons[2][4], "augment_chest")
	GUICtrlSetOnEvent($Upgrade_buttons[3][4], "augment_hands")
	GUICtrlSetOnEvent($Upgrade_buttons[4][4], "augment_belt")
	GUICtrlSetOnEvent($Upgrade_buttons[5][4], "augment_boots")

	GUISetState(@SW_ENABLE, $MainFrame)
EndFunc

Func init_skills_template()
	Global $skill_icons[21][30]
;~ 	$winpos[0]+400, $winpos[1]+25
;~ $winpos[0]+765, $winpos[1]+60
	local $x_offset = $winpos[0]+765
	local $y_offset = $winpos[1]+60
	Opt("GUICoordMode", 1)
	for $i = 1 to 9
		$skill_icons[$i][1] = GUICreate("", 180, 43, $x_offset+9, $y_offset+9+($i-1)*43.3, $WS_POPUP, '', $SkillsFrame)
		GUISetState(@SW_DISABLE, $skill_icons[$i][1])
		GUICtrlCreatePic(@WorkingDir & "\Images\UI\Skills\SkillBG.bmp", 0, 0, 180, 43)
		GUICtrlCreatePic(@WorkingDir & "\Images\UI\Skills\SkillBar.bmp", 42, 30, 95, 10)
		GUICtrlCreatePic(@WorkingDir & "\Images\UI\Skills\SkillBorder.bmp", 4, 4, 36, 36)
		$skill_icons[$i][2] = GUICreate("", 31, 31, $x_offset+15, $y_offset+15+($i-1)*43.3, $WS_POPUP, '', $SkillsFrame)
		$skill_icons[$i][3] = GUICtrlCreatePic(@WorkingDir & "\Images\UI\Skills\SkillIcon.bmp", 0, 0, 31, 31)
		GUISetState(@SW_DISABLE, $skill_icons[$i][2])

		$skill_icons[$i][5] = GUICreate("", 180, 43, $x_offset+9, $y_offset+9+($i-1)*43.3, $WS_POPUP, $WS_ex_layered, $MainFrame)

		GUISetState(@SW_SHOW,$skill_icons[$i][5])
		GUISetBkColor(0x2B2C2A)
		_WinAPI_SetLayeredWindowAttributes($skill_icons[$i][5], 0x2B2C2A, 255)
		$skill_icons[$i][6] = GUICtrlCreateLabel("", 44, 10, 125, 20)
		GUICtrlSetColor(-1, $COLOR_WHITE)
		GUICtrlSetBkColor(-1, $GUI_BKCOLOR_TRANSPARENT)
		GUICtrlSetFont (-1, 9, 800)
		$skill_icons[$i][7] = GUICtrlCreateLabel("", 138, 28, 125, 20)
;~ 		$skill_icons[$i][7] = GUICtrlCreateLabel("", 44, 10, 125, 20)
		GUICtrlSetColor(-1, $COLOR_WHITE)
		GUICtrlSetBkColor(-1, $GUI_BKCOLOR_TRANSPARENT)
		GUICtrlSetFont (-1, 8.5, 800)
;~ 		GUICtrlSetState(-1, $GUI_HIDE)
		GUISetState(@SW_DISABLE, -1)
		for $j = 1 to 7
			$skill_icons[$i][10+$j] = GUICreate("", 8, 8, $x_offset+61+11*($j-1), $y_offset+40+($i-1)*43.3, $WS_POPUP, '', $SkillsFrame)
			GUICtrlCreatePic(@WorkingDir & "\Images\UI\Skills\SkillEmpty.bmp", 0, 0, 8, 8)
			GUISetState(@SW_DISABLE, $skill_icons[$i][10+$j])
		Next

		for $j = 1 to 7
			$skill_icons[$i][20+$j] = GUICreate("", 10, 10, $x_offset+60+11*($j-1), $y_offset+39+($i-1)*43.3, $WS_POPUP, '', $SkillsFrame)
			GUICtrlCreatePic(@WorkingDir & "\Images\UI\Skills\SkillFilled.bmp", 0, 0, 10, 10)
			GUISetState(@SW_DISABLE, $skill_icons[$i][20+$j])
		Next
	Next
EndFunc

Func init_weapon()

	Global $WeaponList = IniReadSectionNames(@WorkingDir & "\DB\Weapon.ini")

	For $i = 1 To $WeaponList[0]
;~ 		local $temp_weapon = IniReadSection(@WorkingDir & "\DB\Weapon.ini", $WeaponList[$i])
;~ 		_GUICtrlComboBox_AddString($WeaponCombo, $WeaponList[$i] & " [Raw: " & $temp_weapon[2][1] & "+" & $temp_weapon[4][1] & "]")
		_GUICtrlComboBox_AddString($WeaponCombo, $WeaponList[$i])
	Next

	_GUICtrlComboBox_SetCurSel($WeaponCombo, 0)
	GUICtrlSetOnEvent($WeaponCombo, "weapon_choose")
	weapon_choose()
EndFunc

Func weapon_choose()
	local $temp_weapon = IniReadSection(@WorkingDir & "\DB\Weapon.ini", $WeaponList[_GUICtrlComboBox_GetCurSel($WeaponCombo)+1])

	$WeaponType = $temp_weapon[1][1]
	Select
		Case $WeaponType = "Switch Axe"
			$WeaponBloatMod = 3.5
		Case $WeaponType = "Hammer"
			$WeaponBloatMod = 5.2
		Case $WeaponType = "Hunting Horn"
			$WeaponBloatMod = 4.2
		Case $WeaponType = "Great Sword"
			$WeaponBloatMod = 4.8
		Case $WeaponType = "Charge Blade"
			$WeaponBloatMod = 3.6
		Case $WeaponType = "Long Sword"
			$WeaponBloatMod = 3.3
		Case $WeaponType = "Insect Glaive"
			$WeaponBloatMod = 3.1
		Case $WeaponType = "Lance"
			$WeaponBloatMod = 2.3
		Case $WeaponType = "Gunlance"
			$WeaponBloatMod = 2.3
		Case $WeaponType = "Sword and Shield"
			$WeaponBloatMod = 1.4
		Case $WeaponType = "Dual Blades"
			$WeaponBloatMod = 1.4
		Case $WeaponType = "Bow"
			$WeaponBloatMod = 1.2
		Case $WeaponType = "Light Bowgun"
			$WeaponBloatMod = 1.3
		Case $WeaponType = "Heavy Bowgun"
			$WeaponBloatMod = 1.5
	EndSelect

	$WeaponName = $WeaponList[_GUICtrlComboBox_GetCurSel($WeaponCombo)+1]
	$WeaponRaw = $temp_weapon[2][1]
	$WeaponElementalType = $temp_weapon[3][1]
	$WeaponElementalRaw = $temp_weapon[4][1]
	$WeaponElementalHidden = $temp_weapon[5][1]
	$WeaponAffinity = $temp_weapon[6][1]
	$WeaponDefenseBonus = $temp_weapon[7][1]
	$WeaponRarity = $temp_weapon[8][1]

	$WeaponSlotLevels[1] = StringLeft($temp_weapon[9][1],1)
	$WeaponSlotLevels[2] = StringRight(StringLeft($temp_weapon[9][1],2),1)
	$WeaponSlotLevels[3] = StringRight($temp_weapon[9][1],1)

	update_weapon_frame()
EndFunc

Func update_weapon_frame()

	; Augments

	Select
		Case $WeaponRarity = 6
			_GUIEnhanceAnimateWin ($WeaponAugmentButtons[1][1], $button_fade_delay, $GUI_EN_ANI_FADEIN)
			_GUIEnhanceAnimateWin ($WeaponAugmentButtons[1][2], $button_fade_delay, $GUI_EN_ANI_FADEIN)
			GUISetState(@SW_SHOW,$WeaponAugmentButtons[1][2])
			_GUIEnhanceAnimateWin ($WeaponAugmentButtons[2][1], $button_fade_delay, $GUI_EN_ANI_FADEIN)
			_GUIEnhanceAnimateWin ($WeaponAugmentButtons[2][2], $button_fade_delay, $GUI_EN_ANI_FADEIN)
			GUISetState(@SW_SHOW,$WeaponAugmentButtons[2][2])
			_GUIEnhanceAnimateWin ($WeaponAugmentButtons[3][1], $button_fade_delay, $GUI_EN_ANI_FADEIN)
			_GUIEnhanceAnimateWin ($WeaponAugmentButtons[3][2], $button_fade_delay, $GUI_EN_ANI_FADEIN)
			GUISetState(@SW_SHOW,$WeaponAugmentButtons[3][2])
		case $WeaponRarity = 7
			_GUIEnhanceAnimateWin ($WeaponAugmentButtons[1][1], $button_fade_delay, $GUI_EN_ANI_FADEIN)
			_GUIEnhanceAnimateWin ($WeaponAugmentButtons[1][2], $button_fade_delay, $GUI_EN_ANI_FADEIN)
			GUISetState(@SW_SHOW,$WeaponAugmentButtons[1][2])
			_GUIEnhanceAnimateWin ($WeaponAugmentButtons[2][1], $button_fade_delay, $GUI_EN_ANI_FADEIN)
			_GUIEnhanceAnimateWin ($WeaponAugmentButtons[2][2], $button_fade_delay, $GUI_EN_ANI_FADEIN)
			GUISetState(@SW_SHOW,$WeaponAugmentButtons[2][2])
			_GUIEnhanceAnimateWin ($WeaponAugmentButtons[3][2], $button_fade_delay, $GUI_EN_ANI_FADEOUT)
			_GUIEnhanceAnimateWin ($WeaponAugmentButtons[3][1], $button_fade_delay, $GUI_EN_ANI_FADEOUT)
		case $WeaponRarity = 8
			_GUIEnhanceAnimateWin ($WeaponAugmentButtons[1][1], $button_fade_delay, $GUI_EN_ANI_FADEIN)
			_GUIEnhanceAnimateWin ($WeaponAugmentButtons[1][2], $button_fade_delay, $GUI_EN_ANI_FADEIN)
			GUISetState(@SW_SHOW,$WeaponAugmentButtons[1][2])
			_GUIEnhanceAnimateWin ($WeaponAugmentButtons[2][2], $button_fade_delay, $GUI_EN_ANI_FADEOUT)
			_GUIEnhanceAnimateWin ($WeaponAugmentButtons[2][1], $button_fade_delay, $GUI_EN_ANI_FADEOUT)
			_GUIEnhanceAnimateWin ($WeaponAugmentButtons[3][2], $button_fade_delay, $GUI_EN_ANI_FADEOUT)
			_GUIEnhanceAnimateWin ($WeaponAugmentButtons[3][1], $button_fade_delay, $GUI_EN_ANI_FADEOUT)
	EndSelect

	; Clear augments and gems
	GUICtrlSetData($WeaponAugmentButtons[1][5], "- - - - -")
	GUICtrlSetData($WeaponAugmentButtons[2][5], "- - - - -")
	GUICtrlSetData($WeaponAugmentButtons[3][5], "- - - - -")
	GUICtrlSetColor($WeaponAugmentButtons[1][5], $COLOR_WHITE)
	GUICtrlSetColor($WeaponAugmentButtons[2][5], $COLOR_WHITE)
	GUICtrlSetColor($WeaponAugmentButtons[3][5], $COLOR_WHITE)
	$WeaponSlotsGems[1] = "none"
	$WeaponSlotsGems[2] = "none"
	$WeaponSlotsGems[3] = "none"
	$WeaponAugments[1] = "none"
	$WeaponAugments[2] = "none"
	$WeaponAugments[3] = "none"

	; Gems

;~ 	MsgBox('','',StringLeft($WeaponSlotLevels,1) & " " & StringRight(StringLeft($WeaponSlotLevels,2),1) & " " & StringRight($WeaponSlotLevels,1))

	For $i=1 to 3
		If $WeaponSlotLevels[$i] <> 0 Then
			If $WeaponSlotLevelsOld[$i]=0 then _GUIEnhanceAnimateWin ($WeaponSlotBorder[$i], $button_fade_delay, $GUI_EN_ANI_FADEIN)
			If $WeaponSlotLevelsOld[$i]=0 then
				GUISetState(@SW_SHOW, $WeaponSlotButton[$i][0])
				GUICtrlDelete($WeaponSlotButton[$i][1])
				$WeaponSlotButton[$i][1] = GUICtrlCreatePic(@WorkingDir & "\Images\UI\bk\Gem" & $WeaponSlotLevels[$i] &".bmp",  0, 0, 19, 19)
				GUICtrlSetOnEvent($WeaponSlotButton[$i][1], "show_jewels_gui")
				_GUIEnhanceAnimateWin ($WeaponSlotButton[$i][0], $button_fade_delay, $GUI_EN_ANI_FADEIN)
			Else
				If $WeaponSlotLevelsOld[$i] <> $WeaponSlotLevels[$i] Then
					_GUIEnhanceAnimateWin ($WeaponSlotButton[$i][0], $button_fade_delay, $GUI_EN_ANI_FADEOUT)
					GUISetState(@SW_SHOW, $WeaponSlotButton[$i][0])
					GUICtrlDelete($WeaponSlotButton[$i][1])
					$WeaponSlotButton[$i][1] = GUICtrlCreatePic(@WorkingDir & "\Images\UI\bk\Gem" & $WeaponSlotLevels[$i] &".bmp",  0, 0, 19, 19)
					GUICtrlSetOnEvent($WeaponSlotButton[$i][1], "show_jewels_gui")
					_GUIEnhanceAnimateWin ($WeaponSlotButton[$i][0], $button_fade_delay, $GUI_EN_ANI_FADEIN)
				EndIf
			EndIf
		EndIf
	Next

	for $i = 1 to 3
		If $WeaponSlotLevels[4-$i] = 0 Then
;~ 			MsgBox('','',$WeaponSlotLevelsOld[4-$i])
			If $WeaponSlotLevelsOld[4-$i]<>0 then _GUIEnhanceAnimateWin ($WeaponSlotButton[4-$i][0], $button_fade_delay, $GUI_EN_ANI_FADEOUT)
			If $WeaponSlotLevelsOld[4-$i]<>0 then _GUIEnhanceAnimateWin ($WeaponSlotBorder[4-$i], $button_fade_delay, $GUI_EN_ANI_FADEOUT)
		EndIf
		$WeaponSlotLevelsOld[4-$i] = $WeaponSlotLevels[4-$i]
	Next

	If $init_trigger = False Then $update_skills_required = True
	If $init_trigger = False Then $update_defense_stats_required = True
EndFunc

Func init_skills()
	;	Reading skills

	local $SkillsShortLevel = IniReadSection(@WorkingDir & "\DB\Skills.ini", "Skills")
;~ 	MsgBox('','',$SkillsShortLevel[0][0])
	Global $SkillsBase[150][6]
	Global $SkillsWeHave[100][6]
	Global $SkillsWeHadCounter = 0
	Global $SkillsWeHadMaxLevels[100]
	Global $SkillsWeHadCurrentLevels[100]
	Global $SkillsWeHadIcons[100]
	$SkillsBase[0][0] = $SkillsShortLevel[0][0]

	For $i = 1 To $SkillsShortLevel[0][0]
		local $temp = StringSplit($SkillsShortLevel[$i][1], ",")
		$SkillsBase[$i][0] = $SkillsShortLevel[$i][0]
		$SkillsBase[$i][1] = $temp[1]
		$SkillsBase[$i][2] = $temp[2]
		$SkillsBase[$i][5] = $temp[5]
;~ 		MsgBox('','',$SkillsBase[$i][0] & ' = ' & $SkillsBase[$i][1] & ' , max level ' & $SkillsBase[$i][2])
	Next
EndFunc

Func compile_skills()
	$update_skills_running = True
	;creating unsorted list
	local $SkillsBulk[150][3]
	$SkillsBulk[0][0] = 0
	;getting from head
	For $i = 1 to $HeadSkills[0][0]
		$SkillsBulk[$SkillsBulk[0][0]+1][0] = "Head"
		$SkillsBulk[$SkillsBulk[0][0]+1][1] = $HeadSkills[$i][1]
		$SkillsBulk[$SkillsBulk[0][0]+1][2] = $HeadSkills[$i][2]
;~ 		MsgBox('', '', "We have skill " & $SkillsBulk[$SkillsBulk[0][0]+1][1] & " +" & $SkillsBulk[$SkillsBulk[0][0]+1][2] & " from " & $SkillsBulk[$SkillsBulk[0][0]+1][0])
		$SkillsBulk[0][0] = $SkillsBulk[0][0] + 1
	Next
	;getting from chest
	For $i = 1 to $ChestSkills[0][0]
		$SkillsBulk[$SkillsBulk[0][0]+1][0] = "Chest"
		$SkillsBulk[$SkillsBulk[0][0]+1][1] = $ChestSkills[$i][1]
		$SkillsBulk[$SkillsBulk[0][0]+1][2] = $ChestSkills[$i][2]
;~ 		MsgBox('', '', "We have skill " & $SkillsBulk[$SkillsBulk[0][0]+1][1] & " +" & $SkillsBulk[$SkillsBulk[0][0]+1][2] & " from " & $SkillsBulk[$SkillsBulk[0][0]+1][0])
		$SkillsBulk[0][0] = $SkillsBulk[0][0] + 1
	Next
	;getting from hands
	For $i = 1 to $HandsSkills[0][0]
		$SkillsBulk[$SkillsBulk[0][0]+1][0] = "Hands"
		$SkillsBulk[$SkillsBulk[0][0]+1][1] = $HandsSkills[$i][1]
		$SkillsBulk[$SkillsBulk[0][0]+1][2] = $HandsSkills[$i][2]
;~ 		MsgBox('', '', "We have skill " & $SkillsBulk[$SkillsBulk[0][0]+1][1] & " +" & $SkillsBulk[$SkillsBulk[0][0]+1][2] & " from " & $SkillsBulk[$SkillsBulk[0][0]+1][0])
		$SkillsBulk[0][0] = $SkillsBulk[0][0] + 1
	Next
	;getting from belt
	For $i = 1 to $BeltSkills[0][0]
		$SkillsBulk[$SkillsBulk[0][0]+1][0] = "Belt"
		$SkillsBulk[$SkillsBulk[0][0]+1][1] = $BeltSkills[$i][1]
		$SkillsBulk[$SkillsBulk[0][0]+1][2] = $BeltSkills[$i][2]
;~ 		MsgBox('', '', "We have skill " & $SkillsBulk[$SkillsBulk[0][0]+1][1] & " +" & $SkillsBulk[$SkillsBulk[0][0]+1][2] & " from " & $SkillsBulk[$SkillsBulk[0][0]+1][0])
		$SkillsBulk[0][0] = $SkillsBulk[0][0] + 1
	Next
	;getting from boots
	For $i = 1 to $BootsSkills[0][0]
		$SkillsBulk[$SkillsBulk[0][0]+1][0] = "Boots"
		$SkillsBulk[$SkillsBulk[0][0]+1][1] = $BootsSkills[$i][1]
		$SkillsBulk[$SkillsBulk[0][0]+1][2] = $BootsSkills[$i][2]
;~ 		MsgBox('', '', "We have skill " & $SkillsBulk[$SkillsBulk[0][0]+1][1] & " +" & $SkillsBulk[$SkillsBulk[0][0]+1][2] & " from " & $SkillsBulk[$SkillsBulk[0][0]+1][0])
		$SkillsBulk[0][0] = $SkillsBulk[0][0] + 1
	Next

	For $i = 1 to 3
		If $WeaponSlotsGems[$i] <> "none" Then
;~ 			MsgBox('','',$WeaponSlotsGems[$i])
			$SkillsBulk[$SkillsBulk[0][0]+1][0] = "Weapon Slot," & $i
			$SkillsBulk[$SkillsBulk[0][0]+1][1] = $WeaponSlotsGems[$i]
			$SkillsBulk[$SkillsBulk[0][0]+1][2] = 1
			$SkillsBulk[0][0] = $SkillsBulk[0][0] + 1
		EndIf
		If $HeadSlotsGems[$i] <> "none" Then
			$SkillsBulk[$SkillsBulk[0][0]+1][0] = "Head Slot," & $i
			$SkillsBulk[$SkillsBulk[0][0]+1][1] = $HeadSlotsGems[$i]
			$SkillsBulk[$SkillsBulk[0][0]+1][2] = 1
			$SkillsBulk[0][0] = $SkillsBulk[0][0] + 1
		EndIf
		If $ChestSlotsGems[$i] <> "none" Then
			$SkillsBulk[$SkillsBulk[0][0]+1][0] = "Chest Slot," & $i
			$SkillsBulk[$SkillsBulk[0][0]+1][1] = $ChestSlotsGems[$i]
			$SkillsBulk[$SkillsBulk[0][0]+1][2] = 1
			$SkillsBulk[0][0] = $SkillsBulk[0][0] + 1
		EndIf
		If $HandsSlotsGems[$i] <> "none" Then
			$SkillsBulk[$SkillsBulk[0][0]+1][0] = "Hands Slot," & $i
			$SkillsBulk[$SkillsBulk[0][0]+1][1] = $HandsSlotsGems[$i]
			$SkillsBulk[$SkillsBulk[0][0]+1][2] = 1
			$SkillsBulk[0][0] = $SkillsBulk[0][0] + 1
		EndIf
		If $BeltSlotsGems[$i] <> "none" Then
			$SkillsBulk[$SkillsBulk[0][0]+1][0] = "Belt Slot," & $i
			$SkillsBulk[$SkillsBulk[0][0]+1][1] = $BeltSlotsGems[$i]
			$SkillsBulk[$SkillsBulk[0][0]+1][2] = 1
			$SkillsBulk[0][0] = $SkillsBulk[0][0] + 1
		EndIf
		If $BootsSlotsGems[$i] <> "none" Then
			$SkillsBulk[$SkillsBulk[0][0]+1][0] = "Boots Slot," & $i
			$SkillsBulk[$SkillsBulk[0][0]+1][1] = $BootsSlotsGems[$i]
			$SkillsBulk[$SkillsBulk[0][0]+1][2] = 1
			$SkillsBulk[0][0] = $SkillsBulk[0][0] + 1
		EndIf
	Next

	;charms
	For $i = 1 to $CharmSkills[0][0]
		$SkillsBulk[$SkillsBulk[0][0]+1][0] = "Charm"
		$SkillsBulk[$SkillsBulk[0][0]+1][1] = $CharmSkills[$i][1]
		$SkillsBulk[$SkillsBulk[0][0]+1][2] = $CharmUpgrade
		$SkillsBulk[0][0] = $SkillsBulk[0][0] + 1
	Next

	;Sorting Skills
	$SkillsWeHave[0][0] = 0
	local $skill_match_found = false
	For $i = 1 to $SkillsBulk[0][0]
		for $j =1 to $SkillsWeHave[0][0]
			If $SkillsWeHave[$j][1] = $SkillsBulk[$i][1] Then
				$SkillsWeHave[$j][2] = $SkillsWeHave[$j][2] + $SkillsBulk[$i][2]
				$skill_match_found = True
;~ 				MsgBox("","","")
			EndIf
		Next

		If $skill_match_found = False Then
			$SkillsWeHave[$SkillsWeHave[0][0]+1][1] = $SkillsBulk[$i][1]
			$SkillsWeHave[$SkillsWeHave[0][0]+1][2] = $SkillsBulk[$i][2]
			$SkillsWeHave[0][0] = $SkillsWeHave[0][0] + 1
		EndIf
		$skill_match_found = false
	Next

	for $i = 1 to $SkillsWeHave[0][0]
;~ 		MsgBox('', '', "We have skill " & $SkillsWeHave[$i][1] & " +" & $SkillsWeHave[$i][2])
		For $j = 1 to $SkillsBase[0][0]
			If $SkillsWeHave[$i][1] = $SkillsBase[$j][0] Then
				$SkillsWeHave[$i][3] = $SkillsBase[$j][1]
				$SkillsWeHave[$i][4] = $SkillsBase[$j][2]
				$SkillsWeHave[$i][5] = $SkillsBase[$j][5]
				$j = 999
			EndIf
		Next
	Next

	;sorting
	local $sorting_complete = false
	local $temp[6]
	While not($sorting_complete)
		$sorting_complete = True
		For $i = 1 to $SkillsWeHave[0][0]-1
			If $SkillsWeHave[$i][4] < $SkillsWeHave[$i+1][4] Then
				For $j = 1 to 5
					$temp[$j] = $SkillsWeHave[$i][$j]
				Next
				For $j = 1 to 5
					$SkillsWeHave[$i][$j] = $SkillsWeHave[$i+1][$j]
				Next
				For $j = 1 to 5
					$SkillsWeHave[$i+1][$j] = $temp[$j]
				Next
				$sorting_complete = False
			EndIf
		Next
	WEnd

	While not($sorting_complete)
		$sorting_complete = True
		For $i = 1 to $SkillsWeHave[0][0]-1
			If ($SkillsWeHave[$i][4] = $SkillsWeHave[$i+1][4]) and ($SkillsWeHave[$i][2] < $SkillsWeHave[$i+1][4]) Then
				For $j = 1 to 5
					$temp[$j] = $SkillsWeHave[$i][$j]
				Next
				For $j = 1 to 5
					$SkillsWeHave[$i][$j] = $SkillsWeHave[$i+1][$j]
				Next
				For $j = 1 to 5
					$SkillsWeHave[$i+1][$j] = $temp[$j]
				Next
				$sorting_complete = False
			EndIf
		Next
	WEnd

	While not($sorting_complete)
		$sorting_complete = True
		For $i = 1 to $SkillsWeHave[0][0]-1
			If ($SkillsWeHave[$i][4] = $SkillsWeHave[$i+1][4]) and ($SkillsWeHave[$i][2] = $SkillsWeHave[$i+1][4]) And (StringLeft($SkillsWeHave[$i][1],1) > StringLeft($SkillsWeHave[$i+1][1],1)) Then
				For $j = 1 to 5
					$temp[$j] = $SkillsWeHave[$i][$j]
				Next
				For $j = 1 to 5
					$SkillsWeHave[$i][$j] = $SkillsWeHave[$i+1][$j]
				Next
				For $j = 1 to 5
					$SkillsWeHave[$i+1][$j] = $temp[$j]
				Next
				$sorting_complete = False
			EndIf
		Next
	WEnd

	;check if current lvl > max lvl

	for $i = 1 to $SkillsWeHave[0][0]
		If $SkillsWeHave[$i][2] > $SkillsWeHave[$i][4] Then
			$SkillsWeHave[$i][2] = $SkillsWeHave[$i][4]
		EndIf
	Next

	build_skills_list()
EndFunc

Func build_skills_list()

;~ MsgBox('','',$SkillsWeHave[0][0] & " new " & $SkillsWeHadCounter & " old")
	If $skills_menu_shown Then
		for $i = 1 to $SkillsWeHave[0][0]

			_GUIEnhanceAnimateWin ($skill_icons[$i][1], $button_fade_delay, $GUI_EN_ANI_FADEIN)

			If $skills_menu_show_initiated Then
				GUISetState(@SW_DISABLE, $skill_icons[$i][2])
				GUICtrlDelete($skill_icons[$i][3])
				$skill_icons[$i][3] = GUICtrlCreatePic(@WorkingDir & "\Images\UI\Skills\Skill" & $SkillsWeHave[$i][5] &".bmp", 0, 0, 31, 31)
				_GUIEnhanceAnimateWin ($skill_icons[$i][2],$button_fade_delay,$GUI_EN_ANI_FADEIN)
			EndIf

			If $SkillsWeHadIcons[$i] <> $SkillsWeHave[$i][5] and Not($skills_menu_show_initiated) Then
				_GUIEnhanceAnimateWin ($skill_icons[$i][2], $button_fade_delay, $GUI_EN_ANI_FADEOUT)
				GUISetState(@SW_DISABLE, $skill_icons[$i][2])
				GUICtrlDelete($skill_icons[$i][3])
				$skill_icons[$i][3] = GUICtrlCreatePic(@WorkingDir & "\Images\UI\Skills\Skill" & $SkillsWeHave[$i][5] &".bmp", 0, 0, 31, 31)
				_GUIEnhanceAnimateWin ($skill_icons[$i][2], $button_fade_delay, $GUI_EN_ANI_FADEIN)
			EndIf

			If $i > $SkillsWeHadCounter Then
				GUISetState(@SW_DISABLE, $skill_icons[$i][2])
				GUICtrlDelete($skill_icons[$i][3])
				$skill_icons[$i][3] = GUICtrlCreatePic(@WorkingDir & "\Images\UI\Skills\Skill" & $SkillsWeHave[$i][5] &".bmp", 0, 0, 31, 31)
				_GUIEnhanceAnimateWin ($skill_icons[$i][2],50,$GUI_EN_ANI_FADEIN)
			EndIf

			If $skills_menu_show_initiated Then
				_GUIEnhanceCtrlFade ($skill_icons[$i][6], 25, True, False, 0x2B2C2A, 0xFFFFFF, 3)
			EndIf

			If (GUICtrlRead($skill_icons[$i][6]) <> $SkillsWeHave[$i][3]) And ($i <= $SkillsWeHadCounter) Then
				_GUIEnhanceCtrlFade ($skill_icons[$i][6], 25, True, False, 0xFFFFFF, 0x2B2C2A, 3)
				GUICtrlSetData($skill_icons[$i][6], $SkillsWeHave[$i][3])
				_GUIEnhanceCtrlFade ($skill_icons[$i][6], 25, True, False, 0x2B2C2A, 0xFFFFFF, 3)
			EndIf

			If $i > $SkillsWeHadCounter Then
				GUICtrlSetData($skill_icons[$i][6], $SkillsWeHave[$i][3])
				_GUIEnhanceCtrlFade ($skill_icons[$i][6], 25, True, False, 0x2B2C2A, 0xFFFFFF, 3)
			EndIf

			For $j = 1 to $SkillsWeHave[$i][4]
				_GUIEnhanceAnimateWin ($skill_icons[$i][10+$j], $button_fade_delay, $GUI_EN_ANI_FADEIN)
			Next

			For $j = 1 to $SkillsWeHave[$i][2]
				_GUIEnhanceAnimateWin ($skill_icons[$i][20+$j], $button_fade_delay, $GUI_EN_ANI_FADEIN)
			Next

			For $j = 1 to $SkillsWeHave[$i][4]-$SkillsWeHave[$i][2]
				_GUIEnhanceAnimateWin ($skill_icons[$i][28-$j], $button_fade_delay, $GUI_EN_ANI_FADEOUT)
			Next

			If $skills_menu_show_initiated Then
				_GUIEnhanceCtrlFade ($skill_icons[$i][7], 25, True, False, 0x2B2C2A, 0xFFFFFF, 3)
			EndIf

			If (GUICtrlRead($skill_icons[$i][7]) <> 'Level ' & $SkillsWeHave[$i][2]) And ($i <= $SkillsWeHadCounter) Then
				_GUIEnhanceCtrlFade ($skill_icons[$i][7], 25, True, False, 0xFFFFFF, 0x151515, 3)
				GUICtrlSetData($skill_icons[$i][7], 'Level ' & $SkillsWeHave[$i][2])
				_GUIEnhanceCtrlFade ($skill_icons[$i][7], 25, True, False, 0x151515, 0xFFFFFF, 3)
			EndIf

			If $i > $SkillsWeHadCounter Then
				GUICtrlSetData($skill_icons[$i][7], 'Level ' & $SkillsWeHave[$i][2])
				_GUIEnhanceCtrlFade ($skill_icons[$i][7], 25, True, False, 0x151515, 0xFFFFFF, 3)
			EndIf

			for $j = 1 to ($SkillsWeHadCurrentLevels[$i] - $SkillsWeHave[$i][2])
				_GUIEnhanceAnimateWin ($skill_icons[$i][20+$SkillsWeHadCurrentLevels[$i]+1-$j], $button_fade_delay, $GUI_EN_ANI_FADEOUT)
			Next

			for $j = 1 to ($SkillsWeHadMaxLevels[$i] - $SkillsWeHave[$i][4])
				_GUIEnhanceAnimateWin ($skill_icons[$i][10+$SkillsWeHadMaxLevels[$i]+1-$j], $button_fade_delay, $GUI_EN_ANI_FADEOUT)
			Next
			$SkillsWeHadMaxLevels[$i] = $SkillsWeHave[$i][4]
			$SkillsWeHadCurrentLevels[$i] = $SkillsWeHave[$i][2]
			$SkillsWeHadIcons[$i] = $SkillsWeHave[$i][5]
		Next

		$skills_menu_show_initiated = false

		for $i = $SkillsWeHadCounter to $SkillsWeHave[0][0] + 1 Step -1
			for $j = 1 to 7
				_GUIEnhanceAnimateWin ($skill_icons[$i][28-$j], $button_fade_delay, $GUI_EN_ANI_FADEOUT)
			Next

			for $j = 1 to 7
			_GUIEnhanceAnimateWin ($skill_icons[$i][18-$j], $button_fade_delay, $GUI_EN_ANI_FADEOUT)
			Next
			_GUIEnhanceCtrlFade ($skill_icons[$i][7], $button_fade_delay, True, False, 0xFFFFFF, 0x2B2C2A, 3)
			_GUIEnhanceCtrlFade ($skill_icons[$i][6], $button_fade_delay, True, False, 0xFFFFFF, 0x2B2C2A, 3)
			_GUIEnhanceAnimateWin ($skill_icons[$i][2], $button_fade_delay, $GUI_EN_ANI_FADEOUT)
			_GUIEnhanceAnimateWin ($skill_icons[$i][1], $button_fade_delay, $GUI_EN_ANI_FADEOUT)

		Next
	EndIf

	$SkillsWeHadCounter = $SkillsWeHave[0][0]
	$update_skills_running = False
;~ 	MsgBox('','','')
EndFunc

Func hide_skills_menu()
	If $skills_menu_shown Then
		for $i = $SkillsWeHave[0][0] to 1 step -1




;~ 			If (GUICtrlRead($skill_icons[$i][6]) <> $SkillsWeHave[$i][3]) And ($i <= $SkillsWeHadCounter) Then
;~ 				_GUIEnhanceCtrlFade ($skill_icons[$i][6], 50, True, False, 0xFFFFFF, 0x2B2C2A, 3)
;~ 				GUICtrlSetData($skill_icons[$i][6], $SkillsWeHave[$i][3])
;~ 				_GUIEnhanceCtrlFade ($skill_icons[$i][6], 50, True, False, 0x2B2C2A, 0xFFFFFF, 3)
;~ 			EndIf

;~ 			If (GUICtrlRead($skill_icons[$i][7]) <> 'Level ' & $SkillsWeHave[$i][2]) And ($i <= $SkillsWeHadCounter) Then
;~ 				_GUIEnhanceCtrlFade ($skill_icons[$i][7], 50, True, False, 0xFFFFFF, 0x151515, 3)
;~ 				GUICtrlSetData($skill_icons[$i][7], 'Level ' & $SkillsWeHave[$i][2])
;~ 				_GUIEnhanceCtrlFade ($skill_icons[$i][7], 50, True, False, 0x151515, 0xFFFFFF, 3)
;~ 			EndIf

;~ 			If $i > $SkillsWeHadCounter Then
;~ 				GUICtrlSetData($skill_icons[$i][6], $SkillsWeHave[$i][3])
;~ 				_GUIEnhanceCtrlFade ($skill_icons[$i][6], 50, True, False, 0x2B2C2A, 0xFFFFFF, 3)
;~ 				GUICtrlSetData($skill_icons[$i][7], 'Level ' & $SkillsWeHave[$i][2])
;~ 				_GUIEnhanceCtrlFade ($skill_icons[$i][7], 50, True, False, 0x151515, 0xFFFFFF, 3)
;~ 			EndIf

			For $j = 1 to $SkillsWeHave[$i][2]
				_GUIEnhanceAnimateWin ($skill_icons[$i][20+$SkillsWeHave[$i][2]+1-$j], $button_fade_delay, $GUI_EN_ANI_FADEOUT)
			Next

			For $j = 1 to $SkillsWeHave[$i][4]
				_GUIEnhanceAnimateWin ($skill_icons[$i][10+$SkillsWeHave[$i][4]+1-$j], $button_fade_delay, $GUI_EN_ANI_FADEOUT)
			Next
			_GUIEnhanceCtrlFade ($skill_icons[$i][7], 25, True, False, 0xFFFFFF, 0x2B2C2A, 3)
			_GUIEnhanceCtrlFade ($skill_icons[$i][6], 25, True, False, 0xFFFFFF, 0x2B2C2A, 3)
			_GUIEnhanceAnimateWin ($skill_icons[$i][2], $button_fade_delay,$GUI_EN_ANI_FADEOUT)
			_GUIEnhanceAnimateWin ($skill_icons[$i][1], $button_fade_delay, $GUI_EN_ANI_FADEOUT)


;~ 			For $j = 1 to $SkillsWeHave[$i][4]-$SkillsWeHave[$i][2]
;~ 				_GUIEnhanceAnimateWin ($skill_icons[$i][28-$j], 50, $GUI_EN_ANI_FADEOUT)
;~ 			Next

;~ 		for $j = 1 to ($SkillsWeHadCurrentLevels[$i] - $SkillsWeHave[$i][2])
;~ 			_GUIEnhanceAnimateWin ($skill_icons[$i][20+$SkillsWeHadCurrentLevels[$i]+1-$j], 50, $GUI_EN_ANI_FADEOUT)
;~ 		Next
;~ 			for $j = 1 to ($SkillsWeHadMaxLevels[$i] - $SkillsWeHave[$i][4])
;~ 				_GUIEnhanceAnimateWin ($skill_icons[$i][10+$SkillsWeHadMaxLevels[$i]+1-$j], 50, $GUI_EN_ANI_FADEOUT)
;~ 			Next
;~ 			$SkillsWeHadMaxLevels[$i] = $SkillsWeHave[$i][4]
;~ 			$SkillsWeHadCurrentLevels[$i] = $SkillsWeHave[$i][2]
;~ 		Next

;~ 		for $i = $SkillsWeHave[0][0] + 1 to $SkillsWeHadCounter
;~ 			for $j = 1 to 7
;~ 				_GUIEnhanceAnimateWin ($skill_icons[$i][28-$j], 50, $GUI_EN_ANI_FADEOUT)
;~ 			Next

;~ 			for $j = 1 to 7
;~ 			_GUIEnhanceAnimateWin ($skill_icons[$i][18-$j], 50, $GUI_EN_ANI_FADEOUT)
;~ 			Next
;~ 			_GUIEnhanceCtrlFade ($skill_icons[$i][7], 50, True, False, 0xFFFFFF, 0x2B2C2A, 3)
;~ 			_GUIEnhanceCtrlFade ($skill_icons[$i][6], 50, True, False, 0xFFFFFF, 0x2B2C2A, 3)
;~ 			_GUIEnhanceAnimateWin ($skill_icons[$i][1], 200, $GUI_EN_ANI_FADEOUT)

		Next
	EndIf
EndFunc

Func update_defense_stats()
	$update_defense_stats_running = True
	;update quick stats
	For $i = 1 to 6
		If GUICtrlRead($ArmorQuickStats[1][$i]) <> $HeadDef[$i] Then _GuiCtrlFadeSetData($ArmorQuickStats[1][$i], 0xFFFFFF, 0x2B2C2A, 0xFFFFFF, $HeadDef[$i])
	Next

	For $i = 1 to 6
		If GUICtrlRead($ArmorQuickStats[2][$i]) <> $ChestDef[$i] Then _GuiCtrlFadeSetData($ArmorQuickStats[2][$i], 0xFFFFFF, 0x2B2C2A, 0xFFFFFF, $ChestDef[$i])
	Next

	For $i = 1 to 6
		If GUICtrlRead($ArmorQuickStats[3][$i]) <> $HandsDef[$i] Then _GuiCtrlFadeSetData($ArmorQuickStats[3][$i], 0xFFFFFF, 0x2B2C2A, 0xFFFFFF, $HandsDef[$i])
	Next

	For $i = 1 to 6
		If GUICtrlRead($ArmorQuickStats[4][$i]) <> $BeltDef[$i] Then _GuiCtrlFadeSetData($ArmorQuickStats[4][$i], 0xFFFFFF, 0x2B2C2A, 0xFFFFFF, $BeltDef[$i])
	Next

	For $i = 1 to 6
		If GUICtrlRead($ArmorQuickStats[5][$i]) <> $BootsDef[$i] Then _GuiCtrlFadeSetData($ArmorQuickStats[5][$i], 0xFFFFFF, 0x2B2C2A, 0xFFFFFF, $BootsDef[$i])
	Next

	;augments
	Local $affinity_check = False
	local $augmented_damage = $WeaponRaw / $WeaponBloatMod
	Local $augmented_element = $WeaponElementalRaw / 10
	Local $augmented_affinity = $WeaponAffinity
	Local $augmented_crit = 1.25
	Local $augmented_elem_crit = 1.00
	Local $augmented_def = 0
	Local $effective_raw = 0
	Local $sharpness = 0
	Local $sharpness_mod = 0
	Local $effective_element = 0
	Local $augmented_hp = 100

	;checking for attack bonus
	For $i = 1 to $SkillsWeHave[0][0]
		;airborne from _base_damage
		If $SkillsWeHave[$i][1] = "aie" Then
			$augmented_damage = $augmented_damage*1.1
		EndIf

		;herois from _base_ damage
		If $SkillsWeHave[$i][1] = "hes" Then
			If $SkillsWeHave[$i][2] < 5 Then
				$augmented_damage = $augmented_damage*(1 + 0.05*$SkillsWeHave[$i][2])
			Else
				$augmented_damage = $augmented_damage*(1 + 0.05*$SkillsWeHave[$i][2] + 0.05)
			EndIf
		EndIf

		;fortify from _base_ damage
		If $SkillsWeHave[$i][1] = "foy" Then
			$augmented_damage = $augmented_damage*1.2
		EndIf

		If $SkillsWeHave[$i][1] = "att" Then
			$augmented_damage = $augmented_damage + 3*$SkillsWeHave[$i][2]
		EndIf

		If $SkillsWeHave[$i][1] = "pee" Then
			If $SkillsWeHave[$i][2] <= 2 Then
				$augmented_damage = $augmented_damage + 5*$SkillsWeHave[$i][2]
			Else
				$augmented_damage = $augmented_damage + 5*$SkillsWeHave[$i][2] + 5
			EndIf
		EndIf

		If $SkillsWeHave[$i][1] = "ret" Then
			$augmented_damage = $augmented_damage + 5*$SkillsWeHave[$i][2]
		EndIf

		If $SkillsWeHave[$i][1] = "agr" Then
			$augmented_damage = $augmented_damage + 4*$SkillsWeHave[$i][2]*0.7
		EndIf
	Next

	;affinity
	For $i = 1 to $SkillsWeHave[0][0]
		;herois from _base_ damage
		If $SkillsWeHave[$i][1] = "cre" Then
			If $SkillsWeHave[$i][2] <= 2 Then
				$augmented_affinity = $augmented_affinity + 3*$SkillsWeHave[$i][2]
			Else
				$augmented_affinity = $augmented_affinity + 5*($SkillsWeHave[$i][2] - 1)
			EndIf
		EndIf

		If $SkillsWeHave[$i][1] = "agr" Then
				$augmented_affinity = $augmented_affinity + 3*$SkillsWeHave[$i][2]*0.7
		EndIf

		If $SkillsWeHave[$i][1] = "mat" Then
				$augmented_affinity = $augmented_affinity + 10*$SkillsWeHave[$i][2]
		EndIf

		If $SkillsWeHave[$i][1] = "afg" Then
				$augmented_affinity = $augmented_affinity + 30
		EndIf

		If $SkillsWeHave[$i][1] = "wet" Then
			If $SkillsWeHave[$i][2] <= 2 Then
				$augmented_affinity = $augmented_affinity + 15*$SkillsWeHave[$i][2]
			Else
				$augmented_affinity = $augmented_affinity + 50
			EndIf
		EndIf

		If $SkillsWeHave[$i][1] = "lar" Then
				$augmented_affinity = $augmented_affinity + 10*$SkillsWeHave[$i][2]
		EndIf

		If $SkillsWeHave[$i][1] = "crw" Then
			If $SkillsWeHave[$i][2] <= 2 Then
				$augmented_affinity = $augmented_affinity + 30*$SkillsWeHave[$i][2]
			Else
				$augmented_affinity = $augmented_affinity + 100
			EndIf
		EndIf
	Next

	;crit boost
	For $i = 1 to $SkillsWeHave[0][0]
		If $SkillsWeHave[$i][1] = "crt" Then
			$augmented_crit = $augmented_crit + 0.05*$SkillsWeHave[$i][2]
		EndIf
	Next


	;defense

	For $i = 1 to 6
		$Defense_stats[$i] = $HeadDef[$i] + $ChestDef[$i] + $HandsDef[$i] + $BeltDef[$i] + $BootsDef[$i]
	Next

	$Defense_stats[1] = $Defense_stats[1] + 2*($Upgrade_levels[$HeadRarity][$HeadUpgrade] + $Upgrade_levels[$ChestRarity][$ChestUpgrade])
	$Defense_stats[1] = $Defense_stats[1] + 2*($Upgrade_levels[$HandsRarity][$HandsUpgrade] + $Upgrade_levels[$BeltRarity][$BeltUpgrade])
	$Defense_stats[1] = $Defense_stats[1] + 2*$Upgrade_levels[$BootsRarity][$BootsUpgrade]

	For $i = 1 to $SkillsWeHave[0][0]
		;herois from _base_ damage
		If $SkillsWeHave[$i][1] = "foy" Then
			$Defense_stats[1] = $Defense_stats[1]*1.3
		EndIf

		If $SkillsWeHave[$i][1] = "hes" Then
			If $SkillsWeHave[$i][2] <= 4 Then
				$Defense_stats[1] = $Defense_stats[1]+ 10 + 5*$SkillsWeHave[$i][2]
			Else
				$Defense_stats[1] = $Defense_stats[1]+ 15 + 5*$SkillsWeHave[$i][2]
			EndIf
		EndIf

		If $SkillsWeHave[$i][1] = "fie" Then
			If $SkillsWeHave[$i][2] >=3 Then
				$Defense_stats[1] = $Defense_stats[1]+ 10
			EndIf
		EndIf

		If $SkillsWeHave[$i][1] = "wae" Then
			If $SkillsWeHave[$i][2] >=3 Then
				$Defense_stats[1] = $Defense_stats[1]+ 10
			EndIf
		EndIf

		If $SkillsWeHave[$i][1] = "ice" Then
			If $SkillsWeHave[$i][2] >=3 Then
				$Defense_stats[1] = $Defense_stats[1]+ 10
			EndIf
		EndIf

		If $SkillsWeHave[$i][1] = "the" Then
			If $SkillsWeHave[$i][2] >=3 Then
				$Defense_stats[1] = $Defense_stats[1]+ 10
			EndIf
		EndIf

		If $SkillsWeHave[$i][1] = "dre" Then
			If $SkillsWeHave[$i][2] >=3 Then
				$Defense_stats[1] = $Defense_stats[1]+ 10
			EndIf
		EndIf

		If $SkillsWeHave[$i][1] = "det" Then
			$Defense_stats[1] = $Defense_stats[1] + 5*$SkillsWeHave[$i][2]
			;resists from defense boost
			If $SkillsWeHave[$i][2] >= 4 Then
				for $i = 2 to 6
					$Defense_stats[$i] = $Defense_stats[$i] + 3
				Next
			EndIf
		EndIf
	Next

	;resists
	For $i = 1 to $SkillsWeHave[0][0]
		If $SkillsWeHave[$i][1] = "fie" Then
			If $SkillsWeHave[$i][2] <= 2 Then
				$Defense_stats[2] = $Defense_stats[2]+ 6*$SkillsWeHave[$i][2]
			Else
				$Defense_stats[2] = $Defense_stats[2]+ 2 + 6*$SkillsWeHave[$i][2]
			EndIf
		EndIf

		If $SkillsWeHave[$i][1] = "wae" Then
			If $SkillsWeHave[$i][2] <= 2  Then
				$Defense_stats[3] = $Defense_stats[3]+ 6*$SkillsWeHave[$i][2]
			Else
				$Defense_stats[3] = $Defense_stats[3]+ 2 + 6*$SkillsWeHave[$i][2]
			EndIf
		EndIf

		If $SkillsWeHave[$i][1] = "the" Then
			If $SkillsWeHave[$i][2] <= 2 Then
				$Defense_stats[4] = $Defense_stats[4]+ 6*$SkillsWeHave[$i][2]
			Else
				$Defense_stats[4] = $Defense_stats[4]+ 2 + 6*$SkillsWeHave[$i][2]
			EndIf
		EndIf

		If $SkillsWeHave[$i][1] = "ice" Then
			If $SkillsWeHave[$i][2] <= 2 Then
				$Defense_stats[5] = $Defense_stats[5]+ 6*$SkillsWeHave[$i][2]
			Else
				$Defense_stats[5] = $Defense_stats[5]+ 2 + 6*$SkillsWeHave[$i][2]
			EndIf
		EndIf

		If $SkillsWeHave[$i][1] = "dre" Then
			If $SkillsWeHave[$i][2] <= 2 Then
				$Defense_stats[6] = $Defense_stats[6]+ 6*$SkillsWeHave[$i][2]
			Else
				$Defense_stats[6] = $Defense_stats[6]+ 2 + 6*$SkillsWeHave[$i][2]
			EndIf
		EndIf
	Next

	; checking for augments
	For $i = 1 to 3
		Select
			Case $WeaponAugments[$i] = "raw"
				$augmented_damage = $augmented_damage +5
			Case $WeaponAugments[$i] = "aff"
				If $affinity_check = True Then
					$augmented_affinity = $augmented_affinity + 5
				Else
					$augmented_affinity = $augmented_affinity + 10
					$affinity_check = True
				EndIf
			Case $WeaponAugments[$i] = "def"
				$augmented_def = $augmented_def + 10
		EndSelect
	Next

	$Defense_stats[1] = $Defense_stats[1] + $WeaponDefenseBonus + $augmented_def

	;crit boost
	For $i = 1 to $SkillsWeHave[0][0]
		If $SkillsWeHave[$i][1] = "crt" Then
			$augmented_crit = $augmented_crit + 0.05*$SkillsWeHave[$i][2]
		EndIf
	Next

	;effective raw
	$effective_raw = $augmented_damage * (1 + ($augmented_crit - 1) * $augmented_affinity / 100)
	$effective_element = $augmented_element * (1 + ($augmented_elem_crit - 1) * $augmented_affinity / 100)

	;hp
	For $i = 1 to $SkillsWeHave[0][0]
		If $SkillsWeHave[$i][1] = "het" Then
			If $SkillsWeHave[$i][2] <= 2 Then
				$augmented_hp = $augmented_hp + 15*$SkillsWeHave[$i][2]
			Else
				$augmented_hp = $augmented_hp + 15*$SkillsWeHave[$i][2] + 5
			EndIf
		EndIf

	Next

	If GUICtrlRead($Attacks[31]) <> $augmented_damage*$WeaponBloatMod Then _GuiCtrlFadeSetData($Attacks[31], 0xFFFFFF, 0x2B2C2A, 0xFFFFFF, $augmented_damage*$WeaponBloatMod)
	If GUICtrlRead($Attacks[33]) <> $WeaponElementalRaw Then _GuiCtrlFadeSetData($Attacks[33], 0xFFFFFF, 0x2B2C2A, 0xFFFFFF, $WeaponElementalRaw)
	If GUICtrlRead($Attacks[34]) <> $augmented_affinity & '%' Then _GuiCtrlFadeSetData($Attacks[34], 0xFFFFFF, 0x2B2C2A, 0xFFFFFF, $augmented_affinity & "%")

	If GUICtrlRead($Healths[31]) <> $augmented_hp Then _GuiCtrlFadeSetData($Healths[31], 0xFFFFFF, 0x2B2C2A, 0xFFFFFF, $augmented_hp)

	If GUICtrlRead($Attack_bonus[31]) <> Round($effective_raw,1) Then _GuiCtrlFadeSetData($Attack_bonus[31], 0xFFFFFF, 0x2B2C2A, 0xFFFFFF, round($effective_raw,1))
	If GUICtrlRead($Attack_bonus[32]) <> $effective_element Then _GuiCtrlFadeSetData($Attack_bonus[32], 0xFFFFFF, 0x2B2C2A, 0xFFFFFF, $effective_element)
	If GUICtrlRead($Attack_bonus[33]) <> $augmented_damage Then _GuiCtrlFadeSetData($Attack_bonus[33], 0xFFFFFF, 0x2B2C2A, 0xFFFFFF, $augmented_damage)
	If GUICtrlRead($Attack_bonus[34]) <> $augmented_element Then _GuiCtrlFadeSetData($Attack_bonus[34], 0xFFFFFF, 0x2B2C2A, 0xFFFFFF, $augmented_element)
	If GUICtrlRead($Attack_bonus[35]) <> "x" & $augmented_crit Then _GuiCtrlFadeSetData($Attack_bonus[35], 0xFFFFFF, 0x2B2C2A, 0xFFFFFF, "x" & $augmented_crit)
	If (GUICtrlRead($Attack_bonus[36]) = "x1.00") And ($augmented_elem_crit <> 1) Then
		_GuiCtrlFadeSetData($Attack_bonus[36], 0xFFFFFF, 0x2B2C2A, 0xFFFFFF, "x" & $augmented_elem_crit)
	Else
		If (GUICtrlRead($Attack_bonus[36]) <> "x1.00") And (GUICtrlRead($Attack_bonus[36]) <> "x" & $augmented_elem_crit) Then
			_GuiCtrlFadeSetData($Attack_bonus[36], 0xFFFFFF, 0x2B2C2A, 0xFFFFFF, "x" & $augmented_elem_crit)
		EndIf
	EndIf
;~ 	MsgBox('','',$augmented_crit)
	for $i = 1 to 6
		If GUICtrlRead($Defenses[30+$i]) <> $Defense_stats[$i] Then _GuiCtrlFadeSetData($Defenses[30+$i], 0xFFFFFF, 0x2B2C2A, 0xFFFFFF, $Defense_stats[$i])
	Next
	$update_defense_stats_running = False
EndFunc

Func init_head()
	local $HeadArmorSkillTemp

	For $i = 1 To $HeadList[0]
		local $temp_head = IniReadSection(@WorkingDir & "\DB\Head.ini", $HeadList[$i])
		local $HeadArmorSkillTemp  = StringSplit($temp_head[4][1], ",")
		local $Additional_desc = " "
		local $current_skill_temp[2]
		local $desc_skill_temp
		local $Skill_short
		local $Skill_desc

		for $j = 1 to $HeadArmorSkillTemp[0]
			$Skill_short=StringLeft($HeadArmorSkillTemp[$j], StringLen($HeadArmorSkillTemp[$j])-1)
			$Skill_desc=StringRight($HeadArmorSkillTemp[$j],1)

;~ 			If IniRead(@WorkingDir & "\DB\Skills.ini", "Skills", $Skill_short, "error") = "error" then
;~ 				MsgBox("",'', "Error reading skill " & $Skill_short & " at " & $HeadList[$i])
;~ 			EndIf

			$desc_skill_temp = StringSplit(IniRead(@WorkingDir & "\DB\Skills.ini", "Skills", $Skill_short, $Skill_short), ",")
;~ 			MsgBox('','',$Skill_short&" "&$desc_skill_temp[2])
			$Additional_desc = $Additional_desc & "[" & $desc_skill_temp[1] & "+" & $Skill_desc & "]"
		Next
		If $Additional_desc = " [+]" then $Additional_desc = ""
		_GUICtrlComboBox_AddString($HeadCombo, $HeadList[$i] & $Additional_desc)
;~ 		_GUICtrlComboBox_AddString($HeadCombo, $HeadList[$i])
	Next

	_GUICtrlComboBox_SetCurSel($HeadCombo, 0)
	GUICtrlSetOnEvent($HeadCombo, "Head_choose")
	head_choose()
EndFunc

Func head_choose()

	local $temp_head = IniReadSection(@WorkingDir & "\DB\Head.ini", $HeadList[_GUICtrlComboBox_GetCurSel($HeadCombo)+1])
	$HeadDef = StringSplit($temp_head[1][1], " ")
;~ 	$HeadSlotLevels = $temp_head[2][1]
	$HeadRarity = $temp_head[3][1]

	; sorting piece skills
	local $skill_amount = StringSplit($temp_head[4][1], ",")
;~ 	local $check
	$HeadSkills[0][0] = $skill_amount[0] ; 0 0 is amount of skills
	For $i=1 to $HeadSkills[0][0]
		$HeadSkills[$i][1] = StringLeft($skill_amount[$i],StringLen($skill_amount[$i])-1)
		$HeadSkills[$i][2] = StringRight($skill_amount[$i],1)
;~ 		$check = $check & $HeadSkills[$i][1] & " " & $HeadSkills[$i][2] & " "
	Next

	if $HeadSkills[1][1] = '' Then $HeadSkills[0][0] = 0

;~ 	MsgBox('','', $check)

	$HeadSlotLevels[1] = StringLeft($temp_head[2][1],1)
	$HeadSlotLevels[2] = StringRight(StringLeft($temp_head[2][1],2),1)
	$HeadSlotLevels[3] = StringRight($temp_head[2][1],1)

	$HeadSlotsGems[1] = "none"
	$HeadSlotsGems[2] = "none"
	$HeadSlotsGems[3] = "none"

	update_head_frame()
EndFunc

Func update_head_frame()

	For $i=1 to 3
		If $HeadSlotLevels[$i] <> 0 Then
			If $HeadSlotLevelsOld[$i]=0 then _GUIEnhanceAnimateWin ($HeadSlotBorder[$i], $button_fade_delay, $GUI_EN_ANI_FADEIN)
			If $HeadSlotLevelsOld[$i]=0 then
				GUISetState(@SW_SHOW, $HeadSlotButton[$i][0])
				GUICtrlDelete($HeadSlotButton[$i][1])
				$HeadSlotButton[$i][1] = GUICtrlCreatePic(@WorkingDir & "\Images\UI\bk\Gem" & $HeadSlotLevels[$i] &".bmp",  0, 0, 19, 19)
					GUICtrlSetOnEvent($HeadSlotButton[$i][1], "show_jewels_gui")
				_GUIEnhanceAnimateWin ($HeadSlotButton[$i][0], $button_fade_delay, $GUI_EN_ANI_FADEIN)
			Else
				If $HeadSlotLevelsOld[$i] <> $HeadSlotLevels[$i] Then
;~ 					MsgBox('','','')
					_GUIEnhanceAnimateWin ($HeadSlotButton[$i][0], $button_fade_delay, $GUI_EN_ANI_FADEOUT)
					GUISetState(@SW_SHOW, $HeadSlotButton[$i][0])
					GUICtrlDelete($HeadSlotButton[$i][1])
					$HeadSlotButton[$i][1] = GUICtrlCreatePic(@WorkingDir & "\Images\UI\bk\Gem" & $HeadSlotLevels[$i] &".bmp",  0, 0, 19, 19)
					GUICtrlSetOnEvent($HeadSlotButton[$i][1], "show_jewels_gui")
					_GUIEnhanceAnimateWin ($HeadSlotButton[$i][0], $button_fade_delay, $GUI_EN_ANI_FADEIN)
				EndIf
			EndIf
		EndIf
	Next

	For $i = 1 to 3
		If $headSlotLevels[4-$i] = 0 Then
			If $headSlotLevelsOld[4-$i]<>0 then _GUIEnhanceAnimateWin ($headSlotButton[4-$i][0], $button_fade_delay, $GUI_EN_ANI_FADEOUT)
			If $headSlotLevelsOld[4-$i]<>0 then _GUIEnhanceAnimateWin ($headSlotBorder[4-$i], $button_fade_delay, $GUI_EN_ANI_FADEOUT)
		EndIf
		$headSlotLevelsOld[4-$i] = $headSlotLevels[4-$i]
	Next

	If $init_trigger = False Then $update_skills_required = True
	If $init_trigger = False Then $update_defense_stats_required = True
EndFunc

Func init_Chest()

	local $ChestArmorSkillTemp


	For $i = 1 To $ChestList[0]
		local $temp_Chest = IniReadSection(@WorkingDir & "\DB\Chest.ini", $ChestList[$i])
		local $ChestArmorSkillTemp  = StringSplit($temp_Chest[4][1], ",")
		local $Additional_desc = " "
		local $current_skill_temp[2]
		local $desc_skill_temp
		local $Skill_short
		local $Skill_desc

		for $j = 1 to $ChestArmorSkillTemp[0]
			$Skill_short=StringLeft($ChestArmorSkillTemp[$j], StringLen($ChestArmorSkillTemp[$j])-1)
			$Skill_desc=StringRight($ChestArmorSkillTemp[$j],1)

;~ 			If IniRead(@WorkingDir & "\DB\Skills.ini", "Skills", $Skill_short, "error") = "error" then
;~ 				MsgBox("",'', "Error reading skill " & $Skill_short & " at " & $HeadList[$i])
;~ 			EndIf

			$desc_skill_temp = StringSplit(IniRead(@WorkingDir & "\DB\Skills.ini", "Skills", $Skill_short, $Skill_short), ",")
;~ 			MsgBox('','',$Skill_short&" "&$desc_skill_temp[2])
			$Additional_desc = $Additional_desc & "[" & $desc_skill_temp[1] & "+" & $Skill_desc & "]"
		Next
		If $Additional_desc = " [+]" then $Additional_desc = ""
		_GUICtrlComboBox_AddString($ChestCombo, $ChestList[$i] & $Additional_desc)
;~ 		_GUICtrlComboBox_AddString($ChestCombo, $ChestList[$i])
	Next

	_GUICtrlComboBox_SetCurSel($ChestCombo, 0)
	GUICtrlSetOnEvent($ChestCombo, "Chest_choose")
	Chest_choose()
EndFunc

Func Chest_choose()

	local $temp_Chest = IniReadSection(@WorkingDir & "\DB\Chest.ini", $ChestList[_GUICtrlComboBox_GetCurSel($ChestCombo)+1])
	$ChestDef = StringSplit($temp_Chest[1][1], " ")
;~ 	$ChestSlotLevels = $temp_Chest[2][1]
	$ChestRarity = $temp_Chest[3][1]
	; sorting piece skills
	local $skill_amount = StringSplit($temp_Chest[4][1], ",")
;~ 	local $check
	$ChestSkills[0][0] = $skill_amount[0] ; 0 0 is amount of skills
	For $i=1 to $ChestSkills[0][0]
		$ChestSkills[$i][1] = StringLeft($skill_amount[$i],StringLen($skill_amount[$i])-1)
		$ChestSkills[$i][2] = StringRight($skill_amount[$i],1)
;~ 		$check = $check & $ChestSkills[$i][1] & " " & $ChestSkills[$i][2] & " "
	Next

	if $ChestSkills[1][1] = '' Then $ChestSkills[0][0] = 0

;~ 	MsgBox('','', $check)

	$ChestSlotLevels[1] = StringLeft($temp_Chest[2][1],1)
	$ChestSlotLevels[2] = StringRight(StringLeft($temp_Chest[2][1],2),1)
	$ChestSlotLevels[3] = StringRight($temp_Chest[2][1],1)

	$ChestSlotsGems[1] = "none"
	$ChestSlotsGems[2] = "none"
	$ChestSlotsGems[3] = "none"

	update_Chest_frame()
EndFunc

Func update_Chest_frame()

	For $i=1 to 3
		If $ChestSlotLevels[$i] <> 0 Then
			If $ChestSlotLevelsOld[$i]=0 then _GUIEnhanceAnimateWin ($ChestSlotBorder[$i], $button_fade_delay, $GUI_EN_ANI_FADEIN)
			If $ChestSlotLevelsOld[$i]=0 then
				GUISetState(@SW_SHOW, $ChestSlotButton[$i][0])
				GUICtrlDelete($ChestSlotButton[$i][1])
				$ChestSlotButton[$i][1] = GUICtrlCreatePic(@WorkingDir & "\Images\UI\bk\Gem" & $ChestSlotLevels[$i] &".bmp",  0, 0, 19, 19)
				GUICtrlSetOnEvent($ChestSlotButton[$i][1], "show_jewels_gui")
				_GUIEnhanceAnimateWin ($ChestSlotButton[$i][0], $button_fade_delay, $GUI_EN_ANI_FADEIN)
			Else
				If $ChestSlotLevelsOld[$i] <> $ChestSlotLevels[$i] Then
;~ 					MsgBox('','','')
					_GUIEnhanceAnimateWin ($ChestSlotButton[$i][0], $button_fade_delay, $GUI_EN_ANI_FADEOUT)
					GUISetState(@SW_SHOW, $ChestSlotButton[$i][0])
					GUICtrlDelete($ChestSlotButton[$i][1])
					$ChestSlotButton[$i][1] = GUICtrlCreatePic(@WorkingDir & "\Images\UI\bk\Gem" & $ChestSlotLevels[$i] &".bmp",  0, 0, 19, 19)
					GUICtrlSetOnEvent($ChestSlotButton[$i][1], "show_jewels_gui")
					_GUIEnhanceAnimateWin ($ChestSlotButton[$i][0], $button_fade_delay, $GUI_EN_ANI_FADEIN)
				EndIf
			EndIf
		EndIf
	Next

	For $i = 1 to 3
		If $ChestSlotLevels[4-$i] = 0 Then
			If $ChestSlotLevelsOld[4-$i]<>0 then _GUIEnhanceAnimateWin ($ChestSlotButton[4-$i][0], $button_fade_delay, $GUI_EN_ANI_FADEOUT)
			If $ChestSlotLevelsOld[4-$i]<>0 then _GUIEnhanceAnimateWin ($ChestSlotBorder[4-$i], $button_fade_delay, $GUI_EN_ANI_FADEOUT)
		EndIf
		$ChestSlotLevelsOld[4-$i] = $ChestSlotLevels[4-$i]
	Next

	If $init_trigger = False Then $update_skills_required = True
	If $init_trigger = False Then $update_defense_stats_required = True

EndFunc

Func init_Hands()

	local $HandsArmorSkillTemp


	For $i = 1 To $HandsList[0]
		local $temp_Hands = IniReadSection(@WorkingDir & "\DB\Hands.ini", $HandsList[$i])
		local $HandsArmorSkillTemp  = StringSplit($temp_Hands[4][1], ",")
		local $Additional_desc = " "
		local $current_skill_temp[2]
		local $desc_skill_temp
		local $Skill_short
		local $Skill_desc

		for $j = 1 to $HandsArmorSkillTemp[0]
			$Skill_short=StringLeft($HandsArmorSkillTemp[$j], StringLen($HandsArmorSkillTemp[$j])-1)
			$Skill_desc=StringRight($HandsArmorSkillTemp[$j],1)

;~ 			If IniRead(@WorkingDir & "\DB\Skills.ini", "Skills", $Skill_short, "error") = "error" then
;~ 				MsgBox("",'', "Error reading skill " & $Skill_short & " at " & $HandsList[$i])
;~ 			EndIf

			$desc_skill_temp = StringSplit(IniRead(@WorkingDir & "\DB\Skills.ini", "Skills", $Skill_short, $Skill_short), ",")
;~ 			MsgBox('','',$Skill_short&" "&$desc_skill_temp[2])
			$Additional_desc = $Additional_desc & "[" & $desc_skill_temp[1] & "+" & $Skill_desc & "]"
		Next
		If $Additional_desc = " [+]" then $Additional_desc = ""
		_GUICtrlComboBox_AddString($HandsCombo, $HandsList[$i] & $Additional_desc)
;~ 		_GUICtrlComboBox_AddString($HandsCombo, $HandsList[$i])
	Next

	_GUICtrlComboBox_SetCurSel($HandsCombo, 0)
	GUICtrlSetOnEvent($HandsCombo, "Hands_choose")
	Hands_choose()
EndFunc

Func Hands_choose()

	local $temp_Hands = IniReadSection(@WorkingDir & "\DB\Hands.ini", $HandsList[_GUICtrlComboBox_GetCurSel($HandsCombo)+1])
	$HandsDef = StringSplit($temp_Hands[1][1], " ")
;~ 	$HandsSlotLevels = $temp_Hands[2][1]
	$HandsRarity = $temp_Hands[3][1]
	; sorting piece skills
	local $skill_amount = StringSplit($temp_Hands[4][1], ",")
;~ 	local $check
	$HandsSkills[0][0] = $skill_amount[0] ; 0 0 is amount of skills
	For $i=1 to $HandsSkills[0][0]
		$HandsSkills[$i][1] = StringLeft($skill_amount[$i],StringLen($skill_amount[$i])-1)
		$HandsSkills[$i][2] = StringRight($skill_amount[$i],1)
;~ 		$check = $check & $HandsSkills[$i][1] & " " & $HandsSkills[$i][2] & " "
	Next

	if $HandsSkills[1][1] = '' Then $HandsSkills[0][0] = 0

;~ 	MsgBox('','', $check)
	$HandsSlotLevels[1] = StringLeft($temp_Hands[2][1],1)
	$HandsSlotLevels[2] = StringRight(StringLeft($temp_Hands[2][1],2),1)
	$HandsSlotLevels[3] = StringRight($temp_Hands[2][1],1)

	$HandsSlotsGems[1] = "none"
	$HandsSlotsGems[2] = "none"
	$HandsSlotsGems[3] = "none"

	update_Hands_frame()
EndFunc

Func update_Hands_frame()

	For $i=1 to 3
		If $HandsSlotLevels[$i] <> 0 Then
			If $HandsSlotLevelsOld[$i]=0 then _GUIEnhanceAnimateWin ($HandsSlotBorder[$i], $button_fade_delay, $GUI_EN_ANI_FADEIN)
			If $HandsSlotLevelsOld[$i]=0 then
				GUISetState(@SW_SHOW, $HandsSlotButton[$i][0])
				GUICtrlDelete($HandsSlotButton[$i][1])
				$HandsSlotButton[$i][1] = GUICtrlCreatePic(@WorkingDir & "\Images\UI\bk\Gem" & $HandsSlotLevels[$i] &".bmp",  0, 0, 19, 19)
					GUICtrlSetOnEvent($HandsSlotButton[$i][1], "show_jewels_gui")
				_GUIEnhanceAnimateWin ($HandsSlotButton[$i][0], $button_fade_delay, $GUI_EN_ANI_FADEIN)
			Else
				If $HandsSlotLevelsOld[$i] <> $HandsSlotLevels[$i] Then
;~ 					MsgBox('','','')
					_GUIEnhanceAnimateWin ($HandsSlotButton[$i][0], $button_fade_delay, $GUI_EN_ANI_FADEOUT)
					GUISetState(@SW_SHOW, $HandsSlotButton[$i][0])
					GUICtrlDelete($HandsSlotButton[$i][1])
					$HandsSlotButton[$i][1] = GUICtrlCreatePic(@WorkingDir & "\Images\UI\bk\Gem" & $HandsSlotLevels[$i] &".bmp",  0, 0, 19, 19)
					GUICtrlSetOnEvent($HandsSlotButton[$i][1], "show_jewels_gui")
					_GUIEnhanceAnimateWin ($HandsSlotButton[$i][0], $button_fade_delay, $GUI_EN_ANI_FADEIN)
				EndIf
			EndIf
		EndIf
	Next

	For $i = 1 to 3
		If $HandsSlotLevels[4-$i] = 0 Then
			If $HandsSlotLevelsOld[4-$i]<>0 then _GUIEnhanceAnimateWin ($HandsSlotButton[4-$i][0], $button_fade_delay, $GUI_EN_ANI_FADEOUT)
			If $HandsSlotLevelsOld[4-$i]<>0 then _GUIEnhanceAnimateWin ($HandsSlotBorder[4-$i], $button_fade_delay, $GUI_EN_ANI_FADEOUT)
		EndIf
		$HandsSlotLevelsOld[4-$i] = $HandsSlotLevels[4-$i]
	Next

	If $init_trigger = False Then $update_skills_required = True
	If $init_trigger = False Then $update_defense_stats_required = True

EndFunc

Func init_Belt()

	local $BeltArmorSkillTemp


	For $i = 1 To $BeltList[0]
		local $temp_Belt = IniReadSection(@WorkingDir & "\DB\Belt.ini", $BeltList[$i])
		local $BeltArmorSkillTemp  = StringSplit($temp_Belt[4][1], ",")
		local $Additional_desc = " "
		local $current_skill_temp[2]
		local $desc_skill_temp
		local $Skill_short
		local $Skill_desc

		for $j = 1 to $BeltArmorSkillTemp[0]
			$Skill_short=StringLeft($BeltArmorSkillTemp[$j], StringLen($BeltArmorSkillTemp[$j])-1)
			$Skill_desc=StringRight($BeltArmorSkillTemp[$j],1)
			$desc_skill_temp = StringSplit(IniRead(@WorkingDir & "\DB\Skills.ini", "Skills", $Skill_short, ""), ",")
;~ 			MsgBox('','',$Skill_short&" "&$desc_skill_temp[2])
			$Additional_desc = $Additional_desc & "[" & $desc_skill_temp[1] & "+" & $Skill_desc & "]"
		Next


;~ 		If IniRead(@WorkingDir & "\DB\Skills.ini", "Skills", $Skill_short, "error") = "error" then
;~ 			MsgBox("",'', "Error reading skill " & $Skill_short & " at " & $BeltList[$i])
;~ 		EndIf

		If $Additional_desc = " [+]" then $Additional_desc = ""
		_GUICtrlComboBox_AddString($BeltCombo, $BeltList[$i] & $Additional_desc)
;~ 		_GUICtrlComboBox_AddString($BeltCombo, $BeltList[$i])
	Next

	_GUICtrlComboBox_SetCurSel($BeltCombo, 0)
	GUICtrlSetOnEvent($BeltCombo, "Belt_choose")
	Belt_choose()
EndFunc

Func Belt_choose()

	local $temp_Belt = IniReadSection(@WorkingDir & "\DB\Belt.ini", $BeltList[_GUICtrlComboBox_GetCurSel($BeltCombo)+1])
	$BeltDef = StringSplit($temp_Belt[1][1], " ")
;~ 	$BeltSlotLevels = $temp_Belt[2][1]
	$BeltRarity = $temp_Belt[3][1]
	; sorting piece skills
	local $skill_amount = StringSplit($temp_Belt[4][1], ",")
;~ 	local $check
	$BeltSkills[0][0] = $skill_amount[0] ; 0 0 is amount of skills
	For $i=1 to $BeltSkills[0][0]
		$BeltSkills[$i][1] = StringLeft($skill_amount[$i],StringLen($skill_amount[$i])-1)
		$BeltSkills[$i][2] = StringRight($skill_amount[$i],1)
;~ 		$check = $check & $BeltSkills[$i][1] & " " & $BeltSkills[$i][2] & " "
	Next

	if $BeltSkills[1][1] = '' Then $BeltSkills[0][0] = 0

;~ 	MsgBox('','', $check)
	$BeltSlotLevels[1] = StringLeft($temp_Belt[2][1],1)
	$BeltSlotLevels[2] = StringRight(StringLeft($temp_Belt[2][1],2),1)
	$BeltSlotLevels[3] = StringRight($temp_Belt[2][1],1)

	$BeltSlotsGems[1] = "none"
	$BeltSlotsGems[2] = "none"
	$BeltSlotsGems[3] = "none"

	update_Belt_frame()
EndFunc

Func update_Belt_frame()

	For $i=1 to 3
		If $BeltSlotLevels[$i] <> 0 Then
			If $BeltSlotLevelsOld[$i]=0 then _GUIEnhanceAnimateWin ($BeltSlotBorder[$i], $button_fade_delay, $GUI_EN_ANI_FADEIN)
			If $BeltSlotLevelsOld[$i]=0 then
				GUISetState(@SW_SHOW, $BeltSlotButton[$i][0])
				GUICtrlDelete($BeltSlotButton[$i][1])
				$BeltSlotButton[$i][1] = GUICtrlCreatePic(@WorkingDir & "\Images\UI\bk\Gem" & $BeltSlotLevels[$i] &".bmp",  0, 0, 19, 19)
					GUICtrlSetOnEvent($BeltSlotButton[$i][1], "show_jewels_gui")
				_GUIEnhanceAnimateWin ($BeltSlotButton[$i][0], $button_fade_delay, $GUI_EN_ANI_FADEIN)
			Else
				If $BeltSlotLevelsOld[$i] <> $BeltSlotLevels[$i] Then
;~ 					MsgBox('','','')
					_GUIEnhanceAnimateWin ($BeltSlotButton[$i][0], $button_fade_delay, $GUI_EN_ANI_FADEOUT)
					GUISetState(@SW_SHOW, $BeltSlotButton[$i][0])
					GUICtrlDelete($BeltSlotButton[$i][1])
					$BeltSlotButton[$i][1] = GUICtrlCreatePic(@WorkingDir & "\Images\UI\bk\Gem" & $BeltSlotLevels[$i] &".bmp",  0, 0, 19, 19)
					GUICtrlSetOnEvent($BeltSlotButton[$i][1], "show_jewels_gui")
					_GUIEnhanceAnimateWin ($BeltSlotButton[$i][0], $button_fade_delay, $GUI_EN_ANI_FADEIN)
				EndIf
			EndIf
		EndIf
	Next

	For $i = 1 to 3
		If $BeltSlotLevels[4-$i] = 0 Then
;~ 			MsgBox('','',$BeltSlotLevelsOld[4-$i])
			If $BeltSlotLevelsOld[4-$i]<>0 then _GUIEnhanceAnimateWin ($BeltSlotButton[4-$i][0], $button_fade_delay, $GUI_EN_ANI_FADEOUT)
			If $BeltSlotLevelsOld[4-$i]<>0 then _GUIEnhanceAnimateWin ($BeltSlotBorder[4-$i], $button_fade_delay, $GUI_EN_ANI_FADEOUT)
		EndIf
		$BeltSlotLevelsOld[4-$i] = $BeltSlotLevels[4-$i]
	Next

	If $init_trigger = False Then $update_skills_required = True
	If $init_trigger = False Then $update_defense_stats_required = True
EndFunc

Func init_Boots()

	local $BootsArmorSkillTemp


	For $i = 1 To $BootsList[0]
		local $temp_Boots = IniReadSection(@WorkingDir & "\DB\Boots.ini", $BootsList[$i])
		local $BootsArmorSkillTemp  = StringSplit($temp_Boots[4][1], ",")
		local $Additional_desc = " "
		local $current_skill_temp[2]
		local $desc_skill_temp
		local $Skill_short
		local $Skill_desc

		for $j = 1 to $BootsArmorSkillTemp[0]
			$Skill_short=StringLeft($BootsArmorSkillTemp[$j], StringLen($BootsArmorSkillTemp[$j])-1)
			$Skill_desc=StringRight($BootsArmorSkillTemp[$j],1)
			$desc_skill_temp = StringSplit(IniRead(@WorkingDir & "\DB\Skills.ini", "Skills", $Skill_short, ""), ",")
;~ 			MsgBox('','',$Skill_short&" "&$desc_skill_temp[2])
			$Additional_desc = $Additional_desc & "[" & $desc_skill_temp[1] & "+" & $Skill_desc & "]"
		Next

;~ 		If IniRead(@WorkingDir & "\DB\Skills.ini", "Skills", $Skill_short, "error") = "error" then
;~ 			MsgBox("",'', "Error reading skill " & $Skill_short & " at " & $BootsList[$i])
;~ 		EndIf

		If $Additional_desc = " [+]" then $Additional_desc = ""
		_GUICtrlComboBox_AddString($BootsCombo, $BootsList[$i] & $Additional_desc)
;~ 		_GUICtrlComboBox_AddString($BootsCombo, $BootsList[$i])
	Next

	_GUICtrlComboBox_SetCurSel($BootsCombo, 0)
	GUICtrlSetOnEvent($BootsCombo, "Boots_choose")
	Boots_choose()
EndFunc

Func Boots_choose()

	local $temp_Boots = IniReadSection(@WorkingDir & "\DB\Boots.ini", $BootsList[_GUICtrlComboBox_GetCurSel($BootsCombo)+1])
	$BootsDef = StringSplit($temp_Boots[1][1], " ")
;~ 	$BootsSlotLevels = $temp_Boots[2][1]
	$BootsRarity = $temp_Boots[3][1]
	; sorting piece skills
	local $skill_amount = StringSplit($temp_Boots[4][1], ",")
;~ 	local $check
	$BootsSkills[0][0] = $skill_amount[0] ; 0 0 is amount of skills
	For $i=1 to $BootsSkills[0][0]
		$BootsSkills[$i][1] = StringLeft($skill_amount[$i],StringLen($skill_amount[$i])-1)
		$BootsSkills[$i][2] = StringRight($skill_amount[$i],1)
;~ 		$check = $check & $BootsSkills[$i][1] & " " & $BootsSkills[$i][2] & " "
	Next

	if $BootsSkills[1][1] = '' Then $BootsSkills[0][0] = 0

;~ 	MsgBox('','', $check)
	$BootsSlotLevels[1] = StringLeft($temp_Boots[2][1],1)
	$BootsSlotLevels[2] = StringRight(StringLeft($temp_Boots[2][1],2),1)
	$BootsSlotLevels[3] = StringRight($temp_Boots[2][1],1)

	$BootsSlotsGems[1] = "none"
	$BootsSlotsGems[2] = "none"
	$BootsSlotsGems[3] = "none"

	update_Boots_frame()
EndFunc

Func update_Boots_frame()

	For $i=1 to 3
		If $BootsSlotLevels[$i] <> 0 Then
			If $BootsSlotLevelsOld[$i]=0 then _GUIEnhanceAnimateWin ($BootsSlotBorder[$i], $button_fade_delay, $GUI_EN_ANI_FADEIN)
			If $BootsSlotLevelsOld[$i]=0 then
				GUISetState(@SW_SHOW, $BootsSlotButton[$i][0])
				GUICtrlDelete($BootsSlotButton[$i][1])
				$BootsSlotButton[$i][1] = GUICtrlCreatePic(@WorkingDir & "\Images\UI\bk\Gem" & $BootsSlotLevels[$i] &".bmp",  0, 0, 19, 19)
					GUICtrlSetOnEvent($BootsSlotButton[$i][1], "show_jewels_gui")
				_GUIEnhanceAnimateWin ($BootsSlotButton[$i][0], $button_fade_delay, $GUI_EN_ANI_FADEIN)
			Else
				If $BootsSlotLevelsOld[$i] <> $BootsSlotLevels[$i] Then
;~ 					MsgBox('','','')
					_GUIEnhanceAnimateWin ($BootsSlotButton[$i][0], $button_fade_delay, $GUI_EN_ANI_FADEOUT)
					GUISetState(@SW_SHOW, $BootsSlotButton[$i][0])
					GUICtrlDelete($BootsSlotButton[$i][1])
					$BootsSlotButton[$i][1] = GUICtrlCreatePic(@WorkingDir & "\Images\UI\bk\Gem" & $BootsSlotLevels[$i] &".bmp",  0, 0, 19, 19)
					GUICtrlSetOnEvent($BootsSlotButton[$i][1], "show_jewels_gui")
					_GUIEnhanceAnimateWin ($BootsSlotButton[$i][0], $button_fade_delay, $GUI_EN_ANI_FADEIN)
				EndIf
			EndIf
		EndIf
	Next

	For $i = 1 to 3
		If $BootsSlotLevels[4-$i] = 0 Then
			If $BootsSlotLevelsOld[4-$i]<>0 then _GUIEnhanceAnimateWin ($BootsSlotButton[4-$i][0], $button_fade_delay, $GUI_EN_ANI_FADEOUT)
			If $BootsSlotLevelsOld[4-$i]<>0 then _GUIEnhanceAnimateWin ($BootsSlotBorder[4-$i], $button_fade_delay, $GUI_EN_ANI_FADEOUT)
		EndIf
		$BootsSlotLevelsOld[4-$i] = $BootsSlotLevels[4-$i]
	Next

	If $init_trigger = False Then $update_skills_required = True
	If $init_trigger = False Then $update_defense_stats_required = True

EndFunc

Func init_Charm()

	local $CharmArmorSkillTemp


	For $i = 1 To $CharmList[0]
		local $temp_Charm = IniReadSection(@WorkingDir & "\DB\Charms.ini", $CharmList[$i])
		local $CharmArmorSkillTemp  = StringSplit($temp_Charm[2][1], ",")
		local $Additional_desc = " "
		local $current_skill_temp[2]
		local $desc_skill_temp
		local $Skill_short
		local $Skill_desc

		for $j = 1 to $CharmArmorSkillTemp[0]
			$Skill_desc=StringRight($CharmArmorSkillTemp[$j],1)
			$desc_skill_temp = StringSplit(IniRead(@WorkingDir & "\DB\Skills.ini", "Skills", $CharmArmorSkillTemp[$j], ""), ",")
;~ 			MsgBox('','',$Skill_short&" "&$desc_skill_temp[2])
			$Additional_desc = $Additional_desc & "[" & $desc_skill_temp[1] & "]"
			If $j = $CharmArmorSkillTemp[0] Then $Additional_desc = $Additional_desc & "[" & $temp_Charm[1][1] & " LvL]"
		Next

;~ 		If IniRead(@WorkingDir & "\DB\Skills.ini", "Skills", $Skill_short, "error") = "error" then
;~ 			MsgBox("",'', "Error reading skill " & $Skill_short & " at " & $CharmList[$i])
;~ 		EndIf

		If $Additional_desc = " [+]" then $Additional_desc = ""
		_GUICtrlComboBox_AddString($CharmCombo, $CharmList[$i] & $Additional_desc)
;~ 		_GUICtrlComboBox_AddString($CharmCombo, $CharmList[$i])
	Next

	_GUICtrlComboBox_SetCurSel($CharmCombo, 0)
	GUICtrlSetOnEvent($CharmCombo, "Charm_choose")
	Charm_choose()
EndFunc

Func Charm_choose()

	local $temp_Charm = IniReadSection(@WorkingDir & "\DB\Charms.ini", $CharmList[_GUICtrlComboBox_GetCurSel($CharmCombo)+1])
	; sorting piece skills
	$CharmUpgradeMax = $temp_Charm[1][1]
	local $skill_amount = StringSplit($temp_Charm[2][1], ",")
;~ 	local $check
	$CharmSkills[0][0] = $skill_amount[0] ; 0 0 is amount of skills
	For $i = 1 to $CharmSkills[0][0]
		$CharmSkills[$i][1] = $skill_amount[$i]
;~ 		$check = $check & $CharmSkills[$i][1] & " " & $CharmSkills[$i][2] & " "
	Next

	if $CharmSkills[1][1] = '' Then $CharmSkills[0][0] = 0

;~ 	MsgBox('','', $check)
	$CharmUpgrade = 1

	update_Charm_frame()
EndFunc

Func update_Charm_frame()

	Select
		Case $CharmUpgradeMax = 1
			_GUIEnhanceAnimateWin ($Upgrade_buttons[6][2], $button_fade_delay, $GUI_EN_ANI_FADEOUT)
			GUISetState(@SW_ENABLE, $Upgrade_buttons[6][2])
			GUICtrlDelete($Upgrade_buttons[6][3])
			$Upgrade_buttons[6][3] = GUICtrlCreatePic(@WorkingDir & "\Images\UI\Skills\SkillEmpty.bmp",  0, 0, 15, 15)
			_GUIEnhanceAnimateWin ($Upgrade_buttons[6][2], $button_fade_delay, $GUI_EN_ANI_FADEIN)
			_GUIEnhanceAnimateWin ($Upgrade_buttons[6][4], $button_fade_delay, $GUI_EN_ANI_FADEOUT)
			GUISetState(@SW_ENABLE, $Upgrade_buttons[6][4])
			GUICtrlDelete($Upgrade_buttons[6][5])
			$Upgrade_buttons[6][5] = GUICtrlCreatePic(@WorkingDir & "\Images\UI\Skills\SkillEmpty.bmp",  0, 0, 15, 15)
			_GUIEnhanceAnimateWin ($Upgrade_buttons[6][4], $button_fade_delay, $GUI_EN_ANI_FADEIN)
		Case $CharmUpgradeMax = 2
			_GUIEnhanceAnimateWin ($Upgrade_buttons[6][2], $button_fade_delay, $GUI_EN_ANI_FADEOUT)
			GUISetState(@SW_ENABLE, $Upgrade_buttons[6][2])
			GUICtrlDelete($Upgrade_buttons[6][3])
			$Upgrade_buttons[6][3] =GUICtrlCreatePic(@WorkingDir & "\Images\UI\bk\UpgradeAvail.bmp",  0, 0, 15, 15)
			_GUIEnhanceAnimateWin ($Upgrade_buttons[6][2], $button_fade_delay, $GUI_EN_ANI_FADEIN)
			_GUIEnhanceAnimateWin ($Upgrade_buttons[6][4], $button_fade_delay, $GUI_EN_ANI_FADEOUT)
			GUISetState(@SW_ENABLE, $Upgrade_buttons[6][4])
			GUICtrlDelete($Upgrade_buttons[6][5])
			$Upgrade_buttons[6][5] = GUICtrlCreatePic(@WorkingDir & "\Images\UI\Skills\SkillEmpty.bmp",  0, 0, 15, 15)
			_GUIEnhanceAnimateWin ($Upgrade_buttons[6][4], $button_fade_delay, $GUI_EN_ANI_FADEIN)
		Case $CharmUpgradeMax = 3
			_GUIEnhanceAnimateWin ($Upgrade_buttons[6][2], $button_fade_delay, $GUI_EN_ANI_FADEOUT)
			GUISetState(@SW_ENABLE, $Upgrade_buttons[6][2])
			GUICtrlDelete($Upgrade_buttons[6][3])
			$Upgrade_buttons[6][3] = GUICtrlCreatePic(@WorkingDir & "\Images\UI\bk\UpgradeAvail.bmp",  0, 0, 15, 15)
			_GUIEnhanceAnimateWin ($Upgrade_buttons[6][2], $button_fade_delay, $GUI_EN_ANI_FADEIN)
			_GUIEnhanceAnimateWin ($Upgrade_buttons[6][4], $button_fade_delay, $GUI_EN_ANI_FADEOUT)
			GUISetState(@SW_ENABLE, $Upgrade_buttons[6][4])
			GUICtrlDelete($Upgrade_buttons[6][5])
			$Upgrade_buttons[6][5] = GUICtrlCreatePic(@WorkingDir & "\Images\UI\bk\UpgradeAvail.bmp",  0, 0, 15, 15)
			_GUIEnhanceAnimateWin ($Upgrade_buttons[6][4], $button_fade_delay, $GUI_EN_ANI_FADEIN)
		EndSelect

	If $init_trigger = False Then $update_skills_required = True
	If $init_trigger = False Then $update_defense_stats_required = True
EndFunc

Func charm_upgrade()
	If $CharmUpgrade < $CharmUpgradeMax Then
		$CharmUpgrade = $CharmUpgrade + 1
		Select
			Case $CharmUpgrade = 2
				_GUIEnhanceAnimateWin ($Upgrade_buttons[6][2], $button_fade_delay, $GUI_EN_ANI_FADEOUT)
				GUISetState(@SW_ENABLE, $Upgrade_buttons[6][2])
				GUICtrlDelete($Upgrade_buttons[6][3])
				$Upgrade_buttons[6][3] = GUICtrlCreatePic(@WorkingDir & "\Images\UI\bk\UpgradeCheck.bmp",  0, 0, 15, 15)
				_GUIEnhanceAnimateWin ($Upgrade_buttons[6][2], $button_fade_delay, $GUI_EN_ANI_FADEIN)
			Case $CharmUpgrade = 3
				_GUIEnhanceAnimateWin ($Upgrade_buttons[6][4], $button_fade_delay, $GUI_EN_ANI_FADEOUT)
				GUISetState(@SW_ENABLE, $Upgrade_buttons[6][4])
				GUICtrlDelete($Upgrade_buttons[6][5])
				$Upgrade_buttons[6][5] = GUICtrlCreatePic(@WorkingDir & "\Images\UI\bk\UpgradeCheck.bmp",  0, 0, 15, 15)
				_GUIEnhanceAnimateWin ($Upgrade_buttons[6][4], $button_fade_delay, $GUI_EN_ANI_FADEIN)
		EndSelect
	EndIf
	$update_skills_required = True
	$update_defense_stats_required = True
EndFunc

Func charm_downgrade()
	If $CharmUpgrade > 1 Then
		$CharmUpgrade = $CharmUpgrade - 1
		Select
			Case $CharmUpgrade = 2
				_GUIEnhanceAnimateWin ($Upgrade_buttons[6][4], $button_fade_delay, $GUI_EN_ANI_FADEOUT)
				GUISetState(@SW_ENABLE, $Upgrade_buttons[6][4])
				GUICtrlDelete($Upgrade_buttons[6][5])
				$Upgrade_buttons[6][5] = GUICtrlCreatePic(@WorkingDir & "\Images\UI\bk\UpgradeAvail.bmp",  0, 0, 15, 15)
				_GUIEnhanceAnimateWin ($Upgrade_buttons[6][4], $button_fade_delay, $GUI_EN_ANI_FADEIN)
			Case $CharmUpgrade = 1
				_GUIEnhanceAnimateWin ($Upgrade_buttons[6][2], $button_fade_delay, $GUI_EN_ANI_FADEOUT)
				GUISetState(@SW_ENABLE, $Upgrade_buttons[6][2])
				GUICtrlDelete($Upgrade_buttons[6][3])
				$Upgrade_buttons[6][3] = GUICtrlCreatePic(@WorkingDir & "\Images\UI\bk\UpgradeAvail.bmp",  0, 0, 15, 15)
				_GUIEnhanceAnimateWin ($Upgrade_buttons[6][2], $button_fade_delay, $GUI_EN_ANI_FADEIN)
		EndSelect
	EndIf
	$update_skills_required = True
	$update_defense_stats_required = True
EndFunc

Func init_augment1()
	_GUIEnhanceAnimateWin ($AugmentFrame, 200, $GUI_EN_ANI_FADEIN)
	GUISetState(@SW_SHOW, $AugmentFrame)
	GUICtrlSetOnEvent($WeaponAugmentButtons[1][5], "close_augment1")
	GUICtrlSetOnEvent($WeaponAugmentButtons[2][5], "init_augment2")
	GUICtrlSetOnEvent($WeaponAugmentButtons[3][5], "init_augment3")
	$AugmentSelected = 1
EndFunc

Func init_augment2()
	_GUIEnhanceAnimateWin ($AugmentFrame, 200, $GUI_EN_ANI_FADEIN)
	GUISetState(@SW_SHOW, $AugmentFrame)
	GUICtrlSetOnEvent($WeaponAugmentButtons[1][5], "init_augment1")
	GUICtrlSetOnEvent($WeaponAugmentButtons[2][5], "close_augment2")
	GUICtrlSetOnEvent($WeaponAugmentButtons[3][5], "init_augment3")
	$AugmentSelected = 2
EndFunc

Func init_augment3()
	_GUIEnhanceAnimateWin ($AugmentFrame, 200, $GUI_EN_ANI_FADEIN)
	GUISetState(@SW_SHOW, $AugmentFrame)
	GUICtrlSetOnEvent($WeaponAugmentButtons[1][5], "init_augment1")
	GUICtrlSetOnEvent($WeaponAugmentButtons[2][5], "init_augment2")
	GUICtrlSetOnEvent($WeaponAugmentButtons[3][5], "close_augment3")
	$AugmentSelected = 3
EndFunc

Func close_augment1()
	$WeaponAugments[$AugmentSelected]="none"
	_GUIEnhanceCtrlFade ($WeaponAugmentButtons[1][5], 75, True, False, 0xFFFFFF, 0x000000, 3)
	GUICtrlSetData($WeaponAugmentButtons[1][5], "- - - - -")
	_GUIEnhanceCtrlFade ($WeaponAugmentButtons[1][5], 75, True, False, 0x000000, 0xFFFFFF, 3)
	close_augment_common()
EndFunc

Func close_augment2()
	$WeaponAugments[$AugmentSelected]="none"
	_GUIEnhanceCtrlFade ($WeaponAugmentButtons[2][5], 75, True, False, 0xFFFFFF, 0x000000, 3)
	GUICtrlSetData($WeaponAugmentButtons[2][5], "- - - - -")
	_GUIEnhanceCtrlFade ($WeaponAugmentButtons[2][5], 75, True, False, 0x000000, 0xFFFFFF, 3)
	close_augment_common()
EndFunc

Func close_augment3()
	$WeaponAugments[$AugmentSelected]="none"
		_GUIEnhanceCtrlFade ($WeaponAugmentButtons[3][5], 75, True, False, 0xFFFFFF, 0x000000, 3)
	GUICtrlSetData($WeaponAugmentButtons[3][5], "- - - - -")
	_GUIEnhanceCtrlFade ($WeaponAugmentButtons[3][5], 75, True, False, 0x000000, 0xFFFFFF, 3)
	close_augment_common()
EndFunc

Func close_augment_common()
	_GUIEnhanceAnimateWin ($AugmentFrame, 200, $GUI_EN_ANI_FADEOUT)
	GUISetState(@SW_HIDE, $AugmentFrame)
	GUICtrlSetOnEvent($WeaponAugmentButtons[1][5], "init_augment1")
	GUICtrlSetOnEvent($WeaponAugmentButtons[2][5], "init_augment2")
	GUICtrlSetOnEvent($WeaponAugmentButtons[3][5], "init_augment3")
	$AugmentSelected = 0
	$update_defense_stats_required = True
EndFunc

Func augment_add_raw()
	$WeaponAugments[$AugmentSelected]="raw"
	GUICtrlSetData($WeaponAugmentButtons[$AugmentSelected][5], "Attack")
	GUICtrlSetColor($WeaponAugmentButtons[$AugmentSelected][5], $COLOR_GREEN)
	close_augment_common()
	$update_defense_stats_required = True
EndFunc

Func augment_add_aff()
	$WeaponAugments[$AugmentSelected]="aff"
	GUICtrlSetData($WeaponAugmentButtons[$AugmentSelected][5], "Affinity")
	GUICtrlSetColor($WeaponAugmentButtons[$AugmentSelected][5], $COLOR_GREEN)
	close_augment_common()
	$update_defense_stats_required = True
EndFunc

Func augment_add_def()
	$WeaponAugments[$AugmentSelected]="def"
	GUICtrlSetData($WeaponAugmentButtons[$AugmentSelected][5], "Defense")
	GUICtrlSetColor($WeaponAugmentButtons[$AugmentSelected][5], $COLOR_GREEN)
	close_augment_common()
	$update_defense_stats_required = True
EndFunc

Func augment_add_slot()
	$WeaponAugments[$AugmentSelected]="Slot"
	GUICtrlSetData($WeaponAugmentButtons[$AugmentSelected][5], "Slot")
	GUICtrlSetColor($WeaponAugmentButtons[$AugmentSelected][5], $COLOR_GREEN)
	close_augment_common()
	$update_defense_stats_required = True
EndFunc

Func augment_add_h()
	$WeaponAugments[$AugmentSelected]="hp"
	GUICtrlSetData($WeaponAugmentButtons[$AugmentSelected][5], "Health")
	GUICtrlSetColor($WeaponAugmentButtons[$AugmentSelected][5], $COLOR_GREEN)
	close_augment_common()
	$update_defense_stats_required = True
EndFunc

Func _GuiCtrlFadeSetData($handle, $color_fade_from, $color_fade_to, $color_fade_in, $set_data, $delay = 50)
	_GUIEnhanceCtrlFade ($handle, $delay, True, False, $color_fade_from, $color_fade_to, 5)
	GUICtrlSetData($handle, $set_data)
	_GUIEnhanceCtrlFade ($handle, $delay, True, False, $color_fade_to, $color_fade_in, 5)
EndFunc

Func upgrade_head()
	_GUIEnhanceAnimateWin ($Upgrade_buttons[1][1], $button_fade_delay, $GUI_EN_ANI_FADEOUT)
	GUISetState(@SW_ENABLE, $Upgrade_buttons[1][1])
	GUICtrlDelete($Upgrade_buttons[1][3])
	$Upgrade_buttons[1][3] = GUICtrlCreatePic(@WorkingDir & "\Images\UI\bk\UpgradeRedChosen.bmp",  0, 0, 21, 18)
	GUICtrlSetOnEvent(-1, "cancel_upgrade_head")
	_GUIEnhanceAnimateWin ($Upgrade_buttons[1][1], $button_fade_delay, $GUI_EN_ANI_FADEIN)
	$HeadUpgrade = 1
	$update_defense_stats_required = True
EndFunc

Func upgrade_chest()
	_GUIEnhanceAnimateWin ($Upgrade_buttons[2][1], $button_fade_delay, $GUI_EN_ANI_FADEOUT)
	GUISetState(@SW_ENABLE, $Upgrade_buttons[2][1])
	GUICtrlDelete($Upgrade_buttons[2][3])
	$Upgrade_buttons[2][3] = GUICtrlCreatePic(@WorkingDir & "\Images\UI\bk\UpgradeRedChosen.bmp",  0, 0, 21, 18)
	GUICtrlSetOnEvent(-1, "cancel_upgrade_chest")
	_GUIEnhanceAnimateWin ($Upgrade_buttons[2][1], $button_fade_delay, $GUI_EN_ANI_FADEIN)
	$ChestUpgrade = 1
	$update_defense_stats_required = True
EndFunc

Func upgrade_hands()
	_GUIEnhanceAnimateWin ($Upgrade_buttons[3][1], $button_fade_delay, $GUI_EN_ANI_FADEOUT)
	GUISetState(@SW_ENABLE, $Upgrade_buttons[3][1])
	GUICtrlDelete($Upgrade_buttons[3][3])
	$Upgrade_buttons[3][3] = GUICtrlCreatePic(@WorkingDir & "\Images\UI\bk\UpgradeRedChosen.bmp",  0, 0, 21, 18)
	GUICtrlSetOnEvent(-1, "cancel_upgrade_hands")
	_GUIEnhanceAnimateWin ($Upgrade_buttons[3][1], $button_fade_delay, $GUI_EN_ANI_FADEIN)
	$HandsUpgrade = 1
	$update_defense_stats_required = True
EndFunc

Func upgrade_belt()
	_GUIEnhanceAnimateWin ($Upgrade_buttons[4][1], $button_fade_delay, $GUI_EN_ANI_FADEOUT)
	GUISetState(@SW_ENABLE, $Upgrade_buttons[4][1])
	GUICtrlDelete($Upgrade_buttons[4][3])
	$Upgrade_buttons[4][3] = GUICtrlCreatePic(@WorkingDir & "\Images\UI\bk\UpgradeRedChosen.bmp",  0, 0, 21, 18)
	GUICtrlSetOnEvent(-1, "cancel_upgrade_belt")
	_GUIEnhanceAnimateWin ($Upgrade_buttons[4][1], $button_fade_delay, $GUI_EN_ANI_FADEIN)
	$BeltUpgrade = 1
	$update_defense_stats_required = True
EndFunc

Func upgrade_boots()
	_GUIEnhanceAnimateWin ($Upgrade_buttons[5][1], $button_fade_delay, $GUI_EN_ANI_FADEOUT)
	GUISetState(@SW_ENABLE, $Upgrade_buttons[5][1])
	GUICtrlDelete($Upgrade_buttons[5][3])
	$Upgrade_buttons[5][3] = GUICtrlCreatePic(@WorkingDir & "\Images\UI\bk\UpgradeRedChosen.bmp",  0, 0, 21, 18)
	GUICtrlSetOnEvent(-1, "cancel_upgrade_boots")
	_GUIEnhanceAnimateWin ($Upgrade_buttons[5][1], $button_fade_delay, $GUI_EN_ANI_FADEIN)
	$BootsUpgrade = 1
	$update_defense_stats_required = True
EndFunc

Func cancel_upgrade_head()
	If $HeadUpgrade = 2 Then cancel_augment_head()
	_GUIEnhanceAnimateWin ($Upgrade_buttons[1][1], $button_fade_delay, $GUI_EN_ANI_FADEOUT)
	GUISetState(@SW_ENABLE, $Upgrade_buttons[1][1])
	GUICtrlDelete($Upgrade_buttons[1][3])
	$Upgrade_buttons[1][3] = GUICtrlCreatePic(@WorkingDir & "\Images\UI\bk\UpgradeRed.bmp",  0, 0, 21, 18)
	GUICtrlSetOnEvent(-1, "upgrade_head")
	_GUIEnhanceAnimateWin ($Upgrade_buttons[1][1], $button_fade_delay, $GUI_EN_ANI_FADEIN)
	$HeadUpgrade = 0
	$update_defense_stats_required = True
EndFunc

Func cancel_upgrade_chest()
	If $ChestUpgrade = 2 Then cancel_augment_chest()
	_GUIEnhanceAnimateWin ($Upgrade_buttons[2][1], $button_fade_delay, $GUI_EN_ANI_FADEOUT)
	GUISetState(@SW_ENABLE, $Upgrade_buttons[2][1])
	GUICtrlDelete($Upgrade_buttons[2][3])
	$Upgrade_buttons[2][3] = GUICtrlCreatePic(@WorkingDir & "\Images\UI\bk\UpgradeRed.bmp",  0, 0, 21, 18)
	GUICtrlSetOnEvent(-1, "upgrade_chest")
	_GUIEnhanceAnimateWin ($Upgrade_buttons[2][1], $button_fade_delay, $GUI_EN_ANI_FADEIN)
	$ChestUpgrade = 0
	$update_defense_stats_required = True
EndFunc

Func cancel_upgrade_hands()
	If $HandsUpgrade = 2 Then cancel_augment_hands()
	_GUIEnhanceAnimateWin ($Upgrade_buttons[3][1], $button_fade_delay, $GUI_EN_ANI_FADEOUT)
	GUISetState(@SW_ENABLE, $Upgrade_buttons[3][1])
	GUICtrlDelete($Upgrade_buttons[3][3])
	$Upgrade_buttons[3][3] = GUICtrlCreatePic(@WorkingDir & "\Images\UI\bk\UpgradeRed.bmp",  0, 0, 21, 18)
	GUICtrlSetOnEvent(-1, "upgrade_hands")
	_GUIEnhanceAnimateWin ($Upgrade_buttons[3][1], $button_fade_delay, $GUI_EN_ANI_FADEIN)
	$HandsUpgrade = 0
	$update_defense_stats_required = True
EndFunc

Func cancel_upgrade_belt()
	If $BeltUpgrade = 2 Then cancel_augment_belt()
	_GUIEnhanceAnimateWin ($Upgrade_buttons[4][1], $button_fade_delay, $GUI_EN_ANI_FADEOUT)
	GUISetState(@SW_ENABLE, $Upgrade_buttons[4][1])
	GUICtrlDelete($Upgrade_buttons[4][3])
	$Upgrade_buttons[4][3] = GUICtrlCreatePic(@WorkingDir & "\Images\UI\bk\UpgradeRed.bmp",  0, 0, 21, 18)
	GUICtrlSetOnEvent(-1, "upgrade_belt")
	_GUIEnhanceAnimateWin ($Upgrade_buttons[4][1], $button_fade_delay, $GUI_EN_ANI_FADEIN)
	$BeltUpgrade = 0
	$update_defense_stats_required = True
EndFunc

Func cancel_upgrade_boots()
	If $BootsUpgrade = 2 Then cancel_augment_boots()
	_GUIEnhanceAnimateWin ($Upgrade_buttons[5][1], $button_fade_delay, $GUI_EN_ANI_FADEOUT)
	GUISetState(@SW_ENABLE, $Upgrade_buttons[5][1])
	GUICtrlDelete($Upgrade_buttons[5][3])
	$Upgrade_buttons[5][3] = GUICtrlCreatePic(@WorkingDir & "\Images\UI\bk\UpgradeRed.bmp",  0, 0, 21, 18)
	GUICtrlSetOnEvent(-1, "upgrade_boots")
	_GUIEnhanceAnimateWin ($Upgrade_buttons[5][1], $button_fade_delay, $GUI_EN_ANI_FADEIN)
	$BootsUpgrade = 0
	$update_defense_stats_required = True
EndFunc

Func augment_head()
	If $HeadUpgrade = 0 Then upgrade_head()
	_GUIEnhanceAnimateWin ($upgrade_buttons[1][2], $button_fade_delay, $GUI_EN_ANI_FADEOUT)
	GUISetState(@SW_ENABLE, $upgrade_buttons[1][2])
	GUICtrlDelete($upgrade_buttons[1][4])
	$upgrade_buttons[1][4] = GUICtrlCreatePic(@WorkingDir & "\Images\UI\bk\UpgradeBlueChosen.bmp",  0, 0, 21, 18)
	GUICtrlSetOnEvent(-1, "cancel_augment_head")
	_GUIEnhanceAnimateWin ($upgrade_buttons[1][2], $button_fade_delay, $GUI_EN_ANI_FADEIN)
	$HeadUpgrade = 2
	$update_defense_stats_required = True
EndFunc

Func augment_chest()
	If $ChestUpgrade = 0 Then upgrade_chest()
	_GUIEnhanceAnimateWin ($upgrade_buttons[2][2], $button_fade_delay, $GUI_EN_ANI_FADEOUT)
	GUISetState(@SW_ENABLE, $upgrade_buttons[2][2])
	GUICtrlDelete($upgrade_buttons[2][4])
	$upgrade_buttons[2][4] = GUICtrlCreatePic(@WorkingDir & "\Images\UI\bk\UpgradeBlueChosen.bmp",  0, 0, 21, 18)
	GUICtrlSetOnEvent(-1, "cancel_augment_chest")
	_GUIEnhanceAnimateWin ($upgrade_buttons[2][2], $button_fade_delay, $GUI_EN_ANI_FADEIN)
	$ChestUpgrade = 2
	$update_defense_stats_required = True
EndFunc

Func augment_hands()
	If $HandsUpgrade = 0 Then upgrade_hands()
	_GUIEnhanceAnimateWin ($upgrade_buttons[3][2], $button_fade_delay, $GUI_EN_ANI_FADEOUT)
	GUISetState(@SW_ENABLE, $upgrade_buttons[3][2])
	GUICtrlDelete($upgrade_buttons[3][4])
	$upgrade_buttons[3][4] = GUICtrlCreatePic(@WorkingDir & "\Images\UI\bk\UpgradeBlueChosen.bmp",  0, 0, 21, 18)
	GUICtrlSetOnEvent(-1, "cancel_augment_hands")
	_GUIEnhanceAnimateWin ($upgrade_buttons[3][2], $button_fade_delay, $GUI_EN_ANI_FADEIN)
	$HandsUpgrade = 2
	$update_defense_stats_required = True
EndFunc

Func augment_belt()
	If $BeltUpgrade = 0 Then upgrade_belt()
	_GUIEnhanceAnimateWin ($upgrade_buttons[4][2], $button_fade_delay, $GUI_EN_ANI_FADEOUT)
	GUISetState(@SW_ENABLE, $upgrade_buttons[4][2])
	GUICtrlDelete($upgrade_buttons[4][4])
	$upgrade_buttons[4][4] = GUICtrlCreatePic(@WorkingDir & "\Images\UI\bk\UpgradeBlueChosen.bmp",  0, 0, 21, 18)
	GUICtrlSetOnEvent(-1, "cancel_augment_belt")
	_GUIEnhanceAnimateWin ($upgrade_buttons[4][2], $button_fade_delay, $GUI_EN_ANI_FADEIN)
	$BeltUpgrade = 2
	$update_defense_stats_required = True
EndFunc

Func augment_boots()
	If $BootsUpgrade = 0 Then upgrade_boots()
	_GUIEnhanceAnimateWin ($upgrade_buttons[5][2], $button_fade_delay, $GUI_EN_ANI_FADEOUT)
	GUISetState(@SW_ENABLE, $upgrade_buttons[5][2])
	GUICtrlDelete($upgrade_buttons[5][4])
	$upgrade_buttons[5][4] = GUICtrlCreatePic(@WorkingDir & "\Images\UI\bk\UpgradeBlueChosen.bmp",  0, 0, 21, 18)
	GUICtrlSetOnEvent(-1, "cancel_augment_boots")
	_GUIEnhanceAnimateWin ($upgrade_buttons[5][2], $button_fade_delay, $GUI_EN_ANI_FADEIN)
	$BootsUpgrade = 2
	$update_defense_stats_required = True
EndFunc

Func cancel_augment_head()
	_GUIEnhanceAnimateWin ($upgrade_buttons[1][2], $button_fade_delay, $GUI_EN_ANI_FADEOUT)
	GUISetState(@SW_ENABLE, $upgrade_buttons[1][2])
	GUICtrlDelete($upgrade_buttons[1][4])
	$upgrade_buttons[1][4] = GUICtrlCreatePic(@WorkingDir & "\Images\UI\bk\UpgradeBlue.bmp",  0, 0, 21, 18)
	GUICtrlSetOnEvent(-1, "augment_head")
	_GUIEnhanceAnimateWin ($upgrade_buttons[1][2], $button_fade_delay, $GUI_EN_ANI_FADEIN)
	$HeadUpgrade = 1
	$update_defense_stats_required = True
EndFunc

Func cancel_augment_chest()
	_GUIEnhanceAnimateWin ($upgrade_buttons[2][2], $button_fade_delay, $GUI_EN_ANI_FADEOUT)
	GUISetState(@SW_ENABLE, $upgrade_buttons[2][2])
	GUICtrlDelete($upgrade_buttons[2][4])
	$upgrade_buttons[2][4] = GUICtrlCreatePic(@WorkingDir & "\Images\UI\bk\UpgradeBlue.bmp",  0, 0, 21, 18)
	GUICtrlSetOnEvent(-1, "augment_chest")
	_GUIEnhanceAnimateWin ($upgrade_buttons[2][2], $button_fade_delay, $GUI_EN_ANI_FADEIN)
	$ChestUpgrade = 1
	$update_defense_stats_required = True
EndFunc

Func cancel_augment_hands()
	_GUIEnhanceAnimateWin ($upgrade_buttons[3][2], $button_fade_delay, $GUI_EN_ANI_FADEOUT)
	GUISetState(@SW_ENABLE, $upgrade_buttons[3][2])
	GUICtrlDelete($upgrade_buttons[3][4])
	$upgrade_buttons[3][4] = GUICtrlCreatePic(@WorkingDir & "\Images\UI\bk\UpgradeBlue.bmp",  0, 0, 21, 18)
	GUICtrlSetOnEvent(-1, "augment_hands")
	_GUIEnhanceAnimateWin ($upgrade_buttons[3][2], $button_fade_delay, $GUI_EN_ANI_FADEIN)
	$HandsUpgrade = 1
	$update_defense_stats_required = True
EndFunc

Func cancel_augment_belt()
	_GUIEnhanceAnimateWin ($upgrade_buttons[4][2], $button_fade_delay, $GUI_EN_ANI_FADEOUT)
	GUISetState(@SW_ENABLE, $upgrade_buttons[4][2])
	GUICtrlDelete($upgrade_buttons[4][4])
	$upgrade_buttons[4][4] = GUICtrlCreatePic(@WorkingDir & "\Images\UI\bk\UpgradeBlue.bmp",  0, 0, 21, 18)
	GUICtrlSetOnEvent(-1, "augment_belt")
	_GUIEnhanceAnimateWin ($upgrade_buttons[4][2], $button_fade_delay, $GUI_EN_ANI_FADEIN)
	$BeltUpgrade = 1
	$update_defense_stats_required = True
EndFunc

Func cancel_augment_boots()
	_GUIEnhanceAnimateWin ($upgrade_buttons[5][2], $button_fade_delay, $GUI_EN_ANI_FADEOUT)
	GUISetState(@SW_ENABLE, $upgrade_buttons[5][2])
	GUICtrlDelete($upgrade_buttons[5][4])
	$upgrade_buttons[5][4] = GUICtrlCreatePic(@WorkingDir & "\Images\UI\bk\UpgradeBlue.bmp",  0, 0, 21, 18)
	GUICtrlSetOnEvent(-1, "augment_boots")
	_GUIEnhanceAnimateWin ($upgrade_buttons[5][2], $button_fade_delay, $GUI_EN_ANI_FADEIN)
	$BootsUpgrade = 1
	$update_defense_stats_required = True
EndFunc

Func show_skills()
	GUICtrlSetOnEvent($ShowSKillsButton, "hide_skills")
	$skills_menu_shown = True
	_GUIEnhanceAnimateWin ($SkillsFrame, 200, $GUI_EN_ANI_FADEIN)
	$update_skills_required = True
	$skills_menu_show_initiated = True
EndFunc

Func hide_skills()
	GUICtrlSetOnEvent($ShowSKillsButton, "show_skills")
	hide_skills_menu()
	$skills_menu_shown = False
	_GUIEnhanceAnimateWin ($SkillsFrame, 200, $GUI_EN_ANI_FADEOUT)
EndFunc

Func save_set()
	IniWrite(@WorkingDir & "\MySets\" & $MySetName & ".mhb", "Weapon",	"WeaponName", $WeaponName)
	IniWrite(@WorkingDir & "\MySets\" & $MySetName & ".mhb", "Weapon",	"Slot1", $WeaponSlotsGems[1])
	IniWrite(@WorkingDir & "\MySets\" & $MySetName & ".mhb", "Weapon",	"Slot2", $WeaponSlotsGems[2])
	IniWrite(@WorkingDir & "\MySets\" & $MySetName & ".mhb", "Weapon",	"Slot3", $WeaponSlotsGems[3])
	IniWrite(@WorkingDir & "\MySets\" & $MySetName & ".mhb", "Weapon",	"Augment1", $WeaponAugments[1])
	IniWrite(@WorkingDir & "\MySets\" & $MySetName & ".mhb", "Weapon",	"Augment2", $WeaponAugments[2])
	IniWrite(@WorkingDir & "\MySets\" & $MySetName & ".mhb", "Weapon",	"Augment3", $WeaponAugments[3])

	IniWrite(@WorkingDir & "\MySets\" & $MySetName & ".mhb", "Head",	"HeadName", $HeadList[_GUICtrlComboBox_GetCurSel($HeadCombo)+1])
	IniWrite(@WorkingDir & "\MySets\" & $MySetName & ".mhb", "Head",	"Slot1", $HeadSlotsGems[1])
	IniWrite(@WorkingDir & "\MySets\" & $MySetName & ".mhb", "Head",	"Slot2", $HeadSlotsGems[2])
	IniWrite(@WorkingDir & "\MySets\" & $MySetName & ".mhb", "Head",	"Slot3", $HeadSlotsGems[3])

	IniWrite(@WorkingDir & "\MySets\" & $MySetName & ".mhb", "Chest",	"ChestName", $ChestList[_GUICtrlComboBox_GetCurSel($ChestCombo)+1])
	IniWrite(@WorkingDir & "\MySets\" & $MySetName & ".mhb", "Chest",	"Slot1", $ChestSlotsGems[1])
	IniWrite(@WorkingDir & "\MySets\" & $MySetName & ".mhb", "Chest",	"Slot2", $ChestSlotsGems[2])
	IniWrite(@WorkingDir & "\MySets\" & $MySetName & ".mhb", "Chest",	"Slot3", $ChestSlotsGems[3])

	IniWrite(@WorkingDir & "\MySets\" & $MySetName & ".mhb", "Hands",	"HandsName", $HandsList[_GUICtrlComboBox_GetCurSel($HandsCombo)+1])
	IniWrite(@WorkingDir & "\MySets\" & $MySetName & ".mhb", "Hands",	"Slot1", $HandsSlotsGems[1])
	IniWrite(@WorkingDir & "\MySets\" & $MySetName & ".mhb", "Hands",	"Slot2", $HandsSlotsGems[2])
	IniWrite(@WorkingDir & "\MySets\" & $MySetName & ".mhb", "Hands",	"Slot3", $HandsSlotsGems[3])

	IniWrite(@WorkingDir & "\MySets\" & $MySetName & ".mhb", "Belt",	"BeltName", $BeltList[_GUICtrlComboBox_GetCurSel($BeltCombo)+1])
	IniWrite(@WorkingDir & "\MySets\" & $MySetName & ".mhb", "Belt",	"Slot1", $BeltSlotsGems[1])
	IniWrite(@WorkingDir & "\MySets\" & $MySetName & ".mhb", "Belt",	"Slot2", $BeltSlotsGems[2])
	IniWrite(@WorkingDir & "\MySets\" & $MySetName & ".mhb", "Belt",	"Slot3", $BeltSlotsGems[3])

	IniWrite(@WorkingDir & "\MySets\" & $MySetName & ".mhb", "Boots",	"BootsName", $BootsList[_GUICtrlComboBox_GetCurSel($BootsCombo)+1])
	IniWrite(@WorkingDir & "\MySets\" & $MySetName & ".mhb", "Boots",	"Slot1", $BootsSlotsGems[1])
	IniWrite(@WorkingDir & "\MySets\" & $MySetName & ".mhb", "Boots",	"Slot2", $BootsSlotsGems[2])
	IniWrite(@WorkingDir & "\MySets\" & $MySetName & ".mhb", "Boots",	"Slot3", $BootsSlotsGems[3])

	IniWrite(@WorkingDir & "\MySets\" & $MySetName & ".mhb", "Charm",	"CharmName", $CharmList[_GUICtrlComboBox_GetCurSel($CharmCombo)+1])
	IniWrite(@WorkingDir & "\MySets\" & $MySetName & ".mhb", "Charm",	"Level", $CharmUpgrade)
EndFunc

Func save_set_as_menu()
	_GUIEnhanceAnimateWin ($SaveAsGui, 200, $GUI_EN_ANI_FADEIN)
	GUISetState(@SW_SHOW, $SaveAsGui)
EndFunc

Func save_set_as_close()
	_GUIEnhanceAnimateWin ($SaveAsGui, 200, $GUI_EN_ANI_FADEOUT)
EndFunc

Func save_as()
	save_set_as_close()
	$MySetName = GUICtrlRead($MyNewSetName)
	save_set()
EndFunc

Func create_loading_gui()
	Opt("GUICoordMode", 1)

	Global $SetList[11][5]
	Global $SetListCount
	Global $SetPageCounter
	Global $SetPageCounterMax
	Global $set_slot_choosen = 0
	Global $SetFrame = GUICreate("SetGUI", 250, 300, $winpos[0] - 260, $winpos[1], $WS_POPUP, '', $MainFrame)
	GUICtrlCreatePic(@WorkingDir & "\Images\UI\JewelFrameBorder.bmp", 0, 0, 250, 300)
	GUICtrlSetState(-1, $GUI_DISABLE)
	local $SetFramePos=WinGetPos("SetGUI")

	Global $SetFramePrevButton = GUICtrlCreateButton("Prev", 50, 271, 25, 25)
	GUICtrlSetOnEvent(-1, "Set_prev")
	Global $SetFrameNextButton = GUICtrlCreateButton("Next", 80, 271, 25, 25)
	GUICtrlSetOnEvent(-1, "Set_next")

	Global $SetFramePageNumberGUI = GUICreate("SetGUI", 50, 20, $SetFramePos[0]+120, $SetFramePos[1]+276, $WS_POPUP, $WS_EX_LAYERED, $SetFrame)
	GUISetState(@SW_DISABLE, $SetFramePageNumberGUI)
	GUISetState(@SW_SHOW, $SetFramePageNumberGUI)
	GUISetBkColor(0x2B2C2A)
	_WinAPI_SetLayeredWindowAttributes($SetFramePageNumberGUI, 0x2B2C2A, 255)
	Global $SetFramePageNumber = GUICtrlCreateLabel("123", 0, 0, 50, 20)
	GUICtrlSetColor(-1, 0x2B2C2A)
	GUICtrlSetBkColor(-1, $GUI_BKCOLOR_TRANSPARENT)
	GUICtrlSetFont (-1, 8.5, 800)

	For $i = 1 to 10
		$SetList[$i][0] = GUICreate("", 230, 25, $SetFramePos[0]+10, $SetFramePos[1]+15+($i-1)*25, $WS_POPUP, '', $SetFrame)
		GUICtrlCreatePic(@WorkingDir & "\Images\UI\Menus\JewelBorder.bmp", 0, 0, 230, 25)
		GUISetState(@SW_DISABLE, $SetList[$i][0])
;~ 		GUISetState(@SW_SHOW, $SetList[$i][0])

		$SetList[$i][2]=GUICreate("", 200, 17, $SetFramePos[0]+18, $SetFramePos[1]+20+($i-1)*25, $WS_POPUP, '', $SetFrame)
		GUISetBkColor(0x2B2C2A)
		_WinAPI_SetLayeredWindowAttributes($SetList[$i][2], 0x2B2C2A, 255)
;~ 		GUISetState(@SW_SHOW, $SetList[$i][2])
		$SetList[$i][3] = GUICtrlCreateLabel("Test Set 123", 5, 2, 200, 17)
		GUICtrlSetOnEvent($SetList[$i][3], "choose_set")
		GUICtrlSetColor(-1, 0x2B2C2A)
		GUICtrlSetBkColor(-1, $GUI_BKCOLOR_TRANSPARENT)
		GUICtrlSetFont (-1, 8.5, 800)
	Next
EndFunc

Func show_sets_gui()
	GUICtrlSetOnEvent($OpenMenuButton, "choose_set")
	_GUIEnhanceAnimateWin ($SetFrame, 200, $GUI_EN_ANI_FADEIN)
	GUISetState(@SW_SHOW, $SetFrame)
;~ 	$SlotGUIhandle = @GUI_WinHandle
	load_set_list()
EndFunc

Func hide_sets_gui()
	GUICtrlSetOnEvent($OpenMenuButton, "show_sets_gui")
	For $i = 10 to 1 Step -1
		_GUIEnhanceCtrlFade ($SetList[$i][3], 1, True, False, 0xFFFFFF, 0x2B2C2A, 3)
		_GUIEnhanceAnimateWin ($SetList[$i][2], 1, $GUI_EN_ANI_FADEOUT)
		_GUIEnhanceAnimateWin ($SetList[$i][0], 1, $GUI_EN_ANI_FADEOUT)
;~ 		GUISetState(@SW_HIDE, $SetList[$i][1])
	Next
	_GUIEnhanceCtrlFade ($SetFramePageNumber, 1, True, False, 0xFFFFFF, 0x2B2C2A, 3)
	_GUIEnhanceAnimateWin ($SetFrame, 200, $GUI_EN_ANI_FADEOUT)
;~ 	GUISetState(@SW_HIDE, $SetFrame)
EndFunc

Func load_set_list()
	$SetListCount = _FileListToArray(@WorkingDir & "\MySets\", "*.mhb")
	$SetPageCounter = 1
	$SetPageCounterMax = Ceiling($SetListCount[0]/10)
	refresh_set_list()
EndFunc

Func refresh_set_list()
	Local $temp_name
	For $i = 1 to 10
		If $i+10*($SetPageCounter - 1) <= $SetListCount[0] Then
			_GUIEnhanceAnimateWin ($SetList[$i][0], 1, $GUI_EN_ANI_FADEIN)
			_GUIEnhanceAnimateWin ($SetList[$i][2], 1, $GUI_EN_ANI_FADEIN)
			GUISetState(@SW_SHOW, $SetList[$i][2])
			_GuiCtrlFadeSetData($SetList[$i][3], 0xFFFFFF, 0x2B2C2A, 0xFFFFFF, $SetListCount[$i + 10*($SetPageCounter - 1)], 1)
		Else
			_GUIEnhanceAnimateWin ($SetList[$i][0], 1, $GUI_EN_ANI_FADEOUT)
			_GUIEnhanceAnimateWin ($SetList[$i][2], 1, $GUI_EN_ANI_FADEOUT)
			_GuiCtrlFadeSetData($SetList[$i][3], 0xFFFFFF, 0x2B2C2A, 0xFFFFFF, "", 0)
		EndIf
	Next
	_GuiCtrlFadeSetData($SetFramePageNumber, 0xFFFFFF, 0x2B2C2A, 0xFFFFFF, "Page: " & $SetPageCounter, 1)
EndFunc

Func Set_next()
	$SetPageCounter = $SetPageCounter + 1
;~ 	MsgBox('','','')
	If $SetPageCounter > $SetPageCounterMax Then
		$SetPageCounter = $SetPageCounterMax
	Else
		refresh_Set_list()
	EndIf
EndFunc

Func Set_prev()
	$SetPageCounter = $SetPageCounter - 1
	If $SetPageCounter < 1 Then
		$SetPageCounter = 1
	Else
		refresh_Set_list()
	EndIf
EndFunc

Func choose_set()
	If @GUI_CTRLID <> $OpenMenuButton Then
		For $i = 1 to 10
			if @GUI_CTRLID = $SetList[$i][3] Then $set_slot_choosen = $i
		Next
		$MySetName = $SetListCount[$set_slot_choosen + 10*($SetPageCounter - 1)]
		load_set($MySetName)
	EndIf
	hide_sets_gui()
EndFunc

Func load_set($set_name)
	$init_trigger = True
	local $temp = IniRead(@WorkingDir & "\MySets\" & $set_name, "Weapon", "WeaponName", "zaloopa")
	local $temp_weapon = IniReadSectionNames(@WorkingDir & "\DB\Weapon.ini")
	For $i = 1 to $temp_weapon[0]
		If $temp = $temp_weapon[$i] Then _GUICtrlComboBox_SetCurSel($WeaponCombo, $i-1)
	Next
	weapon_choose()


	local $temp = IniRead(@WorkingDir & "\MySets\" & $set_name, "Head", "HeadName", "zaloopa")
	local $temp_Head = IniReadSectionNames(@WorkingDir & "\DB\Head.ini")
	For $i = 1 to $temp_Head[0]
		If $temp = $temp_Head[$i] Then _GUICtrlComboBox_SetCurSel($HeadCombo, $i-1)
	Next
	head_choose()


	local $temp = IniRead(@WorkingDir & "\MySets\" & $set_name, "Chest", "ChestName", "zaloopa")
	local $temp_Chest = IniReadSectionNames(@WorkingDir & "\DB\Chest.ini")
	For $i = 1 to $temp_Chest[0]
		If $temp = $temp_Chest[$i] Then _GUICtrlComboBox_SetCurSel($ChestCombo, $i-1)
	Next
	chest_choose()


	local $temp = IniRead(@WorkingDir & "\MySets\" & $set_name, "Hands", "HandsName", "zaloopa")
	local $temp_Hands = IniReadSectionNames(@WorkingDir & "\DB\Hands.ini")
	For $i = 1 to $temp_Hands[0]
		If $temp = $temp_Hands[$i] Then _GUICtrlComboBox_SetCurSel($HandsCombo, $i-1)
	Next
	hands_choose()


	local $temp = IniRead(@WorkingDir & "\MySets\" & $set_name, "Belt", "BeltName", "zaloopa")
	local $temp_Belt = IniReadSectionNames(@WorkingDir & "\DB\Belt.ini")
	For $i = 1 to $temp_Belt[0]
		If $temp = $temp_Belt[$i] Then _GUICtrlComboBox_SetCurSel($BeltCombo, $i-1)
	Next
	belt_choose()


	local $temp = IniRead(@WorkingDir & "\MySets\" & $set_name, "Boots", "BootsName", "zaloopa")
	local $temp_Boots = IniReadSectionNames(@WorkingDir & "\DB\Boots.ini")
	For $i = 1 to $temp_Boots[0]
		If $temp = $temp_Boots[$i] Then _GUICtrlComboBox_SetCurSel($BootsCombo, $i-1)
	Next
	$init_trigger = False
	boots_choose()

	local $temp = IniRead(@WorkingDir & "\MySets\" & $set_name, "Charm", "CharmName", "zaloopa")
	local $temp_Charm = IniReadSectionNames(@WorkingDir & "\DB\Charms.ini")
	For $i = 1 to $temp_Charm[0]
		If $temp = $temp_Charm[$i] Then _GUICtrlComboBox_SetCurSel($CharmCombo, $i-1)
	Next
	$init_trigger = False
	Charm_choose()

	local $temp = IniRead(@WorkingDir & "\MySets\" & $set_name, "Charm", "Level", "zaloopa")
	$CharmUpgrade = $temp

	$temp_weapon = IniReadSection(@WorkingDir & "\MySets\" & $set_name, "Weapon")

	For $i = 1 to 3
		$WeaponSlotsGems[$i] = $temp_weapon[$i+1][1]
		$WeaponAugments[$i] = $temp_weapon[$i+4][1]
	Next

	For $i = 1 to 3
		If $WeaponSlotsGems[$i] <> 'none' Then
			for $j = 1 to $GemList[0][0]
				If $GemList[$j][1] = $WeaponSlotsGems[$i] Then
					$temp = $j
				EndIf
			Next

			GUISetState(@SW_ENABLE, $WeaponSlotButton[$i][0])
			GUICtrlDelete($WeaponSlotButton[$i][1])
			$WeaponSlotButton[$i][1] = GUICtrlCreatePic(@WorkingDir & "\Images\UI\bk\Gem" & "White" & "Lvl" & $GemList[$temp][3] &".bmp",  0, 0, 19, 19)
			GUICtrlSetOnEvent($WeaponSlotButton[$i][1], "show_jewels_gui")
		EndIf

		If $WeaponAugments[$i] <> 'none' Then
			Select
				Case $WeaponAugments[$i] = 'raw'
					GUICtrlSetData($WeaponAugmentButtons[$i][5], "Attack")
				Case $WeaponAugments[$i] = 'aff'
					GUICtrlSetData($WeaponAugmentButtons[$i][5], "Affinity")
				Case $WeaponAugments[$i] = 'def'
					GUICtrlSetData($WeaponAugmentButtons[$i][5], "Defense")
				Case $WeaponAugments[$i] = 'slot'
					GUICtrlSetData($WeaponAugmentButtons[$i][5], "Slot")
				Case $WeaponAugments[$i] = 'hp'
					GUICtrlSetData($WeaponAugmentButtons[$i][5], "Health")
			EndSelect
			GUICtrlSetColor($WeaponAugmentButtons[$i][5], $COLOR_GREEN)
		Else
			GUICtrlSetData($WeaponAugmentButtons[$i][5], "- - - - -")
			GUICtrlSetColor($WeaponAugmentButtons[$i][5], $COLOR_WHITE)
		EndIf
	Next

	$temp_Head = IniReadSection(@WorkingDir & "\MySets\" & $set_name, "Head")

	For $i = 1 to 3
		$HeadSlotsGems[$i] = $temp_Head[$i+1][1]
	Next

	For $i = 1 to 3
		If $HeadSlotsGems[$i] <> 'none' Then
			for $j = 1 to $GemList[0][0]
				If $GemList[$j][1] = $HeadSlotsGems[$i] Then
					$temp = $j
				EndIf
			Next

			GUISetState(@SW_ENABLE, $HeadSlotButton[$i][0])
			GUICtrlDelete($HeadSlotButton[$i][1])
			$HeadSlotButton[$i][1] = GUICtrlCreatePic(@WorkingDir & "\Images\UI\bk\Gem" & "White" & "Lvl" & $GemList[$temp][3] &".bmp",  0, 0, 19, 19)
			GUICtrlSetOnEvent($HeadSlotButton[$i][1], "show_jewels_gui")
		EndIf
	Next

	$temp_Chest = IniReadSection(@WorkingDir & "\MySets\" & $set_name, "Chest")

	For $i = 1 to 3
		$ChestSlotsGems[$i] = $temp_Chest[$i+1][1]
	Next

	For $i = 1 to 3
		If $ChestSlotsGems[$i] <> 'none' Then
			for $j = 1 to $GemList[0][0]
				If $GemList[$j][1] = $ChestSlotsGems[$i] Then
					$temp = $j
				EndIf
			Next

			GUISetState(@SW_ENABLE, $ChestSlotButton[$i][0])
			GUICtrlDelete($ChestSlotButton[$i][1])
			$ChestSlotButton[$i][1] = GUICtrlCreatePic(@WorkingDir & "\Images\UI\bk\Gem" & "White" & "Lvl" & $GemList[$temp][3] &".bmp",  0, 0, 19, 19)
			GUICtrlSetOnEvent($ChestSlotButton[$i][1], "show_jewels_gui")
		EndIf
	Next

	$temp_Hands = IniReadSection(@WorkingDir & "\MySets\" & $set_name, "Hands")

	For $i = 1 to 3
		$HandsSlotsGems[$i] = $temp_Hands[$i+1][1]
	Next

	For $i = 1 to 3
		If $HandsSlotsGems[$i] <> 'none' Then
			for $j = 1 to $GemList[0][0]
				If $GemList[$j][1] = $HandsSlotsGems[$i] Then
					$temp = $j
				EndIf
			Next

			GUISetState(@SW_ENABLE, $HandsSlotButton[$i][0])
			GUICtrlDelete($HandsSlotButton[$i][1])
			$HandsSlotButton[$i][1] = GUICtrlCreatePic(@WorkingDir & "\Images\UI\bk\Gem" & "White" & "Lvl" & $GemList[$temp][3] &".bmp",  0, 0, 19, 19)
			GUICtrlSetOnEvent($HandsSlotButton[$i][1], "show_jewels_gui")
		EndIf
	Next

	$temp_Belt = IniReadSection(@WorkingDir & "\MySets\" & $set_name, "Belt")

	For $i = 1 to 3
		$BeltSlotsGems[$i] = $temp_Belt[$i+1][1]
	Next

	For $i = 1 to 3
		If $BeltSlotsGems[$i] <> 'none' Then
			for $j = 1 to $GemList[0][0]
				If $GemList[$j][1] = $BeltSlotsGems[$i] Then
					$temp = $j
				EndIf
			Next

			GUISetState(@SW_ENABLE, $BeltSlotButton[$i][0])
			GUICtrlDelete($BeltSlotButton[$i][1])
			$BeltSlotButton[$i][1] = GUICtrlCreatePic(@WorkingDir & "\Images\UI\bk\Gem" & "White" & "Lvl" & $GemList[$temp][3] &".bmp",  0, 0, 19, 19)
			GUICtrlSetOnEvent($BeltSlotButton[$i][1], "show_jewels_gui")

		EndIf
	Next

	$temp_Boots = IniReadSection(@WorkingDir & "\MySets\" & $set_name, "Boots")

	For $i = 1 to 3
		$BootsSlotsGems[$i] = $temp_Boots[$i+1][1]
	Next

	For $i = 1 to 3
		If $BootsSlotsGems[$i] <> 'none' Then
			for $j = 1 to $GemList[0][0]
				If $GemList[$j][1] = $BootsSlotsGems[$i] Then
					$temp = $j
				EndIf
			Next

			GUISetState(@SW_ENABLE, $BootsSlotButton[$i][0])
			GUICtrlDelete($BootsSlotButton[$i][1])
			$BootsSlotButton[$i][1] = GUICtrlCreatePic(@WorkingDir & "\Images\UI\bk\Gem" & "White" & "Lvl" & $GemList[$temp][3] &".bmp",  0, 0, 19, 19)
			GUICtrlSetOnEvent($BootsSlotButton[$i][1], "show_jewels_gui")
		EndIf
	Next

	Select
		Case $CharmUpgrade = 2
			_GUIEnhanceAnimateWin ($Upgrade_buttons[6][2], $button_fade_delay, $GUI_EN_ANI_FADEOUT)
			GUISetState(@SW_ENABLE, $Upgrade_buttons[6][2])
			GUICtrlDelete($Upgrade_buttons[6][3])
			$Upgrade_buttons[6][3] = GUICtrlCreatePic(@WorkingDir & "\Images\UI\bk\UpgradeCheck.bmp",  0, 0, 15, 15)
			_GUIEnhanceAnimateWin ($Upgrade_buttons[6][2], $button_fade_delay, $GUI_EN_ANI_FADEIN)
		Case $CharmUpgrade = 3
			_GUIEnhanceAnimateWin ($Upgrade_buttons[6][4], $button_fade_delay, $GUI_EN_ANI_FADEOUT)
			GUISetState(@SW_ENABLE, $Upgrade_buttons[6][4])
			GUICtrlDelete($Upgrade_buttons[6][5])
			$Upgrade_buttons[6][5] = GUICtrlCreatePic(@WorkingDir & "\Images\UI\bk\UpgradeCheck.bmp",  0, 0, 15, 15)
			_GUIEnhanceAnimateWin ($Upgrade_buttons[6][4], $button_fade_delay, $GUI_EN_ANI_FADEIN)
	EndSelect

;~ 		GUICtrlSetOnEvent($SlotHandle, "show_jewels_gui")
;~ 		_GUIEnhanceAnimateWin ($SlotGUIhandle, $button_fade_delay, $GUI_EN_ANI_FADEIN)

;~ 		For $i = 1 to 3
;~ 		Opt("GUICoordMode", 1)
;~ 		$WeaponSlotButton[$i][0] = GUICreate("", 19, 19, $winpos[0]+93+($i-1)*78, $winpos[1]+102, $WS_POPUP, '', $MainFrame)
;~ 		$WeaponSlotButton[$i][1] = GUICtrlCreatePic(@WorkingDir & "\Images\UI\bk\Gem1.bmp",  0, 0, 19, 19)
;~ 		GUISetState(@SW_SHOW, $WeaponSlotButton[$i][0])
;~ 		$HeadSlotButton[$i][0] = GUICreate("", 19, 19, $winpos[0]+93+($i-1)*78, $winpos[1]+157, $WS_POPUP, '', $MainFrame)
;~ 		$HeadSlotButton[$i][1] = GUICtrlCreatePic(@WorkingDir & "\Images\UI\bk\Gem1.bmp",  0, 0, 19, 19)
;~ 		GUISetState(@SW_SHOW, $WeaponSlotButton[$i][0])
;~ 		$ChestSlotButton[$i][0] = GUICreate("", 19, 19,  $winpos[0]+93+($i-1)*78, $winpos[1]+212, $WS_POPUP, '', $MainFrame)
;~ 		$ChestSlotButton[$i][1] = GUICtrlCreatePic(@WorkingDir & "\Images\UI\bk\Gem1.bmp",  0, 0, 19, 19)
;~ 		GUISetState(@SW_SHOW, $WeaponSlotButton[$i][0])
;~ 		$HandsSlotButton[$i][0] = GUICreate("", 19, 19,  $winpos[0]+93+($i-1)*78, $winpos[1]+267, $WS_POPUP, '', $MainFrame)
;~ 		$HandsSlotButton[$i][1] = GUICtrlCreatePic(@WorkingDir & "\Images\UI\bk\Gem1.bmp",  0, 0, 19, 19)
;~ 		GUISetState(@SW_SHOW, $WeaponSlotButton[$i][0])
;~ 		$BeltSlotButton[$i][0] = GUICreate("", 19, 19,  $winpos[0]+93+($i-1)*78, $winpos[1]+322, $WS_POPUP, '', $MainFrame)
;~ 		$BeltSlotButton[$i][1] = GUICtrlCreatePic(@WorkingDir & "\Images\UI\bk\Gem1.bmp",  0, 0, 19, 19)
;~ 		GUISetState(@SW_SHOW, $WeaponSlotButton[$i][0])
;~ 		$BootsSlotButton[$i][0] = GUICreate("", 19, 19,  $winpos[0]+93+($i-1)*78, $winpos[1]+377, $WS_POPUP, '', $MainFrame)
;~ 		$BootsSlotButton[$i][1] = GUICtrlCreatePic(@WorkingDir & "\Images\UI\bk\Gem1.bmp",  0, 0, 19, 19)
;~ 		GUISetState(@SW_SHOW, $WeaponSlotButton[$i][0])
;~ 	Next
;~ 	GUISetState(@SW_ENABLE, $MainFrame)

EndFunc

Func _GUIEnhanceAnimateWin($hWnd, $iTimeMs, $iType)
	Local $aRet = DllCall("user32.dll", "int", "AnimateWindow", "hwnd", $hWnd, "int", $iTimeMs, "long", $iType)
	If $aRet[0] = 0 Then Return SetError(1, 0, 0)
	Return 1
EndFunc   ;==>_GUIEnhanceAnimateWin

Func _GUIEnhanceAnimateTitle($hWnd, $sTitle, $iType = 0, $vParam1 = Default, $vParam2 = Default)
	If Not WinExists($hWnd) Then Return SetError(1, 0, 0)
	Switch $iType
		Case $GUI_EN_TITLE_SLIDE
			Local $sStr, $iCounter, $iBuf = $vParam1, $asTitle, $sStartChr = $vParam2
			If $vParam1 = Default Then $iBuf = 100
			If $vParam2 = Default Then $sStartChr = " "
			;validate buffer length
			If Not IsInt($iBuf) Then Return SetError(2, 0, 0)
			;split the title into a useable array
			$asTitle = StringSplit($sTitle, "")
			;set the title to $iCounter spaces and first letter of title
			;$iCounter decreases by 1 each loop
			For $iCounter = $iBuf To 0 Step - 1
				WinSetTitle($hWnd, "", _StringRepeat($sStartChr, $iCounter) & $asTitle[1])
			Next
			Local $sStr
			;add a character from the title each loop
			For $iCounter = 1 To $asTitle[0]
				$sStr &= $asTitle[$iCounter]
				WinSetTitle($hWnd, "", $sStr)
				Sleep(5)
			Next
			Return 1
		Case $GUI_EN_TITLE_DROP
			Local $asTitle = StringSplit($sTitle, ""), $iCounter
			Local $aiPlaced[$asTitle[0] + 1], $iCompleteTest = 0
			Local $iRand, $sTemp, $sStartChr = $vParam1, $iSleep = $vParam2
			If $vParam1 = Default Then $sStartChr = "_"
			If $vParam2 = Default Then $iSleep = 50
			If StringLen($sStartChr) <> 1 Then Return SetError(2, 0, 0)
			;set title to correct number of characters
			WinSetTitle($hWnd, "", _StringRepeat($sStartChr, $asTitle[0]))
			Do
				;create a random number
				Do
					$iRand = Random(1, $asTitle[0], 1)
				Until $aiPlaced[$iRand] = 0
				;fill that space with the letter
				$sTemp = StringLeft(WinGetTitle($hWnd), $iRand - 1)
				$sTemp &= $asTitle[$iRand]
				$sTemp &= StringRight(WinGetTitle($hWnd), $asTitle[0] - $iRand)
				WinSetTitle($hWnd, "", $sTemp)
				$aiPlaced[$iRand] = 1
				$iCompleteTest = 0
				For $iCounter = 1 To $asTitle[0]
					$iCompleteTest += $aiPlaced[$iCounter]
				Next
				Sleep($iSleep)
			Until $iCompleteTest = $asTitle[0]
			Return 1
		Case $GUI_EN_TITLE_BLINK
			Local $asTitle = StringSplit($sTitle, ""), $iCounter
			Local $iBlink = $vParam1, $iDelay = $vParam2
			If $vParam1 = Default Then $iBlink = 5
			If $vParam2 = Default Then $iDelay = 200
			If Not IsNumber($iBlink) Then Return SetError(2, 0, 0)
			If Not IsNumber($iDelay) Then Return SetError(2, 0, 0)
			For $iCounter = 1 To $iBlink
				WinSetTitle($hWnd, "", "")
				Sleep($iDelay)
				WinSetTitle($hWnd, "", $sTitle)
				Sleep($iDelay)
			Next
			Return 1
		Case Else
			Return SetError(3, 0, 0)
	EndSwitch
EndFunc

Func _GUIEnhanceScaleWin($hWnd, $iNewWidth, $iNewHeight = Default, $fCenter = True, $iStep = 10, $iSleep = 10)
	If Not WinExists($hWnd) Then Return SetError(1, 0, 0)
	Local $aiWinPos = WinGetPos($hWnd), $iHeightDiff, $iStepGain, $iLastStep
	If $iNewWidth = Default Then $iNewWidth = 0
	If $iNewHeight = Default Then $iNewHeight = 0
	$iNewWidth += $aiWinPos[2]
	$iNewHeight += $aiWinPos[3]
	If $iNewWidth = $aiWinPos[2] And $iNewHeight = $aiWinPos[3] Then Return 1
	Local $iWidthDiff = Abs($iNewWidth - $aiWinPos[2])
	Local $iHeightDiff = Abs($iNewHeight - $aiWinPos[3])
	Local $aiStepGain[2] = [Int($iWidthDiff / $iStep), Int($iHeightDiff / $iStep) ]
	Local $aiLastStep[2] = [$iWidthDiff - $aiStepGain[0] * ($iStep - 1), $iHeightDiff - $aiStepGain[1] * ($iStep - 1) ]
	If $iNewWidth < $aiWinPos[2] Then
		$aiStepGain[0] *= -1
		$aiLastStep[0] *= -1
	EndIf
	If $iNewHeight < $aiWinPos[3] Then
		$aiStepGain[1] *= -1
		$aiLastStep[1] *= -1
	EndIf
	For $i = 1 To $iStep - 1
		If $fCenter Then
			$aiWinPos[0] -= Int($aiStepGain[0] / 2)
			If $aiWinPos[0] < 0 Then $aiWinPos[0] = 0
			$aiWinPos[1] -= Int($aiStepGain[1] / 2)
			If $aiWinPos[1] < 0 Then $aiWinPos[1] = 0
		EndIf
		$aiWinPos[2] += $aiStepGain[0]
		$aiWinPos[3] += $aiStepGain[1]
		WinMove($hWnd, "", $aiWinPos[0], $aiWinPos[1], $aiWinPos[2], $aiWinPos[3])
		Sleep($iSleep)
	Next
	If $fCenter And $aiWinPos[0] >= Int($aiStepGain[0] / 2) And $aiWinPos[1] >= Int($aiStepGain[1] / 2) Then
		$aiWinPos[0] -= Int($aiLastStep[0] / 2)
		If $aiWinPos[0] < 0 Then $aiWinPos[0] = 0
		$aiWinPos[1] -= Int($aiLastStep[1] / 2)
		If $aiWinPos[1] < 0 Then $aiWinPos[1] = 0
	EndIf
	WinMove($hWnd, "", $aiWinPos[0], $aiWinPos[1], $aiWinPos[2] + $aiLastStep[0], $aiWinPos[3] + $aiLastStep[1])
	Return 1
EndFunc   ;==>_GUIEnhanceScaleWin

Func _GUIEnhanceCtrlFade($Ctrl, $iTime, $fColor, $fBkColor, $iStartColor, $iEndColor, $iStep = 25)
	If Not $fColor And Not $fBkColor Then Return SetError(1, 0, 0)
	If Not IsArray($Ctrl) Then
		Local $aCtrl[1] = [$Ctrl]
	Else
		Local $aCtrl = $Ctrl
	EndIf
	Local $aiGradient = __ColorGradient($iStartColor, $iEndColor, $iStep)
	For $iCounter = 1 To $iStep
		For $i = 0 To UBound($aCtrl) - 1
			If $fColor Then GUICtrlSetColor($aCtrl[$i], $aiGradient[$iCounter - 1])
			If $fBkColor Then GUICtrlSetBkColor($aCtrl[$i], $aiGradient[$iCounter - 1])
		Next
		Sleep($iTime / $iStep)
	Next
	Return 1
EndFunc   ;==>_GUIEnhanceCtrlFade

Func _GUIEnhanceCtrlDrift($hWnd, $Ctrl, $iX, $iY, $iStep = 1)
	If Not WinExists($hWnd) Then Return SetError(1, 0, 0)
	Local $aOldPos = ControlGetPos($hWnd, "", $Ctrl)
	Local $iXOld = $aOldPos[0]
	Local $iYOld = $aOldPos[1]
	Local $fSteep = Abs($iY - $iYOld) > Abs($iX - $iXOld)
	Local $aPoints[1][2]
	Local $iOldX = $iX, $iOldY = $iY, $iYVal, $iYStep
	Local $iDeltaX, $iDeltaY, $iError, $iDeltaError
	If $fSteep Then
		__Swap($iXOld, $iYOld)
		__Swap($iX, $iY)
	EndIf
	If $iXOld > $iX Then
		__Swap($iXOld, $iX)
		__Swap($iYOld, $iY)
	EndIf
	$iDeltaX = $iX - $iXOld
	$iDeltaY = Abs($iY - $iYOld)
	$iError = 0
	$iDeltaError = $iDeltaY / $iDeltaX
	$iYVal = $iYOld
	If $iYOld < $iY Then
		$iYStep = 1
	Else
		$iYStep = -1
	EndIf
	For $iXVal = $iXOld To $iX
		If $fSteep Then
			GLobal $aPoints[UBound($aPoints) + 1][2]
			$aPoints[UBound($aPoints) - 1][0] = $iYVal
			$aPoints[UBound($aPoints) - 1][1] = $iXVal
		Else
			GLobal $aPoints[UBound($aPoints) + 1][2]
			$aPoints[UBound($aPoints) - 1][0] = $iXVal
			$aPoints[UBound($aPoints) - 1][1] = $iYVal
		EndIf
		$iError = $iError + $iDeltaError
		If $iError >= 0.5 Then
			$iYVal = $iYVal + $iYStep
			$iError = $iError - 1
		EndIf
	Next
	If $aPoints[1][0] = $iOldX And $aPoints[1][1] = $iOldY Then
		For $iPoint = UBound($aPoints) - 1 To 1 Step $iStep * - 1
			ControlMove($hWnd, "", $Ctrl, $aPoints[$iPoint][0], $aPoints[$iPoint][1])
			Sleep(1)
		Next
		ControlMove($hWnd, "", $Ctrl, $aPoints[1][0], $aPoints[1][1])
	Else
		For $iPoint = 1 To UBound($aPoints) - 1 Step $iStep
			ControlMove($hWnd, "", $Ctrl, $aPoints[$iPoint][0], $aPoints[$iPoint][1])
			Sleep(1)
		Next
		ControlMove($hWnd, "", $Ctrl, $aPoints[UBound($aPoints) - 1][0], $aPoints[UBound($aPoints) - 1][1])
	EndIf
	Return 1
EndFunc   ;==>_GUIEnhanceCtrlDrift

Func __Swap(ByRef $va, ByRef $vb)
	Local $vTemp
	$vTemp = $va
	$va = $vb
	$vb = $vTemp
EndFunc   ;==>__Swap

;CoePSX - Thanks!
Func __ColorGradient($hInitialColor, $hFinalColor, $iReturnSize)
	Local $iNowRed, $iNowBlue, $iNowGreen
	$hInitialColor = Hex($hInitialColor, 6)
	$hFinalColor = Hex($hFinalColor, 6)

	Local $iRed1 = Dec(StringLeft($hInitialColor, 2))
	Local $iGreen1 = Dec(StringMid($hInitialColor, 3, 2))
	Local $iBlue1 = Dec(StringMid($hInitialColor, 5, 2))

	Local $iRed2 = Dec(StringLeft($hFinalColor, 2))
	Local $iGreen2 = Dec(StringMid($hFinalColor, 3, 2))
	Local $iBlue2 = Dec(StringMid($hFinalColor, 5, 2))

	Local $iPlusRed = ($iRed2 - $iRed1) / ($iReturnSize - 1)
	Local $iPlusBlue = ($iBlue2 - $iBlue1) / ($iReturnSize - 1)
	Local $iPlusGreen = ($iGreen2 - $iGreen1) / ($iReturnSize - 1)

	GLobal $iColorArray[$iReturnSize]
	For $i = 0 To $iReturnSize - 1
		$iNowRed = Floor($iRed1 + ($iPlusRed * $i))
		$iNowBlue = Floor($iBlue1 + ($iPlusBlue * $i))
		$iNowGreen = Floor($iGreen1 + ($iPlusGreen * $i))
		$iColorArray[$i] = Dec(Hex($iNowRed, 2) & Hex($iNowGreen, 2) & Hex($iNowBlue, 2))
	Next
	Return $iColorArray
EndFunc   ;==>__ColorGradient