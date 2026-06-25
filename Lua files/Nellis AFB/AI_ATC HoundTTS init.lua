-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--************************************************************ KLSV   |   ATIS   |   PIPER / AMY   |   VIA HOUNDTTS *************************************************************--
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
local ATIS_FrequencyTbl = {270.100}
local ATIS_MSRS = MSRS:New("", ATIS_FrequencyTbl, 0)
ATIS_MSRS.backend = MSRS.Backend.HOUND
ATIS_MSRS:SetProvider(MSRS.Provider.PIPER)
ATIS_MSRS:SetVoice("en_US-amy-medium")

AI_ATC:Set_MSRS("ATIS", ATIS_MSRS, 0.9)
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--********************************************************** KLSV   |   CLEARANCE   |   PIPER / JOE   |   VIA HOUNDTTS **********************************************************--
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
local CD_FrequencyTbl = {289.4, 120.9}
local CD_MSRS = MSRS:New("", CD_FrequencyTbl, 0)
CD_MSRS.backend = MSRS.Backend.HOUND
CD_MSRS:SetProvider(MSRS.Provider.PIPER)
CD_MSRS:SetVoice("en_US-libritts_r-medium")
CD_MSRS:SetSpeakerPiper(6)

AI_ATC:Set_MSRS("Clearance", CD_MSRS, 1.1)
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--********************************************************** KLSV   |   GROUND   |   PIPER / BRYCE   |   VIA HOUNDTTS ***********************************************************--
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
local Gnd_FrequencyTbl = {275.8, 121.8}
local GND_MSRS = MSRS:New("", Gnd_FrequencyTbl, 0)
GND_MSRS.backend = MSRS.Backend.HOUND
GND_MSRS:SetProvider(MSRS.Provider.PIPER)
GND_MSRS:SetVoice("en_US-libritts_r-medium")
GND_MSRS:SetSpeakerPiper(22)

AI_ATC:Set_MSRS("Ground", GND_MSRS, 1.0)
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--************************************************************* KLSV   |   TOWER   |   HFC-MALE   |   VIA HOUNDTTS **************************************************************--
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
local Twr_FrequencyTbl = {327.000, 132.550}
local Twr_MSRS = MSRS:New("", Twr_FrequencyTbl, 0)
Twr_MSRS.backend = MSRS.Backend.HOUND
Twr_MSRS:SetProvider(MSRS.Provider.PIPER)
Twr_MSRS:SetVoice("en_US-libritts_r-medium")
Twr_MSRS:SetSpeakerPiper(800)

AI_ATC:Set_MSRS("Tower", Twr_MSRS, 1.0)
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--****************************************************** KLSV   |   DEPARTURE   |   PIPER / LIBRITTS_R   |   VIA HOUNDTTS *******************************************************--
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
local Dep_FrequencyTbl = {385.400, 135.100}
local DEP_MSRS = MSRS:New("", Dep_FrequencyTbl, 0)
DEP_MSRS.backend = MSRS.Backend.HOUND
DEP_MSRS:SetProvider(MSRS.Provider.PIPER)
DEP_MSRS:SetVoice("en_US-libritts_r-medium")
DEP_MSRS:SetSpeakerPiper(0)

AI_ATC:Set_MSRS("Departure", DEP_MSRS, 0.9)
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--******************************************************* KLSV   |   APPROACH   |   PIPER / LIBRITTS_R   |   VIA HOUNDTTS *******************************************************--
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
local App_FrequencyTbl = {273.550, 124.950}
local APP_MSRS = MSRS:New("", App_FrequencyTbl, 0)
APP_MSRS.backend = MSRS.Backend.HOUND
APP_MSRS:SetProvider(MSRS.Provider.PIPER)
APP_MSRS:SetVoice("en_US-libritts_r-medium")
APP_MSRS:SetSpeakerPiper(630)

AI_ATC:Set_MSRS("Approach", APP_MSRS, 0.9)
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--********************************************************* KLSV   |   SFA   |   PIPER / LIBRITTS_R   |   VIA HOUNDTTS **********************************************************--
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
local SFA_FrequencyTbl = {343.725}
local SFA_MSRS = MSRS:New("", SFA_FrequencyTbl, 0)
local SFA_Random = math.random(1, 903)
SFA_MSRS.backend = MSRS.Backend.HOUND
SFA_MSRS:SetProvider(MSRS.Provider.PIPER)
SFA_MSRS:SetVoice("en_US-libritts_r-medium")
SFA_MSRS:SetSpeakerPiper(SFA_Random)

AI_ATC:Set_MSRS("SFA", SFA_MSRS, 1.0)
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--***************************************************** KLSV   |   NATCF SALLY   |   PIPER / LIBRITTS_R   |   VIA HOUNDTTS ******************************************************--
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
local SLY_FrequencyTbl = {317.525, 126.650}
local SLY_Random = math.random(1, 903)
local SLY_MSRS = MSRS:New("", SLY_FrequencyTbl, 0)
SLY_MSRS.backend = MSRS.Backend.HOUND
SLY_MSRS:SetProvider(MSRS.Provider.PIPER)
SLY_MSRS:SetVoice("en_US-libritts_r-medium")
SLY_MSRS:SetSpeakerPiper(SLY_Random)

AI_ATC:Set_MSRS("NATCF_SALLY", SLY_MSRS, 1.0)
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--****************************************************** KLSV   |   NATCF LEE   |   PIPER / LIBRITTS_R   |   VIA HOUNDTTS *******************************************************--
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
local LEE_FrequencyTbl = {254.400, 119.350}
local LEE_Random = math.random(1, 903)
local LEE_MSRS = MSRS:New("", LEE_FrequencyTbl, 0)
LEE_MSRS.backend = MSRS.Backend.HOUND
LEE_MSRS:SetProvider(MSRS.Provider.PIPER)
LEE_MSRS:SetVoice("en_US-libritts_r-medium")
LEE_MSRS:SetSpeakerPiper(LEE_Random)

AI_ATC:Set_MSRS("NATCF_LEE", LEE_MSRS, 1.0)
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--****************************************************** KLSV   |   BLACKJACK   |   PIPER / LIBRITTS_R   |   VIA HOUNDTTS *******************************************************--
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
local Blk_FrequencyTbl = {377.800}
local BLK_MSRS = MSRS:New("", Blk_FrequencyTbl, 0)
BLK_MSRS.backend = MSRS.Backend.HOUND
BLK_MSRS:SetProvider(MSRS.Provider.PIPER)
BLK_MSRS:SetVoice("en_US-libritts_r-medium")
BLK_MSRS:SetSpeakerPiper(685)

AI_ATC:Set_MSRS("BlackJack", BLK_MSRS, 1.0)
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--************************************************************ KTNX   |   ATIS   |   PIPER / AMY   |   VIA HOUNDTTS *************************************************************--
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
local ATC2_ATIS_FrequencyTbl = {369.4, 113.000}
local ATC2_ATIS_MSRS = MSRS:New("", ATC2_ATIS_FrequencyTbl, 0)
ATC2_ATIS_MSRS.backend = MSRS.Backend.HOUND
ATC2_ATIS_MSRS:SetProvider(MSRS.Provider.PIPER)
ATC2_ATIS_MSRS:SetVoice("en_US-amy-medium")

AI_ATC2:Set_MSRS("ATIS", ATC2_ATIS_MSRS, 0.9)
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--****************************************************** KTNX   |   CLEARANCE   |   PIPER / LIBRITTS_R   |   VIA HOUNDTTS *******************************************************--
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
local ATC2_CD_FrequencyTbl = {233.95, 119.450}
local ATC2_CD_Random = math.random(1, 903)
local ATC2_CD_MSRS = MSRS:New("", ATC2_CD_FrequencyTbl, 0)
ATC2_CD_MSRS.backend = MSRS.Backend.HOUND
ATC2_CD_MSRS:SetProvider(MSRS.Provider.PIPER)
ATC2_CD_MSRS:SetVoice("en_US-libritts_r-medium")
ATC2_CD_MSRS:SetSpeakerPiper(ATC2_CD_Random)

AI_ATC2:Set_MSRS("Clearance", ATC2_CD_MSRS, 1.1)
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--******************************************************** KTNX   |   GROUND   |   PIPER / LIBRITTS_R   |   VIA HOUNDTTS ********************************************************--
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
local ATC2_Gnd_FrequencyTbl = {335.5, 127.250}
local ATC2_Gnd_Random = math.random(1, 903)
local ATC2_GND_MSRS = MSRS:New("", ATC2_Gnd_FrequencyTbl, 0)
ATC2_GND_MSRS.backend = MSRS.Backend.HOUND
ATC2_GND_MSRS:SetProvider(MSRS.Provider.PIPER)
ATC2_GND_MSRS:SetVoice("en_US-libritts_r-medium")
ATC2_GND_MSRS:SetSpeakerPiper(ATC2_Gnd_Random)

AI_ATC2:Set_MSRS("Ground", ATC2_GND_MSRS, 1.0)
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--******************************************************** KTNX   |   TOWER   |   PIPER / LIBRITTS_R   |   VIA HOUNDTTS *********************************************************--
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
local ATC2_Twr_FrequencyTbl = {257.95, 124.750}
local ATC2_Twr_Random = math.random(1, 903)
local ATC2_Twr_MSRS = MSRS:New("", ATC2_Twr_FrequencyTbl, 0)
ATC2_Twr_MSRS.backend = MSRS.Backend.HOUND
ATC2_Twr_MSRS:SetProvider(MSRS.Provider.PIPER)
ATC2_Twr_MSRS:SetVoice("en_US-libritts_r-medium")
ATC2_Twr_MSRS:SetSpeakerPiper(ATC2_Twr_Random)

AI_ATC2:Set_MSRS("Tower", ATC2_Twr_MSRS, 1.0)
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--**************************************************** KTNX   |   NELLIS CONTROL   |   PIPER / LIBRITTS_R   |   VIA HOUNDTTS ****************************************************--
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
AI_ATC2:Set_MSRS("NATCF_LEE", LEE_MSRS, 1.0)
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--****************************************************** KINS   |   CLEARANCE   |   PIPER / LIBRITTS_R   |   VIA HOUNDTTS *******************************************************--
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
local ATC3_CD_FrequencyTbl = {372.2, 118.300}
local ATC3_CD_Random = math.random(1, 903)
local ATC3_CD_MSRS = MSRS:New("", ATC3_CD_FrequencyTbl, 0)
ATC3_CD_MSRS.backend = MSRS.Backend.HOUND
ATC3_CD_MSRS:SetProvider(MSRS.Provider.PIPER)
ATC3_CD_MSRS:SetVoice("en_US-libritts_r-medium")
ATC3_CD_MSRS:SetSpeakerPiper(ATC3_CD_Random)

AI_ATC3:Set_MSRS("Clearance", ATC3_CD_MSRS, 1.1)
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--******************************************************** KINS   |   GROUND   |   PIPER / LIBRITTS_R   |   VIA HOUNDTTS ********************************************************--
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
local ATC3_Gnd_FrequencyTbl = {275.8, 118.300}
local ATC3_Gnd_Random = math.random(1, 903)
local ATC3_GND_MSRS = MSRS:New("", ATC3_Gnd_FrequencyTbl, 0)
ATC3_GND_MSRS.backend = MSRS.Backend.HOUND
ATC3_GND_MSRS:SetProvider(MSRS.Provider.PIPER)
ATC3_GND_MSRS:SetVoice("en_US-libritts_r-medium")
ATC3_GND_MSRS:SetSpeakerPiper(ATC3_Gnd_Random)

AI_ATC3:Set_MSRS("Ground", ATC3_GND_MSRS, 1.0)
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--******************************************************** KINS   |   TOWER   |   PIPER / LIBRITTS_R   |   VIA HOUNDTTS *********************************************************--
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
local ATC3_Twr_FrequencyTbl = {360.60, 118.300}
local ATC3_Twr_Random = math.random(1, 903)
local ATC3_Twr_MSRS = MSRS:New("", ATC3_Twr_FrequencyTbl, 0)
ATC3_Twr_MSRS.backend = MSRS.Backend.HOUND
ATC3_Twr_MSRS:SetProvider(MSRS.Provider.PIPER)
ATC3_Twr_MSRS:SetVoice("en_US-libritts_r-medium")
ATC3_Twr_MSRS:SetSpeakerPiper(ATC3_Twr_Random)

AI_ATC3:Set_MSRS("Tower", ATC3_Twr_MSRS, 1.0)
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--**************************************************** KINS   |   NELLIS CONTROL   |   PIPER / LIBRITTS_R   |   VIA HOUNDTTS ****************************************************--
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
AI_ATC3:Set_MSRS("NATCF_LEE", LEE_MSRS, 1.0)