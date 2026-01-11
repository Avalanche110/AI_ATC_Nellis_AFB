-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--***************************************************************************AIRBASE_ATC*****************************************************************************************--
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
AI_ATC = {}

_SETTINGS:SetPlayerMenuOff()

AI_ATC.Airstart = false

AI_ATC.CrewChief = false

AI_ATC.ParentMenu = MENU_MISSION:New("AI_ATC")

--AI_ATC.Environment = "Local"
AI_ATC.Environment = "Online"
AI_ATC.SoundPath = "C:\\Users\\Administrator\\Saved Games\\"
AI_ATC.SRS_Path = "C:\\Program Files\\DCS-SimpleRadio-Standalone"
AI_ATC.SRSPort = 5002

AI_ATC.ATIS = {}
AI_ATC.Ground = {}
AI_ATC.Clearance = {}
AI_ATC.Tower = {}
AI_ATC.Departure = {}
AI_ATC.Approach = {}
AI_ATC.SFA = {}

AI_ATC.TimeStamp = function()timer.getTime()end

AI_ATC.CustomCallsigns = {}
AI_ATC.FlightGroup = {}
AI_ATC.PARdata = {}

AI_ATC.Coalition = "blue"
AI_ATC.Airbase = "Incirlik"
AI_ATC.AirbaseID = AIRBASE.Syria.Incirlik
AI_ATC_Airbase = AIRBASE:FindByName("Incirlik")

AI_ATC.Runways = { Takeoff = nil, TakeoffZone = nil, Landing = nil, LandingZone = nil, HoldShort = nil, TakeoffClearance = false }
  
AI_ATC.MissionStart = UTILS.SecondsOfToday()

AI_ATC.Radio = {
  ["ATIS"] = {      Key = "ATIS",      UHF = 377.475,   VHF = 129.750, UserFreq = "UHF", Transmitter = "Incirlik_ATIS" },
  ["Ground"] = {    Key = "Ground",    UHF = 371.350,   VHF = 123.025,   UserFreq = "UHF", Transmitter = "Incirlik_Ground" },
  ["Clearance"] = { Key = "Clearance", UHF = 371.350,   VHF = 123.025, UserFreq = "UHF", Transmitter = "Incirlik_Clearance" },
  ["Tower"] = {     Key = "Ground",    UHF = 360.100,   VHF = 129.400,   UserFreq = "UHF", Transmitter = "Incirlik_Tower" },
  ["Departure"] = { Key = "Departure", UHF = 340.775,   VHF = 130.275,   UserFreq = "UHF", Transmitter = "Incirlik_Departure" },
  ["Approach"] = {  Key = "Departure", UHF = 340.775,   VHF = 130.275,   UserFreq = "UHF", Transmitter = "Incirlik_Approach" },
  ["SFA"] =      {  Key = "Departure", UHF = 246.800,   VHF = 124.95,  UserFreq = "UHF", Transmitter = "Incirlik_Approach" },
  }

AI_ATC.Procedure = "IFR"
AI_ATC.Approach.PatternAltitude = "5"

AI_ATC.TaxiWay = {
  ["Alpha"] = {Zone = TAXIWAY_ALPHA},
  ["Bravo"] = {Zone = TAXIWAY_BRAVO},
  ["Charlie"] = {Zone = TAXIWAY_CHARLIE},
  ["Delta"] = {Zone = TAXIWAY_DELTA},
  ["Echo"] = {Zone = TAXIWAY_ECHO},
  ["Golf"] = {Zone = TAXIWAY_GOLF},
  ["Hotel"] = {Zone = TAXIWAY_HOTEL},
  ["India"] = {Zone = TAXIWAY_INDIA},
  ["November"] = {Zone = TAXIWAY_NOVEMBER},
  ["Siera"] = {Zone = TAXIWAY_SIERA},
  ["Victor"] = {Zone = TAXIWAY_VICTOR},
}
  

AI_ATC_SoundFiles = {}
AI_ATC_SoundFiles.ATIS = {}
AI_ATC_SoundFiles.Ground = {}
AI_ATC_SoundFiles.Clearance = {}
AI_ATC_SoundFiles.Departure = {}
AI_ATC_SoundFiles.RangeControl = {}

AI_ATC_SoundFiles.ATIS.Numerical = {
  ["."] = { filename = "ATIS_Decimal.ogg", duration = 0.627 },
  ["0"] = { filename = "ATIS_0.ogg", duration = 0.627 },
  ["1"] = { filename = "ATIS_1.ogg", duration = 0.432 },
  ["2"] = { filename = "ATIS_2.ogg", duration = 0.444 },
  ["3"] = { filename = "ATIS_3.ogg", duration = 0.496 },
  ["4"] = { filename = "ATIS_4.ogg", duration = 0.506 },
  ["5"] = { filename = "ATIS_5.ogg", duration = 0.534 },
  ["6"] = { filename = "ATIS_6.ogg", duration = 0.582 },
  ["7"] = { filename = "ATIS_7.ogg", duration = 0.556 },
  ["8"] = { filename = "ATIS_8.ogg", duration = 0.377 },
  ["9"] = { filename = "ATIS_9.ogg", duration = 0.459 },
  ["1000"] = { filename = "ATIS_1000.ogg", duration = 0.778 },
  ["2000"] = { filename = "ATIS_2000.ogg", duration = 0.778 },
  ["3000"] = { filename = "ATIS_3000.ogg", duration = 0.756 },
  ["4000"] = { filename = "ATIS_4000.ogg", duration = 0.798 },
  ["5000"] = { filename = "ATIS_5000.ogg", duration = 0.866 },
  ["6000"] = { filename = "ATIS_6000.ogg", duration = 0.845 },
  ["7000"] = { filename = "ATIS_7000.ogg", duration = 0.920 },
  ["8000"] = { filename = "ATIS_8000.ogg", duration = 0.753 },
  ["9000"] = { filename = "ATIS_9000.ogg", duration = 0.885 },
  ["10000"] = { filename = "ATIS_10000.ogg", duration = 0.766 },
  ["11000"] = { filename = "ATIS_11000.ogg", duration = 0.964 },
  ["12000"] = { filename = "ATIS_12000.ogg", duration = 0.866 },
  ["13000"] = { filename = "ATIS_13000.ogg", duration = 1.115 },
  ["14000"] = { filename = "ATIS_14000.ogg", duration = 1.084 },
  ["15000"] = { filename = "ATIS_15000.ogg", duration = 1.051 },
  ["16000"] = { filename = "ATIS_16000.ogg", duration = 1.088 },
  ["17000"] = { filename = "ATIS_17000.ogg", duration = 1.128 },
  ["18000"] = { filename = "ATIS_18000.ogg", duration = 0.969 },
  ["19000"] = { filename = "ATIS_19000.ogg", duration = 1.173 },
  ["20000"] = { filename = "ATIS_20000.ogg", duration = 0.872 },
  ["Thousand"] = { filename = "ATIS_Thousand.ogg", duration = 0.557 },
}

AI_ATC_SoundFiles.Ground.Distance = {
  ["1"] = {filename = "1Mile.ogg", duration = 0.500},
  ["2"] = {filename = "2Miles.ogg", duration = 0.687},
  ["3"] = {filename = "3Miles.ogg", duration = 0.806},
  ["4"] = {filename = "4Miles.ogg", duration = 0.787},
  ["5"] = {filename = "5Miles.ogg", duration = 0.793},
  ["6"] = {filename = "6Miles.ogg", duration = 0.923},
  ["7"] = {filename = "7Miles.ogg", duration = 0.973},
  ["8"] = {filename = "8Miles.ogg", duration = 0.770},
  ["9"] = {filename = "9Miles.ogg", duration = 0.905},
  ["10"] = {filename = "10Miles.ogg", duration = 0.784},
  ["11"] = {filename = "11Miles.ogg", duration = 1.006},
  ["12"] = {filename = "12Miles.ogg", duration = 0.907},
  ["13"] = {filename = "13Miles.ogg", duration = 1.045},
  ["14"] = {filename = "14Miles.ogg", duration = 1.037},
  ["15"] = {filename = "15Miles.ogg", duration = 1.050},
}

AI_ATC_SoundFiles.Ground.Numerical = {
  ["."] = { filename = "Ground_Decimal.ogg", duration = 0.410 },
  ["0"] = { filename = "Ground_0.ogg", duration = 0.476 },
  ["1"] = { filename = "Ground_1.ogg", duration = 0.348 },
  ["2"] = { filename = "Ground_2.ogg", duration = 0.313 },
  ["3"] = { filename = "Ground_3.ogg", duration = 0.348 },
  ["4"] = { filename = "Ground_4.ogg", duration = 0.372 },
  ["5"] = { filename = "Ground_5.ogg", duration = 0.418 },
  ["6"] = { filename = "Ground_6.ogg", duration = 0.488 },
  ["7"] = { filename = "Ground_7.ogg", duration = 0.418 },
  ["8"] = { filename = "Ground_8.ogg", duration = 0.325 },
  ["9"] = { filename = "Ground_9.ogg", duration = 0.348 },
  ["10"] = { filename = "Ground_10.ogg", duration = 0.668 },
  ["11"] = { filename = "Ground_11.ogg", duration = 0.495 },
  ["12"] = { filename = "Ground_12.ogg", duration = 0.563 },
  ["13"] = { filename = "Ground_13.ogg", duration = 0.627 },
  ["14"] = { filename = "Ground_14.ogg", duration = 0.621 },
  ["15"] = { filename = "Ground_15.ogg", duration = 0.679 },
  ["16"] = { filename = "Ground_16.ogg", duration = 0.708 },
  ["17"] = { filename = "Ground_17.ogg", duration = 0.618 },
  ["18"] = { filename = "Ground_18.ogg", duration = 0.430 },
  ["19"] = { filename = "Ground_19.ogg", duration = 0.598 },
  ["20"] = { filename = "Ground_20.ogg", duration = 0.636 },
  ["21"] = { filename = "Ground_21.ogg", duration = 0.492 },
  ["22"] = { filename = "Ground_22.ogg", duration = 0.565 },
  ["23"] = { filename = "Ground_23.ogg", duration = 0.540 },
  ["24"] = { filename = "Ground_24.ogg", duration = 0.542 },
  ["25"] = { filename = "Ground_25.ogg", duration = 0.630 },
  ["26"] = { filename = "Ground_26.ogg", duration = 0.641 },
  ["27"] = { filename = "Ground_27.ogg", duration = 0.639 },
  ["28"] = { filename = "Ground_28.ogg", duration = 0.511 },
  ["29"] = { filename = "Ground_29.ogg", duration = 0.578 },
  ["30"] = { filename = "Ground_30.ogg", duration = 0.679 },
  ["100"] = { filename = "Ground_100.ogg", duration = 0.528 },
  ["200"] = { filename = "Ground_200.ogg", duration = 0.564 },
  ["300"] = { filename = "Ground_300.ogg", duration = 0.596 },
  ["400"] = { filename = "Ground_400.ogg", duration = 0.530 },
  ["500"] = { filename = "Ground_500.ogg", duration = 0.588 },
  ["600"] = { filename = "Ground_600.ogg", duration = 0.614 },
  ["700"] = { filename = "Ground_700.ogg", duration = 0.735 },
  ["800"] = { filename = "Ground_800.ogg", duration = 0.510 },
  ["900"] = { filename = "Ground_900.ogg", duration = 0.629 },
  ["5000"] = { filename = "5000.ogg", duration = 0.697 },
  ["6000"] = { filename = "6000.ogg", duration = 0.760 },
  ["7000"] = { filename = "7000.ogg", duration = 0.856 },
  ["8000"] = { filename = "8000.ogg", duration = 0.620 },
  ["9000"] = { filename = "9000.ogg", duration = 0.781 },
  ["10000"] = { filename = "10000.ogg", duration = 0.941 },
  ["11000"] = { filename = "11000.ogg", duration = 0.956 },
  ["12000"] = { filename = "12000.ogg", duration = 0.893 },
  ["13000"] = { filename = "13000.ogg", duration = 0.945 },
  ["14000"] = { filename = "14000.ogg", duration = 0.957 },
  ["15000"] = { filename = "15000.ogg", duration = 0.947 },
  ["16000"] = { filename = "16000.ogg", duration = 0.941 },
  ["17000"] = { filename = "17000.ogg", duration = 0.990 },
  ["18000"] = { filename = "18000.ogg", duration = 1.291 },
  ["19000"] = { filename = "19000.ogg", duration = 1.440 },
  ["20000"] = { filename = "20000.ogg", duration = 1.481 },
  ["21000"] = { filename = "21000.ogg", duration = 1.345 },
  ["22000"] = { filename = "22000.ogg", duration = 1.381 },
  ["23000"] = { filename = "23000.ogg", duration = 1.403 },
  ["24000"] = { filename = "24000.ogg", duration = 1.391 },
  ["25000"] = { filename = "25000.ogg", duration = 1.381 },
  ["26000"] = { filename = "26000.ogg", duration = 1.419 },
  ["27000"] = { filename = "27000.ogg", duration = 1.507 },
  ["28000"] = { filename = "28000.ogg", duration = 1.323 },
  ["29000"] = { filename = "29000.ogg", duration = 1.380 },
  ["30000"] = { filename = "30000.ogg", duration = 1.380 },
  ["31000"] = { filename = "31000.ogg", duration = 1.393 },
  ["32000"] = { filename = "32000.ogg", duration = 1.368 },
  ["33000"] = { filename = "33000.ogg", duration = 1.417 },
  ["34000"] = { filename = "34000.ogg", duration = 1.449 },
}
  
AI_ATC_SoundFiles.RangeControl.Numerical = {
  ["."] = { filename = "RangeControl_Decimal.ogg", duration = 0.441 },
  ["0"] = { filename = "RangeControl_0.ogg", duration = 0.499 },
  ["1"] = { filename = "RangeControl_1.ogg", duration = 0.337 },
  ["2"] = { filename = "RangeControl_2.ogg", duration = 0.313 },
  ["3"] = { filename = "RangeControl_3.ogg", duration = 0.395 },
  ["4"] = { filename = "RangeControl_4.ogg", duration = 0.406 },
  ["5"] = { filename = "RangeControl_5.ogg", duration = 0.476 },
  ["6"] = { filename = "RangeControl_6.ogg", duration = 0.592 },
  ["7"] = { filename = "RangeControl_7.ogg", duration = 0.464 },
  ["8"] = { filename = "RangeControl_8.ogg", duration = 0.395 },
  ["9"] = { filename = "RangeControl_9.ogg", duration = 0.441 },
  ["10"] = { filename = "RangeControl_10.ogg", duration = 0.395 },
  ["11"] = { filename = "RangeControl_11.ogg", duration = 0.476 },
  ["12"] = { filename = "RangeControl_12.ogg", duration = 0.476 },
  ["13"] = { filename = "RangeControl_13.ogg", duration = 0.489 },
  ["14"] = { filename = "RangeControl_14.ogg", duration = 0.521 },
  ["15"] = { filename = "RangeControl_15.ogg", duration = 0.464 },
  ["16"] = { filename = "RangeControl_16.ogg", duration = 0.605 },
  ["17"] = { filename = "RangeControl_17.ogg", duration = 0.589 },
  ["18"] = { filename = "RangeControl_18.ogg", duration = 0.480 },
  ["19"] = { filename = "RangeControl_19.ogg", duration = 0.562 },
  ["20"] = { filename = "RangeControl_20.ogg", duration = 0.380 },
  ["30"] = { filename = "RangeControl_30.ogg", duration = 0.344 },
  ["40"] = { filename = "RangeControl_40.ogg", duration = 0.352 },
  ["50"] = { filename = "RangeControl_50.ogg", duration = 0.373 },
  ["60"] = { filename = "RangeControl_60.ogg", duration = 0.512 },
  ["70"] = { filename = "RangeControl_70.ogg", duration = 0.443 },
  ["80"] = { filename = "RangeControl_80.ogg", duration = 0.342 },
  ["90"] = { filename = "RangeControl_90.ogg", duration = 0.430 },
  ["100"] = { filename = "RangeControl_100.ogg", duration = 0.508 },
  ["200"] = { filename = "RangeControl_200.ogg", duration = 0.531 },
  ["300"] = { filename = "RangeControl_300.ogg", duration = 0.582 },
  ["400"] = { filename = "RangeControl_400.ogg", duration = 0.592 },
  ["500"] = { filename = "RangeControl_500.ogg", duration = 0.573 },
  ["600"] = { filename = "RangeControl_600.ogg", duration = 0.644 },
  ["700"] = { filename = "RangeControl_700.ogg", duration = 0.689 },
  ["800"] = { filename = "RangeControl_800.ogg", duration = 0.525 },
  ["900"] = { filename = "RangeControl_900.ogg", duration = 0.697 },
  ["1000"] = { filename = "RangeControl1000.ogg", duration = 0.685 },
  ["2000"] = { filename = "RangeControl2000.ogg", duration = 0.662 },
  ["3000"] = { filename = "RangeControl3000.ogg", duration = 0.743 },
  ["4000"] = { filename = "RangeControl4000.ogg", duration = 0.708 },
  ["5000"] = { filename = "RangeControl5000.ogg", duration = 0.697 },
  ["6000"] = { filename = "RangeControl6000.ogg", duration = 0.871 },
  ["7000"] = { filename = "RangeControl7000.ogg", duration = 0.774 },
  ["8000"] = { filename = "RangeControl8000.ogg", duration = 0.691 },
  ["9000"] = { filename = "RangeControl9000.ogg", duration = 0.705 },
  ["10000"] = { filename = "RangeControl10000.ogg", duration = 0.669 },
  ["11000"] = { filename = "RangeControl11000.ogg", duration = 0.805 },
  ["12000"] = { filename = "RangeControl12000.ogg", duration = 0.739 },
  ["13000"] = { filename = "RangeControl13000.ogg", duration = 0.840 },
  ["14000"] = { filename = "RangeControl14000.ogg", duration = 0.975 },
  ["15000"] = { filename = "RangeControl15000.ogg", duration = 1.010 },
  ["16000"] = { filename = "RangeControl16000.ogg", duration = 0.891 },
  ["17000"] = { filename = "RangeControl17000.ogg", duration = 1.022 },
  ["18000"] = { filename = "RangeControl18000.ogg", duration = 0.812 },
}
  
AI_ATC_SoundFiles.Clearance.Numerical = {
  ["0"] = { filename = "Clearance_0.ogg", duration = 0.369 },
  ["1"] = { filename = "Clearance_1.ogg", duration = 0.286 },
  ["2"] = { filename = "Clearance_2.ogg", duration = 0.237 },
  ["3"] = { filename = "Clearance_3.ogg", duration = 0.264 },
  ["4"] = { filename = "Clearance_4.ogg", duration = 0.258 },
  ["5"] = { filename = "Clearance_5.ogg", duration = 0.258 },
  ["6"] = { filename = "Clearance_6.ogg", duration = 0.383 },
  ["7"] = { filename = "Clearance_7.ogg", duration = 0.435 },
  ["8"] = { filename = "Clearance_8.ogg", duration = 0.222 },
  ["9"] = { filename = "Clearance_9.ogg", duration = 0.286 },
  }
  
AI_ATC_SoundFiles.Ground.Heading = {
  ["000"] = { filename = "360.ogg", duration = 0.836 },
  ["001"] = { filename = "001.ogg", duration = 0.904 },
  ["002"] = { filename = "002.ogg", duration = 0.916 },
  ["003"] = { filename = "003.ogg", duration = 0.994 },
  ["004"] = { filename = "004.ogg", duration = 1.019 },
  ["005"] = { filename = "005.ogg", duration = 1.074 },
  ["006"] = { filename = "006.ogg", duration = 1.088 },
  ["007"] = { filename = "007.ogg", duration = 1.012 },
  ["008"] = { filename = "008.ogg", duration = 0.949 },
  ["009"] = { filename = "009.ogg", duration = 0.990 },
  ["010"] = { filename = "010.ogg", duration = 0.908 },
  ["011"] = { filename = "011.ogg", duration = 0.737 },
  ["012"] = { filename = "012.ogg", duration = 0.830 },
  ["013"] = { filename = "013.ogg", duration = 0.863 },
  ["014"] = { filename = "014.ogg", duration = 0.858 },
  ["015"] = { filename = "015.ogg", duration = 0.919 },
  ["016"] = { filename = "016.ogg", duration = 0.938 },
  ["017"] = { filename = "017.ogg", duration = 0.911 },
  ["018"] = { filename = "018.ogg", duration = 0.794 },
  ["019"] = { filename = "019.ogg", duration = 0.874 },
  ["020"] = { filename = "020.ogg", duration = 0.888 },
  ["021"] = { filename = "021.ogg", duration = 0.755 },
  ["022"] = { filename = "022.ogg", duration = 0.813 },
  ["023"] = { filename = "023.ogg", duration = 0.810 },
  ["024"] = { filename = "024.ogg", duration = 0.832 },
  ["025"] = { filename = "025.ogg", duration = 0.893 },
  ["026"] = { filename = "026.ogg", duration = 0.907 },
  ["027"] = { filename = "027.ogg", duration = 0.881 },
  ["028"] = { filename = "028.ogg", duration = 0.811 },
  ["029"] = { filename = "029.ogg", duration = 0.866 },
  ["030"] = { filename = "030.ogg", duration = 0.975 },
  ["031"] = { filename = "031.ogg", duration = 0.821 },
  ["032"] = { filename = "032.ogg", duration = 0.816 },
  ["033"] = { filename = "033.ogg", duration = 0.890 },
  ["034"] = { filename = "034.ogg", duration = 0.914 },
  ["035"] = { filename = "035.ogg", duration = 0.965 },
  ["036"] = { filename = "036.ogg", duration = 0.977 },
  ["037"] = { filename = "037.ogg", duration = 0.945 },
  ["038"] = { filename = "038.ogg", duration = 0.848 },
  ["039"] = { filename = "039.ogg", duration = 0.882 },
  ["040"] = { filename = "040.ogg", duration = 0.977 },
  ["041"] = { filename = "041.ogg", duration = 0.813 },
  ["042"] = { filename = "042.ogg", duration = 0.845 },
  ["043"] = { filename = "043.ogg", duration = 0.904 },
  ["044"] = { filename = "044.ogg", duration = 0.869 },
  ["045"] = { filename = "045.ogg", duration = 0.959 },
  ["046"] = { filename = "046.ogg", duration = 0.968 },
  ["047"] = { filename = "047.ogg", duration = 0.958 },
  ["048"] = { filename = "048.ogg", duration = 0.874 },
  ["049"] = { filename = "049.ogg", duration = 0.894 },
  ["050"] = { filename = "050.ogg", duration = 0.984 },
  ["051"] = { filename = "051.ogg", duration = 0.785 },
  ["052"] = { filename = "052.ogg", duration = 0.823 },
  ["053"] = { filename = "053.ogg", duration = 0.945 },
  ["054"] = { filename = "054.ogg", duration = 0.929 },
  ["055"] = { filename = "055.ogg", duration = 1.068 },
  ["056"] = { filename = "056.ogg", duration = 1.020 },
  ["057"] = { filename = "057.ogg", duration = 0.956 },
  ["058"] = { filename = "058.ogg", duration = 0.855 },
  ["059"] = { filename = "059.ogg", duration = 0.882 },
  ["060"] = { filename = "060.ogg", duration = 0.943 },
  ["061"] = { filename = "061.ogg", duration = 0.855 },
  ["062"] = { filename = "062.ogg", duration = 0.834 },
  ["063"] = { filename = "063.ogg", duration = 0.916 },
  ["064"] = { filename = "064.ogg", duration = 0.866 },
  ["065"] = { filename = "065.ogg", duration = 0.997 },
  ["066"] = { filename = "066.ogg", duration = 0.952 },
  ["067"] = { filename = "067.ogg", duration = 0.929 },
  ["068"] = { filename = "068.ogg", duration = 0.881 },
  ["069"] = { filename = "069.ogg", duration = 0.939 },
  ["070"] = { filename = "070.ogg", duration = 1.059 },
  ["071"] = { filename = "071.ogg", duration = 0.922 },
  ["072"] = { filename = "072.ogg", duration = 0.987 },
  ["073"] = { filename = "073.ogg", duration = 1.010 },
  ["074"] = { filename = "074.ogg", duration = 0.961 },
  ["075"] = { filename = "075.ogg", duration = 1.077 },
  ["076"] = { filename = "076.ogg", duration = 1.093 },
  ["077"] = { filename = "077.ogg", duration = 1.059 },
  ["078"] = { filename = "078.ogg", duration = 0.933 },
  ["079"] = { filename = "079.ogg", duration = 1.013 },
  ["080"] = { filename = "080.ogg", duration = 0.842 },
  ["081"] = { filename = "081.ogg", duration = 0.762 },
  ["082"] = { filename = "082.ogg", duration = 0.798 },
  ["083"] = { filename = "083.ogg", duration = 0.778 },
  ["084"] = { filename = "084.ogg", duration = 0.788 },
  ["085"] = { filename = "085.ogg", duration = 0.875 },
  ["086"] = { filename = "086.ogg", duration = 0.868 },
  ["087"] = { filename = "087.ogg", duration = 0.853 },
  ["088"] = { filename = "088.ogg", duration = 0.769 },
  ["089"] = { filename = "089.ogg", duration = 0.840 },
  ["090"] = { filename = "090.ogg", duration = 0.946 },
  ["091"] = { filename = "091.ogg", duration = 0.853 },
  ["092"] = { filename = "092.ogg", duration = 0.907 },
  ["093"] = { filename = "093.ogg", duration = 0.910 },
  ["094"] = { filename = "094.ogg", duration = 0.933 },
  ["095"] = { filename = "095.ogg", duration = 1.017 },
  ["096"] = { filename = "096.ogg", duration = 1.017 },
  ["097"] = { filename = "097.ogg", duration = 0.893 },
  ["098"] = { filename = "098.ogg", duration = 0.849 },
  ["099"] = { filename = "099.ogg", duration = 0.926 },
  ["100"] = { filename = "100.ogg", duration = 0.945 },
  ["101"] = { filename = "101.ogg", duration = 0.691 },
  ["102"] = { filename = "102.ogg", duration = 0.784 },
  ["103"] = { filename = "103.ogg", duration = 0.826 },
  ["104"] = { filename = "104.ogg", duration = 0.811 },
  ["105"] = { filename = "105.ogg", duration = 0.913 },
  ["106"] = { filename = "106.ogg", duration = 0.914 },
  ["107"] = { filename = "107.ogg", duration = 0.897 },
  ["108"] = { filename = "108.ogg", duration = 0.763 },
  ["109"] = { filename = "109.ogg", duration = 0.819 },
  ["110"] = { filename = "110.ogg", duration = 0.747 },
  ["111"] = { filename = "111.ogg", duration = 0.633 },
  ["112"] = { filename = "112.ogg", duration = 0.665 },
  ["113"] = { filename = "113.ogg", duration = 0.694 },
  ["114"] = { filename = "114.ogg", duration = 0.665 },
  ["115"] = { filename = "115.ogg", duration = 0.795 },
  ["116"] = { filename = "116.ogg", duration = 0.756 },
  ["117"] = { filename = "117.ogg", duration = 0.769 },
  ["118"] = { filename = "118.ogg", duration = 0.644 },
  ["119"] = { filename = "119.ogg", duration = 0.700 },
  ["120"] = { filename = "120.ogg", duration = 0.727 },
  ["121"] = { filename = "121.ogg", duration = 0.583 },
  ["122"] = { filename = "122.ogg", duration = 0.643 },
  ["123"] = { filename = "123.ogg", duration = 0.649 },
  ["124"] = { filename = "124.ogg", duration = 0.652 },
  ["125"] = { filename = "125.ogg", duration = 0.747 },
  ["126"] = { filename = "126.ogg", duration = 0.740 },
  ["127"] = { filename = "127.ogg", duration = 0.733 },
  ["128"] = { filename = "128.ogg", duration = 0.621 },
  ["129"] = { filename = "129.ogg", duration = 0.675 },
  ["130"] = { filename = "130.ogg", duration = 0.778 },
  ["131"] = { filename = "131.ogg", duration = 0.610 },
  ["132"] = { filename = "132.ogg", duration = 0.636 },
  ["133"] = { filename = "133.ogg", duration = 0.739 },
  ["134"] = { filename = "134.ogg", duration = 0.737 },
  ["135"] = { filename = "135.ogg", duration = 0.808 },
  ["136"] = { filename = "136.ogg", duration = 0.797 },
  ["137"] = { filename = "137.ogg", duration = 0.769 },
  ["138"] = { filename = "138.ogg", duration = 0.660 },
  ["139"] = { filename = "139.ogg", duration = 0.702 },
  ["140"] = { filename = "140.ogg", duration = 0.781 },
  ["141"] = { filename = "141.ogg", duration = 0.620 },
  ["142"] = { filename = "142.ogg", duration = 0.665 },
  ["143"] = { filename = "143.ogg", duration = 0.723 },
  ["144"] = { filename = "144.ogg", duration = 0.718 },
  ["145"] = { filename = "145.ogg", duration = 0.816 },
  ["146"] = { filename = "146.ogg", duration = 0.813 },
  ["147"] = { filename = "147.ogg", duration = 0.774 },
  ["148"] = { filename = "148.ogg", duration = 0.681 },
  ["149"] = { filename = "149.ogg", duration = 0.737 },
  ["150"] = { filename = "150.ogg", duration = 0.779 },
  ["151"] = { filename = "151.ogg", duration = 0.596 },
  ["152"] = { filename = "152.ogg", duration = 0.652 },
  ["153"] = { filename = "153.ogg", duration = 0.768 },
  ["154"] = { filename = "154.ogg", duration = 0.744 },
  ["155"] = { filename = "155.ogg", duration = 0.845 },
  ["156"] = { filename = "156.ogg", duration = 0.845 },
  ["157"] = { filename = "157.ogg", duration = 0.836 },
  ["158"] = { filename = "158.ogg", duration = 0.723 },
  ["159"] = { filename = "159.ogg", duration = 0.731 },
  ["160"] = { filename = "160.ogg", duration = 0.798 },
  ["161"] = { filename = "161.ogg", duration = 0.666 },
  ["162"] = { filename = "162.ogg", duration = 0.688 },
  ["163"] = { filename = "163.ogg", duration = 0.708 },
  ["164"] = { filename = "164.ogg", duration = 0.715 },
  ["165"] = { filename = "165.ogg", duration = 0.837 },
  ["166"] = { filename = "166.ogg", duration = 0.737 },
  ["167"] = { filename = "167.ogg", duration = 0.742 },
  ["168"] = { filename = "168.ogg", duration = 0.726 },
  ["169"] = { filename = "169.ogg", duration = 0.737 },
  ["170"] = { filename = "170.ogg", duration = 0.833 },
  ["171"] = { filename = "171.ogg", duration = 0.749 },
  ["172"] = { filename = "172.ogg", duration = 0.760 },
  ["173"] = { filename = "173.ogg", duration = 0.813 },
  ["174"] = { filename = "174.ogg", duration = 0.821 },
  ["175"] = { filename = "175.ogg", duration = 0.868 },
  ["176"] = { filename = "176.ogg", duration = 0.907 },
  ["177"] = { filename = "177.ogg", duration = 0.852 },
  ["178"] = { filename = "178.ogg", duration = 0.785 },
  ["179"] = { filename = "179.ogg", duration = 0.778 },
  ["180"] = { filename = "180.ogg", duration = 0.662 },
  ["181"] = { filename = "181.ogg", duration = 0.599 },
  ["182"] = { filename = "182.ogg", duration = 0.592 },
  ["183"] = { filename = "183.ogg", duration = 0.662 },
  ["184"] = { filename = "184.ogg", duration = 0.578 },
  ["185"] = { filename = "185.ogg", duration = 0.729 },
  ["186"] = { filename = "186.ogg", duration = 0.724 },
  ["187"] = { filename = "187.ogg", duration = 0.701 },
  ["188"] = { filename = "188.ogg", duration = 0.617 },
  ["189"] = { filename = "189.ogg", duration = 0.657 },
  ["190"] = { filename = "190.ogg", duration = 0.800 },
  ["191"] = { filename = "191.ogg", duration = 0.647 },
  ["192"] = { filename = "192.ogg", duration = 0.663 },
  ["193"] = { filename = "193.ogg", duration = 0.749 },
  ["194"] = { filename = "194.ogg", duration = 0.739 },
  ["195"] = { filename = "195.ogg", duration = 0.816 },
  ["196"] = { filename = "196.ogg", duration = 0.816 },
  ["197"] = { filename = "197.ogg", duration = 0.804 },
  ["198"] = { filename = "198.ogg", duration = 0.705 },
  ["199"] = { filename = "199.ogg", duration = 0.730 },
  ["200"] = { filename = "200.ogg", duration = 0.850 },
  ["201"] = { filename = "201.ogg", duration = 0.689 },
  ["202"] = { filename = "202.ogg", duration = 0.763 },
  ["203"] = { filename = "203.ogg", duration = 0.839 },
  ["204"] = { filename = "204.ogg", duration = 0.766 },
  ["205"] = { filename = "205.ogg", duration = 0.891 },
  ["206"] = { filename = "206.ogg", duration = 0.875 },
  ["207"] = { filename = "207.ogg", duration = 0.887 },
  ["208"] = { filename = "208.ogg", duration = 0.778 },
  ["209"] = { filename = "209.ogg", duration = 0.819 },
  ["210"] = { filename = "210.ogg", duration = 0.708 },
  ["211"] = { filename = "211.ogg", duration = 0.646 },
  ["212"] = { filename = "212.ogg", duration = 0.669 },
  ["213"] = { filename = "213.ogg", duration = 0.655 },
  ["214"] = { filename = "214.ogg", duration = 0.665 },
  ["215"] = { filename = "215.ogg", duration = 0.778 },
  ["216"] = { filename = "216.ogg", duration = 0.744 },
  ["217"] = { filename = "217.ogg", duration = 0.731 },
  ["218"] = { filename = "218.ogg", duration = 0.630 },
  ["219"] = { filename = "219.ogg", duration = 0.665 },
  ["220"] = { filename = "220.ogg", duration = 0.730 },
  ["221"] = { filename = "221.ogg", duration = 0.594 },
  ["222"] = { filename = "222.ogg", duration = 0.612 },
  ["223"] = { filename = "223.ogg", duration = 0.625 },
  ["224"] = { filename = "224.ogg", duration = 0.644 },
  ["225"] = { filename = "225.ogg", duration = 0.760 },
  ["226"] = { filename = "226.ogg", duration = 0.740 },
  ["227"] = { filename = "227.ogg", duration = 0.720 },
  ["228"] = { filename = "228.ogg", duration = 0.620 },
  ["229"] = { filename = "229.ogg", duration = 0.675 },
  ["230"] = { filename = "230.ogg", duration = 0.785 },
  ["231"] = { filename = "231.ogg", duration = 0.583 },
  ["232"] = { filename = "232.ogg", duration = 0.646 },
  ["233"] = { filename = "233.ogg", duration = 0.700 },
  ["234"] = { filename = "234.ogg", duration = 0.686 },
  ["235"] = { filename = "235.ogg", duration = 0.778 },
  ["236"] = { filename = "236.ogg", duration = 0.771 },
  ["237"] = { filename = "237.ogg", duration = 0.766 },
  ["238"] = { filename = "238.ogg", duration = 0.659 },
  ["239"] = { filename = "239.ogg", duration = 0.715 },
  ["240"] = { filename = "240.ogg", duration = 0.731 },
  ["241"] = { filename = "241.ogg", duration = 0.601 },
  ["242"] = { filename = "242.ogg", duration = 0.675 },
  ["243"] = { filename = "243.ogg", duration = 0.717 },
  ["244"] = { filename = "244.ogg", duration = 0.681 },
  ["245"] = { filename = "245.ogg", duration = 0.798 },
  ["246"] = { filename = "246.ogg", duration = 0.789 },
  ["247"] = { filename = "247.ogg", duration = 0.772 },
  ["248"] = { filename = "248.ogg", duration = 0.675 },
  ["249"] = { filename = "249.ogg", duration = 0.707 },
  ["250"] = { filename = "250.ogg", duration = 0.772 },
  ["251"] = { filename = "251.ogg", duration = 0.579 },
  ["252"] = { filename = "252.ogg", duration = 0.659 },
  ["253"] = { filename = "253.ogg", duration = 0.711 },
  ["254"] = { filename = "254.ogg", duration = 0.726 },
  ["255"] = { filename = "255.ogg", duration = 0.820 },
  ["256"] = { filename = "256.ogg", duration = 0.811 },
  ["257"] = { filename = "257.ogg", duration = 0.739 },
  ["258"] = { filename = "258.ogg", duration = 0.686 },
  ["259"] = { filename = "259.ogg", duration = 0.691 },
  ["260"] = { filename = "260.ogg", duration = 0.774 },
  ["261"] = { filename = "261.ogg", duration = 0.675 },
  ["262"] = { filename = "262.ogg", duration = 0.666 },
  ["263"] = { filename = "263.ogg", duration = 0.729 },
  ["264"] = { filename = "264.ogg", duration = 0.704 },
  ["265"] = { filename = "265.ogg", duration = 0.821 },
  ["266"] = { filename = "266.ogg", duration = 0.750 },
  ["267"] = { filename = "267.ogg", duration = 0.739 },
  ["268"] = { filename = "268.ogg", duration = 0.655 },
  ["269"] = { filename = "269.ogg", duration = 0.778 },
  ["270"] = { filename = "270.ogg", duration = 0.836 },
  ["271"] = { filename = "271.ogg", duration = 0.759 },
  ["272"] = { filename = "272.ogg", duration = 0.788 },
  ["273"] = { filename = "273.ogg", duration = 0.823 },
  ["274"] = { filename = "274.ogg", duration = 0.834 },
  ["275"] = { filename = "275.ogg", duration = 0.874 },
  ["276"] = { filename = "276.ogg", duration = 0.897 },
  ["277"] = { filename = "277.ogg", duration = 0.866 },
  ["278"] = { filename = "278.ogg", duration = 0.762 },
  ["279"] = { filename = "279.ogg", duration = 0.727 },
  ["280"] = { filename = "280.ogg", duration = 0.682 },
  ["281"] = { filename = "281.ogg", duration = 0.608 },
  ["282"] = { filename = "282.ogg", duration = 0.592 },
  ["283"] = { filename = "283.ogg", duration = 0.627 },
  ["284"] = { filename = "284.ogg", duration = 0.602 },
  ["285"] = { filename = "285.ogg", duration = 0.726 },
  ["286"] = { filename = "286.ogg", duration = 0.714 },
  ["287"] = { filename = "287.ogg", duration = 0.691 },
  ["288"] = { filename = "288.ogg", duration = 0.599 },
  ["289"] = { filename = "289.ogg", duration = 0.689 },
  ["290"] = { filename = "290.ogg", duration = 0.752 },
  ["291"] = { filename = "291.ogg", duration = 0.673 },
  ["292"] = { filename = "292.ogg", duration = 0.682 },
  ["293"] = { filename = "293.ogg", duration = 0.750 },
  ["294"] = { filename = "294.ogg", duration = 0.765 },
  ["295"] = { filename = "295.ogg", duration = 0.845 },
  ["296"] = { filename = "296.ogg", duration = 0.811 },
  ["297"] = { filename = "297.ogg", duration = 0.769 },
  ["298"] = { filename = "298.ogg", duration = 0.702 },
  ["299"] = { filename = "299.ogg", duration = 0.678 },
  ["300"] = { filename = "300.ogg", duration = 1.035 },
  ["301"] = { filename = "301.ogg", duration = 0.811 },
  ["302"] = { filename = "302.ogg", duration = 0.888 },
  ["303"] = { filename = "303.ogg", duration = 0.951 },
  ["304"] = { filename = "304.ogg", duration = 0.935 },
  ["305"] = { filename = "305.ogg", duration = 1.045 },
  ["306"] = { filename = "306.ogg", duration = 1.057 },
  ["307"] = { filename = "307.ogg", duration = 1.022 },
  ["308"] = { filename = "308.ogg", duration = 0.893 },
  ["309"] = { filename = "309.ogg", duration = 0.956 },
  ["310"] = { filename = "310.ogg", duration = 0.842 },
  ["311"] = { filename = "311.ogg", duration = 0.705 },
  ["312"] = { filename = "312.ogg", duration = 0.715 },
  ["313"] = { filename = "313.ogg", duration = 0.731 },
  ["314"] = { filename = "314.ogg", duration = 0.727 },
  ["315"] = { filename = "315.ogg", duration = 0.830 },
  ["316"] = { filename = "316.ogg", duration = 0.803 },
  ["317"] = { filename = "317.ogg", duration = 0.805 },
  ["318"] = { filename = "318.ogg", duration = 0.685 },
  ["319"] = { filename = "319.ogg", duration = 0.787 },
  ["320"] = { filename = "320.ogg", duration = 0.817 },
  ["321"] = { filename = "321.ogg", duration = 0.628 },
  ["322"] = { filename = "322.ogg", duration = 0.663 },
  ["323"] = { filename = "323.ogg", duration = 0.691 },
  ["324"] = { filename = "324.ogg", duration = 0.697 },
  ["325"] = { filename = "325.ogg", duration = 0.797 },
  ["326"] = { filename = "326.ogg", duration = 0.756 },
  ["327"] = { filename = "327.ogg", duration = 0.775 },
  ["328"] = { filename = "328.ogg", duration = 0.641 },
  ["329"] = { filename = "329.ogg", duration = 0.813 },
  ["330"] = { filename = "330.ogg", duration = 0.813 },
  ["331"] = { filename = "331.ogg", duration = 0.685 },
  ["332"] = { filename = "332.ogg", duration = 0.673 },
  ["333"] = { filename = "333.ogg", duration = 0.746 },
  ["334"] = { filename = "334.ogg", duration = 0.832 },
  ["335"] = { filename = "335.ogg", duration = 0.827 },
  ["336"] = { filename = "336.ogg", duration = 0.829 },
  ["337"] = { filename = "337.ogg", duration = 0.813 },
  ["338"] = { filename = "338.ogg", duration = 0.700 },
  ["339"] = { filename = "339.ogg", duration = 0.778 },
  ["340"] = { filename = "340.ogg", duration = 0.887 },
  ["341"] = { filename = "341.ogg", duration = 0.705 },
  ["342"] = { filename = "342.ogg", duration = 0.730 },
  ["343"] = { filename = "343.ogg", duration = 0.787 },
  ["344"] = { filename = "344.ogg", duration = 0.758 },
  ["345"] = { filename = "345.ogg", duration = 0.913 },
  ["346"] = { filename = "346.ogg", duration = 0.871 },
  ["347"] = { filename = "347.ogg", duration = 0.846 },
  ["348"] = { filename = "348.ogg", duration = 0.729 },
  ["349"] = { filename = "349.ogg", duration = 0.789 },
  ["350"] = { filename = "350.ogg", duration = 0.852 },
  ["351"] = { filename = "351.ogg", duration = 0.685 },
  ["352"] = { filename = "352.ogg", duration = 0.689 },
  ["353"] = { filename = "353.ogg", duration = 0.823 },
  ["354"] = { filename = "354.ogg", duration = 0.800 },
  ["355"] = { filename = "355.ogg", duration = 0.922 },
  ["356"] = { filename = "356.ogg", duration = 0.852 },
  ["357"] = { filename = "357.ogg", duration = 0.849 },
  ["358"] = { filename = "358.ogg", duration = 0.766 },
  ["359"] = { filename = "359.ogg", duration = 0.744 },
  ["360"] = { filename = "360.ogg", duration = 0.836 }
}

AI_ATC_SoundFiles.Departure.Heading = {
  ["000"] = { filename = "360.ogg", duration = 0.996 },
  ["001"] = { filename = "001.ogg", duration = 1.144 },
  ["002"] = { filename = "002.ogg", duration = 1.181 },
  ["003"] = { filename = "003.ogg", duration = 1.157 },
  ["004"] = { filename = "004.ogg", duration = 1.019 },
  ["005"] = { filename = "005.ogg", duration = 1.140 },
  ["006"] = { filename = "006.ogg", duration = 1.149 },
  ["007"] = { filename = "007.ogg", duration = 1.347 },
  ["008"] = { filename = "008.ogg", duration = 1.203 },
  ["009"] = { filename = "009.ogg", duration = 1.100 },
  ["010"] = { filename = "010.ogg", duration = 1.125 },
  ["011"] = { filename = "011.ogg", duration = 0.993 },
  ["012"] = { filename = "012.ogg", duration = 0.975 },
  ["013"] = { filename = "013.ogg", duration = 0.990 },
  ["014"] = { filename = "014.ogg", duration = 0.990 },
  ["015"] = { filename = "015.ogg", duration = 0.996 },
  ["016"] = { filename = "016.ogg", duration = 1.035 },
  ["017"] = { filename = "017.ogg", duration = 1.162 },
  ["018"] = { filename = "018.ogg", duration = 0.990 },
  ["019"] = { filename = "019.ogg", duration = 0.969 },
  ["020"] = { filename = "020.ogg", duration = 1.149 },
  ["021"] = { filename = "021.ogg", duration = 0.967 },
  ["022"] = { filename = "022.ogg", duration = 1.020 },
  ["023"] = { filename = "023.ogg", duration = 1.071 },
  ["024"] = { filename = "024.ogg", duration = 1.039 },
  ["025"] = { filename = "025.ogg", duration = 1.077 },
  ["026"] = { filename = "026.ogg", duration = 1.115 },
  ["027"] = { filename = "027.ogg", duration = 1.152 },
  ["028"] = { filename = "028.ogg", duration = 0.906 },
  ["029"] = { filename = "029.ogg", duration = 1.045 },
  ["030"] = { filename = "030.ogg", duration = 1.138 },
  ["031"] = { filename = "031.ogg", duration = 1.045 },
  ["032"] = { filename = "032.ogg", duration = 1.057 },
  ["033"] = { filename = "033.ogg", duration = 1.051 },
  ["034"] = { filename = "034.ogg", duration = 1.048 },
  ["035"] = { filename = "035.ogg", duration = 0.998 },
  ["036"] = { filename = "036.ogg", duration = 1.129 },
  ["037"] = { filename = "037.ogg", duration = 1.170 },
  ["038"] = { filename = "038.ogg", duration = 0.949 },
  ["039"] = { filename = "039.ogg", duration = 0.998 },
  ["040"] = { filename = "040.ogg", duration = 1.167 },
  ["041"] = { filename = "041.ogg", duration = 1.022 },
  ["042"] = { filename = "042.ogg", duration = 1.027 },
  ["043"] = { filename = "043.ogg", duration = 1.051 },
  ["044"] = { filename = "044.ogg", duration = 1.054 },
  ["045"] = { filename = "045.ogg", duration = 1.088 },
  ["046"] = { filename = "046.ogg", duration = 1.123 },
  ["047"] = { filename = "047.ogg", duration = 1.184 },
  ["048"] = { filename = "048.ogg", duration = 0.949 },
  ["049"] = { filename = "049.ogg", duration = 0.964 },
  ["050"] = { filename = "050.ogg", duration = 1.117 },
  ["051"] = { filename = "051.ogg", duration = 0.998 },
  ["052"] = { filename = "052.ogg", duration = 0.993 },
  ["053"] = { filename = "053.ogg", duration = 0.967 },
  ["054"] = { filename = "054.ogg", duration = 1.010 },
  ["055"] = { filename = "055.ogg", duration = 1.115 },
  ["056"] = { filename = "056.ogg", duration = 1.156 },
  ["057"] = { filename = "057.ogg", duration = 1.164 },
  ["058"] = { filename = "058.ogg", duration = 0.978 },
  ["059"] = { filename = "059.ogg", duration = 0.987 },
  ["060"] = { filename = "060.ogg", duration = 1.088 },
  ["061"] = { filename = "061.ogg", duration = 0.993 },
  ["062"] = { filename = "062.ogg", duration = 1.004 },
  ["063"] = { filename = "063.ogg", duration = 1.004 },
  ["064"] = { filename = "064.ogg", duration = 1.004 },
  ["065"] = { filename = "065.ogg", duration = 0.998 },
  ["066"] = { filename = "066.ogg", duration = 1.126 },
  ["067"] = { filename = "067.ogg", duration = 1.149 },
  ["068"] = { filename = "068.ogg", duration = 0.961 },
  ["069"] = { filename = "069.ogg", duration = 0.987 },
  ["070"] = { filename = "070.ogg", duration = 1.297 },
  ["071"] = { filename = "071.ogg", duration = 1.144 },
  ["072"] = { filename = "072.ogg", duration = 1.152 },
  ["073"] = { filename = "073.ogg", duration = 1.173 },
  ["074"] = { filename = "074.ogg", duration = 1.155 },
  ["075"] = { filename = "075.ogg", duration = 1.146 },
  ["076"] = { filename = "076.ogg", duration = 1.236 },
  ["077"] = { filename = "077.ogg", duration = 1.350 },
  ["078"] = { filename = "078.ogg", duration = 1.234 },
  ["079"] = { filename = "079.ogg", duration = 1.123 },
  ["080"] = { filename = "080.ogg", duration = 1.207 },
  ["081"] = { filename = "081.ogg", duration = 1.030 },
  ["082"] = { filename = "082.ogg", duration = 1.115 },
  ["083"] = { filename = "083.ogg", duration = 1.100 },
  ["084"] = { filename = "084.ogg", duration = 1.062 },
  ["085"] = { filename = "085.ogg", duration = 1.112 },
  ["086"] = { filename = "086.ogg", duration = 1.126 },
  ["087"] = { filename = "087.ogg", duration = 1.231 },
  ["088"] = { filename = "088.ogg", duration = 1.254 },
  ["089"] = { filename = "089.ogg", duration = 1.039 },
  ["090"] = { filename = "090.ogg", duration = 1.161 },
  ["091"] = { filename = "091.ogg", duration = 0.996 },
  ["092"] = { filename = "092.ogg", duration = 0.978 },
  ["093"] = { filename = "093.ogg", duration = 0.969 },
  ["094"] = { filename = "094.ogg", duration = 0.969 },
  ["095"] = { filename = "095.ogg", duration = 0.975 },
  ["096"] = { filename = "096.ogg", duration = 1.048 },
  ["097"] = { filename = "097.ogg", duration = 1.146 },
  ["098"] = { filename = "098.ogg", duration = 0.990 },
  ["099"] = { filename = "099.ogg", duration = 0.946 },
  ["100"] = { filename = "100.ogg", duration = 1.042 },
  ["101"] = { filename = "101.ogg", duration = 0.924 },
  ["102"] = { filename = "102.ogg", duration = 0.949 },
  ["103"] = { filename = "103.ogg", duration = 0.926 },
  ["104"] = { filename = "104.ogg", duration = 0.943 },
  ["105"] = { filename = "105.ogg", duration = 0.952 },
  ["106"] = { filename = "106.ogg", duration = 0.981 },
  ["107"] = { filename = "107.ogg", duration = 1.094 },
  ["108"] = { filename = "108.ogg", duration = 0.967 },
  ["109"] = { filename = "109.ogg", duration = 0.914 },
  ["110"] = { filename = "110.ogg", duration = 1.071 },
  ["111"] = { filename = "111.ogg", duration = 0.816 },
  ["112"] = { filename = "112.ogg", duration = 0.924 },
  ["113"] = { filename = "113.ogg", duration = 0.766 },
  ["114"] = { filename = "114.ogg", duration = 0.769 },
  ["115"] = { filename = "115.ogg", duration = 0.789 },
  ["116"] = { filename = "116.ogg", duration = 0.842 },
  ["117"] = { filename = "117.ogg", duration = 0.920 },
  ["118"] = { filename = "118.ogg", duration = 0.967 },
  ["119"] = { filename = "119.ogg", duration = 0.805 },
  ["120"] = { filename = "120.ogg", duration = 0.900 },
  ["121"] = { filename = "121.ogg", duration = 0.885 },
  ["122"] = { filename = "122.ogg", duration = 0.840 },
  ["123"] = { filename = "123.ogg", duration = 0.895 },
  ["124"] = { filename = "124.ogg", duration = 0.906 },
  ["125"] = { filename = "125.ogg", duration = 0.920 },
  ["126"] = { filename = "126.ogg", duration = 0.823 },
  ["127"] = { filename = "127.ogg", duration = 0.923 },
  ["128"] = { filename = "128.ogg", duration = 0.938 },
  ["129"] = { filename = "129.ogg", duration = 0.888 },
  ["130"] = { filename = "130.ogg", duration = 0.926 },
  ["131"] = { filename = "131.ogg", duration = 0.814 },
  ["132"] = { filename = "132.ogg", duration = 0.826 },
  ["133"] = { filename = "133.ogg", duration = 0.871 },
  ["134"] = { filename = "134.ogg", duration = 0.830 },
  ["135"] = { filename = "135.ogg", duration = 0.848 },
  ["136"] = { filename = "136.ogg", duration = 0.923 },
  ["137"] = { filename = "137.ogg", duration = 0.936 },
  ["138"] = { filename = "138.ogg", duration = 0.996 },
  ["139"] = { filename = "139.ogg", duration = 0.792 },
  ["140"] = { filename = "140.ogg", duration = 0.926 },
  ["141"] = { filename = "141.ogg", duration = 0.836 },
  ["142"] = { filename = "142.ogg", duration = 0.821 },
  ["143"] = { filename = "143.ogg", duration = 0.859 },
  ["144"] = { filename = "144.ogg", duration = 0.850 },
  ["145"] = { filename = "145.ogg", duration = 0.853 },
  ["146"] = { filename = "146.ogg", duration = 0.839 },
  ["147"] = { filename = "147.ogg", duration = 0.949 },
  ["148"] = { filename = "148.ogg", duration = 0.917 },
  ["149"] = { filename = "149.ogg", duration = 0.823 },
  ["150"] = { filename = "150.ogg", duration = 0.927 },
  ["151"] = { filename = "151.ogg", duration = 0.845 },
  ["152"] = { filename = "152.ogg", duration = 0.862 },
  ["153"] = { filename = "153.ogg", duration = 0.859 },
  ["154"] = { filename = "154.ogg", duration = 0.830 },
  ["155"] = { filename = "155.ogg", duration = 0.888 },
  ["156"] = { filename = "156.ogg", duration = 0.862 },
  ["157"] = { filename = "157.ogg", duration = 0.967 },
  ["158"] = { filename = "158.ogg", duration = 0.996 },
  ["159"] = { filename = "159.ogg", duration = 0.804 },
  ["160"] = { filename = "160.ogg", duration = 1.106 },
  ["161"] = { filename = "161.ogg", duration = 0.862 },
  ["162"] = { filename = "162.ogg", duration = 0.842 },
  ["163"] = { filename = "163.ogg", duration = 0.868 },
  ["164"] = { filename = "164.ogg", duration = 0.871 },
  ["165"] = { filename = "165.ogg", duration = 0.882 },
  ["166"] = { filename = "166.ogg", duration = 0.894 },
  ["167"] = { filename = "167.ogg", duration = 0.917 },
  ["168"] = { filename = "168.ogg", duration = 0.752 },
  ["169"] = { filename = "169.ogg", duration = 0.798 },
  ["170"] = { filename = "170.ogg", duration = 1.071 },
  ["171"] = { filename = "171.ogg", duration = 0.929 },
  ["172"] = { filename = "172.ogg", duration = 0.920 },
  ["173"] = { filename = "173.ogg", duration = 0.923 },
  ["174"] = { filename = "174.ogg", duration = 0.932 },
  ["175"] = { filename = "175.ogg", duration = 0.949 },
  ["176"] = { filename = "176.ogg", duration = 0.984 },
  ["177"] = { filename = "177.ogg", duration = 1.091 },
  ["178"] = { filename = "178.ogg", duration = 0.987 },
  ["179"] = { filename = "179.ogg", duration = 0.900 },
  ["180"] = { filename = "180.ogg", duration = 0.955 },
  ["181"] = { filename = "181.ogg", duration = 0.972 },
  ["182"] = { filename = "182.ogg", duration = 0.932 },
  ["183"] = { filename = "183.ogg", duration = 1.007 },
  ["184"] = { filename = "184.ogg", duration = 0.943 },
  ["185"] = { filename = "185.ogg", duration = 0.961 },
  ["186"] = { filename = "186.ogg", duration = 0.824 },
  ["187"] = { filename = "187.ogg", duration = 0.975 },
  ["188"] = { filename = "188.ogg", duration = 0.935 },
  ["189"] = { filename = "189.ogg", duration = 0.920 },
  ["190"] = { filename = "190.ogg", duration = 0.943 },
  ["191"] = { filename = "191.ogg", duration = 0.798 },
  ["192"] = { filename = "192.ogg", duration = 0.819 },
  ["193"] = { filename = "193.ogg", duration = 0.848 },
  ["194"] = { filename = "194.ogg", duration = 0.749 },
  ["195"] = { filename = "195.ogg", duration = 0.771 },
  ["196"] = { filename = "196.ogg", duration = 0.833 },
  ["197"] = { filename = "197.ogg", duration = 0.920 },
  ["198"] = { filename = "198.ogg", duration = 0.958 },
  ["199"] = { filename = "199.ogg", duration = 1.254 },
  ["200"] = { filename = "200.ogg", duration = 1.062 },
  ["201"] = { filename = "201.ogg", duration = 0.967 },
  ["202"] = { filename = "202.ogg", duration = 1.178 },
  ["203"] = { filename = "203.ogg", duration = 0.958 },
  ["204"] = { filename = "204.ogg", duration = 0.964 },
  ["205"] = { filename = "205.ogg", duration = 0.964 },
  ["206"] = { filename = "206.ogg", duration = 0.993 },
  ["207"] = { filename = "207.ogg", duration = 1.138 },
  ["208"] = { filename = "208.ogg", duration = 1.231 },
  ["209"] = { filename = "209.ogg", duration = 0.961 },
  ["210"] = { filename = "210.ogg", duration = 1.057 },
  ["211"] = { filename = "211.ogg", duration = 0.789 },
  ["212"] = { filename = "212.ogg", duration = 0.816 },
  ["213"] = { filename = "213.ogg", duration = 0.819 },
  ["214"] = { filename = "214.ogg", duration = 0.810 },
  ["215"] = { filename = "215.ogg", duration = 0.830 },
  ["216"] = { filename = "216.ogg", duration = 0.894 },
  ["217"] = { filename = "217.ogg", duration = 0.911 },
  ["218"] = { filename = "218.ogg", duration = 0.993 },
  ["219"] = { filename = "219.ogg", duration = 0.871 },
  ["220"] = { filename = "220.ogg", duration = 1.138 },
  ["221"] = { filename = "221.ogg", duration = 0.906 },
  ["222"] = { filename = "222.ogg", duration = 0.981 },
  ["223"] = { filename = "223.ogg", duration = 0.845 },
  ["224"] = { filename = "224.ogg", duration = 0.882 },
  ["225"] = { filename = "225.ogg", duration = 0.914 },
  ["226"] = { filename = "226.ogg", duration = 0.940 },
  ["227"] = { filename = "227.ogg", duration = 0.940 },
  ["228"] = { filename = "228.ogg", duration = 0.911 },
  ["229"] = { filename = "229.ogg", duration = 0.882 },
  ["230"] = { filename = "230.ogg", duration = 0.920 },
  ["231"] = { filename = "231.ogg", duration = 0.940 },
  ["232"] = { filename = "232.ogg", duration = 0.926 },
  ["233"] = { filename = "233.ogg", duration = 0.943 },
  ["234"] = { filename = "234.ogg", duration = 0.917 },
  ["235"] = { filename = "235.ogg", duration = 0.949 },
  ["236"] = { filename = "236.ogg", duration = 0.956 },
  ["237"] = { filename = "237.ogg", duration = 0.964 },
  ["238"] = { filename = "238.ogg", duration = 0.938 },
  ["239"] = { filename = "239.ogg", duration = 0.917 },
  ["240"] = { filename = "240.ogg", duration = 0.932 },
  ["241"] = { filename = "241.ogg", duration = 0.940 },
  ["242"] = { filename = "242.ogg", duration = 0.958 },
  ["243"] = { filename = "243.ogg", duration = 0.958 },
  ["244"] = { filename = "244.ogg", duration = 0.961 },
  ["245"] = { filename = "245.ogg", duration = 0.943 },
  ["246"] = { filename = "246.ogg", duration = 0.917 },
  ["247"] = { filename = "247.ogg", duration = 0.949 },
  ["248"] = { filename = "248.ogg", duration = 0.969 },
  ["249"] = { filename = "249.ogg", duration = 0.914 },
  ["250"] = { filename = "250.ogg", duration = 0.914 },
  ["251"] = { filename = "251.ogg", duration = 0.964 },
  ["252"] = { filename = "252.ogg", duration = 0.955 },
  ["253"] = { filename = "253.ogg", duration = 0.943 },
  ["254"] = { filename = "254.ogg", duration = 0.926 },
  ["255"] = { filename = "255.ogg", duration = 0.938 },
  ["256"] = { filename = "256.ogg", duration = 0.901 },
  ["257"] = { filename = "257.ogg", duration = 0.967 },
  ["258"] = { filename = "258.ogg", duration = 0.958 },
  ["259"] = { filename = "259.ogg", duration = 0.964 },
  ["260"] = { filename = "260.ogg", duration = 0.888 },
  ["261"] = { filename = "261.ogg", duration = 0.888 },
  ["262"] = { filename = "262.ogg", duration = 0.856 },
  ["263"] = { filename = "263.ogg", duration = 0.911 },
  ["264"] = { filename = "264.ogg", duration = 0.865 },
  ["265"] = { filename = "265.ogg", duration = 0.877 },
  ["266"] = { filename = "266.ogg", duration = 0.888 },
  ["267"] = { filename = "267.ogg", duration = 0.943 },
  ["268"] = { filename = "268.ogg", duration = 0.935 },
  ["269"] = { filename = "269.ogg", duration = 0.792 },
  ["270"] = { filename = "270.ogg", duration = 1.083 },
  ["271"] = { filename = "271.ogg", duration = 0.981 },
  ["272"] = { filename = "272.ogg", duration = 0.961 },
  ["273"] = { filename = "273.ogg", duration = 0.998 },
  ["274"] = { filename = "274.ogg", duration = 0.952 },
  ["275"] = { filename = "275.ogg", duration = 0.975 },
  ["276"] = { filename = "276.ogg", duration = 1.013 },
  ["277"] = { filename = "277.ogg", duration = 1.112 },
  ["278"] = { filename = "278.ogg", duration = 1.004 },
  ["279"] = { filename = "279.ogg", duration = 0.935 },
  ["280"] = { filename = "280.ogg", duration = 1.071 },
  ["281"] = { filename = "281.ogg", duration = 0.923 },
  ["282"] = { filename = "282.ogg", duration = 0.914 },
  ["283"] = { filename = "283.ogg", duration = 0.969 },
  ["284"] = { filename = "284.ogg", duration = 0.935 },
  ["285"] = { filename = "285.ogg", duration = 0.961 },
  ["286"] = { filename = "286.ogg", duration = 0.958 },
  ["287"] = { filename = "287.ogg", duration = 0.993 },
  ["288"] = { filename = "288.ogg", duration = 0.990 },
  ["289"] = { filename = "289.ogg", duration = 0.943 },
  ["290"] = { filename = "290.ogg", duration = 0.917 },
  ["291"] = { filename = "291.ogg", duration = 0.920 },
  ["292"] = { filename = "292.ogg", duration = 0.914 },
  ["293"] = { filename = "293.ogg", duration = 0.958 },
  ["294"] = { filename = "294.ogg", duration = 0.932 },
  ["295"] = { filename = "295.ogg", duration = 0.938 },
  ["296"] = { filename = "296.ogg", duration = 0.834 },
  ["297"] = { filename = "297.ogg", duration = 0.946 },
  ["298"] = { filename = "298.ogg", duration = 0.969 },
  ["299"] = { filename = "299.ogg", duration = 0.888 },
  ["300"] = { filename = "300.ogg", duration = 1.039 },
  ["301"] = { filename = "301.ogg", duration = 0.961 },
  ["302"] = { filename = "302.ogg", duration = 0.955 },
  ["303"] = { filename = "303.ogg", duration = 0.935 },
  ["304"] = { filename = "304.ogg", duration = 0.920 },
  ["305"] = { filename = "305.ogg", duration = 0.969 },
  ["306"] = { filename = "306.ogg", duration = 0.984 },
  ["307"] = { filename = "307.ogg", duration = 1.083 },
  ["308"] = { filename = "308.ogg", duration = 0.961 },
  ["309"] = { filename = "309.ogg", duration = 0.932 },
  ["310"] = { filename = "310.ogg", duration = 0.938 },
  ["311"] = { filename = "311.ogg", duration = 0.819 },
  ["312"] = { filename = "312.ogg", duration = 0.839 },
  ["313"] = { filename = "313.ogg", duration = 0.791 },
  ["314"] = { filename = "314.ogg", duration = 0.792 },
  ["315"] = { filename = "315.ogg", duration = 0.861 },
  ["316"] = { filename = "316.ogg", duration = 0.839 },
  ["317"] = { filename = "317.ogg", duration = 0.946 },
  ["318"] = { filename = "318.ogg", duration = 0.961 },
  ["319"] = { filename = "319.ogg", duration = 0.785 },
  ["320"] = { filename = "320.ogg", duration = 0.938 },
  ["321"] = { filename = "321.ogg", duration = 0.961 },
  ["322"] = { filename = "322.ogg", duration = 0.830 },
  ["323"] = { filename = "323.ogg", duration = 0.980 },
  ["324"] = { filename = "324.ogg", duration = 0.906 },
  ["325"] = { filename = "325.ogg", duration = 0.943 },
  ["326"] = { filename = "326.ogg", duration = 0.839 },
  ["327"] = { filename = "327.ogg", duration = 0.775 },
  ["328"] = { filename = "328.ogg", duration = 0.940 },
  ["329"] = { filename = "329.ogg", duration = 0.911 },
  ["330"] = { filename = "330.ogg", duration = 0.967 },
  ["331"] = { filename = "331.ogg", duration = 0.871 },
  ["332"] = { filename = "332.ogg", duration = 0.958 },
  ["333"] = { filename = "333.ogg", duration = 0.911 },
  ["334"] = { filename = "334.ogg", duration = 0.887 },
  ["335"] = { filename = "335.ogg", duration = 0.877 },
  ["336"] = { filename = "336.ogg", duration = 0.972 },
  ["337"] = { filename = "337.ogg", duration = 0.943 },
  ["338"] = { filename = "338.ogg", duration = 0.961 },
  ["339"] = { filename = "339.ogg", duration = 0.795 },
  ["340"] = { filename = "340.ogg", duration = 0.932 },
  ["341"] = { filename = "341.ogg", duration = 0.891 },
  ["342"] = { filename = "342.ogg", duration = 0.877 },
  ["343"] = { filename = "343.ogg", duration = 0.894 },
  ["344"] = { filename = "344.ogg", duration = 0.792 },
  ["345"] = { filename = "345.ogg", duration = 0.972 },
  ["346"] = { filename = "346.ogg", duration = 0.856 },
  ["347"] = { filename = "347.ogg", duration = 0.938 },
  ["348"] = { filename = "348.ogg", duration = 0.967 },
  ["349"] = { filename = "349.ogg", duration = 0.789 },
  ["350"] = { filename = "350.ogg", duration = 0.943 },
  ["351"] = { filename = "351.ogg", duration = 0.821 },
  ["352"] = { filename = "352.ogg", duration = 0.984 },
  ["353"] = { filename = "353.ogg", duration = 0.819 },
  ["354"] = { filename = "354.ogg", duration = 0.787 },
  ["355"] = { filename = "355.ogg", duration = 0.882 },
  ["356"] = { filename = "356.ogg", duration = 0.961 },
  ["357"] = { filename = "357.ogg", duration = 0.969 },
  ["358"] = { filename = "358.ogg", duration = 0.975 },
  ["359"] = { filename = "359.ogg", duration = 0.836 },
  ["360"] = { filename = "360.ogg", duration = 0.996 }
}

AI_ATC_SoundFiles.RangeControl.Heading = {
  ["000"] = { filename = "360.ogg", duration = 1.007 },
  ["001"] = { filename = "001.ogg", duration = 0.882 },
  ["002"] = { filename = "002.ogg", duration = 0.969 },
  ["003"] = { filename = "003.ogg", duration = 0.998 },
  ["004"] = { filename = "004.ogg", duration = 1.009 },
  ["005"] = { filename = "005.ogg", duration = 1.010 },
  ["006"] = { filename = "006.ogg", duration = 1.132 },
  ["007"] = { filename = "007.ogg", duration = 1.023 },
  ["008"] = { filename = "008.ogg", duration = 0.907 },
  ["009"] = { filename = "009.ogg", duration = 0.884 },
  ["010"] = { filename = "010.ogg", duration = 0.978 },
  ["011"] = { filename = "011.ogg", duration = 0.781 },
  ["012"] = { filename = "012.ogg", duration = 0.859 },
  ["013"] = { filename = "013.ogg", duration = 0.903 },
  ["014"] = { filename = "014.ogg", duration = 0.904 },
  ["015"] = { filename = "015.ogg", duration = 0.919 },
  ["016"] = { filename = "016.ogg", duration = 1.033 },
  ["017"] = { filename = "017.ogg", duration = 0.891 },
  ["018"] = { filename = "018.ogg", duration = 0.781 },
  ["019"] = { filename = "019.ogg", duration = 0.789 },
  ["020"] = { filename = "020.ogg", duration = 0.982 },
  ["021"] = { filename = "021.ogg", duration = 0.845 },
  ["022"] = { filename = "022.ogg", duration = 0.846 },
  ["023"] = { filename = "023.ogg", duration = 0.888 },
  ["024"] = { filename = "024.ogg", duration = 0.906 },
  ["025"] = { filename = "025.ogg", duration = 0.924 },
  ["026"] = { filename = "026.ogg", duration = 1.030 },
  ["027"] = { filename = "027.ogg", duration = 0.916 },
  ["028"] = { filename = "028.ogg", duration = 0.820 },
  ["029"] = { filename = "029.ogg", duration = 0.877 },
  ["030"] = { filename = "030.ogg", duration = 1.001 },
  ["031"] = { filename = "031.ogg", duration = 0.865 },
  ["032"] = { filename = "032.ogg", duration = 0.882 },
  ["033"] = { filename = "033.ogg", duration = 0.901 },
  ["034"] = { filename = "034.ogg", duration = 0.924 },
  ["035"] = { filename = "035.ogg", duration = 0.932 },
  ["036"] = { filename = "036.ogg", duration = 1.051 },
  ["037"] = { filename = "037.ogg", duration = 0.951 },
  ["038"] = { filename = "038.ogg", duration = 0.833 },
  ["039"] = { filename = "039.ogg", duration = 0.911 },
  ["040"] = { filename = "040.ogg", duration = 1.023 },
  ["041"] = { filename = "041.ogg", duration = 0.871 },
  ["042"] = { filename = "042.ogg", duration = 0.901 },
  ["043"] = { filename = "043.ogg", duration = 0.932 },
  ["044"] = { filename = "044.ogg", duration = 0.932 },
  ["045"] = { filename = "045.ogg", duration = 0.946 },
  ["046"] = { filename = "046.ogg", duration = 1.084 },
  ["047"] = { filename = "047.ogg", duration = 0.949 },
  ["048"] = { filename = "048.ogg", duration = 0.824 },
  ["049"] = { filename = "049.ogg", duration = 0.848 },
  ["050"] = { filename = "050.ogg", duration = 1.027 },
  ["051"] = { filename = "051.ogg", duration = 0.842 },
  ["052"] = { filename = "052.ogg", duration = 0.927 },
  ["053"] = { filename = "053.ogg", duration = 0.940 },
  ["054"] = { filename = "054.ogg", duration = 0.958 },
  ["055"] = { filename = "055.ogg", duration = 0.968 },
  ["056"] = { filename = "056.ogg", duration = 1.097 },
  ["057"] = { filename = "057.ogg", duration = 0.910 },
  ["058"] = { filename = "058.ogg", duration = 0.856 },
  ["059"] = { filename = "059.ogg", duration = 0.865 },
  ["060"] = { filename = "060.ogg", duration = 1.014 },
  ["061"] = { filename = "061.ogg", duration = 0.882 },
  ["062"] = { filename = "062.ogg", duration = 0.916 },
  ["063"] = { filename = "063.ogg", duration = 0.926 },
  ["064"] = { filename = "064.ogg", duration = 0.968 },
  ["065"] = { filename = "065.ogg", duration = 0.971 },
  ["066"] = { filename = "066.ogg", duration = 1.065 },
  ["067"] = { filename = "067.ogg", duration = 0.958 },
  ["068"] = { filename = "068.ogg", duration = 0.906 },
  ["069"] = { filename = "069.ogg", duration = 0.891 },
  ["070"] = { filename = "070.ogg", duration = 1.077 },
  ["071"] = { filename = "071.ogg", duration = 0.845 },
  ["072"] = { filename = "072.ogg", duration = 0.929 },
  ["073"] = { filename = "073.ogg", duration = 0.984 },
  ["074"] = { filename = "074.ogg", duration = 0.996 },
  ["075"] = { filename = "075.ogg", duration = 1.022 },
  ["076"] = { filename = "076.ogg", duration = 1.133 },
  ["077"] = { filename = "077.ogg", duration = 1.026 },
  ["078"] = { filename = "078.ogg", duration = 0.856 },
  ["079"] = { filename = "079.ogg", duration = 0.884 },
  ["080"] = { filename = "080.ogg", duration = 0.943 },
  ["081"] = { filename = "081.ogg", duration = 0.971 },
  ["082"] = { filename = "082.ogg", duration = 0.839 },
  ["083"] = { filename = "083.ogg", duration = 0.866 },
  ["084"] = { filename = "084.ogg", duration = 0.895 },
  ["085"] = { filename = "085.ogg", duration = 0.900 },
  ["086"] = { filename = "086.ogg", duration = 1.019 },
  ["087"] = { filename = "087.ogg", duration = 0.878 },
  ["088"] = { filename = "088.ogg", duration = 0.787 },
  ["089"] = { filename = "089.ogg", duration = 0.800 },
  ["090"] = { filename = "090.ogg", duration = 0.990 },
  ["091"] = { filename = "091.ogg", duration = 0.848 },
  ["092"] = { filename = "092.ogg", duration = 0.868 },
  ["093"] = { filename = "093.ogg", duration = 0.861 },
  ["094"] = { filename = "094.ogg", duration = 0.917 },
  ["095"] = { filename = "095.ogg", duration = 0.927 },
  ["096"] = { filename = "096.ogg", duration = 1.051 },
  ["097"] = { filename = "097.ogg", duration = 0.887 },
  ["098"] = { filename = "098.ogg", duration = 0.788 },
  ["099"] = { filename = "099.ogg", duration = 0.810 },
  ["100"] = { filename = "100.ogg", duration = 1.068 },
  ["101"] = { filename = "101.ogg", duration = 0.775 },
  ["102"] = { filename = "102.ogg", duration = 0.768 },
  ["103"] = { filename = "103.ogg", duration = 0.874 },
  ["104"] = { filename = "104.ogg", duration = 0.930 },
  ["105"] = { filename = "105.ogg", duration = 0.932 },
  ["106"] = { filename = "106.ogg", duration = 1.059 },
  ["107"] = { filename = "107.ogg", duration = 0.897 },
  ["108"] = { filename = "108.ogg", duration = 0.810 },
  ["109"] = { filename = "109.ogg", duration = 0.820 },
  ["110"] = { filename = "110.ogg", duration = 1.081 },
  ["111"] = { filename = "111.ogg", duration = 0.807 },
  ["112"] = { filename = "112.ogg", duration = 0.895 },
  ["113"] = { filename = "113.ogg", duration = 0.935 },
  ["114"] = { filename = "114.ogg", duration = 0.962 },
  ["115"] = { filename = "115.ogg", duration = 0.964 },
  ["116"] = { filename = "116.ogg", duration = 1.115 },
  ["117"] = { filename = "117.ogg", duration = 0.887 },
  ["118"] = { filename = "118.ogg", duration = 0.794 },
  ["119"] = { filename = "119.ogg", duration = 0.814 },
  ["120"] = { filename = "120.ogg", duration = 1.074 },
  ["121"] = { filename = "121.ogg", duration = 0.774 },
  ["122"] = { filename = "122.ogg", duration = 0.882 },
  ["123"] = { filename = "123.ogg", duration = 0.945 },
  ["124"] = { filename = "124.ogg", duration = 0.938 },
  ["125"] = { filename = "125.ogg", duration = 0.977 },
  ["126"] = { filename = "126.ogg", duration = 1.104 },
  ["127"] = { filename = "127.ogg", duration = 0.910 },
  ["128"] = { filename = "128.ogg", duration = 0.846 },
  ["129"] = { filename = "129.ogg", duration = 0.836 },
  ["130"] = { filename = "130.ogg", duration = 0.988 },
  ["131"] = { filename = "131.ogg", duration = 0.760 },
  ["132"] = { filename = "132.ogg", duration = 0.859 },
  ["133"] = { filename = "133.ogg", duration = 0.897 },
  ["134"] = { filename = "134.ogg", duration = 0.908 },
  ["135"] = { filename = "135.ogg", duration = 0.907 },
  ["136"] = { filename = "136.ogg", duration = 1.026 },
  ["137"] = { filename = "137.ogg", duration = 0.840 },
  ["138"] = { filename = "138.ogg", duration = 0.797 },
  ["139"] = { filename = "139.ogg", duration = 0.791 },
  ["140"] = { filename = "140.ogg", duration = 1.019 },
  ["141"] = { filename = "141.ogg", duration = 0.756 },
  ["142"] = { filename = "142.ogg", duration = 0.874 },
  ["143"] = { filename = "143.ogg", duration = 0.888 },
  ["144"] = { filename = "144.ogg", duration = 0.910 },
  ["145"] = { filename = "145.ogg", duration = 0.924 },
  ["146"] = { filename = "146.ogg", duration = 1.049 },
  ["147"] = { filename = "147.ogg", duration = 0.855 },
  ["148"] = { filename = "148.ogg", duration = 0.794 },
  ["149"] = { filename = "149.ogg", duration = 0.803 },
  ["150"] = { filename = "150.ogg", duration = 1.017 },
  ["151"] = { filename = "151.ogg", duration = 0.820 },
  ["152"] = { filename = "152.ogg", duration = 0.911 },
  ["153"] = { filename = "153.ogg", duration = 0.919 },
  ["154"] = { filename = "154.ogg", duration = 0.959 },
  ["155"] = { filename = "155.ogg", duration = 0.968 },
  ["156"] = { filename = "156.ogg", duration = 1.090 },
  ["157"] = { filename = "157.ogg", duration = 0.874 },
  ["158"] = { filename = "158.ogg", duration = 0.833 },
  ["159"] = { filename = "159.ogg", duration = 0.853 },
  ["160"] = { filename = "160.ogg", duration = 1.012 },
  ["161"] = { filename = "161.ogg", duration = 0.821 },
  ["162"] = { filename = "162.ogg", duration = 0.923 },
  ["163"] = { filename = "163.ogg", duration = 0.898 },
  ["164"] = { filename = "164.ogg", duration = 0.936 },
  ["165"] = { filename = "165.ogg", duration = 0.929 },
  ["166"] = { filename = "166.ogg", duration = 1.038 },
  ["167"] = { filename = "167.ogg", duration = 0.832 },
  ["168"] = { filename = "168.ogg", duration = 0.833 },
  ["169"] = { filename = "169.ogg", duration = 0.834 },
  ["170"] = { filename = "170.ogg", duration = 1.048 },
  ["171"] = { filename = "171.ogg", duration = 0.833 },
  ["172"] = { filename = "172.ogg", duration = 0.938 },
  ["173"] = { filename = "173.ogg", duration = 0.987 },
  ["174"] = { filename = "174.ogg", duration = 0.991 },
  ["175"] = { filename = "175.ogg", duration = 0.993 },
  ["176"] = { filename = "176.ogg", duration = 1.138 },
  ["177"] = { filename = "177.ogg", duration = 0.952 },
  ["178"] = { filename = "178.ogg", duration = 0.833 },
  ["179"] = { filename = "179.ogg", duration = 0.853 },
  ["180"] = { filename = "180.ogg", duration = 0.878 },
  ["181"] = { filename = "181.ogg", duration = 0.644 },
  ["182"] = { filename = "182.ogg", duration = 0.755 },
  ["183"] = { filename = "183.ogg", duration = 0.798 },
  ["184"] = { filename = "184.ogg", duration = 0.804 },
  ["185"] = { filename = "185.ogg", duration = 0.819 },
  ["186"] = { filename = "186.ogg", duration = 0.933 },
  ["187"] = { filename = "187.ogg", duration = 0.756 },
  ["188"] = { filename = "188.ogg", duration = 0.689 },
  ["189"] = { filename = "189.ogg", duration = 0.701 },
  ["190"] = { filename = "190.ogg", duration = 0.967 },
  ["191"] = { filename = "191.ogg", duration = 0.726 },
  ["192"] = { filename = "192.ogg", duration = 0.840 },
  ["193"] = { filename = "193.ogg", duration = 0.856 },
  ["194"] = { filename = "194.ogg", duration = 0.894 },
  ["195"] = { filename = "195.ogg", duration = 0.901 },
  ["196"] = { filename = "196.ogg", duration = 1.020 },
  ["197"] = { filename = "197.ogg", duration = 0.819 },
  ["198"] = { filename = "198.ogg", duration = 0.755 },
  ["199"] = { filename = "199.ogg", duration = 0.756 },
  ["200"] = { filename = "200.ogg", duration = 0.994 },
  ["201"] = { filename = "201.ogg", duration = 0.850 },
  ["202"] = { filename = "202.ogg", duration = 0.908 },
  ["203"] = { filename = "203.ogg", duration = 0.942 },
  ["204"] = { filename = "204.ogg", duration = 0.951 },
  ["205"] = { filename = "205.ogg", duration = 0.948 },
  ["206"] = { filename = "206.ogg", duration = 1.086 },
  ["207"] = { filename = "207.ogg", duration = 0.942 },
  ["208"] = { filename = "208.ogg", duration = 0.836 },
  ["209"] = { filename = "209.ogg", duration = 0.820 },
  ["210"] = { filename = "210.ogg", duration = 0.907 },
  ["211"] = { filename = "211.ogg", duration = 0.733 },
  ["212"] = { filename = "212.ogg", duration = 0.774 },
  ["213"] = { filename = "213.ogg", duration = 0.816 },
  ["214"] = { filename = "214.ogg", duration = 0.833 },
  ["215"] = { filename = "215.ogg", duration = 0.837 },
  ["216"] = { filename = "216.ogg", duration = 0.962 },
  ["217"] = { filename = "217.ogg", duration = 0.842 },
  ["218"] = { filename = "218.ogg", duration = 0.686 },
  ["219"] = { filename = "219.ogg", duration = 0.708 },
  ["220"] = { filename = "220.ogg", duration = 0.895 },
  ["221"] = { filename = "221.ogg", duration = 0.753 },
  ["222"] = { filename = "222.ogg", duration = 0.772 },
  ["223"] = { filename = "223.ogg", duration = 0.803 },
  ["224"] = { filename = "224.ogg", duration = 0.817 },
  ["225"] = { filename = "225.ogg", duration = 0.820 },
  ["226"] = { filename = "226.ogg", duration = 0.959 },
  ["227"] = { filename = "227.ogg", duration = 0.803 },
  ["228"] = { filename = "228.ogg", duration = 0.715 },
  ["229"] = { filename = "229.ogg", duration = 0.704 },
  ["230"] = { filename = "230.ogg", duration = 0.900 },
  ["231"] = { filename = "231.ogg", duration = 0.778 },
  ["232"] = { filename = "232.ogg", duration = 0.792 },
  ["233"] = { filename = "233.ogg", duration = 0.813 },
  ["234"] = { filename = "234.ogg", duration = 0.821 },
  ["235"] = { filename = "235.ogg", duration = 0.846 },
  ["236"] = { filename = "236.ogg", duration = 0.958 },
  ["237"] = { filename = "237.ogg", duration = 0.840 },
  ["238"] = { filename = "238.ogg", duration = 0.723 },
  ["239"] = { filename = "239.ogg", duration = 0.727 },
  ["240"] = { filename = "240.ogg", duration = 0.924 },
  ["241"] = { filename = "241.ogg", duration = 0.785 },
  ["242"] = { filename = "242.ogg", duration = 0.792 },
  ["243"] = { filename = "243.ogg", duration = 0.837 },
  ["244"] = { filename = "244.ogg", duration = 0.850 },
  ["245"] = { filename = "245.ogg", duration = 0.848 },
  ["246"] = { filename = "246.ogg", duration = 0.985 },
  ["247"] = { filename = "247.ogg", duration = 0.842 },
  ["248"] = { filename = "248.ogg", duration = 0.731 },
  ["249"] = { filename = "249.ogg", duration = 0.733 },
  ["250"] = { filename = "250.ogg", duration = 0.942 },
  ["251"] = { filename = "251.ogg", duration = 0.730 },
  ["252"] = { filename = "252.ogg", duration = 0.820 },
  ["253"] = { filename = "253.ogg", duration = 0.859 },
  ["254"] = { filename = "254.ogg", duration = 0.869 },
  ["255"] = { filename = "255.ogg", duration = 0.872 },
  ["256"] = { filename = "256.ogg", duration = 0.998 },
  ["257"] = { filename = "257.ogg", duration = 0.863 },
  ["258"] = { filename = "258.ogg", duration = 0.824 },
  ["259"] = { filename = "259.ogg", duration = 0.781 },
  ["260"] = { filename = "260.ogg", duration = 0.940 },
  ["261"] = { filename = "261.ogg", duration = 0.819 },
  ["262"] = { filename = "262.ogg", duration = 0.846 },
  ["263"] = { filename = "263.ogg", duration = 0.846 },
  ["264"] = { filename = "264.ogg", duration = 0.881 },
  ["265"] = { filename = "265.ogg", duration = 0.878 },
  ["266"] = { filename = "266.ogg", duration = 0.990 },
  ["267"] = { filename = "267.ogg", duration = 0.813 },
  ["268"] = { filename = "268.ogg", duration = 0.803 },
  ["269"] = { filename = "269.ogg", duration = 0.797 },
  ["270"] = { filename = "270.ogg", duration = 0.988 },
  ["271"] = { filename = "271.ogg", duration = 0.760 },
  ["272"] = { filename = "272.ogg", duration = 0.863 },
  ["273"] = { filename = "273.ogg", duration = 0.907 },
  ["274"] = { filename = "274.ogg", duration = 0.913 },
  ["275"] = { filename = "275.ogg", duration = 0.935 },
  ["276"] = { filename = "276.ogg", duration = 1.067 },
  ["277"] = { filename = "277.ogg", duration = 0.946 },
  ["278"] = { filename = "278.ogg", duration = 0.779 },
  ["279"] = { filename = "279.ogg", duration = 0.794 },
  ["280"] = { filename = "280.ogg", duration = 0.859 },
  ["281"] = { filename = "281.ogg", duration = 0.734 },
  ["282"] = { filename = "282.ogg", duration = 0.753 },
  ["283"] = { filename = "283.ogg", duration = 0.791 },
  ["284"] = { filename = "284.ogg", duration = 0.826 },
  ["285"] = { filename = "285.ogg", duration = 0.816 },
  ["286"] = { filename = "286.ogg", duration = 0.955 },
  ["287"] = { filename = "287.ogg", duration = 0.816 },
  ["288"] = { filename = "288.ogg", duration = 0.707 },
  ["289"] = { filename = "289.ogg", duration = 0.715 },
  ["290"] = { filename = "290.ogg", duration = 0.914 },
  ["291"] = { filename = "291.ogg", duration = 0.702 },
  ["292"] = { filename = "292.ogg", duration = 0.781 },
  ["293"] = { filename = "293.ogg", duration = 0.816 },
  ["294"] = { filename = "294.ogg", duration = 0.839 },
  ["295"] = { filename = "295.ogg", duration = 0.862 },
  ["296"] = { filename = "296.ogg", duration = 0.981 },
  ["297"] = { filename = "297.ogg", duration = 0.839 },
  ["298"] = { filename = "298.ogg", duration = 0.705 },
  ["299"] = { filename = "299.ogg", duration = 0.723 },
  ["300"] = { filename = "300.ogg", duration = 1.155 },
  ["301"] = { filename = "301.ogg", duration = 0.871 },
  ["302"] = { filename = "302.ogg", duration = 0.942 },
  ["303"] = { filename = "303.ogg", duration = 0.980 },
  ["304"] = { filename = "304.ogg", duration = 0.991 },
  ["305"] = { filename = "305.ogg", duration = 1.029 },
  ["306"] = { filename = "306.ogg", duration = 1.139 },
  ["307"] = { filename = "307.ogg", duration = 1.025 },
  ["308"] = { filename = "308.ogg", duration = 0.885 },
  ["309"] = { filename = "309.ogg", duration = 0.895 },
  ["310"] = { filename = "310.ogg", duration = 0.965 },
  ["311"] = { filename = "311.ogg", duration = 0.760 },
  ["312"] = { filename = "312.ogg", duration = 0.843 },
  ["313"] = { filename = "313.ogg", duration = 0.885 },
  ["314"] = { filename = "314.ogg", duration = 0.881 },
  ["315"] = { filename = "315.ogg", duration = 0.917 },
  ["316"] = { filename = "316.ogg", duration = 1.030 },
  ["317"] = { filename = "317.ogg", duration = 0.878 },
  ["318"] = { filename = "318.ogg", duration = 0.762 },
  ["319"] = { filename = "319.ogg", duration = 0.779 },
  ["320"] = { filename = "320.ogg", duration = 0.959 },
  ["321"] = { filename = "321.ogg", duration = 0.760 },
  ["322"] = { filename = "322.ogg", duration = 0.826 },
  ["323"] = { filename = "323.ogg", duration = 0.866 },
  ["324"] = { filename = "324.ogg", duration = 0.868 },
  ["325"] = { filename = "325.ogg", duration = 0.908 },
  ["326"] = { filename = "326.ogg", duration = 1.022 },
  ["327"] = { filename = "327.ogg", duration = 0.871 },
  ["328"] = { filename = "328.ogg", duration = 0.784 },
  ["329"] = { filename = "329.ogg", duration = 0.789 },
  ["330"] = { filename = "330.ogg", duration = 0.956 },
  ["331"] = { filename = "331.ogg", duration = 0.827 },
  ["332"] = { filename = "332.ogg", duration = 0.861 },
  ["333"] = { filename = "333.ogg", duration = 0.882 },
  ["334"] = { filename = "334.ogg", duration = 0.901 },
  ["335"] = { filename = "335.ogg", duration = 0.900 },
  ["336"] = { filename = "336.ogg", duration = 1.032 },
  ["337"] = { filename = "337.ogg", duration = 0.890 },
  ["338"] = { filename = "338.ogg", duration = 0.782 },
  ["339"] = { filename = "339.ogg", duration = 0.803 },
  ["340"] = { filename = "340.ogg", duration = 1.004 },
  ["341"] = { filename = "341.ogg", duration = 0.872 },
  ["342"] = { filename = "342.ogg", duration = 0.874 },
  ["343"] = { filename = "343.ogg", duration = 0.903 },
  ["344"] = { filename = "344.ogg", duration = 0.923 },
  ["345"] = { filename = "345.ogg", duration = 0.930 },
  ["346"] = { filename = "346.ogg", duration = 1.064 },
  ["347"] = { filename = "347.ogg", duration = 0.919 },
  ["348"] = { filename = "348.ogg", duration = 0.797 },
  ["349"] = { filename = "349.ogg", duration = 0.816 },
  ["350"] = { filename = "350.ogg", duration = 1.012 },
  ["351"] = { filename = "351.ogg", duration = 0.807 },
  ["352"] = { filename = "352.ogg", duration = 0.901 },
  ["353"] = { filename = "353.ogg", duration = 0.894 },
  ["354"] = { filename = "354.ogg", duration = 0.943 },
  ["355"] = { filename = "355.ogg", duration = 0.984 },
  ["356"] = { filename = "356.ogg", duration = 1.071 },
  ["357"] = { filename = "357.ogg", duration = 0.881 },
  ["358"] = { filename = "358.ogg", duration = 0.827 },
  ["359"] = { filename = "359.ogg", duration = 0.849 },
  ["360"] = { filename = "360.ogg", duration = 1.007 },
}

AI_ATC_SoundFiles.Ground.FlightLevel = {
  ["05"]  = { filename = "05.ogg",  duration = 0.595 },
  ["10"]  = { filename = "10.ogg",  duration = 0.669 },
  ["15"]  = { filename = "15.ogg",  duration = 1.159 },
  ["20"]  = { filename = "20.ogg",  duration = 0.652 },
  ["25"]  = { filename = "25.ogg",  duration = 1.221 },
  ["30"]  = { filename = "30.ogg",  duration = 0.691 },
  ["35"]  = { filename = "35.ogg",  duration = 1.271 },
  ["40"]  = { filename = "40.ogg",  duration = 0.665 },
  ["45"]  = { filename = "45.ogg",  duration = 1.292 },
  ["50"]  = { filename = "50.ogg",  duration = 0.689 },
  ["55"]  = { filename = "55.ogg",  duration = 1.301 },
  ["60"]  = { filename = "60.ogg",  duration = 0.724 },
  ["65"]  = { filename = "65.ogg",  duration = 1.330 },
  ["70"]  = { filename = "70.ogg",  duration = 0.817 },
  ["75"]  = { filename = "75.ogg",  duration = 1.417 },
  ["80"]  = { filename = "80.ogg",  duration = 0.597 },
  ["85"]  = { filename = "85.ogg",  duration = 1.189 },
  ["90"]  = { filename = "90.ogg",  duration = 0.745 },
  ["95"]  = { filename = "95.ogg",  duration = 1.337 },
  ["100"] = { filename = "100.ogg", duration = 0.654 },
}

AI_ATC_SoundFiles.Departure.FlightLevel = {
  ["10"] = { filename = "10.ogg", duration = 0.865 },
  ["20"] = { filename = "20.ogg", duration = 0.795 },
  ["30"] = { filename = "30.ogg", duration = 0.848 },
  ["40"] = { filename = "40.ogg", duration = 0.871 },
  ["50"] = { filename = "50.ogg", duration = 0.917 },
  ["60"] = { filename = "60.ogg", duration = 0.850 },
  ["70"] = { filename = "70.ogg", duration = 0.940 },
  ["80"] = { filename = "80.ogg", duration = 0.862 },
  ["90"] = { filename = "90.ogg", duration = 0.959 },
  ["100"] = { filename = "100.ogg", duration = 1.196 },
  ["110"] = { filename = "110.ogg", duration = 0.987 },
  ["120"] = { filename = "120.ogg", duration = 0.952 },
  ["125"] = { filename = "125.ogg", duration = 0.952 },
  ["130"] = { filename = "130.ogg", duration = 1.039 },
  ["140"] = { filename = "140.ogg", duration = 1.027 },
  ["150"] = { filename = "150.ogg", duration = 1.028 },
  ["160"] = { filename = "160.ogg", duration = 1.022 },
  ["170"] = { filename = "170.ogg", duration = 1.173 },
  ["180"] = { filename = "180.ogg", duration = 1.052 },
  ["190"] = { filename = "190.ogg", duration = 0.936 },
  ["200"] = { filename = "200.ogg", duration = 1.103 },
  ["210"] = { filename = "210.ogg", duration = 0.913 },
  ["220"] = { filename = "220.ogg", duration = 1.025 },
  ["230"] = { filename = "230.ogg", duration = 0.951 },
  ["240"] = { filename = "240.ogg", duration = 0.949 },
  ["250"] = { filename = "250.ogg", duration = 0.942 },
  ["260"] = { filename = "260.ogg", duration = 0.901 },
  ["270"] = { filename = "270.ogg", duration = 1.100 },
  ["280"] = { filename = "280.ogg", duration = 0.984 },
  ["290"] = { filename = "290.ogg", duration = 0.934 },
  ["300"] = { filename = "300.ogg", duration = 1.062 },
}

AI_ATC_SoundFiles.RangeControl.FlightLevel = {
  ["10"] = { filename = "10.ogg", duration = 0.720 },
  ["20"] = { filename = "20.ogg", duration = 0.639 },
  ["30"] = { filename = "30.ogg", duration = 0.705 },
  ["40"] = { filename = "40.ogg", duration = 0.871 },
  ["50"] = { filename = "50.ogg", duration = 0.740 },
  ["60"] = { filename = "60.ogg", duration = 0.784 },
  ["70"] = { filename = "70.ogg", duration = 0.859 },
  ["80"] = { filename = "80.ogg", duration = 0.688 },
  ["90"] = { filename = "90.ogg", duration = 0.737 },
  ["100"] = { filename = "100.ogg", duration = 1.010 },
  ["110"] = { filename = "110.ogg", duration = 0.987 },
  ["120"] = { filename = "120.ogg", duration = 0.952 },
  ["125"] = { filename = "120.ogg", duration = 0.952 },
  ["130"] = { filename = "130.ogg", duration = 0.952 },
  ["140"] = { filename = "140.ogg", duration = 0.975 },
  ["150"] = { filename = "150.ogg", duration = 0.952 },
  ["160"] = { filename = "160.ogg", duration = 0.906 },
  ["170"] = { filename = "170.ogg", duration = 1.080 },
  ["180"] = { filename = "180.ogg", duration = 0.792 },
  ["190"] = { filename = "190.ogg", duration = 0.906 },
  ["200"] = { filename = "200.ogg", duration = 0.935 },
  ["210"] = { filename = "210.ogg", duration = 0.836 },
  ["220"] = { filename = "220.ogg", duration = 0.807 },
  ["230"] = { filename = "230.ogg", duration = 0.839 },
  ["240"] = { filename = "240.ogg", duration = 0.874 },
  ["250"] = { filename = "250.ogg", duration = 0.894 },
  ["260"] = { filename = "260.ogg", duration = 0.871 },
  ["270"] = { filename = "270.ogg", duration = 0.906 },
  ["280"] = { filename = "280.ogg", duration = 0.795 },
  ["290"] = { filename = "290.ogg", duration = 0.888 },
  ["300"] = { filename = "300.ogg", duration = 0.996 },
}

AI_ATC_SoundFiles.Departure.Numerical = {
  ["."] = { filename = "Departure_Decimal.ogg", duration = 0.477 },
  ["0"] = { filename = "Departure_0.ogg", duration = 0.511 },
  ["1"] = { filename = "Departure_1.ogg", duration = 0.325 },
  ["2"] = { filename = "Departure_2.ogg", duration = 0.365 },
  ["3"] = { filename = "Departure_3.ogg", duration = 0.337 },
  ["4"] = { filename = "Departure_4.ogg", duration = 0.372 },
  ["5"] = { filename = "Departure_5.ogg", duration = 0.391 },
  ["6"] = { filename = "Departure_6.ogg", duration = 0.453},
  ["7"] = { filename = "Departure_7.ogg", duration = 0.511 },
  ["8"] = { filename = "Departure_8.ogg", duration = 0.414 },
  ["9"] = { filename = "Departure_9.ogg", duration = 0.430 },
  ["10"] = { filename = "Departure_10.ogg", duration = 0.441 },
  ["11"] = { filename = "Departure_11.ogg", duration = 0.592 },
  ["12"] = { filename = "Departure_12.ogg", duration = 0.430 },
  ["100"] = { filename = "Departure_100.ogg", duration = 0.636 },
  ["200"] = { filename = "Departure_200.ogg", duration = 0.737 },
  ["300"] = { filename = "Departure_300.ogg", duration = 0.639 },
  ["400"] = { filename = "Departure_400.ogg", duration = 0.598 },
  ["500"] = { filename = "Departure_500.ogg", duration = 0.615 },
  ["600"] = { filename = "Departure_600.ogg", duration = 0.668 },
  ["700"] = { filename = "Departure_700.ogg", duration = 0.821 },
  ["800"] = { filename = "Departure_800.ogg", duration = 0.717 },
  ["900"] = { filename = "Departure_900.ogg", duration = 0.647 },
  ["Thousand"] = { filename = "Departure_Thousand.ogg", duration = 0.595 },
}

AI_ATC_SoundFiles.Ground.CallsignsNumerical = {
  ["01"] = {filename = "ZeroOne.ogg", duration = 0.533},
  ["02"] = {filename = "ZeroTwo.ogg", duration = 0.636},
  ["03"] = {filename = "ZeroThree.ogg", duration = 0.692},
  ["04"] = {filename = "ZeroFour.ogg", duration = 0.610},
  ["11"] = {filename = "OneOne.ogg", duration = 0.495},
  ["12"] = {filename = "OneTwo.ogg", duration = 0.563},
  ["13"] = {filename = "OneThree.ogg", duration = 0.627},
  ["14"] = {filename = "OneFour.ogg", duration = 0.621},
  ["21"] = {filename = "TwoOne.ogg", duration = 0.492},
  ["22"] = {filename = "TwoTwo.ogg", duration = 0.565},
  ["23"] = {filename = "TwoThree.ogg", duration = 0.540},
  ["24"] = {filename = "TwoFour.ogg", duration = 0.542},
  ["31"] = {filename = "ThreeOne.ogg", duration = 0.543},
  ["32"] = {filename = "ThreeTwo.ogg", duration = 0.549},
  ["33"] = {filename = "ThreeThree.ogg", duration = 0.580},
  ["34"] = {filename = "ThreeFour.ogg", duration = 0.598},
  ["41"] = {filename = "FourOne.ogg", duration = 0.499},
  ["42"] = {filename = "FourTwo.ogg", duration = 0.549},
  ["43"] = {filename = "FourThree.ogg", duration = 0.607},
  ["44"] = {filename = "FourFour.ogg", duration = 0.578},
  ["51"] = {filename = "FiveOne.ogg", duration = 0.446},
  ["52"] = {filename = "FiveTwo.ogg", duration = 0.580},
  ["53"] = {filename = "FiveThree.ogg", duration = 0.659},
  ["54"] = {filename = "FiveFour.ogg", duration = 0.665},
  ["61"] = {filename = "SixOne.ogg", duration = 0.656},
  ["62"] = {filename = "SixTwo.ogg", duration = 0.615},
  ["63"] = {filename = "SixThree.ogg", duration = 0.688},
  ["64"] = {filename = "SixFour.ogg", duration = 0.700},
  ["71"] = {filename = "SevenOne.ogg", duration = 0.711},
  ["72"] = {filename = "SevenTwo.ogg", duration = 0.752},
  ["73"] = {filename = "SevenThree.ogg", duration = 0.810},
  ["74"] = {filename = "SevenFour.ogg", duration = 0.758},
  ["81"] = {filename = "EightOne.ogg", duration = 0.493},
  ["82"] = {filename = "EightTwo.ogg", duration = 0.540},
  ["83"] = {filename = "EightThree.ogg", duration = 0.560},
  ["84"] = {filename = "EightFour.ogg", duration = 0.505},
  ["91"] = {filename = "NineOne.ogg", duration = 0.589},
  ["92"] = {filename = "NineTwo.ogg", duration = 0.659},
  ["93"] = {filename = "NineThree.ogg", duration = 0.705},
  ["94"] = {filename = "NineFour.ogg", duration = 0.734},
  ["1 flight"] = {filename = "OneFlight.ogg", duration = 0.755},
  ["2 flight"] = {filename = "TwoFlight.ogg", duration = 0.659},
  ["3 flight"] = {filename = "ThreeFlight.ogg", duration = 0.746},
  ["4 flight"] = {filename = "FourFlight.ogg", duration = 0.698},
  ["5 flight"] = {filename = "FiveFlight.ogg", duration = 0.807},
  ["6 flight"] = {filename = "SixFlight.ogg", duration = 0.789},
  ["7 flight"] = {filename = "SevenFlight.ogg", duration = 0.940},
  ["8 flight"] = {filename = "EightFlight.ogg", duration = 0.662},
  ["9 flight"] = {filename = "NineFlight.ogg", duration = 0.776},
}

AI_ATC_SoundFiles.Clearance.CallsignsNumerical = {
  ["01"] = {filename = "ZeroOne.ogg", duration = 0.615},
  ["02"] = {filename = "ZeroTwo.ogg", duration = 0.700},
  ["03"] = {filename = "ZeroThree.ogg", duration = 0.731},
  ["04"] = {filename = "ZeroFour.ogg", duration = 0.711},
  ["11"] = {filename = "OneOne.ogg", duration = 0.480},
  ["12"] = {filename = "OneTwo.ogg", duration = 0.604},
  ["13"] = {filename = "OneThree.ogg", duration = 0.731},
  ["14"] = {filename = "OneFour.ogg", duration = 0.755},
  ["21"] = {filename = "TwoOne.ogg", duration = 0.755},
  ["22"] = {filename = "TwoTwo.ogg", duration = 0.602},
  ["23"] = {filename = "TwoThree.ogg", duration = 0.685},
  ["24"] = {filename = "TwoFour.ogg", duration = 0.792},
  ["31"] = {filename = "ThreeOne.ogg", duration = 0.657},
  ["32"] = {filename = "ThreeTwo.ogg", duration = 0.615},
  ["33"] = {filename = "ThreeThree.ogg", duration = 0.673},
  ["34"] = {filename = "ThreeFour.ogg", duration = 0.792},
  ["41"] = {filename = "FourOne.ogg", duration = 0.784},
  ["42"] = {filename = "FourTwo.ogg", duration = 0.647},
  ["43"] = {filename = "FourThree.ogg", duration = 0.627},
  ["44"] = {filename = "FourFour.ogg", duration = 0.801},
  ["51"] = {filename = "FiveOne.ogg", duration = 0.644},
  ["52"] = {filename = "FiveTwo.ogg", duration = 0.784},
  ["53"] = {filename = "FiveThree.ogg", duration = 0.662},
  ["54"] = {filename = "FiveFour.ogg", duration = 0.708},
  ["61"] = {filename = "SixOne.ogg", duration = 0.717},
  ["62"] = {filename = "SixTwo.ogg", duration = 0.695},
  ["63"] = {filename = "SixThree.ogg", duration = 0.729},
  ["64"] = {filename = "SixFour.ogg", duration = 0.628},
  ["71"] = {filename = "SevenOne.ogg", duration = 0.756},
  ["72"] = {filename = "SevenTwo.ogg", duration = 0.827},
  ["73"] = {filename = "SevenThree.ogg", duration = 0.720},
  ["74"] = {filename = "SevenFour.ogg", duration = 0.731},
  ["81"] = {filename = "EightOne.ogg", duration = 0.653},
  ["82"] = {filename = "EightTwo.ogg", duration = 0.737},
  ["83"] = {filename = "EightThree.ogg", duration = 0.604},
  ["84"] = {filename = "EightFour.ogg", duration = 0.708},
  ["91"] = {filename = "NineOne.ogg", duration = 0.662},
  ["92"] = {filename = "NineTwo.ogg", duration = 0.653},
  ["93"] = {filename = "NineThree.ogg", duration = 0.778},
  ["94"] = {filename = "NineFour.ogg", duration = 0.845},
  ["1 flight"] = {filename = "OneFlight.ogg", duration = 0.592},
  ["2 flight"] = {filename = "TwoFlight.ogg", duration = 0.580},
  ["3 flight"] = {filename = "ThreeFlight.ogg", duration = 0.615},
  ["4 flight"] = {filename = "FourFlight.ogg", duration = 0.621},
  ["5 flight"] = {filename = "FiveFlight.ogg", duration = 0.595},
  ["6 flight"] = {filename = "SixFlight.ogg", duration = 0.592},
  ["7 flight"] = {filename = "SevenFlight.ogg", duration = 0.641},
  ["8 flight"] = {filename = "EightFlight.ogg", duration = 0.589},
  ["9 flight"] = {filename = "NineFlight.ogg", duration = 0.633},
}
    
AI_ATC_SoundFiles.Departure.CallsignsNumerical = {
  ["01"] = {filename = "ZeroOne.ogg", duration = 0.630},
  ["02"] = {filename = "ZeroTwo.ogg", duration = 0.720},
  ["03"] = {filename = "ZeroThree.ogg", duration = 0.656},
  ["04"] = {filename = "ZeroFour.ogg", duration = 0.705},
  ["11"] = {filename = "OneOne.ogg", duration = 0.612},
  ["12"] = {filename = "OneTwo.ogg", duration = 0.578},
  ["13"] = {filename = "OneThree.ogg", duration = 0.580},
  ["14"] = {filename = "OneFour.ogg", duration = 0.610},
  ["21"] = {filename = "TwoOne.ogg", duration = 0.639},
  ["22"] = {filename = "TwoTwo.ogg", duration = 0.598},
  ["23"] = {filename = "TwoThree.ogg", duration = 0.615},
  ["24"] = {filename = "TwoFour.ogg", duration = 0.592},
  ["31"] = {filename = "ThreeOne.ogg", duration = 0.634},
  ["32"] = {filename = "ThreeTwo.ogg", duration = 0.624},
  ["33"] = {filename = "ThreeThree.ogg", duration = 0.633},
  ["34"] = {filename = "ThreeFour.ogg", duration = 0.612},
  ["41"] = {filename = "FourOne.ogg", duration = 0.641},
  ["42"] = {filename = "FourTwo.ogg", duration = 0.636},
  ["43"] = {filename = "FourThree.ogg", duration = 0.668},
  ["44"] = {filename = "FourFour.ogg", duration = 0.653},
  ["51"] = {filename = "FiveOne.ogg", duration = 0.668},
  ["52"] = {filename = "FiveTwo.ogg", duration = 0.679},
  ["53"] = {filename = "FiveThree.ogg", duration = 0.662},
  ["54"] = {filename = "FiveFour.ogg", duration = 0.641},
  ["61"] = {filename = "SixOne.ogg", duration = 0.708},
  ["62"] = {filename = "SixTwo.ogg", duration = 0.668},
  ["63"] = {filename = "SixThree.ogg", duration = 0.691},
  ["64"] = {filename = "SixFour.ogg", duration = 0.679},
  ["71"] = {filename = "SevenOne.ogg", duration = 0.830},
  ["72"] = {filename = "SevenTwo.ogg", duration = 0.842},
  ["73"] = {filename = "SevenThree.ogg", duration = 0.850},
  ["74"] = {filename = "SevenFour.ogg", duration = 0.833},
  ["81"] = {filename = "EightOne.ogg", duration = 0.618},
  ["82"] = {filename = "EightTwo.ogg", duration = 0.607},
  ["83"] = {filename = "EightThree.ogg", duration = 0.630},
  ["84"] = {filename = "EightFour.ogg", duration = 0.612},
  ["91"] = {filename = "NineOne.ogg", duration = 0.634},
  ["92"] = {filename = "NineTwo.ogg", duration = 0.639},
  ["93"] = {filename = "NineThree.ogg", duration = 0.645},
  ["94"] = {filename = "NineFour.ogg", duration = 0.679},
  ["1 flight"] = {filename = "OneFlight.ogg", duration = 0.670},
  ["2 flight"] = {filename = "TwoFlight.ogg", duration = 0.601},
  ["3 flight"] = {filename = "ThreeFlight.ogg", duration = 0.707},
  ["4 flight"] = {filename = "FourFlight.ogg", duration = 0.778},
  ["5 flight"] = {filename = "FiveFlight.ogg", duration = 0.734},
  ["6 flight"] = {filename = "SixFlight.ogg", duration = 0.668},
  ["7 flight"] = {filename = "SevenFlight.ogg", duration = 0.807},
  ["8 flight"] = {filename = "EightFlight.ogg", duration = 0.623},
  ["9 flight"] = {filename = "NineFlight.ogg", duration = 0.714},
}

AI_ATC_SoundFiles.RangeControl.CallsignsNumerical = {
  ["01"] = {filename = "ZeroOne.ogg", duration = 0.696},
  ["02"] = {filename = "ZeroTwo.ogg", duration = 0.706},
  ["03"] = {filename = "ZeroThree.ogg", duration = 0.721},
  ["04"] = {filename = "ZeroFour.ogg", duration = 0.716},
  ["11"] = {filename = "OneOne.ogg", duration = 0.417},
  ["12"] = {filename = "OneTwo.ogg", duration = 0.560},
  ["13"] = {filename = "OneThree.ogg", duration = 0.569},
  ["14"] = {filename = "OneFour.ogg", duration = 0.566},
  ["21"] = {filename = "TwoOne.ogg", duration = 0.524},
  ["22"] = {filename = "TwoTwo.ogg", duration = 0.528},
  ["23"] = {filename = "TwoThree.ogg", duration = 0.567},
  ["24"] = {filename = "TwoFour.ogg", duration = 0.586},
  ["31"] = {filename = "ThreeOne.ogg", duration = 0.586},
  ["32"] = {filename = "ThreeTwo.ogg", duration = 0.586},
  ["33"] = {filename = "ThreeThree.ogg", duration = 0.615},
  ["34"] = {filename = "ThreeFour.ogg", duration = 0.640},
  ["41"] = {filename = "FourOne.ogg", duration = 0.580},
  ["42"] = {filename = "FourTwo.ogg", duration = 0.580},
  ["43"] = {filename = "FourThree.ogg", duration = 0.650},
  ["44"] = {filename = "FourFour.ogg", duration = 0.679},
  ["51"] = {filename = "FiveOne.ogg", duration = 0.562},
  ["52"] = {filename = "FiveTwo.ogg", duration = 0.652},
  ["53"] = {filename = "FiveThree.ogg", duration = 0.681},
  ["54"] = {filename = "FiveFour.ogg", duration = 0.718},
  ["61"] = {filename = "SixOne.ogg", duration = 0.618},
  ["62"] = {filename = "SixTwo.ogg", duration = 0.647},
  ["63"] = {filename = "SixThree.ogg", duration = 0.657},
  ["64"] = {filename = "SixFour.ogg", duration = 0.685},
  ["71"] = {filename = "SevenOne.ogg", duration = 0.594},
  ["72"] = {filename = "SevenTwo.ogg", duration = 0.686},
  ["73"] = {filename = "SevenThree.ogg", duration = 0.726},
  ["74"] = {filename = "SevenFour.ogg", duration = 0.749},
  ["81"] = {filename = "EightOne.ogg", duration = 0.504},
  ["82"] = {filename = "EightTwo.ogg", duration = 0.525},
  ["83"] = {filename = "EightThree.ogg", duration = 0.567},
  ["84"] = {filename = "EightFour.ogg", duration = 0.594},
  ["91"] = {filename = "NineOne.ogg", duration = 0.530},
  ["92"] = {filename = "NineTwo.ogg", duration = 0.599},
  ["93"] = {filename = "NineThree.ogg", duration = 0.653},
  ["94"] = {filename = "NineFour.ogg", duration = 0.682},
}

AI_ATC_SoundFiles.Ground.Oclock = {
  ["1"] = { filename = "OneOclock.ogg", duration = 0.613 },
  ["2"] = { filename = "TwoOclock.ogg", duration = 0.658 },
  ["3"] = { filename = "ThreeOclock.ogg", duration = 0.673 },
  ["4"] = { filename = "FourOclock.ogg", duration = 0.631 },
  ["5"] = { filename = "FiveOclock.ogg", duration = 0.684 },
  ["6"] = { filename = "SixOclock.ogg", duration = 0.764},
  ["7"] = { filename = "SevenOclock.ogg", duration = 0.835 },
  ["8"] = { filename = "EightOclock.ogg", duration = 0.599 },
  ["9"] = { filename = "NineOclock.ogg", duration = 0.754 },
  ["10"] = { filename = "TenOclock.ogg", duration = 0.655 },
  ["11"] = { filename = "ElevenOclock.ogg", duration = 0.885 },
  ["12"] = { filename = "TwelveOclock.ogg", duration = 0.733 },
}
  
AI_ATC_SoundFiles.Departure.Oclock = {
  ["1"] = { filename = "OneOclock.ogg", duration = 0.720 },
  ["2"] = { filename = "TwoOclock.ogg", duration = 0.766 },
  ["3"] = { filename = "ThreeOclock.ogg", duration = 0.813 },
  ["4"] = { filename = "FourOclock.ogg", duration = 0.813 },
  ["5"] = { filename = "FiveOclock.ogg", duration = 0.813 },
  ["6"] = { filename = "SixOclock.ogg", duration = 0.813},
  ["7"] = { filename = "SevenOclock.ogg", duration = 0.752 },
  ["8"] = { filename = "EightOclock.ogg", duration = 0.743 },
  ["9"] = { filename = "NineOclock.ogg", duration = 0.801 },
  ["10"] = { filename = "TenOclock.ogg", duration = 0.755 },
  ["11"] = { filename = "ElevenOclock.ogg", duration = 0.906 },
  ["12"] = { filename = "TwelveOclock.ogg", duration = 0.731 },
  }

AI_ATC_SoundFiles.ATIS.Direction = {
  ["L"] = {filename = "Left.ogg", duration = 0.467},
  ["R"] = {filename = "Right.ogg", duration = 0.430}
  }

AI_ATC_SoundFiles.Ground.Direction = {
  ["L"] = {filename = "Left.ogg", duration = 0.400},
  ["R"] = {filename = "Right.ogg", duration = 0.430}
  }
  
AI_ATC_SoundFiles.Departure.Direction = {
  ["L"] = {filename = "Left.ogg", duration = 0.418},
  ["R"] = {filename = "Right.ogg", duration = 0.347}
  }
  
AI_ATC_SoundFiles.Departure.Cardinal = {
  ["North"] = {filename = "NorthBound.ogg", duration = 0.650},
  ["North-East"] = {filename = "NorthEastBound.ogg", duration = 0.848},
  ["East"] = {filename = "EastBound.ogg", duration = 0.662},
  ["South-East"] = {filename = "SouthEastBound.ogg", duration = 0.871},
  ["South"] = {filename = "SouthBound.ogg", duration = 0.778},
  ["South-West"] = {filename = "SouthWestBound.ogg", duration = 0.858},
  ["West"] = {filename = "WestBound.ogg", duration = 0.630},
  ["North-West"] = {filename = "NorthWestBound.ogg", duration = 0.859},
  }
AI_ATC_SoundFiles.Departure.Cardinal2 = {
  ["North"] = {filename = "North.ogg", duration = 0.833},
  ["North-East"] = {filename = "NorthEast.ogg", duration = 1.042},
  ["East"] = {filename = "East.ogg", duration = 0.662},
  ["South-East"] = {filename = "SouthEast.ogg", duration = 1.100},
  ["South"] = {filename = "South.ogg", duration = 0.848},
  ["South-West"] = {filename = "SouthWest.ogg", duration = 1.135},
  ["West"] = {filename = "West.ogg", duration = 0.855},
  ["North-West"] = {filename = "NorthWest.ogg", duration = 1.126},
  }
  
AI_ATC_SoundFiles.Ground.Runway = {
  ["05"] = {filename = "05.ogg", duration = 0.789},
  ["23"] = {filename = "23.ogg", duration = 0.569},
  }
  
AI_ATC_SoundFiles.Departure.Runway = {
  ["05"] = {filename = "05.ogg", duration = 0.882},
  ["23"] = {filename = "23.ogg", duration = 0.639},
  }

AI_ATC_SoundFiles.Departure.NavPoint = {
  ["CUROS"] = {filename = "CUROS.ogg", duration = 0.569},
  ["GOMSE"] = {filename = "GOMSE.ogg", duration = 0.592},
  ["GURLE"] = {filename = "GURLE.ogg", duration = 0.406},
  ["JAKUP"] = {filename = "JAKUP.ogg", duration = 0.557},
  ["OSLUP"] = {filename = "OSLUP.ogg", duration = 0.557},
  ["TOSIE"] = {filename = "TOSIE.ogg", duration = 0.592},
  ["OGBON"] = {filename = "OGBON.ogg", duration = 0.697},
  ["JAYBY"] = {filename = "JAYBY.ogg", duration = 0.582},
  ["WUNSO"] = {filename = "WUNSO.ogg", duration = 0.580},
  ["EMLET"] = {filename = "EMLET.ogg", duration = 0.517},
  ["GECEG"] = {filename = "GECEG.ogg", duration = 0.511},
  ["HABIM"] = {filename = "HABIM.ogg", duration = 0.627},
  ["WAGIB"] = {filename = "WAGIB.ogg", duration = 0.534},
  ["Alfa"]= {filename = "PointAlpha.ogg", duration = 0.929},
  ["Charlie"]= {filename = "PointCharlie.ogg", duration = 0.813},
  ["Delta"]= {filename = "PointDelta.ogg", duration = 0.824},
  ["Echo"]= {filename = "PointEcho.ogg", duration = 0.952},
  ["EAGLE"]= {filename = "Eagle.ogg", duration = 0.604},
  ["FALCON"]= {filename = "Falcon.ogg", duration = 0.520},
  ["TIGER"]= {filename = "Tiger.ogg", duration = 0.511},
  ["Downwind"] = {filename = "Downwind.ogg", duration = 1.080},
  ["Base"] = {filename = "Base.ogg", duration = 0.964},
  ["Akrotiri"] = {filename = "Akrotiri.ogg", duration = 1.033},
  ["Incirlik"] = {filename = "Incirlik.ogg", duration = 0.801},
  ["Adana Sakirpasa"] = {filename = "Adana Sakirpasa.ogg", duration = 0.685},
  ["Gaziantep"] = {filename = "Gaziantep.ogg", duration = 0.964},
  ["Gazipasa"] = {filename = "Gazipasa.ogg", duration = 0.987},
  ["Sanliurfa"] = {filename = "Sanliurfa.ogg", duration = 0.871},
  ["Hatay"] = {filename = "Hatay.ogg", duration = 0.604},
  ["Gecitkale"] = {filename = "Gecitkale.ogg", duration = 0.836},
  ["Ercan"] = {filename = "Ercan.ogg", duration = 0.662},
  ["Larnaca"] = {filename = "Larnaca.ogg", duration = 0.813},
  ["Larnaca"] = {filename = "Larnaca.ogg", duration = 0.813},
  ["Paphos"] = {filename = "Paphos.ogg", duration = 0.604},
  ["Beirut-Rafic Hariri"] = {filename = "Beirut-Rafic Hariri.ogg", duration = 1.556},
  ["Ramat David"] = {filename = "Ramat David.ogg", duration = 0.836},
  ["Ben Gurion"] = {filename = "Ben Gurion.ogg", duration = 0.964},
  ["Tel Nof"] = {filename = "Tel Nof.ogg", duration = 0.708},
  ["Hatzor"] = {filename = "Hatzor.ogg", duration = 0.615},
}


AI_ATC_SoundFiles.ATIS.PhoneticAlphabet = {
  ["A"] = "Alpha",
  ["B"] = "Bravo",
  ["C"] = "Charlie",
  ["D"] = "Delta",
  ["E"] = "Echo",
  ["F"] = "Foxtrot",
  ["G"] = "Golf",
  ["H"] = "Hotel",
  ["I"] = "India",
  ["J"] = "Juliett",
  ["K"] = "Kilo",
  ["L"] = "Lima",
  ["M"] = "Mike",
  ["N"] = "November",
  ["O"] = "Oscar",
  ["P"] = "Papa",
  ["Q"] = "Quebec",
  ["R"] = "Romeo",
  ["S"] = "Sierra",
  ["T"] = "Tango",
  ["U"] = "Uniform",
  ["V"] = "Victor",
  ["W"] = "Whiskey",
  ["X"] = "Xray",
  ["Y"] = "Yankee",
  ["Z"] = "Zulu",
  }
  
AI_ATC_SoundFiles.ATIS.Phonetic = {
  Alpha = { filename = "Alpha.ogg", duration = 0.467 },
  Bravo = { filename = "Bravo.ogg", duration = 0.569 },
  Charlie = { filename = "Charlie.ogg", duration = 0.580 },
  Delta = { filename = "Delta.ogg", duration = 0.514 },
  Echo = { filename = "Echo.ogg", duration = 0.477 },
  Foxtrot = { filename = "Foxtrot.ogg", duration = 0.758 },
  Golf = { filename = "Golf.ogg", duration = 0.528 },
  Hotel = { filename = "Hotel.ogg", duration = 0.594 },
  India = { filename = "India.ogg", duration = 0.530 },
  Juliett = { filename = "Juliet.ogg", duration = 0.665 },
  Kilo = { filename = "Kilo.ogg", duration = 0.540 },
  Lima = { filename = "Lima.ogg", duration = 0.438 },
  Mike = { filename = "Mike.ogg", duration = 0.431 },
  November = { filename = "November.ogg", duration = 0.639 },
  Oscar = { filename = "Oscar.ogg", duration = 0.559 },
  Papa = { filename = "Papa.ogg", duration = 0.418 },
  Quebec = { filename = "Quebec.ogg", duration = 0.549 },
  Romeo = { filename = "Romeo.ogg", duration = 0.618 },
  Sierra = { filename = "Sierra.ogg", duration = 0.573 },
  Tango = { filename = "Tango.ogg", duration = 0.607 },
  Uniform = { filename = "Uniform.ogg", duration = 0.715 },
  Victor = { filename = "Victor.ogg", duration = 0.538 },
  Whiskey = { filename = "Whiskey.ogg", duration = 0.575 },
  Xray = { filename = "Xray.ogg", duration = 0.669 },
  Yankee = { filename = "Yankee.ogg", duration = 0.583 },
  Zulu = { filename = "Zulu.ogg", duration = 0.592 },
}
  
AI_ATC_SoundFiles.Ground.Phonetic = {
  Alpha = { filename = "Ground_Alpha.ogg", duration = 0.390 },
  Bravo = { filename = "Ground_Bravo.ogg", duration = 0.354 },
  Charlie = { filename = "Ground_Charlie.ogg", duration = 0.434 },
  Delta = { filename = "Ground_Delta.ogg", duration = 0.387 },
  Echo = { filename = "Ground_Echo.ogg", duration = 0.357 },
  Foxtrot = { filename = "Ground_Foxtrot.ogg", duration = 0.599 },
  Golf = { filename = "Ground_Golf.ogg", duration = 0.357 },
  Hotel = { filename = "Ground_Hotel.ogg", duration = 0.418 },
  India = { filename = "Ground_India.ogg", duration = 0.351 },
  Juliett = { filename = "Ground_Juliet.ogg", duration = 0.451 },
  Kilo = { filename = "Ground_Kilo.ogg", duration = 0.357 },
  Lima = { filename = "Ground_Lima.ogg", duration = 0.327 },
  Mike = { filename = "Ground_Mike.ogg", duration = 0.369 },
  November = { filename = "Ground_November.ogg", duration = 0.501 },
  Oscar = { filename = "Ground_Oscar.ogg", duration = 0.419 },
  Papa = { filename = "Ground_Papa.ogg", duration = 0.349 },
  Quebec = { filename = "Ground_Quebec.ogg", duration = 0.418 },
  Romeo = { filename = "Ground_Romeo.ogg", duration = 0.392 },
  Sierra = { filename = "Ground_Sierra.ogg", duration = 0.453 },
  Tango = { filename = "Ground_Tango.ogg", duration = 0.391 },
  Uniform = { filename = "Ground_Uniform.ogg", duration = 0.438 },
  Victor = { filename = "Ground_Victor.ogg", duration = 0.366 },
  Whiskey = { filename = "Ground_Whiskey.ogg", duration = 0.383 },
  Xray = { filename = "Ground_Xray.ogg", duration = 0.453 },
  Yankee = { filename = "Ground_Yankee.ogg", duration = 0.430 },
  Zulu = { filename = "Ground_Zulu.ogg", duration = 0.430 },
}

AI_ATC_SoundFiles.Ground.Aircraft = {
  ["Mi-28N"] = { filename = "Helo.ogg", duration = 0.673 },
  ["UH-60A"] = { filename = "Helo.ogg", duration = 0.673 },
  ["Mi-24V"] = { filename = "Helo.ogg", duration = 0.673 },
  ["Mi-8MT"] = { filename = "Helo.ogg", duration = 0.673 },
  ["CH-53E"] = { filename = "Helo.ogg", duration = 0.673 },
  ["SA342L"] = { filename = "Helo.ogg", duration = 0.673 },
  ["AH-64A"] = { filename = "Helo.ogg", duration = 0.673 },
  ["AH-64D"] = { filename = "Helo.ogg", duration = 0.673 },
  ["Ka-50_3"] = { filename = "Helo.ogg", duration = 0.673 },
  ["Ka-27"] = { filename = "Helo.ogg", duration = 0.673 },
  ["UH-1H"] = { filename = "Helo.ogg", duration = 0.673 },
  ["OH-58D"] = { filename = "Helo.ogg", duration = 0.673 },
  ["Mi-24P"] = { filename = "Helo.ogg", duration = 0.673 },
  ["SH-60B"] = { filename = "Helo.ogg", duration = 0.673 },
  ["SA342Minigun"] = { filename = "Helo.ogg", duration = 0.673 },
  ["CH-47Fbl1"] = { filename = "Helo.ogg", duration = 0.673 },
  ["SA342Mistral"] = { filename = "Helo.ogg", duration = 0.673 },
  ["OH58D"] = { filename = "Helo.ogg", duration = 0.673 },
  ["SA342M"] = { filename = "Helo.ogg", duration = 0.673 },
  ["Ka-50"] = { filename = "Helo.ogg", duration = 0.673 },
  ["AH-64D_BLK_II"] = { filename = "Helo.ogg", duration = 0.673 },
  ["AH-1W"] = { filename = "Helo.ogg", duration = 0.673 },
  ["CH-47D"] = { filename = "Helo.ogg", duration = 0.673 },
  ["Mi-26"] = { filename = "Helo.ogg", duration = 0.673 },
  ["A-10A"] = { filename = "A10.ogg", duration = 0.430 },
  ["A-10C"] = { filename = "A10.ogg", duration = 0.430 },
  ["A-10C_2"] = { filename = "A10.ogg", duration = 0.430 },
  ["A6E"] = { filename = "A-6.ogg", duration = 0.650 },
  ["AJS37"] = { filename = "AJS37.ogg", duration = 0.300 },
  ["AV8BNA"] = { filename = "AV8B.ogg", duration = 0.615 },
  ["B-1B"] = { filename = "B1B.ogg", duration = 0.350 },
  ["B-52H"] = { filename = "B52.ogg", duration = 0.662 },
  ["C-101CC"] = { filename = "C101.ogg", duration = 0.673 },
  ["C-101EB"] = { filename = "C101.ogg", duration = 0.673 },
  ["F-117A"] = { filename = "F117.ogg", duration = 0.882 },
  ["F-4E"] = { filename = "F4E.ogg", duration = 0.500 },
  ["F-4E-45MC"] = { filename = "F4E.ogg", duration = 0.500 },
  ["F-5E"] = { filename = "F5E.ogg", duration = 0.580 },
  ["F-5E-3"] = { filename = "F5E.ogg", duration = 0.580 },
  ["F-14A"] = { filename = "F14.ogg", duration = 0.592 },
  ["F-14A-135-GR"] = { filename = "F14.ogg", duration = 0.592 },
  ["F-14B"] = { filename = "F14.ogg", duration = 0.592 },
  ["F-15C"] = { filename = "F15.ogg", duration = 0.557 },
  ["F-15E"] = { filename = "F15.ogg", duration = 0.557 },
  ["F-15ESE"] = { filename = "F15.ogg", duration = 0.557 },
  ["F-16A"] = { filename = "F16.ogg", duration = 0.627 },
  ["F-16A MLU"] = { filename = "F16.ogg", duration = 0.627 },
  ["F-16C bl.50"] = { filename = "F16.ogg", duration = 0.627 },
  ["F-16C bl.52d"] = { filename = "F16.ogg", duration = 0.627 },
  ["F-16C_50"] = { filename = "F16.ogg", duration = 0.627 },
  ["FA-18A"] = { filename = "F18.ogg", duration = 0.511 },
  ["FA-18C"] = { filename = "F18.ogg", duration = 0.511 },
  ["FA-18C_hornet"] = { filename = "F18.ogg", duration = 0.511 },
  ["F-86F Sabre"] = { filename = "F86.ogg", duration = 0.824 },
  ["J-11A"] = { filename = "J11.ogg", duration = 0.557 },
  ["JF-17"] = { filename = "JF17.ogg", duration = 0.917 },
  ["L-39C"] = { filename = "L39.ogg", duration = 0.720 },
  ["L-39ZA"] = { filename = "L39.ogg", duration = 0.720 },
  ["Mirage-F1B"] = { filename = "MIRAGE.ogg", duration = 0.557 },
  ["Mirage-F1BD"] = { filename = "MIRAGE.ogg", duration = 0.557 },
  ["Mirage-F1BE"] = { filename = "MIRAGE.ogg", duration = 0.557 },
  ["Mirage-F1BQ"] = { filename = "MIRAGE.ogg", duration = 0.557 },
  ["Mirage-F1C"] = { filename = "MIRAGE.ogg", duration = 0.557 },
  ["Mirage-F1CE"] = { filename = "MIRAGE.ogg", duration = 0.557 },
  ["Mirage-F1C-200"] = { filename = "MIRAGE.ogg", duration = 0.557 },
  ["Mirage-F1CG"] = { filename = "MIRAGE.ogg", duration = 0.557 },
  ["Mirage-F1CH"] = { filename = "MIRAGE.ogg", duration = 0.557 },
  ["Mirage-F1CJ"] = { filename = "MIRAGE.ogg", duration = 0.557 },
  ["Mirage-F1CK"] = { filename = "MIRAGE.ogg", duration = 0.557 },
  ["Mirage-F1CR"] = { filename = "MIRAGE.ogg", duration = 0.557 },
  ["Mirage-F1CT"] = { filename = "MIRAGE.ogg", duration = 0.557 },
  ["Mirage-F1CZ"] = { filename = "MIRAGE.ogg", duration = 0.557 },
  ["Mirage-F1DDA"] = { filename = "MIRAGE.ogg", duration = 0.557 },
  ["Mirage-F1ED"] = { filename = "MIRAGE.ogg", duration = 0.557 },
  ["Mirage-F1EE"] = { filename = "MIRAGE.ogg", duration = 0.557 },
  ["Mirage-F1EH"] = { filename = "MIRAGE.ogg", duration = 0.557 },
  ["Mirage-F1EQ"] = { filename = "MIRAGE.ogg", duration = 0.557 },
  ["Mirage-F1jA"] = { filename = "MIRAGE.ogg", duration = 0.557 },
  ["Mirage-F1M-CE"] = { filename = "MIRAGE.ogg", duration = 0.557 },
  ["Mirage-F1M-EE"] = { filename = "MIRAGE.ogg", duration = 0.557 },
  ["M-2000C"] = { filename = "MIRAGE.ogg", duration = 0.557 },
  ["MB-339A"] = { filename = "MB339.ogg", duration = 1.03 },
  ["MB-339A/PAN"] = { filename = "MB339.ogg", duration = 1.03 },
  ["MiG-15bis"] = { filename = "MIG15.ogg", duration = 0.604 },
  ["MiG-19P"] = { filename = "MIG19.ogg", duration = 0.627 },
  ["MiG-21Bis"] = { filename = "MIG21.ogg", duration = 0.673 },
  ["MiG-23LD"] = { filename = "MIG23.ogg", duration = 0.766 },
  ["MiG-25PD"] = { filename = "MIG25.ogg", duration = 0.906 },
  ["MiG-25RBT"] = { filename = "MIG25.ogg", duration = 0.906 },
  ["MiG-27K"] = { filename = "MIG27.ogg", duration = 0.789 },
  ["MiG-29A"] = { filename = "MIG29.ogg", duration = 0.766 },
  ["MiG-29 Fulcrum"] = { filename = "MIG29.ogg", duration = 0.766 },
  ["MiG-29G"] = { filename = "MIG29.ogg", duration = 0.766 },
  ["MiG-29S"] = { filename = "MIG29.ogg", duration = 0.766 },
  ["MiG-29S"] = { filename = "MIG29.ogg", duration = 0.766 },
  ["Su-17M4"] = { filename = "SU17.ogg", duration = 0.743 },
  ["Su-24M"] = { filename = "SU24.ogg", duration = 0.859 },
  ["Su-25"] = { filename = "SU25.ogg", duration = 0.882 },
  ["Su-25T"] = { filename = "SU25.ogg", duration = 0.882 },
  ["Su-25TM"] = { filename = "SU25.ogg", duration = 0.882 },
  ["Su-27"] = { filename = "SU27.ogg", duration = 0.857 },
  ["Su-30"] = { filename = "SU30.ogg", duration = 0.604 },
  ["Su-33"] = { filename = "SU33.ogg", duration = 0.801 },
  ["Su-34"] = { filename = "SU34.ogg", duration = 0.836 },
  ["Tornado GR4"] = { filename = "GR4.ogg", duration = 0.569 },
  ["Tornado IDS"] = { filename = "GR4.ogg", duration = 0.569 },
  ["RQ-1A Predator"] = { filename = "UAV.ogg", duration = 0.656 },
  ["MQ-9 Reaper"] = { filename = "UAV.ogg", duration = 0.656 },
  ["WingLoong-I"] = { filename = "UAV.ogg", duration = 0.656 },
  ["Tu-22M3"] = { filename = "TU22.ogg", duration = 0.778 },
  ["A-4E-C"] = { filename = "A4.ogg", duration = 0.792 },
  ["T-45"] = { filename = "T45.ogg", duration = 0.923 },
  ["T-38C"] = { filename = "T38.ogg", duration = 0.760 },
  ["F-22A"] = { filename = "F22.ogg", duration = 0.698 },
  ["F-35"] = { filename = "F35.ogg", duration = 0.792 },
  ["FA-18E"] = { filename = "Rhino.ogg", duration = 0.406 },
  ["FA-18F"] = { filename = "Rhino.ogg", duration = 0.406 },
  ["EA-18G"] = { filename = "Rhino.ogg", duration = 0.406 },
  ["KC130"] = { filename = "Heavy.ogg", duration = 0.370 },
  ["KC-135"] = { filename = "Heavy.ogg", duration = 0.370 },
  ["KC135MPRS"] = { filename = "Heavy.ogg", duration = 0.370 },
  ["S-3B Tanker"] = { filename = "Heavy.ogg", duration = 0.370 },
  ["S-3B"] = { filename = "Heavy.ogg", duration = 0.370 },
  ["C-17A"] = { filename = "Heavy.ogg", duration = 0.370 },
  ["E-2C"] = { filename = "Heavy.ogg", duration = 0.370 },
  ["IL-76MD"] = { filename = "Heavy.ogg", duration = 0.370 },
  ["Tu-22M3"] = { filename = "Heavy.ogg", duration = 0.370 },
  ["Tu-160"] = { filename = "Heavy.ogg", duration = 0.370 },
  ["Tu-95MS"] = { filename = "Heavy.ogg", duration = 0.370 },
  ["Yak-40"] = { filename = "Heavy.ogg", duration = 0.370 },
  ["C-130"] = { filename = "Heavy.ogg", duration = 0.370 },
  ["C-130J-30"] = { filename = "Heavy.ogg", duration = 0.370 },
  ["IL-78M"] = { filename = "Heavy.ogg", duration = 0.370 },
  ["E-3A"] = { filename = "Heavy.ogg", duration = 0.370 },
  ["Tu-142"] = { filename = "Heavy.ogg", duration = 0.370 },
  ["H-6J"] = { filename = "Heavy.ogg", duration = 0.370 },
  ["An-30M"] = { filename = "Heavy.ogg", duration = 0.370 },
  ["KJ-2000"] = { filename = "Heavy.ogg", duration = 0.370 },
  ["An-26B"] = { filename = "Heavy.ogg", duration = 0.370 },
  ["P-47D-30"] = { filename = "WarBird.ogg", duration = 0.482 },
  ["Yak-52"] = { filename = "WarBird.ogg", duration = 0.482 },
  ["Bf-109K-4"] = { filename = "WarBird.ogg", duration = 0.482 },
  ["C-47"] = { filename = "WarBird.ogg", duration = 0.482 },
  ["I-16"] = { filename = "WarBird.ogg", duration = 0.482 },
  ["P-51D"] = { filename = "WarBird.ogg", duration = 0.482 },
  ["P-47D-40"] = { filename = "WarBird.ogg", duration = 0.482 },
  ["SpitfireLFMkIXCW"] = { filename = "WarBird.ogg", duration = 0.482 },
  ["TF-51D"] = { filename = "WarBird.ogg", duration = 0.482 },
  ["B-17G"] = { filename = "WarBird.ogg", duration = 0.482 },
  ["Ju-88A4"] = { filename = "WarBird.ogg", duration = 0.482 },
  ["MosquitoFBMkVI"] = { filename = "WarBird.ogg", duration = 0.482 },
  ["Christen Eagle II"] = { filename = "WarBird.ogg", duration = 0.482 },
  ["P-51D-30-NA"] = { filename = "WarBird.ogg", duration = 0.482 },
  ["SpitfireLFMkIX"] = { filename = "WarBird.ogg", duration = 0.482 },
  ["FW-190D9"] = { filename = "WarBird.ogg", duration = 0.482 },
  ["FW-190A8"] = { filename = "WarBird.ogg", duration = 0.482 },
  ["P-47D-30bl1"] = { filename = "WarBird.ogg", duration = 0.482 },
  ["A-20G"] = { filename = "WarBird.ogg", duration = 0.482 },
  ["F4U-1D"] = { filename = "WarBird.ogg", duration = 0.482 },
  ["F4U-1D_CW"] = { filename = "WarBird.ogg", duration = 0.482 },
  ["KC_10_Extender"] = { filename = "Heavy.ogg", duration = 0.370 },
  ["B_757"] = { filename = "Heavy.ogg", duration = 0.370 },
  ["C17_Globemaster_III"] = { filename = "Heavy.ogg", duration = 0.370 },
  ["EC130"] = { filename = "Heavy.ogg", duration = 0.370 },
  ["A_320"] = { filename = "Heavy.ogg", duration = 0.370 },
  ["FA-18E"] = { filename = "Rhino.ogg", duration = 0.406 },
  ["FA-18F"] = { filename = "Rhino.ogg", duration = 0.406 },
  ["RC135CB"] = { filename = "Heavy.ogg", duration = 0.370 },
  ["B_737"] = { filename = "Heavy.ogg", duration = 0.370 },
  ["CLP_E7A"] = { filename = "Heavy.ogg", duration = 0.370 },
  ["EurofighterT"] = { filename = "Rhino.ogg", duration = 0.406 },
  ["P3C_Orion"] = { filename = "Heavy.ogg", duration = 0.370 },
  ["KC_10_Extender_D"] = { filename = "Heavy.ogg", duration = 0.370 },
  ["C5_Galaxy"] = { filename = "Heavy.ogg", duration = 0.370 },
  ["HC130"] = { filename = "Heavy.ogg", duration = 0.370 },
  ["DC_10"] = { filename = "Heavy.ogg", duration = 0.370 },
  ["FA-18ET"] = { filename = "Rhino.ogg", duration = 0.406 },
  ["Cessna_210N"] = { filename = "Rhino.ogg", duration = 0.406 },
  ["CLP_P8"] = { filename = "Heavy.ogg", duration = 0.370 },
  ["FA-18FT"] = { filename = "Rhino.ogg", duration = 0.406 },
  ["B2_Spirit"] = { filename = "Heavy.ogg", duration = 0.370 },
  ["B_747"] = { filename = "Heavy.ogg", duration = 0.370 },
  ["EA-18G"] = { filename = "Rhino.ogg", duration = 0.406 },
  ["A_330"] = { filename = "Heavy.ogg", duration = 0.370 },
  ["RC135RJ"] = { filename = "Heavy.ogg", duration = 0.370 },
  ["A_380"] = { filename = "Heavy.ogg", duration = 0.370 },
  ["Eurofighter"] = { filename = "Rhino.ogg", duration = 0.406 },
  ["A400M_Atlas"] = { filename = "Heavy.ogg", duration = 0.370 },
  ["B_727"] = { filename = "Heavy.ogg", duration = 0.370 },
  ["V22_Osprey"] = { filename = "Helo.ogg", duration = 0.673 },
  ["C2A_Greyhound"] = { filename = "Heavy.ogg", duration = 0.370 },
  ["Hercules"] = { filename = "Heavy.ogg", duration = 0.370 },
}

AI_ATC_SoundFiles.Clearance.Callsigns = {
  ["Razor"] = { filename = "Razor.ogg", duration = 0.546 },
  ["Cylon"] = { filename = "Cylon.ogg", duration = 0.589 },
  ["Chaos"] = { filename = "Chaos.ogg", duration = 0.586 },
  ["Nightmare"] = { filename = "Nightmare.ogg", duration = 0.615 },
  ["Mig"] = { filename = "Mig.ogg", duration = 0.372 },
  ["Stalin"] = { filename = "Stalin.ogg", duration = 0.557 },
  ["Flanker"] = { filename = "Flanker.ogg", duration = 0.575 },
  ["Fulcrum"] = { filename = "Fulcrum.ogg", duration = 0.559 },
  ["Flogger"] = { filename = "Flogger.ogg", duration = 0.579 },
  ["Ivan"] = { filename = "Ivan.ogg", duration = 0.441 },
  ["GunFighter"] = { filename = "GunFighter.ogg", duration = 0.620 },
  ["Dragon"] = { filename = "Dragon.ogg", duration = 0.498 },
  ["Aspen"] = { filename = "Aspen.ogg", duration = 0.499 },
  ["Boar"] = { filename = "Boar.ogg", duration = 0.415 },
  ["Chevy"] = { filename = "Chevy.ogg", duration = 0.441 },
  ["Colt"] = { filename = "Colt.ogg", duration = 0.438 },
  ["Dodge"] = { filename = "Dodge.ogg", duration = 0.485 },
  ["Enfield"] = { filename = "Enfield.ogg", duration = 0.602 },
  ["Ford"] = { filename = "Ford.ogg", duration = 0.444 },
  ["Hawg"] = { filename = "Hawg.ogg", duration = 0.328 },
  ["Pig"] = { filename = "Pig.ogg", duration = 0.315 },
  ["Pontiac"] = { filename = "Pontiac.ogg", duration = 0.464 },
  ["Springfield"] = { filename = "Springfield.ogg", duration = 0.673 },
  ["Tusk"] = { filename = "Tusk.ogg", duration = 0.340 },
  ["Uzi"] = { filename = "Uzi.ogg", duration = 0.308 },
  ["Bone"] = { filename = "Bone.ogg", duration = 0.260 },
  ["Dark"] = { filename = "Dark.ogg", duration = 0.311 },
  ["Vader"] = { filename = "Vader.ogg", duration = 0.316 },
  ["Buff"] = { filename = "Buff.ogg", duration = 0.206 },
  ["Dump"] = { filename = "Dump.ogg", duration = 0.255 },
  ["Kenworth"] = { filename = "Kenworth.ogg", duration = 0.406 },
  ["Dude"] = { filename = "Dude.ogg", duration = 0.348 },
  ["Thud"] = { filename = "Thud.ogg", duration = 0.438 },
  ["Gunny"] = { filename = "Gunny.ogg", duration = 0.306 },
  ["Mad"] = { filename = "Mad.ogg", duration = 0.374 },
  ["Trek"] = { filename = "Trek.ogg", duration = 0.377 },
  ["Sniper"] = { filename = "Sniper.ogg", duration = 0.534 },
  ["Sled"] = { filename = "Sled.ogg", duration = 0.438 },
  ["Best"] = { filename = "Best.ogg", duration = 0.411 },
  ["Jazz"] = { filename = "Jazz.ogg", duration = 0.605 },
  ["Rage"] = { filename = "Rage.ogg", duration = 0.457 },
  ["Tahoe"] = { filename = "Tahoe.ogg", duration = 0.543 },
  ["Viper"] = { filename = "Viper.ogg", duration = 0.398 },
  ["Venom"] = { filename = "Venom.ogg", duration = 0.372 },
  ["Lobo"] = { filename = "Lobo.ogg", duration = 0.502 },
  ["Cowboy"] = { filename = "Cowboy.ogg", duration = 0.562 },
  ["Python"] = { filename = "Python.ogg", duration = 0.527 },
  ["Rattler"] = { filename = "Rattler.ogg", duration = 0.479 },
  ["Panther"] = { filename = "Panther.ogg", duration = 0.437 },
  ["Wolf"] = { filename = "Wolf.ogg", duration = 0.492 },
  ["Weasel"] = { filename = "Weasel.ogg", duration = 0.405 },
  ["Wild"] = { filename = "Wild.ogg", duration = 0.524 },
  ["Ninja"] = { filename = "Ninja.ogg", duration = 0.459 },
  ["Jedi"] = { filename = "Jedi.ogg", duration = 0.383 },
  ["Hornet"] = { filename = "Hornet.ogg", duration = 0.334 },
  ["Squid"] = { filename = "Squid.ogg", duration = 0.411 },
  ["Ragin"] = { filename = "Ragin.ogg", duration = 0.491 },
  ["Roman"] = { filename = "Roman.ogg", duration = 0.372 },
  ["Sting"] = { filename = "Sting.ogg", duration = 0.457 },
  ["Jury"] = { filename = "Jury.ogg", duration = 0.421 },
  ["Joker"] = { filename = "Joker.ogg", duration = 0.460 },
  ["Ram"] = { filename = "Ram.ogg", duration = 0.370 },
  ["Hawk"] = { filename = "Hawk.ogg", duration = 0.489 },
  ["Devil"] = { filename = "Devil.ogg", duration = 0.270 },
  ["Check"] = { filename = "Check.ogg", duration = 0.296 },
  ["Snake"] = { filename = "Snake.ogg", duration = 0.440 },
  ["Overlord"] = { filename = "Overlord.ogg", duration = 0.665 },
  ["Magic"] = { filename = "Magic.ogg", duration = 0.543 },
  ["Wizard"] = { filename = "Wizard.ogg", duration = 0.456 },
  ["Focus"] = { filename = "Focus.ogg", duration = 0.582 },
  ["Darkstar"] = { filename = "DarkStar.ogg", duration = 0.627 },
  ["BlackJack"] = { filename = "BlackJack.ogg", duration = 0.615 },
  ["Roulette"] = { filename = "Roulette.ogg", duration = 0.470 },
  ["Axeman"] = { filename = "Axeman.ogg", duration = 0.515 },
  ["Darknight"] = { filename = "Darknight.ogg", duration = 0.463 },
  ["Warrior"] = { filename = "Warrior.ogg", duration = 0.586 },
  ["Pointer"] = { filename = "Pointer.ogg", duration = 0.500 },
  ["Eyeball"] = { filename = "Eyeball.ogg", duration = 0.559 },
  ["Moonbeam"] = { filename = "Moonbeam.ogg", duration = 0.668 },
  ["Whiplash"] = { filename = "Whiplash.ogg", duration = 0.644 },
  ["Finger"] = { filename = "Finger.ogg", duration = 0.512 },
  ["Pinpoint"] = { filename = "Pinpoint.ogg", duration = 0.522 },
  ["Ferret"] = { filename = "Ferret.ogg", duration = 0.438 },
  ["Shaba"] = { filename = "Shaba.ogg", duration = 0.493 },
  ["Playboy"] = { filename = "Playboy.ogg", duration = 0.599 },
  ["Hammer"] = { filename = "Hammer.ogg", duration = 0.463 },
  ["Jaguar"] = { filename = "Jaguar.ogg", duration = 0.747 },
  ["Deathstar"] = { filename = "Deathstar.ogg", duration = 0.702 },
  ["Anvil"] = { filename = "Anvil.ogg", duration = 0.537 },
  ["Firefly"] = { filename = "Firefly.ogg", duration = 0.697 },
  ["Mantis"] = { filename = "Mantis.ogg", duration = 0.670 },
  ["Badger"] = { filename = "Badger.ogg", duration = 0.525 },
  ["Sauron"] = { filename = "Sauron.ogg", duration = 0.685 },
  ["Texaco"] = { filename = "Texaco.ogg", duration = 0.531 },
  ["Arco"] = { filename = "Arco.ogg", duration = 0.486 },
  ["Shell"] = { filename = "Shell.ogg", duration = 0.469 },
  ["Navy One"] = { filename = "NavyOne.ogg", duration = 0.731 },
  ["Mauler"] = { filename = "Mauler.ogg", duration = 0.525 },
  ["Blood Hound"] = { filename = "BloodHound.ogg", duration = 0.573 },
  ["ArmyAir"] = { filename = "ArmyAir.ogg", duration = 0.662 },
  ["Apache"] = { filename = "Apache.ogg", duration = 0.673 },
  ["Crow"] = { filename = "Crow.ogg", duration = 0.502 },
  ["Crow"] = { filename = "Crow.ogg", duration = 0.502 },
  ["Sioux"] = { filename = "Sioux.ogg", duration = 0.502 },
  ["Gatling"] = { filename = "Gatling.ogg", duration = 0.537 },
  ["Gunslinger"] = { filename = "Gunslinger.ogg", duration = 0.670 },
  ["Hammerhead"] = { filename = "Hammerhead.ogg", duration = 0.576 },
  ["Bootleg"] = { filename = "Bootleg.ogg", duration = 0.760 },
  ["Palehorse"] = { filename = "Palehorse.ogg", duration = 0.682 },
  ["Carnivore"] = { filename = "Carnivore.ogg", duration = 0.644 },
  ["Saber"] = { filename = "Saber.ogg", duration = 0.538 },
  ["Azrael"] = { filename = "Saber.ogg", duration = 0.697 },
  ["Bam-Bam"] = { filename = "Bam-Bam.ogg", duration = 0.592 },
  ["Burnin' Stogie"] = { filename = "Burnin' Stogie.ogg", duration = 0.813 },
  ["Crazyhorse"] = { filename = "Crazyhorse.ogg", duration = 0.871 },
  ["Crusader"] = { filename = "Crusader.ogg", duration = 0.580 },
  ["Darkhorse"] = { filename = "Darkhorse.ogg", duration = 0.625 },
  ["Eagle"] = { filename = "Eagle.ogg", duration = 0.406 },
  ["Lighthorse"] = { filename = "Lighthorse.ogg", duration = 0.689 },
  ["Mustang"] = { filename = "Mustang.ogg", duration = 0.752 },
  ["Outcast"] = { filename = "Outcast.ogg", duration = 0.788 },
  ["Pegasus"] = { filename = "Pegasus.ogg", duration = 0.691 },
  ["Pistol"] = { filename = "Pistol.ogg", duration = 0.385 },
  ["Roughneck"] = { filename = "Roughneck.ogg", duration = 0.595 },
  ["Shamus"] = { filename = "Shamus.ogg", duration = 0.557 },
  ["Spur"] = { filename = "Spur.ogg", duration = 0.534 },
  ["Stetson"] = { filename = "Stetson.ogg", duration = 0.543 },
  ["Wrath"] = { filename = "Wrath.ogg", duration = 0.491 },
  ["Heavy"] = { filename = "Heavy.ogg", duration = 0.325 },
  ["Trash"] = { filename = "Trash.ogg", duration = 0.573 },
  ["Cargo"] = { filename = "Cargo.ogg", duration = 0.451 },
  ["Ascot"] = { filename = "Ascot.ogg", duration = 0.575 },
  ["Grape"] = { filename = "Grape.ogg", duration = 0.502 },
  ["Slayer"] = { filename = "Slayer.ogg", duration = 0.511 },
  ["Strelka"] = { filename = "Strelka.ogg", duration = 0.602 },
  ["Skalpel"] = { filename = "Skalpel.ogg", duration = 0.546 },
  ["Rapier"] = { filename = "Rapier.ogg", duration = 0.441 },
  ["Pedro"] = { filename = "Pedro.ogg", duration = 0.486 },
  ["Raygun"] = { filename = "Raygun.ogg", duration = 0.499 },
  ["Heartless"] = { filename = "Heartless.ogg", duration = 0.644 },
  ["Viceroy"] = { filename = "Viceroy.ogg", duration = 0.551 },
  ["Cupcake"] = { filename = "Cupcake.ogg", duration = 0.801 },
  ["Fighting Tiger"] = { filename = "Fighting Tiger.ogg", duration = 0.807 },
  ["Flying Ace"] = { filename = "Flying Ace.ogg", duration = 0.749 },
  ["Buckeye"] = { filename = "Buckeye.ogg", duration = 0.540 },
  ["Goldplate"] = { filename = "Goldplate.ogg", duration = 0.563 },
  ["Phoenix"] = { filename = "Phoenix.ogg", duration = 0.589 },
  ["Electron"] = { filename = "Electron.ogg", duration = 0.598 },
  ["Rustler"] = { filename = "Rustler.ogg", duration = 0.662 },
  ["Vixen"] = { filename = "Vixen.ogg", duration = 0.432 },
  ["Jackal"] = { filename = "Jackal.ogg", duration = 0.498 },
  ["Milestone"] = { filename = "Milestone.ogg", duration = 0.624},
  ["Simca"] = { filename = "Simca.ogg", duration = 0.508 },
  ["Comet"] = { filename = "Comet.ogg", duration = 0.395 },
  ["Digger"] = { filename = "Digger.ogg", duration = 0.415 },
  ["Sabre"] = { filename = "Sabre.ogg", duration = 0.578 },
  ["Pirate"] = { filename = "Pirate.ogg", duration = 0.511 },
  ["Cannon"] = { filename = "Cannon.ogg", duration = 0.496 },
  ["Buckshot"] = { filename = "Buckshot.ogg", duration = 0.610 },
  ["Maple"] = { filename = "Maple.ogg", duration = 0.482 },
  ["Hellcat"] = { filename = "Hellcat.ogg", duration = 0.650 },
  ["Sundowner"] = { filename = "Sundowner.ogg", duration = 0.681 },
  ["Camelot"] = { filename = "Camelot.ogg", duration = 0.604 },
  ["Witchita"] = { filename = "Witchita.ogg", duration = 0.612 },
  ["Dog"] = { filename = "Dog.ogg", duration = 0.351 },
  ["Lion"] = { filename = "Lion.ogg", duration = 0.344 },
  ["Tomcat"] = { filename = "Tomcat.ogg", duration = 0.575 },
  ["Retro"] = { filename = "Retro.ogg", duration = 0.482 },
  ["Ghostrider"] = { filename = "Ghostrider.ogg", duration = 0.752 },
  ["Dealer"] = { filename = "Dealer.ogg", duration = 0.575 },
  ["Dagger"] = { filename = "Dagger.ogg", duration = 0.575 },
  ["Hammer"] = { filename = "Hammer.ogg", duration = 0.560 },
  ["Voodoo"] = { filename = "Voodoo.ogg", duration = 0.514 },
  ["Wildman"] = { filename = "Wildman.ogg", duration = 0.740 },
  ["Ugly"] = { filename = "Ugly.ogg", duration = 0.525 },
  ["Gunstar"] = { filename = "Gunstar.ogg", duration = 0.579 },
  ["Felix"] = { filename = "Felix.ogg", duration = 0.640 },
  ["Gypsy"] = { filename = "Gypsy.ogg", duration = 0.499 },
  ["Black"] = { filename = "Black.ogg", duration = 0.525 },
  ["Knight"] = { filename = "Knight.ogg", duration = 0.479 },
  ["Black Knight"] = { filename = "Black.ogg", duration = 0.8520 },
  ["Phantom"] = { filename = "Phantom.ogg", duration = 0.615 },
  ["Bogey"] = { filename = "Bogey.ogg", duration = 0.505 },
}

AI_ATC_SoundFiles.RangeControl.Callsigns = {
  ["Razor"] = { filename = "Razor.ogg", duration = 0.506 },
  ["Cylon"] = { filename = "Cylon.ogg", duration = 0.560 },
  ["Chaos"] = { filename = "Chaos.ogg", duration = 0.662 },
  ["Nightmare"] = { filename = "Nightmare.ogg", duration = 0.547 },
  ["Mig"] = { filename = "Mig.ogg", duration = 0.335 },
  ["Stalin"] = { filename = "Stalin.ogg", duration = 0.493 },
  ["Flanker"] = { filename = "Flanker.ogg", duration = 0.489 },
  ["Fulcrum"] = { filename = "Fulcrum.ogg", duration = 0.509 },
  ["Flogger"] = { filename = "Flogger.ogg", duration = 0.508 },
  ["Ivan"] = { filename = "Ivan.ogg", duration = 0.335 },
  ["GunFighter"] = { filename = "GunFighter.ogg", duration = 0.607 },
  ["Dragon"] = { filename = "Dragon.ogg", duration = 0.569 },
  ["Aspen"] = { filename = "Aspen.ogg", duration = 0.494 },
  ["Boar"] = { filename = "Boar.ogg", duration = 0.361 },
  ["Chevy"] = { filename = "Chevy.ogg", duration = 0.370 },
  ["Colt"] = { filename = "Colt.ogg", duration = 0.392 },
  ["Dodge"] = { filename = "Dodge.ogg", duration = 0.522 },
  ["Enfield"] = { filename = "Enfield.ogg", duration = 0.559 },
  ["Ford"] = { filename = "Ford.ogg", duration = 0.580 },
  ["Hawg"] = { filename = "Hawg.ogg", duration = 0.482 },
  ["Pig"] = { filename = "Pig.ogg", duration = 0.358 },
  ["Pontiac"] = { filename = "Pontiac.ogg", duration = 0.628 },
  ["Springfield"] = { filename = "SpringField.ogg", duration = 0.729 },
  ["Tusk"] = { filename = "Tusk.ogg", duration = 0.479 },
  ["Uzi"] = { filename = "Uzi.ogg", duration = 0.534 },
  ["Bone"] = { filename = "Bone.ogg", duration = 0.464 },
  ["Dark"] = { filename = "Dark.ogg", duration = 0.387 },
  ["Vader"] = { filename = "Vader.ogg", duration = 0.387 },
  ["Buff"] = { filename = "Buff.ogg", duration = 0.360 },
  ["Dump"] = { filename = "Dump.ogg", duration = 0.328 },
  ["Kenworth"] = { filename = "Kenworth.ogg", duration = 0.540 },
  ["Dude"] = { filename = "Dude.ogg", duration = 0.453 },
  ["Thud"] = { filename = "Thud.ogg", duration = 0.328 },
  ["Gunny"] = { filename = "Gunny.ogg", duration = 0.337 },
  ["Mad"] = { filename = "Mad.ogg", duration = 0.396 },
  ["Trek"] = { filename = "Trek.ogg", duration = 0.353 },
  ["Sniper"] = { filename = "Sniper.ogg", duration = 0.673 },
  ["Sled"] = { filename = "Sled.ogg", duration = 0.582 },
  ["Best"] = { filename = "Best.ogg", duration = 0.580 },
  ["Jazz"] = { filename = "Jazz.ogg", duration = 0.628 },
  ["Rage"] = { filename = "Rage.ogg", duration = 0.534 },
  ["Tahoe"] = { filename = "Tahoe.ogg", duration = 0.517 },
  ["Viper"] = { filename = "Viper.ogg", duration = 0.443 },
  ["Venom"] = { filename = "Venom.ogg", duration = 0.370 },
  ["Lobo"] = { filename = "Lobo.ogg", duration = 0.479 },
  ["Cowboy"] = { filename = "Cowboy.ogg", duration = 0.512 },
  ["Python"] = { filename = "Python.ogg", duration = 0.521 },
  ["Rattler"] = { filename = "Rattler.ogg", duration = 0.522 },
  ["Panther"] = { filename = "Panther.ogg", duration = 0.554 },
  ["Wolf"] = { filename = "Wolf.ogg", duration = 0.464 },
  ["Weasel"] = { filename = "Weasel.ogg", duration = 0.460 },
  ["Wild"] = { filename = "Wild.ogg", duration = 0.502 },
  ["Ninja"] = { filename = "Ninja.ogg", duration = 0.469 },
  ["Jedi"] = { filename = "Jedi.ogg", duration = 0.495 },
  ["Hornet"] = { filename = "Hornet.ogg", duration = 0.477 },
  ["Squid"] = { filename = "Squid.ogg", duration = 0.569 },
  ["Ragin"] = { filename = "Ragin.ogg", duration = 0.559 },
  ["Roman"] = { filename = "Roman.ogg", duration = 0.448 },
  ["Sting"] = { filename = "Sting.ogg", duration = 0.562 },
  ["Jury"] = { filename = "Jury.ogg", duration = 0.477 },
  ["Joker"] = { filename = "Joker.ogg", duration = 0.505 },
  ["Ram"] = { filename = "Ram.ogg", duration = 0.479 },
  ["Hawk"] = { filename = "Hawk.ogg", duration = 0.464 },
  ["Devil"] = { filename = "Devil.ogg", duration = 0.408 },
  ["Check"] = { filename = "Check.ogg", duration = 0.372 },
  ["Snake"] = { filename = "Snake.ogg", duration = 0.602 },
  ["Overlord"] = { filename = "Overlord.ogg", duration = 0.617 },
  ["Magic"] = { filename = "Magic.ogg", duration = 0.496 },
  ["Wizard"] = { filename = "Wizard.ogg", duration = 0.453 },
  ["Focus"] = { filename = "Focus.ogg", duration = 0.633 },
  ["Darkstar"] = { filename = "DarkStar.ogg", duration = 0.605 },
  ["BlackJack"] = { filename = "BlackJack.ogg", duration = 0.614 },
  ["Texaco"] = { filename = "Texaco.ogg", duration = 0.662 },
  ["Arco"] = { filename = "Arco.ogg", duration = 0.546 },
  ["Shell"] = { filename = "Arco.ogg", duration = 0.499 },
  ["Navy One"] = { filename = "NavyOne.ogg", duration = 0.731 },
  ["Mauler"] = { filename = "Mauler.ogg", duration = 0.615 },
  ["Blood Hound"] = { filename = "BloodHound.ogg", duration = 0.673 },
  ["ArmyAir"] = { filename = "ArmyAir.ogg", duration = 0.604 },
  ["Apache"] = { filename = "Apache.ogg", duration = 0.511 },
  ["Crow"] = { filename = "Crow.ogg", duration = 0.441 },
  ["Sioux"] = { filename = "Sioux.ogg", duration = 0.450 },
  ["Gatling"] = { filename = "Gatling.ogg", duration = 0.598 },
  ["Gunslinger"] = { filename = "Gunslinger.ogg", duration = 0.708 },
  ["Hammerhead"] = { filename = "Hammerhead.ogg", duration = 0.580 },
  ["Bootleg"] = { filename = "Bootleg.ogg", duration = 0.550 },
  ["Palehorse"] = { filename = "Palehorse.ogg", duration = 0.769 },
  ["Carnivore"] = { filename = "Carnivore.ogg", duration = 0.627 },
  ["Saber"] = { filename = "Saber.ogg", duration = 0.522 },
  ["Azrael"] = { filename = "Saber.ogg", duration = 0.604 },
  ["Bam-Bam"] = { filename = "Bam-Bam.ogg", duration = 0.501 },
  ["Burnin' Stogie"] = { filename = "Burnin' Stogie.ogg", duration = 0.720 },
  ["Crazyhorse"] = { filename = "Crazyhorse.ogg", duration = 0.697 },
  ["Crusader"] = { filename = "Crusader.ogg", duration = 0.615 },
  ["Darkhorse"] = { filename = "Darkhorse.ogg", duration = 0.755 },
  ["Eagle"] = { filename = "Eagle.ogg", duration = 0.383 },
  ["Lighthorse"] = { filename = "Lighthorse.ogg", duration = 0.714 },
  ["Mustang"] = { filename = "Mustang.ogg", duration = 0.586 },
  ["Outcast"] = { filename = "Outcast.ogg", duration = 0.670 },
  ["Pegasus"] = { filename = "Pegasus.ogg", duration = 0.612 },
  ["Pistol"] = { filename = "Pistol.ogg", duration = 0.461 },
  ["Roughneck"] = { filename = "Roughneck.ogg", duration = 0.557 },
  ["Shamus"] = { filename = "Shamus.ogg", duration = 0.615 },
  ["Spur"] = { filename = "Spur.ogg", duration = 0.485 },
  ["Stetson"] = { filename = "Stetson.ogg", duration = 0.589 },
  ["Wrath"] = { filename = "Wrath.ogg", duration = 0.461 },
  ["Heavy"] = { filename = "Heavy.ogg", duration = 0.360 },
  ["Trash"] = { filename = "Trash.ogg", duration = 0.493 },
  ["Cargo"] = { filename = "Cargo.ogg", duration = 0.467 },
  ["Ascot"] = { filename = "Ascot.ogg", duration = 0.572 },
  ["Grape"] = { filename = "Grape.ogg", duration = 0.387 },
  ["Slayer"] = { filename = "Slayer.ogg", duration = 0.549 },
  ["Strelka"] = { filename = "Strelka.ogg", duration = 0.592 },
  ["Skalpel"] = { filename = "Skalpel.ogg", duration = 0.566 },
  ["Rapier"] = { filename = "Rapier.ogg", duration = 0.554 },
  ["Pedro"] = { filename = "Pedro.ogg", duration = 0.485 },
  ["Raygun"] = { filename = "Raygun.ogg", duration = 0.454 },
  ["Heartless"] = { filename = "Heartless.ogg", duration = 0.560 },
  ["Viceroy"] = { filename = "Viceroy.ogg", duration = 0.549 },
  ["Cupcake"] = { filename = "Cupcake.ogg", duration = 0.615 },
  ["Fighting Tiger"] = { filename = "Fighting_Tiger.ogg", duration = 0.864 },
  ["Flying Ace"] = { filename = "Flying_Ace.ogg", duration = 0.828 },
  ["Buckeye"] = { filename = "Buckeye.ogg", duration = 0.514 },
  ["Goldplate"] = { filename = "Goldplate.ogg", duration = 0.709 },
  ["Phoenix"] = { filename = "Phoenix.ogg", duration = 0.615 },
  ["Electron"] = { filename = "Electron.ogg", duration = 0.774 },
  ["Rustler"] = { filename = "Rustler.ogg", duration = 0.619 },
  ["Vixen"] = { filename = "Vixen.ogg", duration = 0.556 },
  ["Jackal"] = { filename = "Jackal.ogg", duration = 0.530 },
  ["Milestone"] = { filename = "Milestone.ogg", duration = 0.633},
  ["Simca"] = { filename = "Simca.ogg", duration = 0.508 },
  ["Comet"] = { filename = "Comet.ogg", duration = 0.395 },
  ["Razor"] = { filename = "Razor.ogg", duration = 0.499 },
  ["Digger"] = { filename = "Digger.ogg", duration = 0.495 },
  ["Sabre"] = { filename = "Sabre.ogg", duration = 0.538 },
  ["Pirate"] = { filename = "Pirate.ogg", duration = 0.463 },
  ["Cannon"] = { filename = "Cannon.ogg", duration = 0.493 },
  ["Buckshot"] = { filename = "Buckshot.ogg", duration = 0.627 },
  ["Maple"] = { filename = "Maple.ogg", duration = 0.484 },
  ["Hellcat"] = { filename = "Hellcat.ogg", duration = 0.530 },
  ["Sundowner"] = { filename = "Sundowner.ogg", duration = 0.709 },
  ["Camelot"] = { filename = "Camelot.ogg", duration = 0.553 },
  ["Witchita"] = { filename = "Witchita.ogg", duration = 0.636 },
  ["Dog"] = { filename = "Dog.ogg", duration = 0.419 },
  ["Lion"] = { filename = "Lion.ogg", duration = 0.482 },
  ["Tomcat"] = { filename = "Tomcat.ogg", duration = 0.529 },
  ["Retro"] = { filename = "Retro.ogg", duration = 0.547 },
  ["Ghostrider"] = { filename = "Ghostrider.ogg", duration = 0.670 },
  ["Dealer"] = { filename = "Dealer.ogg", duration = 0.511 },
  ["Dagger"] = { filename = "Dagger.ogg", duration = 0.539 },
  ["Hammer"] = { filename = "Hammer.ogg", duration = 0.546 },
  ["Voodoo"] = { filename = "Voodoo.ogg", duration = 0.452 },
  ["Wildman"] = { filename = "Wildman.ogg", duration = 0.610 },
  ["Ugly"] = { filename = "Ugly.ogg", duration = 0.427 },
  ["Gunstar"] = { filename = "Gunstar.ogg", duration = 0.679 },
  ["Felix"] = { filename = "Felix.ogg", duration = 0.654 },
  ["Gypsy"] = { filename = "Gypsy.ogg", duration = 0.552 },
  ["Black"] = { filename = "Black.ogg", duration = 0.462 },
  ["Knight"] = { filename = "Knight.ogg", duration = 0.482 },
  ["Black Knight"] = { filename = "Black Knight.ogg", duration = 0.670 },
  ["Phantom"] = { filename = "Phantom.ogg", duration = 0.502 },
  ["Bogey"] = { filename = "Bogey.ogg", duration = 0.494 },
}

AI_ATC_SoundFiles.Ground.Callsigns = {
  ["Razor"] = { filename = "Razor.ogg", duration = 0.425 },
  ["Cylon"] = { filename = "Cylon.ogg", duration = 0.463 },
  ["Chaos"] = { filename = "Chaos.ogg", duration = 0.517 },
  ["Nightmare"] = { filename = "Nightmare.ogg", duration = 0.531 },
  ["Mig"] = { filename = "Mig.ogg", duration = 0.328 },
  ["Stalin"] = { filename = "Stalin.ogg", duration = 0.644 },
  ["Flanker"] = { filename = "Flanker.ogg", duration = 0.502 },
  ["Fulcrum"] = { filename = "Fulcrum.ogg", duration = 0.507 },
  ["Flogger"] = { filename = "Flogger.ogg", duration = 0.511 },
  ["Ivan"] = { filename = "Ivan.ogg", duration = 0.366 },
  ["GunFighter"] = { filename = "Gunfighter.ogg", duration = 0.610 },
  ["Dragon"] = { filename = "Dragon.ogg", duration = 0.435 },
  ["Aspen"] = { filename = "Aspen.ogg", duration = 0.408 },
  ["Boar"] = { filename = "Boar.ogg", duration = 0.34 },
  ["Chevy"] = { filename = "Chevy.ogg", duration = 0.45 },
  ["Colt"] = { filename = "Colt.ogg", duration = 0.39 },
  ["Dodge"] = { filename = "Dodge.ogg", duration = 0.44 },
  ["Enfield"] = { filename = "Enfield.ogg", duration = 0.554 },
  ["Ford"] = { filename = "Ford.ogg", duration = 0.39 },
  ["Hawg"] = { filename = "Hawg.ogg", duration = 0.35 },
  ["Pig"] = { filename = "Pig.ogg", duration = 0.25 },
  ["Pontiac"] = { filename = "Pontiac.ogg", duration = 0.53 },
  ["Springfield"] = { filename = "SpringField.ogg", duration = 0.68 },
  ["Tusk"] = { filename = "Tusk.ogg", duration = 0.40 },
  ["Uzi"] = { filename = "Uzi.ogg", duration = 0.38 },
  ["Bone"] = { filename = "Bone.ogg", duration = 0.30 },
  ["Dark"] = { filename = "Dark.ogg", duration = 0.34 },
  ["Vader"] = { filename = "Vader.ogg", duration = 0.40 },
  ["Buff"] = { filename = "Buff.ogg", duration = 0.32 },
  ["Dump"] = { filename = "Dump.ogg", duration = 0.32 },
  ["Kenworth"] = { filename = "Kenworth.ogg", duration = 0.47 },
  ["Dude"] = { filename = "Dude.ogg", duration = 0.31 },
  ["Thud"] = { filename = "Thud.ogg", duration = 0.32 },
  ["Gunny"] = { filename = "Gunny.ogg", duration = 0.33 },
  ["Mad"] = { filename = "Mad.ogg", duration = 0.41 },
  ["Trek"] = { filename = "Trek.ogg", duration = 0.39 },
  ["Sniper"] = { filename = "Sniper.ogg", duration = 0.54 },
  ["Sled"] = { filename = "Sled.ogg", duration = 0.45 },
  ["Best"] = { filename = "Best.ogg", duration = 0.40 },
  ["Jazz"] = { filename = "Jazz.ogg", duration = 0.48 },
  ["Rage"] = { filename = "Rage.ogg", duration = 0.52 },
  ["Tahoe"] = { filename = "Tahoe.ogg", duration = 0.39 },
  ["Viper"] = { filename = "Viper.ogg", duration = 0.44 },
  ["Venom"] = { filename = "Venom.ogg", duration = 0.39 },
  ["Lobo"] = { filename = "Lobo.ogg", duration = 0.44 },
  ["Cowboy"] = { filename = "Cowboy.ogg", duration = 0.52 },
  ["Python"] = { filename = "Python.ogg", duration = 0.51 },
  ["Rattler"] = { filename = "Rattler.ogg", duration = 0.47 },
  ["Panther"] = { filename = "Panther.ogg", duration = 0.44 },
  ["Wolf"] = { filename = "Wolf.ogg", duration = 0.38 },
  ["Weasel"] = { filename = "Weasel.ogg", duration = 0.38 },
  ["Wild"] = { filename = "Wild.ogg", duration = 0.41 },
  ["Ninja"] = { filename = "Ninja.ogg", duration = 0.45 },
  ["Jedi"] = { filename = "Jedi.ogg", duration = 0.44 },
  ["Hornet"] = { filename = "Hornet.ogg", duration = 0.41 },
  ["Squid"] = { filename = "Squid.ogg", duration = 0.41 },
  ["Ragin"] = { filename = "Ragin.ogg", duration = 0.41 },
  ["Roman"] = { filename = "Roman.ogg", duration = 0.35 },
  ["Sting"] = { filename = "Sting.ogg", duration = 0.38 },
  ["Jury"] = { filename = "Jury.ogg", duration = 0.38 },
  ["Joker"] = { filename = "Joker.ogg", duration = 0.44 },
  ["Ram"] = { filename = "Ram.ogg", duration = 0.40 },
  ["Hawk"] = { filename = "Hawk.ogg", duration = 0.34 },
  ["Devil"] = { filename = "Devil.ogg", duration = 0.33 },
  ["Check"] = { filename = "Check.ogg", duration = 0.40 },
  ["Snake"] = { filename = "Snake.ogg", duration = 0.50 }, 
  ["ArmyAir"] = { filename = "ArmyAir.ogg", duration = 0.547 },
  ["Apache"] = { filename = "Apache.ogg", duration = 0.594 },
  ["Crow"] = { filename = "Crow.ogg", duration = 0.340 },
  ["Sioux"] = { filename = "Sioux.ogg", duration = 0.427 },
  ["Gatling"] = { filename = "Gatling.ogg", duration = 0.395 },
  ["Gunslinger"] = { filename = "Gunslinger.ogg", duration = 0.641 },
  ["Hammerhead"] = { filename = "Hammerhead.ogg", duration = 0.576 },
  ["Bootleg"] = { filename = "Bootleg.ogg", duration = 0.511 },
  ["Palehorse"] = { filename = "Palehorse.ogg", duration = 0.617 },
  ["Carnivore"] = { filename = "Carnivore.ogg", duration = 0.563 },
  ["Saber"] = { filename = "Saber.ogg", duration = 0.475 },
  ["Azrael"] = { filename = "Saber.ogg", duration = 0.554 },
  ["Bam-Bam"] = { filename = "Bam-Bam.ogg", duration = 0.512 },
  ["Burnin' Stogie"] = { filename = "Burnin' Stogie.ogg", duration = 0.791 },
  ["Crazyhorse"] = { filename = "Crazyhorse.ogg", duration = 0.819 },
  ["Crusader"] = { filename = "Crusader.ogg", duration = 0.602 },
  ["Darkhorse"] = { filename = "Darkhorse.ogg", duration = 0.657 },
  ["Eagle"] = { filename = "Eagle.ogg", duration = 0.382 },
  ["Lighthorse"] = { filename = "Lighthorse.ogg", duration = 0.676 },
  ["Mustang"] = { filename = "Mustang.ogg", duration = 0.463 },
  ["Outcast"] = { filename = "Outcast.ogg", duration = 0.700 },
  ["Pegasus"] = { filename = "Pegasus.ogg", duration = 0.665 },
  ["Pistol"] = { filename = "Pistol.ogg", duration = 0.450 },
  ["Roughneck"] = { filename = "Roughneck.ogg", duration = 0.515 },
  ["Shamus"] = { filename = "Shamus.ogg", duration = 0.631 },
  ["Spur"] = { filename = "Spur.ogg", duration = 0.447 },
  ["Stetson"] = { filename = "Stetson.ogg", duration = 0.547 },
  ["Wrath"] = { filename = "Wrath.ogg", duration = 0.431 },
  ["Heavy"] = { filename = "Heavy.ogg", duration = 0.360 },
  ["Trash"] = { filename = "Trash.ogg", duration = 0.601 },
  ["Cargo"] = { filename = "Cargo.ogg", duration = 0.459 },
  ["Ascot"] = { filename = "Ascot.ogg", duration = 0.533 },
  ["Grape"] = { filename = "Grape.ogg", duration = 0.421 },
  ["Slayer"] = { filename = "Slayer.ogg", duration = 0.546 },
  ["Strelka"] = { filename = "Strelka.ogg", duration = 0.569 },
  ["Skalpel"] = { filename = "Skalpel.ogg", duration = 0.569 },
  ["Rapier"] = { filename = "Rapier.ogg", duration = 0.483 },
  ["Pedro"] = { filename = "Pedro.ogg", duration = 0.421 },
  ["Raygun"] = { filename = "Raygun.ogg", duration = 0.494 },
  ["Heartless"] = { filename = "Heartless.ogg", duration = 0.549 },
  ["Viceroy"] = { filename = "Viceroy.ogg", duration = 0.636 },
  ["Cupcake"] = { filename = "Cupcake.ogg", duration = 0.508 },
  ["Fighting Tiger"] = { filename = "Fighting_Tiger.ogg", duration = 0.688 },
  ["Flying Ace"] = { filename = "Flying_Ace.ogg", duration = 0.746 },
  ["Buckeye"] = { filename = "Buckeye.ogg", duration = 0.451 },
  ["Goldplate"] = { filename = "Goldplate.ogg", duration = 0.635 },
  ["Phoenix"] = { filename = "Phoenix.ogg", duration = 0.534 },
  ["Electron"] = { filename = "Electron.ogg", duration = 0.600 },
  ["Rustler"] = { filename = "Rustler.ogg", duration = 0.436 },
  ["Vixen"] = { filename = "Vixen.ogg", duration = 0.405 },
  ["Jackal"] = { filename = "Jackal.ogg", duration = 0.449 },
  ["Milestone"] = { filename = "Milestone.ogg", duration = 0.605},
  ["Simca"] = { filename = "Simca.ogg", duration = 0.470 },
  ["Comet"] = { filename = "Comet.ogg", duration = 0.427 },
  ["Digger"] = { filename = "Digger.ogg", duration = 0.401 },
  ["Sabre"] = { filename = "Sabre.ogg", duration = 0.474 },
  ["Pirate"] = { filename = "Pirate.ogg", duration = 0.440 },
  ["Cannon"] = { filename = "Cannon.ogg", duration = 0.375 },
  ["Buckshot"] = { filename = "Buckshot.ogg", duration = 0.610 },
  ["Maple"] = { filename = "Maple.ogg", duration = 0.410 },
  ["Hellcat"] = { filename = "Hellcat.ogg", duration = 0.481 },
  ["Sundowner"] = { filename = "Sundowner.ogg", duration = 0.593 },
  ["Camelot"] = { filename = "Camelot.ogg", duration = 0.530 },
  ["Witchita"] = { filename = "Witchita.ogg", duration = 0.533 },
  ["Dog"] = { filename = "Dog.ogg", duration = 0.409 },
  ["Lion"] = { filename = "Lion.ogg", duration = 0.404 },
  ["Tomcat"] = { filename = "Tomcat.ogg", duration = 0.549 },
  ["Retro"] = { filename = "Retro.ogg", duration = 0.480 },
  ["Ghostrider"] = { filename = "Ghostrider.ogg", duration = 0.668 },
  ["Dealer"] = { filename = "Dealer.ogg", duration = 0.366 },
  ["Dagger"] = { filename = "Dagger.ogg", duration = 0.442 },
  ["Hammer"] = { filename = "Hammer.ogg", duration = 0.392 },
  ["Voodoo"] = { filename = "Voodoo.ogg", duration = 0.433 },
  ["Wildman"] = { filename = "Wildman.ogg", duration = 0.623 },
  ["Ugly"] = { filename = "Ugly.ogg", duration = 0.425 },
  ["Gunstar"] = { filename = "Gunstar.ogg", duration = 0.573 },
  ["Felix"] = { filename = "Felix.ogg", duration = 0.558 },
  ["Gypsy"] = { filename = "Gypsy.ogg", duration = 0.457 },
  ["Black"] = { filename = "Black.ogg", duration = 0.416 },
  ["Knight"] = { filename = "Knight.ogg", duration = 0.411 },
  ["Black Knight"] = { filename = "Black Knight.ogg", duration = 0.635 },
  ["Phantom"] = { filename = "Phantom.ogg", duration = 0.572 },
  ["Bogey"] = { filename = "Bogey.ogg", duration = 0.420 },
}
  
AI_ATC_SoundFiles.Departure.Callsigns = {
  ["Razor"] = { filename = "Razor.ogg", duration = 0.586 },
  ["Cylon"] = { filename = "Cylon.ogg", duration = 0.615 },
  ["Chaos"] = { filename = "Chaos.ogg", duration = 0.615 },
  ["Nightmare"] = { filename = "Nightmare.ogg", duration = 0.566 },
  ["Mig"] = { filename = "Mig.ogg", duration = 0.382 },
  ["Stalin"] = { filename = "Stalin.ogg", duration = 0.644 },
  ["Flanker"] = { filename = "Flanker.ogg", duration = 0.589 },
  ["Fulcrum"] = { filename = "Fulcrum.ogg", duration = 0.560 },
  ["Flogger"] = { filename = "Flogger.ogg", duration = 0.575 },
  ["Ivan"] = { filename = "Ivan.ogg", duration = 0.517 },
  ["GunFighter"] = { filename = "GunFighter.ogg", duration = 0.731 },
  ["Dragon"] = { filename = "Dragon.ogg", duration = 0.578 },
  ["Aspen"] = { filename = "Aspen.ogg", duration = 0.583 },
  ["Boar"] = { filename = "Boar.ogg", duration = 0.372 },
  ["Chevy"] = { filename = "Chevy.ogg", duration = 0.569 },
  ["Colt"] = { filename = "Colt.ogg", duration = 0.372 },
  ["Dodge"] = { filename = "Dodge.ogg", duration = 0.441 },
  ["Enfield"] = { filename = "Enfield.ogg", duration = 0.557 },
  ["Ford"] = { filename = "Ford.ogg", duration = 0.430 },
  ["Hawg"] = { filename = "Hawg.ogg", duration = 0.383 },
  ["Pig"] = { filename = "Pig.ogg", duration = 0.347 },
  ["Pontiac"] = { filename = "Pontiac.ogg", duration = 0.639 },
  ["Springfield"] = { filename = "SpringField.ogg", duration = 0.697 },
  ["Tusk"] = { filename = "Tusk.ogg", duration = 0.418 },
  ["Uzi"] = { filename = "Uzi.ogg", duration = 0.488 },
  ["Bone"] = { filename = "Bone.ogg", duration = 0.372 },
  ["Dark"] = { filename = "Dark.ogg", duration = 0.372 },
  ["Vader"] = { filename = "Vader.ogg", duration = 0.476 },
  ["Buff"] = { filename = "Buff.ogg", duration = 0.383 },
  ["Dump"] = { filename = "Dump.ogg", duration = 0.337 },
  ["Kenworth"] = { filename = "Kenworth.ogg", duration = 0.604 },
  ["Dude"] = { filename = "Dude.ogg", duration = 0.325 },
  ["Thud"] = { filename = "Thud.ogg", duration = 0.360 },
  ["Gunny"] = { filename = "Gunny.ogg", duration = 0.430 },
  ["Mad"] = { filename = "Mad.ogg", duration = 0.488 },
  ["Trek"] = { filename = "Trek.ogg", duration = 0.383 },
  ["Sniper"] = { filename = "Sniper.ogg", duration = 0.627 },
  ["Sled"] = { filename = "Sled.ogg", duration = 0.418 },
  ["Best"] = { filename = "Best.ogg", duration = 0.418 },
  ["Jazz"] = { filename = "Jazz.ogg", duration = 0.464 },
  ["Rage"] = { filename = "Rage.ogg", duration = 0.430 },
  ["Tahoe"] = { filename = "Tahoe.ogg", duration = 0.580 },
  ["Viper"] = { filename = "Viper.ogg", duration = 0.539 },
  ["Venom"] = { filename = "Venom.ogg", duration = 0.522 },
  ["Lobo"] = { filename = "Lobo.ogg", duration = 0.604 },
  ["Cowboy"] = { filename = "Cowboy.ogg", duration = 0.546 },
  ["Python"] = { filename = "Python.ogg", duration = 0.615 },
  ["Rattler"] = { filename = "Rattler.ogg", duration = 0.580 },
  ["Panther"] = { filename = "Panther.ogg", duration = 0.546 },
  ["Wolf"] = { filename = "Wolf.ogg", duration = 0.406 },
  ["Weasel"] = { filename = "Weasel.ogg", duration = 0.499 },
  ["Wild"] = { filename = "Wild.ogg", duration = 0.395 },
  ["Ninja"] = { filename = "Ninja.ogg", duration = 0.557 },
  ["Jedi"] = { filename = "Jedi.ogg", duration = 0.522 },
  ["Hornet"] = { filename = "Hornet.ogg", duration = 0.557 },
  ["Squid"] = { filename = "Squid.ogg", duration = 0.441 },
  ["Ragin"] = { filename = "Ragin.ogg", duration = 0.569 },
  ["Roman"] = { filename = "Roman.ogg", duration = 0.546 },
  ["Sting"] = { filename = "Sting.ogg", duration = 0.488 },
  ["Jury"] = { filename = "Jury.ogg", duration = 0.476 },
  ["Joker"] = { filename = "Joker.ogg", duration = 0.580 },
  ["Ram"] = { filename = "Ram.ogg", duration = 0.383 },
  ["Hawk"] = { filename = "Hawk.ogg", duration = 0.395 },
  ["Devil"] = { filename = "Devil.ogg", duration = 0.546 },
  ["Check"] = { filename = "Check.ogg", duration = 0.372 },
  ["Snake"] = { filename = "Snake.ogg", duration = 0.450 }, 
  ["ArmyAir"] = { filename = "ArmyAir.ogg", duration = 0.714 },
  ["Apache"] = { filename = "Apache.ogg", duration = 0.717 },
  ["Crow"] = { filename = "Crow.ogg", duration = 0.370 },
  ["Sioux"] = { filename = "Sioux.ogg", duration = 0.408 },
  ["Gatling"] = { filename = "Gatling.ogg", duration = 0.550 },
  ["Gunslinger"] = { filename = "Gunslinger.ogg", duration = 0.710 },
  ["Hammerhead"] = { filename = "Hammerhead.ogg", duration = 0.714 },
  ["Bootleg"] = { filename = "Bootleg.ogg", duration = 0.538 },
  ["Palehorse"] = { filename = "Palehorse.ogg", duration = 0.681 },
  ["Carnivore"] = { filename = "Carnivore.ogg", duration = 0.731 },
  ["Saber"] = { filename = "Saber.ogg", duration = 0.567 },
  ["Azrael"] = { filename = "Saber.ogg", duration = 0.554 },
  ["Bam-Bam"] = { filename = "Bam-Bam.ogg", duration = 0.628 },
  ["Burnin' Stogie"] = { filename = "Burnin' Stogie.ogg", duration = 0.843 },
  ["Crazyhorse"] = { filename = "Crazyhorse.ogg", duration = 0.830 },
  ["Crusader"] = { filename = "Crusader.ogg", duration = 0.734 },
  ["Darkhorse"] = { filename = "Darkhorse.ogg", duration = 0.656 },
  ["Eagle"] = { filename = "Eagle.ogg", duration = 0.527 },
  ["Lighthorse"] = { filename = "Lighthorse.ogg", duration = 0.652 },
  ["Mustang"] = { filename = "Mustang.ogg", duration = 0.598 },
  ["Outcast"] = { filename = "Outcast.ogg", duration = 0.631 },
  ["Pegasus"] = { filename = "Pegasus.ogg", duration = 0.747 },
  ["Pistol"] = { filename = "Pistol.ogg", duration = 0.562 },
  ["Roughneck"] = { filename = "Roughneck.ogg", duration = 0.562 },
  ["Shamus"] = { filename = "Shamus.ogg", duration = 0.623 },
  ["Spur"] = { filename = "Spur.ogg", duration = 0.448 },
  ["Stetson"] = { filename = "Stetson.ogg", duration = 0.657 },
  ["Wrath"] = { filename = "Wrath.ogg", duration = 0.377 },
  ["Heavy"] = { filename = "Heavy.ogg", duration = 0.525 },
  ["Trash"] = { filename = "Trash.ogg", duration = 0.505 },
  ["Cargo"] = { filename = "Cargo.ogg", duration = 0.456 },
  ["Ascot"] = { filename = "Ascot.ogg", duration = 0.546 },
  ["Grape"] = { filename = "Grape.ogg", duration = 0.403 },
  ["Slayer"] = { filename = "Slayer.ogg", duration = 0.554 },
  ["Strelka"] = { filename = "Strelka.ogg", duration = 0.673 },
  ["Skalpel"] = { filename = "Skalpel.ogg", duration = 0.656 },
  ["Rapier"] = { filename = "Rapier.ogg", duration = 0.627 },
  ["Pedro"] = { filename = "Pedro.ogg", duration = 0.554 },
  ["Raygun"] = { filename = "Raygun.ogg", duration = 0.539 },
  ["Heartless"] = { filename = "Heartless.ogg", duration = 0.884 },
  ["Viceroy"] = { filename = "Viceroy.ogg", duration = 0.569 },
  ["Cupcake"] = { filename = "Cupcake.ogg", duration = 0.801 },
  ["Fighting Tiger"] = { filename = "Fighting_Tiger.ogg", duration = 0.807 },
  ["Flying Ace"] = { filename = "Flying_Ace.ogg", duration = 0.874 },
  ["Buckeye"] = { filename = "Buckeye.ogg", duration = 0.497 },
  ["Goldplate"] = { filename = "Goldplate.ogg", duration = 0.539 },
  ["Phoenix"] = { filename = "Phoenix.ogg", duration = 0.635 },
  ["Electron"] = { filename = "Electron.ogg", duration = 0.768 },
  ["Rustler"] = { filename = "Rustler.ogg", duration = 0.646 },
  ["Vixen"] = { filename = "Vixen.ogg", duration = 0.578 },
  ["Jackal"] = { filename = "Jackal.ogg", duration = 0.506 },
  ["Milestone"] = { filename = "Milestone.ogg", duration = 0.661},
  ["Simca"] = { filename = "Simca.ogg", duration = 0.650 },
  ["Comet"] = { filename = "Comet.ogg", duration = 0.662 },
  ["Digger"] = { filename = "Digger.ogg", duration = 0.481 },
  ["Sabre"] = { filename = "Sabre.ogg", duration = 0.519 },
  ["Pirate"] = { filename = "Pirate.ogg", duration = 0.533 },
  ["Cannon"] = { filename = "Cannon.ogg", duration = 0.541 },
  ["Buckshot"] = { filename = "Buckshot.ogg", duration = 0.597 },
  ["Maple"] = { filename = "Maple.ogg", duration = 0.482 },
  ["Hellcat"] = { filename = "Hellcat.ogg", duration = 0.572 },
  ["Sundowner"] = { filename = "Sundowner.ogg", duration = 0.737 },
  ["Camelot"] = { filename = "Camelot.ogg", duration = 0.724 },
  ["Witchita"] = { filename = "Witchita.ogg", duration = 0.813 },
  ["Dog"] = { filename = "Dog.ogg", duration = 0.343 },
  ["Lion"] = { filename = "Lion.ogg", duration = 0.550 },
  ["Tomcat"] = { filename = "Tomcat.ogg", duration = 0.598 },
  ["Retro"] = { filename = "Retro.ogg", duration = 0.557 },
  ["Ghostrider"] = { filename = "Ghostrider.ogg", duration = 0.716 },
  ["Dealer"] = { filename = "Dealer.ogg", duration = 0.467 },
  ["Dagger"] = { filename = "Dagger.ogg", duration = 0.509 },
  ["Hammer"] = { filename = "Hammer.ogg", duration = 0.482 },
  ["Voodoo"] = { filename = "Voodoo.ogg", duration = 0.541 },
  ["Wildman"] = { filename = "Wildman.ogg", duration = 0.662 },
  ["Ugly"] = { filename = "Ugly.ogg", duration = 0.600 },
  ["Gunstar"] = { filename = "Gunstar.ogg", duration = 0.607 },
  ["Felix"] = { filename = "Felix.ogg", duration = 0.639 },
  ["Gypsy"] = { filename = "Gypsy.ogg", duration = 0.563 },
  ["Black"] = { filename = "Black.ogg", duration = 0.404 },
  ["Knight"] = { filename = "Knight.ogg", duration = 0.351 },
  ["Black Knight"] = { filename = "Black Knight.ogg", duration = 0.670 },
  ["Phantom"] = { filename = "Phantom.ogg", duration = 0.766 },
  ["Bogey"] = { filename = "Bogey.ogg", duration = 0.592 },
}

AI_ATC_NatoTime = {
  [1] = "Alpha",
  [2] = "Bravo",
  [3] = "Charlie",
  [4] = "Delta",
  [5] = "Echo",
  [6] = "Foxtrot",
  [7] = "Golf",
  [8] = "Hotel",
  [9] = "India",
  [10] = "Juliett",
  [11] = "Kilo",
  [12] = "Lima",
  [13] = "Mike",
  [14] = "November",
  [15] = "Oscar",
  [16] = "Papa",
  [17] = "Quebec",
  [18] = "Romeo",
  [19] = "Sierra",
  [20] = "Tango",
  [21] = "Uniform",
  [22] = "Victor",
  [23] = "Whiskey",
  [24] = "Xray",
  [25] = "Yankee",
  [26] = "Zulu"
}

AI_ATC_CloudPresets = {
  [""] = { Cloud = "Clear clouds", Rain = "No significant weather", Humidity = 30 },
  ["Preset1"] = { Cloud = "Few clouds", Rain = "No significant weather", Humidity = 40 },
  ["Preset2"] = { Cloud = "Few clouds", Rain = "No significant weather", Humidity = 40 },
  ["Preset3"] = { Cloud = "Scattered clouds", Rain = "No significant weather", Humidity = 50 },
  ["Preset4"] = { Cloud = "Scattered clouds", Rain = "No significant weather", Humidity = 50 },
  ["Preset5"] = { Cloud = "Scattered clouds", Rain = "No significant weather", Humidity = 50 },
  ["Preset6"] = { Cloud = "Scattered clouds", Rain = "No significant weather", Humidity = 50 },
  ["Preset7"] = { Cloud = "Scattered clouds", Rain = "No significant weather", Humidity = 50 },
  ["Preset8"] = { Cloud = "Scattered clouds", Rain = "No significant weather", Humidity = 50 },
  ["Preset9"] = { Cloud = "Scattered clouds", Rain = "No significant weather", Humidity = 50 },
  ["Preset10"] = { Cloud = "Scattered clouds", Rain = "No significant weather", Humidity = 50 },
  ["Preset11"] = { Cloud = "Scattered clouds", Rain = "No significant weather", Humidity = 50 },
  ["Preset12"] = { Cloud = "Scattered clouds", Rain = "No significant weather", Humidity = 50 },
  ["Preset13"] = { Cloud = "Broken clouds", Rain = "No significant weather", Humidity = 60 },
  ["Preset14"] = { Cloud = "Broken clouds", Rain = "No significant weather", Humidity = 60 },
  ["Preset15"] = { Cloud = "Broken clouds", Rain = "No significant weather", Humidity = 60 },
  ["Preset16"] = { Cloud = "Broken clouds", Rain = "No significant weather", Humidity = 60 },
  ["Preset17"] = { Cloud = "Broken clouds", Rain = "No significant weather", Humidity = 60 },
  ["Preset18"] = { Cloud = "Broken clouds", Rain = "No significant weather", Humidity = 60 },
  ["Preset19"] = { Cloud = "Broken clouds", Rain = "No significant weather", Humidity = 60 },
  ["Preset20"] = { Cloud = "Broken clouds", Rain = "No significant weather", Humidity = 60 },
  ["Preset21"] = { Cloud = "Solid Cloud Layer", Rain = "No significant weather", Humidity = 70 },
  ["Preset22"] = { Cloud = "Solid Cloud Layer", Rain = "No significant weather", Humidity = 70 },
  ["Preset23"] = { Cloud = "Solid Cloud Layer", Rain = "No significant weather", Humidity = 70 },
  ["Preset24"] = { Cloud = "Solid Cloud Layer", Rain = "No significant weather", Humidity = 70 },
  ["Preset25"] = { Cloud = "Solid Cloud Layer", Rain = "No significant weather", Humidity = 70 },
  ["Preset26"] = { Cloud = "Solid Cloud Layer", Rain = "No significant weather", Humidity = 70 },
  ["Preset27"] = { Cloud = "Solid Cloud Layer", Rain = "No significant weather", Humidity = 70 },
  ["RainyPreset1"] = { Cloud = "Solid Cloud Layer", Rain = "Moderate rain", Humidity = 90 },
  ["RainyPreset2"] = { Cloud = "Solid Cloud Layer", Rain = "Moderate rain", Humidity = 90 },
  ["RainyPreset3"] = { Cloud = "Solid Cloud Layer", Rain = "Heavy rain", Humidity = 95 },
  ["RainyPreset4"] = { Cloud = "Solid Cloud Layer", Rain = "Light rain", Humidity = 85 },
  ["RainyPreset5"] = { Cloud = "Broken clouds", Rain = "Light rain", Humidity = 85 },
  ["RainyPreset6"] = { Cloud = "Broken clouds", Rain = "Light rain", Humidity = 85 },
  ["NEWRAINPRESET4"] = { Cloud = "Broken clouds", Rain = "Light rain", Humidity = 85 }
}
AI_ATC_SoundFiles.ATIS.Airbase = {
  ["Andersen"] = { filename = "Andersen.ogg", duration = 1.550 },
  ["Nellis"] = { filename = "Nellis.ogg", duration = 1.318 },
  ["Incirlik"] = { filename = "Incirlik.ogg", duration = 1.533 },
}

AI_ATC_SoundFiles.Ground.Airbase = {
  ["Andersen"] = { filename = "Andersen.ogg", duration = 0.476 },
  ["Nellis"] = { filename = "Nellis.ogg", duration = 0.395 },
  ["Incirlik"] = { filename = "Incirlik.ogg", duration = 0.685 },
}

AI_ATC_SoundFiles.Departure.Airbase = {
  ["Andersen"] = { filename = "Andersen.ogg", duration = 0.464 },
  ["Nellis"] = { filename = "Nellis.ogg", duration = 0.383 },
  ["Incirlik"] = { filename = "Incirlik.ogg", duration = 0.488 },
}

ATM = {
  RunwayOccupied = {},
}

ATM.ClientData = {}

ATM.AiData = {}

ATM.GroundControl ={}
       
ATM.TaxiQueue ={}

ATM.TaxiController = {}

ATM.TowerControl = {}

GENERIC_TRANSMITTER = {
  ["visible"] = false,
  ["lateActivation"] = false,
  ["taskSelected"] = true,
  ["route"] = {},
  ["groupId"] = 2,
  ["tasks"] = {},
  ["hidden"] = true,
  ["units"] = {
    [1] = {
      ["type"] = "TACAN_beacon",
      ["transportable"] = {
        ["randomTransportable"] = false,
      },
      ["unitId"] = 2,
      ["skill"] = "Average",
      ["y"] = -17210.511718656,
      ["x"] = -399080.06249991,
      ["name"] = "Nellis_ATIS",
      ["playerCanDrive"] = false,
      ["heading"] = 47,
    },
  },
  ["y"] = -17210.511718656,
  ["x"] = -399080.06249991,
  ["name"] = "Nellis_ATIS",
  ["start_time"] = 0,
  ["task"] = "Ground Nothing",
}

NAVAL_TRANSMITTER = 
{
  ["visible"] = false,
  ["route"] = 
    {
      ["points"] = 
      {
        [1] = 
        {
          ["alt"] = -0,
          ["type"] = "Turning Point",
          ["ETA"] = 0,
          ["alt_type"] = "BARO",
          ["formation_template"] = "",
          ["y"] = -120527.14285714,
          ["x"] = 46142.857142857,
          ["ETA_locked"] = true,
          ["speed"] = 0,
          ["action"] = "Turning Point",
          ["task"] = 
          {
            ["id"] = "ComboTask",
            ["params"] = 
            {
              ["tasks"] = {},
            }, -- end of ["params"]
          }, -- end of ["task"]
          ["speed_locked"] = true,
        }, -- end of [1]
      }, -- end of ["points"]
    }, -- end of ["route"]
  ["groupId"] = 1,
  ["tasks"] = 
  {
  }, -- end of ["tasks"]
  ["hidden"] = true,
  ["units"] = 
  {
    [1] = 
    {
      ["type"] = "speedboat",
      ["transportable"] = 
      {
        ["randomTransportable"] = false,
      }, -- end of ["transportable"]
      ["unitId"] = 1,
      ["skill"] = "Average",
      ["y"] = 530982.53257143,
      ["x"] = -311604.89142857,
      ["name"] = "Naval-1-1",
      ["heading"] = 4.98762867342,
      ["modulation"] = 0,
      ["frequency"] = 127500000,
    }, -- end of [1]

  }, -- end of ["units"]
  ["y"] = 530982.53257143,
  ["uncontrollable"] = false,
  ["name"] = "Naval-1",
  ["start_time"] = 0,
  ["x"] = -311604.89142857,
} 

AI_ATC_Transmitters = {
  [1] = {COMM1 = "COMM1Transmitter-1", COMM2 = "COMM2Transmitter-1", Repeater = "Repeater-1"},
  [2] = {COMM1 = "COMM1Transmitter-2", COMM2 = "COMM2Transmitter-2", Repeater = "Repeater-2"},
  [3] = {COMM1 = "COMM1Transmitter-3", COMM2 = "COMM2Transmitter-3", Repeater = "Repeater-3"},
  [4] = {COMM1 = "COMM1Transmitter-4", COMM2 = "COMM2Transmitter-4", Repeater = "Repeater-4"},
  [5] = {COMM1 = "COMM1Transmitter-5", COMM2 = "COMM2Transmitter-5", Repeater = "Repeater-5"},
  [6] = {COMM1 = "COMM1Transmitter-6", COMM2 = "COMM2Transmitter-6", Repeater = "Repeater-6"},
  [7] = {COMM1 = "COMM1Transmitter-7", COMM2 = "COMM2Transmitter-7", Repeater = "Repeater-7"},
  [8] = {COMM1 = "COMM1Transmitter-8", COMM2 = "COMM2Transmitter-8", Repeater = "Repeater-8"},
  [9] = {COMM1 = "COMM1Transmitter-9", COMM2 = "COMM2Transmitter-9", Repeater = "Repeater-9"},
  [10] = {COMM1 = "COMM1Transmitter-10", COMM2 = "COMM2Transmitter-10", Repeater = "Repeater-10"},
  [11] = {COMM1 = "COMM1Transmitter-11", COMM2 = "COMM2Transmitter-11", Repeater = "Repeater-11"},
  [12] = {COMM1 = "COMM1Transmitter-12", COMM2 = "COMM2Transmitter-12", Repeater = "Repeater-12"},
  [13] = {COMM1 = "COMM1Transmitter-13", COMM2 = "COMM2Transmitter-13", Repeater = "Repeater-13"},
  [14] = {COMM1 = "COMM1Transmitter-14", COMM2 = "COMM2Transmitter-14", Repeater = "Repeater-14"},
  [15] = {COMM1 = "COMM1Transmitter-15", COMM2 = "COMM2Transmitter-15", Repeater = "Repeater-15"},
  [16] = {COMM1 = "COMM1Transmitter-16", COMM2 = "COMM2Transmitter-16", Repeater = "Repeater-16"},
}

-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--*****************************************************************************ATC INITIALIZATION********************************************************************************--
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
do local Coord = AI_ATC_Airbase:GetCoordinate()
  if Coord:IsDay()==true then
    AI_ATC.Procedure = "VFR"
  elseif AI_ATC.Procedure==false then
    AI_ATC.Procedure = "IFR"
  end
end
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--***************************************************************************GLOBAL COROUTINE SCHEDULE***************************************************************************--
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
ATC_Coroutine = {
  CoroutineList     = {},
  MaxExecutionTime  = 0.01,
  YieldInterval     = 0.1,
  Scheduler         = nil
}

local function TracebackErrorHandler(err)
  return debug.traceback("Coroutine Error: " .. tostring(err), 2)
end

function ATC_Coroutine:AddCoroutine(func, checkInterval, ...)
  if type(checkInterval) ~= "number" then
    checkInterval = self.YieldInterval
  end

  local args = {...}
  local co

  local status, err = xpcall(function()
    co = coroutine.create(function()
      return func(unpack(args))
    end)
  end, TracebackErrorHandler)

  if not status then
    env.error(err, false)
    return
  end

  table.insert(self.CoroutineList, {
    co             = co,
    checkInterval  = checkInterval,
    lastCheckTime  = timer.getTime(),
  })
  if not self.Scheduler then
    self:Start()
  end
end

function ATC_Coroutine:ManageCoroutines()
  local currentTime = timer.getTime()
  local i = 1

  while i <= #self.CoroutineList do
    local coroutineData = self.CoroutineList[i]
    local co            = coroutineData.co
    if coroutine.status(co) == "dead" then
      table.remove(self.CoroutineList, i)
    else
      if (currentTime - coroutineData.lastCheckTime) >= coroutineData.checkInterval then
        local startTime = timer.getTime()

        local status, retval = xpcall(function()
          return coroutine.resume(co)
        end, TracebackErrorHandler)

        local endTime       = timer.getTime()
        local executionTime = endTime - startTime

        if not status then
          env.error(retval, false)
          table.remove(self.CoroutineList, i)
        else
          coroutineData.lastCheckTime = currentTime
          if coroutine.status(co) == "dead" then
            table.remove(self.CoroutineList, i)
          else
            i = i + 1
          end
        end

        if executionTime > self.MaxExecutionTime then
          env.warning(string.format("[ATC_Coroutine] WARNING: Coroutine took %.4f s, exceeding max of %.4f s",executionTime, self.MaxExecutionTime), false)
        end
      else
        i = i + 1
      end
    end
  end

  if #self.CoroutineList == 0 then
    self:Stop()
  end
end

function ATC_Coroutine:Start()
  if not self.Scheduler then
    self.Scheduler = SCHEDULER:New(
      nil,
      function()
        self:ManageCoroutines()
      end,
      {},
      self.YieldInterval,
      self.YieldInterval
    )
  end
end

function ATC_Coroutine:Stop()
  if self.Scheduler then
    self.Scheduler:Stop()
    self.Scheduler = nil
  end
end

-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--***************************************************************************EXTRACT ZONE VERTICES*******************************************************************************--
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function SaveVerticesToFile(ZoneObject, filename)
  if io then
    local Path = "C:\\Users\\Avala\\Saved Games\\DCS.openbeta\\Mods\\"
    local Vertices = ZoneObject:GetVerticiesCoordinates() -- Get vertices from the zone

    -- Function to serialize only Vec3 data (x, y, z) into Lua code
    local function SerializeVec3Table(val, name, depth)
      local tmp = string.rep(" ", depth * 2)
      
      -- If there is a name, format it correctly as a table key
      if name then
        if type(name) == "number" then
          tmp = tmp .. "[" .. name .. "] = "
        else
          tmp = tmp .. '["' .. name .. '"] = '
        end
      end

      -- Serialize the Vec3 data (x, y, z)
      if type(val) == "table" and val.x and val.y and val.z then
        tmp = tmp .. string.format("{x = %.6f, y = %.6f, z = %.6f}", val.x, val.y, val.z)
      end
      
      return tmp
    end
    
    -- Serialize only the x, y, z values of the vertices into a Lua-compatible string
    local serializedData = "local vertices = {\n"
    for i, vertex in ipairs(Vertices) do
      serializedData = serializedData .. SerializeVec3Table(vertex, i, 1) .. ",\n"
    end
    serializedData = serializedData .. "}\nreturn vertices"
    
    -- Attempt to write the serialized data to the file
    local fullPath = Path .. "\\" .. filename
    local file, err = io.open(fullPath, "w")
    if not file then
      env.info("Error opening file for writing: " .. err)
      return false
    end
    
    file:write(serializedData)
    file:close()
    
    env.info("Successfully saved vertices data (Vec3) to " .. fullPath)
    return true
  else
    env.info("*****Note - Mission Lua Environment is Sanitised, Some features unavailable.")
    return false
  end
end
-- Example usage

--local ZoneObject = ZONE_POLYGON:New("TAXIWAY_NOVEMBER", GROUP:FindByName("TAXIWAY_NOVEMBER"))
--SaveVerticesToFile(ZoneObject, "TAXIWAY_NOVEMBER.lua")

--local ZoneObject = ZONE_POLYGON:New("RUNWAY_05", GROUP:FindByName("RUNWAY_05"))
--SaveVerticesToFile(ZoneObject, "RUNWAY_05.lua")
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--***************************************************************************PRE CALCULATE TERMINAL COORDS***********************************************************************--
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function AI_ATC:PrecalculateCoords(filename)
  if AI_ATC.TerminalCoordinates then
    env.info("AI_ATC.TerminalCoordinates already exists, not reinitializing.")
  else
    env.info("AI_ATC.TerminalCoordinates does not exist, initializing with default values.")
  end

  AI_ATC.TerminalCoordinates = AI_ATC.TerminalCoordinates or {
    ["Alpha"] = {November = {}, Siera = {}},
    ["Bravo"] = {Siera = {}},
    ["Charlie"] = {November = {}, Siera = {}},
    ["Delta"] = {November = {}, Siera = {}},
    ["Echo"] = {November = {}, Siera = {}},

    ["Golf"] = {Alpha = {}, Hotel = {}, November = {}},
    ["Hotel"] = {Golf = {}, India = {}},
    ["India"] = {Hotel = {}, November = {}},
    ["November"] = {Alpha = {}, Charlie ={}, Delta = {}, Echo = {}, Golf = {}, India = {}},
    ["Siera"] = {Alpha = {}, Bravo = {}, Charlie ={}, Delta = {}, Echo = {}, Victor = {}},
  }
  
  for startTaxiway, connections in pairs(AI_ATC.TerminalCoordinates) do
    local PrimaryVertices = AI_ATC.TaxiWay[startTaxiway].Zone

    for endTaxiway, _ in pairs(connections) do
      local TerminalVertices = AI_ATC.TaxiWay[endTaxiway].Zone
      local shortestDistance = math.huge
      local TerminalCoord = nil

      if PrimaryVertices and TerminalVertices then
        for _, primaryVertex in ipairs(PrimaryVertices) do
          for _, terminalVertex in ipairs(TerminalVertices) do
            local distance = primaryVertex:Get2DDistance(terminalVertex)
            if distance < shortestDistance then
              shortestDistance = distance
              TerminalCoord = {x = terminalVertex.x, y = terminalVertex.y, z = terminalVertex.z}
            end
          end
        end
      end
      AI_ATC.TerminalCoordinates[startTaxiway][endTaxiway] = TerminalCoord
    end
  end

  return self:SaveTableToFile(AI_ATC.TerminalCoordinates, filename)
end

function AI_ATC:SaveTableToFile(tbl, filename)
  if io then
    local Path = "C:\\Users\\Avala\\Saved Games\\DCS.openbeta\\Mods\\"

    local function SerializeTable(val, name, depth)
      local tmp = string.rep(" ", depth * 2)
      if name then
        if type(name) == "number" then
          tmp = tmp .. "[" .. name .. "] = "
        else
          tmp = tmp .. '["' .. name .. '"] = '
        end
      end

      if type(val) == "table" and not (val.x and val.y and val.z) then
        tmp = tmp .. "{\n"
        for k, v in pairs(val) do
          tmp = tmp .. SerializeTable(v, k, depth + 1) .. ",\n"
        end
        tmp = tmp .. string.rep(" ", depth * 2) .. "}"
      elseif type(val) == "table" and val.x and val.y and val.z then
        tmp = tmp .. string.format("{x = %.6f, y = %.6f, z = %.6f}", val.x, val.y, val.z)
      elseif type(val) == "number" then
        tmp = tmp .. string.format("%.6f", val)
      else
        tmp = tmp .. tostring(val)
      end
      return tmp
    end
    local serializedData = "local ATC_TerminalCoordinates = {\n"
    serializedData = serializedData .. SerializeTable(tbl, nil, 1)
    serializedData = serializedData .. "\n}\nreturn ATC_TerminalCoordinates"

    local fullPath = Path .. "\\" .. filename
    local file, err = io.open(fullPath, "w")
    if not file then
      env.info("Error opening file for writing: " .. err)
      return false
    end
    
    file:write(serializedData)
    file:close()
    
    env.info("Successfully saved terminal coordinates to " .. fullPath)
    return true
  else
    env.info("*****Note - Mission Lua Environment is Sanitised, Some features unavailable.")
    return false
  end
end

--SCHEDULER:New(nil, function()
  --AI_ATC:PrecalculateCoords("TerminalCoords.lua")
--end,{}, 2 )
--AI_ATC:PrecalculateCoords("TerminalCoords.lua")
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--***************************************************************************INITIALISE TAXIWAY TABLE****************************************************************************--
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function AI_ATC:CoordConstructor(inputTable)
  local coords = {}

  ATC_Coroutine:AddCoroutine(function()
    local batchSize = 10
    local i = 1

    while i <= #inputTable do
      for j = i, math.min(i + batchSize - 1, #inputTable) do
        local vec3 = inputTable[j]
        local coord = COORDINATE:NewFromVec3({x = vec3.x, y = vec3.y, z = vec3.z})
        table.insert(coords, coord)
      end
      i = i + batchSize
      coroutine.yield()
    end
  end)

  return coords
end

function AI_ATC:InitTaxiwayCoords()
  for taxiwayName, taxiwayData in pairs(AI_ATC.TaxiWay) do
    local zoneData = taxiwayData.Zone
    local coordinates = AI_ATC:CoordConstructor(zoneData)
    AI_ATC.TaxiWay[taxiwayName].Zone = coordinates
  end
end

AI_ATC:InitTaxiwayCoords()

RUNWAY_05 = AI_ATC:CoordConstructor(RUNWAY_05)

AI_ATC_Vec3 = COORDINATE:NewFromVec3({x=221287.921875, y=58.360279083252, z=-35121.20703125})
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--******************************************************************************EXTRACT ZONE DATA********************************************************************************--
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function AI_ATC:ExtractNavpointCoordinatesAndSave()
  local NavpointCoordinates = {}

  for navpointName, zoneObject in pairs(AI_ATC_Navpoints) do
    local vec2 = zoneObject:GetVec2()
    NavpointCoordinates[navpointName] = {x = vec2.x, y = vec2.y}
  end

  AI_ATC:SaveTableToFile(NavpointCoordinates, "NavpointCoordinates.lua")
end
--AI_ATC:ExtractNavpointCoordinatesAndSave()
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--******************************************************************************GENERATE NAVPOINTS*******************************************************************************--
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function AI_ATC:GenerateNavpoints()
  local startTime = timer.getTime()
  local dateStr = UTILS.GetDCSMissionDate()
  local y, m, d = dateStr:match("^(%d+)/(%d+)/(%d+)$")
  y, m, d = tonumber(y), tonumber(m), tonumber(d)

  if not (y and m and d) then
    env.info("[AI_ATC] Mission date string '"..tostring(dateStr).."' is invalid.")
    return
  end

  local missionNum = y * 10000 + m * 100 + d
  
  local function GetMagDec(year)
    local v = (year and AI_ATC_MagDec and AI_ATC_MagDec[year]) or nil
    if v ~= nil then
      AI_ATC.MagDec = v
      env.info(string.format("[AI_ATC] Mission Date (%s) MagDec set from table: %.1f", dateStr, AI_ATC.MagDec))
    else
      AI_ATC.MagDec = 5.9
      env.info(string.format("[AI_ATC] Mission Date (%s) MagDec missing; using fallback: %.1f", dateStr, AI_ATC.MagDec))
    end
  end

  GetMagDec(y)

  ATC_Coroutine:AddCoroutine(function()
    local batchSize = 10  
    local count = 0

    for navpointName, coordData in pairs(AI_ATC_Navpoints) do
      AI_ATC_Navpoints[navpointName] = ZONE_RADIUS:New(navpointName, coordData, 16, false)
      count = count + 1
      
      if count==batchSize then
        count = 0
        coroutine.yield()
      end
    end
    local endTime = timer.getTime() 
    local elapsedTime = endTime - startTime
    env.info(string.format("Completed processing all navpoints in %.2f seconds.", elapsedTime))
    
    ATC_Coroutine:AddCoroutine(function()
      AI_ATC:GenerateSID()
      --coroutine.yield()
      --AI_ATC:GenerateVFR()
      --coroutine.yield()
      AI_ATC:GeneratePlates()
      --coroutine.yield()
      AI_ATC:GenerateCharts()
    end)
    --UTILS.PrintTableToLog(AI_ATC_Navpoints, 2, false)
  end)
end

AI_ATC:GenerateNavpoints()
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--******************************************************************************SPAWN TRANSMITTERS*******************************************************************************--
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--AI_ATC_Transmitter_Data = AI_ATC:CoordConstructor(AI_ATC_Transmitter_Data)
--AI_ATC_Repeater_Data = AI_ATC:CoordConstructor(AI_ATC_Repeater_Data)

local Template = GENERIC_TRANSMITTER
Template.name = "Incirlik_ATIS"
Template.x = ATIS_Coord.x
Template.y = ATIS_Coord.y
Template.units[1].x = ATIS_Coord.x
Template.units[1].y = ATIS_Coord.y
Template.units[1].name = "Incirlik_ATIS"
coalition.addGroup(country.id.CJTF_BLUE, Group.Category.GROUND, Template)

local Template = GENERIC_TRANSMITTER
Template.name = "Incirlik_Tower"
Template.x = Tower_Coord.x
Template.y = Tower_Coord.y
Template.units[1].x = Tower_Coord.x
Template.units[1].y = Tower_Coord.y
Template.units[1].name = "Incirlik_Tower"
coalition.addGroup(country.id.CJTF_BLUE, Group.Category.GROUND, Template)

local Template = GENERIC_TRANSMITTER
Template.name = "Incirlik_Ground"
Template.x = Ground_Coord.x
Template.y = Ground_Coord.y
Template.units[1].x = Ground_Coord.x
Template.units[1].y = Ground_Coord.y
Template.units[1].name = "Incirlik_Ground"
coalition.addGroup(country.id.CJTF_BLUE, Group.Category.GROUND, Template)

local Template = GENERIC_TRANSMITTER
Template.name = "Incirlik_Approach"
Template.x = Approach_Coord.x
Template.y = Approach_Coord.y
Template.units[1].x = Approach_Coord.x
Template.units[1].y = Approach_Coord.y
Template.units[1].name = "Incirlik_Approach"
coalition.addGroup(country.id.CJTF_BLUE, Group.Category.GROUND, Template)

local Template = GENERIC_TRANSMITTER
Template.name = "Incirlik_Departure"
Template.x = Departure_Coord.x
Template.y = Departure_Coord.y
Template.units[1].x = Departure_Coord.x
Template.units[1].y = Departure_Coord.y
Template.units[1].name = "Incirlik_Departure"
coalition.addGroup(country.id.CJTF_BLUE, Group.Category.GROUND, Template)

local Template = GENERIC_TRANSMITTER
Template.name = "Incirlik_Clearance"
Template.x = Clearance_Coord.x
Template.y = Clearance_Coord.y
Template.units[1].x = Clearance_Coord.x
Template.units[1].y = Clearance_Coord.y
Template.units[1].name = "Incirlik_Clearance"
coalition.addGroup(country.id.CJTF_BLUE, Group.Category.GROUND, Template)

local Template = GENERIC_TRANSMITTER
Template.name = "ATIS_Repeater"
Template.x = ATIS_REPEATER_Coord.x
Template.y = ATIS_REPEATER_Coord.y
Template.units[1].x = ATIS_REPEATER_Coord.x
Template.units[1].y = ATIS_REPEATER_Coord.y
Template.units[1].name = "ATIS_Repeater"
coalition.addGroup(country.id.CJTF_BLUE, Group.Category.GROUND, Template)

local Template = GENERIC_TRANSMITTER
Template.name = "Generic_Repeater"
Template.x = Generic_Repeater_Coord.x
Template.y = Generic_Repeater_Coord.y
Template.units[1].x = Generic_Repeater_Coord.x
Template.units[1].y = Generic_Repeater_Coord.y
Template.units[1].name = "Generic_Repeater"
coalition.addGroup(country.id.CJTF_BLUE, Group.Category.GROUND, Template)


for index, transmitterData in pairs(AI_ATC_Transmitters) do
  local CoordData = AI_ATC_Transmitter_Data[index]
  local Template
  if index >11 then
    Template = NAVAL_TRANSMITTER
  else
    Template = GENERIC_TRANSMITTER
  end
  Template.name = string.format("Transmitter-%s", index)
  Template.visible = false
  Template.x = CoordData.x
  Template.y = CoordData.z
  Template.units[1].x = CoordData.x
  Template.units[1].y = CoordData.z
  Template.units[1].name = string.format("Transmitter-%s", index)
  
  --local Coord = COORDINATE:NewFromVec3(CoordData)
  --Coord:MarkToAll(Template.name)
  
  if index >11 then
    coalition.addGroup(country.id.CJTF_BLUE, Group.Category.SHIP, Template)
  else
    coalition.addGroup(country.id.CJTF_BLUE, Group.Category.GROUND, Template)
  end
  AI_ATC_Transmitters[index].COMM1 = Template.units[1].name
end

for index, transmitterData in pairs(AI_ATC_Transmitters) do
  local CoordData = AI_ATC_Repeater_Data[index]
  local Template
  if index >11 then
    Template = NAVAL_TRANSMITTER
  else
    Template = GENERIC_TRANSMITTER
  end
  Template.name = string.format("Repeater-%s", index)
  Template.visible = false
  Template.x = CoordData.x
  Template.y = CoordData.z
  Template.units[1].x = CoordData.x
  Template.units[1].y = CoordData.z
  Template.units[1].name = string.format("Repeater-%s", index)
  if index >11 then
    coalition.addGroup(country.id.CJTF_BLUE, Group.Category.SHIP, Template)
  else
    coalition.addGroup(country.id.CJTF_BLUE, Group.Category.GROUND, Template)
  end
  AI_ATC_Transmitters[index].Repeater = Template.units[1].name
end
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--***********************************************************************INITIALISE TERMINAL COORDINATES*************************************************************************--
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function AI_ATC:ConvertTerminalCoordinates()
  for startTaxiway, destinations in pairs(AI_ATC_TerminalCoordinates) do
    for endTaxiway, vec3Data in pairs(destinations) do
      AI_ATC_TerminalCoordinates[startTaxiway][endTaxiway] = COORDINATE:New(vec3Data.x, vec3Data.y, vec3Data.z)
    end
  end
end
AI_ATC:ConvertTerminalCoordinates()
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--*******************************************************************************HOLD SHORT ZONES********************************************************************************--
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function AI_ATC:HoldShortZones()
  for runway, positions in pairs(HoldShortData) do
    for index, coord in ipairs(positions) do
      local zoneName = string.format("HoldShort_%s_%d", runway, index)
      local zone = ZONE_RADIUS:New(zoneName, {x = coord.x, y = coord.y}, 50)
      HoldShortData[runway][index] = zone
    end
  end
end
AI_ATC:HoldShortZones()
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--*******************************************************************************HOLD SHORT ZONES********************************************************************************--
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function AI_ATC:RunwayGuardZones()
  for runway, positions in pairs(RunwayGuard) do
    for index, coord in ipairs(positions) do
      local zoneName = string.format("RunwayGuard_%s_%d", runway, index)
      local zone = ZONE_RADIUS:New(zoneName, {x = coord.x, y = coord.y}, 50)
      RunwayGuard[runway][index] = zone
    end
  end
end
AI_ATC:RunwayGuardZones()
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--***************************************************************************ATC STANDARD INTERNATIONAL DEPARTURE***************************************************************--
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function AI_ATC:GenerateSID()
  AI_ATC.SID = {
    ["05"] = {
      ["Alfa 05"] = {
        Altitude = "12.5",
        NAVPOINTS = {
          [1] = AI_ATC_Navpoints.Alfa,
        }
      },
      ["Charlie 05"] = {
        Altitude = "12.5",
        NAVPOINTS = {
          [1] = AI_ATC_Navpoints.Charlie,
        }
      },
      ["Delta 05"] = {
        Altitude = "12.5",
        NAVPOINTS = {
          [1] = AI_ATC_Navpoints.Delta,
        }
      },
      ["Echo 05"] = {
        Altitude = "12.5",
        NAVPOINTS = {
          [1] = AI_ATC_Navpoints.Echo,
        }
      },
    },
    ["23"] = {
      ["Alfa 23"] = {
        Altitude = "12.5",
        NAVPOINTS = {
          [1] = AI_ATC_Navpoints.Alfa,
        }
      },
      ["Charlie 23"] = {
        Altitude = "12.5",
        NAVPOINTS = {
          [1] = AI_ATC_Navpoints.Charlie,
        }
      },
      ["Delta 23"] = {
        Altitude = "12.5",
        NAVPOINTS = {
          [1] = AI_ATC_Navpoints.Delta,
        }
      },
      ["Echo 23"] = {
        Altitude = "12.5",
        NAVPOINTS = {
          [1] = AI_ATC_Navpoints.Echo,
        }
      },
    },
  }
end
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--**********************************************************************ATC LOCAL DEPARTURE PROCEEDURES**************************************************************************--
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function AI_ATC:GenerateVFR()
  AI_ATC.VFR = {}
end
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--************************************************************************ATC LOCAL APPROACH PROCEDURES**************************************************************************--
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function AI_ATC:GeneratePlates()
  AI_ATC.ApproachPlates = {
    ["05"] = {
      Altitude = "4",
      NAVPOINTS = {
        [1] = AI_ATC_Navpoints.EAGLE,
        [2] = AI_ATC_Navpoints.FALCON,
        [3] = AI_ATC_Navpoints.TIGER,
      }
    },
    ["23"] = {
      Altitude = "5",
      NAVPOINTS = {
        [1] = AI_ATC_Navpoints.EAGLE,
        [2] = AI_ATC_Navpoints.FALCON,
        [3] = AI_ATC_Navpoints.TIGER,
      }
    }
  }
end
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--****************************************************************************ATC APPROACH CHARTS********************************************************************************--
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function AI_ATC:GenerateCharts()
  AI_ATC.Charts = {
    ["05"] = {
      ["HI\\LO TAC"] = {
        Altitude = "8",
        NAVPOINTS = {
          [1] = AI_ATC_Navpoints.OSLUP,
          [2] = AI_ATC_Navpoints.JAKUP,
          [3] = AI_ATC_Navpoints.GOMSE,
          [4] = AI_ATC_Navpoints.CUROS,
        }
      },
      ["HI\\LO ILS"] = {
        Altitude = "8",
        NAVPOINTS = {
          [1] = AI_ATC_Navpoints.OSLUP,
          [2] = AI_ATC_Navpoints.JAKUP,
          [3] = AI_ATC_Navpoints.GOMSE,
          [4] = AI_ATC_Navpoints.GECEG,
        }
      },
      ["TACAN"] = {
        Altitude = "4",
        NAVPOINTS = {
          [1] = AI_ATC_Navpoints.BLANK,
          [2] = AI_ATC_Navpoints.JAKUP,
          [3] = AI_ATC_Navpoints.GOMSE,
          [4] = AI_ATC_Navpoints.CUROS,
        }
      },
      ["ILS"] = {
        Altitude = "4",
        NAVPOINTS = {
          [1] = AI_ATC_Navpoints.BLANK,
          [2] = AI_ATC_Navpoints.JAKUP,
          [3] = AI_ATC_Navpoints.GOMSE,
          [4] = AI_ATC_Navpoints.GECEG,
        }
      },
    },
    ["23"] = {
      ["HI\\LO TAC"] = {
        Altitude = "9",
        NAVPOINTS = {
          [1] = AI_ATC_Navpoints.OGBON,
          [2] = AI_ATC_Navpoints.TOSIE,
          [3] = AI_ATC_Navpoints.BLANK,
          [4] = AI_ATC_Navpoints.JAYBY,
          [5] = AI_ATC_Navpoints.HABIM,
          [6] = AI_ATC_Navpoints.WUNSO,
          [7] = AI_ATC_Navpoints.EMLET,
        }
      },
      ["HI\\LO ILS"] = {
        Altitude = "9",
        NAVPOINTS = {
          [1] = AI_ATC_Navpoints.OGBON,
          [2] = AI_ATC_Navpoints.TOSIE,
          [3] = AI_ATC_Navpoints.GURLE,
          [4] = AI_ATC_Navpoints.JAYBY,
          [5] = AI_ATC_Navpoints.HABIM,
          [6] = AI_ATC_Navpoints.WUNSO,
          [7] = AI_ATC_Navpoints.WAGIB,
        }
      },
      ["TACAN"] = {
        Altitude = "5",
        NAVPOINTS = {
          [1] = AI_ATC_Navpoints.BLANK,
          [2] = AI_ATC_Navpoints.TOSIE,
          [3] = AI_ATC_Navpoints.BLANK,
          [4] = AI_ATC_Navpoints.JAYBY,
          [5] = AI_ATC_Navpoints.HABIM,
          [6] = AI_ATC_Navpoints.WUNSO,
          [7] = AI_ATC_Navpoints.EMLET,

        }
      },
      ["ILS"] = {
        Altitude = "5",
        NAVPOINTS = {
          [1] = AI_ATC_Navpoints.BLANK,
          [2] = AI_ATC_Navpoints.TOSIE,
          [3] = AI_ATC_Navpoints.GURLE,
          [4] = AI_ATC_Navpoints.JAYBY,
          [5] = AI_ATC_Navpoints.HABIM,
          [6] = AI_ATC_Navpoints.WUNSO,
          [7] = AI_ATC_Navpoints.WAGIB,
        }
      },
    },
  }
end
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--***************************************************************************NELLIS RUNWAY INITIALISE****************************************************************************--
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
AI_ATC.Runways.Landing = {"05", true}
AI_ATC.Runways.LandingZone = RUNWAY_05
AI_ATC.Runways.Takeoff = {"05", false}
AI_ATC.Runways.TakeoffZone = 05
AI_ATC.Runways.TakeoffHold = false
--AI_ATC.Runways.HoldShort = {"03R_HoldShort_1", "03R_HoldShort_2"}
--AI_ATC.Runways.RunwayGuard = {"03R_Guard_1", "03R_Guard_2"}
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
SCHEDULER:New(nil, function()
  coalition.addGroup(country.id.CJTF_BLUE, Group.Category.AIRPLANE, Runway_init)
end, {}, 1)

SCHEDULER:New(nil, function()
  
  RUNWAY_23 = RUNWAY_05

  local ReferenceTable = {
    ["05"] = {trueHeading = 55, ZoneObject = RUNWAY_05, Coordinate = RUNWAY_05[1], Waypoint = "JAYBY"},
    ["23"] = {trueHeading = 235, ZoneObject = RUNWAY_23, Coordinate = RUNWAY_23[8], Waypoint = "GOMSE"},
  }
   
  local unit = UNIT:FindByName("Runway_init")
  if not unit then return end

  local coord = unit:GetCoordinate()
  if not coord then
    unit:Destroy()
    return
  end

  local bestRunway, bestData
  local shortest = math.huge

  for runway, data in pairs(ReferenceTable) do
    if data and data.Coordinate then
      local dist = coord:Get2DDistance(data.Coordinate)
      if dist < shortest then
        shortest  = dist
        bestRunway = runway
        bestData   = data
      end
    end
  end

  unit:Destroy()

  if not bestRunway or not bestData then return end

  AI_ATC.Runways.Takeoff      = { bestRunway, true, bestData.Coordinate, bestData.trueHeading }
  AI_ATC.Runways.Takeoff[5]   = AI_ATC:CalculateRunwayHeading(bestData.trueHeading)
  AI_ATC.Runways.TakeoffZone  = bestData.ZoneObject

  local wpZone = AI_ATC_Navpoints[bestData.Waypoint]
  if wpZone then
    AI_ATC.Runways.Waypoint = wpZone:GetCoordinate()
  end
  AI_ATC.Departure.SID = bestData.SID

  AI_ATC.Runways.Landing      = { bestRunway, false, bestData.Coordinate, bestData.trueHeading }
  AI_ATC.Runways.Landing[5]   = AI_ATC:CalculateRunwayHeading(bestData.trueHeading)
  AI_ATC.Runways.LandingZone  = bestData.ZoneObject

  AI_ATC.Recovery = bestData.Recovery
  
end, {}, 2)
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--*****************************************************************************CALCULATE RUNWAY HEADING**************************************************************************--
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function AI_ATC:CalculateRunwayHeading(num)
  if not num or not AI_ATC.MagDec then return nil end

  local heading = num - AI_ATC.MagDec
  heading = math.floor(heading + 0.5)
  heading = heading % 360
  if heading < 0 then heading = heading + 360 end
  
  return heading
end
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--***********************************************************************************ATIS STOP**********************************************************************************--
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function AI_ATC:StopATIS()
  AI_ATC.ATIS.Data.FC3switch = true
end
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--****************************************************************************NELLIS ATIS***************************************************************************************--
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
AI_ATC.ATIS.Data = {
  AirBase       = AI_ATC.Airbase,
  Information   = nil,
  ZULU          = nil,
  WindSpeed     = nil,
  WindDirection = nil,
  Gusting       = nil,
  Preset        = nil,
  Fog           = nil,
  Dust          = nil,
  Rain          = false,
  Visibility    = nil,
  Cloud         = nil,
  Base          = nil,
  Temperature   = nil,
  Humidity      = nil,
  DewPoint      = nil,
  QNH           = nil,
  QFE           = nil,
  Departure     = nil,
  Arrival       = nil,
  Active        = nil,
  Approach      = nil,
  FC3switch     = false,
  Count         = nil,
}

function AI_ATC:InitATIS()
  local Frequecy = AI_ATC.Radio.ATIS[AI_ATC.Radio.ATIS.UserFreq]
  local startTime = timer.getTime()
  local atisRepeaterUnit = UNIT:FindByName("ATIS_Repeater")
  if atisRepeaterUnit then
    local transmitterRadio = atisRepeaterUnit:GetRadio()
    if transmitterRadio then
      local radioObject = transmitterRadio:NewUnitTransmission("UHF_NOISE.ogg", nil, nil, AI_ATC.Radio.ATIS[Frequecy], radio.modulation.AM, true)
      radioObject:Broadcast()
    end
  end

  ATC_Coroutine:AddCoroutine(function()
    local data   = AI_ATC.ATIS.Data
    local base   = AI_ATC_Airbase
    local pres   = AI_ATC_CloudPresets
    local runDep = AI_ATC.Runways and AI_ATC.Runways.Takeoff
    local runArr = AI_ATC.Runways and AI_ATC.Runways.Landing

    if not base or not runDep or not runArr then
      env.warning("AI_ATC:InitATIS -> Missing essential references (AI_ATC_Airbase or Runways).")
      return
    end

    ATIS_RESTART   = false
    data.Count     = 0

    local coord    = base:GetCoordinate()
    local landHt   = coord:GetLandHeight()
    local tempCalc = coord:GetTemperature(landHt + 10)
    local temperature = math.floor(tempCalc + 0.5)

    local qfePressure = UTILS.hPa2inHg(coord:GetPressure(landHt))
    local qfe = math.floor(qfePressure * 100 + 0.5) / 100

    local qnhPressure = UTILS.hPa2inHg(coord:GetPressure(0))
    local qnh = math.floor(qnhPressure * 100 + 0.5) / 100

    local timeAbs    = timer.getAbsTime()
    local localShift = UTILS.GMTToLocalTimeDifference() * 60 * 60
    local zuluSec    = timeAbs - localShift
    if zuluSec < 0 then
      zuluSec = 24 * 3600 + zuluSec
    end

    local clockStr = UTILS.SecondsToClock(zuluSec)
    local clockParts = UTILS.Split(clockStr, ":") 
    local zuluTime = string.format("%s%s", clockParts[1], clockParts[2])

    local hourIdx = tonumber(clockParts[1]) + 1
    local natoLetter = AI_ATC_NatoTime[hourIdx]

    data.Information  = natoLetter
    data.ZULU         = zuluTime
    data.Temperature  = tostring(temperature)
    data.QFE          = string.format("%.2f", qfe)
    data.QNH          = string.format("%.2f", qnh)

    coroutine.yield()

    local weather = env.mission and env.mission.weather or {}
    local windDirRaw, windSpdRaw = coord:GetWind(landHt + 10)
    local windDirection = AI_ATC:RectifyHeading(tostring(math.floor(windDirRaw + 0.5)))
    local windSpeedKnots

    if windSpdRaw >= 1 then
      windSpeedKnots = tostring(math.floor(UTILS.MpsToKnots(windSpdRaw) - 0.5))
    else
      windSpeedKnots = "0"
    end

    data.WindDirection = windDirection
    data.WindSpeed     = windSpeedKnots

    data.Gusting = (weather.groundTurbulence and weather.groundTurbulence > 0) or false

    local fogEnabled  = weather.enable_fog or false
    local dustEnabled = weather.enable_dust or false
    local preset      = weather.clouds and weather.clouds.preset or ""

    data.Fog    = fogEnabled
    data.Dust   = dustEnabled
    data.Preset = preset

    if not pres[preset] then
      preset = ""
    end

    if fogEnabled then
      local thicknessFt = weather.fog and weather.fog.thickness or 0
      local thicknessConv = math.floor((thicknessFt * 3.28084 + 500) / 1000) * 1000
      data.FogThickness = tostring(thicknessConv)
      data.FogVisibility = weather.fog and weather.fog.visibility or 0
    else
      data.FogThickness  = nil
      data.FogVisibility = nil
    end


    if weather.fog2 then
      data.Fog = true
      local thickness2 = world.weather.getFogThickness() or 0
      local fogVis2    = world.weather.getFogVisibilityDistance() or 0

      if thickness2 == 0 then
        local fallbackBase = weather.clouds and weather.clouds.base or 0
        data.FogThickness = tostring(math.floor((fallbackBase * 3.28084 + 500) / 1000) * 1000)
      else
        data.FogThickness = tostring(math.floor((thickness2 * 3.28084 + 500) / 1000) * 1000)
      end

      if fogVis2 == 0 then
        data.FogVisibility = 5
      else
        data.FogVisibility = fogVis2
      end
    end

    if dustEnabled then
      data.DustDensity = weather.dust_density or 0
    else
      data.DustDensity = nil
    end

    coroutine.yield()

    local rawVisibility = (weather.visibility and weather.visibility.distance) or 0

    if data.Fog and data.FogVisibility then
      if data.FogVisibility < rawVisibility then
        rawVisibility = data.FogVisibility
      end
    end

    if dustEnabled and weather.dust_density then
      if weather.dust_density < rawVisibility then
        rawVisibility = weather.dust_density
      end
    end

    local finalVisSM = UTILS.Round(UTILS.MetersToSM(rawVisibility))
    if finalVisSM > 10 then
      finalVisSM = 10
    end
    data.Visibility = string.format("%d", finalVisSM)

    local precip = pres[preset] and pres[preset].Rain or "No significant weather"
    if precip ~= "No significant weather" then
      data.Rain = true
    end

    local baseCloudsFt = weather.clouds and weather.clouds.base or 0
    local baseAltFt = math.floor((baseCloudsFt * 3.28084 + 500) / 1000) * 1000

    data.Cloud = pres[preset] and pres[preset].Cloud or nil
    data.Base  = tostring(baseAltFt)

    local humidityVal = pres[preset] and pres[preset].Humidity or 0
    data.Humidity = tostring(humidityVal)

    local dewPoint = temperature - ((100 - humidityVal) / 5)
    data.DewPoint = string.format("%s", dewPoint)

    data.Departure = runDep and runDep[1] or "Unknown"
    data.Arrival   = runArr and runArr[1] or "Unknown"

    if data.Arrival == data.Departure then
      data.Active = data.Departure
    else
      data.Active = nil
    end

    if coord:IsDay() and (not data.Rain) and (finalVisSM >= 5) then
      data.Approach  = "VFR"
      AI_ATC.Procedure = "VFR"
    else
      data.Approach  = "IFR"
      AI_ATC.Procedure = "IFR"
    end

    local endTime = timer.getTime()
    local duration = endTime - startTime
    env.info(string.format("AI_ATC:InitATIS -> ATIS data calculated in %.2f seconds.", duration))
  end)
end
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--****************************************************************************INITIALISE RADIOS**********************************************************************************--
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function AI_ATC:InitRadios()
  local Frequency = AI_ATC.RadioFrequency
  
  ATIS_RADIO = RADIOQUEUE:New(AI_ATC.Radio.ATIS[AI_ATC.Radio.ATIS.UserFreq], 0)
  ATIS_RADIO:SetSenderUnitName(AI_ATC.Radio.ATIS.Transmitter)
  ATIS_RADIO:Start()

  ATIS_REPEATER = RADIOQUEUE:New(AI_ATC.Radio.ATIS[AI_ATC.Radio.ATIS.UserFreq], 0)
  ATIS_REPEATER:SetSenderUnitName("ATIS_Repeater")
  ATIS_REPEATER:Start()
  
  GROUND_RADIO = RADIOQUEUE:New(AI_ATC.Radio.Ground[AI_ATC.Radio.Ground.UserFreq], 0)
  GROUND_RADIO:SetSenderUnitName(AI_ATC.Radio.Ground.Transmitter)
  GROUND_RADIO:Start()
  
  CLEARANCE_RADIO = RADIOQUEUE:New(AI_ATC.Radio.Clearance[AI_ATC.Radio.Clearance.UserFreq], 0)
  CLEARANCE_RADIO:SetSenderUnitName(AI_ATC.Radio.Clearance.Transmitter)
  CLEARANCE_RADIO:Start()
  
  TOWER_RADIO = RADIOQUEUE:New(AI_ATC.Radio.Tower[AI_ATC.Radio.Tower.UserFreq], 0)
  TOWER_RADIO:SetSenderUnitName(AI_ATC.Radio.Tower.Transmitter)
  TOWER_RADIO:Start()
  
  DEPARTURE_RADIO = RADIOQUEUE:New(AI_ATC.Radio.Departure[AI_ATC.Radio.Departure.UserFreq], 0)
  DEPARTURE_RADIO:SetSenderUnitName(AI_ATC.Radio.Departure.Transmitter)
  DEPARTURE_RADIO:Start()

  APPROACH_RADIO = RADIOQUEUE:New(AI_ATC.Radio.Approach[AI_ATC.Radio.Approach.UserFreq], 0)
  APPROACH_RADIO:SetSenderUnitName(AI_ATC.Radio.Approach.Transmitter)
  APPROACH_RADIO:Start()
  
  ATCRepeater = "Generic_Repeater"

end
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--***********************************************************************************SET RADIOS TO VHF **************************************************************************--
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function AI_ATC:SetRadioFrequency(Agency, Range)
  if AI_ATC.Radio[Agency] and (Range=="UHF" or Range=="VHF") then
    AI_ATC.Radio[Agency].UserFreq = Range
  else
    local Txt = string.format("****************INVALID FREQUENCY RANGE %s FOR %s*********************", Range, Agency)
    env.info(Txt)
  end
end
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--***********************************************************************************FUNCTION DELAY******************************************************************************--
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function AI_ATC:FunctionDelay(Alias, Object, Transmitter, delay)
  local Delay = delay or 3.0
  local currentTime = timer.getTime()
  
  AI_ATC[Transmitter] = AI_ATC[Transmitter] or {}
  AI_ATC[Transmitter].TimeSinceLastCall = AI_ATC[Transmitter].TimeSinceLastCall or 0
  if currentTime < AI_ATC[Transmitter].TimeSinceLastCall + Delay then
    if Object~=nil then
      SCHEDULER:New(nil, function()
        Object()
      end, {}, Delay)
    end
    return false
  else
    if Object then
      AI_ATC[Transmitter].TimeSinceLastCall = currentTime
    end
    return true
  end
end
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--*********************************************************************************INIT MENUS************************************************************************************--
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function AI_ATC:InitMenus(Alias)
  local Group = ATM.ClientData[Alias].Unit:GetGroup()
  local AI_ATC_Menu = ATM.ClientData[Alias].ParentMenu
   
  local AI_ATC_Clearance_Menu = MENU_GROUP:New(Group, "Clearance", AI_ATC_Menu)
  local AI_ATC_Ground_Menu = MENU_GROUP:New(Group, "Ground", AI_ATC_Menu)
  local AI_ATC_Tower_Menu = MENU_GROUP:New(Group, "Tower", AI_ATC_Menu)
  local DepartureMenu = MENU_GROUP:New(Group, "Departure", AI_ATC_Menu)
  local ApproachMenu = MENU_GROUP:New(Group, "Approach", AI_ATC_Menu)
  local Agency = MENU_GROUP:New(Group, "Other Agency", AI_ATC_Menu)
  local BLANKMenu =  MENU_GROUP:New(Group, " ", Agency)
  local RepeatMenu =  MENU_GROUP:New(Group, "Repeat transmission", Agency)
  local OptionsMenu =  MENU_GROUP:New(Group, "Options", Agency)
  local JoinGroupMenu  = MENU_GROUP:New(Group, "Join Group", OptionsMenu)
  local Blank1 = MENU_GROUP_COMMAND:New(Group, "  ", Agency, function()  end, Group)
  local Blank2 = MENU_GROUP_COMMAND:New(Group, "   ", Agency, function()  end, Group)

  
  ATM.ClientData[Alias].ClearanceMenu = AI_ATC_Clearance_Menu
  ATM.ClientData[Alias].GroundMenu = AI_ATC_Ground_Menu
  ATM.ClientData[Alias].TowerMenu = AI_ATC_Tower_Menu
  ATM.ClientData[Alias].DepartureMenu = DepartureMenu
  ATM.ClientData[Alias].OtherAgency = Agency
  ATM.ClientData[Alias].ApproachMenu = ApproachMenu
  ATM.ClientData[Alias].RepeatMenu = RepeatMenu
  ATM.ClientData[Alias].JoinGroupMenu = JoinGroupMenu
  
  AI_ATC:JoinGroup(Alias)
end
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--*********************************************************************************RESET MENUS***********************************************************************************--
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function AI_ATC:ResetMenus(Alias)
  local Client = ATM.ClientData[Alias]
  
  Client.ClearanceMenu:RemoveSubMenus()
  Client.GroundMenu:RemoveSubMenus()
  Client.TowerMenu:RemoveSubMenus()
  Client.DepartureMenu:RemoveSubMenus()
  Client.ApproachMenu:RemoveSubMenus()
  
  if AI_ATC.MenuDebug then
    --env.info("All Menus Have been reset")
  end
end
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--*********************************************************************************REMOVE MENUS***********************************************************************************--
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function AI_ATC:RemoveMenus(Alias)
  local Client = ATM.ClientData[Alias]
  
  if not Client then return end
  
  Client.ClearanceMenu:Remove()
  Client.GroundMenu:Remove()
  Client.TowerMenu:Remove()
  Client.DepartureMenu:Remove()
  Client.OtherAgency:Remove()
  Client.ApproachMenu:Remove()
end
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--*********************************************************************************RESET MENUS***********************************************************************************--
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function AI_ATC:GenerateEmptyMenu(Alias, Transmitter, count)
  local Unit = ATM.ClientData[Alias].Unit
  local Group = Unit:GetGroup()
  local MenuObject, Variable, Blank
  
  if Transmitter == "Approach" or Transmitter == "SFA" then
    MenuObject = ATM.ClientData[Alias].ApproachMenu
  elseif Transmitter == "Tower" then
    MenuObject = ATM.ClientData[Alias].TowerMenu
  end
  
  Variable = " "
  Blank = " "
  if count then
    for i = 1, count do
      Variable = Variable..Blank
      MENU_GROUP_COMMAND:New(Group, Variable, MenuObject, function()  end, Group)
    end
  else
    MENU_GROUP_COMMAND:New(Group, Variable, MenuObject, function()  end, Group)
  end
  
end
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--*****************************************************************************REPEAT LAST TRANSMISSION**************************************************************************--
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function AI_ATC:RepeatLastTransmission(Alias, Object)
  local Unit = ATM.ClientData[Alias].Unit
  local Group = Unit:GetGroup()
  local MenuObject = ATM.ClientData[Alias].RepeatMenu
  
  if MenuObject and MenuObject.MenuCount then
    MenuObject:RemoveSubMenus()
  end

  local commandFunction
  if Object then
    commandFunction = function() Object() end
  else
    commandFunction = function() end
  end
  MENU_GROUP_COMMAND:New(Group, "Repeat last transmission", MenuObject, commandFunction, Group )
end
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--***********************************************************************************CLEARANCE SUB MENU**************************************************************************--
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function AI_ATC:ClearanceSubMenu(Alias)
  local Group = ATM.ClientData[Alias].Unit:GetGroup()
  local Helo = ATM.ClientData[Alias].Helo
  local Runway = AI_ATC.Runways.Landing[1]
  local AI_ATC_Menu = ATM.ClientData[Alias].ParentMenu
  local AI_ATC_Clearance_Menu = ATM.ClientData[Alias].ClearanceMenu
  local AI_ATC_Departure_Menu = MENU_GROUP:New(Group, "Departure...", AI_ATC_Clearance_Menu)
  
  if Helo==false then
    if AI_ATC.Procedure == "VFR" then
      MENU_GROUP_COMMAND:New(Group, "VFR", AI_ATC_Departure_Menu, function() AI_ATC:VFR_Clearance(Alias) end, Group)
      
      local IFRMenu = MENU_GROUP:New(Group, "IFR...", AI_ATC_Departure_Menu)
      MENU_GROUP_COMMAND:New(Group, string.format("Alfa %s", Runway), IFRMenu, function() AI_ATC:IFR_Clearance(Alias, string.format("Alfa %s", Runway)) end, Group)
      MENU_GROUP_COMMAND:New(Group, string.format("Charlie %s", Runway), IFRMenu, function() AI_ATC:IFR_Clearance(Alias, string.format("Charlie %s", Runway)) end, Group)
      MENU_GROUP_COMMAND:New(Group, string.format("Delta %s", Runway), IFRMenu, function() AI_ATC:IFR_Clearance(Alias, string.format("Delta %s", Runway)) end, Group)
      MENU_GROUP_COMMAND:New(Group, string.format("Echo %s", Runway), IFRMenu, function() AI_ATC:IFR_Clearance(Alias, string.format("Echo %s", Runway)) end, Group)

    elseif AI_ATC.Procedure == "IFR" then
      local IFRMenu = MENU_GROUP:New(Group, "IFR...", AI_ATC_Departure_Menu)
      MENU_GROUP_COMMAND:New(Group, string.format("Alfa %s", Runway), IFRMenu, function() AI_ATC:IFR_Clearance(Alias, string.format("Alfa %s", Runway)) end, Group)
      MENU_GROUP_COMMAND:New(Group, string.format("Charlie %s", Runway), IFRMenu, function() AI_ATC:IFR_Clearance(Alias, string.format("Charlie %s", Runway)) end, Group)
      MENU_GROUP_COMMAND:New(Group, string.format("Delta %s", Runway), IFRMenu, function() AI_ATC:IFR_Clearance(Alias, string.format("Delta %s", Runway)) end, Group)
      MENU_GROUP_COMMAND:New(Group, string.format("Echo %s", Runway), IFRMenu, function() AI_ATC:IFR_Clearance(Alias, string.format("Echo %s", Runway)) end, Group)
    end
  elseif Helo==true then
    if AI_ATC.Procedure == "VFR" then
      MENU_GROUP_COMMAND:New(Group, "VFR", AI_ATC_Departure_Menu, function() AI_ATC:VFR_Clearance(Alias) end, Group)
    elseif AI_ATC.Procedure == "IFR" then
      MENU_GROUP_COMMAND:New(Group, "IFR", AI_ATC_Departure_Menu, function() AI_ATC:IFR_Clearance(Alias) end, Group)
    end
  end
  
  local OptionsMenu = MENU_GROUP:New(Group, "Options...", AI_ATC_Clearance_Menu)
  local CallsignMenu = MENU_GROUP:New(Group, "Set Callsign...", OptionsMenu)
  local Menu1 = MENU_GROUP:New(Group, "Group 1", CallsignMenu)
  local Menu2 = MENU_GROUP:New(Group, "Group 2",   CallsignMenu)
  local Menu3 = MENU_GROUP:New(Group, "Group 3",   CallsignMenu)
  local Menu4 = MENU_GROUP:New(Group, "Group 4",   CallsignMenu)
  local Menu5 = MENU_GROUP:New(Group, "Group 5",   CallsignMenu)
  local Menu6 = MENU_GROUP:New(Group, "Group 6",   CallsignMenu)
  local Menu7 = MENU_GROUP:New(Group, "Group 7",   CallsignMenu)
  local Menu8 = MENU_GROUP:New(Group, "Group 8",   CallsignMenu)
  local Menu9 = MENU_GROUP:New(Group, "Group 9",   CallsignMenu)
  local Menu10 = MENU_GROUP:New(Group, "Set Integer",   CallsignMenu)
  ----------------------------------------------------------------------------------------------------------------------
  if not Helo then
    MENU_GROUP_COMMAND:New(Group, "Aspen", Menu1, function() AI_ATC:SetCallsign(Alias, "Aspen",   "11") end, Group)
    MENU_GROUP_COMMAND:New(Group, "Mig",   Menu2, function() AI_ATC:SetCallsign(Alias, "Mig",   "11") end, Group)
  else
    MENU_GROUP_COMMAND:New(Group, "Pedro", Menu1, function() AI_ATC:SetCallsign(Alias, "Pedro",   "11") end, Group)
    MENU_GROUP_COMMAND:New(Group, "Razor", Menu2, function() AI_ATC:SetCallsign(Alias, "Razor",   "11") end, Group)
  end
  MENU_GROUP_COMMAND:New(Group, "Chaos", Menu1, function() AI_ATC:SetCallsign(Alias, "Chaos",           "11") end, Group)
  MENU_GROUP_COMMAND:New(Group, "Cylon", Menu1, function() AI_ATC:SetCallsign(Alias, "Cylon",           "11") end, Group)
  MENU_GROUP_COMMAND:New(Group, "Dragon", Menu1, function() AI_ATC:SetCallsign(Alias, "Dragon",         "11") end, Group)
  MENU_GROUP_COMMAND:New(Group, "GunFighter", Menu1, function() AI_ATC:SetCallsign(Alias, "GunFighter", "11") end, Group)
  MENU_GROUP_COMMAND:New(Group, "Nightmare", Menu1, function() AI_ATC:SetCallsign(Alias, "Nightmare",   "11") end, Group)
  MENU_GROUP_COMMAND:New(Group, "Eagle",  Menu1, function() AI_ATC:SetCallsign(Alias, "Eagle",          "11") end, Group)
  MENU_GROUP_COMMAND:New(Group, "Viper",  Menu1, function() AI_ATC:SetCallsign(Alias, "Viper",          "11") end, Group)
  MENU_GROUP_COMMAND:New(Group, "Hornet", Menu1, function() AI_ATC:SetCallsign(Alias, "Hornet",         "11") end, Group)
  MENU_GROUP_COMMAND:New(Group, "Slayer", Menu1, function() AI_ATC:SetCallsign(Alias, "Slayer",         "11") end, Group)
  ----------------------------------------------------------------------------------------------------------------------
  MENU_GROUP_COMMAND:New(Group, "Stalin",  Menu2, function() AI_ATC:SetCallsign(Alias, "Stalin",        "11") end, Group)
  MENU_GROUP_COMMAND:New(Group, "Flanker", Menu2, function() AI_ATC:SetCallsign(Alias, "Flanker",       "11") end, Group)
  MENU_GROUP_COMMAND:New(Group, "Fulcrum", Menu2, function() AI_ATC:SetCallsign(Alias, "Fulcrum",       "11") end, Group)
  MENU_GROUP_COMMAND:New(Group, "Flogger", Menu2, function() AI_ATC:SetCallsign(Alias, "Flogger",       "11") end, Group)
  MENU_GROUP_COMMAND:New(Group, "Ivan",    Menu2, function() AI_ATC:SetCallsign(Alias, "Ivan",          "11") end, Group)
  MENU_GROUP_COMMAND:New(Group, "Grape",    Menu2, function() AI_ATC:SetCallsign(Alias, "Grape",        "11") end, Group)
  MENU_GROUP_COMMAND:New(Group, "Strelka",  Menu2, function() AI_ATC:SetCallsign(Alias, "Strelka",      "11") end, Group)
  MENU_GROUP_COMMAND:New(Group, "Skalpel",  Menu2, function() AI_ATC:SetCallsign(Alias, "Skalpel",      "11") end, Group)
  MENU_GROUP_COMMAND:New(Group, "Rapier",   Menu2, function() AI_ATC:SetCallsign(Alias, "Rapier",       "11") end, Group)
  ----------------------------------------------------------------------------------------------------------------------
  MENU_GROUP_COMMAND:New(Group, "Sniper",  Menu3, function() AI_ATC:SetCallsign(Alias, "Sniper",        "11") end, Group)
  MENU_GROUP_COMMAND:New(Group, "Rage",  Menu3, function() AI_ATC:SetCallsign(Alias, "Rage",            "11") end, Group)
  MENU_GROUP_COMMAND:New(Group, "Venom", Menu3, function() AI_ATC:SetCallsign(Alias, "Venom",           "11") end, Group)
  MENU_GROUP_COMMAND:New(Group, "Jedi", Menu3, function() AI_ATC:SetCallsign(Alias, "Jedi",             "11") end, Group)
  MENU_GROUP_COMMAND:New(Group, "Sting", Menu3, function() AI_ATC:SetCallsign(Alias, "Sting",           "11") end, Group)
  MENU_GROUP_COMMAND:New(Group, "Snake",    Menu3, function() AI_ATC:SetCallsign(Alias, "Snake",        "11") end, Group)
  MENU_GROUP_COMMAND:New(Group, "Heavy",    Menu3, function() AI_ATC:SetCallsign(Alias, "Heavy",        "11") end, Group)
  MENU_GROUP_COMMAND:New(Group, "Raygun",  Menu3, function() AI_ATC:SetCallsign(Alias, "Raygun",        "11") end, Group)
  MENU_GROUP_COMMAND:New(Group, "Cupcake",  Menu3, function() AI_ATC:SetCallsign(Alias, "Cupcake",      "11") end, Group)
  MENU_GROUP_COMMAND:New(Group, "Hawk",   Menu3, function() AI_ATC:SetCallsign(Alias, "Hawk",           "11") end, Group)
  ----------------------------------------------------------------------------------------------------------------------
  MENU_GROUP_COMMAND:New(Group, "Simca",      Menu4, function() AI_ATC:SetCallsign(Alias, "Simca",      "11") end, Group)
  MENU_GROUP_COMMAND:New(Group, "Comet",      Menu4, function() AI_ATC:SetCallsign(Alias, "Comet",      "11") end, Group)
  MENU_GROUP_COMMAND:New(Group, "Razor",      Menu4, function() AI_ATC:SetCallsign(Alias, "Razor",      "11") end, Group)
  MENU_GROUP_COMMAND:New(Group, "Digger",     Menu4, function() AI_ATC:SetCallsign(Alias, "Digger",     "11") end, Group)
  MENU_GROUP_COMMAND:New(Group, "Sabre",      Menu4, function() AI_ATC:SetCallsign(Alias, "Sabre",      "11") end, Group)
  MENU_GROUP_COMMAND:New(Group, "Pirate",     Menu4, function() AI_ATC:SetCallsign(Alias, "Pirate",     "11") end, Group)
  MENU_GROUP_COMMAND:New(Group, "Cannon",     Menu4, function() AI_ATC:SetCallsign(Alias, "Cannon",     "11") end, Group)
  MENU_GROUP_COMMAND:New(Group, "Buckshot",   Menu4, function() AI_ATC:SetCallsign(Alias, "Buckshot",   "11") end, Group)
  MENU_GROUP_COMMAND:New(Group, "Maple",      Menu4, function() AI_ATC:SetCallsign(Alias, "Maple",      "11") end, Group)
  MENU_GROUP_COMMAND:New(Group, "Hellcat",    Menu4, function() AI_ATC:SetCallsign(Alias, "Hellcat",    "11") end, Group)
  ----------------------------------------------------------------------------------------------------------------------
  MENU_GROUP_COMMAND:New(Group, "Sundowner",  Menu5, function() AI_ATC:SetCallsign(Alias, "Sundowner",  "11") end, Group)
  MENU_GROUP_COMMAND:New(Group, "Camelot",    Menu5, function() AI_ATC:SetCallsign(Alias, "Camelot",    "11") end, Group)
  MENU_GROUP_COMMAND:New(Group, "Witchita",   Menu5, function() AI_ATC:SetCallsign(Alias, "Witchita",   "11") end, Group)
  MENU_GROUP_COMMAND:New(Group, "Dog",         Menu5, function() AI_ATC:SetCallsign(Alias, "Dog",       "11") end, Group)
  MENU_GROUP_COMMAND:New(Group, "Lion",        Menu5, function() AI_ATC:SetCallsign(Alias, "Lion",      "11") end, Group)
  MENU_GROUP_COMMAND:New(Group, "Tomcat",      Menu5, function() AI_ATC:SetCallsign(Alias, "Tomcat",    "11") end, Group)
  MENU_GROUP_COMMAND:New(Group, "Retro",       Menu5, function() AI_ATC:SetCallsign(Alias, "Retro",     "11") end, Group)
  MENU_GROUP_COMMAND:New(Group, "Ghostrider",  Menu5, function() AI_ATC:SetCallsign(Alias, "Ghostrider","11") end, Group)
  MENU_GROUP_COMMAND:New(Group, "Dealer",      Menu5, function() AI_ATC:SetCallsign(Alias, "Dealer",    "11") end, Group)
  MENU_GROUP_COMMAND:New(Group, "Dagger",      Menu5, function() AI_ATC:SetCallsign(Alias, "Dagger",    "11") end, Group)
  ----------------------------------------------------------------------------------------------------------------------
  MENU_GROUP_COMMAND:New(Group, "Hammer",     Menu6, function() AI_ATC:SetCallsign(Alias, "Hammer",     "11") end, Group)
  MENU_GROUP_COMMAND:New(Group, "Voodoo",     Menu6, function() AI_ATC:SetCallsign(Alias, "Voodoo",     "11") end, Group)
  MENU_GROUP_COMMAND:New(Group, "Wildman",    Menu6, function() AI_ATC:SetCallsign(Alias, "Wildman",    "11") end, Group)
  MENU_GROUP_COMMAND:New(Group, "Ugly",       Menu6, function() AI_ATC:SetCallsign(Alias, "Ugly",       "11") end, Group)
  MENU_GROUP_COMMAND:New(Group, "Gunstar",    Menu6, function() AI_ATC:SetCallsign(Alias, "Gunstar",    "11") end, Group)
  MENU_GROUP_COMMAND:New(Group, "Felix",       Menu6, function() AI_ATC:SetCallsign(Alias, "Felix",     "11") end, Group)
  MENU_GROUP_COMMAND:New(Group, "Gypsy",       Menu6, function() AI_ATC:SetCallsign(Alias, "Gypsy",     "11") end, Group)
  MENU_GROUP_COMMAND:New(Group, "Black",       Menu6, function() AI_ATC:SetCallsign(Alias, "Black",     "11") end, Group)
  MENU_GROUP_COMMAND:New(Group, "Knight",      Menu6, function() AI_ATC:SetCallsign(Alias, "Knight",    "11") end, Group)
  MENU_GROUP_COMMAND:New(Group, "Black Knight",Menu6, function()AI_ATC:SetCallsign(Alias, "Black Knight","11")end, Group)
  ----------------------------------------------------------------------------------------------------------------------
  MENU_GROUP_COMMAND:New(Group, "Phantom",     Menu7, function() AI_ATC:SetCallsign(Alias, "Phantom",    "11") end, Group)
  MENU_GROUP_COMMAND:New(Group, "Bogey",       Menu7, function() AI_ATC:SetCallsign(Alias, "Bogey",      "11") end, Group)
  MENU_GROUP_COMMAND:New(Group, "Wolf",     Menu7, function() AI_ATC:SetCallsign(Alias, "Wolf",     "11") end, Group)
  MENU_GROUP_COMMAND:New(Group, "Vixen",    Menu7, function() AI_ATC:SetCallsign(Alias, "Vixen",    "11") end, Group)
  MENU_GROUP_COMMAND:New(Group, "Cargo",    Menu7, function() AI_ATC:SetCallsign(Alias, "Cargo",    "11") end, Group)
  MENU_GROUP_COMMAND:New(Group, "Warrior",  Menu7, function() AI_ATC:SetCallsign(Alias, "Warrior",  "11") end, Group)
  MENU_GROUP_COMMAND:New(Group, "Anvil",    Menu7, function() AI_ATC:SetCallsign(Alias, "Anvil",    "11") end, Group)
  MENU_GROUP_COMMAND:New(Group, "Apache",   Menu7, function() AI_ATC:SetCallsign(Alias, "Apache",   "11") end, Group)
  MENU_GROUP_COMMAND:New(Group, "Hawg",     Menu7, function() AI_ATC:SetCallsign(Alias, "Hawg",     "11") end, Group)
  MENU_GROUP_COMMAND:New(Group, "Boar",     Menu7, function() AI_ATC:SetCallsign(Alias, "Boar",     "11") end, Group)
  ----------------------------------------------------------------------------------------------------------------------
  MENU_GROUP_COMMAND:New(Group, "1",   Menu10, function() AI_ATC:SetCallsign(Alias, nil, "11") end, Group)
  MENU_GROUP_COMMAND:New(Group, "2",   Menu10, function() AI_ATC:SetCallsign(Alias, nil, "21") end, Group)
  MENU_GROUP_COMMAND:New(Group, "3",   Menu10, function() AI_ATC:SetCallsign(Alias, nil, "31") end, Group)
  MENU_GROUP_COMMAND:New(Group, "4",   Menu10, function() AI_ATC:SetCallsign(Alias, nil, "41") end, Group)
  MENU_GROUP_COMMAND:New(Group, "5",   Menu10, function() AI_ATC:SetCallsign(Alias, nil, "51") end, Group)
  MENU_GROUP_COMMAND:New(Group, "6",   Menu10, function() AI_ATC:SetCallsign(Alias, nil, "61") end, Group)
  MENU_GROUP_COMMAND:New(Group, "7",   Menu10, function() AI_ATC:SetCallsign(Alias, nil, "71") end, Group)
  MENU_GROUP_COMMAND:New(Group, "8",   Menu10, function() AI_ATC:SetCallsign(Alias, nil, "81") end, Group)
  MENU_GROUP_COMMAND:New(Group, "9",   Menu10, function() AI_ATC:SetCallsign(Alias, nil, "91") end, Group)
  MENU_GROUP_COMMAND:New(Group, "0",   Menu10, function() AI_ATC:SetCallsign(Alias, nil, "01") end, Group)
end
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--***************************************************************************CLEARANCE READBACK SUBMENU**************************************************************************--
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function AI_ATC:ReadBackSubMenu(Alias)

  local ClientData              = ATM.ClientData[Alias]
  local Group                   = ClientData.Group
  local Unit                    = ClientData.Unit
  local Group                   = Unit:GetGroup()
  local AI_ATC_Menu             = ClientData.ParentMenu
  local AI_ATC_Clearance_Menu   = ClientData.ClearanceMenu
  local SchedulerObjects        = ClientData.SchedulerObjects
  local Helo                    = ClientData.Helo
  
  local AI_ATC_Readback_Menu = MENU_GROUP:New(Group, "ReadBack...", AI_ATC_Clearance_Menu)
  local OptionsMenu    = MENU_GROUP:New(Group, "Options...", AI_ATC_Clearance_Menu)
  local CallsignMenu   = MENU_GROUP:New(Group, "Set Callsign...", OptionsMenu)
  
  MENU_GROUP_COMMAND:New(Group, "Squawk 1001",   AI_ATC_Readback_Menu, function() AI_ATC:ClearanceReadBack(Alias, "1001") end, Group)
  MENU_GROUP_COMMAND:New(Group, "Squawk 2001",   AI_ATC_Readback_Menu, function() AI_ATC:ClearanceReadBack(Alias, "2001") end, Group)
  MENU_GROUP_COMMAND:New(Group, "Squawk 3001",   AI_ATC_Readback_Menu, function() AI_ATC:ClearanceReadBack(Alias, "3001") end, Group)
  MENU_GROUP_COMMAND:New(Group, "Squawk 4001",   AI_ATC_Readback_Menu, function() AI_ATC:ClearanceReadBack(Alias, "4001") end, Group)
  MENU_GROUP_COMMAND:New(Group, "Squawk 5001",   AI_ATC_Readback_Menu, function() AI_ATC:ClearanceReadBack(Alias, "5001") end, Group)
  MENU_GROUP_COMMAND:New(Group, "Squawk 6001",   AI_ATC_Readback_Menu, function() AI_ATC:ClearanceReadBack(Alias, "6001") end, Group)
  MENU_GROUP_COMMAND:New(Group, "Squawk 7001",   AI_ATC_Readback_Menu, function() AI_ATC:ClearanceReadBack(Alias, "7001") end, Group)
  
  local OptionsMenu = MENU_GROUP:New(Group, "Options...", AI_ATC_Clearance_Menu)
  local CallsignMenu = MENU_GROUP:New(Group, "Set Callsign...", OptionsMenu)
  local Menu1 = MENU_GROUP:New(Group, "Group 1", CallsignMenu)
  local Menu2 = MENU_GROUP:New(Group, "Group 2",   CallsignMenu)
  local Menu3 = MENU_GROUP:New(Group, "Group 3",   CallsignMenu)
  local Menu4 = MENU_GROUP:New(Group, "Group 4",   CallsignMenu)
  local Menu5 = MENU_GROUP:New(Group, "Group 5",   CallsignMenu)
  local Menu6 = MENU_GROUP:New(Group, "Group 6",   CallsignMenu)
  local Menu7 = MENU_GROUP:New(Group, "Group 7",   CallsignMenu)
  local Menu8 = MENU_GROUP:New(Group, "Group 8",   CallsignMenu)
  local Menu9 = MENU_GROUP:New(Group, "Group 9",   CallsignMenu)
  local Menu10 = MENU_GROUP:New(Group, "Set Integer",   CallsignMenu)
  ----------------------------------------------------------------------------------------------------------------------
  if not Helo then
    MENU_GROUP_COMMAND:New(Group, "Aspen", Menu1, function() AI_ATC:SetCallsign(Alias, "Aspen",   "11") end, Group)
    MENU_GROUP_COMMAND:New(Group, "Mig",   Menu2, function() AI_ATC:SetCallsign(Alias, "Mig",   "11") end, Group)
  else
    MENU_GROUP_COMMAND:New(Group, "Pedro", Menu1, function() AI_ATC:SetCallsign(Alias, "Pedro",   "11") end, Group)
    MENU_GROUP_COMMAND:New(Group, "Razor", Menu2, function() AI_ATC:SetCallsign(Alias, "Razor",   "11") end, Group)
  end
  MENU_GROUP_COMMAND:New(Group, "Chaos", Menu1, function() AI_ATC:SetCallsign(Alias, "Chaos",           "11") end, Group)
  MENU_GROUP_COMMAND:New(Group, "Cylon", Menu1, function() AI_ATC:SetCallsign(Alias, "Cylon",           "11") end, Group)
  MENU_GROUP_COMMAND:New(Group, "Dragon", Menu1, function() AI_ATC:SetCallsign(Alias, "Dragon",         "11") end, Group)
  MENU_GROUP_COMMAND:New(Group, "GunFighter", Menu1, function() AI_ATC:SetCallsign(Alias, "GunFighter", "11") end, Group)
  MENU_GROUP_COMMAND:New(Group, "Nightmare", Menu1, function() AI_ATC:SetCallsign(Alias, "Nightmare",   "11") end, Group)
  MENU_GROUP_COMMAND:New(Group, "Eagle",  Menu1, function() AI_ATC:SetCallsign(Alias, "Eagle",          "11") end, Group)
  MENU_GROUP_COMMAND:New(Group, "Viper",  Menu1, function() AI_ATC:SetCallsign(Alias, "Viper",          "11") end, Group)
  MENU_GROUP_COMMAND:New(Group, "Hornet", Menu1, function() AI_ATC:SetCallsign(Alias, "Hornet",         "11") end, Group)
  MENU_GROUP_COMMAND:New(Group, "Slayer", Menu1, function() AI_ATC:SetCallsign(Alias, "Slayer",         "11") end, Group)
  ----------------------------------------------------------------------------------------------------------------------
  MENU_GROUP_COMMAND:New(Group, "Stalin",  Menu2, function() AI_ATC:SetCallsign(Alias, "Stalin",        "11") end, Group)
  MENU_GROUP_COMMAND:New(Group, "Flanker", Menu2, function() AI_ATC:SetCallsign(Alias, "Flanker",       "11") end, Group)
  MENU_GROUP_COMMAND:New(Group, "Fulcrum", Menu2, function() AI_ATC:SetCallsign(Alias, "Fulcrum",       "11") end, Group)
  MENU_GROUP_COMMAND:New(Group, "Flogger", Menu2, function() AI_ATC:SetCallsign(Alias, "Flogger",       "11") end, Group)
  MENU_GROUP_COMMAND:New(Group, "Ivan",    Menu2, function() AI_ATC:SetCallsign(Alias, "Ivan",          "11") end, Group)
  MENU_GROUP_COMMAND:New(Group, "Grape",    Menu2, function() AI_ATC:SetCallsign(Alias, "Grape",        "11") end, Group)
  MENU_GROUP_COMMAND:New(Group, "Strelka",  Menu2, function() AI_ATC:SetCallsign(Alias, "Strelka",      "11") end, Group)
  MENU_GROUP_COMMAND:New(Group, "Skalpel",  Menu2, function() AI_ATC:SetCallsign(Alias, "Skalpel",      "11") end, Group)
  MENU_GROUP_COMMAND:New(Group, "Rapier",   Menu2, function() AI_ATC:SetCallsign(Alias, "Rapier",       "11") end, Group)
  ----------------------------------------------------------------------------------------------------------------------
  MENU_GROUP_COMMAND:New(Group, "Sniper",  Menu3, function() AI_ATC:SetCallsign(Alias, "Sniper",        "11") end, Group)
  MENU_GROUP_COMMAND:New(Group, "Rage",  Menu3, function() AI_ATC:SetCallsign(Alias, "Rage",            "11") end, Group)
  MENU_GROUP_COMMAND:New(Group, "Venom", Menu3, function() AI_ATC:SetCallsign(Alias, "Venom",           "11") end, Group)
  MENU_GROUP_COMMAND:New(Group, "Jedi", Menu3, function() AI_ATC:SetCallsign(Alias, "Jedi",             "11") end, Group)
  MENU_GROUP_COMMAND:New(Group, "Sting", Menu3, function() AI_ATC:SetCallsign(Alias, "Sting",           "11") end, Group)
  MENU_GROUP_COMMAND:New(Group, "Snake",    Menu3, function() AI_ATC:SetCallsign(Alias, "Snake",        "11") end, Group)
  MENU_GROUP_COMMAND:New(Group, "Heavy",    Menu3, function() AI_ATC:SetCallsign(Alias, "Heavy",        "11") end, Group)
  MENU_GROUP_COMMAND:New(Group, "Raygun",  Menu3, function() AI_ATC:SetCallsign(Alias, "Raygun",        "11") end, Group)
  MENU_GROUP_COMMAND:New(Group, "Cupcake",  Menu3, function() AI_ATC:SetCallsign(Alias, "Cupcake",      "11") end, Group)
  MENU_GROUP_COMMAND:New(Group, "Hawk",   Menu3, function() AI_ATC:SetCallsign(Alias, "Hawk",           "11") end, Group)
  ----------------------------------------------------------------------------------------------------------------------
  MENU_GROUP_COMMAND:New(Group, "Simca",      Menu4, function() AI_ATC:SetCallsign(Alias, "Simca",      "11") end, Group)
  MENU_GROUP_COMMAND:New(Group, "Comet",      Menu4, function() AI_ATC:SetCallsign(Alias, "Comet",      "11") end, Group)
  MENU_GROUP_COMMAND:New(Group, "Razor",      Menu4, function() AI_ATC:SetCallsign(Alias, "Razor",      "11") end, Group)
  MENU_GROUP_COMMAND:New(Group, "Digger",     Menu4, function() AI_ATC:SetCallsign(Alias, "Digger",     "11") end, Group)
  MENU_GROUP_COMMAND:New(Group, "Sabre",      Menu4, function() AI_ATC:SetCallsign(Alias, "Sabre",      "11") end, Group)
  MENU_GROUP_COMMAND:New(Group, "Pirate",     Menu4, function() AI_ATC:SetCallsign(Alias, "Pirate",     "11") end, Group)
  MENU_GROUP_COMMAND:New(Group, "Cannon",     Menu4, function() AI_ATC:SetCallsign(Alias, "Cannon",     "11") end, Group)
  MENU_GROUP_COMMAND:New(Group, "Buckshot",   Menu4, function() AI_ATC:SetCallsign(Alias, "Buckshot",   "11") end, Group)
  MENU_GROUP_COMMAND:New(Group, "Maple",      Menu4, function() AI_ATC:SetCallsign(Alias, "Maple",      "11") end, Group)
  MENU_GROUP_COMMAND:New(Group, "Hellcat",    Menu4, function() AI_ATC:SetCallsign(Alias, "Hellcat",    "11") end, Group)
  ----------------------------------------------------------------------------------------------------------------------
  MENU_GROUP_COMMAND:New(Group, "Sundowner",  Menu5, function() AI_ATC:SetCallsign(Alias, "Sundowner",  "11") end, Group)
  MENU_GROUP_COMMAND:New(Group, "Camelot",    Menu5, function() AI_ATC:SetCallsign(Alias, "Camelot",    "11") end, Group)
  MENU_GROUP_COMMAND:New(Group, "Witchita",   Menu5, function() AI_ATC:SetCallsign(Alias, "Witchita",   "11") end, Group)
  MENU_GROUP_COMMAND:New(Group, "Dog",         Menu5, function() AI_ATC:SetCallsign(Alias, "Dog",       "11") end, Group)
  MENU_GROUP_COMMAND:New(Group, "Lion",        Menu5, function() AI_ATC:SetCallsign(Alias, "Lion",      "11") end, Group)
  MENU_GROUP_COMMAND:New(Group, "Tomcat",      Menu5, function() AI_ATC:SetCallsign(Alias, "Tomcat",    "11") end, Group)
  MENU_GROUP_COMMAND:New(Group, "Retro",       Menu5, function() AI_ATC:SetCallsign(Alias, "Retro",     "11") end, Group)
  MENU_GROUP_COMMAND:New(Group, "Ghostrider",  Menu5, function() AI_ATC:SetCallsign(Alias, "Ghostrider","11") end, Group)
  MENU_GROUP_COMMAND:New(Group, "Dealer",      Menu5, function() AI_ATC:SetCallsign(Alias, "Dealer",    "11") end, Group)
  MENU_GROUP_COMMAND:New(Group, "Dagger",      Menu5, function() AI_ATC:SetCallsign(Alias, "Dagger",    "11") end, Group)
  ----------------------------------------------------------------------------------------------------------------------
  MENU_GROUP_COMMAND:New(Group, "Hammer",     Menu6, function() AI_ATC:SetCallsign(Alias, "Hammer",     "11") end, Group)
  MENU_GROUP_COMMAND:New(Group, "Voodoo",     Menu6, function() AI_ATC:SetCallsign(Alias, "Voodoo",     "11") end, Group)
  MENU_GROUP_COMMAND:New(Group, "Wildman",    Menu6, function() AI_ATC:SetCallsign(Alias, "Wildman",    "11") end, Group)
  MENU_GROUP_COMMAND:New(Group, "Ugly",       Menu6, function() AI_ATC:SetCallsign(Alias, "Ugly",       "11") end, Group)
  MENU_GROUP_COMMAND:New(Group, "Gunstar",    Menu6, function() AI_ATC:SetCallsign(Alias, "Gunstar",    "11") end, Group)
  MENU_GROUP_COMMAND:New(Group, "Felix",       Menu6, function() AI_ATC:SetCallsign(Alias, "Felix",     "11") end, Group)
  MENU_GROUP_COMMAND:New(Group, "Gypsy",       Menu6, function() AI_ATC:SetCallsign(Alias, "Gypsy",     "11") end, Group)
  MENU_GROUP_COMMAND:New(Group, "Black",       Menu6, function() AI_ATC:SetCallsign(Alias, "Black",     "11") end, Group)
  MENU_GROUP_COMMAND:New(Group, "Knight",      Menu6, function() AI_ATC:SetCallsign(Alias, "Knight",    "11") end, Group)
  MENU_GROUP_COMMAND:New(Group, "Black Knight",Menu6, function()AI_ATC:SetCallsign(Alias, "Black Knight","11")end, Group)
  ----------------------------------------------------------------------------------------------------------------------
  MENU_GROUP_COMMAND:New(Group, "Phantom",   Menu7, function() AI_ATC:SetCallsign(Alias, "Phantom", "11") end, Group)
  MENU_GROUP_COMMAND:New(Group, "Bogey",       Menu7, function() AI_ATC:SetCallsign(Alias, "Bogey", "11") end, Group)
  MENU_GROUP_COMMAND:New(Group, "Wolf",     Menu7, function() AI_ATC:SetCallsign(Alias, "Wolf",     "11") end, Group)
  MENU_GROUP_COMMAND:New(Group, "Vixen",    Menu7, function() AI_ATC:SetCallsign(Alias, "Vixen",    "11") end, Group)
  MENU_GROUP_COMMAND:New(Group, "Cargo",    Menu7, function() AI_ATC:SetCallsign(Alias, "Cargo",    "11") end, Group)
  MENU_GROUP_COMMAND:New(Group, "Warrior",  Menu7, function() AI_ATC:SetCallsign(Alias, "Warrior",  "11") end, Group)
  MENU_GROUP_COMMAND:New(Group, "Anvil",    Menu7, function() AI_ATC:SetCallsign(Alias, "Anvil",    "11") end, Group)
  MENU_GROUP_COMMAND:New(Group, "Apache",   Menu7, function() AI_ATC:SetCallsign(Alias, "Apache",   "11") end, Group)
  MENU_GROUP_COMMAND:New(Group, "Hawg",     Menu7, function() AI_ATC:SetCallsign(Alias, "Hawg",     "11") end, Group)
  MENU_GROUP_COMMAND:New(Group, "Boar",     Menu7, function() AI_ATC:SetCallsign(Alias, "Boar",     "11") end, Group)
  ----------------------------------------------------------------------------------------------------------------------
  MENU_GROUP_COMMAND:New(Group, "1",   Menu10, function() AI_ATC:SetCallsign(Alias, nil, "11") end, Group)
  MENU_GROUP_COMMAND:New(Group, "2",   Menu10, function() AI_ATC:SetCallsign(Alias, nil, "21") end, Group)
  MENU_GROUP_COMMAND:New(Group, "3",   Menu10, function() AI_ATC:SetCallsign(Alias, nil, "31") end, Group)
  MENU_GROUP_COMMAND:New(Group, "4",   Menu10, function() AI_ATC:SetCallsign(Alias, nil, "41") end, Group)
  MENU_GROUP_COMMAND:New(Group, "5",   Menu10, function() AI_ATC:SetCallsign(Alias, nil, "51") end, Group)
  MENU_GROUP_COMMAND:New(Group, "6",   Menu10, function() AI_ATC:SetCallsign(Alias, nil, "61") end, Group)
  MENU_GROUP_COMMAND:New(Group, "7",   Menu10, function() AI_ATC:SetCallsign(Alias, nil, "71") end, Group)
  MENU_GROUP_COMMAND:New(Group, "8",   Menu10, function() AI_ATC:SetCallsign(Alias, nil, "81") end, Group)
  MENU_GROUP_COMMAND:New(Group, "9",   Menu10, function() AI_ATC:SetCallsign(Alias, nil, "91") end, Group)
  MENU_GROUP_COMMAND:New(Group, "0",   Menu10, function() AI_ATC:SetCallsign(Alias, nil, "01") end, Group)
end
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--***********************************************************************************CLEARANCE SUB MENU**************************************************************************--
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function AI_ATC:SeperateFromGroup(Alias)
  local Group = GROUP:FindByName(Alias)
  local Menu = MENU_GROUP:New(Group, "Seperate from Group", AI_ATC.ParentMenu)
  
  MENU_GROUP_COMMAND:New(Group, "Seperate from group", Menu, function() AI_ATC:SeperateGroup(Alias, Menu) end, Group)
  
end
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--***********************************************************************GROUND -  ENGINE START SUBMENU**************************************************************************--
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function AI_ATC:GroundStartSubMenu(Alias)
  local Group = ATM.ClientData[Alias].Unit:GetGroup()
  local AI_ATC_Ground_Menu = ATM.ClientData[Alias].GroundMenu
  MENU_GROUP_COMMAND:New(Group, "Request Engine Start", AI_ATC_Ground_Menu, function() AI_ATC:EngineStart(Alias) end, Group)
end
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--***********************************************************************GROUND - TAXI SUB MENU**********************************************************************************--
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function AI_ATC:TaxiSubMenu(Alias)
  local Group = ATM.ClientData[Alias].Unit:GetGroup()
  local Helo = ATM.ClientData[Alias].Helo
  
  local AI_ATC_Ground_Menu = ATM.ClientData[Alias].GroundMenu
  local AI_ATC_Tower_Menu = ATM.ClientData[Alias].TowerMenu
  if Helo==false then
     MENU_GROUP_COMMAND:New( Group, "Request Taxi clearance", AI_ATC_Ground_Menu, function()AI_ATC:TaxiClearance(Alias) end, Group)
  elseif Helo==true then
    MENU_GROUP_COMMAND:New( Group, "Request Taxi clearance", AI_ATC_Ground_Menu, function()AI_ATC:TaxiClearance(Alias) end, Group)
    MENU_GROUP_COMMAND:New( Group, "Request Hover check", AI_ATC_Ground_Menu, function()AI_ATC:HoverCheck(Alias, "Ground") end, Group)
    MENU_GROUP_COMMAND:New( Group, "Request Takeoff from parking", AI_ATC_Tower_Menu, function()AI_ATC:TakeoffFromParking(Alias) end, Group)
  end
end
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--***********************************************************************TOWER TAKEOFF SUB MENU**********************************************************************************--
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function AI_ATC:CrossRunwaySubMenu(Alias, Runway)
  local Group = ATM.ClientData[Alias].Unit:GetGroup()
  local AI_ATC_Tower_Menu = ATM.ClientData[Alias].TowerMenu
  
  local Menu = string.format("Request clearance to cross %s", Runway)
  MENU_GROUP_COMMAND:New(Group, Menu, AI_ATC_Tower_Menu, function() AI_ATC:CrossRunway(Alias) end, Group)
end
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--***********************************************************************TOWER TAKEOFF SUB MENU**********************************************************************************--
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function AI_ATC:LandingHoldSubMenu(Alias, Runway)
  local Group = ATM.ClientData[Alias].Unit:GetGroup()
  local AI_ATC_Ground_Menu = ATM.ClientData[Alias].GroundMenu
  
  local Menu = string.format("Request clearance to cross %s", Runway)
  MENU_GROUP_COMMAND:New(Group, Menu, AI_ATC_Ground_Menu, function() AI_ATC:CrossRunwayLanding(Alias, Runway) end, Group)
end
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--***********************************************************************TOWER JOLLYPAD SUBMENU**********************************************************************************--
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function AI_ATC:CrossPadSubMenu(Alias)
  local Group = ATM.ClientData[Alias].Unit:GetGroup()
  local AI_ATC_Tower_Menu = ATM.ClientData[Alias].TowerMenu
  
  MENU_GROUP_COMMAND:New(Group, "Request clearance to pad", AI_ATC_Tower_Menu, function() AI_ATC:TakePad(Alias) end, Group)
end
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--***********************************************************************GROUND - HOVER CHECK**********************************************************************************--
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function AI_ATC:HoverSubMenu(Alias)
  local Group = ATM.ClientData[Alias].Unit:GetGroup()
  local AI_ATC_Tower_Menu = ATM.ClientData[Alias].TowerMenu
  local HoverMenu = MENU_GROUP_COMMAND:New( Group, "Request hover check", AI_ATC_Tower_Menu, function()AI_ATC:HoverCheck(Alias, "Tower") end, Group)
  
  ATM.ClientData[Alias].TowerMenu = AI_ATC_Tower_Menu
end
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--***********************************************************************TOWER TAKEOFF SUB MENU**********************************************************************************--
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function AI_ATC:HeloTakeOffSubMenu(Alias)
  local Group = ATM.ClientData[Alias].Unit:GetGroup()
  local AI_ATC_Tower_Menu = ATM.ClientData[Alias].TowerMenu
  
  MENU_GROUP_COMMAND:New(Group, "Request Takeoff", AI_ATC_Tower_Menu, function()AI_ATC:HeloTakeoff(Alias) end, Group)
end
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--***********************************************************************TOWER TAKEOFF SUB MENU**********************************************************************************--
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function AI_ATC:TakeOffSubMenu(Alias)
  local Group = ATM.ClientData[Alias].Unit:GetGroup()
  local AI_ATC_Tower_Menu = ATM.ClientData[Alias].TowerMenu
  local Helo = ATM.ClientData[Alias].Helo
  
  MENU_GROUP_COMMAND:New(Group, "Request Takeoff", AI_ATC_Tower_Menu, function()AI_ATC:TakeoffClearance(Alias) end, Group)
  if not Helo then
    local ClimbMenu = MENU_GROUP:New(Group, "Unrestricted climb", AI_ATC_Tower_Menu)
    
    local ClimbMenu1 = MENU_GROUP:New(Group, "5k to 13k", ClimbMenu)
    local ClimbMenu2 = MENU_GROUP:New(Group, "14k to 22k", ClimbMenu)
    local ClimbMenu3 = MENU_GROUP:New(Group, "23k to 29k", ClimbMenu)
    local ClimbMenu4 = MENU_GROUP:New(Group, "30k to 34k", ClimbMenu)
    
    MENU_GROUP_COMMAND:New(Group, "5000", ClimbMenu1, function() AI_ATC:TakeoffClearance(Alias, "5000") end, Group)
    MENU_GROUP_COMMAND:New(Group, "6000", ClimbMenu1, function() AI_ATC:TakeoffClearance(Alias, "6000") end, Group)
    MENU_GROUP_COMMAND:New(Group, "7000", ClimbMenu1, function() AI_ATC:TakeoffClearance(Alias, "7000") end, Group)
    MENU_GROUP_COMMAND:New(Group, "8000", ClimbMenu1, function() AI_ATC:TakeoffClearance(Alias, "8000") end, Group)
    MENU_GROUP_COMMAND:New(Group, "9000", ClimbMenu1, function() AI_ATC:TakeoffClearance(Alias, "9000") end, Group)
    MENU_GROUP_COMMAND:New(Group, "10000", ClimbMenu1, function() AI_ATC:TakeoffClearance(Alias, "10000") end, Group)
    MENU_GROUP_COMMAND:New(Group, "11000", ClimbMenu1, function() AI_ATC:TakeoffClearance(Alias, "11000") end, Group)
    MENU_GROUP_COMMAND:New(Group, "12000", ClimbMenu1, function() AI_ATC:TakeoffClearance(Alias, "12000") end, Group)
    MENU_GROUP_COMMAND:New(Group, "13000", ClimbMenu1, function() AI_ATC:TakeoffClearance(Alias, "13000") end, Group)
  
    MENU_GROUP_COMMAND:New(Group, "14000", ClimbMenu1, function() AI_ATC:TakeoffClearance(Alias, "14000") end, Group)
    MENU_GROUP_COMMAND:New(Group, "15000", ClimbMenu2, function() AI_ATC:TakeoffClearance(Alias, "15000") end, Group)
    MENU_GROUP_COMMAND:New(Group, "16000", ClimbMenu2, function() AI_ATC:TakeoffClearance(Alias, "16000") end, Group)
    MENU_GROUP_COMMAND:New(Group, "17000", ClimbMenu2, function() AI_ATC:TakeoffClearance(Alias, "17000") end, Group)
    MENU_GROUP_COMMAND:New(Group, "FL180", ClimbMenu2, function() AI_ATC:TakeoffClearance(Alias, "18000") end, Group)
    MENU_GROUP_COMMAND:New(Group, "FL190", ClimbMenu2, function() AI_ATC:TakeoffClearance(Alias, "19000") end, Group)
    MENU_GROUP_COMMAND:New(Group, "FL200", ClimbMenu2, function() AI_ATC:TakeoffClearance(Alias, "20000") end, Group)
    MENU_GROUP_COMMAND:New(Group, "FL210", ClimbMenu2, function() AI_ATC:TakeoffClearance(Alias, "21000") end, Group)
    MENU_GROUP_COMMAND:New(Group, "FL220", ClimbMenu2, function() AI_ATC:TakeoffClearance(Alias, "22000") end, Group)
  
    MENU_GROUP_COMMAND:New(Group, "FL230", ClimbMenu3, function() AI_ATC:TakeoffClearance(Alias, "23000") end, Group)
    MENU_GROUP_COMMAND:New(Group, "FL240", ClimbMenu3, function() AI_ATC:TakeoffClearance(Alias, "24000") end, Group)
    MENU_GROUP_COMMAND:New(Group, "FL250", ClimbMenu3, function() AI_ATC:TakeoffClearance(Alias, "25000") end, Group)
    MENU_GROUP_COMMAND:New(Group, "FL260", ClimbMenu3, function() AI_ATC:TakeoffClearance(Alias, "26000") end, Group)
    MENU_GROUP_COMMAND:New(Group, "FL270", ClimbMenu3, function() AI_ATC:TakeoffClearance(Alias, "27000") end, Group)
    MENU_GROUP_COMMAND:New(Group, "FL280", ClimbMenu3, function() AI_ATC:TakeoffClearance(Alias, "28000") end, Group)
    MENU_GROUP_COMMAND:New(Group, "FL290", ClimbMenu3, function() AI_ATC:TakeoffClearance(Alias, "29000") end, Group)
  
    MENU_GROUP_COMMAND:New(Group, "FL300", ClimbMenu4, function() AI_ATC:TakeoffClearance(Alias, "30000") end, Group)
    MENU_GROUP_COMMAND:New(Group, "FL310", ClimbMenu4, function() AI_ATC:TakeoffClearance(Alias, "31000") end, Group)
    MENU_GROUP_COMMAND:New(Group, "FL320", ClimbMenu4, function() AI_ATC:TakeoffClearance(Alias, "32000") end, Group)
    MENU_GROUP_COMMAND:New(Group, "FL330", ClimbMenu4, function() AI_ATC:TakeoffClearance(Alias, "33000") end, Group)
    MENU_GROUP_COMMAND:New(Group, "FL340", ClimbMenu4, function() AI_ATC:TakeoffClearance(Alias, "34000") end, Group)
  end
end
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--***********************************************************************DEPARTURE SUB MENU**************************************************************************************--
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function AI_ATC:DepartureSubMenu(Alias, missed)
  local Group = ATM.ClientData[Alias].Unit:GetGroup()
  local DepartureMenu = ATM.ClientData[Alias].DepartureMenu
  local AppraochMenu = ATM.ClientData[Alias].ApproachMenu
  local Randomizer = math.random(1,3)
  
  if Randomizer==1 and missed~=true then
    MENU_GROUP_COMMAND:New(Group, "Check in", DepartureMenu, function() AI_ATC:DepartureIdent(Alias) end, Group)
  elseif Randomizer~=1 and missed~=true then
    MENU_GROUP_COMMAND:New(Group, "Check in", DepartureMenu, function() AI_ATC:DepartureCheckin(Alias) end, Group)
  elseif missed==true then
    MENU_GROUP_COMMAND:New(Group, "Check in", AppraochMenu, function() AI_ATC:MissedApproach(Alias) end, Group)
  end
end
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--***********************************************************************DEPARTURE IDENT SUB MENU********************************************************************************--
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function AI_ATC:IdentSubMenu(Alias)
  local Group = ATM.ClientData[Alias].Unit:GetGroup()
  local DepartureMenu = ATM.ClientData[Alias].DepartureMenu
  
  MENU_GROUP_COMMAND:New(Group, "Flash", DepartureMenu, function() AI_ATC:DepartureCheckin(Alias) end, Group)
end
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--***********************************************************************DEPARTURE SUB MENU**************************************************************************************--
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function AI_ATC:NavigationSubMenu(Alias, Modifier)
  local Transmitter = "Departure"
  local Group = ATM.ClientData[Alias].Unit:GetGroup()
  local Runway = AI_ATC.Runways.Takeoff[1]
  local SID = ATM.ClientData[Alias].SID
  
  local Procedure, DepartureMenu, VFR, ReferenceTbl, Report, Subtitle
  Procedure = ATM.ClientData[Alias].RequestedProcedure
  
  DepartureMenu = ATM.ClientData[Alias].DepartureMenu
  local ReportMenu = MENU_GROUP:New(Group, "Report...", DepartureMenu)
  local VectorMenu = MENU_GROUP:New(Group, "Vector to...", DepartureMenu)
  local NavPoint = MENU_GROUP:New(Group, "Navpoint", VectorMenu)
  local Blank = MENU_GROUP:New(Group, "", VectorMenu)
  if Procedure=="VFR" then
    
  
  elseif Procedure=="IFR" then
    ReferenceTbl = AI_ATC.SID[Runway][SID].NAVPOINTS
    
    for index, navpoint in ipairs(ReferenceTbl) do
      if navpoint and navpoint.GetName then
        local Name = navpoint:GetName()
        Report = "Report Point " .. Name
        MENU_GROUP_COMMAND:New(Group, Report, ReportMenu, function()AI_ATC:RadarTerminate(Alias) end, Group)
        
        Subtitle = "Vectors for Point " .. Name
        MENU_GROUP_COMMAND:New(Group, Subtitle, NavPoint, function() AI_ATC:NavAssist(Alias, Name, Transmitter) end, Group)
      end
    end
  end
  
  local AirfieldMenu = MENU_GROUP:New(Group, "Airfield", VectorMenu)
  AI_ATC:AirfieldMenus(Transmitter, Alias, AirfieldMenu)
  
  MENU_GROUP_COMMAND:New(Group, "Request Approach", DepartureMenu, function() AI_ATC:RequestApproach(Alias) end, Group)
end

-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--***********************************************************************APPROACH SUB MENU**************************************************************************************--
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function AI_ATC:ApproachSubMenu(Alias)
  local Group = ATM.ClientData[Alias].Unit:GetGroup()
  local Helo = ATM.ClientData[Alias].Helo
  local Procedure = AI_ATC.Procedure
  
  local AppraochMenu = ATM.ClientData[Alias].ApproachMenu
  local CheckInMenu = MENU_GROUP:New(Group, "Check in...", AppraochMenu)
  if Helo then
    MENU_GROUP_COMMAND:New(Group, "VFR", CheckInMenu, function() AI_ATC:ApproachCheckIn(Alias, "VFR") end, Group)
  else
    if Procedure=="VFR" then
      MENU_GROUP_COMMAND:New(Group, "VFR", CheckInMenu, function() AI_ATC:ApproachCheckIn(Alias, "VFR") end, Group)
      MENU_GROUP_COMMAND:New(Group, "IFR", CheckInMenu, function() AI_ATC:ApproachCheckIn(Alias, "IFR") end, Group)
    else
      MENU_GROUP_COMMAND:New(Group, "", CheckInMenu, function()  end, Group)
      MENU_GROUP_COMMAND:New(Group, "IFR", CheckInMenu, function() AI_ATC:ApproachCheckIn(Alias, "IFR") end, Group)
    end
  end
end
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--***********************************************************************APPROACH TYPE MENU**************************************************************************************--
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function AI_ATC:ApproachTypeMenu(Alias)

  local Group        = ATM.ClientData[Alias].Unit:GetGroup()
  local Procedure    = AI_ATC.Procedure
  local Runway       = AI_ATC.Runways.Landing[1]
  local ApproachMenu = ATM.ClientData[Alias].ApproachMenu
  local IFRMenu      = MENU_GROUP:New(Group, "IFR...", ApproachMenu)
  
  MENU_GROUP_COMMAND:New(Group, "Cancel IFR", ApproachMenu, function() AI_ATC:CancelIFR(Alias) end, Group)
  
  local function GenerateIFRMenus()
    if Runway == "05" then
      MENU_GROUP_COMMAND:New(Group, "HI\\LO TAC",     IFRMenu, function() AI_ATC:IFRApproachType1(Alias, "HI\\LO TAC") end, Group)
      MENU_GROUP_COMMAND:New(Group, "HI\\LO ILS",     IFRMenu, function() AI_ATC:IFRApproachType1(Alias, "HI\\LO ILS") end, Group)
      MENU_GROUP_COMMAND:New(Group, "TAC05",          IFRMenu, function() AI_ATC:IFRApproachType4(Alias, "TACAN")      end, Group)
      MENU_GROUP_COMMAND:New(Group, "TAC05 Final",    IFRMenu, function() AI_ATC:IFRApproachType3(Alias, "TACAN")      end, Group)
      MENU_GROUP_COMMAND:New(Group, "ILS\\LOC",       IFRMenu, function() AI_ATC:IFRApproachType4(Alias, "ILS")        end, Group)
      MENU_GROUP_COMMAND:New(Group, "ILS\\LOC Final", IFRMenu, function() AI_ATC:IFRApproachType3(Alias, "ILS")        end, Group)
    elseif Runway == "23" then
      MENU_GROUP_COMMAND:New(Group, "HI\\LO TAC",     IFRMenu, function() AI_ATC:IFRApproachType1(Alias, "HI\\LO TAC") end, Group)
      MENU_GROUP_COMMAND:New(Group, "HI\\LO ILS",     IFRMenu, function() AI_ATC:IFRApproachType1(Alias, "HI\\LO ILS") end, Group)
      MENU_GROUP_COMMAND:New(Group, "TAC23",          IFRMenu, function() AI_ATC:IFRApproachType4(Alias, "TACAN")      end, Group)
      MENU_GROUP_COMMAND:New(Group, "TAC23 Final",    IFRMenu, function() AI_ATC:IFRApproachType3(Alias, "TACAN")      end, Group)
      MENU_GROUP_COMMAND:New(Group, "ILS\\LOC",       IFRMenu, function() AI_ATC:IFRApproachType4(Alias, "ILS")        end, Group)
      MENU_GROUP_COMMAND:New(Group, "ILS\\LOC Final", IFRMenu, function() AI_ATC:IFRApproachType3(Alias, "ILS")        end, Group)
    end
    MENU_GROUP_COMMAND:New(Group, "Request GCA", IFRMenu, function() AI_ATC:PushGCA(Alias) end, Group)
  end
  
  GenerateIFRMenus()
  
end
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--***************************************************************************GCA SUBMENU****************************************************************************************--
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function AI_ATC:GCASubMenu(Alias, missed, modifier)
  local Group = ATM.ClientData[Alias].Unit:GetGroup()
  
  local AppraochMenu = ATM.ClientData[Alias].ApproachMenu
  if not modifier then
    MENU_GROUP_COMMAND:New(Group, "GCA Check in", AppraochMenu, function() AI_ATC:IFRApproachType5(Alias, "PAR") end, Group)
  else
    MENU_GROUP_COMMAND:New(Group, "GCA Check in", AppraochMenu, function() AI_ATC:ApproachBackToRadar(Alias, "PAR") end, Group)
  end

end
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--*********************************************************************APPROACH B2R CHECK IN MENU********************************************************************************--
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function AI_ATC:B2CheckInSubMenu(Alias)
  local Group = ATM.ClientData[Alias].Unit:GetGroup()
  local AppraochMenu = ATM.ClientData[Alias].ApproachMenu

  MENU_GROUP_COMMAND:New(Group, "Check in", AppraochMenu, function() AI_ATC:B2RCheckIn(Alias) end, Group)
end
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--******************************************************************APPROACH BACK TO RADAR SUB MENU******************************************************************************--
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function AI_ATC:BackToRadarSubMenu(Alias)
  local Group = ATM.ClientData[Alias].Unit:GetGroup()
  local ActiveRunway = AI_ATC.Runways.Landing[1]
  local TacSub = "TAC"..ActiveRunway
  local TacFinal = TacSub.." Final"
  
  local ApproachMenu = ATM.ClientData[Alias].ApproachMenu
  local IFRMenu = MENU_GROUP:New(Group, "IFR", ApproachMenu)
  MENU_GROUP_COMMAND:New(Group, "Cancel IFR", ApproachMenu, function() AI_ATC:CancelIFR(Alias) end, Group)
  
  MENU_GROUP_COMMAND:New(Group, "", IFRMenu, function()  end, Group)
  MENU_GROUP_COMMAND:New(Group, " ", IFRMenu, function()  end, Group)
  MENU_GROUP_COMMAND:New(Group, TacSub, IFRMenu, function() AI_ATC:ApproachBackToRadar(Alias, "TACAN") end, Group)
  MENU_GROUP_COMMAND:New(Group, TacFinal, IFRMenu, function() AI_ATC:ApproachBackToRadar(Alias, "TACAN") end, Group)
  MENU_GROUP_COMMAND:New(Group, "ILS\\LOC", IFRMenu, function() AI_ATC:ApproachBackToRadar(Alias, "ILS") end, Group)
  MENU_GROUP_COMMAND:New(Group, "ILS\\LOC Final", IFRMenu, function() AI_ATC:ApproachBackToRadar(Alias, "ILS") end, Group)
  MENU_GROUP_COMMAND:New(Group, "Request GCA", IFRMenu, function() AI_ATC:PushGCA(Alias, true, true) end, Group)
  
end
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--***********************************************************************APPROACH NAV ASSIST*************************************************************************************--
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function AI_ATC:ApproachAssistMenu(Alias, report)
  local Transmitter = "Approach"
  local ClientData = ATM.ClientData[Alias]
  local Group = ClientData.Unit:GetGroup()
  local Helo = ClientData.Helo
  local AI_ATC_Menu = ClientData.ParentMenu
  local Procedure = ClientData.Approach.Type
  local Runway = AI_ATC.Runways.Landing[1]
  local BlankIndex = ""
  
  local function SetApproachType(Type)
    ATM.ClientData[Alias].Approach.Type = Type
  end
  
  local ReportTable, ReferenceTable, Navpoint, Plate, Chart, Recovery
  
  local ApproachMenu = ATM.ClientData[Alias].ApproachMenu
  local VectorMenu = MENU_GROUP:New(Group, "Vector to Navpoint", ApproachMenu)
  
  if Procedure=="VFR" then
    if Helo then
      ReferenceTable = AI_ATC.ApproachPlates[Runway].NAVPOINTS
      MENU_GROUP_COMMAND:New(Group, "", ApproachMenu, function() end, Group)
    else
      ReferenceTable = AI_ATC.ApproachPlates[Runway].NAVPOINTS
      MENU_GROUP_COMMAND:New(Group, "Request IFR Pickup", ApproachMenu, function() SetApproachType("IFR") AI_ATC:ApproachReportFix(Alias, true) end, Group)
    end
  elseif Procedure=="IFR" then
    Recovery = ATM.ClientData[Alias].Recovery
    Chart = ATM.ClientData[Alias].Chart
    ReferenceTable = AI_ATC.Charts[Runway][Chart].NAVPOINTS
    if report then
      Navpoint = Recovery
      local MenuTxt = "Report "..Navpoint
      MENU_GROUP_COMMAND:New(Group, MenuTxt, ApproachMenu, function() AI_ATC:ApproachReportFix(Alias, true) end, Group)
    else
      MENU_GROUP_COMMAND:New(Group, "Cancel IFR", ApproachMenu, function() AI_ATC:CancelIFR(Alias) end, Group)
    end
  end
  
  for index, navpoint in ipairs(ReferenceTable) do
    if navpoint and navpoint.GetName then
      local Name = navpoint:GetName()
      if Name=="BLANK" then
        BlankIndex = BlankIndex.." "
        MENU_GROUP_COMMAND:New(Group, BlankIndex, VectorMenu, function() end, Group)
      else
        local Subtitle = "Vectors for " .. Name
        MENU_GROUP_COMMAND:New(Group, Subtitle, VectorMenu, function() AI_ATC:NavAssist(Alias, Name, Transmitter) end, Group)
      end
    end
  end
  
  local AirfieldMenu = MENU_GROUP:New(Group, "Vector to Airfield", ApproachMenu)
  AI_ATC:AirfieldMenus(Transmitter, Alias, AirfieldMenu)
  
end
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--***********************************************************************APPROACH VECTOR TO FINAL********************************************************************************--
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function AI_ATC:VectorToFinal(Alias, Tbl, Transmitter)
  local CleintData = ATM.ClientData[Alias]
  local Group = CleintData.Unit:GetGroup()
  local AI_ATC_Menu = CleintData.ParentMenu
  local Procedure = CleintData.Approach.Type
  local Approach = CleintData.Chart
  local Runway = AI_ATC.Runways.Landing[1] 
  local ApproachMenu = ATM.ClientData[Alias].ApproachMenu
  
  local Downwind = Tbl[1].Navpoint
  local DownWindCoord = AI_ATC_Navpoints[Downwind]
  
  local Base = Tbl[2].Navpoint
  local BaseCoord = AI_ATC_Navpoints[Base]
  
  local VectorMenu = MENU_GROUP:New(Group, "Vector to...", ApproachMenu)
  MENU_GROUP_COMMAND:New(Group, "Radar Downwind", VectorMenu, function() AI_ATC:NavAssist(Alias, Downwind, Transmitter, "Downwind") end, Group)
  MENU_GROUP_COMMAND:New(Group, "Radar Base", VectorMenu, function() AI_ATC:NavAssist(Alias, Base, Transmitter, "Base") end, Group)
end
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--***********************************************************************APPROACH SUB MENU**************************************************************************************--
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function AI_ATC:CancelIFRSubMenu(Alias)
  local Group = ATM.ClientData[Alias].Unit:GetGroup()
  
  local AppraochMenu = ATM.ClientData[Alias].ApproachMenu
  MENU_GROUP_COMMAND:New(Group, "Cancel IFR", AppraochMenu, function() AI_ATC:CancelIFR(Alias) end, Group)
  
end
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--******************************************************************MISSED APPROACH SUB MENU*************************************************************************************--
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function AI_ATC:MissedApproachMenu(Alias)
  local Transmitter = "Approach"
  local Group = ATM.ClientData[Alias].Unit:GetGroup()
  local ApproachMenu = ATM.ClientData[Alias].ApproachMenu
  local IFRMenu = MENU_GROUP:New(Group, "IFR", ApproachMenu)
  local Type = ATM.ClientData[Alias].Chart
  local Runway = AI_ATC.Runways.Landing[1]
  local ApproachData = ApproachSettings[Runway][Type]
  local Navpoint = ApproachData.Missed
  local Procedure1 = "Vector for "..Navpoint
  local Procedure2 = "Request ILS\\LOC"
  local Procedure3 = "Request TAC"..Runway
  local Procedure4 = "Request Departure"
  
  MENU_GROUP_COMMAND:New(Group, "Cancel IFR", ApproachMenu, function() AI_ATC:CancelIFR(Alias) end, Group)

  if Runway == "05" then
    MENU_GROUP_COMMAND:New(Group, Procedure1,       IFRMenu, function() AI_ATC:NavAssist(Alias, Navpoint, Transmitter)end, Group)
    MENU_GROUP_COMMAND:New(Group, Procedure4,       IFRMenu, function() AI_ATC:RequestDeparture(Alias)                end, Group)
    MENU_GROUP_COMMAND:New(Group, "TAC05",          IFRMenu, function() AI_ATC:IFRApproachType4(Alias, "TACAN", true) end, Group)
    MENU_GROUP_COMMAND:New(Group, "TAC05 Final",    IFRMenu, function() AI_ATC:IFRApproachType3(Alias, "TACAN", true) end, Group)
    MENU_GROUP_COMMAND:New(Group, "ILS\\LOC",       IFRMenu, function() AI_ATC:IFRApproachType4(Alias, "ILS", true)   end, Group)
    MENU_GROUP_COMMAND:New(Group, "ILS\\LOC Final", IFRMenu, function() AI_ATC:IFRApproachType3(Alias, "ILS", true)   end, Group)
  elseif Runway == "23" then
    MENU_GROUP_COMMAND:New(Group, Procedure1,       IFRMenu, function() AI_ATC:NavAssist(Alias, Navpoint, Transmitter)end, Group)
    MENU_GROUP_COMMAND:New(Group, Procedure4,       IFRMenu, function() AI_ATC:RequestDeparture(Alias)                end, Group)
    MENU_GROUP_COMMAND:New(Group, "TAC23",          IFRMenu, function() AI_ATC:IFRApproachType4(Alias, "TACAN", true) end, Group)
    MENU_GROUP_COMMAND:New(Group, "TAC23 Final",    IFRMenu, function() AI_ATC:IFRApproachType3(Alias, "TACAN", true) end, Group)
    MENU_GROUP_COMMAND:New(Group, "ILS\\LOC",       IFRMenu, function() AI_ATC:IFRApproachType4(Alias, "ILS", true)   end, Group)
    MENU_GROUP_COMMAND:New(Group, "ILS\\LOC Final", IFRMenu, function() AI_ATC:IFRApproachType3(Alias, "ILS", true)   end, Group)
  end
  MENU_GROUP_COMMAND:New(Group, "Request GCA",    ApproachMenu, function() AI_ATC:PushGCA(Alias, true) end, Group)
end
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--*******************************************************************TOWER LANDING SUB MENU**************************************************************************************--
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function AI_ATC:LandingSubMenu(Alias, Modifier)
  local ClientData    = ATM.ClientData[Alias]
  local Group         = ClientData.Unit:GetGroup()
  local TowerMenu     = ClientData.TowerMenu
  local ApproachType  = ClientData.Approach.Type
  local Helo          = ClientData.Helo
  local Procedure     = AI_ATC.Procedure
  
  if ApproachType == "Generic" then
    ApproachType = Procedure
  end
  
  local CommandMenu = MENU_GROUP:New(Group, "Request Landing", TowerMenu)
  
  if Helo~=true then
    if ApproachType == "VFR" then
      MENU_GROUP_COMMAND:New(Group, "Straight In", CommandMenu, function() AI_ATC:StraightIn(Alias) end, Group)
      MENU_GROUP_COMMAND:New(Group, "Overhead", CommandMenu, function() AI_ATC:Overhead(Alias) end, Group)
      MENU_GROUP_COMMAND:New(Group, "SFO", CommandMenu, function() AI_ATC:SFO(Alias) end, Group)
      --MENU_GROUP_COMMAND:New(Group, "PAR", CommandMenu, function() AI_ATC:RequestPAR(Alias) end, Group)
      if Modifier then
        MENU_GROUP_COMMAND:New(Group, "Request Departure", CommandMenu, function() AI_ATC:RadarVectorDeparture(Alias) end, Group)
      end
    elseif ApproachType == "IFR" then
      MENU_GROUP_COMMAND:New(Group, "Instrument Straight In", CommandMenu, function() AI_ATC:InstrumentStraightIn(Alias) end, Group)
      if Modifier then
        MENU_GROUP_COMMAND:New(Group, " ", CommandMenu, function() end, Group)
        MENU_GROUP_COMMAND:New(Group, "  ", CommandMenu, function() end, Group)
        MENU_GROUP_COMMAND:New(Group, "Request Back to Radar", CommandMenu, function() AI_ATC:RadarVectorDeparture(Alias) end, Group)
      end
    end
  else
    MENU_GROUP_COMMAND:New(Group, "Straight In", CommandMenu, function() AI_ATC:HeloRequestLanding(Alias, "Straight In") end, Group)
    MENU_GROUP_COMMAND:New(Group, "Closed traffic", CommandMenu, function() AI_ATC:HeloRequestLanding(Alias, "Closed traffic") end, Group)
  end
  ATM.ClientData[Alias].TowerMenu = TowerMenu
end
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--***********************************************************************TOWER REPORT INITIAL************************************************************************************--
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function AI_ATC:InitialSubMenu(Alias)
  local Group = ATM.ClientData[Alias].Unit:GetGroup()
  local TowerMenu = ATM.ClientData[Alias].TowerMenu
  local CommandMenu = MENU_GROUP:New(Group, "Report", TowerMenu)
  local InitialMenu = MENU_GROUP:New(Group, "Report 5 mile", CommandMenu)
  MENU_GROUP_COMMAND:New(Group, "Full Stop", InitialMenu, function() AI_ATC:RequestFullStop(Alias) end, Group)
  MENU_GROUP_COMMAND:New(Group, "Touch and Go", InitialMenu, function() AI_ATC:RequestTouchGo(Alias) end, Group)
  MENU_GROUP_COMMAND:New(Group, "Low Approach", InitialMenu, function() AI_ATC:RequestLowApproach(Alias) end, Group)
  MENU_GROUP_COMMAND:New(Group, "Option", InitialMenu, function() AI_ATC:RequestOption(Alias) end, Group)
  AI_ATC:TowerAncilleryMenu(Alias)
end
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--***********************************************************************TOWER REPORT INITIAL************************************************************************************--
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function AI_ATC:OverheadInitialSubMenu(Alias)
  local Group = ATM.ClientData[Alias].Unit:GetGroup()
  local TowerMenu = ATM.ClientData[Alias].TowerMenu
  local CommandMenu = MENU_GROUP:New(Group, "Report", TowerMenu)
  MENU_GROUP_COMMAND:New(Group, "Report initial", CommandMenu, function() AI_ATC:Report5MileInitial(Alias) end, Group)
  AI_ATC:TowerAncilleryMenu(Alias)
end
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--***********************************************************************TOWER REPORT HIGH KEY***********************************************************************************--
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function AI_ATC:ReportHighKeyMenu(Alias)
  local Group = ATM.ClientData[Alias].Unit:GetGroup()
  local TowerMenu = ATM.ClientData[Alias].TowerMenu
  local CommandMenu = MENU_GROUP:New(Group, "Report", TowerMenu)
  MENU_GROUP_COMMAND:New(Group, "Report High Key", CommandMenu, function() AI_ATC:ReportKey(Alias, "High") end, Group)
  AI_ATC:TowerAncilleryMenu(Alias)
end
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--***********************************************************************TOWER REPORT LOW KEY***********************************************************************************--
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function AI_ATC:ReportLowKeyMenu(Alias)
  local Group = ATM.ClientData[Alias].Unit:GetGroup()
  local TowerMenu = ATM.ClientData[Alias].TowerMenu
  local CommandMenu = MENU_GROUP:New(Group, "Report", TowerMenu)
  MENU_GROUP_COMMAND:New(Group, "Report Low Key", CommandMenu, function() AI_ATC:ReportKey(Alias, "Low") end, Group)
  AI_ATC:TowerAncilleryMenu(Alias)
end
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--***********************************************************************TOWER REPORT INITIAL************************************************************************************--
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function AI_ATC:ReportBaseSubMenu(Alias)
  local Group = ATM.ClientData[Alias].Unit:GetGroup()
  local TowerMenu = ATM.ClientData[Alias].TowerMenu
  local CommandMenu = MENU_GROUP:New(Group, "Report", TowerMenu)
  local BaseMenu = MENU_GROUP:New(Group, "Report base", CommandMenu)
  MENU_GROUP_COMMAND:New(Group, "Full Stop", BaseMenu, function() AI_ATC:RequestFullStop(Alias) end, Group)
  MENU_GROUP_COMMAND:New(Group, "Touch and Go", BaseMenu, function() AI_ATC:RequestTouchGo(Alias) end, Group)
  MENU_GROUP_COMMAND:New(Group, "Low Approach", BaseMenu, function() AI_ATC:RequestLowApproach(Alias) end, Group)
  MENU_GROUP_COMMAND:New(Group, "Option", BaseMenu, function() AI_ATC:RequestOption(Alias) end, Group)
  AI_ATC:TowerAncilleryMenu(Alias)
end
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--***********************************************************************HELO REPORT BASE************************************************************************************--
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function AI_ATC:HeloBaseSubMenu(Alias, Type)
  local Group = ATM.ClientData[Alias].Unit:GetGroup()
  local TowerMenu = ATM.ClientData[Alias].TowerMenu
  if Type=="Closed traffic" then
    MENU_GROUP_COMMAND:New(Group, "Report base", TowerMenu, function() AI_ATC:HeloBase(Alias) end, Group)
  else
    MENU_GROUP_COMMAND:New(Group, "Report base", TowerMenu, function() AI_ATC:HeloBase(Alias) end, Group)
  end
end
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--*******************************************************************TOWER WINGMAN REPORT INITIAL********************************************************************************--
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function AI_ATC:WingmanBaseSubMenu(Alias)
  local Group = ATM.ClientData[Alias].Unit:GetGroup()
  local Agency = ATM.ClientData[Alias].OtherAgency
  local Wingman2Menu = MENU_GROUP:New(Group, "Wingman #2", Agency)
  local CommandMenu = MENU_GROUP:New(Group, "Report", Wingman2Menu)
  local BaseMenu = MENU_GROUP:New(Group, "Report base", CommandMenu)
  MENU_GROUP_COMMAND:New(Group, "Full Stop", BaseMenu, function() AI_ATC:WingmanReportBase(Alias, "Full Stop", "2") end, Group)
  MENU_GROUP_COMMAND:New(Group, "Touch and Go", BaseMenu, function() AI_ATC:WingmanReportBase(Alias, "Touch and Go", "2") end, Group)
  MENU_GROUP_COMMAND:New(Group, "Low Approach", BaseMenu, function() AI_ATC:WingmanReportBase(Alias, "Low Approach", "2") end, Group)
  MENU_GROUP_COMMAND:New(Group, "Option", BaseMenu, function() AI_ATC:WingmanReportBase(Alias, "Option", "2") end, Group)
  
  ATM.ClientData[Alias].Wingman2Menu = Wingman2Menu
  
  local Wingman3Menu = MENU_GROUP:New(Group, "Wingman #3", Agency)
  local CommandMenu3 = MENU_GROUP:New(Group, "Report", Wingman3Menu)
  local BaseMenu3 = MENU_GROUP:New(Group, "Report base", CommandMenu3)
  MENU_GROUP_COMMAND:New(Group, "Full Stop", BaseMenu3, function() AI_ATC:WingmanReportBase(Alias, "Full Stop", "3") end, Group)
  MENU_GROUP_COMMAND:New(Group, "Touch and Go", BaseMenu3, function() AI_ATC:WingmanReportBase(Alias, "Touch and Go", "3") end, Group)
  MENU_GROUP_COMMAND:New(Group, "Low Approach", BaseMenu3, function() AI_ATC:WingmanReportBase(Alias, "Low Approach", "3") end, Group)
  MENU_GROUP_COMMAND:New(Group, "Option", BaseMenu3, function() AI_ATC:WingmanReportBase(Alias, "Option", "3") end, Group)
  
  ATM.ClientData[Alias].Wingman3Menu = Wingman3Menu
  
  local Wingman4Menu = MENU_GROUP:New(Group, "Wingman #4", Agency)
  local CommandMenu4 = MENU_GROUP:New(Group, "Report", Wingman4Menu)
  local BaseMenu4 = MENU_GROUP:New(Group, "Report base", CommandMenu4)
  MENU_GROUP_COMMAND:New(Group, "Full Stop", BaseMenu4, function() AI_ATC:WingmanReportBase(Alias, "Full Stop", "4") end, Group)
  MENU_GROUP_COMMAND:New(Group, "Touch and Go", BaseMenu4, function() AI_ATC:WingmanReportBase(Alias, "Touch and Go", "4") end, Group)
  MENU_GROUP_COMMAND:New(Group, "Low Approach", BaseMenu4, function() AI_ATC:WingmanReportBase(Alias, "Low Approach", "4") end, Group)
  MENU_GROUP_COMMAND:New(Group, "Option", BaseMenu4, function() AI_ATC:WingmanReportBase(Alias, "Option", "4") end, Group)
  
  ATM.ClientData[Alias].Wingman4Menu = Wingman4Menu
end
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--******************************************************************TOWER WINGMAN REQUEST CLOSED*********************************************************************************--
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function AI_ATC:WingmanClosedSubMenu(Alias)
  local Group = ATM.ClientData[Alias].Unit:GetGroup()
  local Agency = ATM.ClientData[Alias].OtherAgency
  
  local Wingman2Menu = ATM.ClientData[Alias].Wingman2Menu
  if Wingman2Menu then
    local Command2Menu = MENU_GROUP:New(Group, "Request", Wingman2Menu)
    MENU_GROUP_COMMAND:New(Group, "Request closed traffic", Command2Menu, function() AI_ATC:WingmanClosedTraffic(Alias, "2") end, Group)
  end
  
  local Wingman3Menu = ATM.ClientData[Alias].Wingman3Menu
  if Wingman3Menu then
    local Command3Menu = MENU_GROUP:New(Group, "Request", Wingman3Menu)
    MENU_GROUP_COMMAND:New(Group, "Request closed traffic", Command3Menu, function() AI_ATC:WingmanClosedTraffic(Alias, "3") end, Group)
  end
  
  local Wingman4Menu = ATM.ClientData[Alias].Wingman4Menu
  if Wingman4Menu then
    local Command4Menu = MENU_GROUP:New(Group, "Request", Wingman4Menu)
    MENU_GROUP_COMMAND:New(Group, "Request closed traffic", Command4Menu, function() AI_ATC:WingmanClosedTraffic(Alias, "4") end, Group)
  end
end
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--**************************************************************************TOWER GO AROUND**************************************************************************************--
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function AI_ATC:GoAroundSubMenu(Alias, modifier)
  local Group = ATM.ClientData[Alias].Unit:GetGroup()
  local TowerMenu = ATM.ClientData[Alias].TowerMenu
  local Runway = AI_ATC.Runways.Landing[1]
  local ApproachType = ATM.ClientData[Alias].Approach.Type
  local Proceedure = AI_ATC.Procedure
  local CommandMenu = MENU_GROUP:New(Group, "Request", TowerMenu)
  local Recovery, Approach, Subtitle
  
  if ApproachType=="Generic" then
    ApproachType = Proceedure
  end
  
  local function SetApproachType(type)
    ATM.ClientData[Alias].RequestedProcedure = type
    ATM.ClientData[Alias].Recovery =Recovery
    ATM.ClientData[Alias].Approach.Type = type
    ATM.ClientData[Alias].Chart = "TACAN"
  end
  
  if Runway=="05" then
    Recovery = "OSLUP"
  elseif Runway=="23" then
    Recovery = "OGBON"
  end
  
  Subtitle = "Break out"

  if Proceedure=="VFR" then
    MENU_GROUP_COMMAND:New(Group, "Request closed traffic", CommandMenu, function() SetApproachType("VFR") AI_ATC:ClosedTraffic(Alias) end, Group)
    MENU_GROUP_COMMAND:New(Group, "Request Back to Radar", CommandMenu, function() SetApproachType("IFR") AI_ATC:BackToRadar(Alias) end, Group)
    MENU_GROUP_COMMAND:New(Group, "Missed Approach", CommandMenu, function() SetApproachType("IFR") AI_ATC:GoAround(Alias) end, Group)
    MENU_GROUP_COMMAND:New(Group, Subtitle, CommandMenu, function() SetApproachType("VFR") AI_ATC:GoAround(Alias) end, Group)
  elseif Proceedure=="IFR" then
    MENU_GROUP_COMMAND:New(Group, " ", CommandMenu, function()  end, Group)
    MENU_GROUP_COMMAND:New(Group, "Request Back to Radar", CommandMenu, function()SetApproachType("IFR") AI_ATC:BackToRadar(Alias) end, Group)
    MENU_GROUP_COMMAND:New(Group, "Missed Approach", CommandMenu, function()SetApproachType("IFR") AI_ATC:GoAround(Alias, "IFR") end, Group)
    MENU_GROUP_COMMAND:New(Group, "  ", CommandMenu, function()  end, Group)
  end
  
  if modifier then
    MENU_GROUP_COMMAND:New(Group, "Full stop", CommandMenu, function() AI_ATC:RollOutLanding(Alias) end, Group)
  end
  
  AI_ATC:TowerAncilleryMenu(Alias)
end
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--**************************************************************************TOWER GO AROUND**************************************************************************************--
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function AI_ATC:GCAGoAroundSubMenu(Alias, RadioObject)
  local Group = ATM.ClientData[Alias].Unit:GetGroup()
  local ApproachMenu = ATM.ClientData[Alias].ApproachMenu
  local Runway = AI_ATC.Runways.Landing[1]
  local ApproachType = ATM.ClientData[Alias].Approach.Type
  local Proceedure = AI_ATC.Procedure
  local CommandMenu = MENU_GROUP:New(Group, "Request", ApproachMenu)
  MENU_GROUP_COMMAND:New(Group, "Cancel IFR", ApproachMenu, function() AI_ATC:CancelIFR(Alias, "Tower") end, Group)
  
  if ApproachType=="Generic" then
    ApproachType = Proceedure
  end
  
  local Subtitle = "Break out"
  
  if Proceedure=="VFR" then
    MENU_GROUP_COMMAND:New(Group, "Request closed traffic", CommandMenu, function() AI_ATC:GCAPushTower(Alias, RadioObject) end, Group)
    MENU_GROUP_COMMAND:New(Group, "Request Back to Radar", CommandMenu, function() AI_ATC:GCAPushTower(Alias, RadioObject) end, Group)
    MENU_GROUP_COMMAND:New(Group, "Missed Approach", CommandMenu, function() AI_ATC:GCAPushTower(Alias, RadioObject) end, Group)
    MENU_GROUP_COMMAND:New(Group, Subtitle, CommandMenu, function() AI_ATC:GCAPushTower(Alias, RadioObject) end, Group)
  elseif Proceedure=="IFR" then
    MENU_GROUP_COMMAND:New(Group, "", CommandMenu, function()  end, Group)
    MENU_GROUP_COMMAND:New(Group, "Request Back to Radar", CommandMenu, function()AI_ATC:GCAPushTower(Alias, RadioObject) end, Group)
    MENU_GROUP_COMMAND:New(Group, "Missed Approach", CommandMenu, function()AI_ATC:GCAPushTower(Alias, RadioObject) end, Group)
  end

end
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--**************************************************************************TOWER CHECK IN***************************************************************************************--
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function AI_ATC:TowerCheckIn2Menu(Alias)
  local Group = ATM.ClientData[Alias].Unit:GetGroup()
  local TowerMenu = ATM.ClientData[Alias].TowerMenu
  local CommandMenu = MENU_GROUP:New(Group, "Request", TowerMenu)

  MENU_GROUP_COMMAND:New(Group, "Check In", CommandMenu, function() AI_ATC:GCATowerCheckIn(Alias) end, Group)

  AI_ATC:TowerAncilleryMenu(Alias)
end
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--**********************************************************************TOWER REPORT NAVPOINT************************************************************************************--
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function AI_ATC:NavpointSubMenu(Alias)
  local Group = ATM.ClientData[Alias].Unit:GetGroup()
  local Runway = AI_ATC.Runways.Landing[1]
  local TowerMenu = ATM.ClientData[Alias].TowerMenu
  local Subtitle 
  
  if Runway=="05" then
    Subtitle = "Report EAGLE"
  else
    Subtitle = "Report FALCON"
  end

  MENU_GROUP_COMMAND:New(Group, Subtitle, TowerMenu, function() AI_ATC:SayIntentions(Alias) end, Group)

end
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--***************************************************************************AI_ATC TOWER ANCILLARY MENU*************************************************************************--
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function AI_ATC:TowerAncilleryMenu(Alias)

  local Client = ATM.ClientData[Alias]
  local Group = Client.Unit:GetGroup()
  local TowerMenu = Client.TowerMenu
  local AncilaryMenu = MENU_GROUP:New(Group, "Ancilary", TowerMenu)
  
  local NavPoint
  local TowerController = ATM.TowerControl[Alias]
  if TowerController and TowerController.RequestedApproach=="SFO" then
    NavPoint = "NORTH POINT"
  end
  
  MENU_GROUP_COMMAND:New(Group,"Traffic in sight", AncilaryMenu, function() AI_ATC:AcknowledgeTraffic(Alias, true) end, Group)
  MENU_GROUP_COMMAND:New(Group,"No Joy", AncilaryMenu, function() AI_ATC:AcknowledgeTraffic(Alias, false) end, Group)
  MENU_GROUP_COMMAND:New(Group,"Acknowledge Extend Downwind", AncilaryMenu, function() AI_ATC:AcknowledgeExtend(Alias) end, Group)
  MENU_GROUP_COMMAND:New(Group,"Say Winds", AncilaryMenu, function() AI_ATC:TowerWinds(Alias) end, Group)
  MENU_GROUP_COMMAND:New(Group,"Break Out", AncilaryMenu, function() AI_ATC:BreakOut(Alias, NavPoint) end, Group)

end
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--*************************************************************************PARKING SUB MENU**************************************************************************************--
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function AI_ATC:ParkingSubMenu(Alias)
  local ClientData = ATM.ClientData[Alias]
  local Group = ClientData.Unit:GetGroup()
  local GroundMenu = ClientData.GroundMenu
  local Helo = ClientData.Helo
  
  if Helo==false then
    MENU_GROUP_COMMAND:New(Group, "Taxi to Parking", GroundMenu, function() AI_ATC:TaxiParking(Alias) end, Group)
  elseif Helo==true then
    MENU_GROUP_COMMAND:New(Group, "Taxi to Parking", GroundMenu, function() AI_ATC:TaxiParking(Alias) end, Group)
  end
end
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--*******************************************************************************ATC CLEARANCE_CHECKIN_FUNCTIONS*****************************************************************--
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function AI_ATC:VFR_Clearance(Alias)
  ATM.ClientData[Alias].RequestedProcedure = "VFR"
  AI_ATC:ClearanceDelivery(Alias)
end


function AI_ATC:IFR_Clearance(Alias, SID)
  ATM.ClientData[Alias].RequestedProcedure = "IFR"
  ATM.ClientData[Alias].SID = SID
  AI_ATC:ClearanceDelivery(Alias, SID)
end
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--****************************************************************************ATC TOWER CHECKIN MENU*****************************************************************************--
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function AI_ATC:InstrumentStraightIn(Alias)
  ATM.ClientData[Alias].Landing.Procedure = "Instrument Straight in"
  AI_ATC:Tower_Checkin(Alias)
end

function AI_ATC:RequestPAR(Alias)
  ATM.ClientData[Alias].Landing.Procedure = "Instrument Straight in"
  AI_ATC:TowerPAR(Alias)
end

function AI_ATC:StraightIn(Alias)
  ATM.ClientData[Alias].Landing.Procedure = "Straight in"
  AI_ATC:Tower_Checkin(Alias)
end

function AI_ATC:Overhead(Alias)
  ATM.ClientData[Alias].Landing.Procedure = "Overhead"
  AI_ATC:Tower_Checkin(Alias)
end

function AI_ATC:SFO(Alias)
  ATM.ClientData[Alias].Landing.Procedure = "SFO"
  AI_ATC:Tower_Checkin(Alias)
end

function AI_ATC:RequestFullStop(Alias)
  ATM.ClientData[Alias].Landing.Type = "Full Stop"
  AI_ATC:ReportInitial(Alias)
end

function AI_ATC:RequestTouchGo(Alias)
  ATM.ClientData[Alias].Landing.Type = "Touch and Go"
  AI_ATC:ReportInitial(Alias)
end

function AI_ATC:RequestLowApproach(Alias)
  ATM.ClientData[Alias].Landing.Type = "Low Approach"
  AI_ATC:ReportInitial(Alias)
end

function AI_ATC:RequestOption(Alias)
  ATM.ClientData[Alias].Landing.Type = "Option"
  AI_ATC:ReportInitial(Alias)
end

-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--***************************************************************************AI_ATC SET CALLSIGN*********************************************************************************--
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function AI_ATC:SetCallsign(Alias, Callsign, Integer)
  AI_ATC.CustomCallsigns[Alias] = AI_ATC.CustomCallsigns[Alias] or {}

  local ClientObject = ATM.ClientData[Alias]
  if not ClientObject then return end

  local CurrentCallsign = ClientObject.Callsign or ""

  if Integer ~= nil then
    Integer = tostring(Integer)
  end

  local function splitAtFirstNumeric(str)
    local position = string.find(str, "%d")
    if position then
      local prefix = string.sub(str, 1, position - 1)
      return prefix
    else
      return str
    end
  end

  local NewCallsign

  if not Callsign and Integer then
    CurrentCallsign = string.gsub(CurrentCallsign, "-", "")
    local prefix = splitAtFirstNumeric(CurrentCallsign)
    NewCallsign = prefix .. Integer

  elseif Callsign and Integer then
    Callsign = string.gsub(Callsign, "-", "")
    NewCallsign = Callsign .. Integer

  elseif Callsign and not Integer then
    Callsign = string.gsub(Callsign, "-", "")
    NewCallsign = Callsign .. "11"

  else
    NewCallsign = CurrentCallsign
  end

  AI_ATC.CustomCallsigns[Alias].Callsign = NewCallsign
  env.info(string.format("Registering unique Callsign %s for %s", NewCallsign, Alias))

  if ATM.ClientData[Alias] then
    local Unit = ATM.ClientData[Alias].Unit
    if Unit then
      USERSOUND:New("RADIO_TRANS_START.ogg"):ToUnit(Unit)
    end
    ATM.ClientData[Alias].Callsign = NewCallsign
    AI_ATC:UpdateFlightCallsign(Alias)
  end
end
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--*****************************************************************************AI_ATC VALIDATE FLIGHTGROUP**********************************************************************--
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function AI_ATC:ValidateFlightGroups()

  local function TableIsEmpty(t)
    if not t then
      return true
    end
    for _, _ in pairs(t) do
      return false
    end
    return true
  end
  
  for groupName, groupTable in pairs(AI_ATC.FlightGroup) do
    local hostExists = false
    local hostGroup = GROUP:FindByName(groupName)
    
    if hostGroup then
      local hostUnit = hostGroup:GetUnit(1)
      if hostUnit and hostUnit:IsAlive() then
        hostExists = true
      end
    end
    
    if not hostExists then

      for initiatorAlias, _ in pairs(groupTable) do
        env.info(string.format("AI_ATC:ValidateFlightGroups -> Host '%s' no longer exists, removing initiator '%s'", groupName, initiatorAlias))
      end
      AI_ATC.FlightGroup[groupName] = nil
    else

      for initiatorAlias, data in pairs(groupTable) do
        local playerGroup = data.PlayerGroup
        local playerUnit = nil
        
        if playerGroup and playerGroup:IsAlive() then
          playerUnit = playerGroup:GetUnit(1)
        end
        
        if not playerGroup or not playerGroup:IsAlive() or not playerUnit or not playerUnit:IsAlive() then
          env.info(string.format("AI_ATC:ValidateFlightGroups -> Initiator '%s' no longer valid, removing from group '%s'", initiatorAlias, groupName))
          groupTable[initiatorAlias] = nil
        end
      end
      

      if TableIsEmpty(groupTable) then
        AI_ATC.FlightGroup[groupName] = nil
        env.info(string.format("AI_ATC:ValidateFlightGroups -> Flight group '%s' is now empty, removing", groupName))
      end
    end
  end
end
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--*********************************************************************************AI_ATC JOIN GROUP MENU***********************************************************************--
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function AI_ATC:JoinGroup(Alias)
  local ClientData = ATM.ClientData[Alias]
  if not ClientData then return end
  local Unit = ClientData.Unit
  if not Unit or not Unit:IsAlive() then
    return
  end
  local Group = Unit:GetGroup()
  if not Group then
    return
  end
  local GroupMenu = ClientData.JoinGroupMenu
  if not GroupMenu then
    return
  end
  
  local SchedulerObject
  SchedulerObject = SCHEDULER:New(nil, function()
    if not ATM.ClientData[Alias] or not Unit or not Unit:IsAlive() then
      SchedulerObject:Stop()
      return
    end
    
    if GroupMenu and GroupMenu.RemoveSubMenus then
      GroupMenu:RemoveSubMenus()
    else
      SchedulerObject:Stop()
      return
    end
    
    local ClientCoord = Unit:GetCoordinate()
    local ClientTbl = {}
    
      for alias, data in pairs(ATM.ClientData) do
        local clientAlias = alias
        if clientAlias ~= Alias then
          local UnitObject = data.Unit
          if UnitObject then
            local coord = UnitObject:GetCoordinate()
            local Distance = ClientCoord:Get2DDistance(coord)
            table.insert(ClientTbl, {Name = clientAlias, Distance = Distance})
          end
        end
      end
      
      table.sort(ClientTbl, function(a, b)
        return a.Distance < b.Distance
      end)
      
      local maxItems = math.min(10, #ClientTbl)
      for i = 1, maxItems do
        local data = ClientTbl[i]
        local ClientName = data.Name

        local isInYourGroup = AI_ATC.FlightGroup[Alias] and AI_ATC.FlightGroup[Alias][ClientName]
        
        if GroupMenu and ATM.ClientData[ClientName] and not isInYourGroup then
          MENU_GROUP_COMMAND:New(Group, ClientName, GroupMenu, function()
            
            local HostGroup = GROUP:FindByName(ClientName)
            if not HostGroup then
              env.info(("AI_ATC:AddPlayerToGroup -> Group not found '%s'."):format(ClientName))
              return
            end
          
            local clientData = ATM.ClientData[Alias]
            if not clientData then
              env.info(("AI_ATC:AddPlayerToGroup -> No ClientData found for '%s'."):format(Alias))
              return
            end
          
            local PlayerGroup = clientData.Group or (clientData.Unit and clientData.Unit:GetGroup())
            if not PlayerGroup then
              env.info(("AI_ATC:AddPlayerToGroup -> No group for player '%s'."):format(Alias))
              return
            end
            
            if AI_ATC.FlightGroup[Alias] and AI_ATC.FlightGroup[Alias][ClientName] then
              env.info(("AI_ATC:AddPlayerToGroup -> Unable to Join group %s, Client is already in YOUR group '%s'."):format(ClientName, Alias))
              return
            end
            
            AI_ATC:AddPlayerToGroup(ClientName, Alias) 
            SchedulerObject:Stop()
            SchedulerObject = nil
          end, Group)
        end
      end
  end,{}, 0.5, 60)
end
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--***************************************************************************AI_ATC SET GROUP************************************************************************************--
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function AI_ATC:AddPlayerToGroup(GroupName, PlayerAlias)
  local HostGroup = GROUP:FindByName(GroupName)
  if not HostGroup then
    env.info(("AI_ATC:AddPlayerToGroup -> Group not found '%s'."):format(GroupName))
    return
  end

  local clientData = ATM.ClientData[PlayerAlias]
  if not clientData then
    env.info(("AI_ATC:AddPlayerToGroup -> No ClientData found for '%s'."):format(PlayerAlias))
    return
  end

  local PlayerGroup = clientData.Group or (clientData.Unit and clientData.Unit:GetGroup())
  if not PlayerGroup then
    env.info(("AI_ATC:AddPlayerToGroup -> No group for player '%s'."):format(PlayerAlias))
    return
  end

  local Unit = clientData.Unit
  AI_ATC:RemoveMenus(PlayerAlias)
  AI_ATC:SeperateFromGroup(PlayerAlias)

  if Unit and Unit:IsAlive() then
    USERSOUND:New("RADIO_TRANS_START.ogg"):ToUnit(Unit)
  end
  
  if ATM.ClientData[PlayerAlias].CrewChief then
    ATM.ClientData[PlayerAlias].CrewChief:Destroy()
  end

  ATM.ClientData[PlayerAlias] = nil
  ATM.GroundControl[PlayerAlias] = nil
  ATM.TaxiController[PlayerAlias] = nil
  ATM.TowerControl[PlayerAlias] = nil

  AI_ATC.FlightGroup[GroupName] = AI_ATC.FlightGroup[GroupName] or {}
  AI_ATC.FlightGroup[GroupName][PlayerAlias] = {
    HostGroup   = HostGroup,
    PlayerGroup = PlayerGroup,
  }

  env.info(("AI_ATC:AddPlayerToGroup -> '%s' joined flight group '%s'."):format(PlayerAlias, GroupName))
end
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--***************************************************************************AI_ATC SEPERATE GROUP*******************************************************************************--
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function AI_ATC:SeperateGroup(Alias, Menu)
  local function TableIsEmpty(t)
    if not t then
      return true
    end
    for _, _ in pairs(t) do
      return false
    end
    return true
  end

  local Group = GROUP:FindByName(Alias)
  if Group then
    local Unit = Group:GetUnit(1)
    if Unit and Unit:IsAlive() then
      USERSOUND:New("RADIO_TRANS_START.ogg"):ToUnit(Unit)
    end
  end

  local menuRemoved = false

  for groupName, groupTable in pairs(AI_ATC.FlightGroup) do
    if groupTable[Alias] then
      groupTable[Alias] = nil

      if not menuRemoved and Menu and Menu.Remove then
        Menu:Remove()
        menuRemoved = true
      end

      if TableIsEmpty(groupTable) then
        AI_ATC.FlightGroup[groupName] = nil
      end
    end
  end
end
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--***************************************************************************FIND TRANSMITTER************************************************************************************--
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function AI_ATC:FindTransmitter(Alias, Agency)

  if not ATM.ClientData[Alias] or not AI_ATC.Radio[Agency] then
    return
  end
  
  local Frequecy = AI_ATC.Radio[Agency].UserFreq
  local TransmitFrequency = AI_ATC.Radio[Agency][Frequecy]
  local PlayerCoord = ATM.ClientData[Alias].Unit:GetCoordinate()
  local UnitObject, ClosestTransmitter, Coord, TXLOS
  local shortestDistance = math.huge
  
  for _, entry in ipairs(AI_ATC_Transmitters) do
    local TransmitterName = entry.COMM1
    local Transmitter = UNIT:FindByName(TransmitterName)
    local TransmitterCoord = Transmitter:GetCoordinate()
    local Range = PlayerCoord:Get2DDistance(TransmitterCoord)
    local LOS = TransmitterCoord:IsLOS(PlayerCoord, 0)
    if Range < shortestDistance then
      shortestDistance = Range
      ClosestTransmitter = TransmitterName
      Coord = TransmitterCoord
      ATCRepeater = entry.Repeater
      UnitObject = Transmitter
      TXLOS = LOS
    end
  end
  
  UnitObject:CommandSetFrequency(TransmitFrequency, 0, 100)

  local RadioObject = RADIOQUEUE:New(TransmitFrequency, 0)
  RadioObject:SetSenderUnitName(ClosestTransmitter)
  RadioObject:Start()

  return RadioObject

end
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--******************************************************************************CHANNEL OPEN*************************************************************************************--
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function AI_ATC:ChannelOpen(delay, agency, Alias)
  local Type = ATM.ClientData[Alias].Type
  local Frequency, TransmitFrequency
  
  if agency ~= nil then 
    Frequency = AI_ATC.Radio[agency].UserFreq
    TransmitFrequency = AI_ATC.Radio[agency][Frequency]
  end
  
  if Type == "F-16C_50" or Type == "AH-64D_BLK_II" then
    if (agency=="Clearance" or agency=="Ground" or agency=="Tower") then
      local Unit = UNIT:FindByName("Generic_Repeater")
      Unit:CommandSetFrequency(TransmitFrequency, 0, 100)
      local AI_ATC_Transmitter = Unit:GetRadio()
      AI_ATC_ChannelOpen = AI_ATC_Transmitter:NewUnitTransmission("UHF_NOISE.ogg", nil, nil, TransmitFrequency, radio.modulation.AM, true)
      AI_ATC_ChannelOpen:Broadcast()
    else
      local Unit = UNIT:FindByName(ATCRepeater)
      Unit:CommandSetFrequency(TransmitFrequency, 0, 100)
      local AI_ATC_Transmitter = Unit:GetRadio()
      AI_ATC_ChannelOpen = AI_ATC_Transmitter:NewUnitTransmission("UHF_NOISE.ogg", nil, nil, TransmitFrequency, radio.modulation.AM, true)
      AI_ATC_ChannelOpen:Broadcast()
      SCHEDULER:New( nil, function()
        if AI_ATC_ChannelOpen then
          AI_ATC_ChannelOpen:StopBroadcast()
          AI_ATC_ChannelOpen = nil
        end
      end,{}, delay)
    end
  end
end
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--*****************************************************************************FIND AAR TANKERS**********************************************************************************--
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function AI_ATC:FindTankerUnits()
  AI_ATC.Tankers = {
    [0] = {},
    [1] = {},
  }
  
  local TankerUnits = SET_UNIT:New():FilterActive():FilterCategories("plane"):FilterOnce()
  TankerUnits:ForEach(function(UnitObject)
    local UnitName = UnitObject:GetName()
    local TypeName = UnitObject:GetTypeName()
    if TypeName=="KC130" then 
      table.insert(AI_ATC.Tankers[1], UnitName)
    elseif TypeName=="KC-135" then 
      table.insert(AI_ATC.Tankers[0], UnitName)
    elseif TypeName=="KC135MPRS" then
      table.insert(AI_ATC.Tankers[1], UnitName)
    elseif TypeName=="S-3B Tanker" then
      table.insert(AI_ATC.Tankers[1], UnitName)
    end
  end)
end
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--***************************************************************************ENABLE CREW CHIEF***********************************************************************************--
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function AI_ATC:EnableCrewChief(Boolean)
  if Boolean==true then
    AI_ATC.CrewChief = true
  else
    AI_ATC.CrewChief = false
  end
end
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--***************************************************************************SPAWN CREW CHIEF*********-**************************************************************************--
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function AI_ATC:SpawnCrewChief(Alias)
  if AI_ATC.CrewChief~=true then
    return
  end
  
  local ClientData = ATM.ClientData[Alias]
  local Unit = ClientData.Unit
  local Group = Unit:GetGroup()

  local unitCoord   = Unit:GetCoordinate()
  local unitHeading = Unit:GetHeading()
  local offsetFront = 19 
  local offsetSide  = 10
  local sideAngle   = -90

  local frontCoord  = unitCoord:Translate(offsetFront, unitHeading, false, false)
  local chiefCoord  = frontCoord:Translate(offsetSide, unitHeading + sideAngle, false, false)

  local headingToUnit = chiefCoord:HeadingTo(unitCoord)
  local name          = Alias .. "_CrewChief"

  local chiefTemplate = GROUP:FindByName("CrewChief")
  if not chiefTemplate then
    env.info("AI_ATC: 'CrewChief' template not found. Using default static object.")

    local vec2 = chiefCoord:GetVec2()
    local fallbackObject = {
      heading    = math.rad(headingToUnit),
      groupId    = 0,
      shape_name = "carrier_tech_USA",
      type       = "us carrier tech",
      unitId     = 0,
      rate       = 1,
      name       = name,
      category   = "Personnel",
      y          = vec2.y,
      x          = vec2.x,
      dead       = false,
    }

    local staticObj = coalition.addStaticObject(country.id.CJTF_BLUE, fallbackObject)

    if not staticObj then
      env.warning("AI_ATC: Failed to spawn default static object for '" .. tostring(Alias) .. "'.")
      return
    else
      SCHEDULER:New(nil, function()
        ATM.ClientData[Alias].CrewChief = STATIC:FindByName(name)
      end, {}, 1)
    end
    
  else
    local ChiefSchedule
    local CrewChief = SPAWN:NewWithAlias("CrewChief", name)
    CrewChief:InitCountry(country.id.CJTF_BLUE)
    CrewChief:InitHeading(headingToUnit)

    CrewChief:OnSpawnGroup(function(spawnGroup)
      local chiefUnit = spawnGroup:GetUnit(1)
      ATM.ClientData[Alias].CrewChief = chiefUnit

      ChiefSchedule = SCHEDULER:New(nil, function()

        if not ATM.ClientData[Alias] then
          spawnGroup:Destroy()
          ChiefSchedule:Stop()
          return
        end

        local velocity = Unit:GetVelocityKNOTS()
        if velocity > 1 then
          spawnGroup:OptionAlarmStateRed()
          SCHEDULER:New(nil, function()
            spawnGroup:OptionAlarmStateGreen()
          end, {}, 5)
          ChiefSchedule:Stop()
        end
      end, {}, 1, 1)
    end)

    CrewChief:SpawnFromCoordinate(chiefCoord)
  end
end
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--***************************************************************************INITIALISE CLIENTS**********************************************************************************--
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function AI_ATC:InitClients()

  ATC_CLIENTS = SET_CLIENT:New():FilterActive():FilterStart()
  local TCN = AI_ATC_Navpoints.DANTCN and AI_ATC_Navpoints.DANTCN:GetCoordinate()
  local Runway = AI_ATC.Runways.Takeoff[1]
  if not TCN then
    env.warning("AI_ATC:InitClients -> 'AI_ATC_Navpoints.DANTCN' or its coordinate is nil.")
  end
  
  local function CheckFlightGroups(Alias)
    for groupName, groupTable in pairs(AI_ATC.FlightGroup) do
      for ClientName, _ in pairs(groupTable) do
        if ClientName==Alias then
          return true
        end
      end
    end
    return false
  end
  
  local function LogClients()
    AI_ATC:ValidateFlightGroups()
    local activeClients = {}
    ATC_CLIENTS:ForEachClient(function(clientObject)
      if not clientObject then
        return
      end
      local clientAlias = clientObject:GetClientGroupName()
      if not clientAlias then return end
      activeClients[clientAlias] = true
      if ATM.ClientData[clientAlias] then
        local group = clientObject:GetGroup()
        if group and group:IsAlive() then
          local flightUnits = group:CountAliveUnits()
          local wingmanAlive = 
            (AI_Wingman_2_Unit and AI_Wingman_2_Unit:IsAlive()) or
            (AI_Wingman_3_Unit and AI_Wingman_3_Unit:IsAlive()) or
            (AI_Wingman_4_Unit and AI_Wingman_4_Unit:IsAlive())
          local hasFlightGroup = AI_ATC.FlightGroup[clientAlias] ~= nil
          if flightUnits > 1 or wingmanAlive or hasFlightGroup then
            ATM.ClientData[clientAlias].Flight = true
            AI_ATC:UpdateFlightCallsign(clientAlias)
          else
            ATM.ClientData[clientAlias].Flight = false
          end
        end

      else
        if CheckFlightGroups(clientAlias) then
          return
        end
        
        local group = clientObject:GetGroup()
        local unit  = clientObject:GetClientGroupUnit()

        if not group or not unit or not unit:IsAlive() then
          return
        end

        local flightUnits = group:CountAliveUnits()
        local coord       = unit:GetCoordinate()
        local callsign    = unit:GetCallsign()
        local typeName    = unit:GetTypeName()
        local isHelo      = unit:IsHelicopter()

        if AI_ATC.CustomCallsigns[clientAlias] and AI_ATC.CustomCallsigns[clientAlias].Callsign then
          callsign = AI_ATC.CustomCallsigns[clientAlias].Callsign
        end

        ATM.ClientData[clientAlias] = {
          Unit              = unit,
          Coord             = coord,
          Callsign          = callsign,
          Type              = typeName,
          Helo              = isHelo,
          Heliport          = false,
          Flight            = (flightUnits > 1),
          FlightCallsign    = "",
          TakeoffClearance  = false,
          Procedure         = AI_ATC.Procedure,
          RequestedProcedure= "IFR",
          SID               = string.format("Delta %s", Runway),
          State             = "Parked",
          Chart             = "TACAN",
          Recovery          = AI_ATC.Recovery,
          Approach          = { Type = AI_ATC.Procedure },
          Landing           = { Procedure = "Straight in", Type = "Option" },
          SchedulerObjects  = {},
          ParkingSpace = "76",
          Squawk = "",
        }

        if isHelo then
          ATM.ClientData[clientAlias].RequestedProcedure = "VFR"
        end
        
        local Random = tostring(math.random(1, 7))
        local Squawk = string.format("%s001", Random)
        ATM.ClientData[clientAlias].Squawk = Squawk

        AI_ATC:UpdateFlightCallsign(clientAlias)

        if group:IsAirborne() then
          ATM.ClientData[clientAlias].State = "AirBorne"
          local parentMenu = AI_ATC.ParentMenu
          ATM.ClientData[clientAlias].ParentMenu = parentMenu
          AI_ATC:InitMenus(clientAlias)
          AI_ATC:ResetMenus(clientAlias)
          if TCN then
            local range = coord:Get2DDistance(TCN)
            if range >= 24076 then
              ATM.ClientData[clientAlias].Approach.Type = "IFR"
              AI_ATC:ApproachSubMenu(clientAlias)
            else
              AI_ATC:LandingSubMenu(clientAlias)
              AI_ATC:DepartureSubMenu(clientAlias)
            end
          end
        else
          if TCN then
            local range = coord:Get2DDistance(TCN)
            if range < 5556 then

              local parentMenu = AI_ATC.ParentMenu
              ATM.ClientData[clientAlias].ParentMenu = parentMenu
              AI_ATC:InitMenus(clientAlias)
              AI_ATC:ResetMenus(clientAlias)
              AI_ATC:ClearanceSubMenu(clientAlias)
              AI_ATC:GroundStartSubMenu(clientAlias)
              if not isHelo then
                AI_ATC:SpawnCrewChief(clientAlias)
              end
            else
              ATM.ClientData[clientAlias].Approach.Type = "IFR"
              AI_ATC:ApproachSubMenu(clientAlias)
            end
          end
        end

        local Iterations = 10

        local function ProcessingComplete(clientAlias)
          local cdata = ATM.ClientData[clientAlias]
          if not cdata then return end
          local taxiway = cdata.Taxi
          if taxiway and taxiway[1] then
            local zone = AI_ATC.TaxiWay[taxiway[1]] and AI_ATC.TaxiWay[taxiway[1]].Zone
            if zone then
              AI_ATC:CalculateTaxiEntry(clientAlias, cdata.Coord, zone, true)
            end
          end
        end

        local function process()
          local completed = false
          while not completed do
            local startTime = timer.getTime()
            local count     = 0

            local cdata = ATM.ClientData[clientAlias]
            if not cdata or not cdata.Unit then
              env.info("AI_ATC:InitClients -> Missing client data or unit, stopping coroutine.")
              return
            end

            local groupObj = cdata.Unit:GetGroup()
            if not groupObj then
              env.info("AI_ATC:InitClients -> Missing group object, stopping coroutine.")
              return
            end

            local closestCoord, terminalID, distance, parkingSpotInfo = cdata.Coord:GetClosestParkingSpot(AI_ATC_Airbase)

            if not groupObj:IsAirborne() then
              cdata.SpotCoord  = closestCoord
              cdata.SpotNumber = terminalID
            else
              cdata.SpotNumber = 11
              local spotData   = AI_ATC_Airbase:GetParkingSpotData(11)
              if spotData then
                cdata.SpotCoord = spotData.Coordinate
              end
            end

            for spot, info in pairs(Incirlik_ParkingSpot) do
              if info.Number == cdata.SpotNumber then
                cdata.Taxi = info.Taxi[AI_ATC.Runways.Takeoff[1]]
                ProcessingComplete(clientAlias)

                local endTime  = timer.getTime()
                local duration = endTime - startTime
                env.info(string.format("Parking data for %s calculated in %.2f seconds in spot %s.", clientAlias, duration, spot))
                completed = true
                break
              end

              count = count + 1
              if count >= Iterations then
                coroutine.yield()
                count = 0
              end
            end

            if completed then
              return
            end
          end
        end
        ATC_Coroutine:AddCoroutine(process)
      end
    end)

    for oldAlias in pairs(ATM.ClientData) do
      if not activeClients[oldAlias] and oldAlias~="Test F-16" then
        env.info("Removing inactive client: " .. oldAlias)
        if ATM.ClientData[oldAlias].CrewChief then
          ATM.ClientData[oldAlias].CrewChief:Destroy()
        end
        ATM.ClientData[oldAlias]    = nil
        ATM.GroundControl[oldAlias] = nil
      end
    end
  end

  LogClients()

  SCHEDULER:New(nil, function()
    LogClients()
  end, {}, 10, 10)
end

-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--***************************************************************************CALCULATE TAXI ENTRY *******************************************************************************--
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function AI_ATC:UpdateClient(Alias, Debug)

  if not ATM.ClientData or not ATM.ClientData[Alias] then
    if Debug then
      env.info(("AI_ATC:UpdateClient -> No data found for alias '%s'."):format(Alias))
    end
    return
  end

  local clientData = ATM.ClientData[Alias]
  local Unit       = clientData.Unit
  local Group      = Unit and Unit:GetGroup()
  local UnitCoord  = Unit and Unit:GetCoordinate()
  local airbase    = AI_ATC_Airbase
  local spotsTable = Incirlik_ParkingSpot
  local runways    = AI_ATC.Runways and AI_ATC.Runways.Takeoff or {}


  if not (Unit and Group and UnitCoord and airbase and runways[1] and spotsTable) then
    if Debug then
      env.info(("AI_ATC:UpdateClient -> Missing essential data for alias '%s'."):format(Alias))
    end
    return
  end


  local MAX_ITERATIONS = 10
  local updateRequired = false
  local function ProcessingComplete()
    local taxiway = clientData.Taxi
    if taxiway and taxiway[1] then
      local zone = AI_ATC.TaxiWay[taxiway[1]] and AI_ATC.TaxiWay[taxiway[1]].Zone
      if zone then
        AI_ATC:CalculateTaxiEntry(Alias, UnitCoord, zone, false)
      end
    end
  end

  local function process()
    local completed = false
    local count     = 0
    while not completed do
      if not Group:IsAirborne() then
        local ClosestCoord, TerminalID, Distance, ParkingSpotInfo = UnitCoord:GetClosestParkingSpot(airbase)

        if Distance and Distance <= 10 then
          clientData.SpotCoord = ClosestCoord
          clientData.SpotNumber = TerminalID
          clientData.Coord = UnitCoord
          updateRequired = true
        end

        if clientData.SpotNumber ~= nil and updateRequired then
          local startTime = timer.getTime()
          for spot, info in pairs(spotsTable) do
            if info.Number == clientData.SpotNumber then
              clientData.Taxi = info.Taxi[runways[1]]
              ProcessingComplete()
              if clientData.Mark ~= nil then
                clientData.Mark = ClosestCoord:MarkToGroup(spot, Group, true)
              end
              if Debug then
                local endTime  = timer.getTime()
                local duration = endTime - startTime
                env.info(("Parking data for %s calculated in %.2f seconds in spot %s."):format(Alias, duration, spot))
              end
              completed = true
              break
            end
          end
          count = count + 1
          if count >= MAX_ITERATIONS and not completed then
            coroutine.yield()
            count = 0
          end
        else
          completed = true
        end
      else
        completed = true
      end
      if completed then
        return
      end
    end
  end

  ATC_Coroutine:AddCoroutine(process)
end
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--***************************************************************************CALCULATE TAXI ENTRY *******************************************************************************--
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function AI_ATC:CalculateTaxiEntry(Alias, Coordinate, PolyZone, Debug)

  if not Alias or not Coordinate or not PolyZone or #PolyZone == 0 then
    if Debug then
      env.info(
        ("AI_ATC:CalculateTaxiEntry -> Missing required parameters for alias '%s'."):format(tostring(Alias))
      )
    end
    return
  end

  local clientData = ATM.ClientData and ATM.ClientData[Alias]
  if not clientData then
    if Debug then
      env.info(("AI_ATC:CalculateTaxiEntry -> No client data found for alias '%s'."):format(tostring(Alias)))
    end
    return
  end

  local startTime        = timer.getTime()
  local closestPoint     = nil
  local closestDistance  = math.huge
  local MAX_ITERATIONS   = 10

  ATC_Coroutine:AddCoroutine(function()
    local iterationCount = 0
    local index          = 1
    local completed      = false

    while not completed do
      for i = index, #PolyZone do
        local vertex   = PolyZone[i]
        local distance = Coordinate:Get2DDistance(vertex)
        if distance < closestDistance then
          closestDistance = distance
          closestPoint    = vertex
        end

        iterationCount = iterationCount + 1
        if iterationCount >= MAX_ITERATIONS then
          index          = i + 1
          iterationCount = 0
          coroutine.yield()
        end
      end

      if index > #PolyZone then
        completed = true
      end
    end

    clientData.TaxiEntry = closestPoint

    local endTime  = timer.getTime()
    local duration = endTime - startTime
    if Debug then
      env.info(("Taxi Entry Calculation for '%s' completed in %.2f seconds at distance %.1f."):format(Alias, duration, closestDistance))
    end
  end)
end

-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--***************************************************************************GET PARKINGSPOT*********************************************************************************--
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function AI_ATC:GetParkingSpot(Alias, Coord, Debug)

  if not Alias or not Coord then
    if Debug then
      env.info(("AI_ATC:GetParkingSpot -> Missing Alias or Coord. Alias='%s'"):format(tostring(Alias)))
    end
    return false
  end

  if not AI_ATC_Airbase or not ATM.GroundControl or not ATM.GroundControl[Alias] then
    if Debug then
      env.info(("AI_ATC:GetParkingSpot -> Missing required data or ground control for alias '%s'."):format(Alias))
    end
    return false
  end

  local startTime = timer.getTime()

  local closestCoord, terminalID, distance, parkingSpotInfo = Coord:GetClosestParkingSpot(AI_ATC_Airbase)
  if not distance or distance > 10 then
    return false
  end

  ATM.GroundControl[Alias].SpotNumber = terminalID

  ATC_Coroutine:AddCoroutine(function()
    local MAX_ITERATIONS = 10
    local count          = 0
    local foundSpot      = false

    while not foundSpot do
      for spot, info in pairs(Incirlik_ParkingSpot) do
        if info.Number == ATM.GroundControl[Alias].SpotNumber then
          local runways = AI_ATC.Runways and AI_ATC.Runways.Takeoff
          if runways and runways[1] and info.Taxi then
            ATM.GroundControl[Alias].Taxi = info.Taxi[runways[1]]
          end

          ATM.GroundControl[Alias].Spot = spot

          if AI_ATC.Runways and AI_ATC.Runways.Takeoff and AI_ATC.Runways.Takeoff[3] then
            local distance2Runway = Coord:Get2DDistance(AI_ATC.Runways.Takeoff[3])
            ATM.GroundControl[Alias].Distance2Runway = math.floor(distance2Runway + 0.5)
          end

          if Debug then
            local endTime  = timer.getTime()
            local duration = endTime - startTime
            env.info(("Parking spot for '%s' calculated in %.2f seconds."):format(Alias, duration))
          end
          foundSpot = true
          break
        end

        count = count + 1
        if count >= MAX_ITERATIONS then
          count = 0
          coroutine.yield()
        end
      end
    end
  end)

  return true
end
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--***************************************************************************TOWER CONTROLLER***********************************************************************************--
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function AI_ATC:TowerController(Debug)
  local AirbaseCoord = AI_ATC_Vec3
  local AirbaseVec2 = AirbaseCoord:GetVec2()
  local TowerZone = ZONE_RADIUS:New("TowerZone2", AirbaseVec2, 18520, false)

  local function CheckLandingType(Alias)
    local LandingType = "Straight in"
    local GroupObj = GROUP:FindByName(Alias)
    if not GroupObj then 
      return LandingType 
    end
    
    local DCSObj = GroupObj:GetTemplate()
    if not DCSObj then 
      return LandingType 
    end
    
    local Route = DCSObj.route
    if not Route or not Route.points then
      return LandingType
    end
    
    for i = 1, #Route.points do
      local wp = Route.points[i]
      if wp.task then
        local task = wp.task
        if task.id == "ComboTask" and task.params and task.params.tasks then
          local list = task.params.tasks
          for j = 1, #list do
            local t = list[j]
            if t and t.params and t.params.action then
              local act = t.params.action
              if act.id == "Option" and act.params then
                local p = act.params
                if p.name == 36 and p.value == 3 then
                  LandingType = "Overhead"
                  return LandingType
                end
              end
            end
            if t and t.id == "ControlledTask" and t.params and t.params.task then
              local nestedTask = t.params.task
              if nestedTask.id == "WrappedAction" and nestedTask.params and nestedTask.params.action then
                local act = nestedTask.params.action
                if act.id == "Option" and act.params then
                  local p = act.params
                  if p.name == 36 and p.value == 3 then
                    LandingType = "Overhead"
                    return LandingType
                  end
                end
              end
            end
          end
        end
      end
    end

    return LandingType
  end
  
  SCHEDULER:New(nil, function()
    local Runway = AI_ATC.Runways.Landing[1]
    local RunwayHeading = AI_ATC.Runways.Landing[5]
    local TowerRadar = SET_GROUP:New():FilterZones({TowerZone}):FilterCategoryAirplane():FilterCategoryHelicopter():FilterActive(true):FilterOnce()
    local SchedulerObject2, Break, HeadingV1, HeadingV2, DepartureCoord
    
    local function CheckFlightGroups()
      for groupName, groupTable in pairs(AI_ATC.FlightGroup) do
        for ClientName, _ in pairs(groupTable) do
          TowerRadar:RemoveGroupsByName(ClientName)
        end
      end
    end
    
    if Runway=="05" then
      Break = "Right"
      HeadingV1 = 230
      HeadingV2 = 340
    elseif Runway=="23" then
      Break = "Left"
      HeadingV1 = 30
      HeadingV2 = 180
    end
    DepartureCoord = AI_ATC_Navpoints["PAR_"..Runway]:GetCoordinate()
    
    TowerRadar:ForEachGroup(function(GroupObject)
      if not GroupObject then return end
      if not GroupObject:IsAlive() then
        local name = GroupObject:GetName()
        if name then TowerRadar:RemoveGroupsByName(name) end
        return
      end
      CheckFlightGroups()
      TowerRadar:RemoveGroupsByName(AI_Wingman_1)
      TowerRadar:RemoveGroupsByName(AI_Wingman_2)
      TowerRadar:RemoveGroupsByName(AI_Wingman_3)
      TowerRadar:RemoveGroupsByName(AI_Wingman_4)
      
      local Alias = GroupObject:GetName()
      local Airborne = GroupObject:IsAirborne()
      local Altitude = GroupObject:GetAltitude(true)
      local Client = GroupObject:IsPlayer()
      local Heading = AI_ATC:CorrectHeading(GroupObject:GetHeading())
      if ATM.TowerControl[Alias] then
        return
      end
      
      if Client then
        TowerRadar:RemoveGroupsByName(Alias)
      elseif not Airborne then
        TowerRadar:RemoveGroupsByName(Alias)
      elseif Altitude <= 50 then
        TowerRadar:RemoveGroupsByName(Alias)
      end
    end)

    TowerRadar:ForEachGroup(function(GroupObject)
      if not GroupObject then return end
      if not GroupObject:IsAlive() then
        local name = GroupObject:GetName()
        if name then TowerRadar:RemoveGroupsByName(name) end
        return
      end
      
      local Alias = GroupObject:GetName()
      local Type = GroupObject:GetTypeName()
      local Airborne = GroupObject:IsAirborne()
      local Altitude = GroupObject:GetAltitude(true)
      local Heading = AI_ATC:CorrectHeading(GroupObject:GetHeading())
      local HeadingNo = tonumber(Heading)
      local UnitObject = GroupObject:GetUnit(1)
      local UnitCount = GroupObject:CountAliveUnits()
      local DCSObject = GroupObject:GetTemplate()
      local Client = GroupObject:IsPlayer()
      local Count = GroupObject:CountAliveUnits()
      

      if not UnitObject or not UnitObject:IsAlive() then return end
      
      local Coord = UnitObject:GetCoordinate()
      local Range = Coord:Get2DDistance(AirbaseCoord)
      local Angle = AI_ATC:AngularDifference(Heading, RunwayHeading)
      local Bearing = AI_ATC:AngularDifference(Heading, Coord:HeadingTo(DepartureCoord))

      if not ATM.TowerControl[Alias] then
        local RequestedApproach = CheckLandingType(Alias)
        if not RequestedApproach then 
          local name = GroupObject:GetName()
          if name then TowerRadar:RemoveGroupsByName(name) end
          return 
        end
        
        ATM.TowerControl[Alias] = {
          RequestedApproach = RequestedApproach, 
          State = "On Approach", 
          Type = Type, 
          Contacts = {}, 
          Schedules = {}, 
          Count = Count,
          CycleCount = 0
        }

        if ATM.TowerControl[Alias].State=="On Approach" and Bearing > 150 then
          ATM.TowerControl[Alias].State = "On Departure"
        end
              
        return
      elseif ATM.TowerControl[Alias] and GroupObject:IsAlive() and Range<=18520 then
        
        if ATM.TowerControl[Alias].State==string.format("Landed on runway %s", Runway) then
          if not Client then
            ATM.TowerControl[Alias] = nil
          end
          return
        end
        
        if not Airborne then
          if ATM.TowerControl[Alias] then
            ATM.RunwayOccupied[Alias] = {}
            SCHEDULER:New(nil, function()
              if ATM.RunwayOccupied[Alias] then
                ATM.RunwayOccupied[Alias] = nil
              end
            end, {}, 60)
            if ATM.TowerControl[Alias].State~="On Departure" then
              ATM.TowerControl[Alias].State = string.format("Landed on runway %s", Runway)
            end
            return
          end
        end
        
        if (ATM.TowerControl[Alias].RequestedApproach=="Straight in" or ATM.TowerControl[Alias].RequestedApproach=="Instrument Straight in")
        and (ATM.TowerControl[Alias].State=="On Approach"
        or ATM.TowerControl[Alias].State=="Re-entering pattern") then
          if Angle <= 15 and Range <= 11112 then
            ATM.TowerControl[Alias].State = "On Final Approach"
            return
          end
        
        elseif (ATM.TowerControl[Alias].RequestedApproach=="Overhead" 
        and ATM.TowerControl[Alias].State=="On Approach") then
          if Angle <= 15 and Range <= 9260 then
            ATM.TowerControl[Alias].State = "Initial"
            return
          end
        
        elseif (ATM.TowerControl[Alias].RequestedApproach=="Overhead" 
        and ATM.TowerControl[Alias].State=="Initial") then
          if (Angle >= 30 and Angle <= 130) and Range <= 9260 then
            ATM.TowerControl[Alias].State = "in the Break"
            return
          end
          
        elseif (ATM.TowerControl[Alias].RequestedApproach=="Overhead" 
        and ATM.TowerControl[Alias].State=="in the Break") then
          if Angle >= 160 and Range <= 9260 then
            ATM.TowerControl[Alias].State = string.format("%s Downwind", Break)
            return
          end
          
        elseif (ATM.TowerControl[Alias].RequestedApproach=="Overhead" 
        and ATM.TowerControl[Alias].State==string.format("%s Downwind", Break)) then
          if (Angle >= 70 and Angle <= 160) and Range <= 12964 then
            ATM.TowerControl[Alias].State = string.format("%s Base", Break)
            return
          end

        elseif ((ATM.TowerControl[Alias].RequestedApproach == "Overhead"
        or ATM.TowerControl[Alias].RequestedApproach == "SFO")
        and ATM.TowerControl[Alias].State == string.format("%s Base", Break)) then
          if Angle <= 15 and Range <= 9260 then
            ATM.TowerControl[Alias].State = "On Final Approach"
            return
          end
        
        elseif ATM.TowerControl[Alias].State=="On Final Approach" then
          if Angle <= 15 and Range <= 1852 and Altitude >= 152 then
            ATM.TowerControl[Alias].State = "Going around"
            return
          end
          
        elseif ATM.TowerControl[Alias].State=="Going around" then
          local CycleCount = ATM.TowerControl[Alias].CycleCount + 1
          if CycleCount > 10 then
          
            if Angle >=80 and Angle <=181 and Altitude <= 548 then
              ATM.TowerControl[Alias].State = "Outside Downwind"
              ATM.TowerControl[Alias].CycleCount = 0
              return
            end
            
            if Angle >=1 and Angle <= 170 and Altitude >= 548 then
              ATM.TowerControl[Alias].State = "Missed Approach"
              ATM.TowerControl[Alias].CycleCount = 0
              return
            end
          else
            ATM.TowerControl[Alias].CycleCount = CycleCount
            return
          end

        elseif ATM.TowerControl[Alias].State=="Outside Downwind" 
        or ATM.TowerControl[Alias].State=="Missed Approach" then
          if Angle >= 20 and Angle <= 80 and Range >= 9260 then
            ATM.TowerControl[Alias].State = "Re-entering pattern"
            return
          end
        end
        
      elseif not Client then
        --ATM.TowerControl[Alias] = nil
      end
    end)
    
    local RemoveTbl = {}
    for alias, data in pairs(ATM.TowerControl) do
      local Grp = GROUP:FindByName(alias)
    
      if not Grp or not Grp:IsAlive() then
        if not (Grp and Grp:IsPlayer()) then
          table.insert(RemoveTbl, alias)
        end
      end

      if Debug then
        local Subtitle = string.format("%s is %s", alias, data.State or "nil")
        MESSAGE:New(Subtitle, 4.5):ToAll()
      end
    end

    for _, alias in ipairs(RemoveTbl) do
      ATM.TowerControl[alias] = nil
    end

  end, {}, 5, 5)

end
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--***************************************************************************GROUND CONTROLLER*********************************************************************************--
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function AI_ATC:GroundController(Debug)
  
  local AirbaseVec2 = AI_ATC_Vec3:GetVec2()
  local AirbaseZone = ZONE_RADIUS:New("AirbaseZone", AirbaseVec2, 2743)
  local TakeoffRunway = AI_ATC.Runways.Takeoff[1]
  local LandingRunway = AI_ATC.Runways.Landing[1]
  local GroundControlSet = SET_GROUP:New():FilterZones({AirbaseZone}):FilterCategoryAirplane():FilterCategoryHelicopter():FilterActive(true):FilterStart()
  
  local function CheckFlightGroups()
    for groupName, groupTable in pairs(AI_ATC.FlightGroup) do
      for ClientName, _ in pairs(groupTable) do
        GroundControlSet:RemoveGroupsByName(ClientName)
      end
    end
  end

  local function CheckGroupSet()
    ATC_Coroutine:AddCoroutine(function()
      GroundControlSet:ForEachGroupAlive(function(GroupObject)
        
        local alias    = GroupObject:GetName()
        local isHelo   = GroupObject:IsHelicopter()
        local altitude = GroupObject:GetAltitude(true)
        local velocity = GroupObject:GetVelocityKNOTS()

        if (not isHelo and not GroupObject:IsAirborne()) or (isHelo and altitude <= 50) then
          if not ATM.GroundControl[alias] then
            local coord = GroupObject:GetCoordinate()

            ATM.GroundControl[alias] = {
              GroupObject   = GroupObject,
              Type          = GroupObject:GetTypeName(),
              Callsign      = GroupObject:GetCallsign(),
              State         = "Cold",
              StartedTaxi   = false,
              Stopped       = false,
              TaxiAuthority = false,
              TaxiRequested = false,
              Helo          = isHelo,
              TimeActive    = UTILS:SecondsOfToday(),
              IsPlayer      = GroupObject:IsPlayer()
            }

            if velocity <= 1 then
              ATC_Coroutine:AddCoroutine(function()
                AI_ATC:GetParkingSpot(alias, coord, true)
              end)
            else
              ATM.GroundControl[alias].Taxi            = { "Bravo", "Foxtrot" }
              ATM.GroundControl[alias].Spot            = "76"
              ATM.GroundControl[alias].SpotNumber      = 11
              ATM.GroundControl[alias].Distance2Runway = 372
            end

            coroutine.yield()
          end
        end
      end)
    end)
  end
  
  SCHEDULER:New(nil, function()
    TakeoffRunway = AI_ATC.Runways.Takeoff[1]
    LandingRunway = AI_ATC.Runways.Landing[1]
    local Groups, Units = GroundControlSet:CountAlive()
    if Groups >= 1 then
      CheckFlightGroups()
      GroundControlSet:RemoveGroupsByName(AI_Wingman_1)
      GroundControlSet:RemoveGroupsByName(AI_Wingman_2)
      GroundControlSet:RemoveGroupsByName(AI_Wingman_3)
      GroundControlSet:RemoveGroupsByName(AI_Wingman_4)
      CheckGroupSet()
    end
  end, {}, 2, 10)
  

  SCHEDULER:New(nil, function()
    local groupCount, unitCount = GroundControlSet:CountAlive()
    if groupCount < 1 then
      return
    end
    --ATC_Coroutine:AddCoroutine(function()
      for alias, data in pairs(ATM.GroundControl) do
        local groupObject = data.GroupObject
        if not groupObject then
          ATM.GroundControl[alias] = nil
          return
          --coroutine.yield()
        else
          local client     = ATM.ClientData[alias]
          local TakeoffRunway = AI_ATC.Runways.Takeoff[1]
          local LandingRunway = AI_ATC.Runways.Landing[1]
          local coord         = groupObject:GetCoordinate()
          
          if not coord and not client then
            ATM.GroundControl[alias] = nil
            return
          end
          
          local isAirborne = groupObject:IsAirborne()
          local isHelo     = groupObject:IsHelicopter()
          local altitude   = groupObject:GetAltitude(true)
          local velocity   = groupObject:GetVelocityKNOTS()
          local taxi       = data.Taxi

          if taxi and ((not isHelo and not isAirborne) or (isHelo and altitude <= 50)) then
            if velocity < 1 and data.State ~= "Parked" and data.State ~= "Taxiing to runway" then
              local gotSpot = AI_ATC:GetParkingSpot(alias, coord, false)
              if gotSpot then
                data.State    = "Parked"
                data.Subtitle = string.format("%s is %s in spot %s", alias, data.State, data.Spot or "Unknown")
  
                if client and client.State ~= "Parked" then
                  client.State = "Parked"
                  --AI_ATC:RepeatLastTransmission(alias, nil)
                  AI_ATC:UpdateClient(alias, false)
                  if ATM.TaxiQueue[alias] then
                    ATM.TaxiQueue[alias] = nil
                  end
                end
              end
  
            elseif velocity > 1 and velocity < 30 and data.State == "Landing" then
              data.State    = "Taxiing to Parking"
              data.Subtitle = string.format("%s is %s", alias, data.State)
              if client then
                client.State = "Taxiing to Parking"
              end
              
            elseif((velocity > 1 and velocity < 30) and data.State == "Parked")
            or (client and data.TaxiRequested and data.TaxiAuthority and data.State == "Parked" and not client.TakeoffClearance==true)
            or ((velocity > 1 and velocity < 30) and (data.State == "Cold" and not client )) then
              data.State         = "Taxiing to runway"
              data.TaxiAuthority = true
              data.StartedTaxi   = true
              data.TaxiRequested = true
              AI_ATC:TaxiManager(alias)
              if client then
                client.State = "Taxiing to runway"
              end
              data.Subtitle = string.format("%s is %s %s via taxiway %s", alias, data.State, TakeoffRunway, data.Taxi[1] or "?")

            elseif velocity > 30 and data.State == "Taxiing to runway" then
              local runway  = TakeoffRunway or "Unknown"
              if client and client.TakeoffClearance==true then
                client.State = "Takeoff"
                data.State = "Takeoff"
                data.Subtitle = string.format("%s is %s via runway %s", alias, data.State, runway)
                AI_ATC.Runways.TakeoffHold = true
                if client and client.CrewChief then
                  client.CrewChief:Destroy()
                  client.CrewChief = nil
                end
              elseif not client then
                data.State = "Takeoff"
                data.Subtitle = string.format("%s is %s via runway %s", alias, data.State, runway)
              end
            elseif velocity > 30 and data.State == "Cold" then
              data.State = "Landing"
              if client then
                client.State = "Landing"
              end
              local runway  = LandingRunway or "Unknown"
              data.Subtitle = string.format("%s is %s on runway %s", alias, data.State, runway)
            end

          else
            if data.State == "Takeoff" and isAirborne then
              data.State = "Airborne"
              local runway  = LandingRunway or "Unknown"
              data.Subtitle = string.format("%s is %s off runway %s", alias, data.State, runway)
              AI_ATC.Runways.TakeoffHold = false
              if client then
                client.State = "Airborne"
              end

            elseif data.State == "Landing" and isAirborne then
              data.State = "Airborne"
              data.Subtitle = string.format("%s is %s and going around", alias, data.State)
              AI_ATC.Runways.TakeoffHold = false
              if client then
                client.State = "Airborne"
                client.TakeoffClearance = false
                if client.CrewChief then
                  client.CrewChief:Destroy()
                  client.CrewChief = nil
                end
              end
              
            elseif data.State == "Airborne" and isAirborne then
              ATM.GroundControl[alias] = nil
              if ATM.TaxiQueue[alias] then
                ATM.TaxiQueue[alias] = nil
              end
            end
          end

          if Debug and data.State == "Parked" then
            data.Subtitle = string.format("%s is %s in spot %s", alias, data.State, data.Spot or "Unknown")
          end
  
          if Debug and data.Subtitle then
            MESSAGE:New(data.Subtitle, 4.5):ToAll()
          end

          --coroutine.yield()
        end
      end
    --end)
  end, {}, 5, 5)
end
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--***************************************************************************TAXI MANAGER****************************************************************************************--
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function AI_ATC:TaxiManager(Alias)

  if not Alias then
    env.info("AI_ATC:TaxiManager -> Alias is nil. Aborting.")
    return
  end

  local groundData = ATM.GroundControl and ATM.GroundControl[Alias]
  if not groundData then
    env.info(("AI_ATC:TaxiManager -> No ground control data found for alias '%s'."):format(tostring(Alias)))
    return
  end

  local groupObject = groundData.GroupObject
  if not groupObject then
    env.info(("AI_ATC:TaxiManager -> No group object for alias '%s'."):format(tostring(Alias)))
    return
  end

  local initiatorTaxiWay = groundData.Taxi and groundData.Taxi[1] or nil
  local initiatorParking = groundData.Distance2Runway
  local initiatorType    = groupObject:GetTypeName()

  if not ATM.TaxiQueue then
    ATM.TaxiQueue = {}
  end

  local function UpdateTaxiQueue(targetAlias)
    ATM.TaxiQueue[targetAlias] = {
      Name     = Alias,
      Type     = initiatorType,
      Taxi     = initiatorTaxiWay,
      Stopped  = false,
      Distance = initiatorParking
    }
    ATM.GroundControl[targetAlias].TaxiAuthority = false
  end

  for otherAlias, otherData in pairs(ATM.GroundControl) do

    if otherAlias ~= Alias then
      if otherData.IsPlayer then
        local otherCoord      = otherData.GroupObject and otherData.GroupObject:GetCoordinate()
        local otherDistance   = otherData.Distance2Runway
        local otherTaxiWay    = otherData.Taxi and otherData.Taxi[1] or nil
        local otherSpot       = otherData.Spot

        if otherData.TaxiAuthority == false then

          if not ATM.TaxiQueue[otherAlias] then
            UpdateTaxiQueue(otherAlias)

          elseif
            ATM.TaxiQueue[otherAlias]
            and ATM.TaxiQueue[otherAlias].Taxi ~= otherTaxiWay
            and initiatorTaxiWay == otherTaxiWay
          then
           UpdateTaxiQueue(otherAlias)


          elseif
            ATM.TaxiQueue[otherAlias]
            and ATM.TaxiQueue[otherAlias].Taxi == otherTaxiWay
            and initiatorTaxiWay == otherTaxiWay
            and initiatorParking >= ATM.TaxiQueue[otherAlias].Distance
            and ATM.TaxiQueue[otherAlias].Name ~= Alias
          then
              UpdateTaxiQueue(otherAlias)
          end

          local queuedTaxi    = ATM.TaxiQueue[otherAlias].Taxi
          local queuedGroup   = ATM.TaxiQueue[otherAlias].Name

          if queuedTaxi == otherTaxiWay then
            self:TaxiControl(otherAlias, otherTaxiWay, queuedGroup)
          end

        end
      end
    end
  end
end
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--***************************************************************************TAXI CONTROLLER*************************************************************************************--
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function AI_ATC:TaxiControl(Client, Taxiway, Alias)

  if not Client or not Taxiway or not Alias then
    env.warning("AI_ATC:TaxiControl -> Missing Client, Taxiway, or Alias.")
    return
  end

  ATM.TaxiController[Client] = ATM.TaxiController[Client] or {}
  if ATM.TaxiController[Client][Alias] then
    ATM.TaxiController[Client][Alias]:Start()
    return
  end

  local clientData = ATM.ClientData[Client]
  local groundData = ATM.GroundControl[Alias]
  local ownGround  = ATM.GroundControl[Client]

  if not clientData or not groundData or not ownGround then
    env.warning(("AI_ATC:TaxiControl -> Missing data for Client='%s' or Alias='%s'."):format(tostring(Client), tostring(Alias)))
    return
  end

  local groupObject = groundData.GroupObject
  if not groupObject then
    env.warning(("AI_ATC:TaxiControl -> GroupObject is nil for Alias='%s'."):format(tostring(Alias)))
    return
  end

  if ownGround.TaxiAuthority == true then
    return
  end

  local firstUnit   = groupObject:GetUnit(1)
  local entryCoord  = clientData.TaxiEntry
  local Client      = clientData.Unit
  local terminalCoord
  
  if clientData.Taxi and #clientData.Taxi > 1 then
    local terminalTaxiZone = clientData.Taxi[2]
    terminalCoord = AI_ATC_TerminalCoordinates[Taxiway] and AI_ATC_TerminalCoordinates[Taxiway][terminalTaxiZone]
  
    if terminalCoord and not terminalCoord.x then
      local clientCoord = Client:GetCoordinate()
      local Distance    = math.huge
      local ClosestCoord, Range
  
      for _, vec in ipairs(terminalCoord) do
        Range = clientCoord:Get2DDistance(vec)
        if Range < Distance then
          Distance = Range
          ClosestCoord   = vec
        end
      end
      terminalCoord = ClosestCoord
    end
  else
    terminalCoord = AI_ATC.Runways.Takeoff[3]
  end

  if not terminalCoord then
    env.warning(("AI_ATC:TaxiControl -> TerminalCoord is nil for Client='%s' at Taxiway='%s'"):format(Client, Taxiway))
    return
  end

  local hasAccelerated = false

  local newScheduler
  newScheduler = SCHEDULER:New(nil, function()

    if firstUnit 
       and firstUnit:IsAlive() 
       and ATM.GroundControl[Client] 
       and ATM.TaxiQueue[Client]
    then
      local taxiSpeed        = firstUnit:GetVelocityKNOTS()
      local terminalDistance = entryCoord:Get2DDistance(terminalCoord)
      local objectDistance   = firstUnit:GetCoordinate():Get2DDistance(terminalCoord)

      if not hasAccelerated and taxiSpeed >= 12 then
        hasAccelerated = true
      end
      local hasStopped = hasAccelerated and (taxiSpeed <= 3)

      if objectDistance <= terminalDistance or hasStopped then
        ownGround.TaxiAuthority = true
        ATM.TaxiQueue[Client].Stopped = hasStopped
        newScheduler:Stop()
      end
    else
      newScheduler:Stop()
    end

  end, {}, 1, 1)
  ATM.TaxiController[Client][Alias] = newScheduler
end
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--***********************************************************************************TAXI SUBTITLE*******************************************************************************--
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function AI_ATC:TaxiSubtitle(Alias)
  if not ATM.ClientData or not ATM.ClientData[Alias] then
    env.warning(("AI_ATC:TaxiSubtitle -> No ClientData found for alias '%s'."):format(tostring(Alias)))
    return ""
  end

  local taxiways = ATM.ClientData[Alias].Taxi
  if not taxiways or #taxiways == 0 then
    return ""
  end
  return table.concat(taxiways, ", ")
end
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--***********************************************************************************HOLD SHORT**********************************************************************************--
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function AI_ATC:HoldShort(Alias)

  if not Alias then
    env.warning("AI_ATC:HoldShort -> Alias is nil.")
    return "06L" 
  end

  if not (ATM and ATM.ClientData and ATM.ClientData[Alias]) then
    env.warning(("AI_ATC:HoldShort -> Missing ATM.ClientData for alias '%s'."):format(tostring(Alias)))
    return "06L"
  end

  local clientData      = ATM.ClientData[Alias]
  local taxiways        = clientData.Taxi
  local primaryTaxiway  = taxiways and taxiways[1] or nil
  local parkingSpot     = clientData.Spot

  local activeRunway    = (AI_ATC.Runways and AI_ATC.Runways.Takeoff and AI_ATC.Runways.Takeoff[1]) or "06L"
  local holdShort       = activeRunway

  local HoldTable  = {
    ["06L"] = {
      Hold = "06R",
      ["Alpha"]=nil, 
      ["Bravo"]=nil
    },
    ["06R"] = { 
      Hold = "06L",
      ["Delta"]=nil, 
      ["Foxtrot"]=nil
    },
    ["24L"] = { 
      Hold = "06L",
      ["Delta"]=nil, 
      ["Foxtrot"]=nil
    },
  }

  if taxiways then
    for _, taxiway in ipairs(taxiways) do
      if HoldTable[activeRunway][taxiway] then
        holdShort = HoldTable[activeRunway].Hold
        break
      end
    end
  end

  if ATM.GroundControl and ATM.GroundControl[Alias] then
    ATM.GroundControl[Alias].HoldShort = holdShort
  end

  return holdShort
end
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--******************************************************************************HOLD SHORT POST LANDING**************************************************************************--
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function AI_ATC:HoldShortLanding(Alias)

  local DEFAULT_RUNWAY = "06L"
  if not Alias then
    env.warning("AI_ATC:HoldShortLanding -> 'Alias' is nil.")
    return DEFAULT_RUNWAY
  end

  if not (ATM and ATM.ClientData and ATM.ClientData[Alias]) then
    env.warning(("AI_ATC:HoldShortLanding -> Missing ATM.ClientData for alias '%s'."):format(tostring(Alias)))
    return DEFAULT_RUNWAY
  end

  local clientData   = ATM.ClientData[Alias]
  local taxiways     = clientData.Taxi
  local parkingSpot  = clientData.Spot
  local activeRunway = (AI_ATC.Runways and AI_ATC.Runways.Landing and AI_ATC.Runways.Landing[1]) or DEFAULT_RUNWAY
  local holdShort    = activeRunway 
  local turnDirection, Hold

  local runwayLogic = {
    ["05"] = {
      ["Alpha"]   = { holdShort = "05", direction = "Left" },
      ["Echo"]   = { holdShort = "05", direction = "Left" },
      ["Golf"] = { holdShort = "05", direction = "Left" },
      ["Golf"] = { holdShort = "05", direction = "Left" },
      ["Hotel"] = { holdShort = "05", direction = "Left" },
      ["India"] = { holdShort = "05", direction = "Left" },
      ["November"] = { holdShort = "05", direction = "Left" },
      ["Siera"] = { holdShort = "05", direction = "Right" },
      ["Victor"] = { holdShort = "05", direction = "Right" },
    },
    ["23"] = {
      ["Alpha"]   = { holdShort = "05", direction = "Right" },
      ["Echo"]   = { holdShort = "05", direction = "Right" },
      ["Golf"] = { holdShort = "05", direction = "Right" },
      ["Golf"] = { holdShort = "05", direction = "Right" },
      ["Hotel"] = { holdShort = "05", direction = "Right" },
      ["India"] = { holdShort = "05", direction = "Right" },
      ["November"] = { holdShort = "05", direction = "Right" },
      ["Siera"] = { holdShort = "05", direction = "Left" },
      ["Victor"] = { holdShort = "05", direction = "Left" },
    },
  }

  if taxiways and runwayLogic[activeRunway] then
    local logicForRunway = runwayLogic[activeRunway]
    for _, taxiway in ipairs(taxiways) do
      local rule = logicForRunway[taxiway]
      if rule then
        holdShort    = rule.holdShort
        turnDirection = rule.direction
        Hold = rule.Hold
        break
      end
    end
  end

  if ATM.GroundControl and ATM.GroundControl[Alias] then
    ATM.GroundControl[Alias].HoldShortLanding = holdShort
  end

  return holdShort, turnDirection, Hold
end
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--***********************************************************************************ATC EXTRACT RUNWAY HEADING******************************************************************--
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function AI_ATC:ExtractRunwayHeading(runway)
  local MagDec = AI_ATC.MagDec
  local heading = tonumber(runway:sub(1, 2)) * 10
  return heading + MagDec
end
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--***********************************************************************************ATC EXTRACT RUNWAY HEADING******************************************************************--
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function AI_ATC:AngularDifference(heading1, heading2)
  local diff = math.abs(heading1 - heading2)
  if diff > 180 then diff = 360 - diff end
  return diff
end
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--******************************************************************************ATC TERMINATE SCHEDULER OBJECTS******************************************************************--
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function AI_ATC:TerminateSchedules(Alias)
local SchedulerObjects = ATM.ClientData[Alias].SchedulerObjects

  for i = #SchedulerObjects, 1, -1 do
    local scheduler = SchedulerObjects[i]
    scheduler:Stop()
    table.remove(SchedulerObjects, i)
  end
end
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--***********************************************************************************ATC CLOCK BEARING***************************************************************************--
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function AI_ATC:HeadingToClockBearing(heading)
  heading = heading % 360
  local clockBearing = math.floor((heading + 15) / 30)
  if clockBearing == 0 then
    clockBearing = 12
  elseif clockBearing > 12 then
    clockBearing = clockBearing - 12
  end
  
  return clockBearing
end
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--*****************************************************************************ATC RECTIFY HEADING*******************************************************************************--
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function AI_ATC:RectifyHeading(String)
  if #String == 1 then
    String = "00" .. String
  end
  
  if #String == 2 then
    String = "0" .. String
  end
  
  return String
end
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--*****************************************************************************ATC MAGNETIC HEADING*******************************************************************************--
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function AI_ATC:CorrectHeading(heading)
  local MagDec = AI_ATC.MagDec
  
  local correctedHeading = (heading - MagDec) % 360

  if correctedHeading < 0 then
    correctedHeading = correctedHeading + 360
  end

  local decimal = correctedHeading - math.floor(correctedHeading)

  if decimal >= 0.5 then
    correctedHeading = math.floor(correctedHeading + 0.5)
  else
    correctedHeading = math.floor(correctedHeading)
  end

  return tostring(correctedHeading)
end
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--****************************************************************************ATC TRAFFIC CARDINAL*******************************************************************************--
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function AI_ATC:ReadCardinal(String, RadioObject, transmitter)
  local RadioKey = AI_ATC.Radio[transmitter].Key
  local matchedValue = AI_ATC_SoundFiles[RadioKey].Cardinal[String]
  if matchedValue then
    RadioObject:NewTransmission(string.format("Cardinal/%s", matchedValue.filename), matchedValue.duration, string.format("Airbase_ATC/%s/", RadioKey), nil, 0.01)
  end
end
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--****************************************************************************ATC CLOSEST AIRBASES*******************************************************************************--
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function AI_ATC:GetClosestAirbase(coord)

  local distances = {}

  for _, airfieldName in ipairs(Syria_Airfields) do
    local Navpoint = AI_ATC_Navpoints[airfieldName]
    if Navpoint then
      local distance = coord:Get2DDistance(Navpoint)
      table.insert(distances, {
        Name = airfieldName,
        Distance = distance
      })
    end
  end

  table.sort(distances, function(a, b)
    return a.Distance < b.Distance
  end)

  local closest10 = {}
  for i = 1, math.min(10, #distances) do
    table.insert(closest10, distances[i])
  end

  return closest10
end
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--*********************************************************************************GENERATE AIRFIELD MENUS***********************************************************************--
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function AI_ATC:AirfieldMenus(Agency, Alias, Menu)
  local ClientData = ATM.ClientData[Alias]
  local Unit = ClientData.Unit
  local Group = Unit:GetGroup()
  local SchedulerObjects = ClientData.SchedulerObjects
  local SchedulerObject
  
  SchedulerObject = SCHEDULER:New(nil, function()
    if Unit and Unit:IsAlive() then
      local Coord = Unit:GetCoordinate()
      Menu:RemoveSubMenus()
      local closestAirfields = AI_ATC:GetClosestAirbase(Coord)
      for i, data in ipairs(closestAirfields) do
        local airfieldName = data.Name
        MENU_GROUP_COMMAND:New(Group, airfieldName, Menu, function() AI_ATC:NavAssist(Alias, airfieldName, Agency) end, Group)
      end
    else 
      SchedulerObject:Stop()
    end
  end,{}, 0.5, 120)
  table.insert(SchedulerObjects, SchedulerObject)

end
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--**************************************************************************ATC DEPARTURE CARDINAL*******************************************************************************--
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function AI_ATC:DepartureCardinal(String, RadioObject, transmitter)
  local RadioKey = AI_ATC.Radio[transmitter].Key
  local matchedValue = AI_ATC_SoundFiles[RadioKey].Cardinal2[String]
  if matchedValue then
    RadioObject:NewTransmission(string.format("Cardinal2/%s", matchedValue.filename), matchedValue.duration, string.format("Airbase_ATC/%s/", RadioKey), nil, 0.01)
  end
end
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--***********************************************************************************ATC HEADING*********************************************************************************--
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function AI_ATC:Heading(String, RadioObject, transmitter, audio)
  
  local RadioKey = AI_ATC.Radio[transmitter].Key
  --local num = tonumber(String)
  --num = math.floor((num + 2.5) / 5) * 5
  --String = tostring(num)
  
  if #String == 2 then
    String = "0" .. String
  end
  
  if audio==true then  
    for i = 1, #String do
      local digit = string.sub(String, i, i)
      local matchedValue = AI_ATC_SoundFiles[RadioKey][digit]
      
      if matchedValue then
        RadioObject:NewTransmission(string.format("Numerical/%s", matchedValue.filename), matchedValue.duration, string.format("Airbase_ATC/%s/", RadioKey), nil, 0.01)
      end
    end
  else
    return String
  end
end
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--*********************************************************************ATC READ HEADING*******************************************************************************--
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function AI_ATC:ReadHeading(String, RadioObject, transmitter)
  local RadioKey = AI_ATC.Radio[transmitter].Key
  
  if #String == 1 then
    String = "00" .. String
  end
  
  if #String == 2 then
    String = "0" .. String
  end
  
  local matchedValue = AI_ATC_SoundFiles[RadioKey].Heading[String]
  if matchedValue then
    RadioObject:NewTransmission(string.format("Heading/%s", matchedValue.filename), matchedValue.duration, string.format("Airbase_ATC/%s/", RadioKey), nil, 0.03)
  end
end
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--*****************************************************************************ATC READ DISTANCE*********************************************************************************--
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function AI_ATC:ReadDistance(String, RadioObject, transmitter)
  local RadioKey = AI_ATC.Radio[transmitter].Key
  local matchedValue = AI_ATC_SoundFiles[RadioKey].Distance[String]
  if matchedValue then
    RadioObject:NewTransmission(string.format("Distance/%s", matchedValue.filename), matchedValue.duration, string.format("Airbase_ATC/%s/", RadioKey), nil, 0.01)
  end
end
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--*******************************************************************************ATC READ DIGITS*********************************************************************************--
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function AI_ATC:ReadDigits(String, RadioObject, transmitter)
  local RadioKey = AI_ATC.Radio[transmitter].Key
  
  for i = 1, #String do
    local digit = String:sub(i, i)
    local matchedValue = AI_ATC_SoundFiles[RadioKey].Numerical[digit]

    if matchedValue then
      RadioObject:NewTransmission(string.format("Numerical/%s", matchedValue.filename), matchedValue.duration, string.format("Airbase_ATC/%s/", RadioKey), nil, 0.01)
    end
  end
end
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--*******************************************************************************ATC READ NUMBER*********************************************************************************--
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function AI_ATC:ReadNumber(String, RadioObject, transmitter)
  local RadioKey = AI_ATC.Radio[transmitter].Key
  
  local matchedValue = AI_ATC_SoundFiles[RadioKey].Numerical[String]
  if matchedValue then
    RadioObject:NewTransmission(string.format("Numerical/%s", matchedValue.filename), matchedValue.duration, string.format("Airbase_ATC/%s/", RadioKey), nil, 0.01)
  else
    AI_ATC:ReadDigits(String, RadioObject, transmitter)
  end
end
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--*******************************************************************************ATC READ RANGE*********************************************************************************--
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function AI_ATC:ReadRange(numberString, RadioObject, transmitter)
  local RadioKey = AI_ATC.Radio[transmitter] and AI_ATC.Radio[transmitter].Key 
  local length = #numberString
  local i = 1

  while i <= length do
    local digit = string.sub(numberString, i, i)
    local positionFromRight = length - i
    local soundKey

    if positionFromRight == 0 then
      if digit ~= "0" then
        soundKey = digit
      end

    elseif positionFromRight == 1 then
      if digit == "1" then
        local teenNumber = string.sub(numberString, i, i + 1)
        soundKey = teenNumber
        i = i + 1
      elseif tonumber(digit) > 1 then
        soundKey = tostring(tonumber(digit) * 10)
      end

    else
      if tonumber(digit) > 0 then
        soundKey = digit .. string.rep("0", positionFromRight)
      end
    end

    if soundKey and AI_ATC_SoundFiles[RadioKey].Numerical[soundKey] then
      local matchedValue = AI_ATC_SoundFiles[RadioKey].Numerical[soundKey]
      local FileName = matchedValue.filename
      local Duration = matchedValue.duration
      RadioObject:NewTransmission(string.format("Numerical/%s", FileName), Duration, string.format("Airbase_ATC/%s/", RadioKey), nil, 0.03)
    end
    i = i + 1
  end
end
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--*******************************************************************************ATC READ THOUSANDS******************************************************************************--
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function AI_ATC:ReadThousands(String, RadioObject, transmitter)
  local RadioKey = AI_ATC.Radio[transmitter].Key
  local firstDigit = string.sub(String, 1, 1)
  local firstValue = AI_ATC_SoundFiles[RadioKey].Numerical[firstDigit]
  if firstValue then
    RadioObject:NewTransmission(string.format("Numerical/%s", firstValue.filename), firstValue.duration, string.format("Airbase_ATC/%s/", RadioKey), nil, 0.01)
  end
  if tonumber(String) >= 10000 then
    local secondDigit = string.sub(String, 2, 2)
    local secondValue = AI_ATC_SoundFiles[RadioKey].Numerical[secondDigit]
    if secondValue then
      RadioObject:NewTransmission(string.format("Numerical/%s", secondValue.filename), secondValue.duration, string.format("Airbase_ATC/%s/", RadioKey), nil, 0.01)
    end
  end
  
  RadioObject:NewTransmission("Numerical/ATIS_Thousand.ogg", 0.557, "Airbase_ATC/ATIS/", nil, 0.01)
end
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--***********************************************************************************ATC READ FLIGHT LEVEL***********************************************************************--
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function AI_ATC:ReadFlightLevel(String, RadioObject, transmitter, audio)

  local Transition = 10
  local RadioKey = AI_ATC.Radio[transmitter].Key
  local beforeDecimal, afterDecimal = String:match("^(%d+)%.*(%d*)$")
  local isFlightLevel = tonumber(beforeDecimal) >= Transition
  local audioKey, hundredsKey

  if afterDecimal ~= "" then
    if isFlightLevel then
      audioKey    = beforeDecimal .. afterDecimal
    else
      audioKey    = beforeDecimal .. "0"
      hundredsKey = afterDecimal  .. "00"
    end
  else
    audioKey = beforeDecimal .. "0"

  end

  if audio then
    local FLtbl = AI_ATC_SoundFiles[RadioKey].FlightLevel
    local NUMtbl = AI_ATC_SoundFiles[RadioKey].Numerical

    local first = FLtbl[audioKey]
    if first then
      RadioObject:NewTransmission(string.format("FlightLevel/%s", first.filename), first.duration, string.format("Airbase_ATC/%s/", RadioKey), nil, 0.02)
    end

    if hundredsKey and not isFlightLevel then
      local second = NUMtbl[hundredsKey]
      if second then
        RadioObject:NewTransmission(string.format("Numerical/%s", second.filename), second.duration, string.format("Airbase_ATC/%s/", RadioKey), nil, 0.02)
      end
    end
  end

  local FlightLevel
  if afterDecimal ~= "" then 
    if isFlightLevel then 
      FlightLevel = string.format("FL%s%s", beforeDecimal, afterDecimal)
    else 
      FlightLevel = string.format("%s,%s00", beforeDecimal, afterDecimal)
    end
  else
    if isFlightLevel then
      FlightLevel = string.format("FL%s0", beforeDecimal)
    else 
      FlightLevel = string.format("%s000", beforeDecimal)
    end
  end

  return FlightLevel
end
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--***********************************************************************************ATC READ DIGITS*********************************************************************************--
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function AI_ATC:ClockBearing(String, RadioObject, transmitter)
  local RadioKey = AI_ATC.Radio[transmitter].Key
  local matchedValue = AI_ATC_SoundFiles[RadioKey].Oclock[String]
  if matchedValue then
    RadioObject:NewTransmission(string.format("Oclock/%s", matchedValue.filename), matchedValue.duration, string.format("Airbase_ATC/%s/", RadioKey), nil, 0.02)
  end
end
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--***********************************************************************************ATC READ SID*******************************************************************************--
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function AI_ATC:ReadSID(string, RadioObject, transmitter)
  local RadioKey = AI_ATC.Radio[transmitter].Key
  local matchedValue = AI_ATC_SoundFiles[RadioKey].SID[string]
  if matchedValue then
    RadioObject:NewTransmission(string.format("SoundFiles/%s", matchedValue.filename), matchedValue.duration, string.format("Airbase_ATC/%s/", RadioKey), nil, 0.02)
  end
end
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--***********************************************************************************ATC READ VFR*******************************************************************************--
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function AI_ATC:ReadVFR(string, RadioObject, transmitter, audio)
  local RadioKey = AI_ATC.Radio[transmitter].Key
  local matchedValue = AI_ATC_SoundFiles[RadioKey].VFR[string]
  if matchedValue then
    if audio==true then
      RadioObject:NewTransmission(string.format("SoundFiles/%s", matchedValue.filename), matchedValue.duration, string.format("Airbase_ATC/%s/", RadioKey), nil, 0.02)
    end
    return matchedValue.Subtitle
  end
end
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--***********************************************************************************ATC AIRBASE NAME****************************************************************************--
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function AI_ATC:AirbaseName(string, RadioObject, transmitter)
  local RadioKey = AI_ATC.Radio[transmitter].Key
  local matchedValue = AI_ATC_SoundFiles[RadioKey].Airbase[string]
  if matchedValue then
    RadioObject:NewTransmission(string.format("Airbase/%s", matchedValue.filename), matchedValue.duration, string.format("Airbase_ATC/%s/", RadioKey), nil, 0.02)
  end
end
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--*********************************************************************************ATC CALLSIGN*********************************************************************************--
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function AI_ATC:Callsign(inputString, RadioObject, transmitter, flight)
  local ExcludedStrings = {
  ["BlackJack"] = true,
  ["Hammerhead"] = true,
  ["Overlord"]  = true,
  ["Magic"]     = true,
  ["Wizard"]    = true,
  ["Focus"]     = true,
  ["Darkstar"]  = true
  }

  local substrings = {}
  local RadioKey, File, Duration, firstPart, secondPart, firstDigit, character1, character2, CountNumerical, Name
  RadioKey = AI_ATC.Radio[transmitter].Key
  
  local function splitAtFirstNumeric(str)
    local position = string.find(str, "%d")
    if position then
        local prefix = string.sub(str, 1, position - 1)
        local numericPart = string.sub(str, position)
        return prefix, numericPart, string.sub(str, position, position)
    else
        return str, nil, nil
    end
  end

  inputString = string.gsub(inputString, "-", "")
  local prefix, numerical, firstDigit = splitAtFirstNumeric(inputString)

  if flight and firstDigit then
    numerical = firstDigit .. " flight"
  end
  
  table.insert(substrings, prefix)
  table.insert(substrings, numerical)
  local Entry = AI_ATC_SoundFiles[RadioKey].Callsigns[prefix]
  
  if not ExcludedStrings[inputString] then
    CountNumerical = #numerical
  end

  if Entry then
    RadioObject:NewTransmission(string.format("CallSigns/%s", Entry.filename), Entry.duration, string.format("Airbase_ATC/%s/", RadioKey), nil, 0.01)
    if not ExcludedStrings[inputString] and CountNumerical==2 and not flight then
      File = AI_ATC_SoundFiles[RadioKey].CallsignsNumerical[numerical].filename
      Duration = AI_ATC_SoundFiles[RadioKey].CallsignsNumerical[numerical].duration
      RadioObject:NewTransmission(string.format("CallsignsNumerical/%s", File), Duration, string.format("Airbase_ATC/%s/", RadioKey), nil, 0.01)
    elseif not ExcludedStrings[inputString] and CountNumerical>2 and not flight then
      for i = 1, #numerical do
        local digit = string.sub(numerical, i, i)
        local matchedValue = AI_ATC_SoundFiles[RadioKey].Numerical[digit]
        if matchedValue then
          RadioObject:NewTransmission(string.format("Numerical/%s", matchedValue.filename), matchedValue.duration, string.format("Airbase_ATC/%s/", RadioKey), nil, 0.03)
        end
      end
    elseif flight and numerical then
      local File = AI_ATC_SoundFiles[RadioKey].CallsignsNumerical[numerical]
      if File then
        RadioObject:NewTransmission(string.format("CallsignsNumerical/%s", File.filename), File.duration, string.format("Airbase_ATC/%s/", RadioKey), nil, 0.01)
      end
    end
  else
    File = AI_ATC_SoundFiles[RadioKey].CallsignsNumerical["11"].filename
    Name = File.filename
    Duration = File.duration
    RadioObject:NewTransmission("Aircraft/Colt.ogg", 1.3, string.format("Airbase_ATC/%s/", RadioKey))
    RadioObject:NewTransmission(string.format("CallsignsNumerical/%s", File), Duration, string.format("Airbase_ATC/%s/", RadioKey), nil, nil)
  end
      
  return substrings
end
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--****************************************************************************ATC FLIGHT CALLSIGN********************************************************************************--
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function AI_ATC:UpdateFlightCallsign(Alias)

  local ClientObject = ATM.ClientData[Alias]
  local Callsign = ClientObject.Callsign

  local function splitAtFirstNumeric(str)
    local position = string.find(str, "%d")
    if position then
        local prefix = string.sub(str, 1, position - 1)
        local numericPart = string.sub(str, position)
        return prefix, numericPart, string.sub(str, position, position)
    else
        return str, nil, nil
    end
  end
  
  local String = string.gsub(Callsign, "-", "")
  local prefix, numerical, firstDigit = splitAtFirstNumeric(String)
  
  ClientObject.FlightCallsign = prefix.."-"..firstDigit.." flight"
  
end
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--****************************************************************************ATC WIND DIRECTION*********************************************************************************--
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function AI_ATC:WindDirection(numberString, RadioObject, transmitter)
  
  local RadioKey = AI_ATC.Radio[transmitter].Key
  
  if #numberString == 2 then
    numberString = "0" .. numberString
  end
    
  local length = #numberString 
  for i = 1, length do
    local digit = string.sub(numberString, i, i)
    local matchedValue = AI_ATC_SoundFiles[RadioKey].Numerical[digit]
    if matchedValue then
      RadioObject:NewTransmission(string.format("Numerical/%s", matchedValue.filename), matchedValue.duration, string.format("Airbase_ATC/%s/", RadioKey), nil, nil)
    end
  end
end
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--*********************************************************************************ATC WIND SPEED*********************************************************************************--
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function AI_ATC:WindSpeed(number, String, RadioObject, transmitter)
  
  local RadioKey = AI_ATC.Radio[transmitter].Key
  local Title = string.format("%s %s", AI_ATC.Airbase, transmitter)

  if number >= 0 and number <= 3 then
    local Subtitle = string.format("%s: Winds Calm", Title)
    RadioObject:NewTransmission("WindsCalm.ogg", 1.18, string.format("Airbase_ATC/%s/SoundFiles/", RadioKey), nil, 0.2, Subtitle, 1.1)
  end
  if number >= 4 and number <= 12 then
    local Subtitle = string.format("%s: Light winds", Title)
    RadioObject:NewTransmission("WindsLight.ogg", 0.662, string.format("Airbase_ATC/%s/SoundFiles/", RadioKey), nil, 0.2, Subtitle, 0.6)
  end
  if number >= 13 and number <= 24 then
    local Subtitle = string.format("%s: Moderate winds blowing %s", Title, String)
    RadioObject:NewTransmission("WindsModerate.ogg", 0.825, string.format("Airbase_ATC/%s/SoundFiles/", RadioKey), nil, 0.2, Subtitle, 1.4)
    RadioObject:NewTransmission("Blowing.ogg", 0.350, string.format("Airbase_ATC/%s/SoundFiles/", RadioKey), nil, nil)
    AI_ATC:WindDirection(String, RadioObject, transmitter)
  end
  if number >= 25 then
    local Subtitle = string.format("%s: Strong winds blowing %s", Title, String)
    RadioObject:NewTransmission("WindsStrong.ogg", 0.766, string.format("Airbase_ATC/%s/SoundFiles/", RadioKey), nil, 0.2, Subtitle, 1.4)
    RadioObject:NewTransmission("Blowing.ogg", 0.350, string.format("Airbase_ATC/%s/SoundFiles/", RadioKey), nil, nil)
    AI_ATC:WindDirection(String, RadioObject, transmitter)
  end
end
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--*********************************************************************************ATC PRESSURE*********************************************************************************--
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function AI_ATC:Pressure(number, RadioObject, transmitter)
  
  local RadioKey = AI_ATC.Radio[transmitter].Key
  local roundedNum = math.floor(number * 100 + 0.5) / 100
  local numStr = tostring(roundedNum)
  local lastCharWasNine = false

  for i = 1, #numStr do
    local c = numStr:sub(i, i)
    if c == '9' then
      RadioObject:NewTransmission("Niner.ogg", 0.434, string.format("Airbase_ATC/%s/SoundFiles/", RadioKey), nil, nil)
      lastCharWasNine = true
    elseif c == '.' then
      if not lastCharWasNine then
        local matchedValue = AI_ATC_SoundFiles[RadioKey].Numerical[c]
        if matchedValue then
          RadioObject:NewTransmission(string.format("Numerical/%s", matchedValue.filename), matchedValue.duration, string.format("Airbase_ATC/%s/", RadioKey), nil, nil)
        end
      end
      lastCharWasNine = false
    elseif c ~= '.' then
      local matchedValue = AI_ATC_SoundFiles[RadioKey].Numerical[c]
      if matchedValue then
        RadioObject:NewTransmission(string.format("Numerical/%s", matchedValue.filename), matchedValue.duration, string.format("Airbase_ATC/%s/", RadioKey), nil, nil)
      end
      lastCharWasNine = false
    end
  end
end
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--*****************************************************************************ATC PROCESS TIME*********************************************************************************--
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function AI_ATC:ProcessTime(String, RadioObject, transmitter)
  
  local RadioKey = AI_ATC.Radio[transmitter].Key
  local SanitizedString = string.gsub(String, ":", "")
  local HHMM = string.sub(SanitizedString, 1, 4)
  
  for i = 1, #HHMM do
    local digit = string.sub(HHMM, i, i)
    local matchedValue = AI_ATC_SoundFiles[RadioKey].Numerical[digit]
    
    if matchedValue then
      RadioObject:NewTransmission(string.format("Numerical/%s", matchedValue.filename), matchedValue.duration, string.format("Airbase_ATC/%s/", RadioKey), nil, nil)
    end
  end
end
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--*******************************************************************************ATC ANGLE DELTA*********************************************************************************--
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function AI_ATC:AngleDelta(angle1, angle2)

  local a1 = (angle1 % 360 + 360) % 360
  local a2 = (angle2 % 360 + 360) % 360

  local diff = math.abs(a1 - a2) % 360

  if diff > 180 then
    diff = 360 - diff
  end
  
  return diff
end
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--***********************************************************************************ATC RUNWAY*********************************************************************************--
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function AI_ATC:Runway(String, RadioObject, transmitter)
  
  local RadioKey = AI_ATC.Radio[transmitter].Key
  local matchedValue = AI_ATC_SoundFiles[RadioKey].Runway[String]
  if matchedValue then
    RadioObject:NewTransmission(string.format("Runway/%s", matchedValue.filename), matchedValue.duration, string.format("Airbase_ATC/%s/", RadioKey), nil, nil)
  end
end
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--***********************************************************************************ATC NAVPOINT-*******************************************************************************--
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function AI_ATC:ReadNavpoint(String, RadioObject, transmitter)
  local RadioKey = AI_ATC.Radio[transmitter].Key
  local matchedValue = AI_ATC_SoundFiles[RadioKey].NavPoint[String]
  if matchedValue then
    RadioObject:NewTransmission(string.format("NavPoint/%s", matchedValue.filename), matchedValue.duration, string.format("Airbase_ATC/%s/", RadioKey), nil, nil)
  end
end
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--***********************************************************************************ATC RUNWAY*********************************************************************************--
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function AI_ATC:Runway2(String, RadioObject, transmitter)
  
  local RadioKey = AI_ATC.Radio[transmitter].Key
  local length = #String
  local NumericString = ""
  local AlphaString = ""
    
  if length == 3 then
    local lastChar = string.sub(String, length, length)
    AlphaString = lastChar
    local NumberString = string.sub(String, 1, length - 1)
    NumericString = string.sub(String, 1, length - 1)
  else
    NumericString = String
  end

  for i = 1, #NumericString do
    local digit = string.sub(NumericString, i, i)
    local matchedValue = AI_ATC_SoundFiles[RadioKey].Numerical[digit]
    if matchedValue then
      RadioObject:NewTransmission(string.format("Numerical/%s", matchedValue.filename), matchedValue.duration, string.format("Airbase_ATC/%s/", RadioKey), nil, nil)
    end
  end
    
  if #AlphaString > 0 then
    local matchedValue = AI_ATC_SoundFiles[RadioKey].Direction[AlphaString]
    if matchedValue then
      RadioObject:NewTransmission(string.format("SoundFiles/%s", matchedValue.filename), matchedValue.duration, string.format("Airbase_ATC/%s/", RadioKey), nil, nil)
    end
  end
end
----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--****************************************************************************READ TAXI INSTRUCTIONS****************************************************************************--
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function AI_ATC:ReadTaxiInstructions(Alias, RadioObject, transmitter)
  
  local RadioKey = AI_ATC.Radio[transmitter].Key
  local TaxiData = ATM.ClientData[Alias].Taxi
  local NumberOfTaxiways = #TaxiData
  
  for i = 1, NumberOfTaxiways do
    local TaxiName = TaxiData[i]
    local Entry = AI_ATC_SoundFiles[RadioKey].Phonetic[TaxiName]
    
    if Entry then
      RadioObject:NewTransmission(string.format("Phonetic/%s", Entry.filename), Entry.duration, string.format("Airbase_ATC/%s/", RadioKey), nil, 0.1)
    end  
  end
end
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--***********************************************************************************ATC SPOT NUMBER*********************************************************************************--
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function AI_ATC:SpotNumber(spot, RadioObject, transmitter)
  local RadioKey = AI_ATC.Radio[transmitter].Key
  local Iteration = 10
  local Count = 0
  local inputString
  
  local function Execute(inputString)
    local length = #inputString
    local NumericString = ""
    local AlphaString = ""
    local FirstCharecter
    
    local FirstCharecter = string.sub(inputString, 1, 1)
    if string.match(FirstCharecter, "%a") then
      AlphaString = FirstCharecter
      NumericString = string.sub(inputString, 2)
    else
      NumericString = inputString
    end
    
    local Phonetic = AI_ATC_SoundFiles.ATIS.PhoneticAlphabet[AlphaString]
    if Phonetic then 
      AI_ATC:Phonetic(Phonetic, RadioObject, transmitter)
    end
    
    for i = 1, #NumericString do
      local digit = string.sub(NumericString, i, i)
      local matchedValue = AI_ATC_SoundFiles[RadioKey].Numerical[digit]
    
      if matchedValue then
        RadioObject:NewTransmission(string.format("Numerical/%s", matchedValue.filename), matchedValue.duration, string.format("Airbase_ATC/%s/", RadioKey), nil, 0.01)
      end
    end
  end

  ATC_Coroutine:AddCoroutine(function()
    local inputString = nil
    for key, value in pairs(Incirlik_ParkingSpot) do
      Count = Count + 1
      if value.Number == spot then
        inputString = key
        Execute(inputString)
        break
      end
      if Count >= Iteration then
        Count = 0
        coroutine.yield()
      end
    end
  end)

end
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--***********************************************************************************ATC PHONETIC*********************************************************************************--
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function AI_ATC:Phonetic(AlphaString, RadioObject, transmitter)
  local RadioKey = AI_ATC.Radio[transmitter].Key

  local Entry = AI_ATC_SoundFiles[RadioKey].Phonetic[AlphaString]
  if Entry then
    RadioObject:NewTransmission(string.format("Phonetic/%s", Entry.filename), Entry.duration, string.format("Airbase_ATC/%s/", RadioKey), nil, 0.1)
  end
end
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--***********************************************************************************ATC TAXI QUEUE*********************************************************************************--
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function AI_ATC:TaxiQueue(Alias, RadioObject, transmitter)
  local RadioKey = AI_ATC.Radio[transmitter].Key
  local Title = string.format("%s %s", AI_ATC.Airbase, transmitter)
  local Count = 0

  for alias, data in pairs(ATM.GroundControl) do
    if data.IsPlayer==false and data.State=="Taxiing to runway" then 
      Count = Count + 1
    elseif data.IsPlayer==true and data.TaxiAuthority==true then
      Count = Count + 1
    end
  end

  if Count > 1 and ATM.TaxiQueue[Alias] then
    local Type = ATM.TaxiQueue[Alias].Type
    local Taxiway = ATM.TaxiQueue[Alias].Taxi
    local Queue = tostring(Count)
    local Subtitle = string.format("%s: Your number %s in line for departure,", Title, Queue)
    RadioObject:NewTransmission("YourNumber.ogg", 0.522, string.format("Airbase_ATC/%s/SoundFiles/", RadioKey), nil, 0.3, Subtitle, 2)

    local matchedValue = AI_ATC_SoundFiles[RadioKey].Numerical[Queue]
    if matchedValue then
      RadioObject:NewTransmission(string.format("Numerical/%s", matchedValue.filename), matchedValue.duration, string.format("Airbase_ATC/%s/", RadioKey), nil, nil)
      RadioObject:NewTransmission("InLine.ogg", 1.068, string.format("Airbase_ATC/%s/SoundFiles/", RadioKey), nil, 0.3)
    end

    if Taxiway == ATM.ClientData[Alias].Taxi[1] then
      local UnitType = ATM.TaxiQueue[Alias].Type
      local Entry = AI_ATC_SoundFiles[RadioKey].Aircraft[UnitType]
      if Entry then
        local Subtitle = string.format("%s: follow the %s in front of you", Title, Type)
        RadioObject:NewTransmission("FollowThe.ogg", 0.480, string.format("Airbase_ATC/%s/SoundFiles/", RadioKey), nil, 0.1, Subtitle, 1.5)
        RadioObject:NewTransmission(string.format("Aircraft/%s", Entry.filename), Entry.duration, string.format("Airbase_ATC/%s/", RadioKey), nil, nil)
        RadioObject:NewTransmission("InFront.ogg", 0.615, string.format("Airbase_ATC/%s/SoundFiles/", RadioKey), nil, nil)
      end
    else
      local UnitType = ATM.TaxiQueue[Alias].Type
      local Entry = AI_ATC_SoundFiles[RadioKey].Aircraft[UnitType]
      if Entry then
        local Subtitle = string.format("%s: Behind the %s on taxiway %s", Title, Type, Taxiway)
        RadioObject:NewTransmission("Behind.ogg", 0.557, string.format("Airbase_ATC/%s/SoundFiles/", RadioKey), nil, 0.1, Subtitle, 1.6)
        RadioObject:NewTransmission(string.format("Aircraft/%s", Entry.filename), Entry.duration, string.format("Airbase_ATC/%s/", RadioKey), nil, nil)
        RadioObject:NewTransmission("OnTaxiway.ogg", 0.708, string.format("Airbase_ATC/%s/SoundFiles/", RadioKey), nil, nil)
      end

      local Entry = AI_ATC_SoundFiles[RadioKey].Phonetic[Taxiway]
      if Entry then
        RadioObject:NewTransmission(string.format("Phonetic/%s", Entry.filename), Entry.duration, string.format("Airbase_ATC/%s/", RadioKey), nil, 0.1)
      end
    end
  end
end
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--***********************************************************************************TAXI TO PARKING*****************************************************************************--
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function AI_ATC:TaxiToParking(Alias, RadioObject, transmitter)
  
  local RadioKey = AI_ATC.Radio[transmitter].Key
  local Title = string.format("%s %s", AI_ATC.Airbase, transmitter)
  local Unit = ATM.ClientData[Alias].Unit
  local InitiatorCoord = ATM.ClientData[Alias].Coord
  local TaxiData = ATM.ClientData[Alias].Taxi[1]
  local PlayerEntry = ATM.ClientData[Alias].TaxiEntry
  local Heliport = ATM.ClientData[Alias].Heliport
  local ActiveRunway, Runway, RunwayHeading
  if Heliport then
    ActiveRunway = AI_ATC.Runways.HeliportZone
    Runway = AI_ATC.Runways.Heliport[1]
    RunwayHeading = AI_ATC.Runways.Takeoff[5]
  else
    ActiveRunway = AI_ATC.Runways.LandingZone
    Runway = AI_ATC.Runways.Takeoff[1]
    RunwayHeading = AI_ATC.Runways.Takeoff[5]
  end
  
  local TerminalCoordinates ={}
  local subtitles = {}
  local Subtitle= ""
  local UnitHeading = RunwayHeading
  -------------------------------------------
  local function ReverseTable(tbl)
    local reversedTable = {}
    for i = #tbl, 1, -1 do
      table.insert(reversedTable, tbl[i])
    end
    return reversedTable
  end
  -------------------------------------------
  local TaxiTable = AI_ATC_TaxiToPark[Runway][TaxiData].Route
  local NumberOfTaxiways = #TaxiTable
  local currentZone = ActiveRunway
  local currentTaxiway = "RunwayExit"
  local currentVertices = currentZone--:GetVerticiesCoordinates()
  local compareZone = AI_ATC.TaxiWay[TaxiTable[1]].Zone
  local compareVertices = compareZone--:GetVerticiesCoordinates()
  
  local shortestDistance = math.huge
  local TerminalCoord = nil
  for _, vertex1 in pairs(currentVertices) do
      for _, vertex2 in pairs(compareVertices) do
        local distance = vertex1:Get2DDistance(vertex2)
        if distance < shortestDistance then
          shortestDistance = distance
          TerminalCoord = vertex1
        end
      end
    TerminalCoordinates[currentTaxiway] = { Coord = TerminalCoord }
  end

  for i = 1, NumberOfTaxiways do
    local currentTaxiway = TaxiTable[i]
    local currentZone = AI_ATC.TaxiWay[currentTaxiway].Zone
    local currentVertices = currentZone

    local compareZone
    local compareVertices
    if i < NumberOfTaxiways then
      compareZone = AI_ATC.TaxiWay[TaxiTable[i + 1]].Zone
      compareVertices = compareZone
    else
      compareZone = AI_ATC.Runways.TakeoffZone
      compareVertices = PlayerEntry
    end
    
    local shortestDistance = math.huge
    local TerminalCoord = nil
    if i < NumberOfTaxiways then
      for _, vertex1 in pairs(currentVertices) do
        for _, vertex2 in pairs(compareVertices) do
          local distance = vertex1:Get2DDistance(vertex2)
          if distance < shortestDistance then
            shortestDistance = distance
            TerminalCoord = vertex1
          end
        end
      end
      TerminalCoordinates[currentTaxiway] = { Coord = TerminalCoord }
    else
       for _, vertex1 in pairs(currentVertices) do
          local vertex2 = compareVertices
          local distance = vertex1:Get2DDistance(vertex2)
          if distance < shortestDistance then
            shortestDistance = distance
            TerminalCoord = vertex1
        end
      end
      TerminalCoordinates[currentTaxiway] = { Coord = TerminalCoord }
    end
  end
  --------------------MARK TERMINAL COORDINATES--------------------------
  --local UniqueStrings = {}
  --for key, _ in pairs(TerminalCoordinates) do
    --local uniqueString = key .. "_Terminal"
    --UniqueStrings[key] = uniqueString
  --end
  --for key, coordinate in pairs(TerminalCoordinates) do
    --local uniqueString = UniqueStrings[key]
    --coordinate.Coord:MarkToAll(uniqueString)
  --end
  ----------------------------------------------------------------------
  for i = 1, NumberOfTaxiways do
    local PrimaryTaxiway
    local PrimaryTerminal
    local SecondaryTaxiway
    local SecondaryTerminal
    local SecondaryHeading
    local ReferenceHeading
    local TerminalHeading
    local HeadingDiff
    local TurnDirection
    if i == 1 then
      PrimaryTaxiway = TaxiTable[i]
      PrimaryTerminal = TerminalCoordinates[PrimaryTaxiway].Coord
      SecondaryTaxiway = "RunwayExit"
      SecondaryTerminal = TerminalCoordinates[SecondaryTaxiway].Coord
      ReferenceHeading = UnitHeading
      TerminalHeading =  SecondaryTerminal:HeadingTo(PrimaryTerminal)
      HeadingDiff = TerminalHeading - ReferenceHeading
      TerminalCoordinates[PrimaryTaxiway].Heading = TerminalHeading
    end
    if i > 1 then
      PrimaryTaxiway = TaxiTable[i]
      PrimaryTerminal = TerminalCoordinates[PrimaryTaxiway].Coord
      SecondaryTaxiway = TaxiTable[i-1]
      SecondaryTerminal = TerminalCoordinates[SecondaryTaxiway].Coord
      SecondaryHeading = TerminalCoordinates[SecondaryTaxiway].Heading
      ReferenceHeading = SecondaryHeading
      TerminalHeading = SecondaryTerminal:HeadingTo(PrimaryTerminal)     
      HeadingDiff = TerminalHeading - ReferenceHeading
      TerminalCoordinates[PrimaryTaxiway].Heading = TerminalHeading
    end
    if HeadingDiff > 180 then
     HeadingDiff = HeadingDiff - 360
    elseif HeadingDiff < -180 then
      HeadingDiff = HeadingDiff + 360
    end
    if HeadingDiff > 0 then
      TurnDirection = "Right"
    elseif HeadingDiff < 0 then
      TurnDirection = "Left"
    end
    TerminalCoordinates[PrimaryTaxiway].Direction = TurnDirection
  end
 
  local iterations = 0
  for i = 1, NumberOfTaxiways do
    local TaxiName = TaxiTable[i]
    local TurnDirection = TerminalCoordinates[TaxiName].Direction
    local Subtitle -- Define Subtitle here
    iterations = iterations + 1
    if iterations == 1 then
      Subtitle = TurnDirection .. " turn " .. TaxiName
    else
      Subtitle = TurnDirection .. " " .. TaxiName
    end
    if iterations < NumberOfTaxiways then
      Subtitle = Subtitle .. ", " 
    end
    if iterations == NumberOfTaxiways then
      Subtitle = Subtitle .. ". " 
    end
    table.insert(subtitles, Subtitle)
  end

  local concatenatedSubtitles = table.concat(subtitles, " ")
  Subtitle = concatenatedSubtitles
  local Count = 0
  for i = 1, NumberOfTaxiways do
    local TaxiName = TaxiTable[i]
    local TurnDirection = TerminalCoordinates[TaxiName].Direction
    if Count == 0 then
      if TurnDirection == "Left" then
        RadioObject:NewTransmission("LeftTurn.ogg", 0.522, string.format("Airbase_ATC/%s/SoundFiles/", RadioKey), nil, 0.2, Subtitle, 1.5)
        Count = Count + 1
      end
      if TurnDirection == "Right" then
        RadioObject:NewTransmission("RightTurn.ogg", 0.546, string.format("Airbase_ATC/%s/SoundFiles/", RadioKey), nil, 0.2, Subtitle, 1.5)
        Count = Count + 1
      end
    else
      if TurnDirection == "Left" then
        RadioObject:NewTransmission("Left.ogg", 0.395, string.format("Airbase_ATC/%s/SoundFiles/", RadioKey), nil, 0.1)
        Count = Count + 1
      end
      if TurnDirection == "Right" then
        RadioObject:NewTransmission("Right.ogg", 0.430, string.format("Airbase_ATC/%s/SoundFiles/", RadioKey), nil, 0.1)
        Count = Count + 1
      end
    end
    
    local matchingKey
    for key, _ in pairs(AI_ATC_SoundFiles[RadioKey].Phonetic) do
      if key == TaxiName then
        matchingKey = key
        break
      end
    end
    if matchingKey then
      local matchedEntry = AI_ATC_SoundFiles[RadioKey].Phonetic[matchingKey]
      RadioObject:NewTransmission(string.format("Phonetic/%s", matchedEntry.filename), matchedEntry.duration, string.format("Airbase_ATC/%s/", RadioKey), nil, 0.1)
    end  
  end
end
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--***********************************************************************************TAXI REQUEST********************************************************************************--
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function AI_ATC:TaxiRequest(Alias)
  local groundControl = ATM.GroundControl
  local currentControl = groundControl[Alias]
  
  if not currentControl then
    env.info(string.format("AI_ATC:TaxiRequest - Alias '%s' not found in GroundControl.", Alias))
    return
  end

  local count = 0
  for _ in pairs(groundControl) do
    count = count + 1
  end

  if count == 1 then
    currentControl.TaxiAuthority = true
    return
  end

  local Taxiway = currentControl.Taxi and currentControl.Taxi[1]
 
  if not Taxiway then
    env.info(string.format("AI_ATC:TaxiRequest: %s does not have a valid Taxiway.", Alias))
    return
  end

  local restrictedTaxiways = { Alpha = true }
  if restrictedTaxiways[Taxiway] then
    currentControl.TaxiAuthority = false
    return
  end

  for otherAlias, data in pairs(groundControl) do
    if data and otherAlias ~= Alias and data.TaxiAuthority and data.Taxi and data.Taxi[1] == Taxiway then
      local Distance = data.Distance2Runway
      if Distance >= currentControl.Distance2Runway then
        currentControl.TaxiAuthority = false
        AI_ATC:TaxiControl(Alias, Taxiway, otherAlias)
        return
      end
    end
  end

  currentControl.TaxiAuthority = true

end
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--****************************************************************************ATC NAVIGATION ASSISTANCE**************************************************************************--
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function AI_ATC:NavAssist(Alias, NavPoint, Transmitter, Modifier)

  local Title = string.format("%s %s", AI_ATC.Airbase, Transmitter)
  local RadioObject = AI_ATC:FindTransmitter(Alias, Transmitter)
  local ClientObject = ATM.ClientData[Alias]
  local Unit = ClientObject.Unit
  local Group = Unit:GetGroup()
  local Callsign = ClientObject.Callsign
  local FlightCallsign = ClientObject.FlightCallsign
  local Flight = ClientObject.Flight
  local CallsignSub = Flight and FlightCallsign or Callsign
  local Delay = 1.5 + math.random() * (2.5 - 1.5)
  
  if AI_ATC:FunctionDelay(Alias, function() AI_ATC:NavAssist(Alias, NavPoint, Transmitter, Modifier) end, Transmitter)==false then
    return
  end
  
  local NavpointName, NavSubtitle, UnitCoord, UnitHeading, Destination, Heading, HeadingSub, Subtitle
  if Modifier~=nil then
    NavpointName = Modifier
    NavSubtitle = "Radar "..Modifier
  else
    NavpointName = NavPoint
    NavSubtitle = NavPoint
  end

  AI_ATC:RepeatLastTransmission(Alias, function()AI_ATC:NavAssist(Alias, NavPoint, Transmitter, Modifier) end)
  USERSOUND:New("RADIO_TRANS_START.ogg"):ToUnit(Unit)

  SCHEDULER:New( nil, function()
    UnitCoord = Unit:GetCoord()
    Destination = AI_ATC_Navpoints[NavPoint]:GetCoordinate()
    Heading = AI_ATC:CorrectHeading(UnitCoord:HeadingTo(Destination))
    HeadingSub = AI_ATC:Heading(Heading, RadioObject, Transmitter, false)
    AI_ATC:ChannelOpen(6, Transmitter, Alias)
    Subtitle = string.format("%s: %s, Vectors for %s, fly heading %s", Transmitter, CallsignSub, NavSubtitle, HeadingSub)
    RadioObject:NewTransmission("DeadAir.ogg", 0.100, "Airbase_ATC/Departure/SoundFiles/", nil, nil, Subtitle, 5)
    AI_ATC:Callsign(Callsign, RadioObject, Transmitter, Flight)
    RadioObject:NewTransmission("VectorsFor.ogg", 0.952, "Airbase_ATC/Departure/SoundFiles/", nil, 0.05)
    AI_ATC:ReadNavpoint(NavpointName, RadioObject, Transmitter)
    RadioObject:NewTransmission("FlyHeading.ogg", 0.801, "Airbase_ATC/Departure/SoundFiles/", nil, 0.03)
    AI_ATC:ReadHeading(Heading, RadioObject, Transmitter)
  end,{}, Delay)
end
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--***********************************************************************************ATIS START**********************************************************************************--
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function AI_ATC:StartATIS()

  if AI_ATC.ATIS.Active or AI_ATC.ATIS.Data.FC3switch then
    return
  end
  AI_ATC.ATIS.Active = true

  local RadioObject  = ATIS_RADIO
  local AirbaseName  = AI_ATC.Airbase or "Unknown"
  local Airbase      = string.format("%s Airforce base", AirbaseName)
  local Title        = "ATIS"

  local function ATISCoroutine()

    do
      local Time = timer.getAbsTime() - UTILS.GMTToLocalTimeDifference() * 60 * 60
      if Time < 0 then Time = 24 * 60 * 60 + Time end
      local Clock = UTILS.SecondsToClock(Time)
      local Zulu = UTILS.Split(Clock, ":")
      local ZULU = string.format("%s00", Zulu[1])
      local NATO = AI_ATC_NatoTime[tonumber(Zulu[1]) + 1]
      AI_ATC.ATIS.Data.Information = NATO
      AI_ATC.ATIS.Data.ZULU = ZULU
    end
    coroutine.yield()

    do
      local depRunway = AI_ATC.Runways.Takeoff and AI_ATC.Runways.Takeoff[1] or "03L"
      local arrRunway = AI_ATC.Runways.Landing and AI_ATC.Runways.Landing[1] or "21L"

      AI_ATC.ATIS.Data.Departure = depRunway
      AI_ATC.ATIS.Data.Arrival   = arrRunway

      if depRunway == arrRunway then
        AI_ATC.ATIS.Data.Active = depRunway
      else
        AI_ATC.ATIS.Data.Active = nil
      end
    end
    coroutine.yield()

    do
      local Coord = AI_ATC_Airbase and AI_ATC_Airbase:GetCoordinate()
      if not Coord then
        env.warning("AI_ATC:StartATIS -> Could not get AI_ATC_Airbase coordinate.")
      else
        local Fog  = AI_ATC.ATIS.Data.Fog  or false
        local Rain = AI_ATC.ATIS.Data.Rain or false
        if Coord:IsDay() and not Fog and not Rain then
          AI_ATC.ATIS.Data.Approach = "VFR"
          AI_ATC.Procedure          = "VFR"
        else
          AI_ATC.ATIS.Data.Approach = "IFR"
          AI_ATC.Procedure          = "IFR"
        end
      end
    end
    coroutine.yield()

    do
      local Information = AI_ATC.ATIS.Data.Information or "Alpha"
      local Subtitle    = string.format("%s: %s Information %s", Title, Airbase, Information)

      RadioObject:NewTransmission("DeadAir.ogg", 0.100, "Airbase_ATC/ATIS/SoundFiles/", nil, 1, Subtitle, 5)
      AI_ATC:AirbaseName(AirbaseName, RadioObject, Title)
      RadioObject:NewTransmission("Information.ogg", 0.819, "Airbase_ATC/ATIS/SoundFiles/", nil, 0.1)
      AI_ATC:Phonetic(Information, RadioObject, Title)
    end
    coroutine.yield()

    do
      local ZuluTime      = AI_ATC.ATIS.Data.ZULU
      local WindDirection = AI_ATC.ATIS.Data.WindDirection
      local WindSpeed     = AI_ATC.ATIS.Data.WindSpeed
      local Gusting       = AI_ATC.ATIS.Data.Gusting
      local GustingSub    = Gusting and ", Gusting" or ""

      local Subtitle = string.format("%s: %s Zulu", Title, ZuluTime)
      RadioObject:NewTransmission("DeadAir.ogg", 0.100, "Airbase_ATC/ATIS/SoundFiles/", nil, 0.5, Subtitle, 3)
      AI_ATC:ReadDigits(ZuluTime, RadioObject, Title)
      AI_ATC:Phonetic("Zulu", RadioObject, Title)

      Subtitle = string.format("%s: Wind from %s at %s %s", Title, WindDirection, WindSpeed, GustingSub)
      RadioObject:NewTransmission("DeadAir.ogg", 0.100, "Airbase_ATC/ATIS/SoundFiles/", nil, 0.5, Subtitle, 3)
      RadioObject:NewTransmission("WindFrom.ogg", 0.670, "Airbase_ATC/ATIS/SoundFiles/", nil, 0.0)
      AI_ATC:ReadDigits(WindDirection, RadioObject, Title)
      RadioObject:NewTransmission("At.ogg", 0.418, "Airbase_ATC/ATIS/SoundFiles/", nil, 0.05)
      AI_ATC:ReadDigits(WindSpeed, RadioObject, Title)

      if Gusting then
        RadioObject:NewTransmission("Gusting.ogg", 0.653, "Airbase_ATC/ATIS/SoundFiles/", nil, 0.1)
      end
    end
    coroutine.yield()

    do
      local Visibility = AI_ATC.ATIS.Data.Visibility or "10"
      local Fog        = AI_ATC.ATIS.Data.Fog        or false
      local Dust       = AI_ATC.ATIS.Data.Dust       or false
      local Rain       = AI_ATC.ATIS.Data.Rain       or false
      local Preset     = AI_ATC.ATIS.Data.Preset     or ""
      local Subtitle

      -- Visibility
      if Visibility == "10" then
        Subtitle = string.format("%s: Visibility greater than 10", Title)
        RadioObject:NewTransmission("DeadAir.ogg", 0.100, "Airbase_ATC/ATIS/SoundFiles/", nil, 0.5, Subtitle, 3)
        RadioObject:NewTransmission("Visibility.ogg", 0.798, "Airbase_ATC/ATIS/SoundFiles/", nil, 0.0)
        RadioObject:NewTransmission("Greater.ogg", 1.207, "Airbase_ATC/ATIS/SoundFiles/", nil, 0.0)
      else
        Subtitle = string.format("%s: Visibility %s", Title, Visibility)
        RadioObject:NewTransmission("DeadAir.ogg", 0.100, "Airbase_ATC/ATIS/SoundFiles/", nil, 0.5, Subtitle, 3)
        RadioObject:NewTransmission("Visibility.ogg", 0.798, "Airbase_ATC/ATIS/SoundFiles/", nil, 0.0)
        AI_ATC:ReadDigits(Visibility, RadioObject, Title)
      end

      -- Fog
      if Fog then
        local Thickness = AI_ATC.ATIS.Data.FogThickness or "1000"
        Subtitle = string.format("%s: Persistant fog below %s", Title, Thickness)
        RadioObject:NewTransmission("DeadAir.ogg", 0.100, "Airbase_ATC/ATIS/SoundFiles/", nil, 0.5, Subtitle, 6)
        RadioObject:NewTransmission("PersistantFog.ogg", 1.628, "Airbase_ATC/ATIS/SoundFiles/", nil, 0.0)
        AI_ATC:ReadThousands(Thickness, RadioObject, Title)
      end

      -- Dust
      if Dust then
        Subtitle = string.format("%s: Persistant Dust", Title)
        RadioObject:NewTransmission("DeadAir.ogg", 0.100, "Airbase_ATC/ATIS/SoundFiles/", nil, 0.5, Subtitle, 6)
        RadioObject:NewTransmission("Dust.ogg", 1.161, "Airbase_ATC/ATIS/SoundFiles/", nil, 0.0)
      end

      -- Rain
      if Rain and AI_ATC_CloudPresets and AI_ATC_CloudPresets[Preset] and AI_ATC_CloudPresets[Preset].Rain then
        local TypeRain = AI_ATC_CloudPresets[Preset].Rain
        if TypeRain == "Light rain" then
          Subtitle = string.format("%s: Light rain", Title)
          RadioObject:NewTransmission("DeadAir.ogg", 0.100, "Airbase_ATC/ATIS/SoundFiles/", nil, 0.5, Subtitle, 2)
          RadioObject:NewTransmission("LightRain.ogg", 0.766, "Airbase_ATC/ATIS/SoundFiles/", nil, 0.0)
        elseif TypeRain == "Moderate rain" then
          Subtitle = string.format("%s: Moderate rain", Title)
          RadioObject:NewTransmission("DeadAir.ogg", 0.100, "Airbase_ATC/ATIS/SoundFiles/", nil, 0.5, Subtitle, 2)
          RadioObject:NewTransmission("ModerateRain.ogg", 0.923, "Airbase_ATC/ATIS/SoundFiles/", nil, 0.0)
        elseif TypeRain == "Heavy rain" then
          Subtitle = string.format("%s: Heavy rain", Title)
          RadioObject:NewTransmission("DeadAir.ogg", 0.100, "Airbase_ATC/ATIS/SoundFiles/", nil, 0.5, Subtitle, 2)
          RadioObject:NewTransmission("HeavyRain.ogg", 0.760, "Airbase_ATC/ATIS/SoundFiles/", nil, 0.0)
        end
      end
    end
    coroutine.yield()

    do
      local Clouds = AI_ATC.ATIS.Data.Cloud or "Clear clouds"
      local Base   = AI_ATC.ATIS.Data.Base  or "1000"

      local function readClouds(titleTrans, oggFile)
        RadioObject:NewTransmission("DeadAir.ogg", 0.100, "Airbase_ATC/ATIS/SoundFiles/", nil, 0.5, titleTrans, 2)
        RadioObject:NewTransmission(oggFile, 1.0, "Airbase_ATC/ATIS/SoundFiles/", nil, 0.0)
        RadioObject:NewTransmission("At.ogg", 0.418, "Airbase_ATC/ATIS/SoundFiles/", nil, 0.05)
        AI_ATC:ReadThousands(Base, RadioObject, Title)
      end

      if Clouds == "Clear clouds" then
        local s = string.format("%s: No Clouds", Title)
        RadioObject:NewTransmission("DeadAir.ogg", 0.100, "Airbase_ATC/ATIS/SoundFiles/", nil, 0.5, s, 2)
        RadioObject:NewTransmission("NoClouds.ogg", 0.914, "Airbase_ATC/ATIS/SoundFiles/", nil, 0.0)
      elseif Clouds == "Few clouds" then
        readClouds(string.format("%s: Few clouds at %s", Title, Base), "FewClouds.ogg")
      elseif Clouds == "Scattered clouds" then
        readClouds(string.format("%s: Scattered clouds at %s", Title, Base), "ScatteredClouds.ogg")
      elseif Clouds == "Broken clouds" then
        readClouds(string.format("%s: Broken clouds at %s", Title, Base), "BrokenClouds.ogg")
      elseif Clouds == "Solid Cloud Layer" then
        readClouds(string.format("%s: Solid cloud layer at %s", Title, Base), "SolidCloud.ogg")
      end
    end
    coroutine.yield()

    do
      local Temperature = AI_ATC.ATIS.Data.Temperature or "20"
      local DewPoint    = AI_ATC.ATIS.Data.DewPoint    or "10"

      local s = string.format("%s: Temperature %s", Title, Temperature)
      RadioObject:NewTransmission("DeadAir.ogg", 0.100, "Airbase_ATC/ATIS/SoundFiles/", nil, 0.5, s, 5)
      RadioObject:NewTransmission("Temperature.ogg", 0.656, "Airbase_ATC/ATIS/SoundFiles/", nil, 0.0)
      AI_ATC:ReadDigits(Temperature, RadioObject, Title)

      s = string.format("%s: Dew point %s", Title, DewPoint)
      RadioObject:NewTransmission("DeadAir.ogg", 0.100, "Airbase_ATC/ATIS/SoundFiles/", nil, 0.5, s, 5)
      RadioObject:NewTransmission("DewPoint.ogg", 0.737, "Airbase_ATC/ATIS/SoundFiles/", nil, 0.0)
      AI_ATC:ReadDigits(DewPoint, RadioObject, Title)
    end
    coroutine.yield()

    do
      local QNH = AI_ATC.ATIS.Data.QNH or "29.92"
      local s   = string.format("%s: Altimeter %s", Title, QNH)

      RadioObject:NewTransmission("DeadAir.ogg", 0.100, "Airbase_ATC/ATIS/SoundFiles/", nil, 0.5, s, 4)
      RadioObject:NewTransmission("Altimeter.ogg", 0.684, "Airbase_ATC/ATIS/SoundFiles/", nil, 0.0)
      AI_ATC:ReadDigits(QNH, RadioObject, Title)
    end
    coroutine.yield()

    do
      local ActiveRunway    = AI_ATC.ATIS.Data.Active
      local DepartureRunway = AI_ATC.ATIS.Data.Departure or "03L"
      local ArrivalRunway   = AI_ATC.ATIS.Data.Arrival   or "21L"
      local Approach        = AI_ATC.ATIS.Data.Approach  or "IFR"

      if not ActiveRunway then
        local s = string.format("%s: Departure runway %s", Title, DepartureRunway)
        RadioObject:NewTransmission("DeadAir.ogg", 0.100, "Airbase_ATC/ATIS/SoundFiles/", nil, 0.5, s, 4)
        RadioObject:NewTransmission("DepartureRunway.ogg", 1.138, "Airbase_ATC/ATIS/SoundFiles/", nil, 0.0)
        AI_ATC:Runway2(DepartureRunway, RadioObject, Title)

        s = string.format("%s: Arrival runway %s", Title, ArrivalRunway)
        RadioObject:NewTransmission("DeadAir.ogg", 0.100, "Airbase_ATC/ATIS/SoundFiles/", nil, 0.5, s, 4)
        RadioObject:NewTransmission("ArrivalRunway.ogg", 1.138, "Airbase_ATC/ATIS/SoundFiles/", nil, 0.0)
        AI_ATC:Runway2(ArrivalRunway, RadioObject, Title)
      else
        local s = string.format("%s: Active Runway %s", Title, ActiveRunway)
        RadioObject:NewTransmission("DeadAir.ogg", 0.100, "Airbase_ATC/ATIS/SoundFiles/", nil, 0.5, s, 4)
        RadioObject:NewTransmission("ActiveRunway.ogg", 0.940, "Airbase_ATC/ATIS/SoundFiles/", nil, 0.0)
        AI_ATC:Runway2(ActiveRunway, RadioObject, Title)
      end

      if Approach == "VFR" then
        local s = string.format("%s: VFR Approach for runway %s", Title, ArrivalRunway)
        RadioObject:NewTransmission("DeadAir.ogg", 0.100, "Airbase_ATC/ATIS/SoundFiles/", nil, 0.5, s, 4)
        RadioObject:NewTransmission("VFR.ogg", 1.811, "Airbase_ATC/ATIS/SoundFiles/", nil, 0.0)
        AI_ATC:Runway2(ArrivalRunway, RadioObject, Title)
      else
        local s = string.format("%s: IFR Approach for runway %s", Title, ArrivalRunway)
        RadioObject:NewTransmission("DeadAir.ogg", 0.100, "Airbase_ATC/ATIS/SoundFiles/", nil, 0.5, s, 4)
        RadioObject:NewTransmission("IFR.ogg", 1.718, "Airbase_ATC/ATIS/SoundFiles/", nil, 0.0)
        AI_ATC:Runway2(ArrivalRunway, RadioObject, Title)
      end
    end
    coroutine.yield()

    do
      local s = string.format("%s: NOTAM: Large force exercise in progress. Increased numbers of high performance aircraft in vicinity of airbase.", Title)
      RadioObject:NewTransmission("DeadAir.ogg", 0.100, "Airbase_ATC/ATIS/SoundFiles/", nil, 0.5, s, 4)
      RadioObject:NewTransmission("NOTAMS.ogg", 6.989, "Airbase_ATC/ATIS/SoundFiles/", nil, 0.0)

      local Information = AI_ATC.ATIS.Data.Information or "Alpha"
      s = string.format("%s: Advise on initial contact you have information %s", Title, Information)
      RadioObject:NewTransmission("DeadAir.ogg", 0.100, "Airbase_ATC/ATIS/SoundFiles/", nil, 0.5, s, 4)
      RadioObject:NewTransmission("InitContact.ogg", 2.972, "Airbase_ATC/ATIS/SoundFiles/", nil, 0.0)
      AI_ATC:Phonetic(Information, RadioObject, Title)

      AI_ATC.ATIS.Data.FC3switch = false
    end
    coroutine.yield()

    while true do
      local queueEmpty = (#ATIS_RADIO.queue == 0)
      if queueEmpty then
        if AI_ATC.ATIS.Data.Count > 30 then
          AI_ATC:InitATIS()
        end
        AI_ATC.ATIS.Data.Count = AI_ATC.ATIS.Data.Count + 1
        AI_ATC.ATIS.Active = false
        AI_ATC:StartATIS()
        break
      end

      coroutine.yield()
    end
  end

  ATC_Coroutine:AddCoroutine(ATISCoroutine, 1)
end

-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--************************************************************************ATC CLEARANCE DELIVERY*********************************************************************************--
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function AI_ATC:ClearanceDelivery(Alias, SID, Audio)

  local Transmitter = "Clearance"
  local RadioObject = AI_ATC:FindTransmitter(Alias, Transmitter)
  local Title = string.format("%s %s", AI_ATC.Airbase, Transmitter)
  local ClientData = ATM.ClientData[Alias]
  local Unit = ClientData.Unit
  local Group = Unit:GetGroup()
  local Callsign = ClientData.Callsign
  local FlightCallsign = ClientData.FlightCallsign
  local Flight = ClientData.Flight
  local CallsignSub = Flight and FlightCallsign or Callsign
  local Delay = 1.5 + math.random() * (2.5 - 1.5)
  
  if AI_ATC:FunctionDelay(Alias, function() AI_ATC:ClearanceDelivery(Alias, SID, Audio) end, Transmitter)==false then
    return
  end
  
  local SIDTbl = {
    ["Alfa 05"] = {file = "Alfa05.ogg", duration = 1.416},
    ["Charlie 05"] = {file = "Charlie05.ogg", duration = 1.556},
    ["Delta 05"] = {file = "Delta05.ogg", duration = 1.486},
    ["Echo 05"] = {file = "Echo05.ogg", duration = 1.416},
    ["Alfa 23"] = {file = "Alfa23.ogg", duration = 1.358},
    ["Charlie 23"] = {file = "Charlie23.ogg", duration = 1.602},
    ["Delta 23"] = {file = "Delta23.ogg", duration = 1.463},
    ["Echo 23"] = {file = "Echo23.ogg", duration = 1.434},
  }
  local InstructionTbl = {
    ["Alfa 05"] = {file = "DMEarc.ogg", duration = 9.532, Subtitle = " Climb and maintain 5000. Fly the 5 DME ARC to intercept outbound Radial, then climb to FL125 "},
    ["Charlie 05"] = {file = "Climb125.ogg", duration = 4.540, Subtitle = " Climb and maintain FL125, "},
    ["Delta 05"] = {file = "DMEarc.ogg", duration = 9.532, Subtitle = " Climb and maintain 5000. Fly the 5 DME ARC to intercept outbound Radial, then climb to FL125. "},
    ["Echo 05"] = {file = "DMEarc.ogg", duration = 9.532, Subtitle = " Climb and maintain 5000. Fly the 5 DME ARC to intercept outbound Radial, then climb to FL125. "},
    ["Alfa 23"] = {file = "DMEarc.ogg", duration = 9.532, Subtitle = " Climb and maintain 5000. Fly the 5 DME ARC to intercept outbound Radial, then climb to FL125. "},
    ["Charlie 23"] = {file = "DMEarc.ogg", duration = 9.532, Subtitle = " Climb and maintain 5000. Fly the 5 DME ARC to intercept outbound Radial, then climb to FL125. "},
    ["Delta 23"] = {file = "DMEarc.ogg", duration = 9.532, Subtitle = " Climb and maintain 5000. Fly the 5 DME ARC to intercept outbound Radial, then climb to FL125. "},
    ["Echo 23"] = {file = "Climb125.ogg", duration = 4.540, Subtitle = " Climb and maintain FL125, "},
  }
  
  AI_ATC:ResetMenus(Alias)
  AI_ATC:GroundStartSubMenu(Alias)
  AI_ATC:ReadBackSubMenu(Alias)
  USERSOUND:New("RADIO_TRANS_START.ogg"):ToUnit(Unit)
  local Squawk, FirstDigit, Departure, Instruction, Subtitle, InstructionSub, Sequential
  
  SCHEDULER:New(nil, function()
    AI_ATC:RepeatLastTransmission(Alias, function()AI_ATC:ClearanceDelivery(Alias, SID, true) end)
    Squawk = ClientData.Squawk
    FirstDigit = string.sub(Squawk, 1, 1)
    if Flight then
      Sequential = " sequential."
    else
      Sequential = "."
    end
    if SID then
      Departure = SIDTbl[SID]
      Instruction = InstructionTbl[SID]
      InstructionSub = Instruction.Subtitle.."Expect Higher 5 minutes after departure"
      Subtitle = string.format("%s: %s, %s, Cleared Incirlik Airbase via %s departure.", Title, CallsignSub, Title, SID)
    else
      Subtitle = string.format("%s: %s, %s, cleared departure as filed.", Title, CallsignSub, Title)
    end
  end,{}, 0.5 )

  SCHEDULER:New(nil, function()
    AI_ATC:ChannelOpen(14, Transmitter, Alias)
    RadioObject:NewTransmission("DeadAir.ogg", 0.100, "Airbase_ATC/Ground/SoundFiles/", nil, nil, Subtitle, 4)
    AI_ATC:Callsign(Callsign, RadioObject, Transmitter, Flight)
    RadioObject:NewTransmission("IncirlikClearance.ogg", 0.999, "Airbase_ATC/Clearance/SoundFiles/", nil, 0.2)
    if not SID then
      RadioObject:NewTransmission("AsFiled.ogg", 1.277, "Airbase_ATC/Clearance/SoundFiles/", nil, 0.2)
    else
      RadioObject:NewTransmission("ClearedVia.ogg", 1.869, "Airbase_ATC/Clearance/SoundFiles/", nil, 0.2)
      RadioObject:NewTransmission(Departure.file, Departure.duration, "Airbase_ATC/Clearance/SoundFiles/", nil, nil)
      Subtitle = string.format("%s: Fly Runway heading%s.", Title, InstructionSub)
      RadioObject:NewTransmission("DeadAir.ogg", 0.100, "Airbase_ATC/Ground/SoundFiles/", nil, nil, Subtitle, Instruction.duration + 2)
      RadioObject:NewTransmission("RunwayHeading.ogg", 1.231, "Airbase_ATC/Clearance/SoundFiles/", nil, 0.2)
      RadioObject:NewTransmission(Instruction.file, Instruction.duration, "Airbase_ATC/Clearance/SoundFiles/", nil, 0.05)
    end
    Subtitle = string.format("%s: Contact Incirlik Departure on 340.775, Squak %s%s", Title, Squawk, Sequential)
    RadioObject:NewTransmission("DeadAir.ogg", 0.100, "Airbase_ATC/Ground/SoundFiles/", nil, 0.1, Subtitle, 8)
    RadioObject:NewTransmission("IncirlikDeparture.ogg", 4.249, "Airbase_ATC/Clearance/SoundFiles/", nil, nil)
    AI_ATC:ReadDigits(FirstDigit, RadioObject, Transmitter)
    RadioObject:NewTransmission("ZeroZeroOne.ogg", 1.033, "Airbase_ATC/Clearance/SoundFiles/", nil, 0.05)
    if Flight then
      RadioObject:NewTransmission("Sequential.ogg", 0.600, "Airbase_ATC/Clearance/SoundFiles/", nil, 0.05)
    end
  end,{}, Delay )
  
  if Audio~=true then
    if AI_Instructor then
      if AI_Instructor.Active == true and AI_Instructor.ContactClearance == false then
        SCHEDULER:New(nil, function()
          AI_Instructor.ContactClearance = true
        end,{}, 13)
      end
    end
  end

end
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--****************************************************************************CLEARANCE READBACK*********************************************************************************--
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function AI_ATC:ClearanceReadBack(Alias, code)
  local Transmitter      = "Clearance"
  local RadioObject      = AI_ATC:FindTransmitter(Alias, Transmitter)
  local Title            = string.format("%s %s", AI_ATC.Airbase, Transmitter)
  local ClientData       = ATM.ClientData[Alias]
  local Unit            = ClientData.Unit
  local Group           = Unit and Unit:GetGroup()
  local Callsign        = ClientData.Callsign
  local FlightCallsign  = ClientData.FlightCallsign
  local Flight          = ClientData.Flight
  local Squawk          = ClientData.Squawk
  local CallsignSub     = Flight and FlightCallsign or Callsign
  local Delay           = 1.5 + math.random() * (2.5 - 1.5)
  
  if AI_ATC:FunctionDelay(Alias, function() AI_ATC:ClearanceReadBack(Alias, code) end, Transmitter) == false then
    return
  end
  
  if Squawk~=code then
    AI_ATC:ClearanceDelivery(Alias)
    return
  end
  
  USERSOUND:New("RADIO_TRANS_START.ogg"):ToUnit(Unit)
  AI_ATC:ResetMenus(Alias)
  AI_ATC:ClearanceSubMenu(Alias)
  AI_ATC:GroundStartSubMenu(Alias)
  
  if AI_Instructor then
    if AI_Instructor.Active == true then 
      SCHEDULER:New(nil, function()
        AI_Instructor.ContactClearance = true
      end, {}, Delay+12)
    end
  end

  
  local function Execute()
    SCHEDULER:New(nil, function()
      AI_ATC:RepeatLastTransmission(Alias, function() AI_ATC:ClearanceReadBack(Alias, code) end)
      AI_ATC:ChannelOpen(6, Transmitter, Alias)
      local subtitle = string.format("%s: %s, Readback Correct, Contact Incirlik Ground prior to Taxi.", Title, CallsignSub )
      RadioObject:NewTransmission("DeadAir.ogg", 0.100, "Airbase_ATC/Ground/SoundFiles/", nil, nil, subtitle, 6)
      AI_ATC:Callsign(Callsign, RadioObject, Transmitter, Flight)
      RadioObject:NewTransmission("ReadBackIncirlik.ogg", 3.193, "Airbase_ATC/Clearance/SoundFiles/", nil, 0.1)
    end,{}, Delay )
  end
  
  Execute()
end
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--*******************************************************************************START AI_ATC************************************************************************************--
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function AI_ATC:EngineStart(Alias, Audio)

  local Transmitter = "Ground"
  local RadioObject = AI_ATC:FindTransmitter(Alias, Transmitter)
  --local RadioObject = GROUND_RADIO
  local Title = string.format("%s %s", AI_ATC.Airbase, Transmitter)
  local ClientData = ATM.ClientData[Alias]
  local Unit = ClientData.Unit
  local Type = ClientData.Type
  local Group = Unit:GetGroup()
  local Callsign = ClientData.Callsign
  local FlightCallsign = ClientData.FlightCallsign
  local Flight = ClientData.Flight
  local CallsignSub = Flight and FlightCallsign or Callsign
  local Delay = 1.5 + math.random() * (2.5 - 1.5)
  
  if AI_ATC:FunctionDelay(Alias, function() AI_ATC:EngineStart(Alias, Audio) end, Transmitter)==false then
    return
  end
  
  USERSOUND:New("RADIO_TRANS_START.ogg"):ToUnit(Unit)
  AI_ATC:RepeatLastTransmission(Alias, function()AI_ATC:EngineStart(Alias, true) end)
  
  if Audio ~= true then
    AI_ATC:ChannelOpen(8, Transmitter, Alias)
    ATM.ClientData[Alias].GroundMenu:RemoveSubMenus()
    AI_ATC:TaxiSubMenu(Alias)

    if AI_Instructor then
      if AI_Instructor.Active == true then 
        SCHEDULER:New(nil, function()
          AI_Instructor:PostStart()
        end,{}, 10)
      end
    end
  end
  
  local EngineStart, EngineStartClock
  if ClientData.EngineStart ~= nil then 
    EngineStart = AI_ATC.MissionStart + ClientData.EngineStart 
  else 
    EngineStart = 0 
  end
  EngineStartClock = UTILS.SecondsToClock(EngineStart, true)

  SCHEDULER:New(nil, function()
    local ActualTime = UTILS.SecondsOfToday()
    if ActualTime >= EngineStart then
      if AI_Wingman then AI_Wingman:EngineStart() end
      local Subtitle = string.format("%s: %s, %s. Engine start approved. Advise when ready to taxi.", Title, CallsignSub, Title)
      RadioObject:NewTransmission("DeadAir.ogg", 0.100, "Airbase_ATC/Ground/SoundFiles/", nil, nil, Subtitle, 5)
      AI_ATC:Callsign(Callsign, RadioObject, Transmitter, Flight)
      AI_ATC:AirbaseName(AI_ATC.Airbase, RadioObject, Transmitter)
      RadioObject:NewTransmission("Ground.ogg", 0.383, "Airbase_ATC/Ground/SoundFiles/", nil, nil)
      RadioObject:NewTransmission("EngineStart2.ogg", 2.647, "Airbase_ATC/Ground/SoundFiles/", nil, 0.1)      
    else
      local Subtitle = string.format("%s: %s. Negative. Your engine start time is %s local as fragged", Title, CallsignSub, EngineStartClock)
      RadioObject:NewTransmission("DeadAir.ogg", 0.100, "Airbase_ATC/Ground/SoundFiles/", nil, nil, Subtitle, 5)
      AI_ATC:Callsign(Callsign, RadioObject, Transmitter, Flight)
      RadioObject:NewTransmission("Negative.ogg", 0.511, "Airbase_ATC/Ground/SoundFiles/", nil, 0.3)
      RadioObject:NewTransmission("StartTime.ogg", 1.277, "Airbase_ATC/Ground/SoundFiles/", nil, 0.5)
      AI_ATC:ProcessTime(EngineStartClock, RadioObject, Transmitter)
      RadioObject:NewTransmission("local.ogg", 0.383, "Airbase_ATC/Ground/SoundFiles/", nil, nil)
      RadioObject:NewTransmission("AsFragged.ogg", 0.64, "Airbase_ATC/Ground/SoundFiles/", nil, nil)
    end
    
    SCHEDULER:New(nil, function()
      if Type=="C-130J-30" then
        if ATM.ClientData[Alias].CrewChief then
          ATM.ClientData[Alias].CrewChief:Destroy()
        end
      end
    end,{}, 10)
  end,{}, Delay )

end
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--*******************************************************************************ATC TAXI CLEARANCE******************************************************************************--
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function AI_ATC:HeloTaxi(Alias, Audio)
  local Transmitter = "Ground"
  local RadioObject = GROUND_RADIO
  local Title = string.format("%s %s", AI_ATC.Airbase, Transmitter)
  local ClientData = ATM.ClientData[Alias]
  local Unit = ClientData.Unit
  local Group = Unit:GetGroup()
  local RadioKey = AI_ATC.Radio[Transmitter].Key
  local Juliett = AI_ATC_SoundFiles[RadioKey].Phonetic["Juliett"]
  local Kilo = AI_ATC_SoundFiles[RadioKey].Phonetic["Kilo"]
  local Callsign = ClientData.Callsign
  local FlightCallsign = ClientData.FlightCallsign
  local Flight = ClientData.Flight
  local CallsignSub = Flight and FlightCallsign or Callsign
  local Delay = 1.5 + math.random() * (2.5 - 1.5)
  
  if AI_ATC:FunctionDelay(Alias, function() AI_ATC:HeloTaxi(Alias, Audio) end, Transmitter)==false then
    return
  end
  
  USERSOUND:New("RADIO_TRANS_START.ogg"):ToUnit(Unit)
  AI_ATC:RepeatLastTransmission(Alias, function()AI_ATC:HeloTaxi(Alias, true) end)
  if Audio~=true then
    ATM.ClientData[Alias].GroundMenu:RemoveSubMenus()
    --AI_ATC:CrossPadSubMenu(Alias)
    AI_ATC:HeloHoldShort(Alias)
  end
  
  SCHEDULER:New(nil, function()
    local Subtitle = string.format("%s: %s, %s. Taxi via Juliett, Kilo. Contact tower holding short of Jolly.", Title, CallsignSub, Title )
    RadioObject:NewTransmission("DeadAir.ogg", 0.100, "Airbase_ATC/Ground/SoundFiles/", nil, nil, Subtitle, 5)
    AI_ATC:Callsign(Callsign, RadioObject, Transmitter, Flight)
    AI_ATC:AirbaseName(AI_ATC.Airbase, RadioObject, Transmitter)
    RadioObject:NewTransmission("Ground.ogg", 0.383, "Airbase_ATC/Ground/SoundFiles/", nil, nil)
    RadioObject:NewTransmission("Taxivia.ogg", 0.778, "Airbase_ATC/Ground/SoundFiles/", nil, 0.2)
    RadioObject:NewTransmission(string.format("Phonetic/%s", Juliett.filename),Juliett.duration, string.format("Airbase_ATC/%s/", RadioKey), nil, 0.1)
    RadioObject:NewTransmission(string.format("Phonetic/%s", Kilo.filename),Kilo.duration, string.format("Airbase_ATC/%s/", RadioKey), nil, 0.1)
    RadioObject:NewTransmission("Jolly.ogg", 1.834, "Airbase_ATC/Ground/SoundFiles/", nil, 0.1)
  end,{}, Delay )
end
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--*******************************************************************************ATC TAXI CLEARANCE******************************************************************************--
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function AI_ATC:TaxiClearance(Alias)
  local Transmitter = "Ground"
  local ClientData = ATM.ClientData[Alias]
  if not ClientData or not ClientData.Unit then
    env.info(string.format("AI_ATC:TaxiClearance - Invalid Alias '%s'.", Alias))
    return
  end
  
  if AI_ATC:FunctionDelay(Alias, function() AI_ATC:TaxiClearance(Alias) end, Transmitter)==false then
    return
  end
  
  local RadioObject = AI_ATC:FindTransmitter(Alias, Transmitter)
  --local RadioObject = GROUND_RADIO
  local Title = string.format("%s %s", AI_ATC.Airbase, Transmitter)
  local Unit = ClientData.Unit
  local Group = Unit:GetGroup()
  local Delay = 1.5 + math.random() * (2.5 - 1.5)
  local Callsign = ClientData.Callsign
  local Flight = ClientData.Flight
  local CallsignSub = Flight and ClientData.FlightCallsign or Callsign
  local Runway = AI_ATC.Runways.Takeoff[1]
  local SchedulerObjects = ATM.ClientData[Alias].SchedulerObjects
  local TaxiSubtitle, HoldShort, SchedulerObject
  
  USERSOUND:New("RADIO_TRANS_START.ogg"):ToUnit(Unit)
  ATM.GroundControl[Alias].TaxiRequested = true
  
  SCHEDULER:New(nil, function()
    TaxiSubtitle = AI_ATC:TaxiSubtitle(Alias)
    HoldShort = Runway
    AI_ATC:TaxiRequest(Alias)
  end,{}, 0.5)
  
  local function TaxiPermission()
    local function Audio()
      AI_ATC:RepeatLastTransmission(Alias, function()Audio() end)
      AI_ATC:ChannelOpen(10, Transmitter, Alias)
      local Subtitle = string.format("%s: %s, %s. Runway %s. Taxi via %s. ", Title, CallsignSub, Title, Runway, TaxiSubtitle )
      RadioObject:NewTransmission("DeadAir.ogg", 0.100, "Airbase_ATC/Ground/SoundFiles/", nil, nil, Subtitle, 6)
      AI_ATC:Callsign(Callsign, RadioObject, Transmitter, Flight)
      AI_ATC:AirbaseName(AI_ATC.Airbase, RadioObject, Transmitter)
      RadioObject:NewTransmission("Ground.ogg", 0.383, "Airbase_ATC/Ground/SoundFiles/", nil, nil)
      RadioObject:NewTransmission("Runway.ogg", 0.473, "Airbase_ATC/Ground/SoundFiles/", nil, 0.2)
      AI_ATC:Runway(Runway, RadioObject, Transmitter)
      RadioObject:NewTransmission("Taxivia.ogg", 0.778, "Airbase_ATC/Ground/SoundFiles/", nil, 0.2)
      AI_ATC:ReadTaxiInstructions(Alias, RadioObject, Transmitter)
      AI_ATC:TaxiQueue(Alias, RadioObject, Transmitter)
      
      local Subtitle = string.format("%s: Contact tower holding short runway %s", Title, HoldShort )
      RadioObject:NewTransmission("ContactTower.ogg", 1.66, "Airbase_ATC/Ground/SoundFiles/", nil, 0.1, Subtitle, 3)
      AI_ATC:Runway(HoldShort, RadioObject, Transmitter)
    end
    Audio()
    AI_ATC:ResetMenus(Alias)
    SCHEDULER:New(nil, function()
      AI_ATC:HoldShortTracker(Alias)
    end,{}, 10)
    
    if AI_Wingman then 
      AI_Wingman:TaxiClearance() 
    end
    
    if AI_Instructor then
      if AI_Instructor.Active==true and AI_Instructor.TaxiApproved==false then
        SCHEDULER:New(nil, function()
          AI_Instructor.TaxiApproved = true
        end,{}, 15)
      end
    end
    
  end
  
  local function HoldPosition()
    local function Audio()
      AI_ATC:RepeatLastTransmission(Alias, function()Audio() end)
      AI_ATC:ChannelOpen(7, Transmitter, Alias)
      local Subtitle = string.format("%s: %s. Hold position.", Title, CallsignSub)
      RadioObject:NewTransmission("DeadAir.ogg", 0.100, "Airbase_ATC/Ground/SoundFiles/", nil, nil, Subtitle, 3)
      AI_ATC:Callsign(Callsign, RadioObject, Transmitter, Flight)
      RadioObject:NewTransmission("HoldPosition.ogg", 0.720, "Airbase_ATC/Ground/SoundFiles/", nil, nil)
    end
    Audio()
    
    SchedulerObject = SCHEDULER:New(nil, function()
      if ATM.GroundControl[Alias] then
        if ATM.GroundControl[Alias].TaxiAuthority == true then
          TaxiPermission()
          SchedulerObject:Stop()
        elseif ATM.GroundControl[Alias].TaxiAuthority == false then
          AI_ATC:TaxiRequest(Alias)
        end
      end
    end,{}, 1, 1 )
    table.insert(SchedulerObjects, SchedulerObject)
  end
  
  SCHEDULER:New(nil, function()
    if ATM.GroundControl[Alias] and ATM.GroundControl[Alias].TaxiAuthority == true then
      TaxiPermission()
    else
      HoldPosition()
    end
  end,{}, Delay)
end
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--*******************************************************************************ATC HELO HOLD SHORT**********************************************************************************--
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function AI_ATC:HeloHoldShort(Alias)
  local Transmitter = "Tower"
  local Title = string.format("%s %s", AI_ATC.Airbase, Transmitter)
  local RadioObject = TOWER_RADIO
  local ClientObject = ATM.ClientData[Alias]
  local Unit = ClientObject.Unit
  local Group = Unit:GetGroup()
  local HoldShort = HoldShortData["JOLLY"][1]
  local SchedulerObject
  local Callsign = ClientObject.Callsign
  local FlightCallsign = ClientObject.FlightCallsign
  local Flight = ClientObject.Flight
  local CallsignSub = Flight and FlightCallsign or Callsign
  
  if AI_ATC:FunctionDelay(Alias, function() AI_ATC:HeloHoldShort(Alias) end, Transmitter)==false then
    return
  end
  
  AI_ATC:CrossPadSubMenu(Alias)
  
  SchedulerObject = SCHEDULER:New(nil, function()
    if Unit and Unit:IsAlive() and ATM.ClientData[Alias] and ATM.GroundControl[Alias] then
      if Unit:IsInZone(HoldShort) then
        AI_ATC:ChannelOpen(7, Transmitter, Alias)
        local Subtitle = string.format("%s: %s Hold short.", Title, CallsignSub)
        RadioObject:NewTransmission("DeadAir.ogg", 0.100, "Airbase_ATC/Ground/SoundFiles/", nil, 0.3, Subtitle, 1)
        AI_ATC:Callsign(Callsign, RadioObject, Transmitter, Flight)
        RadioObject:NewTransmission("HoldShort.ogg", 0.615, "Airbase_ATC/Ground/SoundFiles/", nil, nil)
        AI_ATC:CrossPadSubMenu(Alias)
        SchedulerObject:Stop()
      end
    else
      SchedulerObject:Stop()
    end
  end,{}, 1, 1 )

end
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--*******************************************************************************ATC HOLD SHORT**********************************************************************************--
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function AI_ATC:HoldShortTracker(Alias)
  local Transmitter = "Tower"
  local ClientData = ATM.ClientData[Alias]

  if not ClientData or not ClientData.Unit then
    env.info(string.format("AI_ATC:HoldShortTracker - Invalid Alias '%s'.", Alias))
    return
  end

  local Unit = ClientData.Unit
  local Group = Unit:GetGroup()
  local RadioObject = TOWER_RADIO
  local Title = string.format("%s %s", AI_ATC.Airbase, Transmitter)
  local Runway = AI_ATC.Runways.Takeoff[1]
  --local HoldShort = ATM.GroundControl[Alias].HoldShort
  local HoldShort = Runway
  local SchedulerObjects = ClientData.SchedulerObjects or {}
  local Callsign = ClientData.Callsign
  local Flight = ClientData.Flight
  local CallsignSub = Flight and ClientData.FlightCallsign or Callsign

  local HoldShortZones = HoldShortData[HoldShort]
  if not HoldShortZones or #HoldShortZones == 0 then
    env.info(string.format("AI_ATC:HoldShortTracker - No HoldShort zones for '%s'.", HoldShort))
    return
  end
  
  if AI_Wingman_1_Unit then
    Unit = AI_Wingman_1_Unit
  end

  for index, ZoneObject in ipairs(HoldShortZones) do
    if AI_Wingman_1_Unit then
      ZoneObject:SetRadius(50)
      local GuardZone = RunwayGuard[HoldShort] and RunwayGuard[HoldShort][index]
      if GuardZone then
        local GuardCoord = GuardZone:GetCoordinate()
        AI_ATC:SpawnHoldShort(GuardCoord, index)
      end
    end
    
    local ZoneCoord = ZoneObject:GetCoordinate()
    local scheduler = SCHEDULER:New(nil, function()
      if Unit and Unit:IsAlive() then
        local Coord = Unit:GetCoordinate()
        if Coord:Get2DDistance(ZoneCoord) <= 50 then
          local Subtitle = string.format("%s: %s Hold short.", Title, CallsignSub)
          RadioObject:NewTransmission("DeadAir.ogg", 0.100, "Airbase_ATC/Ground/SoundFiles/", nil, 0.3, Subtitle, 1)
          AI_ATC:Callsign(Callsign, RadioObject, Transmitter, Flight)
          RadioObject:NewTransmission("HoldShort.ogg", 0.615, "Airbase_ATC/Ground/SoundFiles/", nil, nil)
          
          if AI_Instructor then
            if AI_Instructor.Active and not AI_Instructor.HoldShort then
              AI_Instructor.HoldShort = true
            end
          end

          AI_ATC:ResetMenus(Alias)
          if Runway ~= HoldShort then
            AI_ATC:CrossRunwaySubMenu(Alias, HoldShort)
          else
            AI_ATC:TakeOffSubMenu(Alias)
          end

          AI_ATC:TerminateSchedules(Alias)
        end
      end
    end, {}, 1, 1)

    table.insert(SchedulerObjects, scheduler)
  end
end

-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--*******************************************************************************ATC CROSS RUNWAY********************************************************************************--
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function AI_ATC:CrossRunway(Alias, Audio)
  local Transmitter = "Tower"
  local Title = string.format("%s %s", AI_ATC.Airbase, Transmitter)
  local RadioObject = TOWER_RADIO
  local ClientData = ATM.ClientData[Alias]
  local Unit = ClientData.Unit
  local Group = Unit:GetGroup()
  local Runway = AI_ATC.Runways.Takeoff[1]
  local HoldShort = ATM.GroundControl[Alias].HoldShort
  local Callsign = ClientData.Callsign
  local FlightCallsign = ClientData.FlightCallsign
  local Flight = ClientData.Flight
  local CallsignSub = Flight and FlightCallsign or Callsign
  local Delay = 1.5 + math.random() * (2.5 - 1.5)

  if AI_ATC:FunctionDelay(Alias, function() AI_ATC:CrossRunway(Alias, Audio) end, Transmitter)==false then
    return
  end
  
  if Audio~=true then
    USERSOUND:New("RADIO_TRANS_START.ogg"):ToUnit(Unit)
    AI_ATC:ResetMenus(Alias)
    AI_ATC:RepeatLastTransmission(Alias, function()AI_ATC:CrossRunway(Alias, true) end)
    AI_ATC:TakeOffSubMenu(Alias)
  end
  
  SCHEDULER:New(nil, function()
    AI_ATC:ChannelOpen(7, Transmitter, Alias)
    local Subtitle = string.format("%s: %s Cross runway %s, Hold short %s.", Title, CallsignSub, HoldShort, Runway)
    RadioObject:NewTransmission("DeadAir.ogg", 0.100, "Airbase_ATC/Ground/SoundFiles/", nil, 0.3, Subtitle, 5)
    AI_ATC:Callsign(Callsign, RadioObject, Transmitter, Flight)
    RadioObject:NewTransmission("CrossRunway.ogg", 0.740, "Airbase_ATC/Ground/SoundFiles/", nil, nil)
    AI_ATC:Runway(HoldShort, RadioObject, Transmitter)
    RadioObject:NewTransmission("HoldShort.ogg", 0.615, "Airbase_ATC/Ground/SoundFiles/", nil, 0.2)
    AI_ATC:Runway(Runway, RadioObject, Transmitter)
  end,{}, Delay)
  
end
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--*******************************************************************************ATC TAKE PAD************************************************************************************--
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function AI_ATC:TakePad(Alias)
  local Transmitter = "Tower"
  local RadioObject = TOWER_RADIO
  local Title = string.format("%s %s", AI_ATC.Airbase, Transmitter)
  local ClientData = ATM.ClientData[Alias]
  local Unit = ClientData.Unit
  local Callsign = ClientData.Callsign
  local FlightCallsign = ClientData.FlightCallsign
  local Flight = ClientData.Flight
  local CallsignSub = Flight and FlightCallsign or Callsign
  local Delay = 1.5 + math.random() * (2.5 - 1.5)
  
  if AI_ATC:FunctionDelay(Alias, function() AI_ATC:TakePad(Alias) end, Transmitter)==false then
    return
  end
  
  USERSOUND:New("RADIO_TRANS_START.ogg"):ToUnit(Unit)
  AI_ATC:ResetMenus(Alias)
  AI_ATC:HoverSubMenu(Alias)
  AI_ATC:RepeatLastTransmission(Alias, function()AI_ATC:TakePad(Alias) end)

  SCHEDULER:New(nil, function()
    AI_ATC:ChannelOpen(6, Transmitter, Alias)
    local Subtitle = string.format("%s: %s, Cleared Jolly pad. ", Title, CallsignSub, Title)
    RadioObject:NewTransmission("DeadAir.ogg", 0.100, "Airbase_ATC/Ground/SoundFiles/", nil, nil, Subtitle, 4)
    AI_ATC:Callsign(Callsign, RadioObject, Transmitter, Flight)
    RadioObject:NewTransmission("JollyPad.ogg", 0.940, "Airbase_ATC/Ground/SoundFiles/", nil, nil)
  end,{}, Delay )
end
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--*******************************************************************************ATC HOVER CHECK*********************************************************************************--
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function AI_ATC:HoverCheck(Alias, Agency)
  local Transmitter = Agency
  local RadioObject = AI_ATC:FindTransmitter(Alias, Transmitter)
  local Title = string.format("%s %s", AI_ATC.Airbase, Transmitter)
  local ClientData = ATM.ClientData[Alias]
  local Unit = ClientData.Unit
  local Callsign = ClientData.Callsign
  local FlightCallsign = ClientData.FlightCallsign
  local Flight = ClientData.Flight
  local CallsignSub = Flight and FlightCallsign or Callsign
  local Delay = 1.5 + math.random() * (2.5 - 1.5)
  
  if AI_ATC:FunctionDelay(Alias, function() AI_ATC:HoverCheck(Alias, Agency) end, Transmitter)==false then
    return
  end

  AI_ATC:RepeatLastTransmission(Alias, function()AI_ATC:HoverCheck(Alias, Agency) end)
  USERSOUND:New("RADIO_TRANS_START.ogg"):ToUnit(Unit)
  
  SCHEDULER:New(nil, function()
    AI_ATC:ChannelOpen(6, Transmitter, Alias)
    local Subtitle = string.format("%s: %s. Cleared hover check. ", Title, CallsignSub)
    RadioObject:NewTransmission("DeadAir.ogg", 0.100, "Airbase_ATC/Ground/SoundFiles/", nil, nil, Subtitle, 4)
    AI_ATC:Callsign(Callsign, RadioObject, Transmitter, Flight)
    RadioObject:NewTransmission("HoverCheck.ogg", 1.068, "Airbase_ATC/Ground/SoundFiles/", nil, nil)
  end,{}, Delay )
  
end
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--************************************************************************ATC TAKEOFF FROM PARKING*******************************************************************************--
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function AI_ATC:TakeoffFromParking(Alias)
  local Transmitter = "Tower"
  local RadioObject = TOWER_RADIO
  local Title = string.format("%s %s", AI_ATC.Airbase, Transmitter)
  local ClientData = ATM.ClientData[Alias]
  local Unit = ClientData.Unit
  local Callsign = ClientData.Callsign
  local FlightCallsign = ClientData.FlightCallsign
  local Flight = ClientData.Flight
  local CallsignSub = Flight and FlightCallsign or Callsign
  local Delay = 1.5 + math.random() * (2.5 - 1.5)
  
  local Instruction, Coord, Height, WindDirection, WindSpeed, Runway
  
  if AI_ATC:FunctionDelay(Alias, function() AI_ATC:TakeoffFromParking(Alias) end, Transmitter)==false then
    return
  end
  
  USERSOUND:New("RADIO_TRANS_START.ogg"):ToUnit(Unit)
  
  SCHEDULER:New(nil, function()
    Coord = AI_ATC_Vec3
    Height = Coord:GetLandHeight()
    WindDirection, WindSpeed = Coord:GetWind(Height + 10)
    WindDirection = AI_ATC:RectifyHeading(tostring(math.floor(WindDirection + 0.5)))
    WindSpeed = tostring(math.floor(UTILS.MpsToKnots(WindSpeed) - 0.5))
  end,{}, 0.5 )
  
  SCHEDULER:New(nil, function()
    AI_ATC:TerminateSchedules(Alias)
    AI_ATC:ResetMenus(Alias)
    AI_ATC:DepartureSubMenu(Alias)
    AI_ATC:RepeatLastTransmission(Alias, function()AI_ATC:TakeoffFromParking(Alias) end)
    Runway = AI_ATC.Runways.Takeoff[1]
    Instruction = string.format("%s: Depart field and Remain clear of runway %s. Use Caution.", Title, Runway)
  end,{}, 1.0 )

  
  SCHEDULER:New(nil, function()
    AI_ATC:ChannelOpen(6, Transmitter, Alias)
    local Subtitle = string.format("%s: %s, %s. Depart field and remain clear of runway %s, Use Caution", Title, CallsignSub, Title, Runway)
    RadioObject:NewTransmission("DeadAir.ogg", 0.100, "Airbase_ATC/Ground/SoundFiles/", nil, nil, Subtitle, 6)
    AI_ATC:Callsign(Callsign, RadioObject, Transmitter, Flight)
    AI_ATC:AirbaseName(AI_ATC.Airbase, RadioObject, Transmitter)
    RadioObject:NewTransmission("Tower.ogg", 0.384, "Airbase_ATC/Ground/SoundFiles/", nil, nil)

    RadioObject:NewTransmission("RemainClear.ogg", 2.241, "Airbase_ATC/Ground/SoundFiles/", nil, 0.2)
    AI_ATC:Runway(Runway, RadioObject, Transmitter)
    RadioObject:NewTransmission("UseCaution.ogg", 0.749, "Airbase_ATC/Ground/SoundFiles/", nil, 0.2)
    
    local Subtitle = string.format("%s: Wind %s at %s Cleared for take off, switch departure.", Title, WindDirection, WindSpeed)
    RadioObject:NewTransmission("DeadAir.ogg", 0.100, "Airbase_ATC/Ground/SoundFiles/", nil, nil, Subtitle, 5)
    RadioObject:NewTransmission("Wind.ogg", 0.583, "Airbase_ATC/Ground/SoundFiles/", nil, 0.2)
    AI_ATC:ReadHeading(WindDirection, RadioObject, Transmitter)
    RadioObject:NewTransmission("At.ogg", 0.38, "Airbase_ATC/Ground/SoundFiles/", nil, 0.2)
    AI_ATC:ReadNumber(WindSpeed, RadioObject, Transmitter)
    RadioObject:NewTransmission("ClearedTakeoff2.ogg", 1.950, "Airbase_ATC/Ground/SoundFiles/", nil, 0.2)
  end,{}, Delay )
end
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--*******************************************************************************ATC HELO TAKEOFF********************************************************************************--
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function AI_ATC:HeloTakeoff(Alias)
  local Transmitter = "Tower"
  local Title = string.format("%s %s", AI_ATC.Airbase, Transmitter)
  local RadioObject = TOWER_RADIO
  local ClientData = ATM.ClientData[Alias]
  local Unit = ClientData.Unit
  local Group = Unit:GetGroup()
  local Callsign = ClientData.Callsign
  local FlightCallsign = ClientData.FlightCallsign
  local Flight = ClientData.Flight
  local CallsignSub = Flight and FlightCallsign or Callsign
  local Delay = 1.5 + math.random() * (2.5 - 1.5)
  
  if AI_ATC:FunctionDelay(Alias, function() AI_ATC:HeloTakeoff(Alias) end, Transmitter)==false then
    return
  end
  
  local TurnTable = {
    ["Left"] = {filename = "TurnLeft.ogg", duration = 0.967},
    ["Right"] = {filename = "TurnRight.ogg", duration = 0.967},
  }
  
  local DepartureTable = {
    ["GASS_PEAK"] = {filename = "GassPeak.ogg", duration = 1.242, direction = "Left", heading = "349"},
    ["Dry Lake"] = {filename = "DryLake.ogg", duration = 1.324, direction = "Left", heading = "010"},
    ["Red Horse"] = {filename = "RedHorse.ogg", duration = 1.358, direction = "Left", heading = "349"},
    ["Sunrise"] = {filename = "Sunrise.ogg", duration = 1.335, direction = "Right", heading = "150"},
    ["SAR IFR"] = {filename = "SAR_IFR.ogg", duration = 1.277, direction = "Left", heading = "349"},
  }
  
  USERSOUND:New("RADIO_TRANS_START.ogg"):ToUnit(Unit)
  local Coord, Height, WindDirection, WindSpeed, Departure, DepartureData, TurnDirection, TurnData, Heading
  
  SCHEDULER:New(nil, function()
    Departure = ClientData.VFR
    DepartureData = DepartureTable[Departure]
    TurnDirection = DepartureData.direction
    TurnData = TurnTable[TurnDirection]
    Heading = DepartureData.heading
    Coord = AI_ATC_Vec3
    Height = Coord:GetLandHeight()
    WindDirection, WindSpeed = Coord:GetWind(Height + 10)
    WindDirection = AI_ATC:RectifyHeading(tostring(math.floor(WindDirection + 0.5)))
    WindSpeed = tostring(math.floor(UTILS.MpsToKnots(WindSpeed) - 0.5))
    AI_ATC:ResetMenus(Alias)
    AI_ATC:DepartureSubMenu(Alias)
    AI_ATC:RepeatLastTransmission(Alias, function()AI_ATC:HeloTakeoff(Alias) end)
  end,{}, 0.5 )
  
  SCHEDULER:New(nil, function()
    AI_ATC:ChannelOpen(6, Transmitter, Alias)
    local Subtitle1 = string.format("%s: %s, Turn %s heading %s for %s departure. ", Title, CallsignSub, TurnDirection, Heading, Departure)
    local Subtitle = Subtitle1..string.format("Wind %s at %s. Cleared for takeoff, switch to departure.", WindDirection, WindSpeed)
    RadioObject:NewTransmission("DeadAir.ogg", 0.100, "Airbase_ATC/Ground/SoundFiles/", nil, 0.3, Subtitle, 8)
    AI_ATC:Callsign(Callsign, RadioObject, Transmitter, Flight)
    RadioObject:NewTransmission(TurnData.filename, TurnData.duration, "Airbase_ATC/Ground/SoundFiles/", nil, 0.1)
    AI_ATC:ReadHeading(Heading, RadioObject, Transmitter)
    RadioObject:NewTransmission(DepartureData.filename, DepartureData.duration, "Airbase_ATC/Ground/SoundFiles/", nil, 0.02)
    RadioObject:NewTransmission("Wind.ogg", 0.583, "Airbase_ATC/Ground/SoundFiles/", nil, 0.2)
    AI_ATC:ReadHeading(WindDirection, RadioObject, Transmitter)
    RadioObject:NewTransmission("At.ogg", 0.38, "Airbase_ATC/Ground/SoundFiles/", nil, 0.2)
    AI_ATC:ReadNumber(WindSpeed, RadioObject, Transmitter)
    RadioObject:NewTransmission("ClearedTakeoff2.ogg", 1.950, "Airbase_ATC/Ground/SoundFiles/", nil, 0.2)
  end,{}, Delay )
end
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--*******************************************************************************ATC TAKEOFF*************************************************************************************--
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function AI_ATC:TakeoffClearance(Alias, Climb, Audio)
  local Transmitter = "Tower"
  if AI_ATC:FunctionDelay(Alias, function() AI_ATC:TakeoffClearance(Alias, Climb, Audio) end, Transmitter)==false then
    return
  end
  
  local Title = string.format("%s %s", AI_ATC.Airbase, Transmitter)
  local RadioObject = TOWER_RADIO
  local ClientData = ATM.ClientData[Alias]
  local Unit = ClientData.Unit
  local Type = ClientData.Type
  local Group = Unit:GetGroup()
  local Count = 0
  local Callsign = ClientData.Callsign
  local FlightCallsign =ClientData.FlightCallsign
  local ClientCount = Group:CountAliveUnits()
  local Flight = ClientData.Flight
  local CallsignSub = Flight and FlightCallsign or Callsign
  local Delay = 1.5 + math.random() * (2.5 - 1.5)
  local SchedulerObject, SchedulerObject2
  USERSOUND:New("RADIO_TRANS_START.ogg"):ToUnit(Unit)
  local Runway, Coord, Height, WindDirection, WindSpeed, Instruction, Subtitle
  
  SCHEDULER:New(nil, function()
    Runway = AI_ATC.Runways.Takeoff[1]
    Coord = AI_ATC_Vec3
    Height = Coord:GetLandHeight()
    WindDirection, WindSpeed = Coord:GetWind(Height + 10)
    WindDirection = AI_ATC:RectifyHeading(tostring(math.floor(WindDirection + 0.5)))
    WindSpeed = tostring(math.floor(UTILS.MpsToKnots(WindSpeed) - 0.5))
    AI_ATC:RepeatLastTransmission(Alias, function()AI_ATC:TakeoffClearance(Alias, Climb, true) end)
    
    if Audio~=true then
      AI_ATC:ChannelOpen(12, Transmitter, Alias)
      if Jester then Jester:Silence() end
      if ATM.ClientData[Alias].Mark then
        local RM = COORDINATE:RemoveMark(ATM.ClientData[Alias].Mark)
      end
    end
    
    if Climb then
      Instruction  = string.format(" Quick climb to %s approved.", Climb)
    else
      Instruction = ""
    end
  end,{}, 0.5)
  
  local function Takeoff()
    SCHEDULER:New(nil, function()
      Subtitle = string.format("%s: %s,%s Runway %s, Wind %s at %s. Cleared for takeoff, switch to departure.", Title, CallsignSub, Instruction, Runway, WindDirection, WindSpeed)
      RadioObject:NewTransmission("DeadAir.ogg", 0.100, "Airbase_ATC/Ground/SoundFiles/", nil, 0.3, Subtitle, 7)
      AI_ATC:Callsign(Callsign, RadioObject, Transmitter, Flight)
      if Climb then
        RadioObject:NewTransmission("Quickclimb.ogg", 0.668, "Airbase_ATC/Ground/SoundFiles/", nil, 0.1)
        AI_ATC:ReadNumber(Climb, RadioObject, Transmitter)
        RadioObject:NewTransmission("Approved.ogg", 0.558, "Airbase_ATC/Ground/SoundFiles/", nil, 0.02)
      end
      RadioObject:NewTransmission("Runway.ogg", 0.473, "Airbase_ATC/Ground/SoundFiles/", nil, 0.1)
      AI_ATC:Runway(Runway, RadioObject, Transmitter)
      RadioObject:NewTransmission("Wind.ogg", 0.583, "Airbase_ATC/Ground/SoundFiles/", nil, 0.2)
      AI_ATC:ReadHeading(WindDirection, RadioObject, Transmitter)
      RadioObject:NewTransmission("At.ogg", 0.38, "Airbase_ATC/Ground/SoundFiles/", nil, 0.2)
      AI_ATC:ReadNumber(WindSpeed, RadioObject, Transmitter)
      RadioObject:NewTransmission("ClearedTakeoff2.ogg", 1.950, "Airbase_ATC/Ground/SoundFiles/", nil, 0.2)
    end,{}, Delay)
    
    if Audio~=true then
      AI_ATC.Runways.TakeoffHold = true
      if ATM.GroundControl[Alias] then
        ATM.GroundControl[Alias].TaxiAuthority = false
        ATM.GroundControl[Alias].StartedTaxi = false
        ATM.GroundControl[Alias].TaxiRequested = false
        ClientData.TakeoffClearance = true
      end
      
      if not ATM.TowerControl[Alias] then
        ATM.TowerControl[Alias] = {RequestedApproach = "Straight in", State = "On Departure", Type = Type, Contacts = {}, Schedules = {}, Count = ClientCount }
      else
        ATM.TowerControl[Alias].RequestedApproach = "Straight in"
        ATM.TowerControl[Alias].State = "On Departure"
      end
        
      SchedulerObject = SCHEDULER:New(nil, function()
        Count = Count + 1
        if Group:IsAlive() and Group:IsAirborne() then
          ATM.ClientData[Alias].State = "Airborne"
          AI_ATC.Runways.TakeoffHold = false
          SchedulerObject:Stop()
        elseif not ATM.GroundControl[Alias] or not Group:IsAlive() then
          AI_ATC.Runways.TakeoffHold = false
          SchedulerObject:Stop()
        elseif Count==120 then
          AI_ATC.Runways.TakeoffHold = false
          SchedulerObject:Stop()
        end
      end,{}, 1, 1 )
  
      if AI_Wingman_1 ~= nil then
        local Delay = 12
        for index, name in ipairs(self.RunwayGuard) do
          local Unit = UNIT:FindByName(name)
          if Unit then Unit:Destroy() end
          if AI_Instructor then
            if AI_Instructor.Active == true and AI_Instructor.TakingActive == false then
              AI_Instructor.TakingActive = true
            end
          end
        end
      end

      AI_ATC:ResetMenus(Alias)
      AI_ATC:LandingSubMenu(Alias)
      AI_ATC:DepartureSubMenu(Alias)
    end
  end

  local function Lineup()
    SCHEDULER:New(nil, function()
      local Subtitle = string.format("%s: %s, Line up and wait.", Title, CallsignSub)
      RadioObject:NewTransmission("DeadAir.ogg", 0.100, "Airbase_ATC/Ground/SoundFiles/", nil, 0.3, Subtitle, 7)
      AI_ATC:Callsign(Callsign, RadioObject, Transmitter, Flight)
      RadioObject:NewTransmission("LineUp.ogg", 0.917, "Airbase_ATC/Ground/SoundFiles/", nil, 0.1)
    end,{}, Delay)
    
    if Audio~=true then
      SchedulerObject2 = SCHEDULER:New(nil, function()
        if not ATM.GroundControl[Alias] then
          SchedulerObject2:Stop()
        elseif AI_ATC.Runways.TakeoffHold == false then
          AI_ATC:ChannelOpen(12, Transmitter, Alias)
          Takeoff()
          SchedulerObject2:Stop()
        end
      end,{}, 1, 1 )
    end
  end

  if AI_ATC.Runways.TakeoffHold == false then
    AI_ATC:ChannelOpen(12, Transmitter, Alias)
    Takeoff()
  else
    AI_ATC:ChannelOpen(6, Transmitter, Alias)
    Lineup()
  end
end
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--***********************************************************************************ATC DEPARTURE_IDENT***********************************************************************--
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function AI_ATC:DepartureIdent(Alias, Audio)
  local Transmitter = "Departure"
  local AirbaseName = AI_ATC.Airbase
  local Title = string.format("%s %s", AirbaseName, Transmitter)
  local RadioObject = AI_ATC:FindTransmitter(Alias, Transmitter)
  local ClientData = ATM.ClientData[Alias]
  local Unit = ClientData.Unit
  local Callsign = ClientData.Callsign
  local FlightCallsign = ClientData.FlightCallsign
  local Flight = ClientData.Flight
  local CallsignSub = Flight and FlightCallsign or Callsign
  local Delay = 1.5 + math.random() * (2.5 - 1.5)
  
  if AI_ATC:FunctionDelay(Alias, function() AI_ATC:DepartureIdent(Alias, Audio) end, Transmitter)==false then
    return
  end
  
  USERSOUND:New("RADIO_TRANS_START.ogg"):ToUnit(Unit)
  AI_ATC:RepeatLastTransmission(Alias, function()AI_ATC:DepartureIdent(Alias, true) end)
  if Audio~=true then
    AI_ATC:ResetMenus(Alias)
    AI_ATC:IdentSubMenu(Alias)
  end
  
  SCHEDULER:New(nil, function()
    AI_ATC:ChannelOpen(7, Transmitter, Alias)
    local Subtitle = string.format("%s: %s, %s Departure, Ident. ", Title, CallsignSub, AirbaseName)
    RadioObject:NewTransmission("DeadAir.ogg", 0.100, "Airbase_ATC/Departure/SoundFiles/", nil, nil, Subtitle, 7)
    AI_ATC:Callsign(Callsign, RadioObject, Transmitter, Flight)
    AI_ATC:AirbaseName(AirbaseName, RadioObject, Transmitter)
    RadioObject:NewTransmission("Departure.ogg", 0.743, "Airbase_ATC/Departure/SoundFiles/", nil, nil)
    RadioObject:NewTransmission("Ident.ogg", 0.586, "Airbase_ATC/Departure/SoundFiles/", nil, 0.3)
  end,{}, Delay)
  
end
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--***********************************************************************************ATC DEPARTURE_CHECKIN***********************************************************************--
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function AI_ATC:DepartureCheckin(Alias)
  AI_ATC:ResetMenus(Alias)
  if ATM.ClientData[Alias].RequestedProcedure=="IFR" then
    AI_ATC:IFRDeparture(Alias)
  else
    AI_ATC:VFRDeparture(Alias)
  end
end
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--***********************************************************************************ATC DEPARTURE_CHECKIN***********************************************************************--
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function AI_ATC:VFRDeparture(Alias, Audio)
  local Transmitter = "Departure"
  local Title = string.format("%s %s", AI_ATC.Airbase, Transmitter)
  local RadioObject = AI_ATC:FindTransmitter(Alias, Transmitter)
  local ClientData = ATM.ClientData[Alias]
  local Unit = ClientData.Unit
  local Helo = ClientData.Helo
  local Group = Unit:GetGroup()
  local SchedulerObjects = ClientData.SchedulerObjects
  local Callsign = ClientData.Callsign
  local FlightCallsign = ClientData.FlightCallsign
  local Flight = ClientData.Flight
  local CallsignSub = Flight and FlightCallsign or Callsign
  local Delay = 1.5 + math.random() * (2.5 - 1.5)
  
  if AI_ATC:FunctionDelay(Alias, function() AI_ATC:VFRDeparture(Alias, Audio) end, Transmitter)==false then
    return
  end
  
  USERSOUND:New("RADIO_TRANS_START.ogg"):ToUnit(Unit)
  AI_ATC:RepeatLastTransmission(Alias, function()AI_ATC:VFRDeparture(Alias, true) end)
  if Audio~=true then
    AI_ATC:NavigationSubMenu(Alias)
  end

  local AirbaseName, AirbaseCoord, AirbaseVec2, DANTCN, VFRAltitude, AltSub, TerminalRange
  local DepartureZone, DepartureRadar, ClassBVec2, ClassBZone, SchedulerObject, TurnPermit
  
  local function CheckFlightGroups()
    for groupName, groupTable in pairs(AI_ATC.FlightGroup) do
      for ClientName, _ in pairs(groupTable) do
        DepartureRadar:RemoveGroupsByName(ClientName)
      end
    end
  end

  SCHEDULER:New(nil, function()
    if Helo then
      TerminalRange = 9260
    else
      TerminalRange = 27780
    end
    AirbaseName = AI_ATC.Airbase
    AirbaseCoord = AI_ATC_Vec3
    AirbaseVec2 = AirbaseCoord:GetVec2()
    VFRAltitude = "4"
    AltSub = AI_ATC:ReadFlightLevel(VFRAltitude, RadioObject, Transmitter, false)
    DANTCN = AI_ATC_Navpoints.DANTCN:GetCoordinate()
  end,{}, 0.5 )
  
  SCHEDULER:New(nil, function()
    DepartureZone = ZONE_RADIUS:New("Departure", AirbaseVec2, 20372, nil)
    DepartureRadar = SET_GROUP:New():FilterZones({DepartureZone}):FilterActive():FilterCoalitions(AI_ATC.Coalition):FilterCategories("plane"):FilterOnce()
    DepartureRadar:RemoveGroupsByName(Alias)
    DepartureRadar:RemoveGroupsByName(AI_Wingman_1)
    DepartureRadar:RemoveGroupsByName(AI_Wingman_2)
    DepartureRadar:RemoveGroupsByName(AI_Wingman_3)
    DepartureRadar:RemoveGroupsByName(AI_Wingman_4)
    CheckFlightGroups()
    DepartureRadar:ForEachGroup(function(GroupObject)
      if not GroupObject:IsAirborne() then
        local GroupName = GroupObject:GetName()
        DepartureRadar:Remove(GroupName)
      end
    end)
   end,{}, 1 )
  
  local function TrafficReport()
    local PlayerCoord = Unit:GetCoord()
    local PlayerHeading = Unit:GetHeading()
    local Traffic = DepartureRadar:GetClosestGroup(PlayerCoord)
    local TrafficCoord = Traffic:GetCoord()
    local TrafficHeading = AI_ATC:CorrectHeading(Traffic:GetHeading())
    local TrafficCardinal = UTILS.BearingToCardinal(tonumber(TrafficHeading))
    local Range = tostring(math.floor(TrafficCoord:Get2DDistance(PlayerCoord) / 1852 - 0.5))
    local Heading = UTILS.HdgDiff(PlayerHeading, PlayerCoord:HeadingTo(TrafficCoord))
    local Bearing = tostring(AI_ATC:HeadingToClockBearing(Heading))
    local TrafficAltitude = string.sub(tostring(math.floor(Traffic:GetAltitude() / 3.281 + 0.5)), 1, 1)
    local TrafficAltitudeSub = AI_ATC:ReadFlightLevel(TrafficAltitude, RadioObject, Transmitter, false)
    AI_ATC:ChannelOpen(7, Transmitter, Alias)
    
    local Subtitle = string.format("%s: %s bound traffic at your %s O'clock, %s miles at %s", Title, TrafficCardinal, Bearing, Range, TrafficAltitudeSub)
    RadioObject:NewTransmission("DeadAir.ogg", 0.100, "Airbase_ATC/Departure/SoundFiles/", nil, 0.3, Subtitle, 5)
    AI_ATC:ReadCardinal(TrafficCardinal, RadioObject, Transmitter)
    RadioObject:NewTransmission("Traffic.ogg", 0.511, "Airbase_ATC/Departure/SoundFiles/", nil, nil)
    AI_ATC:ClockBearing(Bearing, RadioObject, Transmitter)
    AI_ATC:ReadDigits(Range, RadioObject, Transmitter)
    RadioObject:NewTransmission("Miles.ogg", 0.641, "Airbase_ATC/Departure/SoundFiles/", nil, 0.05)
    AI_ATC:ReadFlightLevel(TrafficAltitude, RadioObject, Transmitter, true)
  end
  
  SCHEDULER:New(nil, function()
    AI_ATC:ChannelOpen(12, Transmitter, Alias)
    local PlayerCoord = Unit:GetCoord()
    local Traffic = DepartureRadar:GetClosestGroup(PlayerCoord)
    local Subtitle = string.format("%s: %s, %s Departure, Radar contact. ", Title, CallsignSub, AirbaseName)
    RadioObject:NewTransmission("DeadAir.ogg", 0.100, "Airbase_ATC/Departure/SoundFiles/", nil, nil, Subtitle, 7)
    AI_ATC:Callsign(Callsign, RadioObject, Transmitter, Flight)
    AI_ATC:AirbaseName(AirbaseName, RadioObject, Transmitter)
    RadioObject:NewTransmission("Departure.ogg", 0.743, "Airbase_ATC/Departure/SoundFiles/", nil, nil)
    RadioObject:NewTransmission("RadarContact.ogg", 0.848, "Airbase_ATC/Departure/SoundFiles/", nil, 0.11)
    
    if Traffic and Traffic:IsInZone(DepartureZone) and Traffic:IsAirborne() then
      TrafficReport()
    end
    if Helo==true then
      local Subtitle = string.format("%s: Remain at or Below 500 until clear of Class D airspace.", Title, AltSub)
      RadioObject:NewTransmission("DeadAir.ogg", 0.100, "Airbase_ATC/Departure/SoundFiles/", nil, nil, Subtitle, 4)
      RadioObject:NewTransmission("Bellow500.ogg", 3.715, "Airbase_ATC/Departure/SoundFiles/", nil, nil)
    else
      local Subtitle = string.format("%s: Maintain VFR at or below %s. ", Title, AltSub)
      RadioObject:NewTransmission("DeadAir.ogg", 0.100, "Airbase_ATC/Departure/SoundFiles/", nil, nil, Subtitle, 4)
      RadioObject:NewTransmission("MaintainVFR.ogg", 1.962, "Airbase_ATC/Departure/SoundFiles/", nil, 0.11)
      AI_ATC:ReadFlightLevel(VFRAltitude, RadioObject, Transmitter, true)
    end
  end,{}, Delay)

  local function ServiceTerminate() 
    SchedulerObject = SCHEDULER:New(nil, function()
      if Unit and Unit:IsAlive() and ATM.ClientData[Alias] then
        local UnitCoord = Unit:GetCoord()
        local Failsafe = UnitCoord:Get2DDistance(DANTCN)
        if Failsafe >= TerminalRange then
          AI_ATC:RadarTerminate(Alias)
          SchedulerObject:Stop()
        end
      else
        SchedulerObject:Stop()
      end
    end,{}, 10, 10, nil)
    table.insert(SchedulerObjects, SchedulerObject)
  end

  ServiceTerminate()


end
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--***********************************************************************************ATC TRAFFIC REPORT**************************************************************************--
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function AI_ATC:TrafficReport(Alias, RadioObject, Transmitter)
  local RadioKey = AI_ATC.Radio[Transmitter].Key
  local Title = string.format("%s %s", AI_ATC.Airbase, Transmitter)
  local ClientData = ATM.ClientData[Alias]
  local Callsign = ClientData.Callsign
  local Unit = ClientData.Unit
  local Group = Unit:GetGroup()
  
  if AI_ATC:FunctionDelay(Alias, function() AI_ATC:TrafficReport(Alias, RadioObject, Transmitter) end, Transmitter)==false then
    return
  end
 
  local UnitCoord, UnitHeading, UnitZone, UnitVec2, Radar, Traffic
  local TrafficCoord, TrafficHeading, TrafficCardinal, Range, Heading, Bearing, TrafficAltitude, TrafficAltitudeSub
  
  local function AngularDifference(heading1, heading2)
    local diff = math.abs(heading1 - heading2)
    if diff > 180 then diff = 360 - diff end
    return diff
  end
  
  local function CheckFlightGroups()
    for groupName, groupTable in pairs(AI_ATC.FlightGroup) do
      for ClientName, _ in pairs(groupTable) do
        Radar:RemoveGroupsByName(ClientName)
      end
    end
  end
  
  UnitCoord = Unit:GetCoordinate()
  UnitHeading = Unit:GetHeading()
  UnitZone = ZONE_UNIT:New("ClientZone", Unit, 18520, nil)
  Radar = SET_GROUP:New():FilterZones({UnitZone}):FilterActive():FilterCoalitions(AI_ATC.Coalition):FilterCategories({"plane", "helicopter"}):FilterOnce()
  Radar:RemoveGroupsByName(Alias)
  Radar:RemoveGroupsByName(AI_Wingman_1)
  Radar:RemoveGroupsByName(AI_Wingman_2)
  Radar:RemoveGroupsByName(AI_Wingman_3)
  Radar:RemoveGroupsByName(AI_Wingman_4)
  CheckFlightGroups()
  Radar:ForEachGroup(function(GroupObject)
    if not GroupObject:IsAirborne() then
      local GroupName = GroupObject:GetName()
      Radar:Remove(GroupName)
    else
      local TrafficCoord = GroupObject:GetCoordinate()
      local Bearing = UnitCoord:HeadingTo(TrafficCoord)
      if AngularDifference(UnitHeading, Bearing) >= 50 then 
        local GroupName = GroupObject:GetName()
        Radar:Remove(GroupName)
      end
    end
  end)
  
  local function ReportTraffic(Traffic)
    TrafficCoord = Traffic:GetCoordinate()
    TrafficHeading = AI_ATC:CorrectHeading(Traffic:GetHeading())
    TrafficCardinal = UTILS.BearingToCardinal(tonumber(TrafficHeading))
    Range = tostring(math.floor(TrafficCoord:Get2DDistance(UnitCoord) / 1852 - 0.5))
    Heading = UTILS.HdgDiff(UnitHeading, UnitCoord:HeadingTo(TrafficCoord))
    Bearing = tostring(AI_ATC:HeadingToClockBearing(Heading))
    TrafficAltitude = string.sub(tostring(math.floor(Traffic:GetAltitude() / 3.281 + 0.5)), 1, 1)
    TrafficAltitudeSub = AI_ATC:ReadFlightLevel(TrafficAltitude, RadioObject, Transmitter, false)
    
    local Subtitle = string.format("%s: %s bound traffic, %s O'clock, %s miles at %s", Title, TrafficCardinal, Bearing, Range, TrafficAltitudeSub)
    RadioObject:NewTransmission("DeadAir.ogg", 0.100, "Airbase_ATC/Departure/SoundFiles/", nil, nil, Subtitle, 5)
    AI_ATC:ReadCardinal(TrafficCardinal, RadioObject, Transmitter)
    RadioObject:NewTransmission("Traffic.ogg", 0.511, "Airbase_ATC/Departure/SoundFiles/", nil, nil)
    AI_ATC:ClockBearing(Bearing, RadioObject, Transmitter)
    AI_ATC:ReadDigits(Range, RadioObject, Transmitter)
    RadioObject:NewTransmission("Miles.ogg", 0.641, "Airbase_ATC/Departure/SoundFiles/", nil, 0.05)
    AI_ATC:ReadFlightLevel(TrafficAltitude, RadioObject, Transmitter, true)
  end
  
  Traffic = Radar:GetClosestGroup(UnitCoord)
  if Traffic then ReportTraffic(Traffic) end

end
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--**********************************************************************************ATC SERVICE TERMINATED***********************************************************************--
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function AI_ATC:RadarTerminate(Alias, Audio)
  local Transmitter = "Departure"
  local Title = string.format("%s %s", AI_ATC.Airbase, Transmitter)
  local RadioObject = AI_ATC:FindTransmitter(Alias, Transmitter)
  local ClientData = ATM.ClientData[Alias]
  local Unit = ClientData.Unit
  local Group = Unit:GetGroup()
  local Callsign = ClientData.Callsign
  local FlightCallsign = ClientData.FlightCallsign
  local Flight = ClientData.Flight
  local CallsignSub = Flight and FlightCallsign or Callsign
  local Delay = 1.5 + math.random() * (2.5 - 1.5)
  
  if AI_ATC:FunctionDelay(Alias, function() AI_ATC:RadarTerminate(Alias, Audio) end, Transmitter)==false then
    return
  end
  
  USERSOUND:New("RADIO_TRANS_START.ogg"):ToUnit(Unit)
  AI_ATC:RepeatLastTransmission(Alias, function()AI_ATC:RadarTerminate(Alias, true) end)
  
  if Audio~=true then
    AI_ATC:TerminateSchedules(Alias)
    AI_ATC:ResetMenus(Alias)
    AI_ATC:ApproachSubMenu(Alias)
    --AI_ATC:RangeControlSubMenu(Alias)
  end
  
  if ATM.TowerControl[Alias] and ATM.TowerControl[Alias].Schedules then
    for _, sched in ipairs(ATM.TowerControl[Alias].Schedules) do
      sched:Stop()
    end
    ATM.TowerControl[Alias] = nil
  end

  SCHEDULER:New(nil, function()
    AI_ATC:ChannelOpen(8, Transmitter, Alias)
    local Subtitle = string.format("%s: %s, Radar service terminated, resume own navigation. Frequency change approved.", Title, CallsignSub)
    RadioObject:NewTransmission("DeadAir.ogg", 0.100, "Airbase_ATC/Departure/SoundFiles/", nil, 0.3, Subtitle, 5)
    AI_ATC:Callsign(Callsign, RadioObject, Transmitter, Flight)
    RadioObject:NewTransmission("ResumeNav.ogg", 2.769, "Airbase_ATC/Departure/SoundFiles/", nil, 0.05)
    RadioObject:NewTransmission("FrequencyChange.ogg", 1.521, "Airbase_ATC/Departure/SoundFiles/", nil, 0.1)
    if Jester then Jester:Speak() end
  end,{}, Delay )

end
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--***********************************************************************************ATC DREAM 7 DEPARTURE***********************************************************************--
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function AI_ATC:IFRDeparture(Alias, Audio)
  local Transmitter = "Departure"
  local Title = string.format("%s %s", AI_ATC.Airbase, Transmitter)
  local RadioObject = AI_ATC:FindTransmitter(Alias, Transmitter)
  local ClientData = ATM.ClientData[Alias]
  local Unit = ClientData.Unit
  local Group = Unit:GetGroup()
  local SchedulerObjects = ClientData.SchedulerObjects
  local Callsign = ClientData.Callsign
  local FlightCallsign = ClientData.FlightCallsign
  local Flight = ClientData.Flight
  local SID = ClientData.SID
  local CallsignSub = Flight and FlightCallsign or Callsign
  local Delay = 1.5 + math.random() * (2.5 - 1.5)
  
  if AI_ATC:FunctionDelay(Alias, function() AI_ATC:IFRDeparture(Alias, Audio) end, Transmitter)==false then
    return
  end
  
  USERSOUND:New("RADIO_TRANS_START.ogg"):ToUnit(Unit)
  AI_ATC:RepeatLastTransmission(Alias, function()AI_ATC:IFRDeparture(Alias, true) end)
  
  if Audio~=true then
    AI_ATC:ResetMenus(Alias)
    AI_ATC:NavigationSubMenu(Alias)
  end

  local AirbaseName, DANTCN, Runway, SchedulerObject, Destination, Filename, Duration, Instruction, InstructionSub, Altitude, SIDfile, Point, SubDuration
  
  local SidTbl = {
    ["Alfa 05"] = { file = "Alfa05.ogg", duration = 1.637},
    ["Charlie 05"] = {file = "Charlie05.ogg", duration = 1.614},
    ["Delta 05"] = {file = "Delta05.ogg", duration = 1.649},
    ["Echo 05"] = {file = "Echo05.ogg", duration = 1.579},
    ["Alfa 23"] = {file = "Alfa23.ogg", duration = 1.463},
    ["Charlie 23"] = {file = "Charlie23.ogg", duration = 1.521},
    ["Delta 23"] = {file = "Delta23.ogg", duration = 1.521},
    ["Echo 23"] = {file = "Echo23.ogg", duration = 1.440},
  }
  
  local InstructionTbl = {
    ["Alfa 05"] = {file = "DMEarc.ogg", duration = 3.214, sub = "Fly the 5 DME Arc before proceeding on outbound radial."},
    ["Charlie 05"] = {file = "RunwayHeading.ogg", duration = 3.214, Sub = "Fly runway heading."},
    ["Delta 05"] = {file = "DMEarc.ogg", duration = 3.214, sub = "Fly the 5 DME Arc before proceeding on outbound radial."},
    ["Echo 05"] = {file = "DMEarc.ogg", duration = 3.214, sub = "Fly the 5 DME Arc before proceeding on outbound radial."},
    ["Alfa 23"] = {file = "DMEarc.ogg", duration = 3.214, sub = "Fly the 5 DME Arc before proceeding on outbound radial."},
    ["Charlie 23"] = {file = "DMEarc.ogg", duration = 3.214, sub = "Fly the 5 DME Arc before proceeding on outbound radial."},
    ["Delta 23"] = {file = "DMEarc.ogg", duration = 3.214, sub = "Fly the 5 DME Arc before proceeding on outbound radial."},
    ["Echo 23"] = {file = "RunwayHeading.ogg", duration = 3.214, sub = "Fly runway heading."},
  }

  
  SCHEDULER:New(nil, function()
    AirbaseName = AI_ATC.Airbase
    DANTCN = AI_ATC_Navpoints.DANTCN:GetCoordinate()
    Runway = AI_ATC.Runways.Takeoff[1]
    Altitude = "12.5"
    SIDfile = SidTbl[SID]
    Instruction = InstructionTbl[SID]
    Point = SID:sub(1, -4)
    SubDuration = SIDfile.duration + Instruction.duration + 3
  end,{}, 0.5 )
  
  SCHEDULER:New(nil, function()
    AI_ATC:ChannelOpen(14, Transmitter, Alias)
    local Subtitle = string.format("%s: %s, %s Departure, Radar contact.", Title, CallsignSub, AirbaseName)
    RadioObject:NewTransmission("DeadAir.ogg", 0.100, "Airbase_ATC/Departure/SoundFiles/", nil, nil, Subtitle, 5)
    AI_ATC:Callsign(Callsign, RadioObject, Transmitter, Flight)
    AI_ATC:AirbaseName(AirbaseName, RadioObject, Transmitter)
    RadioObject:NewTransmission("Departure.ogg", 0.743, "Airbase_ATC/Departure/SoundFiles/", nil, nil)
    RadioObject:NewTransmission("RadarContact.ogg", 0.848, "Airbase_ATC/Departure/SoundFiles/", nil, 0.11)
    AI_ATC:TrafficReport(Alias, RadioObject, Transmitter)
    
    local Subtitle = string.format("%s: %s departure. %s Climb and maintain FL125. Report Point %s.", Title, SID, Instruction.sub, Point)
    RadioObject:NewTransmission("DeadAir.ogg", 0.100, "Airbase_ATC/Departure/SoundFiles/", nil, nil, Subtitle, SubDuration)
    RadioObject:NewTransmission(SIDfile.file, SIDfile.duration, "Airbase_ATC/Departure/SoundFiles/", nil, nil)
    RadioObject:NewTransmission(Instruction.file, Instruction.duration, "Airbase_ATC/Departure/SoundFiles/", nil, nil)
    if tonumber(Altitude) < 10 then
      RadioObject:NewTransmission("ClimbMaintain.ogg", 0.987, "Airbase_ATC/Departure/SoundFiles/", nil, 0.1)
    elseif tonumber(Altitude) >= 10 then
      RadioObject:NewTransmission("ClimbMaintainFL.ogg", 1.593, "Airbase_ATC/Departure/SoundFiles/", nil, 0.1)
    end
    AI_ATC:ReadFlightLevel(Altitude, RadioObject, Transmitter, true)
    
    RadioObject:NewTransmission("Report.ogg", 0.386, "Airbase_ATC/Departure/SoundFiles/", nil, 0.05)
    AI_ATC:ReadNavpoint(Point, RadioObject, Transmitter)
  end,{}, Delay )

  
  local function ServiceTerminate()
    SchedulerObject = SCHEDULER:New(nil, function()
      if Unit and Unit:IsAlive() and ATM.ClientData[Alias] then
        local UnitCoord = Unit:GetCoord()
        local Failsafe = UnitCoord:Get2DDistance(DANTCN)
        if Failsafe >= 33336 then
          AI_ATC:RadarTerminate(Alias)
          SchedulerObject:Stop()
        end
      else
        SchedulerObject:Stop()
      end
    end,{}, 10, 5, nil, 7200 )
    table.insert(SchedulerObjects, SchedulerObject)
  end

  ServiceTerminate()

end
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--*******************************************************************************ATC APPROACH_CHECKIN_EXE************************************************************************--
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function AI_ATC:ApproachCheckIn(Alias, Type)
  local ClientData = ATM.ClientData[Alias]
  if Type == "VFR" then
    ClientData.Approach.Type="VFR"
    AI_ATC:VFRApproach(Alias)
  elseif Type=="IFR" then
    ClientData.Approach.Type="IFR"
    AI_ATC:IFRApproach(Alias)
  elseif ClientData.Approach.Type=="Generic" then
    --AI_ATC:GenericApproach(Alias)
  end
end
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--*************************************************************************ATC APPROACH CHECKIN**********************************************************************************--
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function AI_ATC:VFRApproach(Alias)
  local Transmitter = "Approach"
  local Title = string.format("%s %s", AI_ATC.Airbase, Transmitter)
  local ClientData = ATM.ClientData[Alias]
  local Unit = ClientData.Unit
  local Group = Unit:GetGroup()
  local Callsign = ClientData.Callsign
  local FlightCallsign = ClientData.FlightCallsign
  local Flight = ClientData.Flight
  local CallsignSub = Flight and FlightCallsign or Callsign
  local Airbase = AI_ATC.Airbase
  local Runway = AI_ATC.Runways.Landing[1]
  local RadioObject = AI_ATC:FindTransmitter(Alias, Transmitter)
  local Delay = 1.5 + math.random() * (2.5 - 1.5)
  
  if AI_ATC:FunctionDelay(Alias, function() AI_ATC:VFRApproach(Alias) end, Transmitter)==false then
    return
  end
  AI_ATC:ResetMenus(Alias)
  AI_ATC:ApproachAssistMenu(Alias, false)
  USERSOUND:New("RADIO_TRANS_START.ogg"):ToUnit(Unit)
  
  local function Message()
    SCHEDULER:New(nil, function()
      AI_ATC:RepeatLastTransmission(Alias, function()Message() end)
      AI_ATC:ChannelOpen(9, Transmitter, Alias)
      local Subtitle = string.format("%s: %s, %s Approach. Radar contact. Expect visual approach for runway %s", Title, CallsignSub, Airbase, Runway )
      RadioObject:NewTransmission("DeadAir.ogg", 0.100, "Airbase_ATC/Ground/SoundFiles/", nil, 0.3, Subtitle, 4)
      AI_ATC:Callsign(Callsign, RadioObject, Transmitter, Flight)
      AI_ATC:AirbaseName(Airbase, RadioObject, Transmitter)
      RadioObject:NewTransmission("Approach.ogg", 0.569, "Airbase_ATC/Departure/SoundFiles/", nil, 0.01)
      RadioObject:NewTransmission("RadarContact.ogg", 0.848, "Airbase_ATC/Departure/SoundFiles/", nil, 0.11)
      RadioObject:NewTransmission("VisualApproach.ogg", 1.800, "Airbase_ATC/Departure/SoundFiles/", nil, 0.1)
      AI_ATC:Runway(Runway, RadioObject, Transmitter)
    end,{}, Delay)
  end
  
  Message()
  
  SCHEDULER:New(nil, function()
    local RadioObject = AI_ATC:FindTransmitter(Alias, Transmitter)
    AI_ATC:ChannelOpen(9, Transmitter, Alias)
  end,{}, 120 )
  
  SCHEDULER:New(nil, function()
    AI_ATC:Push_Tower(Alias)
  end,{}, 12)
end
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--*************************************************************************ATC IFR APPROACH**************************************************************************************--
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function AI_ATC:IFRApproach(Alias)
  local Transmitter = "Approach"
  local Title = string.format("%s %s", AI_ATC.Airbase, Transmitter)
  local ClientData = ATM.ClientData[Alias]
  local Unit = ClientData.Unit
  local Group = Unit:GetGroup()
  local Callsign = ClientData.Callsign
  local FlightCallsign = ClientData.FlightCallsign
  local Flight = ClientData.Flight
  local CallsignSub = Flight and FlightCallsign or Callsign
  local Airbase = AI_ATC.Airbase
  local RadioObject = AI_ATC:FindTransmitter(Alias, Transmitter)
  local Delay = 1.5 + math.random() * (2.5 - 1.5)
  
  if AI_ATC:FunctionDelay(Alias, function() AI_ATC:IFRApproach(Alias) end, Transmitter)==false then
    return
  end
  
  AI_ATC:TerminateSchedules(Alias)
  AI_ATC:ResetMenus(Alias)
  AI_ATC:ApproachTypeMenu(Alias)
  USERSOUND:New("RADIO_TRANS_START.ogg"):ToUnit(Unit)
  
  local function Message()
    SCHEDULER:New(nil, function()
      AI_ATC:RepeatLastTransmission(Alias, function()Message() end)
      AI_ATC:ChannelOpen(9, Transmitter, Alias)
      local Subtitle = string.format("%s: %s, %s Approach. Radar contact. Say request?", Title, CallsignSub, Airbase)
      RadioObject:NewTransmission("DeadAir.ogg", 0.100, "Airbase_ATC/Ground/SoundFiles/", nil, 0.3, Subtitle, 4)
      AI_ATC:Callsign(Callsign, RadioObject, Transmitter, Flight)
      AI_ATC:AirbaseName(Airbase, RadioObject, Transmitter)
      RadioObject:NewTransmission("Approach.ogg", 0.569, "Airbase_ATC/Departure/SoundFiles/", nil, 0.01)
      RadioObject:NewTransmission("RadarContact.ogg", 0.848, "Airbase_ATC/Departure/SoundFiles/", nil, 0.11)
      RadioObject:NewTransmission("SayRequest.ogg", 0.987, "Airbase_ATC/Departure/SoundFiles/", nil, 0.1)
    end,{}, Delay)
  end
  
  Message()

end
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--***************************************************************************GENERIC APPROACH************************************************************************************--
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function AI_ATC:GenericApproach(Alias)
  local Transmitter = "Approach"
  local Airbase = AI_ATC.Airbase
  local Title = string.format("%s %s", Airbase, Transmitter)
  local RadioObject = AI_ATC:FindTransmitter(Alias, Transmitter)
  local ClientData = ATM.ClientData[Alias]
  local Unit = ClientData.Unit
  local Group = Unit:GetGroup()
  local Callsign = ClientData.Callsign
  local FlightCallsign = ClientData.FlightCallsign
  local Flight = ClientData.Flight
  local CallsignSub = Flight and FlightCallsign or Callsign
  local Delay = 1.5 + math.random() * (2.5 - 1.5)
  
  local Destination, Runway, UnitCoord, Approach
  
  if AI_ATC:FunctionDelay(Alias, function() AI_ATC:GenericApproach(Alias) end, Transmitter)==false then
    return
  end

  USERSOUND:New("RADIO_TRANS_START.ogg"):ToUnit(Unit)
  
  SCHEDULER:New(nil, function()
    AI_ATC:ResetMenus(Alias)
    Runway = AI_ATC.Runways.Landing[1]
    Destination = AI_ATC_Navpoints[Runway]:GetCoordinate()
    if AI_ATC.Procedure=="VFR" then
      Approach = "Visual"
    elseif AI_ATC.Procedure=="IFR" then
      Approach = "Instrument"
    end
  end,{}, 0.5)

  local function Message()
    SCHEDULER:New(nil, function()
      AI_ATC:RepeatLastTransmission(Alias, function()Message() end)
      AI_ATC:ChannelOpen(9, Transmitter, Alias)
      UnitCoord = Unit:GetCoord()
      local TurnHeading = AI_ATC:CorrectHeading(UnitCoord:HeadingTo(Destination)+0.5)
      local Subtitle = string.format("%s: %s, %s approach, fly heading %s, Expect %s approach for runway %s", Title, CallsignSub, Airbase, TurnHeading, Approach, Runway )
      RadioObject:NewTransmission("DeadAir.ogg", 0.100, "Airbase_ATC/Ground/SoundFiles/", nil, 0.3, Subtitle, 7)
      AI_ATC:Callsign(Callsign, RadioObject, Transmitter, Flight)
      AI_ATC:AirbaseName(Airbase, RadioObject, Transmitter)
      RadioObject:NewTransmission("Approach.ogg", 0.569, "Airbase_ATC/Departure/SoundFiles/", nil, 0.01)
      RadioObject:NewTransmission("FlyHeading.ogg", 0.801, "Airbase_ATC/Departure/SoundFiles/", nil, 0.01)
      AI_ATC:ReadHeading(TurnHeading, RadioObject, Transmitter)
      if Approach=="Visual" then
        RadioObject:NewTransmission("VisualApproach.ogg", 1.800, "Airbase_ATC/Departure/SoundFiles/", nil, 0.1)
      elseif Approach=="Instrument" then
        RadioObject:NewTransmission("InstrumentApproach.ogg", 1.776, "Airbase_ATC/Departure/SoundFiles/", nil, 0.1)
      end
      AI_ATC:Runway(Runway, RadioObject, Transmitter)
    end,{}, Delay)
  end
  
  Message()

  SCHEDULER:New(nil, function()
    AI_ATC:Push_Tower(Alias)
  end,{}, 12 )

end
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--**************************************************************************APPROACH REPORT NAV FIX******************************************************************************--
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function AI_ATC:ApproachReportFix(Alias, Report, Missed)
  local Transmitter = "Approach"
  local Title = string.format("%s %s", AI_ATC.Airbase, Transmitter)
  local ClientData = ATM.ClientData[Alias]
  local Unit = ClientData.Unit
  local Callsign = ClientData.Callsign
  local FlightCallsign = ClientData.FlightCallsign
  local Flight = ClientData.Flight
  local CallsignSub = Flight and FlightCallsign or Callsign
  local SchedulerObjects = ClientData.SchedulerObjects
  local Recovery = ClientData.Recovery
  local Type = ClientData.Chart
  local Airbase = AI_ATC.Airbase
  local Runway = AI_ATC.Runways.Landing[1]
  local DANTCN = AI_ATC_Navpoints.DANTCN:GetCoordinate()
  local Fix = AI_ATC_Navpoints[Recovery]:GetCoordinate()
  local ReportRange = DANTCN:Get2DDistance(Fix) - 5556
  local Delay = 1.5 + math.random() * (2.5 - 1.5)
    
  local ApproachTable = {
    ["HI\\LO TAC"] = { filename = "ClearedHI_TAC.ogg", duration = 2.090 },
    ["HI\\LO ILS"] = { filename = "ClearedHI-ILS.ogg", duration = 2.276 },
    ["ILS"] = { filename = "ClearedILS.ogg", duration = 1.834 },
    ["TACAN"] = { filename = "ClearedTACAN.ogg", duration = 1.649 },
  }
  
  local LocaliserType = {
    ["05"] = {
      ["HI\\LO TAC"] = { filename = "EstablishedDME.ogg", duration = 2.926 },
      ["HI\\LO ILS"] = { filename = "EstablishedDME.ogg", duration = 2.926 },
      ["ILS"] = { filename = "Established.ogg", duration = 1.614 },
      ["TACAN"] = { filename = "Established2.ogg", duration = 2.949 },
    },
    ["23"] = {
      ["HI\\LO TAC"] = { filename = "EstablishedDME.ogg", duration = 2.926 },
      ["HI\\LO ILS"] = { filename = "EstablishedDME.ogg", duration = 2.926 },
      ["ILS"] = { filename = "Established.ogg", duration = 1.614 },
      ["TACAN"] = { filename = "Established2.ogg", duration = 2.949 },
    }
  }

  local UnitCoord, Turn, Heading, Altitude, AltitudeSub, ApproachFile, ApproachSub, localizerSub, ApproachTypeFile
  local SchedulerObject, SchedulerObject1, SchedulerObject2, SchedulerObject3, ApproachData, Count
  
  SCHEDULER:New(nil, function()
    UnitCoord = Unit:GetCoordinate()
    ApproachFile = ApproachTable[Type]
    ApproachTypeFile = LocaliserType[Runway][Type]
    ApproachData = ApproachSettings[Runway][Type]
    Altitude = ApproachData.Above
    AltitudeSub = ApproachData.AboveAlt
    ApproachSub = ApproachData.Instruction2
    Count = 0
  end,{}, 0.5)
  
  local function Execute()
    local function Audio()
      SCHEDULER:New(nil, function()
        if AI_ATC:FunctionDelay(Alias, function() Audio() end, Transmitter) == false then
          return
        end
        AI_ATC:RepeatLastTransmission(Alias, function()Audio() end)
        local RadioObject = AI_ATC:FindTransmitter(Alias, Transmitter)
        AI_ATC:ChannelOpen(7, Transmitter, Alias)
        local Subtitle = string.format("%s: %s, %s Approach. ", Title, CallsignSub, Airbase)
        RadioObject:NewTransmission("DeadAir.ogg", 0.100, "Airbase_ATC/Ground/SoundFiles/", nil, 0.3, Subtitle, 7)
        AI_ATC:Callsign(Callsign, RadioObject, Transmitter, Flight)
        AI_ATC:AirbaseName(Airbase, RadioObject, Transmitter)
        RadioObject:NewTransmission("Approach.ogg", 0.569, "Airbase_ATC/Departure/SoundFiles/", nil, 0.01)
        
        Subtitle = string.format("%s: Maintain at or above %s %s", Title, AltitudeSub, ApproachSub)
        RadioObject:NewTransmission("AtOrAbove.ogg", 1.289, "Airbase_ATC/Departure/SoundFiles/", nil, 0.1, Subtitle, 6)
        AI_ATC:ReadFlightLevel(Altitude, RadioObject, Transmitter, true)
        RadioObject:NewTransmission(ApproachTypeFile.filename, ApproachTypeFile.duration, "Airbase_ATC/Departure/SoundFiles/", nil, 0.01)
        if Type=="ILS" then
          RadioObject:NewTransmission(ApproachFile.filename, ApproachFile.duration, "Airbase_ATC/Departure/SoundFiles/", nil, 0.1)
          AI_ATC:Runway(Runway, RadioObject, Transmitter)
        end
      end, {}, Delay)
      AI_ATC:TerminateSchedules(Alias)
      AI_ATC:ResetMenus(Alias)
      AI_ATC:ApproachAssistMenu(Alias, false)
      AI_ATC:Push_Tower(Alias)
    end
    Audio()
  end
  
  local function ExecuteFunction()
    SchedulerObject2 = SCHEDULER:New(nil, function()
      if Unit and Unit:IsAlive() then
        local Coord = Unit:GetCoordinate()
        local Range = Coord:Get2DDistance(DANTCN)
        if Range <= 27779 then
          if AI_ATC:FunctionDelay(Alias, nil, Transmitter)==true then
            Execute()
          end
          SchedulerObject2:Stop()
        end
      else
        SchedulerObject2:Stop()
      end
    end, {}, 1, 1)
    table.insert(SchedulerObjects, SchedulerObject2)
  end
  
  
  local function AlternateFunction()
    SchedulerObject3 = SCHEDULER:New(nil, function()
      if Unit and Unit:IsAlive() then
        local Coord = Unit:GetCoordinate()
        local Range = Coord:Get2DDistance(DANTCN)
        if Range >= (ReportRange + 11112)then
          if AI_ATC:FunctionDelay(Alias, nil, Transmitter)==true then
            Execute()
          end
          SchedulerObject3:Stop()
        end
      else
        SchedulerObject3:Stop()
      end
    end, {}, 1, 1)
    table.insert(SchedulerObjects, SchedulerObject3)
  end

  if not Report and not Missed then
    SchedulerObject = SCHEDULER:New(nil, function()
      Count = Count + 1
      if Unit and Unit:IsAlive() then
        local Coord = Unit:GetCoordinate()
        local Range = Coord:Get2DDistance(DANTCN)
        if Count==1 and Range <= ReportRange then
          AlternateFunction()
          SchedulerObject:Stop()
        elseif Count>=1 and Range <= ReportRange then
          if AI_ATC:FunctionDelay(Alias, nil, Transmitter)==true then
            Execute()
          end
          SchedulerObject:Stop()
        end
      else
        SchedulerObject:Stop()
      end
    end, {}, 1, 1)
    table.insert(SchedulerObjects, SchedulerObject)
  
  elseif not Report and Missed then
    SchedulerObject1 = SCHEDULER:New(nil, function()
      if Unit and Unit:IsAlive() then
        local Coord = Unit:GetCoordinate()
        local Range = Coord:Get2DDistance(DANTCN)
        if Range >= 27780 then
          ExecuteFunction()
          SchedulerObject1:Stop()
        end
      else
        SchedulerObject1:Stop()
      end
    end, {}, 1, 1)
    table.insert(SchedulerObjects, SchedulerObject1)
  elseif Report then
    USERSOUND:New("RADIO_TRANS_START.ogg"):ToUnit(Unit)
    Execute()
  end


end
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--*************************************************************************ATC IFR APPROACH Type 1*******************************************************************************--
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function AI_ATC:IFRApproachType1(Alias, Type, Missed)

  local Transmitter = "Approach"
  local Title = string.format("%s %s", AI_ATC.Airbase, Transmitter)
  local RadioObject = AI_ATC:FindTransmitter(Alias, Transmitter)
  local ClientData = ATM.ClientData[Alias]
  local Unit = ClientData.Unit
  local Airbase = AI_ATC.Airbase
  local Runway = AI_ATC.Runways.Landing[1]
  local Callsign = ClientData.Callsign
  local FlightCallsign = ClientData.FlightCallsign
  local Flight = ClientData.Flight
  local CallsignSub = Flight and FlightCallsign or Callsign
  local Delay = 1.5 + math.random() * (2.5 - 1.5)
  
  if AI_ATC:FunctionDelay(Alias, function() AI_ATC:IFRApproachType1(Alias, Type, Missed) end, Transmitter)==false then
    return
  end

  local Destination, Report, Approach, TurnHeading, TurnSub, PlayerCoord, PlayerAltitude, PatternAlt, Altitude, AltSub, AltSubtitle, AudioFile, Sqwuak, Recovery
  
  local AudioTable = {
    ["Climb"] = {
      [1] = { filename = "ClimbMaintain.ogg", duration = 0.987 },
      [2] = { filename = "ClimbMaintainFL.ogg", duration = 1.593 },
    },
    ["Maintain"] = {
      [1] = { filename = "Maintain.ogg", duration = 0.638 },
      [2] = { filename = "MaintainFL.ogg", duration = 1.106 },
    },
    ["Descend"] = {
      [1] = { filename = "Descend.ogg", duration = 1.202 },
      [2] = { filename = "DescendFL.ogg", duration = 1.701 },
    },
  }
  
  local Data, IAF

  SCHEDULER:New(nil, function()
    if Runway~=nil then
      Data = ApproachSettings[Runway][Type]
      IAF = Data.IAF
      Destination = AI_ATC_Navpoints[IAF]:GetCoordinate()
      Recovery = IAF
      Approach = Type
      Altitude = Data.Altitude
      PatternAlt = Data.PatternAlt
    else
      Destination = AI_ATC_Navpoints[Runway]:GetCoordinate()
    end
    ATM.ClientData[Alias].Recovery = Recovery
    ATM.ClientData[Alias].Chart = Approach
    ATM.ClientData[Alias].Approach.PatternAltitude = Altitude
    PlayerCoord = Unit:GetCoord()
    TurnHeading = AI_ATC:CorrectHeading(PlayerCoord:HeadingTo(Destination)+0.5)
    TurnSub = AI_ATC:Heading(TurnHeading, RadioObject, Transmitter, false )
    PlayerAltitude = math.abs(Unit:GetAltitude()* 3.28084)
    Altitude = ATM.ClientData[Alias].Approach.PatternAltitude
    AltSub = AI_ATC:ReadFlightLevel(Altitude, RadioObject, Transmitter, false)
  end,{}, 0.5 )

  SCHEDULER:New(nil, function()
    local condition, audioKey
    if PlayerAltitude < (PatternAlt - 500) then
      condition = "Climb and maintain"
      audioKey = "Climb"
    elseif math.abs(PlayerAltitude - PatternAlt) <= 500 then
      condition = "maintain"
      audioKey = "Maintain"
    elseif PlayerAltitude > (PatternAlt + 500) then
      condition = "Descend and maintain"
      audioKey = "Descend"
    end
    local audioIndex = tonumber(Altitude) < 18 and 1 or 2
    AltSubtitle = string.format("%s %s", condition, AltSub)
    AudioFile = AudioTable[audioKey][audioIndex]
    Sqwuak = "Maintain current sqwuak"
    AI_ATC:ResetMenus(Alias)
    AI_ATC:ApproachAssistMenu(Alias, true, false)
  end, {}, 1.0)
  
  USERSOUND:New("RADIO_TRANS_START.ogg"):ToUnit(Unit)
  
  local function Message()
    SCHEDULER:New(nil, function()
      AI_ATC:RepeatLastTransmission(Alias, function()Message() end)
      AI_ATC:ChannelOpen(11, Transmitter, Alias)
      local Subtitle = string.format("%s: %s, %s Approach, fly heading %s. %s. %s. Report %s.", Title, CallsignSub, Airbase, TurnHeading, AltSubtitle, Sqwuak, Recovery )
      RadioObject:NewTransmission("DeadAir.ogg", 0.100, "Airbase_ATC/Ground/SoundFiles/", nil, 0.3, Subtitle, 7)
      AI_ATC:Callsign(Callsign, RadioObject, Transmitter, Flight)
      AI_ATC:AirbaseName(Airbase, RadioObject, Transmitter)
      RadioObject:NewTransmission("Approach.ogg", 0.569, "Airbase_ATC/Departure/SoundFiles/", nil, 0.01)
      RadioObject:NewTransmission("FlyHeading.ogg", 0.801, "Airbase_ATC/Departure/SoundFiles/", nil, 0.01)
      AI_ATC:ReadHeading(TurnHeading, RadioObject, Transmitter)
      RadioObject:NewTransmission(AudioFile.filename, AudioFile.duration, "Airbase_ATC/Departure/SoundFiles/", nil, 0.3)
      AI_ATC:ReadFlightLevel(Altitude, RadioObject, Transmitter, true)
      RadioObject:NewTransmission("MaintainSquawk.ogg", 1.157, "Airbase_ATC/Departure/SoundFiles/", nil, 0.01)
      RadioObject:NewTransmission("Report.ogg", 0.386, "Airbase_ATC/Departure/SoundFiles/", nil, 0.05)
      AI_ATC:ReadNavpoint(Recovery, RadioObject, Transmitter)
    end,{}, Delay )
  end

  Message()

  SCHEDULER:New(nil, function()
    AI_ATC:ApproachReportFix(Alias, nil, Missed)
  end,{}, 12 )
  
end
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--*************************************************************************ATC IFR APPROACH Type 2*******************************************************************************--
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function AI_ATC:IFRApproachType2(Alias, Type, Missed)

  local Transmitter = "Approach"
  local Title = string.format("%s %s", AI_ATC.Airbase, Transmitter)
  local RadioObject = AI_ATC:FindTransmitter(Alias, Transmitter)
  local ClientData = ATM.ClientData[Alias]
  local Unit = ClientData.Unit
  local Airbase = AI_ATC.Airbase
  local Runway = AI_ATC.Runways.Landing[1]
  local Callsign = ClientData.Callsign
  local FlightCallsign = ClientData.FlightCallsign
  local Flight = ClientData.Flight
  local CallsignSub = Flight and FlightCallsign or Callsign
  local Delay = 1.5 + math.random() * (2.5 - 1.5)
  
  local UnitCoord, UnitAltitude, AirbaseCoord, Localiser, ApproachBearing, CardinalBearing, Altitude, PatternAlt, AltSub, condition, audioKey
  local AltSubtitle, AudioFile, ApproachData, Fix
  
  if AI_ATC:FunctionDelay(Alias, function() AI_ATC:IFRApproachType2(Alias, Type, Missed) end, Transmitter)==false then
    return
  end
  
  USERSOUND:New("RADIO_TRANS_START.ogg"):ToUnit(Unit)
  
  local LocaliserTable = {
    ["06L"] = {
      ["North"] = { filename = "ArkeeDME.ogg", duration = 3.913, Navpoint = "ARKEE"},
      ["North-East"] = { filename = "FovemDME.ogg", duration = 3.855, Navpoint = "FOVEM"},
      ["North-West"] = { filename = "ArkeeDME.ogg", duration = 3.913, Navpoint = "ARKEE"},
    },
    ["06R"] = {
      ["North"] = { filename = "ArkeeDME.ogg", duration = 3.913, Navpoint = "ARKEE"},
      ["North-East"] = { filename = "FovemDME.ogg", duration = 3.855, Navpoint = "FOVEM"},
      ["North-West"] = { filename = "ArkeeDME.ogg", duration = 3.913, Navpoint = "ARKEE"},
    }
  }
  
  local AudioTable = {
    ["Climb"] = {
      [1] = { filename = "ClimbMaintain.ogg", duration = 0.987 },
      [2] = { filename = "ClimbMaintainFL.ogg", duration = 1.593 },
    },
    ["Maintain"] = {
      [1] = { filename = "Maintain.ogg", duration = 0.638 },
      [2] = { filename = "MaintainFL.ogg", duration = 1.106 },
    },
    ["Descend"] = {
      [1] = { filename = "Descend.ogg", duration = 1.202 },
      [2] = { filename = "DescendFL.ogg", duration = 1.701 },
    },
  }
  
  SCHEDULER:New(nil, function()
    UnitCoord = Unit:GetCoordinate()
    UnitAltitude = math.abs(Unit:GetAltitude()* 3.28084)
    AirbaseCoord = AI_ATC_Vec3
    ApproachBearing = AI_ATC:CorrectHeading(AirbaseCoord:HeadingTo(UnitCoord))
    CardinalBearing = UTILS.BearingToCardinal(tonumber(ApproachBearing))
    if not LocaliserTable[Runway][CardinalBearing] then
      AI_ATC:IFRApproachType3(Alias, Type, true)
      return
    else
      ApproachData = LocaliserTable[Runway][CardinalBearing]
      Fix = ApproachData.Navpoint
    end
    AI_ATC:ResetMenus(Alias)
    AI_ATC:ApproachAssistMenu(Alias, true, true)
  end,{}, 0.5 )

  SCHEDULER:New(nil, function()
    Altitude = "3"
    PatternAlt = 3000
    ATM.ClientData[Alias].Recovery = "FOVEM"
    ATM.ClientData[Alias].Chart = Type
    ATM.ClientData[Alias].Approach.PatternAltitude = Altitude
    AltSub = AI_ATC:ReadFlightLevel(Altitude, RadioObject, Transmitter, false)
    if UnitAltitude < (PatternAlt - 500) then
      condition = "Climb and maintain"
      audioKey = "Climb"
    elseif math.abs(UnitAltitude - PatternAlt) <= 500 then
      condition = "maintain"
      audioKey = "Maintain"
    elseif UnitAltitude > (PatternAlt + 500) then
      condition = "Descend and maintain"
      audioKey = "Descend"
    end
    local audioIndex = tonumber(Altitude) < 18 and 1 or 2
    AltSubtitle = string.format("%s %s", condition, AltSub)
    AudioFile = AudioTable[audioKey][audioIndex]
  end,{}, 1.5 )
  
  local function Message()
    if not ApproachData then return end
    SCHEDULER:New(nil, function()
      AI_ATC:RepeatLastTransmission(Alias, function()Message() end)
      AI_ATC:ChannelOpen(11, Transmitter, Alias)
      local Subtitle = string.format("%s: %s, %s Approach. %s. Proceed direct %s and fly the 17DME arc to runway %s.", Title, CallsignSub, Airbase, AltSubtitle, Fix, Runway )
      RadioObject:NewTransmission("DeadAir.ogg", 0.100, "Airbase_ATC/Ground/SoundFiles/", nil, 0.3, Subtitle, 9)
      AI_ATC:Callsign(Callsign, RadioObject, Transmitter, Flight)
      AI_ATC:AirbaseName(Airbase, RadioObject, Transmitter)
      RadioObject:NewTransmission("Approach.ogg", 0.569, "Airbase_ATC/Departure/SoundFiles/", nil, 0.01)
      RadioObject:NewTransmission(AudioFile.filename, AudioFile.duration, "Airbase_ATC/Departure/SoundFiles/", nil, 0.3)
      AI_ATC:ReadFlightLevel(Altitude, RadioObject, Transmitter, true)
      RadioObject:NewTransmission(ApproachData.filename, ApproachData.duration, "Airbase_ATC/Departure/SoundFiles/", nil, 0.2)
      AI_ATC:Runway(Runway, RadioObject, Transmitter)
      local Subtitle = string.format("%s: Report Extablished on the Arc.", Airbase)
      RadioObject:NewTransmission("EstablishedArc.ogg", 1.695, "Airbase_ATC/Departure/SoundFiles/", nil, 0.2, Subtitle, 2)
    end,{}, 0.5 )
  end
  
  SCHEDULER:New(nil, function()
    Message()
  end,{}, Delay )
  
  
  SCHEDULER:New(nil, function()
    AI_ATC:ApproachReportFix(Alias, nil, Missed)
  end,{}, 12 )
  
end
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--*************************************************************************ATC IFR APPROACH Type 3*******************************************************************************--
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function AI_ATC:IFRApproachType3(Alias, Type, Call, Base)

  local Transmitter    = "Approach"
  local Airbase        = AI_ATC.Airbase
  local Title          = string.format("%s %s", Airbase, Transmitter)
  local RadioObject    = AI_ATC:FindTransmitter(Alias, Transmitter)
  local Runway         = AI_ATC.Runways.Landing[1]
  local DANTCN         = AI_ATC_Navpoints.DANTCN:GetCoordinate()
  local AirbaseCoord   = AI_ATC_Vec3

  local ClientObject   = ATM.ClientData[Alias]
  local Unit           = ClientObject.Unit
  local Group          = Unit:GetGroup()
  local Callsign       = ClientObject.Callsign
  local Flight         = ClientObject.Flight
  local FlightCallsign = ClientObject.FlightCallsign
  local CallsignSub    = Flight and FlightCallsign or Callsign
  local Delay          = 1.5 + math.random() * (2.5 - 1.5)


  if Call ~= true then
    USERSOUND:New("RADIO_TRANS_START.ogg"):ToUnit(Unit)
    if AI_ATC:FunctionDelay(Alias, function() AI_ATC:IFRApproachType3(Alias, Type, nil, Base) end, Transmitter) == false then
      return
    end
  end

  local approachTable = {
    ["ILS"]      = { filename = "VectorsILS.ogg",    duration = 1.834 },
    ["TACAN"]    = { filename = "VectorsTAC.ogg",    duration = 1.756 },
    ["HI\\LO TAC"] = { filename = "ClearedTACANX.ogg", duration = 2.101 },
    ["HI\\LO ILS"] = { filename = "ClearedHI-ILS.ogg", duration = 2.241 },
  }

  local AltitudeAudio = {
    Climb =    { [1] = { filename="ClimbMaintain.ogg",   duration=0.987   },
                 [2] = { filename="ClimbMaintainFL.ogg", duration=1.593 } },
    Maintain = { [1] = { filename="Maintain.ogg",        duration=0.638   },
                 [2] = { filename="MaintainFL.ogg",      duration=1.106 } },
    Descend =  { [1] = { filename="Descend.ogg",         duration=1.202   },
                 [2] = { filename="DescendFL.ogg",       duration=1.701 } },
  }

  local TurnAudio = {
    Left  = { filename = "TurnLeft.ogg",  duration = 0.914 },
    Right = { filename = "TurnRight.ogg", duration = 0.967 },
  }

  local function normalize(a)
    if a > 180 then return a - 360 end
    if a < -180 then return a + 360 end
    return a
  end

  local function CalculateBearing(Object)
    return math.floor(tonumber(AI_ATC:CorrectHeading(AirbaseCoord:HeadingTo(Object:GetCoordinate()))) + 0.5)
  end
  
  local function CalculateTurnDirection(Object, TargetHdg)
    local ObjectHeading = tonumber(AI_ATC:CorrectHeading(Object:GetHeading()))
    local diff = ((TargetHdg - ObjectHeading + 540) % 360) - 180
    return (diff > 0) and "Right" or "Left"
  end
  
  local function CalculateSideOfRunway(unitCoord, runwayHdg, airbaseCoord)
    local inbound = (runwayHdg + 180) % 360
    local bearing = AI_ATC:CorrectHeading(airbaseCoord:HeadingTo(unitCoord))
    local diff = ((bearing - inbound + 540) % 360) - 180
    return (diff > 0) and "Right" or "Left"
  end
  
  local function CalculateHeadingDiff(a, b)
    return math.abs(((b - a + 540) % 360) - 180)
  end

  local function CalculateCardinalBearing(Object)
    local brg = AI_ATC:CorrectHeading(AirbaseCoord:HeadingTo(Object:GetCoordinate()))
    return UTILS.BearingToCardinal(tonumber(brg))
  end
  
  local function ClosestNavPoint(Object)
  
    local ObjectCoord = Object:GetCoordinate()
    local Table = ApproachSettings[Runway][Type].Offset
    local shortestDistance = math.huge
    local ClosestNavPoint, NavPointName, Index
    
    for side, data in pairs(Table) do 
      for idx, Navdata in ipairs(data) do
        local navName = Navdata.Navpoint
        local Navpoint  = AI_ATC_Navpoints[navName]       
        if Navpoint then
          local Distance = ObjectCoord:Get2DDistance(Navpoint:GetCoordinate())
          if Distance < shortestDistance then
            ClosestNavPoint = Navpoint
            shortestDistance = Distance
            NavPointName = navName
            Index = idx
          end
        end
      end
    end
    
    local ClosestNavCoord = ClosestNavPoint:GetCoordinate()
    --ClosestNavCoord:MarkToAll("Navpoint")
    
    return NavPointName, Index
    
  end

  local Final, Altitude, PatternAlt, RunwayHeading, Instruction
  local Destination, FinalCoord, Heading, Radial, dir, Navpoint
  local AltSub, AltSubtitle, AltAudioFile
  local SchedulerObject, SchedulerObject2, SchedulerObject3, TerminalRange, TerminalRange2
  local AudioFile2     = approachTable[Type]
  local Key            = 2 
  local UnitCoord, Distance, HeadingDiff, Vector, OffsetHeading, UnitHdg

  SCHEDULER:New(nil, function()
    UnitCoord = Unit:GetCoordinate()
    Navpoint, Key = ClosestNavPoint(Unit)
    if Base ~= true then
      Navpoint, Key = ClosestNavPoint(Unit)
    else
      Navpoint = "23_ILS_Left"
      Key = 2
    end
  end, {}, 0.2)

  local function UpdateVariables()
    local data = ApproachSettings[Runway] and ApproachSettings[Runway][Type]
    if not data then return end
    Final         = data.Final
    Altitude      = data.Altitude
    PatternAlt    = data.PatternAlt
    RunwayHeading = AI_ATC.Runways.Landing[5]
    Instruction   = string.format(data.Instruction, Runway)
    if data.Offset then
      local unitCoord = Unit:GetCoordinate()
      dir             = CalculateSideOfRunway(UnitCoord, RunwayHeading, AirbaseCoord)
      local offsetTbl = data.Offset[dir]
      AI_ATC:VectorToFinal(Alias, offsetTbl, Transmitter)
      AI_ATC:CancelIFRSubMenu(Alias)
      local leg       = offsetTbl and offsetTbl[Key]
      if leg then
        Final   = leg.Navpoint
        Heading = (RunwayHeading + tonumber(leg.Heading)) % 360
        if Heading < 0 then Heading = Heading + 360 end
      end
    end
    if not Heading then Heading = (RunwayHeading + 180) % 360 end
    Destination = AI_ATC_Navpoints[Final]
    if not Destination then return end
    FinalCoord     = Destination:GetCoordinate()
    TerminalRange  = AirbaseCoord:Get2DDistance(FinalCoord) + 2778
    TerminalRange2 = TerminalRange - 5556
    Radial         = CalculateBearing(Destination)
  end
  
  SCHEDULER:New(nil, function()
    AI_ATC:ResetMenus(Alias)
    --AI_ATC:ApproachAssistMenu(Alias, false)
    UpdateVariables()
  end, {}, 0.2)

  local function UpdateAltitude(Update)
    if not PatternAlt then return end
    if Update then 
      Altitude = Update
      PatternAlt = tonumber(Altitude) * 1000
    end
    AltSub        = AI_ATC:ReadFlightLevel(Altitude, RadioObject, Transmitter, false)
    local pAlt    = math.abs(Unit:GetAltitude() * 3.28084)
    local cond, key
    if pAlt < (PatternAlt - 500) then
      cond, key = "Climb and maintain", "Climb"
    elseif math.abs(pAlt - PatternAlt) <= 500 then
      cond, key = "maintain", "Maintain"
    else
      cond, key = "Descend and maintain", "Descend"
    end
    local idx     = (tonumber(Altitude) < 18) and 1 or 2
    AltSubtitle   = string.format("%s %s", cond, AltSub)
    AltAudioFile  = AltitudeAudio[key][idx]
  end
  
  SCHEDULER:New(nil, function()
    if Runway=="05" then
      UpdateAltitude("4")
    else
      UpdateAltitude("2.3")
    end
  end, {}, 1.0 )
  
  local function CorrectHeading(NewHeading)
    if AI_ATC:FunctionDelay(Alias, function() CorrectHeading(NewHeading) end, Transmitter) == false then
      return
    end
    AI_ATC:RepeatLastTransmission(Alias, function() CorrectHeading(NewHeading) end)
    local RadioObject  = AI_ATC:FindTransmitter(Alias, Transmitter)
    SCHEDULER:New(nil, function()
      AI_ATC:ChannelOpen(12, Transmitter, Alias)
      local Subtitle = string.format("%s: %s, %s Approach, fly heading %s.", Title, CallsignSub, Airbase, NewHeading)
      RadioObject:NewTransmission("DeadAir.ogg", 0.100, "Airbase_ATC/Ground/SoundFiles/", nil, 0.3, Subtitle, 5)
      AI_ATC:Callsign(Callsign, RadioObject, Transmitter, Flight)
      AI_ATC:AirbaseName(Airbase, RadioObject, Transmitter)
      RadioObject:NewTransmission("Approach.ogg", 0.569,  "Airbase_ATC/Departure/SoundFiles/", nil, 0.01)
      RadioObject:NewTransmission("FlyHeading.ogg", 0.801,"Airbase_ATC/Departure/SoundFiles/", nil, 0.01)
      AI_ATC:ReadHeading(NewHeading, RadioObject, Transmitter)
    end, {}, 0.5)
  end
  
  local function HeadingCorrection(Hdg)
    local AdvisedHeading = tonumber(Hdg)
    SchedulerObject3 = SCHEDULER:New(nil, function()
      if ATM.ClientData[Alias] and Unit then
        UnitHdg = AI_ATC:CorrectHeading(Unit:GetHeading())
        UnitCoord = Unit:GetCoordinate()
        HeadingDiff = CalculateHeadingDiff(UnitHdg, AdvisedHeading)
        if HeadingDiff <= 5 then
          Vector = tonumber(AI_ATC:CorrectHeading(UnitCoord:HeadingTo(FinalCoord)))
          OffsetHeading = CalculateHeadingDiff(AdvisedHeading, Vector)
          if OffsetHeading >= 5 then
            CorrectHeading(tostring(Vector))
            SchedulerObject3:Stop()
          else
            SchedulerObject3:Stop()
          end
        end
      else
        SchedulerObject3:Stop()
      end
    end, {}, 7, 1)
    table.insert(ClientObject.SchedulerObjects, SchedulerObject3)
  end

  local function ExecuteBaseTurn()
    UpdateAltitude("2.3")
    SchedulerObject3:Stop()
    UnitCoord = Unit:GetCoordinate()
    local turnDir = CalculateTurnDirection(Unit, Heading)
    local turnAud = TurnAudio[turnDir]
    local turnSub = string.format("Turn %s heading %s", turnDir, Heading)
    local RadioObject = AI_ATC:FindTransmitter(Alias, Transmitter)
    AI_ATC:RepeatLastTransmission(Alias, function() ExecuteBaseTurn() end)
    SCHEDULER:New(nil, function()
      AI_ATC:ChannelOpen(9, Transmitter, Alias)
      local Subtitle = string.format("%s: %s, %s Approach, %s. %s.", Title, CallsignSub, Airbase, turnSub, AltSubtitle)
      RadioObject:NewTransmission("DeadAir.ogg", 0.100, "Airbase_ATC/Ground/SoundFiles/", nil, 0.3, Subtitle, 7)
      AI_ATC:Callsign(Callsign, RadioObject, Transmitter, Flight)
      AI_ATC:AirbaseName(Airbase, RadioObject, Transmitter)
      RadioObject:NewTransmission("Approach.ogg", 0.569, "Airbase_ATC/Departure/SoundFiles/", nil, 0.01)
      RadioObject:NewTransmission(turnAud.filename, turnAud.duration, "Airbase_ATC/Departure/SoundFiles/", nil, 0.1)
      AI_ATC:ReadHeading(tostring(Heading), RadioObject, Transmitter)
      RadioObject:NewTransmission(AltAudioFile.filename, AltAudioFile.duration, "Airbase_ATC/Departure/SoundFiles/", nil, 0.3)
      AI_ATC:ReadFlightLevel(Altitude, RadioObject, Transmitter, true)
    end, {}, 0.5)
    AI_ATC:ApproachLocalizer(Alias, Type)
  end

  local function VectorToBase()
    local function Message()
      AI_ATC:RepeatLastTransmission(Alias, function() Message() end)
      UpdateAltitude("4")
      SchedulerObject3:Stop()
      local turnDir = CalculateTurnDirection(Unit, Heading)
      local turnAud = TurnAudio[turnDir]
      local turnSub = string.format("Turn %s heading %s", turnDir, Heading)
      local RadioObject = AI_ATC:FindTransmitter(Alias, Transmitter)
      SCHEDULER:New(nil, function()
        AI_ATC:ChannelOpen(9, Transmitter, Alias)
        local Subtitle = string.format("%s: %s, %s Approach, %s. %s.", Title, CallsignSub, Airbase, turnSub, AltSubtitle)
        RadioObject:NewTransmission("DeadAir.ogg", 0.100, "Airbase_ATC/Ground/SoundFiles/", nil, 0.3, Subtitle, 7)
        AI_ATC:Callsign(Callsign, RadioObject, Transmitter, Flight)
        AI_ATC:AirbaseName(Airbase, RadioObject, Transmitter)
        RadioObject:NewTransmission("Approach.ogg", 0.569, "Airbase_ATC/Departure/SoundFiles/", nil, 0.01)
        RadioObject:NewTransmission(turnAud.filename, turnAud.duration, "Airbase_ATC/Departure/SoundFiles/", nil, 0.1)
        AI_ATC:ReadHeading(tostring(Heading), RadioObject, Transmitter)
        RadioObject:NewTransmission(AltAudioFile.filename, AltAudioFile.duration, "Airbase_ATC/Departure/SoundFiles/", nil, 0.3)
        AI_ATC:ReadFlightLevel(Altitude, RadioObject, Transmitter, true)
      end, {}, 0.5)
    end

    Message()
    
    SCHEDULER:New(nil, function()
      Key = 2
      UpdateVariables()
      UpdateAltitude("2.3")
    end, {}, 7)

    SchedulerObject2 = SCHEDULER:New(nil, function()
      if ATM.ClientData[Alias] and Unit then
        local Bearing = CalculateBearing(Unit)
        local range = Unit:GetCoordinate():Get2DDistance(AirbaseCoord)
        local FunctionDelay = AI_ATC:FunctionDelay(Alias, nil, Transmitter)
        if range <= TerminalRange and range >= TerminalRange2
        and math.abs(Bearing - Radial) <= 10
        and FunctionDelay==true then
          ExecuteBaseTurn()
          SchedulerObject2:Stop()
        end
      else
        SchedulerObject2:Stop()
      end
    end, {}, 10, 1)
    table.insert(ClientObject.SchedulerObjects, SchedulerObject2)
  end
  
  local function VectorToDownWind()
    local function Message()
      AI_ATC:RepeatLastTransmission(Alias, function() Message() end)
      local playerCoord  = Unit:GetCoordinate()
      local finalHeading = AI_ATC:CorrectHeading(playerCoord:HeadingTo(FinalCoord) + 0.5)
      local turnSub      = AI_ATC:Heading(finalHeading, RadioObject, Transmitter, false)
      local RadioObject  = AI_ATC:FindTransmitter(Alias, Transmitter)
      SCHEDULER:New(nil, function()
        AI_ATC:ChannelOpen(12, Transmitter, Alias)
        local Subtitle = string.format("%s: %s, %s Approach, fly heading %s. %s. %s", Title, CallsignSub, Airbase, turnSub, AltSubtitle, Instruction)
        RadioObject:NewTransmission("DeadAir.ogg", 0.100, "Airbase_ATC/Ground/SoundFiles/", nil, 0.3, Subtitle, 7)
        AI_ATC:Callsign(Callsign, RadioObject, Transmitter, Flight)
        AI_ATC:AirbaseName(Airbase, RadioObject, Transmitter)
        RadioObject:NewTransmission("Approach.ogg", 0.569,  "Airbase_ATC/Departure/SoundFiles/", nil, 0.01)
        RadioObject:NewTransmission("FlyHeading.ogg", 0.801,"Airbase_ATC/Departure/SoundFiles/", nil, 0.01)
        AI_ATC:ReadHeading(finalHeading, RadioObject, Transmitter)
        RadioObject:NewTransmission(AltAudioFile.filename, AltAudioFile.duration, "Airbase_ATC/Departure/SoundFiles/", nil, 0.3)
        AI_ATC:ReadFlightLevel(Altitude, RadioObject, Transmitter, true)
        if AudioFile2 then
          RadioObject:NewTransmission(AudioFile2.filename, AudioFile2.duration, "Airbase_ATC/Departure/SoundFiles/", nil, 0.01)
          AI_ATC:Runway(Runway, RadioObject, Transmitter)
        end
        HeadingCorrection(finalHeading)
      end, {}, 0.5)
    end
    
    Message()
    
    if Key==2 then
      SCHEDULER:New(nil, function()
        UpdateVariables()
        UpdateAltitude("4")
      end, {}, 7)
    end

    SchedulerObject = SCHEDULER:New(nil, function()
      if ATM.ClientData[Alias] and Unit then
        local Bearing = CalculateBearing(Unit)
        local range = Unit:GetCoordinate():Get2DDistance(AirbaseCoord)
        local FunctionDelay = AI_ATC:FunctionDelay(Alias, nil, Transmitter)
        if range <= TerminalRange and range >= TerminalRange2
        and math.abs(Bearing - Radial) <= 10
        and FunctionDelay==true then
          if Key==1 then
            VectorToBase()
          else
            ExecuteBaseTurn()
          end
          SchedulerObject:Stop()
        end
      else
        SchedulerObject:Stop()
      end
    end, {}, 10, 1)
    table.insert(ClientObject.SchedulerObjects, SchedulerObject)
  end
  
  
  SCHEDULER:New(nil, function()
    VectorToDownWind()
  end, {}, 0.6)
  
end
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--*******************************************************************************APPROACH MANAGER********************************************************************************--
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function AI_ATC:IFRApproachType4(Alias, Type, Missed)

  local Transmitter = "Approach"
  local Title = string.format("%s %s", AI_ATC.Airbase, Transmitter)
  local RadioObject = AI_ATC:FindTransmitter(Alias, Transmitter)
  local ClientData = ATM.ClientData[Alias]
  local Unit = ClientData.Unit
  local Airbase = AI_ATC.Airbase
  local Runway = AI_ATC.Runways.Landing[1]
  local Callsign = ClientData.Callsign
  local FlightCallsign = ClientData.FlightCallsign
  local Flight = ClientData.Flight
  local CallsignSub = Flight and FlightCallsign or Callsign
  local Delay = 1.5 + math.random() * (2.5 - 1.5)
  
  if AI_ATC:FunctionDelay(Alias, function() AI_ATC:IFRApproachType4(Alias, Type, Missed) end, Transmitter)==false then
    return
  end
  
  USERSOUND:New("RADIO_TRANS_START.ogg"):ToUnit(Unit)

  local Destination, Report, Approach, TurnHeading, TurnSub, PlayerCoord, PlayerAltitude, PatternAlt, Altitude, AltSub, AltSubtitle, AudioFile, Sqwuak, Recovery
  local ApproachData, Navpoint
  
  local AudioTable = {
    ["Climb"] = {
      [1] = { filename = "ClimbMaintain.ogg", duration = 0.987 },
      [2] = { filename = "ClimbMaintainFL.ogg", duration = 1.593 },
    },
    ["Maintain"] = {
      [1] = { filename = "Maintain.ogg", duration = 0.638 },
      [2] = { filename = "MaintainFL.ogg", duration = 1.106 },
    },
    ["Descend"] = {
      [1] = { filename = "Descend.ogg", duration = 1.202 },
      [2] = { filename = "DescendFL.ogg", duration = 1.701 },
    },
  }

  SCHEDULER:New(nil, function()
    ApproachData = ApproachSettings[Runway][Type]
    Navpoint = ApproachData.IAF
    Altitude = ApproachData.Altitude
    PatternAlt = ApproachData.PatternAlt
    Destination  = AI_ATC_Navpoints[Navpoint]:GetCoordinate()

    ATM.ClientData[Alias].Recovery = Navpoint
    ATM.ClientData[Alias].Chart = Type
    ATM.ClientData[Alias].Approach.PatternAltitude = Altitude
    PlayerCoord = Unit:GetCoord()
    TurnHeading = AI_ATC:CorrectHeading(PlayerCoord:HeadingTo(Destination)+0.5)
    TurnSub = AI_ATC:Heading(TurnHeading, RadioObject, Transmitter, false )
    PlayerAltitude = math.abs(Unit:GetAltitude()* 3.28084)
    Altitude = ATM.ClientData[Alias].Approach.PatternAltitude
    AltSub = AI_ATC:ReadFlightLevel(Altitude, RadioObject, Transmitter, false)
  end,{}, 0.5 )

  SCHEDULER:New(nil, function()
    local condition, audioKey
    if PlayerAltitude < (PatternAlt - 500) then
      condition = "Climb and maintain"
      audioKey = "Climb"
    elseif math.abs(PlayerAltitude - PatternAlt) <= 500 then
      condition = "maintain"
      audioKey = "Maintain"
    elseif PlayerAltitude > (PatternAlt + 500) then
      condition = "Descend and maintain"
      audioKey = "Descend"
    end
    local audioIndex = tonumber(Altitude) < 18 and 1 or 2
    AltSubtitle = string.format("%s %s", condition, AltSub)
    AudioFile = AudioTable[audioKey][audioIndex]
    Sqwuak = "Maintain current sqwuak"
    AI_ATC:ResetMenus(Alias)
    AI_ATC:ApproachAssistMenu(Alias, true)
  end, {}, 1.0)

  local function Message()
    SCHEDULER:New(nil, function()
      AI_ATC:RepeatLastTransmission(Alias, function()Message() end)
      AI_ATC:ChannelOpen(11, Transmitter, Alias)
      local Subtitle = string.format("%s: %s, %s Approach, fly heading %s. %s. %s. Report %s", Title, CallsignSub, Airbase, TurnHeading, AltSubtitle, Sqwuak, Navpoint )
      RadioObject:NewTransmission("DeadAir.ogg", 0.100, "Airbase_ATC/Ground/SoundFiles/", nil, 0.3, Subtitle, 7)
      AI_ATC:Callsign(Callsign, RadioObject, Transmitter, Flight)
      AI_ATC:AirbaseName(Airbase, RadioObject, Transmitter)
      RadioObject:NewTransmission("Approach.ogg", 0.569, "Airbase_ATC/Departure/SoundFiles/", nil, 0.01)
      RadioObject:NewTransmission("FlyHeading.ogg", 0.801, "Airbase_ATC/Departure/SoundFiles/", nil, 0.01)
      AI_ATC:ReadHeading(TurnHeading, RadioObject, Transmitter)
      RadioObject:NewTransmission(AudioFile.filename, AudioFile.duration, "Airbase_ATC/Departure/SoundFiles/", nil, 0.3)
      AI_ATC:ReadFlightLevel(Altitude, RadioObject, Transmitter, true)
      RadioObject:NewTransmission("MaintainSquawk.ogg", 1.157, "Airbase_ATC/Departure/SoundFiles/", nil, 0.01)
      RadioObject:NewTransmission("Report.ogg", 0.386, "Airbase_ATC/Departure/SoundFiles/", nil, 0.05)
      AI_ATC:ReadNavpoint(Navpoint, RadioObject, Transmitter)
    end,{}, Delay )
  end

  Message()
  
  if not Missed then
    SCHEDULER:New(nil, function()
      AI_ATC:ApproachReportFix(Alias)
    end,{}, 12 )
  end
end
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--*************************************************************************ATC IFR APPROACH Type 5*******************************************************************************--
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function AI_ATC:IFRApproachType5(Alias, Type, Call, Base)

  local Transmitter    = "Approach"
  local Airbase        = AI_ATC.Airbase
  local Title          = string.format("%s %s", Airbase, Transmitter)
  local RadioObject    = AI_ATC:FindTransmitter(Alias, Transmitter)
  local Runway         = AI_ATC.Runways.Landing[1]
  local DANTCN         = AI_ATC_Navpoints.DANTCN:GetCoordinate()
  local AirbaseCoord   = AI_ATC_Vec3

  local ClientObject   = ATM.ClientData[Alias]
  local Unit           = ClientObject.Unit
  local Group          = Unit:GetGroup()
  local Callsign       = ClientObject.Callsign
  local Flight         = ClientObject.Flight
  local FlightCallsign = ClientObject.FlightCallsign
  local CallsignSub    = Flight and FlightCallsign or Callsign
  local Delay          = 1.5 + math.random() * (2.5 - 1.5)
  
  if Type=="PAR" then
    Title = string.format("%s GCA", AI_ATC.Airbase)
    Transmitter = "SFA"
    RadioObject = AI_ATC:FindTransmitter(Alias, Transmitter)
  else
    RadioObject = AI_ATC:FindTransmitter(Alias, Transmitter)
  end


  if Call ~= true then
    USERSOUND:New("RADIO_TRANS_START.ogg"):ToUnit(Unit)
    if AI_ATC:FunctionDelay(Alias, function() AI_ATC:IFRApproachType5(Alias, Type, Call, Base) end, Transmitter) == false then
      return
    end
  end

  local approachTable = {
    ["PAR"] = { filename = "PARApproach.ogg", duration = 2.014 },
  }

  local AltitudeAudio = {
    Climb =    { [1] = { filename="ClimbMaintain.ogg",   duration=0.987   },
                 [2] = { filename="ClimbMaintainFL.ogg", duration=1.593 } },
    Maintain = { [1] = { filename="Maintain.ogg",        duration=0.638   },
                 [2] = { filename="MaintainFL.ogg",      duration=1.106 } },
    Descend =  { [1] = { filename="Descend.ogg",         duration=1.202   },
                 [2] = { filename="DescendFL.ogg",       duration=1.701 } },
  }

  local TurnAudio = {
    Left  = { filename = "TurnLeft.ogg",  duration = 0.914 },
    Right = { filename = "TurnRight.ogg", duration = 0.967 },
  }

  local function normalize(a)
    if a > 180 then return a - 360 end
    if a < -180 then return a + 360 end
    return a
  end

  local function CalculateBearing(Object)
    return math.floor(tonumber(AI_ATC:CorrectHeading(AirbaseCoord:HeadingTo(Object:GetCoordinate()))) + 0.5)
  end
  
  local function CalculateTurnDirection(Object, TargetHdg)
    local ObjectHeading = tonumber(AI_ATC:CorrectHeading(Object:GetHeading()))
    local diff = ((TargetHdg - ObjectHeading + 540) % 360) - 180
    return (diff > 0) and "Right" or "Left"
  end
  
  local function CalculateSideOfRunway(unitCoord, runwayHdg, airbaseCoord)
    local inbound = (runwayHdg + 180) % 360
    local bearing = AI_ATC:CorrectHeading(airbaseCoord:HeadingTo(unitCoord))
    local diff = ((bearing - inbound + 540) % 360) - 180
    return (diff > 0) and "Right" or "Left"
  end
  
  local function CalculateHeadingDiff(a, b)
    return math.abs(((b - a + 540) % 360) - 180)
  end

  local function CalculateCardinalBearing(Object)
    local brg = AI_ATC:CorrectHeading(AirbaseCoord:HeadingTo(Object:GetCoordinate()))
    return UTILS.BearingToCardinal(tonumber(brg))
  end
  
  local function ClosestNavPoint(Object)
  
    local ObjectCoord = Object:GetCoordinate()
    local Table = ApproachSettings[Runway][Type].Offset
    local shortestDistance = math.huge
    local ClosestNavPoint, NavPointName, Index
    
    for side, data in pairs(Table) do 
      for idx, Navdata in ipairs(data) do
        local navName = Navdata.Navpoint
        local Navpoint  = AI_ATC_Navpoints[navName]
        if Navpoint then
          local Distance = ObjectCoord:Get2DDistance(Navpoint:GetCoordinate())
          if Distance < shortestDistance then
            ClosestNavPoint = Navpoint
            shortestDistance = Distance
            NavPointName = navName
            Index = idx
          end
        end
      end
    end
    
    local ClosestNavCoord = ClosestNavPoint:GetCoordinate()
    ClosestNavCoord:MarkToAll("Navpoint")
    
    return NavPointName, Index
    
  end

  local Final, Altitude, PatternAlt, RunwayHeading, Instruction
  local Destination, FinalCoord, Heading, Radial, dir, Navpoint
  local AltSub, AltSubtitle, AltAudioFile
  local Height, WindDirection, WindSpeed, QNHPressure, QNH
  local SchedulerObject, SchedulerObject2, SchedulerObject3, TerminalRange, TerminalRange2
  local AudioFile2     = approachTable[Type]
  local Key            = 2 
  local UnitCoord, Distance, HeadingDiff, Vector, OffsetHeading, UnitHdg

  SCHEDULER:New(nil, function()
    UnitCoord = Unit:GetCoordinate()
    ATM.ClientData[Alias].Chart = Type
    Navpoint, Key = ClosestNavPoint(Unit)
    if Base ~= true then
      Navpoint, Key = ClosestNavPoint(Unit)
    else
      Navpoint = "OGBON"
      Key = 2
    end
    Height = AirbaseCoord:GetLandHeight()
    WindDirection, WindSpeed = AirbaseCoord:GetWind(Height +10)
    WindDirection = AI_ATC:RectifyHeading(tostring(math.floor(WindDirection + 0.5)))
    WindSpeed = (tostring(math.floor(UTILS.MpsToKnots(WindSpeed)- 0.5)))
    QNHPressure = UTILS.hPa2inHg(AirbaseCoord:GetPressure(0))
    QNH = math.floor(QNHPressure * 100 + 0.5) / 100
  end, {}, 0.2)

  local function UpdateVariables()
    local data = ApproachSettings[Runway] and ApproachSettings[Runway][Type]
    if not data then return end
    Final         = data.Final
    Altitude      = data.Altitude
    PatternAlt    = data.PatternAlt
    RunwayHeading = AI_ATC.Runways.Landing[5]
    Instruction   = string.format(data.Instruction, Runway)
    if data.Offset then
      local unitCoord = Unit:GetCoordinate()
      dir             = CalculateSideOfRunway(UnitCoord, RunwayHeading, AirbaseCoord)
      local offsetTbl = data.Offset[dir]
      AI_ATC:VectorToFinal(Alias, offsetTbl, Transmitter)
      AI_ATC:CancelIFRSubMenu(Alias)
      local leg       = offsetTbl and offsetTbl[Key]
      if leg then
        Final   = leg.Navpoint
        Heading = (RunwayHeading + tonumber(leg.Heading)) % 360
        if Heading < 0 then Heading = Heading + 360 end
      end
    end
    if not Heading then Heading = (RunwayHeading + 180) % 360 end
    Destination = AI_ATC_Navpoints[Final]
    if not Destination then return end
    FinalCoord     = Destination:GetCoordinate()
    TerminalRange  = AirbaseCoord:Get2DDistance(FinalCoord) + 2778
    TerminalRange2 = TerminalRange - 5556
    Radial         = CalculateBearing(Destination)
  end
  
  SCHEDULER:New(nil, function()
    AI_ATC:ResetMenus(Alias)
    --AI_ATC:ApproachAssistMenu(Alias, false)
    UpdateVariables()
  end, {}, 0.2)

  local function UpdateAltitude()
    if not PatternAlt then return end
    AltSub        = AI_ATC:ReadFlightLevel(Altitude, RadioObject, Transmitter, false)
    local pAlt    = math.abs(Unit:GetAltitude() * 3.28084)
    local cond, key
    if pAlt < (PatternAlt - 500) then
      cond, key = "Climb and maintain", "Climb"
    elseif math.abs(pAlt - PatternAlt) <= 500 then
      cond, key = "maintain", "Maintain"
    else
      cond, key = "Descend and maintain", "Descend"
    end
    local idx     = (tonumber(Altitude) < 18) and 1 or 2
    AltSubtitle   = string.format("%s %s", cond, AltSub)
    AltAudioFile  = AltitudeAudio[key][idx]
  end
  
  SCHEDULER:New(nil, function()
    UpdateAltitude()
  end, {}, 1.0 )
  
  local function CorrectHeading(NewHeading)
    if AI_ATC:FunctionDelay(Alias, function() CorrectHeading(NewHeading) end, Transmitter) == false then
      return
    end
    AI_ATC:RepeatLastTransmission(Alias, function() CorrectHeading(NewHeading) end)
    local RadioObject  = AI_ATC:FindTransmitter(Alias, Transmitter)
    SCHEDULER:New(nil, function()
      AI_ATC:ChannelOpen(12, Transmitter, Alias)
      local Subtitle = string.format("%s: %s, %s GCA, fly heading %s.", Title, CallsignSub, Airbase, NewHeading)
      RadioObject:NewTransmission("DeadAir.ogg", 0.100, "Airbase_ATC/Ground/SoundFiles/", nil, 0.3, Subtitle, 5)
      AI_ATC:Callsign(Callsign, RadioObject, Transmitter, Flight)
      AI_ATC:AirbaseName(Airbase, RadioObject, Transmitter)
      RadioObject:NewTransmission("GCA.ogg", 0.847, "Airbase_ATC/Departure/SoundFiles/", nil, 0.01)
      RadioObject:NewTransmission("FlyHeading.ogg", 0.801,"Airbase_ATC/Departure/SoundFiles/", nil, 0.01)
      AI_ATC:ReadHeading(NewHeading, RadioObject, Transmitter)
    end, {}, 0.5)
  end
  
  local function HeadingCorrection(Hdg)
    local AdvisedHeading = tonumber(Hdg)
    SchedulerObject3 = SCHEDULER:New(nil, function()
      if ATM.ClientData[Alias] and Unit then
        UnitHdg = AI_ATC:CorrectHeading(Unit:GetHeading())
        UnitCoord = Unit:GetCoordinate()
        HeadingDiff = CalculateHeadingDiff(UnitHdg, AdvisedHeading)
        if HeadingDiff <= 5 then
          Vector = tonumber(AI_ATC:CorrectHeading(UnitCoord:HeadingTo(FinalCoord)))
          OffsetHeading = CalculateHeadingDiff(AdvisedHeading, Vector)
          if OffsetHeading >= 5 then
            CorrectHeading(tostring(Vector))
            SchedulerObject3:Stop()
          else
            SchedulerObject3:Stop()
          end
        end
      else
        SchedulerObject3:Stop()
      end
    end, {}, 7, 1)
    table.insert(ClientObject.SchedulerObjects, SchedulerObject3)
  end

  local function ExecuteBaseTurn()
    if AI_ATC:FunctionDelay(Alias, function() ExecuteBaseTurn() end, Transmitter) == false then
      return
    end
    UpdateAltitude()
    SchedulerObject3:Stop()
    UnitCoord = Unit:GetCoordinate()
    local turnDir = CalculateTurnDirection(Unit, Heading)
    local turnAud = TurnAudio[turnDir]
    local turnSub = string.format("Turn %s heading %s", turnDir, Heading)
    local RadioObject = AI_ATC:FindTransmitter(Alias, Transmitter)
    AI_ATC:RepeatLastTransmission(Alias, function() ExecuteBaseTurn() end)
    SCHEDULER:New(nil, function()
      AI_ATC:ChannelOpen(9, Transmitter, Alias)
      local Subtitle = string.format("%s: %s, %s GCA, %s. %s.", Title, CallsignSub, Airbase, turnSub, AltSubtitle)
      RadioObject:NewTransmission("DeadAir.ogg", 0.100, "Airbase_ATC/Ground/SoundFiles/", nil, 0.3, Subtitle, 7)
      AI_ATC:Callsign(Callsign, RadioObject, Transmitter, Flight)
      AI_ATC:AirbaseName(Airbase, RadioObject, Transmitter)
      RadioObject:NewTransmission("GCA.ogg", 0.847, "Airbase_ATC/Departure/SoundFiles/", nil, 0.01)
      RadioObject:NewTransmission(turnAud.filename, turnAud.duration, "Airbase_ATC/Departure/SoundFiles/", nil, 0.1)
      AI_ATC:ReadHeading(tostring(Heading), RadioObject, Transmitter)
      RadioObject:NewTransmission(AltAudioFile.filename, AltAudioFile.duration, "Airbase_ATC/Departure/SoundFiles/", nil, 0.3)
      AI_ATC:ReadFlightLevel(Altitude, RadioObject, Transmitter, true)
    end, {}, 0.5)
    AI_ATC:ApproachLocalizer(Alias, Type)
  end

  local function VectorToBase()
    local function Message()
      if AI_ATC:FunctionDelay(Alias, function() Message() end, Transmitter) == false then
        return
      end
      AI_ATC:RepeatLastTransmission(Alias, function() Message() end)
      UpdateAltitude()
      SchedulerObject3:Stop()
      local turnDir = CalculateTurnDirection(Unit, Heading)
      local turnAud = TurnAudio[turnDir]
      local turnSub = string.format("Turn %s heading %s", turnDir, Heading)
      local RadioObject = AI_ATC:FindTransmitter(Alias, Transmitter)
      SCHEDULER:New(nil, function()
        AI_ATC:ChannelOpen(9, Transmitter, Alias)
        local Subtitle = string.format("%s: %s, %s GCA, %s. %s.", Title, CallsignSub, Airbase, turnSub, AltSubtitle)
        RadioObject:NewTransmission("DeadAir.ogg", 0.100, "Airbase_ATC/Ground/SoundFiles/", nil, 0.3, Subtitle, 7)
        AI_ATC:Callsign(Callsign, RadioObject, Transmitter, Flight)
        AI_ATC:AirbaseName(Airbase, RadioObject, Transmitter)
        RadioObject:NewTransmission("GCA.ogg", 0.847, "Airbase_ATC/Departure/SoundFiles/", nil, 0.01)
        RadioObject:NewTransmission(turnAud.filename, turnAud.duration, "Airbase_ATC/Departure/SoundFiles/", nil, 0.1)
        AI_ATC:ReadHeading(tostring(Heading), RadioObject, Transmitter)
        RadioObject:NewTransmission(AltAudioFile.filename, AltAudioFile.duration, "Airbase_ATC/Departure/SoundFiles/", nil, 0.3)
        AI_ATC:ReadFlightLevel(Altitude, RadioObject, Transmitter, true)
      end, {}, 0.5)
    end

    Message()
    
    SCHEDULER:New(nil, function()
      Key = 2
      UpdateVariables()
      UpdateAltitude()
    end, {}, 7)

    SchedulerObject2 = SCHEDULER:New(nil, function()
      if ATM.ClientData[Alias] and Unit then
        local Bearing = CalculateBearing(Unit)
        local range = Unit:GetCoordinate():Get2DDistance(AirbaseCoord)
        local FunctionDelay = AI_ATC:FunctionDelay(Alias, nil, Transmitter)
        if range <= TerminalRange and range >= TerminalRange2
        and math.abs(Bearing - Radial) <= 10
        and FunctionDelay==true then
          ExecuteBaseTurn()
          SchedulerObject2:Stop()
        end
      else
        SchedulerObject2:Stop()
      end
    end, {}, 10, 1)
    table.insert(ClientObject.SchedulerObjects, SchedulerObject2)
  end
  
  local function VectorToDownWind()
    local function Message()
      AI_ATC:RepeatLastTransmission(Alias, function() Message() end)
      local playerCoord  = Unit:GetCoordinate()
      local finalHeading = AI_ATC:CorrectHeading(playerCoord:HeadingTo(FinalCoord) + 0.5)
      local turnSub      = AI_ATC:Heading(finalHeading, RadioObject, Transmitter, false)
      local RadioObject  = AI_ATC:FindTransmitter(Alias, Transmitter)
      SCHEDULER:New(nil, function()
        AI_ATC:ChannelOpen(12, Transmitter, Alias)
        local Subtitle = string.format("%s: %s, fly heading %s. %s", Title, CallsignSub, turnSub, AltSubtitle)
        RadioObject:NewTransmission("DeadAir.ogg", 0.100, "Airbase_ATC/Ground/SoundFiles/", nil, 0.3, Subtitle, 7)
        AI_ATC:Callsign(Callsign, RadioObject, Transmitter, Flight)
        RadioObject:NewTransmission("FlyHeading.ogg", 0.801,"Airbase_ATC/Departure/SoundFiles/", nil, 0.01)
        AI_ATC:ReadHeading(finalHeading, RadioObject, Transmitter)
        RadioObject:NewTransmission(AltAudioFile.filename, AltAudioFile.duration, "Airbase_ATC/Departure/SoundFiles/", nil, 0.3)
        AI_ATC:ReadFlightLevel(Altitude, RadioObject, Transmitter, true)
        HeadingCorrection(finalHeading)
      end, {}, 0.5)
    end
    
    Message()
    
    if Key==2 then
      SCHEDULER:New(nil, function()
        UpdateVariables()
        UpdateAltitude()
      end, {}, 7)
    end

    SchedulerObject = SCHEDULER:New(nil, function()
      if ATM.ClientData[Alias] and Unit then
        local Bearing = CalculateBearing(Unit)
        local range = Unit:GetCoordinate():Get2DDistance(AirbaseCoord)
        local FunctionDelay = AI_ATC:FunctionDelay(Alias, nil, Transmitter)
        if range <= TerminalRange and range >= TerminalRange2
        and math.abs(Bearing - Radial) <= 10
        and FunctionDelay==true then
          if Key==1 then
            VectorToBase()
          else
            ExecuteBaseTurn()
          end
          SchedulerObject:Stop()
        end
      else
        SchedulerObject:Stop()
      end
    end, {}, 10, 1)
    table.insert(ClientObject.SchedulerObjects, SchedulerObject)
  end
  
  local function GCAExecute()
    if AI_ATC:FunctionDelay(Alias, function() GCAExecute() end, Transmitter)==false then return end
    AI_ATC:RepeatLastTransmission(Alias, function() GCAExecute() end)
    AI_ATC:ChannelOpen(8, Transmitter, Alias)
    local Subtitle = string.format("%s: %s, %s. Radar Contact.", Title, CallsignSub, Title )
    RadioObject:NewTransmission("DeadAir.ogg", 0.100, "Airbase_ATC/Ground/SoundFiles/", nil, 0.3, Subtitle, 4)
    AI_ATC:Callsign(Callsign, RadioObject, Transmitter, Flight)
    AI_ATC:AirbaseName(Airbase, RadioObject, Transmitter)
    RadioObject:NewTransmission("GCA.ogg", 0.987, "Airbase_ATC/Departure/SoundFiles/", nil, 0.01)
    RadioObject:NewTransmission("RadarContact.ogg", 0.848, "Airbase_ATC/Departure/SoundFiles/", nil, 0.11)

    Subtitle = string.format("%s: Expect PAR approach to Runway %s. Wind %s at %s. Altimeter %s.", Title, Runway, WindDirection, WindSpeed, QNH )
    RadioObject:NewTransmission("DeadAir.ogg", 0.100, "Airbase_ATC/Ground/SoundFiles/", nil, 0.3, Subtitle, 8)
    RadioObject:NewTransmission("PARApproach.ogg", 2.014, "Airbase_ATC/Departure/SoundFiles/", nil, nil)
    AI_ATC:Runway(Runway, RadioObject, Transmitter)
    RadioObject:NewTransmission("Wind.ogg", 0.627, "Airbase_ATC/Departure/SoundFiles/", nil, 0.3)
    AI_ATC:ReadHeading(WindDirection, RadioObject, Transmitter)
    RadioObject:NewTransmission("At.ogg", 0.177, "Airbase_ATC/Departure/SoundFiles/", nil, nil)
    AI_ATC:ReadNumber(WindSpeed, RadioObject, Transmitter)
    RadioObject:NewTransmission("Altimeter.ogg", 0.708, "Airbase_ATC/Departure/SoundFiles/", nil, nil)
    AI_ATC:Pressure(QNH, RadioObject, Transmitter)
    
    SCHEDULER:New(nil, function()
      VectorToDownWind()
    end, {}, 14)
  end
  
  
  SCHEDULER:New(nil, function()
    GCAExecute()
  end, {}, 0.6)
  
end
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--*****************************************************************************APPROACH LOCALIZER********************************************************************************--
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function AI_ATC:ApproachLocalizer(Alias, Type)
  local Transmitter = "Approach"
  local Title = string.format("%s %s", AI_ATC.Airbase, Transmitter)
  local RadioObject = AI_ATC:FindTransmitter(Alias, Transmitter)
  local ClientData = ATM.ClientData[Alias]
  local Unit = ClientData.Unit
  local Callsign = ClientData.Callsign
  local FlightCallsign = ClientData.FlightCallsign
  local Flight = ClientData.Flight
  local CallsignSub = Flight and FlightCallsign or Callsign
  local SchedulerObjects = ClientData.SchedulerObjects
  local Airbase = AI_ATC.Airbase
  local DANTCN = AI_ATC_Navpoints.DANTCN:GetCoordinate()
  local Runway = AI_ATC.Runways.Landing[1]
  local RunwayHeading = AI_ATC.Runways.Landing[5]
  local Delay = 1.5 + math.random() * (2.5 - 1.5)
  
  local  LocaliserRange, LocalizerAngle
  LocaliserRange = 55560
  LocalizerAngle = 16
  
  if Type=="PAR" then
    Title = string.format("%s GCA", AI_ATC.Airbase)
    Transmitter = "SFA"
  end
  
  local TurnTable = {
    ["Left"] = { filename = "TurnLeft.ogg", duration = 0.914 },
    ["Right"] = { filename = "TurnRight.ogg", duration = 0.967 },
  }
  
  local ApproachTable = {
    ["ILS"] = { filename = "ClearedILS.ogg", duration = 1.834 },
    ["PAR"] = { filename = "ClearedPAR.ogg", duration = 2.090 },
    ["TACAN"] = { filename = "ClearedTACAN.ogg", duration = 1.649 },
  }
  
    local LocaliserType = {
    ["ILS"] = { filename = "Established.ogg", duration = 1.614 },
    ["PAR"] = { filename = "Established3.ogg", duration = 3.367 },
    ["TACAN"] = { filename = "Established2.ogg", duration = 2.949 },
  }

  local UnitCoord, Turn, Heading, Altitude, AltitudeSub, AudioFile, ApproachFile, NavPoint, NavPoint2, FinalHeading, TurnSub, ApproachSub, SchedulerObject, SchedulerObject2
  local localizerSub, ApproachTypeFile, Localizer
  
  local function CalculateTurnDirection(UnitCoord)
    local function normalizeAngle(angle)
      if angle > 180 then
        angle = angle - 360
      elseif angle < -180 then
        angle = angle + 360
      end
      return angle
    end
  
    local LOCALISER     = RunwayHeading
    local unitHeading   = AI_ATC:CorrectHeading(Unit:GetHeading())
    local headingDiff   = normalizeAngle(LOCALISER - unitHeading)
    local turnDirection = (headingDiff < 0) and "Left" or "Right"
  
    local vectorHeading = AI_ATC:CorrectHeading(UnitCoord:HeadingTo(DANTCN))
    local vectorCalc    = normalizeAngle(LOCALISER - vectorHeading)

    local offset
    if vectorCalc > 0 then
      offset = LOCALISER - 30
    else
      offset = LOCALISER + 30 
    end
  
    return turnDirection, tostring(offset)
  end
  
  local function LocalizerIntercept(unitobject, requiredheading)
    local RequiredHeading = tonumber(requiredheading)
    local UnitHeading = AI_ATC:CorrectHeading(unitobject:GetHeading())
    UnitHeading = UnitHeading % 360
    RequiredHeading = RequiredHeading % 360
    local headingError = ((RequiredHeading - UnitHeading + 180) % 360) - 180
    local direction
    if headingError > 0 then
      direction = "Right"
    elseif headingError < 0 then
      direction = "Left"
    end
    local degrees = math.abs(headingError)
    
    return direction
  end
  
  local function FinalController()
    RadioObject = AI_ATC:FindTransmitter(Alias, Transmitter)
    local UnitCoord = Unit:GetCoordinate()
    Turn, Heading = LocalizerIntercept(Unit, RunwayHeading)
    AudioFile = TurnTable[Turn]
    TurnSub = string.format("Turn %s heading %s", Turn, RunwayHeading)
    AI_ATC:RepeatLastTransmission(Alias, function()FinalController() end)
    RadioObject = AI_ATC:FindTransmitter(Alias, Transmitter)
    AI_ATC:ChannelOpen(7, Transmitter, Alias)
    local Subtitle = string.format("%s: %s, %s, Standby final controller.", Title, CallsignSub, TurnSub)
    RadioObject:NewTransmission("DeadAir.ogg", 0.100, "Airbase_ATC/Ground/SoundFiles/", nil, 0.3, Subtitle, 5)
    AI_ATC:Callsign(Callsign, RadioObject, Transmitter, Flight)
    RadioObject:NewTransmission(AudioFile.filename, AudioFile.duration, "Airbase_ATC/Departure/SoundFiles/", nil, 0.1)
    AI_ATC:ReadHeading(tostring(RunwayHeading), RadioObject, Transmitter)
    RadioObject:NewTransmission("FinalController.ogg", 1.602, "Airbase_ATC/Departure/SoundFiles/", nil, 0.1)

    SCHEDULER:New(nil, function()
      AI_ATC:TowerPAR(Alias)
    end, {}, 7)
  end

  local function Execute(Alternate)
    SCHEDULER:New(nil, function()
      UnitCoord = Unit:GetCoordinate()
      Turn, Heading = CalculateTurnDirection(UnitCoord)
      AudioFile = TurnTable[Turn]
      ApproachFile = ApproachTable[Type]
      ApproachTypeFile = LocaliserType[Type]
      if Type=="ILS" then
        Altitude = "2.3"
        AltitudeSub = "2300"
        ApproachSub = string.format("established on the localiser. Cleared ILS approach for runway %s.", Runway)
      elseif Type=="TACAN" then
        Altitude = "2.3"
        AltitudeSub = "2300"
        ApproachSub = "established on the TACAN final. Cleared for the approach. "
      elseif Type=="PAR" then
        Localizer = AI_ATC_Navpoints["PAR_"..Runway]:GetCoordinate()
        Localizer:MarkToAll("TouchDown")
        Altitude = "2.3"
        AltitudeSub = "2300"
        ApproachSub = string.format("instructed by the final controller. Cleared for the approach.", Runway)
      end
      TurnSub = string.format("Turn %s heading %s", Turn, Heading)
    end,{}, 0.5)
    
    local function Audio()
      if AI_ATC:FunctionDelay(Alias, function() Audio() end, Transmitter)==false then
        return
      end
      SCHEDULER:New(nil, function()
        AI_ATC:RepeatLastTransmission(Alias, function()Audio() end)
        RadioObject = AI_ATC:FindTransmitter(Alias, Transmitter)
        AI_ATC:ChannelOpen(13, Transmitter, Alias)
        local Subtitle = string.format("%s: %s, %s Approach, %s", Title, CallsignSub, Airbase, TurnSub)
        RadioObject:NewTransmission("DeadAir.ogg", 0.100, "Airbase_ATC/Ground/SoundFiles/", nil, 0.3, Subtitle, 5)
        AI_ATC:Callsign(Callsign, RadioObject, Transmitter, Flight)
        AI_ATC:AirbaseName(Airbase, RadioObject, Transmitter)
        RadioObject:NewTransmission("Approach.ogg", 0.569, "Airbase_ATC/Departure/SoundFiles/", nil, 0.01)
        RadioObject:NewTransmission(AudioFile.filename, AudioFile.duration, "Airbase_ATC/Departure/SoundFiles/", nil, 0.1)
        AI_ATC:ReadHeading(Heading, RadioObject, Transmitter)

        Subtitle = string.format("%s: Maintain at or above %s until %s", Title, AltitudeSub, ApproachSub)
        RadioObject:NewTransmission("AtOrAbove.ogg", 1.289, "Airbase_ATC/Departure/SoundFiles/", nil, 0.1, Subtitle, 6)
        AI_ATC:ReadFlightLevel(Altitude, RadioObject, Transmitter, true)
        RadioObject:NewTransmission(ApproachTypeFile.filename, ApproachTypeFile.duration, "Airbase_ATC/Departure/SoundFiles/", nil, 0.01)
        if Type=="ILS" then
          RadioObject:NewTransmission(ApproachFile.filename, ApproachFile.duration, "Airbase_ATC/Departure/SoundFiles/", nil, 0.1)
          AI_ATC:Runway(Runway, RadioObject, Transmitter)
        end
      end,{}, Delay)
    end
    
    local function AlternateAudio()
      if AI_ATC:FunctionDelay(Alias, function() AlternateAudio() end, Transmitter)==false then
        return
      end
      SCHEDULER:New(nil, function()
        AI_ATC:RepeatLastTransmission(Alias, function()AlternateAudio() end)
        RadioObject = AI_ATC:FindTransmitter(Alias, Transmitter)
        AI_ATC:ChannelOpen(13, Transmitter, Alias)
        local Subtitle = string.format("%s: %s, %s Approach", Title, CallsignSub, Airbase)
        RadioObject:NewTransmission("DeadAir.ogg", 0.100, "Airbase_ATC/Ground/SoundFiles/", nil, 0.3, Subtitle, 5)
        AI_ATC:Callsign(Callsign, RadioObject, Transmitter, Flight)
        AI_ATC:AirbaseName(Airbase, RadioObject, Transmitter)
        RadioObject:NewTransmission("Approach.ogg", 0.569, "Airbase_ATC/Departure/SoundFiles/", nil, 0.01)

        Subtitle = string.format("%s: Maintain at or above %s until established on the localiser. %s", Title, AltitudeSub, ApproachSub)
        RadioObject:NewTransmission("AtOrAbove.ogg", 1.289, "Airbase_ATC/Departure/SoundFiles/", nil, 0.1, Subtitle, 6)
        AI_ATC:ReadFlightLevel(Altitude, RadioObject, Transmitter, true)
        RadioObject:NewTransmission(ApproachTypeFile.filename, ApproachTypeFile.duration, "Airbase_ATC/Departure/SoundFiles/", nil, 0.01)
        if Type=="ILS" then
          RadioObject:NewTransmission(ApproachFile.filename, ApproachFile.duration, "Airbase_ATC/Departure/SoundFiles/", nil, 0.1)
          AI_ATC:Runway(Runway, RadioObject, Transmitter)
        end
      end,{}, Delay)
    end
    if Alternate~=true then
      Audio()
    else
      AlternateAudio()
    end
    
    if Type=="PAR" then
      SchedulerObject2 = SCHEDULER:New(nil, function()
        if Unit and Unit:IsAlive() then
          local Coord = Unit:GetCoord()
          local Range = Coord:Get2DDistance(DANTCN)
          local Vector = AI_ATC:CorrectHeading(Coord:HeadingTo(Localizer))
          local Angle = AI_ATC:AngularDifference(Vector, RunwayHeading)
          if Angle <= 1 and Range <= 35188 then
            if AI_ATC:FunctionDelay(Alias, nil, Transmitter)==true then
              FinalController()
              SchedulerObject2:Stop()
            end
          end
        else
          SchedulerObject2:Stop()
        end
      end, {}, 1, 1)
      table.insert(SchedulerObjects, SchedulerObject2)
    else
      AI_ATC:TerminateSchedules(Alias)
      AI_ATC:ResetMenus(Alias)
      AI_ATC:ApproachAssistMenu(Alias, false)
      SCHEDULER:New(nil, function()
        AI_ATC:Push_Tower(Alias)
      end, {}, 12)
    end
  end

  SchedulerObject = SCHEDULER:New(nil, function()
    if Unit and Unit:IsAlive() then
      local Coord = Unit:GetCoord()
      local Range = Coord:Get2DDistance(DANTCN)
      local Vector = AI_ATC:CorrectHeading(Coord:HeadingTo(DANTCN))
      local Angle = AI_ATC:AngularDifference(Vector, RunwayHeading)
      if (Angle >= 5 and Angle <= 14) and Range <= LocaliserRange then
        if AI_ATC:FunctionDelay(Alias, nil, Transmitter)==true then
          Execute()
        end
        SchedulerObject:Stop()
      elseif Angle < 5 and Range <= LocaliserRange then
        if AI_ATC:FunctionDelay(Alias, nil, Transmitter)==true then
          Execute(true)
        end
        SchedulerObject:Stop()
      end
    else
      SchedulerObject:Stop()
    end
  end, {}, 1, 1)
  table.insert(SchedulerObjects, SchedulerObject)

end
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--*************************************************************************ATC MISSED APPROACH***********************************************************************************--
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function AI_ATC:MissedApproach(Alias, Audio)
  local Transmitter = "Approach"
  local Title = string.format("%s %s", AI_ATC.Airbase, Transmitter)
  local RadioObject = AI_ATC:FindTransmitter(Alias, Transmitter)
  local ClientObject = ATM.ClientData[Alias]
  local Unit = ClientObject.Unit
  local Group = Unit:GetGroup()
  local AirbaseName = AI_ATC.Airbase
  local Callsign = ClientObject.Callsign
  local Type = ClientObject.Chart
  local FlightCallsign = ClientObject.FlightCallsign
  local Flight = ClientObject.Flight
  local CallsignSub = Flight and FlightCallsign or Callsign
  local Delay = 1.5 + math.random() * (2.5 - 1.5)
  
  local ApproachData, Destination, DestCoord, Altitude, AltSub, Runway, SoundData, RadSub
  
  if AI_ATC:FunctionDelay(Alias, function() AI_ATC:MissedApproach(Alias, Audio) end, Transmitter)==false then
    return
  end
  
  local RadialTable = {
    ["05"] = {
      ["ILS"] = { filename = "049Radial.ogg", duration = 2.101, subtitle = "Intercept the 049 radial." },
      ["TACAN"] = { filename = "049Radial.ogg", duration = 2.101, subtitle = "Intercept the 049 radial." },
    },
    ["23"] = {
      ["ILS"] = { filename = "229Radial.ogg", duration = 2.067, subtitle = "Intercept the 229 radial." },
      ["TACAN"] = { filename = "229Radial.ogg", duration = 2.067, subtitle = "Intercept the 229 radial." },
    },
  }
  
  USERSOUND:New("RADIO_TRANS_START.ogg"):ToUnit(Unit)
  
  SCHEDULER:New(nil, function()
    AI_ATC:RepeatLastTransmission(Alias, function()AI_ATC:MissedApproach(Alias, true) end)
    Runway = AI_ATC.Runways.Landing[1]
    ApproachData = ApproachSettings[Runway][Type]
    
    if Runway=="05" then
      Destination = "TOSIE"
      Altitude = "5"
    elseif Runway=="23" then
      Destination = "JAKUP"
      Altitude = "3.5"
    end
    
    DestCoord = AI_ATC_Navpoints[Destination]:GetCoordinate()
    AltSub = AI_ATC:ReadFlightLevel(Altitude, RadioObject, Transmitter, false)
    SoundData = RadialTable[Runway][Type]
    RadSub = SoundData.subtitle
    
    if Audio~=true then
      AI_ATC:TerminateSchedules(Alias)
      AI_ATC:ResetMenus(Alias)
      AI_ATC:MissedApproachMenu(Alias)
    end
  end,{}, 0.5 )
  
  SCHEDULER:New(nil, function()
    local UnitCoord = Unit:GetCoord()
    local Heading = AI_ATC:CorrectHeading(UnitCoord:HeadingTo(DestCoord))
    local HeadingSub = AI_ATC:Heading(Heading, RadioObject, Transmitter, false)
    AI_ATC:ChannelOpen(14, Transmitter, Alias)
    local Subtitle = string.format("%s: %s, %s Approach, Radar contact.", Title, CallsignSub, AirbaseName)
    RadioObject:NewTransmission("DeadAir.ogg", 0.100, "Airbase_ATC/Departure/SoundFiles/", nil, nil, Subtitle, 5)
    AI_ATC:Callsign(Callsign, RadioObject, Transmitter, Flight)
    AI_ATC:AirbaseName(AirbaseName, RadioObject, Transmitter)
    RadioObject:NewTransmission("Approach.ogg", 0.569, "Airbase_ATC/Departure/SoundFiles/", nil, 0.01)
    RadioObject:NewTransmission("RadarContact.ogg", 0.848, "Airbase_ATC/Departure/SoundFiles/", nil, 0.11)
    AI_ATC:TrafficReport(Alias, RadioObject, Transmitter)
    
    local Subtitle = string.format("%s: fly heading %s. %s Climb and maintain %s. Say request?", Transmitter, HeadingSub, RadSub, AltSub, Destination)
    RadioObject:NewTransmission("FlyHeading.ogg", 0.801, "Airbase_ATC/Departure/SoundFiles/", nil, 0.03, Subtitle, 5)
    AI_ATC:ReadHeading(Heading, RadioObject, Transmitter)
    RadioObject:NewTransmission(SoundData.filename, SoundData.duration, "Airbase_ATC/Departure/SoundFiles/", nil, 0.05)
    RadioObject:NewTransmission("ClimbMaintain.ogg", 0.987, "Airbase_ATC/Departure/SoundFiles/", nil, 0.03)
    AI_ATC:ReadFlightLevel(Altitude, RadioObject, Transmitter, true)
    RadioObject:NewTransmission("SayRequest.ogg", 0.987, "Airbase_ATC/Departure/SoundFiles/", nil, 0.1)
  end,{}, Delay )
  
end
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--************************************************************************ATC APPROACH B2R CHECK IN******************************************************************************--
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function AI_ATC:B2RCheckIn(Alias)
  local Transmitter = "Approach"
  local Airbase = AI_ATC.Airbase
  local Title = string.format("%s %s", Airbase, Transmitter)
  local RadioObject = AI_ATC:FindTransmitter(Alias, Transmitter)
  local ClientObject = ATM.ClientData[Alias]
  local Unit = ClientObject.Unit
  local Group = Unit:GetGroup()
  local Callsign = ClientObject.Callsign
  local FlightCallsign = ClientObject.FlightCallsign
  local Flight = ClientObject.Flight
  local CallsignSub = Flight and FlightCallsign or Callsign
  local Delay = 1.5 + math.random() * (2.5 - 1.5)
  
  AI_ATC:ResetMenus(Alias)
  AI_ATC:BackToRadarSubMenu(Alias)
  
  USERSOUND:New("RADIO_TRANS_START.ogg"):ToUnit(Unit)
  if AI_ATC:FunctionDelay(Alias, function() AI_ATC:B2RCheckIn(Alias) end, Transmitter)==false then
    return
  end
  
  local function Message()
    SCHEDULER:New(nil, function()
      AI_ATC:RepeatLastTransmission(Alias, function()Message() end)
      AI_ATC:ChannelOpen(11, Transmitter, Alias)
      local Subtitle = string.format("%s: %s, %s Approach, Radar contact. Say request", Title, CallsignSub, Airbase)
      RadioObject:NewTransmission("DeadAir.ogg", 0.100, "Airbase_ATC/Ground/SoundFiles/", nil, 0.3, Subtitle, 8)
      AI_ATC:Callsign(Callsign, RadioObject, Transmitter, Flight)
      AI_ATC:AirbaseName(Airbase, RadioObject, Transmitter)
      RadioObject:NewTransmission("Approach.ogg", 0.569, "Airbase_ATC/Departure/SoundFiles/", nil, 0.01)
      RadioObject:NewTransmission("RadarContact.ogg", 0.848, "Airbase_ATC/Departure/SoundFiles/", nil, 0.11)
      RadioObject:NewTransmission("SayRequest.ogg", 0.987, "Airbase_ATC/Departure/SoundFiles/", nil, 0.1)
    end, {}, Delay)
  end
  
  Message()
end
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--************************************************************************ATC APPROACH BACK TO RADAR*****************************************************************************--
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function AI_ATC:ApproachBackToRadar(Alias, Type)
  local Transmitter = "Approach"
  local Airbase = AI_ATC.Airbase
  local Title = string.format("%s %s", Airbase, Transmitter)
  local ClientObject = ATM.ClientData[Alias]
  local Unit = ClientObject.Unit
  local Group = Unit:GetGroup()
  local Callsign = ClientObject.Callsign
  local FlightCallsign = ClientObject.FlightCallsign
  local Flight = ClientObject.Flight
  local CallsignSub = Flight and FlightCallsign or Callsign
  local Delay = 1.5 + math.random() * (2.5 - 1.5)
    
  if Type=="PAR" then
    Title = string.format("%s GCA", AI_ATC.Airbase)
    Transmitter = "SFA"
  end
  
  local RadioObject = AI_ATC:FindTransmitter(Alias, Transmitter)
  
  AI_ATC:TerminateSchedules(Alias)
  AI_ATC:ResetMenus(Alias)
  AI_ATC:GenerateEmptyMenu(Alias, Transmitter)
  AI_ATC:CancelIFRSubMenu(Alias)
  USERSOUND:New("RADIO_TRANS_START.ogg"):ToUnit(Unit)
  
  if AI_ATC:FunctionDelay(Alias, function() AI_ATC:ApproachBackToRadar(Alias, Type) end, Transmitter)==false then
    return
  end

  local Heading, Altitude, AltSub, Instruction, PlayerAltitude, PatternAlt, Runway, AltSubtitle, AudioFile, ApproachFile
  
  local AudioTable = {
    ["Climb"] = {
      [1] = { filename = "ClimbMaintain.ogg", duration = 0.987 },
      [2] = { filename = "ClimbMaintainFL.ogg", duration = 1.593 },
    },
    ["Maintain"] = {
      [1] = { filename = "Maintain.ogg", duration = 0.638 },
      [2] = { filename = "MaintainFL.ogg", duration = 1.106 },
    },
    ["Descend"] = {
      [1] = { filename = "Descend.ogg", duration = 1.202 },
      [2] = { filename = "DescendFL.ogg", duration = 1.701 },
    },
  }
  
  local approachTable = {
    ["ILS"] = { filename = "VectorsILS.ogg", duration = 1.834 },
    ["TACAN"] = { filename = "VectorsTAC.ogg", duration = 1.756 },
    ["PAR"] = { filename = "PARApproach.ogg", duration = 2.014 },
    ["HI\\LO TAC"] = { filename = "ClearedTACANY.ogg", duration = 2.101 },
    ["HI\\LO ILS"] = { filename = "ClearedHI-ILS.ogg", duration = 2.241 },
  }
  
  local RunwayData = {
    ["05"] = {Heading = "139", Altitude = "5", PatternAlt = 5000},
    ["23"] = {Heading = "139", Altitude = "4", PatternAlt = 4000},
  }
  
  SCHEDULER:New(nil, function()
    Runway = AI_ATC.Runways.Landing[1]
    RunwayData = RunwayData[Runway]
    Heading = RunwayData.Heading
    Altitude = RunwayData.Altitude
    PatternAlt = RunwayData.PatternAlt
    
    AltSub = AI_ATC:ReadFlightLevel(Altitude, RadioObject, Transmitter, false)
    PlayerAltitude = math.abs(Unit:GetAltitude()* 3.28084)
    local condition, audioKey
    if PlayerAltitude < (PatternAlt - 500) then
      condition = "Climb and maintain"
      audioKey = "Climb"
    elseif math.abs(PlayerAltitude - PatternAlt) <= 500 then
      condition = "maintain"
      audioKey = "Maintain"
    elseif PlayerAltitude > (PatternAlt + 500) then
      condition = "Descend and maintain"
      audioKey = "Descend"
    end
    local audioIndex = tonumber(Altitude) < 18 and 1 or 2
    AltSubtitle = string.format("%s %s", condition, AltSub)
    AudioFile = AudioTable[audioKey][audioIndex]
    ApproachFile = approachTable[Type]
    if Type == "ILS" then
      Instruction = string.format("Vector for ILS Runway %s.", Runway)
    elseif Type == "PAR" then
      Instruction = string.format("Expect PAR approach to Runway %s.", Runway)
    elseif Type == "TACAN" then
      Instruction = string.format("Vectors to the TACAN runway %s.", Runway)
    end
  end, {}, 0.5)
  
  local function Message()
    SCHEDULER:New(nil, function()
      AI_ATC:RepeatLastTransmission(Alias, function()Message() end)
      AI_ATC:ChannelOpen(11, Transmitter, Alias)
      local Subtitle = string.format("%s: %s, %s, fly heading %s. %s. %s", Title, CallsignSub, Title, Heading, AltSubtitle, Instruction)
      RadioObject:NewTransmission("DeadAir.ogg", 0.100, "Airbase_ATC/Ground/SoundFiles/", nil, 0.3, Subtitle, 8)
      AI_ATC:Callsign(Callsign, RadioObject, Transmitter, Flight)
      AI_ATC:AirbaseName(Airbase, RadioObject, Transmitter)
      if Type~="PAR" then
        RadioObject:NewTransmission("Approach.ogg", 0.569, "Airbase_ATC/Departure/SoundFiles/", nil, 0.01)
      else
        RadioObject:NewTransmission("GCA.ogg", 0.987, "Airbase_ATC/Departure/SoundFiles/", nil, 0.01)
      end
      RadioObject:NewTransmission("FlyHeading.ogg", 0.801, "Airbase_ATC/Departure/SoundFiles/", nil, 0.01)
      AI_ATC:ReadHeading(Heading, RadioObject, Transmitter)
      RadioObject:NewTransmission(AudioFile.filename, AudioFile.duration, "Airbase_ATC/Departure/SoundFiles/", nil, 0.3)
      AI_ATC:ReadFlightLevel(Altitude, RadioObject, Transmitter, true)
      RadioObject:NewTransmission(ApproachFile.filename, ApproachFile.duration, "Airbase_ATC/Departure/SoundFiles/", nil, 0.01)
      AI_ATC:Runway(Runway, RadioObject, Transmitter)
    end, {}, Delay)
  end
  
  Message()
  SCHEDULER:New(nil, function()
    AI_ATC:RadarManager(Alias, Type)
  end, {}, 10)
  
end
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--*******************************************************************************ATC BACK TO RADAR MANAGER***********************************************************************--
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function AI_ATC:RadarManager(Alias, Type, Auto)
  local Transmitter = "Approach"
  local Airbase = AI_ATC.Airbase
  local Title = string.format("%s %s", Airbase, Transmitter)
  local DANTCN = AI_ATC_Navpoints.DANTCN:GetCoordinate()
  local Runway = AI_ATC.Runways.Landing[1]
  local RunwayHeading = AI_ATC.Runways.Landing[5]
  local ClientObject = ATM.ClientData[Alias]
  local Unit = ClientObject.Unit
  local Group = Unit:GetGroup()
  local SchedulerObjects = ClientObject.SchedulerObjects
  local Callsign = ClientObject.Callsign
  local FlightCallsign = ClientObject.FlightCallsign
  local Flight = ClientObject.Flight
  local CallsignSub = Flight and FlightCallsign or Callsign
  local Delay = 1.5 + math.random() * (2.5 - 1.5)
  
  if Type=="PAR" then
    Title = string.format("%s GCA", AI_ATC.Airbase)
    Transmitter = "SFA"
  end
  
  local RadioObject = AI_ATC:FindTransmitter(Alias, Transmitter)
  
  if not Auto then
    USERSOUND:New("RADIO_TRANS_START.ogg"):ToUnit(Unit)
  end
  
  local Heading, Altitude, AltSub, AltitudeSub, Instruction, PlayerAltitude, PatternAlt, ApproachFile, TurnAudioFile, FinalAltitude
  local AltSubtitle, ApproachSub, AudioFile, Turn, Vector, TurnSub, Zone_1, Zone_2, Zone_3, SchedulerObject, SchedulerObject2, SchedulerObject3
  local Vector1, Vector2, Vector3, Localizer, ApproachTypeFile
  
  local AudioTable = {
    ["Climb"] = {
      [1] = { filename = "ClimbMaintain.ogg", duration = 0.987 },
      [2] = { filename = "ClimbMaintainFL.ogg", duration = 1.593 },
    },
    ["Maintain"] = {
      [1] = { filename = "Maintain.ogg", duration = 0.638 },
      [2] = { filename = "MaintainFL.ogg", duration = 1.106 },
    },
    ["Descend"] = {
      [1] = { filename = "Descend.ogg", duration = 1.202 },
      [2] = { filename = "DescendFL.ogg", duration = 1.701 },
    },
  }
  
  local ApproachTable = {
    ["ILS"] = { filename = "ClearedILS.ogg", duration = 1.834 },
    ["PAR"] = { filename = "ClearedPAR.ogg", duration = 2.090 },
    ["TACAN"] = { filename = "ClearedTACAN.ogg", duration = 1.649 },
  }
  
  local TurnTable = {
    ["Left"] = { filename = "TurnLeft.ogg", duration = 0.914 },
    ["Right"] = { filename = "TurnRight.ogg", duration = 0.967 },
  }
  
  local LocaliserType = {
    ["ILS"] = { filename = "Established.ogg", duration = 1.614 },
    ["PAR"] = { filename = "Established3.ogg", duration = 3.367 },
    ["TACAN"] = { filename = "Established2.ogg", duration = 2.949 },
  }
  
  local function NormalizeHeading(h)
    h = h % 360
    if h < 0 then h = h + 360 end
    return h
  end
  
  local function CalculateTurnDirection()
    
    local UnitHeading = AI_ATC:CorrectHeading(Unit:GetHeading())
    local TurnDirection
    local Localiser = RunwayHeading
    local Offset

    local HeadingDiff = Heading - UnitHeading
    if HeadingDiff > 180 then
     HeadingDiff = HeadingDiff - 360
    elseif HeadingDiff < -180 then
      HeadingDiff = HeadingDiff + 360
    end
    if HeadingDiff > 0 then
      TurnDirection = "Right"
    elseif HeadingDiff < 0 then
      TurnDirection = "Left"
    else
      TurnDirection = "Right"
    end
    
    if TurnDirection=="Left" then
      Offset = tostring(RunwayHeading + 30)
    else
      Offset = tostring(RunwayHeading - 30)
    end

    return TurnDirection, Offset
  end

  SCHEDULER:New(nil, function()
    if Runway == "05" then
      Zone_1 = AI_ATC_Navpoints.ILS_1
      Zone_2 = AI_ATC_Navpoints.ILS_2
      Zone_3 = AI_ATC_Navpoints.ILS_3
      Zone_1:SetRadius(185200)
      Zone_2:SetRadius(185200)
      Zone_3:SetRadius(124663)
      Vector1 = tostring(NormalizeHeading(RunwayHeading - 180))
      Vector2 = tostring(NormalizeHeading(RunwayHeading - 90))
      Vector3 = tostring(NormalizeHeading(RunwayHeading - 30))
      FinalAltitude = "2.3"
      AltitudeSub   = "2300"
    elseif Runway == "23" then
      Zone_1 = AI_ATC_Navpoints.ILS_1
      Zone_2 = AI_ATC_Navpoints.ILS_5
      Zone_3 = AI_ATC_Navpoints.ILS_4
      Zone_1:SetRadius(185200)
      Zone_2:SetRadius(124663)
      Zone_3:SetRadius(97231)
      Vector1 = tostring(NormalizeHeading(RunwayHeading + 180))
      Vector2 = tostring(NormalizeHeading(RunwayHeading - 90))
      Vector3 = tostring(NormalizeHeading(RunwayHeading + 30))
      if Type == "TACAN" then
        FinalAltitude = "2.4"
        AltitudeSub   = "2400"
      else
        FinalAltitude = "2.3"
        AltitudeSub   = "2300"
      end
    end
    AudioFile        = TurnTable[Turn]
    ApproachFile     = ApproachTable[Type]
    ApproachTypeFile = LocaliserType[Type]
    if Type == "ILS" then
      Localizer   = DANTCN
      ApproachSub = string.format("Cleared ILS approach for runway %s.", Runway)
    elseif Type == "PAR" then
      Localizer   = AI_ATC_Navpoints[Runway]:GetCoordinate()
      ApproachSub = "instructed by the final controller. Cleared for the approach."
    elseif Type == "TACAN" then
      Localizer   = DANTCN
      ApproachSub = string.format("Cleared TACAN approach for runway %s.", Runway)
    end
  end, {}, 0.5)

  
  local function CalculateAltitude(heading, altitude)
    Runway = AI_ATC.Runways.Landing[1]
    Heading = heading
    Altitude = altitude
    AltSub = AI_ATC:ReadFlightLevel(Altitude, RadioObject, Transmitter, false)
    PatternAlt = tonumber(Altitude.."000")
    PlayerAltitude = math.abs(Unit:GetAltitude()* 3.28084)
    local condition, audioKey
    if PlayerAltitude < (PatternAlt - 500) then
      condition = "Climb and maintain"
      audioKey = "Climb"
    elseif math.abs(PlayerAltitude - PatternAlt) <= 500 then
      condition = "maintain"
      audioKey = "Maintain"
    elseif PlayerAltitude > (PatternAlt + 500) then
      condition = "Descend and maintain"
      audioKey = "Descend"
    end
    local audioIndex = tonumber(Altitude) < 18 and 1 or 2
    AltSubtitle = string.format("%s %s", condition, AltSub)
    AudioFile = AudioTable[audioKey][audioIndex]
  end
  
  local function TurnInstruction(heading)
    if AI_ATC:FunctionDelay(Alias, function()TurnInstruction(heading) end, Transmitter)==false then return  end
    local UnitCoord = Unit:GetCoordinate()
    Turn, Vector = CalculateTurnDirection(heading)
    TurnAudioFile = TurnTable[Turn]
    TurnSub = string.format("Turn %s heading %s", Turn, Heading)
    AI_ATC:RepeatLastTransmission(Alias, function()TurnInstruction(heading) end)
    RadioObject = AI_ATC:FindTransmitter(Alias, Transmitter)
    
    SCHEDULER:New(nil, function()
      AI_ATC:ChannelOpen(9, Transmitter, Alias)
      local Subtitle = string.format("%s: %s, %s, %s. %s.", Title, CallsignSub, Title, TurnSub, AltSubtitle)
      RadioObject:NewTransmission("DeadAir.ogg", 0.100, "Airbase_ATC/Ground/SoundFiles/", nil, 0.3, Subtitle, 7)
      AI_ATC:Callsign(Callsign, RadioObject, Transmitter, Flight)
      AI_ATC:AirbaseName(Airbase, RadioObject, Transmitter)
      if Type~="PAR" then
        RadioObject:NewTransmission("Approach.ogg", 0.569, "Airbase_ATC/Departure/SoundFiles/", nil, 0.01)
      else
        RadioObject:NewTransmission("GCA.ogg", 0.987, "Airbase_ATC/Departure/SoundFiles/", nil, 0.01)
      end
      RadioObject:NewTransmission(TurnAudioFile.filename, TurnAudioFile.duration, "Airbase_ATC/Departure/SoundFiles/", nil, 0.1)
      AI_ATC:ReadHeading(Heading, RadioObject, Transmitter)
      RadioObject:NewTransmission(AudioFile.filename, AudioFile.duration, "Airbase_ATC/Departure/SoundFiles/", nil, 0.3)
      AI_ATC:ReadFlightLevel(Altitude, RadioObject, Transmitter, true)
    end, {}, 0.5)
  end
  
  local function FinalController()
    local UnitCoord = Unit:GetCoordinate()
    local RwyStrng = tostring(RunwayHeading)
    Turn = CalculateTurnDirection(Unit, RwyStrng)
    AudioFile = TurnTable[Turn]
    TurnSub = string.format("Turn %s heading %s", Turn, RwyStrng)
    AI_ATC:RepeatLastTransmission(Alias, function()FinalController() end)
    RadioObject = AI_ATC:FindTransmitter(Alias, Transmitter)
    AI_ATC:ChannelOpen(7, Transmitter, Alias)
    local Subtitle = string.format("%s: %s, %s, Standby final controller.", Title, CallsignSub, TurnSub)
    RadioObject:NewTransmission("DeadAir.ogg", 0.100, "Airbase_ATC/Ground/SoundFiles/", nil, 0.3, Subtitle, 5)
    AI_ATC:Callsign(Callsign, RadioObject, Transmitter, Flight)
    RadioObject:NewTransmission(AudioFile.filename, AudioFile.duration, "Airbase_ATC/Departure/SoundFiles/", nil, 0.1)
    AI_ATC:ReadHeading(RwyStrng, RadioObject, Transmitter)
    RadioObject:NewTransmission("FinalController.ogg", 1.602, "Airbase_ATC/Departure/SoundFiles/", nil, 0.1)
    
    SCHEDULER:New(nil, function()
      AI_ATC:TowerPAR(Alias)
    end, {}, 6)
  end
  
  local function TurnThree()
    if AI_ATC:FunctionDelay(Alias, function() TurnThree() end, Transmitter)==false then return end
    CalculateAltitude(Vector3, FinalAltitude)
    local UnitCoord = Unit:GetCoordinate()
    Turn, Vector = CalculateTurnDirection(UnitCoord)
    TurnAudioFile = TurnTable[Turn]
    TurnSub = string.format("Turn %s heading %s", Turn, Heading)
    AI_ATC:RepeatLastTransmission(Alias, function()TurnThree() end)
    RadioObject = AI_ATC:FindTransmitter(Alias, Transmitter)
    
    SCHEDULER:New(nil, function()
      AI_ATC:ChannelOpen(12, Transmitter, Alias)
      local Subtitle = string.format("%s: %s, %s, %s", Title, CallsignSub, Title, TurnSub)
      RadioObject:NewTransmission("DeadAir.ogg", 0.100, "Airbase_ATC/Ground/SoundFiles/", nil, 0.3, Subtitle, 5)
      AI_ATC:Callsign(Callsign, RadioObject, Transmitter, Flight)
      AI_ATC:AirbaseName(Airbase, RadioObject, Transmitter)
      if Type~="PAR" then
        RadioObject:NewTransmission("Approach.ogg", 0.569, "Airbase_ATC/Departure/SoundFiles/", nil, 0.01)
      else
        RadioObject:NewTransmission("GCA.ogg", 0.987, "Airbase_ATC/Departure/SoundFiles/", nil, 0.01)
      end
      RadioObject:NewTransmission(TurnAudioFile.filename, TurnAudioFile.duration, "Airbase_ATC/Departure/SoundFiles/", nil, 0.1)
      AI_ATC:ReadHeading(Heading, RadioObject, Transmitter)
      Subtitle = string.format("%s: Maintain at or above %s until %s", Title, AltitudeSub, ApproachSub)
      RadioObject:NewTransmission("AtOrAbove.ogg", 1.289, "Airbase_ATC/Departure/SoundFiles/", nil, 0.1, Subtitle, 6)
      AI_ATC:ReadFlightLevel(FinalAltitude, RadioObject, Transmitter, true)
      RadioObject:NewTransmission(ApproachTypeFile.filename, ApproachTypeFile.duration, "Airbase_ATC/Departure/SoundFiles/", nil, 0.01)
      if Type=="ILS" then
        RadioObject:NewTransmission(ApproachFile.filename, ApproachFile.duration, "Airbase_ATC/Departure/SoundFiles/", nil, 0.1)
        AI_ATC:Runway(Runway, RadioObject, Transmitter)
      end
    end, {}, 0.5)
    
    if Type=="PAR" then
      SchedulerObject = SCHEDULER:New(nil, function()
        if Unit and Unit:IsAlive() then
          local Coord = Unit:GetCoord()
          local Range = Coord:Get2DDistance(DANTCN)
          local Vector = AI_ATC:CorrectHeading(Coord:HeadingTo(Localizer))
          local Angle = AI_ATC:AngularDifference(Vector, RunwayHeading)
          if Angle <= 5 and Range <= 35188 then
            if AI_ATC:FunctionDelay(Alias, nil, Transmitter)==true then
              FinalController()
            end
            SchedulerObject:Stop()
          end
        else
          SchedulerObject:Stop()
        end
      end, {}, 2, 1)
      table.insert(SchedulerObjects, SchedulerObject)
    else
      AI_ATC:TerminateSchedules(Alias)
      AI_ATC:Push_Tower(Alias)
    end  
  end
  
  local function TurnTwo()
    CalculateAltitude(Vector2, "3")
    TurnInstruction()
    AI_ATC:TerminateSchedules(Alias)
    SchedulerObject3 = SCHEDULER:New(nil, function()
      if ATM.ClientData[Alias] and Unit then
        local Airborne = Unit:InAir()
        if Airborne and Unit:IsInZone(Zone_3) then
          TurnThree()
          SchedulerObject3:Stop()
        elseif not Airborne then
          AI_ATC:LandingManager(Alias)
          SchedulerObject3:Stop()
        end
      elseif not ATM.ClientData[Alias] then
        SchedulerObject3:Stop()
      end
    end, {}, 1, 1)
    table.insert(SchedulerObjects, SchedulerObject3)
  end
  
  local function TurnOne()
    CalculateAltitude(Vector1, "4")
    TurnInstruction()
    AI_ATC:TerminateSchedules(Alias)
    SchedulerObject2 = SCHEDULER:New(nil, function()
      if ATM.ClientData[Alias] and Unit then
        local Airborne = Unit:InAir()
        if Airborne and Unit:IsInZone(Zone_2) then
          TurnTwo()
          SchedulerObject2:Stop()
        elseif not Airborne then
          AI_ATC:LandingManager(Alias)
          SchedulerObject2:Stop()
        end
      elseif not ATM.ClientData[Alias] then
        SchedulerObject2:Stop()
      end
    end, {}, 1, 1)
    table.insert(SchedulerObjects, SchedulerObject2)
  end
  
  SchedulerObject = SCHEDULER:New(nil, function()
    if ATM.ClientData[Alias] and Unit then
      local Airborne = Unit:InAir()
      if Airborne and Unit:IsInZone(Zone_1) then
        TurnOne()
        SchedulerObject:Stop()
      elseif not Airborne then
        AI_ATC:LandingManager(Alias)
        SchedulerObject:Stop()
      end
      
    elseif not ATM.ClientData[Alias] then
      SchedulerObject:Stop()
    end
  end, {}, 1, 1)
  table.insert(SchedulerObjects, SchedulerObject)

end
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--*******************************************************************************ATC PUSH TOWER**********************************************************************************--
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function AI_ATC:Push_Tower(Alias)
  
  local Transmitter = "Approach"
  local Title = string.format("%s %s", AI_ATC.Airbase, Transmitter)
  local RadioObject = AI_ATC:FindTransmitter(Alias, Transmitter)
  local ClientData = ATM.ClientData[Alias]
  local UnitObject = ClientData.Unit
  local Type = ClientData.Type
  local Helo = ClientData.Helo
  local Approach = ClientData.Approach.Type
  local SchedulerObjects = ClientData.SchedulerObjects
  local Callsign = ClientData.Callsign
  local FlightCallsign = ClientData.FlightCallsign
  local Flight = ClientData.Flight
  local CallsignSub = Flight and FlightCallsign or Callsign
  local Delay = 1.5 + math.random() * (2.5 - 1.5)
  
  local ApproachTbl = {
    ["EAGLE"] = { filename = "DirectEagle.ogg", duration = 1.370 },
    ["TIGER"] = { filename = "DirectTiger.ogg", duration = 1.486 },
    ["FALCON"] = { filename = "DirectFalcon.ogg", duration = 1.448 },
  }
  
  local SchedulerObject, AirbaseCoord, Destination, AirbaseVec2, TowerZone, ApproachBearing, Runway, Range, Offset
  local Navpoint, Navpoint1, Navpoint2, Distance1, Distance2, UnitCoord, Soundfile
  
  local function CalculateBearing(Object)
    AirbaseCoord = AI_ATC_Vec3
    local bearing = tonumber(AI_ATC:CorrectHeading(AirbaseCoord:HeadingTo(Object:GetCoordinate())))
    return math.floor(bearing + 0.5)
  end
  
  SCHEDULER:New(nil, function()
    if Helo==true then 
      Range = 9260
      Offset = 360
    else
      if Approach=="VFR" or Approach=="Generic" then
        Range = 33336
      else
        Range = 24076
      end
      Offset = 25
    end
    UnitCoord = UnitObject:GetCoordinate()
    Runway = AI_ATC.Runways.Landing[1]
    AirbaseCoord = AI_ATC_Vec3
    Destination = AI_ATC_Navpoints[Runway]:GetCoordinate()
    AirbaseVec2 = AirbaseCoord:GetVec2()
    TowerZone = ZONE_RADIUS:New("TowerZone", AirbaseVec2, Range, nil)
    if Jester then 
      Jester:Silence()
      SCHEDULER:New(nil, function()
        Jester:Speak()
      end,{}, 10)
    end
  end, {}, 0.5)
  
  SCHEDULER:New(nil, function()
    if Approach=="VFR" or Approach=="Generic" then
      if Runway=="05" then
        Navpoint="EAGLE"
      else
        Navpoint1 = AI_ATC_Navpoints.TIGER:GetCoordinate()
        Navpoint2 = AI_ATC_Navpoints.FALCON:GetCoordinate()
        Distance1 = UnitCoord:Get2DDistance(Navpoint1)
        Distance2 = UnitCoord:Get2DDistance(Navpoint2)
        if Distance1 <= Distance2 then
          Navpoint = "TIGER"
        else
          Navpoint = "FALCON"
        end
      end
      Soundfile = ApproachTbl[Navpoint]
      ApproachBearing = CalculateBearing(AI_ATC_Navpoints[Navpoint])
    else
      ApproachBearing = CalculateBearing(Destination)
    end
  end, {}, 1.0)
  
  local function Execute()
    if AI_ATC:FunctionDelay(Alias, function() Execute() end, Transmitter) == false then
      return
    end
    
    local Procedure = AI_ATC.Procedure
    AI_ATC:TerminateSchedules(Alias)
    AI_ATC:ResetMenus(Alias)
    AI_ATC:LandingSubMenu(Alias)
    if Approach=="IFR" and Procedure=="VFR" then
      AI_ATC:GenerateEmptyMenu(Alias, "Approach")
      AI_ATC:CancelIFRSubMenu(Alias)
    end
    SCHEDULER:New(nil, function()
      AI_ATC:RepeatLastTransmission(Alias, function()Execute() end)
      local RadioObject = AI_ATC:FindTransmitter(Alias, Transmitter)
      AI_ATC:ChannelOpen(12, Transmitter, Alias)
      if Approach=="VFR" or Approach=="Generic" then
        local Subtitle = string.format("%s: %s proceed direct %s and contact tower on 360.100", Title, CallsignSub, Navpoint)
        RadioObject:NewTransmission("DeadAir.ogg", 0.100, "Airbase_ATC/Ground/SoundFiles/", nil, 0.3, Subtitle, 5)
        AI_ATC:Callsign(Callsign, RadioObject, Transmitter, Flight)
        RadioObject:NewTransmission(Soundfile.filename, Soundfile.duration, "Airbase_ATC/Departure/SoundFiles/", nil, 0.1)
        RadioObject:NewTransmission("ContactTower.ogg", 2.485, "Airbase_ATC/Departure/SoundFiles/", nil, nil)
      elseif Approach=="IFR" then
        local Subtitle = string.format("%s: %s Radar service terminated. Contact tower on 360.1", Title, Callsign)
        RadioObject:NewTransmission("DeadAir.ogg", 0.100, "Airbase_ATC/Ground/SoundFiles/", nil, 0.3, Subtitle, 5)
        AI_ATC:Callsign(Callsign, RadioObject, Transmitter, Flight)
        RadioObject:NewTransmission("IFRContactTower.ogg", 4.052, "Airbase_ATC/Departure/SoundFiles/", nil, 0.01)
      end
    end, {}, Delay)
  end

  SchedulerObject = SCHEDULER:New(nil, function()
    local Bearing = CalculateBearing(UnitObject)
    local Heading = AI_ATC:CorrectHeading(UnitObject:GetHeading())
    local FunctionDelay = AI_ATC:FunctionDelay(Alias, nil, Transmitter)
    if UnitObject:IsInZone(TowerZone) 
    and math.abs(Bearing - ApproachBearing) <= Offset 
    and FunctionDelay==true then
      Execute()
      SchedulerObject:Stop()
    end
  end, {}, 2, 1)
  table.insert(SchedulerObjects, SchedulerObject)
  
end
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--******************************************************************************ATC CANCEL IFR***********************************************************************************--
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function AI_ATC:CancelIFR(Alias, agency)
  local Transmitter = "Approach"
  local Agency = "Approach"
  local Title = string.format("%s %s", AI_ATC.Airbase, Transmitter)
  local ClientData = ATM.ClientData[Alias]
  local Type = ClientData.Chart
  local Unit = ClientData.Unit
  local Group = Unit:GetGroup()
  local Callsign = ClientData.Callsign
  local FlightCallsign = ClientData.FlightCallsign
  local Flight = ClientData.Flight
  local CallsignSub = Flight and FlightCallsign or Callsign
  local Runway = AI_ATC.Runways.Landing[1]
  local Delay = 1.5 + math.random() * (2.5 - 1.5)
  
  if Type=="PAR" then
    Title = string.format("%s GCA", AI_ATC.Airbase)
    Transmitter = "SFA"
    ATM.ClientData[Alias].Chart = "TACAN"
  end
  
  if agency then
    Agency = agency
  end
  
  local RadioObject = AI_ATC:FindTransmitter(Alias, Transmitter)
  
  local Navpoint, Navpoint1, Navpoint2, Distance1, Distance2, UnitCoord, Soundfile
  
  local ApproachTbl = {
    ["EAGLE"] = { filename = "CancelEagle.ogg", duration = 4.895 },
    ["TIGER"] = { filename = "CancelTiger.ogg", duration = 5.062 },
    ["FALCON"] = { filename = "CancelFalcon.ogg", duration = 4.981 },
  }
  
  if AI_ATC:FunctionDelay(Alias, function() AI_ATC:CancelIFR(Alias, agency) end, Transmitter)==false then
    return
  end
  
  local Procedure = AI_ATC.Procedure
  if Procedure=="VFR" then
    ATM.ClientData[Alias].Approach.Type = "VFR"
  end
  
  USERSOUND:New("RADIO_TRANS_START.ogg"):ToUnit(Unit)
  AI_ATC:TerminateSchedules(Alias)
  AI_ATC:ResetMenus(Alias)
  AI_ATC:LandingSubMenu(Alias)
  
  SCHEDULER:New(nil, function()
    UnitCoord = Unit:GetCoordinate()
    if Runway=="05" then
      Navpoint="EAGLE"
    else
      Navpoint1 = AI_ATC_Navpoints.TIGER:GetCoordinate()
      Navpoint2 = AI_ATC_Navpoints.FALCON:GetCoordinate()
      Distance1 = UnitCoord:Get2DDistance(Navpoint1)
      Distance2 = UnitCoord:Get2DDistance(Navpoint2)
      if Distance1 <= Distance2 then
        Navpoint = "TIGER"
      else
        Navpoint = "FALCON"
      end
    end
    Soundfile = ApproachTbl[Navpoint]
  end, {}, 0.5)

  local function ApproachMessage()
    AI_ATC:ChannelOpen(9, Transmitter, Alias)
    AI_ATC:RepeatLastTransmission(Alias, function()ApproachMessage() end)
    local Subtitle = string.format("%s: %s, cancellation recieved. Prceed direct %s and contact tower on 360.100", Title, CallsignSub, Navpoint)
    RadioObject:NewTransmission("DeadAir.ogg", 0.100, "Airbase_ATC/Ground/SoundFiles/", nil, 0.3, Subtitle, 9)
    AI_ATC:Callsign(Callsign, RadioObject, Transmitter, Flight)
    RadioObject:NewTransmission(Soundfile.filename, Soundfile.duration, "Airbase_ATC/Departure/SoundFiles/", nil, 0.1)
  end
  
  local function TowerMessage()
    AI_ATC:ChannelOpen(6, Transmitter, Alias)
    AI_ATC:RepeatLastTransmission(Alias, function()TowerMessage() end)
    local Subtitle = string.format("%s: %s Contact Incirlik tower on 360.100.", Title, CallsignSub)
    RadioObject:NewTransmission("DeadAir.ogg", 0.100, "Airbase_ATC/Ground/SoundFiles/", nil, 0.3, Subtitle, 3)
    AI_ATC:Callsign(Callsign, RadioObject, Agency, Flight)
    RadioObject:NewTransmission("ContactTower3.ogg", 2.386, "Airbase_ATC/Ground/SoundFiles/", nil, 0.01)
  end
  
  SCHEDULER:New(nil, function()
    if Agency=="Approach" then
      ApproachMessage()
    else
      TowerMessage()
    end
  end, {}, Delay)
end
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--******************************************************************************PUSH GCA***************************************************************************************--
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function AI_ATC:PushGCA(Alias, missed, radar)
  local Transmitter = "Approach"
  local Title = string.format("%s %s", AI_ATC.Airbase, Transmitter)
  local RadioObject = AI_ATC:FindTransmitter(Alias, Transmitter)
  local ClientData = ATM.ClientData[Alias]
  local Unit = ClientData.Unit
  local Group = Unit:GetGroup()
  local Callsign = ClientData.Callsign
  local FlightCallsign = ClientData.FlightCallsign
  local Flight = ClientData.Flight
  local CallsignSub = Flight and FlightCallsign or Callsign
  local Delay = 1.5 + math.random() * (2.5 - 1.5)

  AI_ATC:TerminateSchedules(Alias)
  AI_ATC:ResetMenus(Alias)
  AI_ATC:GCASubMenu(Alias, missed, radar)
  
  USERSOUND:New("RADIO_TRANS_START.ogg"):ToUnit(Unit)
  
  if AI_ATC:FunctionDelay(Alias, function() AI_ATC:PushGCA(Alias, missed, radar) end, Transmitter)==false then
    return
  end
  
  local function Message()
    SCHEDULER:New(nil, function()
      AI_ATC:ChannelOpen(6, Transmitter, Alias)
      AI_ATC:RepeatLastTransmission(Alias, function()Message() end)
      local Subtitle = string.format("%s: %s, Contact Incirlik GCA on 246.800.", Title, CallsignSub)
      RadioObject:NewTransmission("DeadAir.ogg", 0.100, "Airbase_ATC/Ground/SoundFiles/", nil, 0.3, Subtitle, 5)
      AI_ATC:Callsign(Callsign, RadioObject, Transmitter, Flight)
      RadioObject:NewTransmission("ContactGCA.ogg", 3.320, "Airbase_ATC/Departure/SoundFiles/", nil, 0.1)
    end, {}, Delay)
  end
  
  Message()
  
end
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--******************************************************************************ATC REQUEST DEPARTURE****************************************************************************--
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function AI_ATC:RequestDeparture(Alias)
  local Transmitter = "Approach"
  local Title = string.format("%s %s", AI_ATC.Airbase, Transmitter)
  local RadioObject = AI_ATC:FindTransmitter(Alias, Transmitter)
  local ClientData = ATM.ClientData[Alias]
  local Unit = ClientData.Unit
  local Group = Unit:GetGroup()
  local Callsign = ClientData.Callsign
  local FlightCallsign = ClientData.FlightCallsign
  local Flight = ClientData.Flight
  local CallsignSub = Flight and FlightCallsign or Callsign
  local Delay = 1.5 + math.random() * (2.5 - 1.5)
  local Runway = AI_ATC.Runways.Landing[1]
  
  if AI_ATC:FunctionDelay(Alias, function() AI_ATC:RequestDeparture(Alias) end, Transmitter)==false then
    return
  end
  
  USERSOUND:New("RADIO_TRANS_START.ogg"):ToUnit(Unit)
  ATM.ClientData[Alias].Recovery = AI_ATC.Recovery
  ATM.ClientData[Alias].Approach.Type = "IFR"
  ATM.ClientData[Alias].Chart = "ILS"
  
  AI_ATC:TerminateSchedules(Alias)
  AI_ATC:ResetMenus(Alias)
  AI_ATC:DepartureSubMenu(Alias)

  local function Message()
    SCHEDULER:New(nil, function()
      AI_ATC:ChannelOpen(6, Transmitter, Alias)
      AI_ATC:RepeatLastTransmission(Alias, function()Message() end)
      local Subtitle = string.format("%s: %s, Contact %s Departure on 340.775", Title, CallsignSub, AI_ATC.Airbase)
      RadioObject:NewTransmission("DeadAir.ogg", 0.100, "Airbase_ATC/Ground/SoundFiles/", nil, 0.3, Subtitle, 6)
      AI_ATC:Callsign(Callsign, RadioObject, Transmitter, Flight)
      RadioObject:NewTransmission("ContactDeparture.ogg", 4.017, "Airbase_ATC/Departure/SoundFiles/", nil, 0.1)
    end, {}, Delay)
  end
  
  Message()
end
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--*************************************************************************ATC CONTACT APPROACH**********************************************************************************--
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function AI_ATC:RequestApproach(Alias)
  local Transmitter = "Departure"
  local Title = string.format("%s %s", AI_ATC.Airbase, Transmitter)
  local RadioObject = AI_ATC:FindTransmitter(Alias, Transmitter)
  local ClientData = ATM.ClientData[Alias]
  local Unit = ClientData.Unit
  local Group = Unit:GetGroup()
  local Helo = ClientData.Helo
  local SchedulerObjects = ClientData.SchedulerObjects
  local Callsign = ClientData.Callsign
  local FlightCallsign = ClientData.FlightCallsign
  local Flight = ClientData.Flight
  local CallsignSub = Flight and FlightCallsign or Callsign
  local Delay = 1.5 + math.random() * (2.5 - 1.5)
  
  if AI_ATC:FunctionDelay(Alias, function() AI_ATC:RequestApproach(Alias) end, Transmitter)==false then
    return
  end
  
  USERSOUND:New("RADIO_TRANS_START.ogg"):ToUnit(Unit)
  
  SCHEDULER:New(nil, function()
    AI_ATC:TerminateSchedules(Alias)
    AI_ATC:ResetMenus(Alias)
    AI_ATC:ApproachSubMenu(Alias)
  end,{}, 0.5)
  
  SCHEDULER:New(nil, function()
    AI_ATC:ChannelOpen(8, Transmitter, Alias)
    local Subtitle = string.format("%s: %s, Contact %s Approach on 340.775.", Title, CallsignSub, AI_ATC.Airbase)
    RadioObject:NewTransmission("DeadAir.ogg", 0.100, "Airbase_ATC/Departure/SoundFiles/", nil, nil, Subtitle, 4)
    AI_ATC:Callsign(Callsign, RadioObject, Transmitter, Flight)
    RadioObject:NewTransmission("ContactApproach.ogg", 3.007, "Airbase_ATC/Departure/SoundFiles/", nil, 0.1)
  end,{}, Delay)
end
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--******************************************************************************TOWER TRAFFIC ADVISORY***************************************************************************--
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function AI_ATC:TowerTraffic(Alias)
  local Transmitter = "Tower"
  local Title = string.format("%s %s", AI_ATC.Airbase, Transmitter)
  local RadioObject = TOWER_RADIO
  local RadioKey = "Ground"
  local ClientData = ATM.ClientData[Alias]
  local UnitObject = ClientData.Unit
  local Type = ClientData.Type
  local Group = UnitObject:GetGroup()
  local ClientCoord = UnitObject:GetCoordinate()
  local ClientCount = Group:CountAliveUnits()
  local Callsign = ClientData.Callsign
  local FlightCallsign = ClientData.FlightCallsign
  local Flight = ClientData.Flight
  local CallsignSub = Flight and FlightCallsign or Callsign
  local ApproachType = ATM.ClientData[Alias].Landing.Procedure
  local Runway = AI_ATC.Runways.Landing[1]
  local Delay = 1.5 + math.random() * (2.5 - 1.5)
  
  if AI_ATC:FunctionDelay(Alias, function() AI_ATC:TowerTraffic(Alias) end, Transmitter)==false then
    return
  end
  
  local SchedulerObject, ClosestObject, TrafficObject, ObjectCoord, Distance, Traffic, TrafficCoord, TrafficType, State, CSsub, ClientHeading, Range, Vector
  local FunctionDelay, Count, CountData, CountSub, Subtitle, Break, Base
  
  if Runway=="05" then
    Break = "Right"
  elseif Runway=="23" then
    Break = "Left"
  end
  Base = string.format("%s Base", Break)
  
  if not ATM.TowerControl[Alias] then
    ATM.TowerControl[Alias] = {RequestedApproach = ApproachType, State = "On Approach", Type = Type, Contacts = {}, Schedules = {}, Count = ClientCount }
  elseif ATM.TowerControl[Alias] and ATM.TowerControl[Alias].Schedules then
    for _, sched in ipairs(ATM.TowerControl[Alias].Schedules) do
      sched:Stop()
      sched = nil
    end
  end
  
  local StateTbl = {
    ["Low Key"]              = {filename = "LowKey.ogg", duration = 0.686, subtitle = "at Low Key"},
    ["High Key"]              = {filename = "HighKey.ogg", duration = 0.742, subtitle = "at High Key"},
    ["On Departure"]         = {filename = "OnDeparture.ogg", duration = 0.771, subtitle = "on departure"},
    ["On Approach"]          = {filename = "OnApproach.ogg", duration = 0.719, subtitle = "on approach"},
    ["On Final Approach"]    = {filename = "OnFinal.ogg", duration = 0.570, subtitle = "on final"},
    ["Initial"]              = {filename = "AtInitial.ogg", duration = 0.606, subtitle = "at Initial"},
    ["in the Break"]         = {filename = "InTheBreak.ogg", duration = 0.564, subtitle = "in the break"},
    ["Left Downwind"]        = {filename = "OnLeftDownwind.ogg", duration = 0.947, subtitle = "on left downwind"},
    ["Right Downwind"]       = {filename = "OnRightDownwind.ogg", duration = 0.564, subtitle = "on right downwind"},
    ["Left Base"]            = {filename = "LeftBase.ogg", duration = 0.895, subtitle = "on left base"},
    ["Right Base"]           = {filename = "RightBase.ogg", duration = 0.893, subtitle = "on right base"},
    ["Landed on runway 21L"] = {filename = "OnFinal.ogg", duration = 0.570, subtitle = "on final"},
    ["Landed on runway 21R"] = {filename = "OnFinal.ogg", duration = 0.570, subtitle = "on final"},
    ["Going around"]         = {filename = "GoingAround.ogg", duration = 0.727, subtitle = "going around"},
    ["Outside Downwind"]     = {filename = "OutSide.ogg", duration = 1.2696, subtitle = "on outside downwind"},
    ["Missed Approach"]      = {filename = "OnMissedApproach.ogg", duration = 0.955, subtitle = "on a missed approach"},
    ["Re-entering pattern"]  = {filename = "Reenter.ogg", duration = 0.917, subtitle = "re-entering Initial"},
  }
  
  local CountTbl = {
    ["2"] = {filename = "2Ship.ogg", duration = 0.617, subtitle = " 2 ship "},
    ["4"] = {filename = "4Ship.ogg", duration = 0.612, subtitle = " 4 ship "},
  }
  
  local function TrafficReport(newContact)
    local ClientHeading  = tonumber(AI_ATC:CorrectHeading(UnitObject:GetHeading()))
    local Range = tostring(math.floor(TrafficCoord:Get2DDistance(ClientCoord) / 1852 + 0.5))
    local TrafficHeading = tonumber(AI_ATC:CorrectHeading(ClientCoord:HeadingTo(TrafficCoord)))
    local Heading = UTILS.HdgDiff(ClientHeading, TrafficHeading)
    local RelativeHeading = (TrafficHeading - ClientHeading) % 360
    local Bearing = tostring(AI_ATC:HeadingToClockBearing(RelativeHeading))
    local feet = ClosestObject:GetAltitude() / 0.3048
    local TrafficAltitude = string.format("%.1f", feet / 1000)
    local TrafficAltitudeSub = AI_ATC:ReadFlightLevel(TrafficAltitude, RadioObject, Transmitter, false)
    local Aircraft = AI_ATC_SoundFiles[RadioKey].Aircraft[TrafficType]
    local StateData = StateTbl[State]
    local StateSub = StateData.subtitle
    
    
    if CountTbl[tostring(Count)] then
      CountData = CountTbl[tostring(Count)]
      CountSub = CountData.subtitle
    else
      CountSub = " "
    end
    
    if newContact then
      CSsub = " "..CallsignSub
    else
      CSsub = ""
    end

    Subtitle = string.format("%s: %s traffic at your %s O'clock, %s miles at %s. %s%s%s. ", Title, CSsub, Bearing, Range, TrafficAltitudeSub, TrafficType, CountSub, StateSub)
    if (RelativeHeading >= 240 or RelativeHeading <= 120) and ATM.TowerControl[Alias].State~=Base then
      Subtitle = Subtitle.." Report traffic insight."
    end
    AI_ATC:ChannelOpen(10, Transmitter, Alias)
    RadioObject:NewTransmission("DeadAir.ogg", 0.100, "Airbase_ATC/Ground/SoundFiles/", nil, 0.3, Subtitle, 10)
    if newContact then
      AI_ATC:Callsign(Callsign, RadioObject, Transmitter, Flight)
    end
    RadioObject:NewTransmission("Traffic.ogg", 0.810, "Airbase_ATC/Ground/SoundFiles/", nil, 0.01)
    AI_ATC:ClockBearing(Bearing, RadioObject, Transmitter)
    AI_ATC:ReadDigits(Range, RadioObject, Transmitter)
    RadioObject:NewTransmission("Miles.ogg", 0.629, "Airbase_ATC/Ground/SoundFiles/", nil, nil)
    AI_ATC:ReadFlightLevel(TrafficAltitude, RadioObject, Transmitter, true, 0.00)
    if Aircraft then
      RadioObject:NewTransmission(string.format("Aircraft/%s", Aircraft.filename), Aircraft.duration, string.format("Airbase_ATC/%s/", RadioKey), nil, 0.1)
    end
    if CountData then
      RadioObject:NewTransmission(string.format("SoundFiles/%s", CountData.filename), CountData.duration, string.format("Airbase_ATC/%s/", RadioKey), nil, 0.03)
    end
    if StateData then
      RadioObject:NewTransmission(string.format("SoundFiles/%s", StateData.filename), StateData.duration, string.format("Airbase_ATC/%s/", RadioKey), nil, 0.1)
    end
    if (RelativeHeading >= 240 or RelativeHeading <= 120) then
      RadioObject:NewTransmission("TrafficInsight.ogg", 1.369, "Airbase_ATC/Ground/SoundFiles/", nil, 0.3)
    end

    for alias, data in pairs(ATM.TowerControl) do
      if alias~=Alias then
        ATM.TowerControl[Alias].Contacts[alias] = {}
      end
    end
  end
  
  local function Initialise()
    if not UnitObject then return end
    ClientCoord = UnitObject:GetCoordinate()
    Distance = math.huge
    if ClientCoord then
      for alias, data in pairs(ATM.TowerControl) do
        if alias~=Alias then
          TrafficObject = GROUP:FindByName(alias)
          if TrafficObject then
            ObjectCoord = TrafficObject:GetCoordinate()
            Range = ClientCoord:Get2DDistance(ObjectCoord)
            if ObjectCoord then
              if Range < Distance then
                ClosestObject = TrafficObject
                Distance = Range
                Traffic = alias
                TrafficCoord = ObjectCoord
                TrafficType = data.Type
                State = data.State
                Count = data.Count
              end
            end
          end
        end
      end
    end
  end
  
  local function GenerateSchedule()
    if ATM.TowerControl[Alias] and ATM.TowerControl[Alias].Schedules then
      local SchedulerObjects = ATM.TowerControl[Alias].Schedules
      SchedulerObject = SCHEDULER:New(nil, function()
        if not ATM.TowerControl[Alias] then
          SchedulerObject:Stop()
          return
        end
        local TwrObject = ATM.TowerControl[Alias]
        local FunctionDelay = AI_ATC:FunctionDelay(Alias, nil, Transmitter, 5)
        Initialise()
        if FunctionDelay and Traffic and ClosestObject and Distance >= 152 and Distance <= 14816
        and not TwrObject.Contacts[Traffic] and TwrObject.State~="On Final Approach"
        and TwrObject.State~=string.format("Landed on runway %s", Runway) then
          TrafficReport(true)
        end
      end, {}, 5, 5)
      table.insert(SchedulerObjects, SchedulerObject)
    end
  end

  SCHEDULER:New(nil, function()
    Initialise()
    if Traffic and ClosestObject and Distance >= 152 and Distance <= 14816 then
      TrafficReport()
      GenerateSchedule()
    else
      GenerateSchedule()
    end
  end,{}, 0.5 )
  
end
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--******************************************************************************ATC TRAFFIC RESPONSE*****************************************************************************--
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function AI_ATC:AcknowledgeTraffic(Alias, variable)
  local Transmitter = "Tower"
  local RadioObject = TOWER_RADIO
  local Title = string.format("%s %s", AI_ATC.Airbase, Transmitter)
  local ClientData = ATM.ClientData[Alias]
  local UnitObject = ClientData.Unit
  local Type = ClientData.Type
  local Group = UnitObject:GetGroup()
  local SchedulerObjects = ClientData.SchedulerObjects
  local Callsign = ClientData.Callsign
  local FlightCallsign = ClientData.FlightCallsign
  local Flight = ClientData.Flight
  local CallsignSub = Flight and FlightCallsign or Callsign
  local Delay = 1.5 + math.random() * (2.5 - 1.5)
  
  if AI_ATC:FunctionDelay(Alias, function() AI_ATC:AcknowledgeTraffic(Alias, variable) end, Transmitter)==false then
    return
  end
  
  USERSOUND:New("RADIO_TRANS_START.ogg"):ToUnit(UnitObject)
  
  local function TrafficInsight()
    SCHEDULER:New(nil, function()
      AI_ATC:RepeatLastTransmission(Alias, function() AI_ATC:AcknowledgeTraffic(Alias, variable) end)
      local Subtitle = string.format("%s: %s, Copy, Traffic insight.", Title, CallsignSub)
      RadioObject:NewTransmission("DeadAir.ogg", 0.100, "Airbase_ATC/Ground/SoundFiles/", nil, 0.3, Subtitle, 4)
      AI_ATC:Callsign(Callsign, RadioObject, Transmitter, Flight)
      RadioObject:NewTransmission("AckTraffic.ogg", 1.198, "Airbase_ATC/Ground/SoundFiles/", nil, 0.1)
    end, {}, Delay)
  end
  
  local function NoJoy()
    SCHEDULER:New(nil, function()
      AI_ATC:RepeatLastTransmission(Alias, function() AI_ATC:AcknowledgeTraffic(Alias, variable) end)
      local Subtitle = string.format("%s: %s, Report that traffic insight.", Title, CallsignSub)
      RadioObject:NewTransmission("DeadAir.ogg", 0.100, "Airbase_ATC/Ground/SoundFiles/", nil, 0.3, Subtitle, 4)
      AI_ATC:Callsign(Callsign, RadioObject, Transmitter, Flight)
      RadioObject:NewTransmission("NoJoy.ogg", 1.446, "Airbase_ATC/Ground/SoundFiles/", nil, 0.1)
    end, {}, Delay)
  end
  
  if variable==true then
    TrafficInsight()
  else
    NoJoy()
  end
  
end
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--*****************************************************************************ATC ACKNOWLEDGE EXTEND****************************************************************************--
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function AI_ATC:AcknowledgeExtend(Alias)
  local Transmitter = "Tower"
  local RadioObject = TOWER_RADIO
  local Title = string.format("%s %s", AI_ATC.Airbase, Transmitter)
  local ClientData = ATM.ClientData[Alias]
  local UnitObject = ClientData.Unit
  local Type = ClientData.Type
  local Group = UnitObject:GetGroup()
  local SchedulerObjects = ClientData.SchedulerObjects
  local Callsign = ClientData.Callsign
  local FlightCallsign = ClientData.FlightCallsign
  local Flight = ClientData.Flight
  local CallsignSub = Flight and FlightCallsign or Callsign
  local Delay = 1.5 + math.random() * (2.5 - 1.5)
  
  if AI_ATC:FunctionDelay(Alias, function() AI_ATC:AcknowledgeExtend(Alias) end, Transmitter)==false then
    return
  end
  
  USERSOUND:New("RADIO_TRANS_START.ogg"):ToUnit(UnitObject)
  
  SCHEDULER:New(nil, function()
    AI_ATC:RepeatLastTransmission(Alias, function() AI_ATC:AcknowledgeExtend(Alias) end)
    local Subtitle = string.format("%s: %s, report base.", Title, CallsignSub)
    RadioObject:NewTransmission("DeadAir.ogg", 0.100, "Airbase_ATC/Ground/SoundFiles/", nil, 0.3, Subtitle, 4)
    AI_ATC:Callsign(Callsign, RadioObject, Transmitter, Flight)
    RadioObject:NewTransmission("ReportBase.ogg", 0.848, "Airbase_ATC/Ground/SoundFiles/", nil, 0.1)
  end, {}, Delay)
end
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--*******************************************************************************ATC TOWER SAY WIND******************************************************************************--
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function AI_ATC:TowerWinds(Alias)
  local Transmitter = "Tower"
  local RadioObject = TOWER_RADIO
  local Title = string.format("%s %s", AI_ATC.Airbase, Transmitter)
  local ClientData = ATM.ClientData[Alias]
  local UnitObject = ClientData.Unit
  local Type = ClientData.Type
  local Group = UnitObject:GetGroup()
  local SchedulerObjects = ClientData.SchedulerObjects
  local Callsign = ClientData.Callsign
  local FlightCallsign = ClientData.FlightCallsign
  local Flight = ClientData.Flight
  local CallsignSub = Flight and FlightCallsign or Callsign
  local Delay = 1.5 + math.random() * (2.5 - 1.5)
  
  if AI_ATC:FunctionDelay(Alias, function() AI_ATC:TowerWinds(Alias) end, Transmitter)==false then
    return
  end
  
  USERSOUND:New("RADIO_TRANS_START.ogg"):ToUnit(UnitObject)
  
  local Airbase, AirbaseCoord, Height, WindDirection, WindSpeed
  
  SCHEDULER:New(nil, function()
    Airbase = AI_ATC_Airbase
    AirbaseCoord = Airbase:GetCoordinate()
    Height = AirbaseCoord:GetLandHeight()
    WindDirection, WindSpeed = AirbaseCoord:GetWind(Height +10)
    WindDirection = AI_ATC:RectifyHeading(tostring(math.floor(WindDirection + 0.5)))
    WindSpeed = (tostring(math.floor(UTILS.MpsToKnots(WindSpeed)- 0.5)))
  end, {}, 0.5)
  
  SCHEDULER:New(nil, function()
    AI_ATC:RepeatLastTransmission(Alias, function() AI_ATC:TowerWinds(Alias) end)
    local Subtitle = string.format("%s: %s, Wind is %s at %s.", Title, CallsignSub, WindDirection, WindSpeed)
    RadioObject:NewTransmission("DeadAir.ogg", 0.100, "Airbase_ATC/Ground/SoundFiles/", nil, 0.3, Subtitle, 6)
    AI_ATC:Callsign(Callsign, RadioObject, Transmitter, Flight)
    RadioObject:NewTransmission("Wind.ogg", 0.583, "Airbase_ATC/Ground/SoundFiles/", nil, 0.1)
    AI_ATC:ReadHeading(WindDirection, RadioObject, Transmitter)
    RadioObject:NewTransmission("At.ogg", 0.38, "Airbase_ATC/Ground/SoundFiles/", nil, 0.1)
    AI_ATC:ReadNumber(WindSpeed, RadioObject, Transmitter)
  end, {}, Delay)
end
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--******************************************************************************ATC GO AROUND***********************************************************************************--
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function AI_ATC:RunwayOccupied(Alias)
  local Transmitter = "Tower"
  local RadioObject = TOWER_RADIO
  local Title = string.format("%s %s", AI_ATC.Airbase, Transmitter)
  local ClientData = ATM.ClientData[Alias]
  local UnitObject = ClientData.Unit
  local Type = ClientData.Type
  local Group = UnitObject:GetGroup()
  local SchedulerObjects = ClientData.SchedulerObjects
  local Callsign = ClientData.Callsign
  local FlightCallsign = ClientData.FlightCallsign
  local Flight = ClientData.Flight
  local CallsignSub = Flight and FlightCallsign or Callsign
  local Delay = 1.5 + math.random() * (2.5 - 1.5)
  
  if AI_ATC:FunctionDelay(Alias, function() AI_ATC:RunwayOccupied(Alias) end, Transmitter)==false then
    return
  end
  
  USERSOUND:New("RADIO_TRANS_START.ogg"):ToUnit(UnitObject)
  
  SCHEDULER:New(nil, function()
    AI_ATC:RepeatLastTransmission(Alias, function() AI_ATC:RunwayOccupied(Alias) end)
    local Subtitle = string.format("%s: %s, Go around. Aircraft on the runway.", Title, CallsignSub)
    RadioObject:NewTransmission("DeadAir.ogg", 0.100, "Airbase_ATC/Ground/SoundFiles/", nil, 0.3, Subtitle, 4)
    AI_ATC:Callsign(Callsign, RadioObject, Transmitter, Flight)
    RadioObject:NewTransmission("GoAround2.ogg", 2.142, "Airbase_ATC/Ground/SoundFiles/", nil, 0.1)
  end, {}, Delay)
end
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--******************************************************************************ATC RUNWAY INSIGHT*******************************************************************************--
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function AI_ATC:AcknowledgeRunway(Alias)
  local Transmitter = "Tower"
  local Agency = "Tower"
  local Title = string.format("%s %s", AI_ATC.Airbase, Transmitter)
  local ClientData = ATM.ClientData[Alias]
  local UnitObject = ClientData.Unit
  local Type = ClientData.Type
  local Group = UnitObject:GetGroup()
  local SchedulerObjects = ClientData.SchedulerObjects
  local Callsign = ClientData.Callsign
  local Type = ClientData.Chart
  local FlightCallsign = ClientData.FlightCallsign
  local Flight = ClientData.Flight
  local CallsignSub = Flight and FlightCallsign or Callsign
  local Delay = 1.5 + math.random() * (2.5 - 1.5)
  
  if Type=="PAR" then
    Title = "Final Controller"
    Transmitter = "SFA"
  end
  
  local RadioObject = AI_ATC:FindTransmitter(Alias, Transmitter)
  
  if AI_ATC:FunctionDelay(Alias, function() AI_ATC:AcknowledgeRunway(Alias) end, Transmitter)==false then
    return
  end
  
  USERSOUND:New("RADIO_TRANS_START.ogg"):ToUnit(UnitObject)
  
  local function RunwayInsight()
    SCHEDULER:New(nil, function()
      AI_ATC:RepeatLastTransmission(Alias, function() AI_ATC:AcknowledgeRunway(Alias) end)
      local Subtitle = string.format("%s: %s, Copy Runway insight.", Title, CallsignSub)
      RadioObject:NewTransmission("DeadAir.ogg", 0.100, "Airbase_ATC/Ground/SoundFiles/", nil, 0.3, Subtitle, 4)
      AI_ATC:Callsign(Callsign, RadioObject, Agency, Flight)
      RadioObject:NewTransmission("RunwayInsight.ogg", 1.186, "Airbase_ATC/Ground/PAR/", nil, 0.1)
    end, {}, Delay)
  end

  RunwayInsight()

end
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--******************************************************************************ATC TOWER CHECKIN********************************************************************************--
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function AI_ATC:Tower_Checkin(Alias)
  local Transmitter = "Tower"
  local RadioKey = "Ground"
  local RadioObject = TOWER_RADIO
  local Title = string.format("%s %s", AI_ATC.Airbase, Transmitter)
  local ClientData = ATM.ClientData[Alias]
  local Unit = ClientData.Unit
  local Type = ClientData.Type
  local Group = Unit:GetGroup()
  local ClientCount = Group:CountAliveUnits()
  local SchedulerObjects = ClientData.SchedulerObjects
  local Callsign = ClientData.Callsign
  local FlightCallsign = ClientData.FlightCallsign
  local Flight = ClientData.Flight
  local CallsignSub = Flight and FlightCallsign or Callsign
  local Delay = 1.5 + math.random() * (2.5 - 1.5)
  
  if AI_ATC:FunctionDelay(Alias, function() AI_ATC:Tower_Checkin(Alias) end, Transmitter)==false then
    return
  end
  
  local ApproachTbl = {
    ["EAGLE"] = { filename = "EnterEagle.ogg", duration = 1.255 },
    ["TIGER"] = { filename = "EnterTiger.ogg", duration = 1.269 },
    ["FALCON"] = { filename = "EnterFalcon.ogg", duration = 1.303 },
  }
  
  local StateTbl = {
    ["Re-entering pattern"]  = {filename = "Reenter.ogg", duration = 0.917, subtitle = "re-entering Initial"},
    ["On Approach"]          = {filename = "OnApproach.ogg", duration = 0.719, subtitle = "on approach"},
    ["On Final Approach"]    = {filename = "OnFinal.ogg", duration = 0.570, subtitle = "on final"},
    ["Initial"]              = {filename = "AtInitial.ogg", duration = 0.606, subtitle = "at Initial"},
    ["in the Break"]         = {filename = "InTheBreak.ogg", duration = 0.564, subtitle = "in the break"},
    ["Left Downwind"]        = {filename = "LeftDownwind.ogg", duration = 0.947, subtitle = "on left downwind"},
    ["Right Downwind"]       = {filename = "RightDownwind.ogg", duration = 0.564, subtitle = "on right downwind"},
    ["Left Base"]            = {filename = "LeftBase.ogg", duration = 0.895, subtitle = "on left base"},
    ["Right Base"]           = {filename = "RightBase.ogg", duration = 0.893, subtitle = "on right base"},
    ["Low Key"]              = {filename = "LowKey.ogg", duration = 0.686, subtitle = "at Low Key"},
  }
  
  local Airbase, AirbaseCoord, AirbaseName, BreakZone, ApproachType, Subtitle, LandingSubtitle, SchedulerObject, SchedulerObject2, SchedulerObject3, SchedulerObject4
  local Height, WindDirection, WindSpeed, Runway, VisualApproach, Randomizer, RunwayHeading, RecipricolHeading, Break, Altitude, Report, LandingNo
  local Navpoint, Navpoint1, Navpoint2, Distance1, Distance2, UnitCoord, Soundfile, ReportSub, EntrySub, TerminalRange
  local TrafficType, TrafficAudio, TrafficState, TrafficSub, StateData, StateSub, count
  
  
  AI_ATC:TerminateSchedules(Alias)
  AI_ATC:ResetMenus(Alias)
  USERSOUND:New("RADIO_TRANS_START.ogg"):ToUnit(Unit)
  
  SCHEDULER:New(nil, function()
    Airbase = AI_ATC_Airbase
    AirbaseCoord = AI_ATC_Vec3
    AirbaseName = AI_ATC.Airbase
    BreakZone = ZONE_RADIUS:New("Break", AirbaseCoord:GetVec2(), 1828, nil)

    Height = AirbaseCoord:GetLandHeight()
    Altitude = Height*3.281 + 500
    WindDirection, WindSpeed = AirbaseCoord:GetWind(Height +10)
    WindDirection = AI_ATC:RectifyHeading(tostring(math.floor(WindDirection + 0.5)))
    WindSpeed = (tostring(math.floor(UTILS.MpsToKnots(WindSpeed)- 0.5)))
    Runway = AI_ATC.Runways.Landing[1]
    Randomizer = math.random(1, 2)
    RunwayHeading = AI_ATC.Runways.Landing[5]
    RecipricolHeading = (RunwayHeading + 180) % 360 
    
    if Runway=="05" then
      Break = "Right"
      Navpoint="EAGLE"
      TerminalRange = 3704
    else 
      Break = "Left"
      TerminalRange = 7408
      Navpoint1 = AI_ATC_Navpoints.TIGER:GetCoordinate()
      Navpoint2 = AI_ATC_Navpoints.FALCON:GetCoordinate()
      Distance1 = UnitCoord:Get2DDistance(Navpoint1)
      Distance2 = UnitCoord:Get2DDistance(Navpoint2)
      if Distance1 <= Distance2 then
        Navpoint = "TIGER"
      else
        Navpoint = "FALCON"
      end
    end
    Soundfile = ApproachTbl[Navpoint]
    EntrySub = "Enter via "..Navpoint.." and "
  end, {}, 0.2)
  
SCHEDULER:New(nil, function()
    ApproachType = ATM.ClientData[Alias].Landing.Procedure
    ATM.ClientData[Alias].Landing.Type = "Option"
    if not ATM.TowerControl[Alias] then
      ATM.TowerControl[Alias] = {RequestedApproach = ApproachType, State = "On Approach", Type = Type, Contacts = {}, Schedules = {}, Count = ClientCount }
    else
      ATM.TowerControl[Alias].RequestedApproach = ApproachType
      ATM.TowerControl[Alias].State = "On Approach"
    end
    if ApproachType == "Instrument Straight in" then
      count = 1
      for alias, data in pairs(ATM.TowerControl) do
        if alias ~= Alias then
          if StateTbl[data.State] then
            count = count + 1
            TrafficType = data.Type
            TrafficState = data.State
            StateData = StateTbl[TrafficState]
          end
        end
      end
    end
    SCHEDULER:New(nil, function()
      LandingNo = tostring(count or 1)
      if StateData and StateData.subtitle then
        StateSub = StateData.subtitle
        TrafficAudio = AI_ATC_SoundFiles[RadioKey].Aircraft[TrafficType]
      else
        StateSub = ""
      end
      if not TrafficType then TrafficType = "" end
      Report = "report 5 miles"
      ReportSub = EntrySub..Report
      TrafficSub = string.format("your number %s behind the %s %s", LandingNo, TrafficType, StateSub)
      Subtitle = string.format("%s: %s %s, %s, %s to runway %s .", Title, CallsignSub, Title, Report, TrafficSub, Runway)
    end, {}, 0.2)
  end, {}, 0.3)
    
  SCHEDULER:New(nil, function()
    if ApproachType == "Straight in" then
      Report = "report 5 mile straight in"
      ReportSub = EntrySub..Report
      Subtitle = string.format("%s: %s %s, %s, runway %s .", Title, CallsignSub, Title, ReportSub, Runway)
    elseif ApproachType == "Overhead" then
      Report = "report 5 mile initial"
      ReportSub = EntrySub..Report
      Subtitle = string.format("%s: %s %s, %s, runway %s .", Title, CallsignSub, Title, ReportSub, Runway)
    elseif ApproachType == "SFO" then
      Subtitle = string.format("%s: %s, %s, runway %s. %s turn out approved. Report High Key.", Title, CallsignSub, Title, Runway, Break)
    end
  end, {}, 0.6)
  
  local function Message()
    SCHEDULER:New(nil, function()
      AI_ATC:RepeatLastTransmission(Alias, function()Message() end)
      AI_ATC:ChannelOpen(12, Transmitter, Alias)
      RadioObject:NewTransmission("DeadAir.ogg", 0.100, "Airbase_ATC/Ground/SoundFiles/", nil, 0.3, Subtitle, 6)
      AI_ATC:Callsign(Callsign, RadioObject, Transmitter, Flight)
      AI_ATC:AirbaseName(AI_ATC.Airbase, RadioObject, Transmitter)
      if ApproachType == "Straight in" then
        RadioObject:NewTransmission("Tower.ogg", 0.384, "Airbase_ATC/Ground/SoundFiles/", nil, nil)
        RadioObject:NewTransmission(Soundfile.filename, Soundfile.duration, "Airbase_ATC/Ground/SoundFiles/", nil, 0.1)
        RadioObject:NewTransmission("5MileStraight.ogg", 1.567, "Airbase_ATC/Ground/SoundFiles/", nil, nil)
        RadioObject:NewTransmission("Runway.ogg", 0.473, "Airbase_ATC/Ground/SoundFiles/", nil, 0.1)
        AI_ATC:Runway(Runway, RadioObject, Transmitter)
      elseif ApproachType == "Instrument Straight in" then
        RadioObject:NewTransmission("Tower.ogg", 0.384, "Airbase_ATC/Ground/SoundFiles/", nil, nil)
        RadioObject:NewTransmission("Report5Miles.ogg", 1.242, "Airbase_ATC/Ground/SoundFiles/", nil, 0.1)
        RadioObject:NewTransmission("YourNumber.ogg", 0.522, "Airbase_ATC/Ground/SoundFiles/", nil, 0.1)
        AI_ATC:ReadDigits(LandingNo, RadioObject, Transmitter)
        if TrafficType and StateData and TrafficAudio then
          RadioObject:NewTransmission("Behind.ogg", 0.557, string.format("Airbase_ATC/%s/SoundFiles/", RadioKey), nil, 0.1, nil, 1.6)
          RadioObject:NewTransmission(string.format("Aircraft/%s", TrafficAudio.filename), TrafficAudio.duration, string.format("Airbase_ATC/%s/", RadioKey), nil, nil)
          RadioObject:NewTransmission(string.format("SoundFiles/%s", StateData.filename), StateData.duration, string.format("Airbase_ATC/%s/", RadioKey), nil, 0.03)
        end
        RadioObject:NewTransmission("ForRunway.ogg", 0.662, "Airbase_ATC/Ground/SoundFiles/", nil, nil)
        AI_ATC:Runway(Runway, RadioObject, Transmitter)
      elseif ApproachType == "Overhead" then
        RadioObject:NewTransmission("Tower.ogg", 0.384, "Airbase_ATC/Ground/SoundFiles/", nil, nil)
        RadioObject:NewTransmission(Soundfile.filename, Soundfile.duration, "Airbase_ATC/Ground/SoundFiles/", nil, 0.1)
        RadioObject:NewTransmission("5Mile.ogg", 1.798, "Airbase_ATC/Ground/SoundFiles/", nil, nil)
        AI_ATC:Runway(Runway, RadioObject, Transmitter)
      elseif ApproachType == "SFO" then
        RadioObject:NewTransmission("Tower.ogg", 0.384, "Airbase_ATC/Ground/SoundFiles/", nil, nil)
        RadioObject:NewTransmission("Runway.ogg", 0.473, "Airbase_ATC/Ground/SoundFiles/", nil, 0.1)
        AI_ATC:Runway(Runway, RadioObject, Transmitter)
        if Break == "Left" then
          RadioObject:NewTransmission("LeftTurnOut.ogg", 2.228, "Airbase_ATC/Ground/SoundFiles/", nil, 0.1)
        elseif Break == "Right" then
          RadioObject:NewTransmission("RightTurnOut.ogg", 2.311, "Airbase_ATC/Ground/SoundFiles/", nil, 0.01)
        end
      end
      AI_ATC:TowerTraffic(Alias)
    end, {}, Delay)
  end
  
  Message()
  
  local function BaseTurnFailsafe()
    SchedulerObject4 = SCHEDULER:New(nil, function()
      if ATM.ClientData[Alias] and Unit then
        local Coord = Unit:GetCoordinate()
        local Heading = tonumber(AI_ATC:CorrectHeading(Unit:GetHeading()))
        local Range = Coord:Get2DDistance(AirbaseCoord)
        local Angle = AI_ATC:AngularDifference(Heading, RunwayHeading)
        if Angle <= 10 and Range <= TerminalRange then
          AI_ATC:ReportInitial(Alias)
          SchedulerObject4:Stop()
        end
      else
        SchedulerObject4:Stop()
      end
    end, {}, 3, 3)
    table.insert(SchedulerObjects, SchedulerObject4)
  end
  
  local function HandleRecipricol()
    SchedulerObject3 = SCHEDULER:New(nil, function()
      if ATM.ClientData[Alias] and Unit then
        local Heading = tonumber(AI_ATC:CorrectHeading(Unit:GetHeading()))
        local Angle = AI_ATC:AngularDifference(Heading, RecipricolHeading)
        if Angle <= 20 then
          if ApproachType == "Overhead" then
            BaseTurnFailsafe()
            SchedulerObject3:Stop()
          elseif ApproachType == "SFO" then
            --BaseTurnFailsafe()
            --AI_ATC:ReportBaseSubMenu(Alias)
            SchedulerObject3:Stop()
          else
            SchedulerObject3:Stop()
          end
        end
      else
        SchedulerObject3:Stop()
      end
    end, {}, 3, 3)
    table.insert(SchedulerObjects, SchedulerObject3)
  end
  
  local function InitialBumper()
    SchedulerObject2 = SCHEDULER:New(nil, function()
      if ATM.ClientData[Alias] and Unit then
        local Coord = Unit:GetCoordinate()
        local Heading = tonumber(AI_ATC:CorrectHeading(Unit:GetHeading()))
        local Range = Coord:Get2DDistance(AirbaseCoord)
        local Angle = AI_ATC:AngularDifference(Heading, RunwayHeading)
        if Angle <= 10 and Range <= 7408 then
          if ApproachType == "Straight in" or ApproachType == "Instrument Straight in" then
            MESSAGE:New("Pilot did not report Initial", 20):ToUnit(Unit)
            AI_ATC:ReportInitial(Alias)
          elseif ApproachType == "Overhead" then
            MESSAGE:New("Pilot did not report Initial", 20):ToUnit(Unit)
            AI_ATC:Report5MileInitial(Alias)
            HandleRecipricol()
          end
          SchedulerObject2:Stop()
        end
      else
        SchedulerObject2:Stop()
      end
    end, {}, 3, 3)
    table.insert(SchedulerObjects, SchedulerObject2)
  end

  local function OverheadApproach()
    SchedulerObject = SCHEDULER:New(nil, function()
      if ATM.ClientData[Alias] and Unit then
        local Heading = tonumber(AI_ATC:CorrectHeading(Unit:GetHeading()))
        local Angle = AI_ATC:AngularDifference(Heading, RunwayHeading)
        if Unit:IsInZone(BreakZone) and Angle <= 10 then
          HandleRecipricol()
          SchedulerObject:Stop()
        end
      else
        SchedulerObject:Stop()
      end
    end, {}, 3, 3)
    table.insert(SchedulerObjects, SchedulerObject)
  end
  

  SCHEDULER:New(nil, function()
    if ApproachType == "Overhead" then
      AI_ATC:OverheadInitialSubMenu(Alias)
      InitialBumper()
    elseif ApproachType == "Straight in" or ApproachType == "Instrument Straight in" then
      AI_ATC:InitialSubMenu(Alias)
      InitialBumper()
    elseif ApproachType == "SFO" then
      OverheadApproach()
      AI_ATC:ReportHighKeyMenu(Alias)
    end
  end, {}, Delay + 0.2)

  SCHEDULER:New(nil, function()
    if AI_Wingman_2_Unit and AI_Wingman_2_Unit:IsAlive() and AI_Wingman.ActiveGroups[AI_Wingman_2].RTB~=true then 
      AI_Wingman:FlightRTB(AI_Wingman_2) 
      AI_Wingman.ActiveGroups[AI_Wingman_2].RTB = true
    end
    if AI_Wingman_3_Unit and AI_Wingman_3_Unit:IsAlive() and AI_Wingman.ActiveGroups[AI_Wingman_3].RTB~=true then
      AI_Wingman:FlightRTB(AI_Wingman_3)
      AI_Wingman.ActiveGroups[AI_Wingman_3].RTB = true
    end
    if AI_Wingman_4_Unit and AI_Wingman_4_Unit:IsAlive() and AI_Wingman.ActiveGroups[AI_Wingman_4].RTB~=true then
      AI_Wingman:FlightRTB(AI_Wingman_4)
      AI_Wingman.ActiveGroups[AI_Wingman_4].RTB = true
    end
  end, {}, Delay + 10)

end
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--******************************************************************************ATC REQUEST LANDING***********************************************************************************--
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function AI_ATC:HeloRequestLanding(Alias, Type)
  local Transmitter = "Tower"
  local RadioObject = TOWER_RADIO
  local Title = string.format("%s %s", AI_ATC.Airbase, Transmitter)
  local ClientData = ATM.ClientData[Alias]
  local Unit = ClientData.Unit
  local Heliport = ClientData.Heliport
  local Group = Unit:GetGroup()
  local SchedulerObjects = ClientData.SchedulerObjects
  local Callsign = ClientData.Callsign
  local FlightCallsign = ClientData.FlightCallsign
  local Flight = ClientData.Flight
  local CallsignSub = Flight and FlightCallsign or Callsign
  local Delay = 1.5 + math.random() * (2.5 - 1.5)
  
  local AirbaseCoord, AirbaseVec2, AirbaseZone, Height, WindDirection, WindSpeed, LandingZone, Runway, Base, Audio, SchedulerObject
  
  local AudioTbl = {
    ["05"] = { filename = "RightDownwind.ogg", duration = 2.578 },
    ["23"] = { filename = "LeftDownwind.ogg",  duration = 2.571 },
  }
  
  if AI_ATC:FunctionDelay(Alias, function() AI_ATC:HeloRequestLanding(Alias, Type) end, Transmitter)==false then
    return
  end
  
  USERSOUND:New("RADIO_TRANS_START.ogg"):ToUnit(Unit)
  AI_ATC:TerminateSchedules(Alias)
  AI_ATC:ResetMenus(Alias)
  AI_ATC:HeloBaseSubMenu(Alias, Type)

  SCHEDULER:New(nil, function()
    AirbaseCoord = AI_ATC_Vec3
    AirbaseVec2 = AI_ATC_Vec3:GetVec2()
    AirbaseZone = ZONE_RADIUS:New("AirbaseZone", AirbaseVec2, 2500)
    Height = AirbaseCoord:GetLandHeight()
    WindDirection, WindSpeed = AirbaseCoord:GetWind(Height +10)
    WindDirection = AI_ATC:RectifyHeading(tostring(math.floor(WindDirection + 0.5)))
    WindSpeed = (tostring(math.floor(UTILS.MpsToKnots(WindSpeed)- 0.5)))
    if Heliport then
      Runway = AI_ATC.Runways.Heliport[1]
    else
      Runway = AI_ATC.Runways.Landing[1]
    end
    if Runway=="05" then 
      Base="Right"
    else
      Base="Left"
    end
    Audio = AudioTbl[Runway]
  end, {}, 0.5 )
  
  local function ClosedCircuit()
    SCHEDULER:New(nil, function()
      AI_ATC:RepeatLastTransmission(Alias, function()ClosedCircuit() end)
      AI_ATC:ChannelOpen(12, Transmitter, Alias)
      local Subtitle = string.format("%s: %s %s, Runway %s, Join %s downwind at or below 1000 feet. Report base.", Title, CallsignSub, Title, Runway, Base)
      RadioObject:NewTransmission("DeadAir.ogg", 0.100, "Airbase_ATC/Ground/SoundFiles/", nil, 0.3, Subtitle, 7)
      AI_ATC:Callsign(Callsign, RadioObject, Transmitter, Flight)
      AI_ATC:AirbaseName(AI_ATC.Airbase, RadioObject, Transmitter)
      RadioObject:NewTransmission("Tower.ogg", 0.384, "Airbase_ATC/Ground/SoundFiles/", nil, nil)
      RadioObject:NewTransmission("Runway.ogg", 0.473, "Airbase_ATC/Ground/SoundFiles/", nil, 0.1)
      AI_ATC:Runway(Runway, RadioObject, Transmitter)
      RadioObject:NewTransmission(Audio.filename, Audio.duration, "Airbase_ATC/Ground/SoundFiles/", nil, 0.1)
      RadioObject:NewTransmission("ReportBase.ogg", 0.848, "Airbase_ATC/Ground/SoundFiles/", nil, 0.2)
    end, {}, Delay )
  end
  
  local function StraightIn()
    SCHEDULER:New(nil, function()
      AI_ATC:RepeatLastTransmission(Alias, function()ClosedCircuit() end)
      AI_ATC:ChannelOpen(12, Transmitter, Alias)
      local Subtitle = string.format("%s: %s %s, Runway %s, Report 3 miles.", Title, CallsignSub, Title, Runway)
      RadioObject:NewTransmission("DeadAir.ogg", 0.100, "Airbase_ATC/Ground/SoundFiles/", nil, 0.3, Subtitle, 7)
      AI_ATC:Callsign(Callsign, RadioObject, Transmitter, Flight)
      AI_ATC:AirbaseName(AI_ATC.Airbase, RadioObject, Transmitter)
      RadioObject:NewTransmission("Tower.ogg", 0.384, "Airbase_ATC/Ground/SoundFiles/", nil, nil)
      RadioObject:NewTransmission("Runway.ogg", 0.473, "Airbase_ATC/Ground/SoundFiles/", nil, 0.1)
      AI_ATC:Runway(Runway, RadioObject, Transmitter)
      RadioObject:NewTransmission("3Mile2.ogg", 1.072, "Airbase_ATC/Ground/SoundFiles/", nil, 0.2)
    end, {}, Delay )
  end
  
  if Type=="Closed traffic" then
    ClosedCircuit()
  else
    StraightIn()
  end  

end
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--****************************************************************************ATC REPORT HIGH KEY********************************************************************************--
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function AI_ATC:ReportKey(Alias, Key)
  local Transmitter = "Tower"
  local RadioObject = TOWER_RADIO
  local RadioKey = "Ground"
  local Title = string.format("%s %s", AI_ATC.Airbase, Transmitter)
  local ClientData = ATM.ClientData[Alias]
  local Unit = ClientData.Unit
  local Type = ClientData.Type
  local Group = Unit:GetGroup()
  local SchedulerObjects = ClientData.SchedulerObjects
  local Callsign = ClientData.Callsign
  local FlightCallsign = ClientData.FlightCallsign
  local Flight = ClientData.Flight
  local CallsignSub = Flight and FlightCallsign or Callsign
  local Runway = AI_ATC.Runways.Landing[1]
  local Delay = 1.5 + math.random() * (2.5 - 1.5)
  
  if AI_ATC:FunctionDelay(Alias, function() AI_ATC:ReportKey(Alias, Key) end, Transmitter)==false then
    return
  end

  local Break, ApproachType, Position, count, TrafficType, TrafficState, StateData, LandingNo, TrafficSub
  local StateSub, TrafficAudio, SequenceSub, SchedulerObject, SchedulerObject2
  local AirbaseCoord, UnitCoord, InitRange, RunwayHeading, ReciprocalHeading
  
  local StateTbl = {
    ["On Approach"]  = {filename = "OnApproach.ogg", duration = 0.719, subtitle = "on approach"},
    ["Re-entering pattern"]  = {filename = "OnApproach.ogg", duration = 0.719, subtitle = "on approach"},
    ["On Final Approach"]    = {filename = "OnFinal.ogg", duration = 0.570, subtitle = "on final"},
    ["Initial"]              = {filename = "AtInitial.ogg", duration = 0.606, subtitle = "at Initial"},
    ["in the Break"]         = {filename = "InTheBreak.ogg", duration = 0.564, subtitle = "in the break"},
    ["Left Downwind"]        = {filename = "OnLeftDownwind.ogg", duration = 0.947, subtitle = "on left downwind"},
    ["Right Downwind"]       = {filename = "OnRightDownwind.ogg", duration = 0.564, subtitle = "on right downwind"},
    ["Left Base"]            = {filename = "LeftBase.ogg", duration = 0.895, subtitle = "on left base"},
    ["Right Base"]           = {filename = "RightBase.ogg", duration = 0.893, subtitle = "on right base"},
    ["Low Key"]              = {filename = "LowKey.ogg", duration = 0.686, subtitle = "at Low Key"},
  }
  
  AI_ATC:TerminateSchedules(Alias)
  AI_ATC:ResetMenus(Alias)
  USERSOUND:New("RADIO_TRANS_START.ogg"):ToUnit(Unit)

  SCHEDULER:New(nil, function()
    if Runway=="05" then
      Break = "Right"
    elseif Runway=="23" then
      Break = "Left"
    end
    AirbaseCoord = AI_ATC_Vec3
    UnitCoord = Unit:GetCoordinate()
    InitRange = UnitCoord:Get2DDistance(AirbaseCoord)
    RunwayHeading = AI_ATC.Runways.Landing[5]
    ReciprocalHeading = (RunwayHeading + 180) % 360 
    ApproachType = ClientData.Landing.Procedure
    if ApproachType == "SFO" then
      Position = string.format("%s Key", Key)
    end
    if not ATM.TowerControl[Alias] then
      ATM.TowerControl[Alias] = {RequestedApproach = ApproachType, State = Position, Type = Type }
    else
      ATM.TowerControl[Alias].State = Position
    end
  end, {}, 0.5 )
  
  SCHEDULER:New(nil, function()
    local count = 1
    local OverheadCount = 1
    for alias, data in pairs(ATM.TowerControl) do
      if alias ~= Alias then
        if (data.State=="On Approach" or data.State=="On Final Approach" or data.State=="Re-entering pattern") and
        (data.RequestedApproach=="Straight in" or data.RequestedApproach=="Instrument Straight in") then
          count = count + 1
          TrafficType = data.Type
          TrafficState = data.State
          StateData = StateTbl[TrafficState]
        elseif data.RequestedApproach == "SFO" and data.State ~= "On Approach" and data.State ~= "High Key" then
          count = count + 1
          TrafficType = data.Type
          TrafficState = data.State
          StateData = StateTbl[TrafficState]
        elseif data.RequestedApproach=="Overhead" and data.State ~="On Approach" then
          count = count + 1
          TrafficType = data.Type
          TrafficState = data.State
          StateData = StateTbl[TrafficState]
        elseif data.RequestedApproach=="Closed traffic" then
          count = count + 1
          TrafficType = data.Type
          TrafficState = data.State
          StateData = StateTbl[TrafficState]
        end
      end
    end
    LandingNo = tostring(count)
    if TrafficType and StateData then
      TrafficAudio = AI_ATC_SoundFiles[RadioKey].Aircraft[TrafficType]
      StateSub = StateData.subtitle
      SequenceSub = string.format("You're number %s behind the %s %s for runway %s", LandingNo, TrafficType, StateSub, Runway)
    else
      SequenceSub = string.format("You're number %s for runway %s", LandingNo, Runway)
    end
  end, {}, 1.0 )
  
  local function HighKey()
    SCHEDULER:New(nil, function()
      AI_ATC:RepeatLastTransmission(Alias, function()HighKey() end)
      AI_ATC:ChannelOpen(5, Transmitter, Alias)
      local Subtitle = string.format("%s: %s, Report Low Key", Title, Callsign)
      RadioObject:NewTransmission("DeadAir.ogg", 0.100, "Airbase_ATC/Ground/SoundFiles/", nil, 0.3, Subtitle, 5)
      AI_ATC:Callsign(Callsign, RadioObject, Transmitter, false)
      RadioObject:NewTransmission("ReportLowKey.ogg", 0.921, "Airbase_ATC/Ground/SoundFiles/", nil, 0.1)
    end, {}, Delay )
  end
  
  local function LowKey()
    SCHEDULER:New(nil, function()
      AI_ATC:RepeatLastTransmission(Alias, function()LowKey() end)
      AI_ATC:ChannelOpen(5, Transmitter, Alias)
      local Subtitle = string.format("%s: %s, %s. Report base.", Title, Callsign, SequenceSub)
      RadioObject:NewTransmission("DeadAir.ogg", 0.100, "Airbase_ATC/Ground/SoundFiles/", nil, 0.3, Subtitle, 5)
      AI_ATC:Callsign(Callsign, RadioObject, Transmitter, false)
      RadioObject:NewTransmission("YourNumber.ogg", 0.522, "Airbase_ATC/Ground/SoundFiles/", nil, 0.1)
      AI_ATC:ReadDigits(LandingNo, RadioObject, Transmitter)
      if TrafficType and StateData then
        RadioObject:NewTransmission("Behind.ogg", 0.557, string.format("Airbase_ATC/%s/SoundFiles/", RadioKey), nil, 0.1, nil, 1.6)
        RadioObject:NewTransmission(string.format("Aircraft/%s", TrafficAudio.filename), TrafficAudio.duration, string.format("Airbase_ATC/%s/", RadioKey), nil, nil)
        RadioObject:NewTransmission(string.format("SoundFiles/%s", StateData.filename), StateData.duration, string.format("Airbase_ATC/%s/", RadioKey), nil, 0.03)
      end
      RadioObject:NewTransmission("ForRunway.ogg", 0.662, "Airbase_ATC/Ground/SoundFiles/", nil, nil)
      AI_ATC:Runway(Runway, RadioObject, Transmitter)
      RadioObject:NewTransmission("ReportBase.ogg", 0.848, "Airbase_ATC/Ground/SoundFiles/", nil, 0.2)
    end, {}, Delay )
  end

  local function BaseTurnFailsafe()
    SchedulerObject2 = SCHEDULER:New(nil, function()
      if ATM.ClientData[Alias] and Unit then
        local Coord = Unit:GetCoordinate()
        local Heading = tonumber(AI_ATC:CorrectHeading(Unit:GetHeading()))
        local Range = Coord:Get2DDistance(AirbaseCoord)
        local Angle = AI_ATC:AngularDifference(Heading, RunwayHeading)
        if Angle <= 10 and Range <= 7408 then
          AI_ATC:ReportInitial(Alias)
          SchedulerObject2:Stop()
        elseif Range >= 16668 then
          MESSAGE:New("Exceeded 9Nm from Incirlik", 20):ToUnit(Unit)
          AI_ATC:SayIntentions(Alias)
          SchedulerObject2:Stop()
        end
      else
        SchedulerObject2:Stop()
      end
    end, {}, 2, 1)
    table.insert(SchedulerObjects, SchedulerObject2)
  end
  
  local function BaseTurnFailSafe()
    SchedulerObject = SCHEDULER:New(nil, function()
      if ATM.ClientData[Alias] and Unit then
        local Airborne = Unit:InAir()
        local Coord = Unit:GetCoordinate()
        local Heading = tonumber(AI_ATC:CorrectHeading(Unit:GetHeading()))
        local Range = Coord:Get2DDistance(AirbaseCoord)
        local Angle = AI_ATC:AngularDifference(Heading, ReciprocalHeading)
        if Range <= 5556 and Angle <= 10 then
          BaseTurnFailsafe()
          SchedulerObject:Stop()
        elseif Range >= 16668 then
          MESSAGE:New("Exceeded 9Nm from Incirlik", 20):ToUnit(Unit)
          AI_ATC:SayIntentions(Alias)
          SchedulerObject:Stop()
        elseif not Airborne then
          AI_ATC:LandingManager(Alias)
          SchedulerObject:Stop()
        end
      else
        SchedulerObject:Stop()
      end
    end, {}, 2, 1)
    table.insert(SchedulerObjects, SchedulerObject)
  end
  
  if Key=="High" then
    HighKey()
    AI_ATC:ReportLowKeyMenu(Alias)
  else
    LowKey()
    BaseTurnFailSafe()
    AI_ATC:ReportBaseSubMenu(Alias)
  end

end
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--****************************************************************************ATC REPORT INITIAL*********************************************************************************--
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function AI_ATC:Report5MileInitial(Alias)
  local Transmitter = "Tower"
  local RadioObject = TOWER_RADIO
  local RadioKey = "Ground"
  local Title = string.format("%s %s", AI_ATC.Airbase, Transmitter)
  local ClientData = ATM.ClientData[Alias]
  local Unit = ClientData.Unit
  local Type = ClientData.Type
  local Group = Unit:GetGroup()
  local ClientCount = Group:CountAliveUnits()
  local SchedulerObjects = ClientData.SchedulerObjects
  local Callsign = ClientData.Callsign
  local FlightCallsign = ClientData.FlightCallsign
  local Flight = ClientData.Flight
  local CallsignSub = Flight and FlightCallsign or Callsign
  local Runway = AI_ATC.Runways.Landing[1]
  local Delay = 1.5 + math.random() * (2.5 - 1.5)
  
  local AirbaseCoord, RunwayHeading, ReciprocalHeading, UnitCoord, InitRange, InitialRange, Break, LandingNo, LandingType, SchedulerObject, SchedulerObject2
  local TrafficType, TrafficState, StateData, TrafficAudio, StateSub, SequenceSub, SchedulerObject3, Maneuver, BreakData
  
  if AI_ATC:FunctionDelay(Alias, function() AI_ATC:Report5MileInitial(Alias) end, Transmitter)==false then
    return
  end
  
  local BreakTbl = {
    ["Left"] = {
      ["Approach"] = {filename = "LeftBreakApp.ogg", duration = 1.462, subtitle = "Left break over the numbers"},
      ["Midfield"] = {filename = "LeftBreakMid.ogg", duration = 1.300, subtitle = "Left break mid field"},
      ["Departure"] = {filename = "LeftBreak.ogg", duration = 1.254, subtitle = "Left break departure end"},
    },
    ["Right"] = {
      ["Approach"] = {filename = "RightBreakApp.ogg", duration = 1.429, subtitle = "Right break over the numbers"},
      ["Midfield"] = {filename = "RightBreakMid.ogg", duration = 1.231, subtitle = "Right break mid field"},
      ["Departure"] = {filename = "RightBreak.ogg", duration = 1.254, subtitle = "Right break departure end"},
    }
  }
  
  local StateTbl = {
    ["On Approach"]  = {filename = "OnApproach.ogg", duration = 0.719, subtitle = "on approach"},
    ["Re-entering pattern"]  = {filename = "OnApproach.ogg", duration = 0.719, subtitle = "on approach"},
    ["On Final Approach"]    = {filename = "OnFinal.ogg", duration = 0.570, subtitle = "on final"},
    ["Initial"]              = {filename = "AtInitial.ogg", duration = 0.606, subtitle = "at Initial"},
    ["in the Break"]         = {filename = "InTheBreak.ogg", duration = 0.564, subtitle = "in the break"},
    ["Left Downwind"]        = {filename = "OnLeftDownwind.ogg", duration = 0.947, subtitle = "on left downwind"},
    ["Right Downwind"]       = {filename = "OnRightDownwind.ogg", duration = 0.564, subtitle = "on right downwind"},
    ["Left Base"]            = {filename = "LeftBase.ogg", duration = 0.895, subtitle = "on left base"},
    ["Right Base"]           = {filename = "RightBase.ogg", duration = 0.893, subtitle = "on right base"},
    ["Low Key"]              = {filename = "LowKey.ogg", duration = 0.686, subtitle = "at Low Key"},
  }
  
  AI_ATC:TerminateSchedules(Alias)
  AI_ATC:ResetMenus(Alias)
  AI_ATC:ReportBaseSubMenu(Alias)
  USERSOUND:New("RADIO_TRANS_START.ogg"):ToUnit(Unit)
  
  local function InitData()
    local count = 1
    local OverheadCount = 1
    for alias, data in pairs(ATM.TowerControl) do
      if alias ~= Alias then
        if (data.State=="On Approach" or data.State=="On Final Approach" or data.State=="Re-entering pattern") and
        (data.RequestedApproach=="Straight in" or data.RequestedApproach=="Instrument Straight in") then
          count = count + 1
          TrafficType = data.Type
          TrafficState = data.State
          StateData = StateTbl[TrafficState]
        elseif data.RequestedApproach == "SFO" and data.State ~= "On Approach" and data.State ~= "High Key" then
          count = count + 1
          TrafficType = data.Type
          TrafficState = data.State
          StateData = StateTbl[TrafficState]
        elseif data.RequestedApproach=="Overhead" and data.State ~="On Approach" then
          count = count + 1
          TrafficType = data.Type
          TrafficState = data.State
          StateData = StateTbl[TrafficState]
        elseif data.RequestedApproach=="Closed traffic" then
          count = count + 1
          TrafficType = data.Type
          TrafficState = data.State
          StateData = StateTbl[TrafficState]
        end
      end
    end
    SCHEDULER:New(nil, function()
      if count==1 then
        Maneuver = "Approach"
      elseif count==2 then
        Maneuver = "Midfield"
      elseif count > 2 then
        Maneuver = "Departure"
      end
      LandingNo = tostring(count)
      if TrafficType and StateData then
        TrafficAudio = AI_ATC_SoundFiles[RadioKey].Aircraft[TrafficType]
        StateSub = StateData.subtitle
        SequenceSub = string.format("You're number %s behind the %s %s for runway %s", LandingNo, TrafficType, StateSub, Runway)
      else
        SequenceSub = string.format("You're number %s for runway %s", LandingNo, Runway)
      end
    end, {}, 0.2 )
  end
  
  InitData()
  
  SCHEDULER:New(nil, function()
    if not ATM.TowerControl[Alias] then
      ATM.TowerControl[Alias] = {RequestedApproach = "Overhead", State = "Initial", Type = Type, Contacts = {}, Schedules = {}, Count = ClientCount }
    else
      ATM.TowerControl[Alias].RequestedApproach = "Overhead"
      ATM.TowerControl[Alias].State = "Initial"
    end
    AirbaseCoord = AI_ATC_Vec3
    UnitCoord = Unit:GetCoordinate()
    InitRange = UnitCoord:Get2DDistance(AirbaseCoord)
    RunwayHeading = AI_ATC.Runways.Landing[5]
    ReciprocalHeading = (RunwayHeading + 180) % 360 
    LandingType = ATM.ClientData[Alias].Landing.Type
    if Runway=="05" then
      Break = "Right"
    else
      Break = "Left"
    end
    if Maneuver then
      BreakData = BreakTbl[Break][Maneuver]
    end
  end, {}, 0.5 )
  
  local function ExtendDownwind()
    if AI_ATC:FunctionDelay(Alias, function() ExtendDownwind() end, Transmitter)==false then return end
    AI_ATC:RepeatLastTransmission(Alias, function()ExtendDownwind() end)
    AI_ATC:ChannelOpen(7, Transmitter, Alias)
    InitData()
    SCHEDULER:New(nil, function()
      local Subtitle = string.format("%s: %s, Extend downwind. %s.", Title, CallsignSub, SequenceSub)
      RadioObject:NewTransmission("DeadAir.ogg", 0.100, "Airbase_ATC/Ground/SoundFiles/", nil, 0.3, Subtitle, 7)
      AI_ATC:Callsign(Callsign, RadioObject, Transmitter, Flight)
      RadioObject:NewTransmission("Extend.ogg", 0.978, "Airbase_ATC/Ground/SoundFiles/", nil, 0.1)
      RadioObject:NewTransmission("YourNumber.ogg", 0.522, "Airbase_ATC/Ground/SoundFiles/", nil, 0.1)
      AI_ATC:ReadDigits(LandingNo, RadioObject, Transmitter)
      if TrafficType and StateData and TrafficAudio then
        RadioObject:NewTransmission("Behind.ogg", 0.557, "Airbase_ATC/Ground/SoundFiles/", nil, 0.1)
        RadioObject:NewTransmission(string.format("Aircraft/%s", TrafficAudio.filename), TrafficAudio.duration, string.format("Airbase_ATC/%s/", RadioKey), nil, nil)
        RadioObject:NewTransmission(string.format("SoundFiles/%s", StateData.filename), StateData.duration, string.format("Airbase_ATC/%s/", RadioKey), nil, 0.03)
      end
      RadioObject:NewTransmission("ForRunway.ogg", 0.662, "Airbase_ATC/Ground/SoundFiles/", nil, nil)
      AI_ATC:Runway(Runway, RadioObject, Transmitter)
    end, {}, 0.5 )
  end
  
  local function Message()
    SCHEDULER:New(nil, function()
      AI_ATC:RepeatLastTransmission(Alias, function()Message() end)
      AI_ATC:ChannelOpen(12, Transmitter, Alias)
      local Subtitle = string.format("%s: %s, %s. %s, %s. Report base.", Title, CallsignSub, Title, SequenceSub, BreakData.subtitle)
      RadioObject:NewTransmission("DeadAir.ogg", 0.100, "Airbase_ATC/Ground/SoundFiles/", nil, 0.3, Subtitle, 7)
      AI_ATC:Callsign(Callsign, RadioObject, Transmitter, Flight)
      AI_ATC:AirbaseName(AI_ATC.Airbase, RadioObject, Transmitter)
      RadioObject:NewTransmission("Tower.ogg", 0.384, "Airbase_ATC/Ground/SoundFiles/", nil, nil)
      
      RadioObject:NewTransmission("YourNumber.ogg", 0.522, "Airbase_ATC/Ground/SoundFiles/", nil, 0.1)
      AI_ATC:ReadDigits(LandingNo, RadioObject, Transmitter)
      if TrafficType and StateData then
        RadioObject:NewTransmission("Behind.ogg", 0.557, string.format("Airbase_ATC/%s/SoundFiles/", RadioKey), nil, 0.1, nil, 1.6)
        RadioObject:NewTransmission(string.format("Aircraft/%s", TrafficAudio.filename), TrafficAudio.duration, string.format("Airbase_ATC/%s/", RadioKey), nil, nil)
        RadioObject:NewTransmission(string.format("SoundFiles/%s", StateData.filename), StateData.duration, string.format("Airbase_ATC/%s/", RadioKey), nil, 0.03)
      end
      RadioObject:NewTransmission("ForRunway.ogg", 0.662, "Airbase_ATC/Ground/SoundFiles/", nil, nil)
      AI_ATC:Runway(Runway, RadioObject, Transmitter)
      RadioObject:NewTransmission(BreakData.filename, BreakData.duration, "Airbase_ATC/Ground/SoundFiles/", nil, 0.01)
      RadioObject:NewTransmission("ReportBase.ogg", 0.848, "Airbase_ATC/Ground/SoundFiles/", nil, 0.2)
    end, {}, Delay )
  end
  
  Message()
  
  local function ExtendSchedule()
    SchedulerObject3 = SCHEDULER:New(nil, function()
      for alias, data in pairs(ATM.TowerControl) do
        if alias ~= Alias then
          local AppTyp = data.RequestedApproach
          local State = data.State
          if (AppTyp=="Straight in" or AppTyp=="Instrument Straight in") and StateTbl[State]then
            local ExtGrp = GROUP:FindByName(alias)
            local ExtCoord = ExtGrp:GetCoordinate()
            local ExtRange = ExtCoord:Get2DDistance(AirbaseCoord)
            if ExtRange >= 4630 and ExtRange <= 14816 and ATM.TowerControl[Alias].Contacts[alias] then
              ExtendDownwind()
              SchedulerObject3:Stop()
            end
          end
        end
      end
    end, {}, 3, 3)
    table.insert(SchedulerObjects, SchedulerObject3)
  end
  
  local function BaseTurnFailsafe()
    ExtendSchedule()
    SchedulerObject2 = SCHEDULER:New(nil, function()
      if ATM.ClientData[Alias] and Unit then
        local Coord = Unit:GetCoordinate()
        local Heading = tonumber(AI_ATC:CorrectHeading(Unit:GetHeading()))
        local Range = Coord:Get2DDistance(AirbaseCoord)
        local Angle = AI_ATC:AngularDifference(Heading, RunwayHeading)
        if Angle <= 10 and Range <= 7408 then
          AI_ATC:ReportInitial(Alias)
          SchedulerObject2:Stop()
        elseif Range >= 16668 then
          MESSAGE:New("Exceeded 9Nm from Incirlik", 20):ToUnit(Unit)
          AI_ATC:SayIntentions(Alias)
          SchedulerObject2:Stop()
        end
      else
        SchedulerObject2:Stop()
      end
    end, {}, 2, 1)
    table.insert(SchedulerObjects, SchedulerObject2)
  end
  
  SchedulerObject = SCHEDULER:New(nil, function()
    if ATM.ClientData[Alias] and Unit then
      local Airborne = Unit:InAir()
      local Coord = Unit:GetCoordinate()
      local Heading = tonumber(AI_ATC:CorrectHeading(Unit:GetHeading()))
      local Range = Coord:Get2DDistance(AirbaseCoord)
      local Angle = AI_ATC:AngularDifference(Heading, ReciprocalHeading)
      if Range <= 5556 and Angle <= 10 then
        BaseTurnFailsafe()
        SchedulerObject:Stop()
      elseif Range >= 16668 then
        MESSAGE:New("Exceeded 9Nm from Incirlik", 20):ToUnit(Unit)
        AI_ATC:SayIntentions(Alias)
        SchedulerObject:Stop()
      elseif not Airborne then
        AI_ATC:LandingManager(Alias)
        SchedulerObject:Stop()
      end
    else
      SchedulerObject:Stop()
    end
  end, {}, 2, 1)
  table.insert(SchedulerObjects, SchedulerObject)
  
end
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--****************************************************************************ATC REPORT INITIAL*********************************************************************************--
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function AI_ATC:ReportInitial(Alias)
  local Transmitter = "Tower"
  local RadioObject = TOWER_RADIO
  local Title = string.format("%s %s", AI_ATC.Airbase, Transmitter)
  local ClientData = ATM.ClientData[Alias]
  local Unit = ClientData.Unit
  local Type = ClientData.Type
  local Group = Unit:GetGroup()
  local SchedulerObjects = ClientData.SchedulerObjects
  local Callsign = ClientData.Callsign
  local FlightCallsign = ClientData.FlightCallsign
  local Flight = ClientData.Flight
  local CallsignSub = Flight and FlightCallsign or Callsign
  local Runway = AI_ATC.Runways.Landing[1]
  local Delay = 1.5 + math.random() * (2.5 - 1.5)
  
  if AI_ATC:FunctionDelay(Alias, function() AI_ATC:ReportInitial(Alias) end, Transmitter)==false then
    return
  end

  local Airbase, AirbaseCoord, AirbaseName, BreakZone, LandingType, Subtitle, LandingSubtitle, ApproachType, Position
  local Height, WindDirection, WindSpeed, VisualApproach, Randomizer, RunwayHeading, RecipricolHeading, Break
  
  AI_ATC:TerminateSchedules(Alias)
  AI_ATC:ResetMenus(Alias)
  AI_ATC:GoAroundSubMenu(Alias)
  USERSOUND:New("RADIO_TRANS_START.ogg"):ToUnit(Unit)
  
  if Runway=="05"  then
    Break = "Right"
  else
    Break = "Left"
  end
  
  SCHEDULER:New(nil, function()
    
    ApproachType = ClientData.Landing.Procedure
    if ApproachType == "Straight in" or ApproachType == "Instrument Straight in" then
      Position = "On Final Approach"
    elseif ApproachType == "Overhead" then
      Position = string.format("%s Base", Break)
    end
    if not ATM.TowerControl[Alias] then
      ATM.TowerControl[Alias] = {RequestedApproach = ApproachType, State = Position, Type = Type }
    else
      if ATM.TowerControl[Alias].RequestedApproach == "Closed traffic" then
        ATM.TowerControl[Alias].State = string.format("%s Base", Break)
      else
        ATM.TowerControl[Alias].State = Position
      end
    end
    if Flight then
      AI_ATC:WingmanBaseSubMenu(Alias)
    end
  end, {}, 0.5 )
  
  SCHEDULER:New(nil, function()
    Airbase = AI_ATC_Airbase
    AirbaseCoord = Airbase:GetCoordinate()
    LandingType = ATM.ClientData[Alias].Landing.Type
    if LandingType=="Full Stop" then
      LandingSubtitle = "Cleared to land"
    elseif LandingType=="Touch and Go" then
      LandingSubtitle = "Cleared Touch and Go"
    elseif LandingType=="Low Approach" then
      LandingSubtitle = "Cleared low Approach"
    elseif LandingType=="Option" then
      LandingSubtitle = "Cleared for the option"
    end
    Height = AirbaseCoord:GetLandHeight()
    WindDirection, WindSpeed = AirbaseCoord:GetWind(Height +10)
    WindDirection = AI_ATC:RectifyHeading(tostring(math.floor(WindDirection + 0.5)))
    WindSpeed = (tostring(math.floor(UTILS.MpsToKnots(WindSpeed)- 0.5)))
  end, {}, 1.0 )
  
  local function Message()
    SCHEDULER:New(nil, function()
      AI_ATC:RepeatLastTransmission(Alias, function()Message() end)
      AI_ATC:ChannelOpen(12, Transmitter, Alias)
      local Subtitle = string.format("%s: %s, check gear down, Runway %s. Wind %s at %s. ", Title, CallsignSub, Runway, WindDirection, WindSpeed)
      Subtitle = Subtitle .. LandingSubtitle
      RadioObject:NewTransmission("DeadAir.ogg", 0.100, "Airbase_ATC/Ground/SoundFiles/", nil, 0.3, Subtitle, 7)
      AI_ATC:Callsign(Callsign, RadioObject, Transmitter, Flight)
      RadioObject:NewTransmission("CheckGear.ogg", 0.692, "Airbase_ATC/Ground/SoundFiles/", nil, 0.1)
      RadioObject:NewTransmission("Runway.ogg", 0.473, "Airbase_ATC/Ground/SoundFiles/", nil, 0.01)
      AI_ATC:Runway(Runway, RadioObject, Transmitter)
      RadioObject:NewTransmission("Wind.ogg", 0.583, "Airbase_ATC/Ground/SoundFiles/", nil, 0.1)
      AI_ATC:ReadHeading(WindDirection, RadioObject, Transmitter)
      RadioObject:NewTransmission("At.ogg", 0.38, "Airbase_ATC/Ground/SoundFiles/", nil, 0.1)
      AI_ATC:ReadNumber(WindSpeed, RadioObject, Transmitter)
      if LandingType == "Full Stop" then
        RadioObject:NewTransmission("ClearedToLand.ogg", 0.784, "Airbase_ATC/Ground/SoundFiles/", nil, 0.05)
      elseif LandingType == "Touch and Go" then
        RadioObject:NewTransmission("ClearedTouchGo.ogg", 0.964, "Airbase_ATC/Ground/SoundFiles/", nil, 0.05)
      elseif LandingType == "Low Approach" then
        RadioObject:NewTransmission("ClearedLowApproach.ogg", 1.109, "Airbase_ATC/Ground/SoundFiles/", nil, 0.05)
      elseif LandingType == "Option" then
        RadioObject:NewTransmission("Option.ogg", 1.115, "Airbase_ATC/Ground/SoundFiles/", nil, 0.05)
      end
    end, {}, Delay )
  end
  
  Message()

  SCHEDULER:New(nil, function()
    AI_ATC:LandingManager(Alias)
  end, {}, Delay + 10 )

end
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--****************************************************************************HELO REPORT BASE***********************************************************************************--
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function AI_ATC:HeloBase(Alias)
  local Transmitter = "Tower"
  local RadioObject = TOWER_RADIO
  local Title = string.format("%s %s", AI_ATC.Airbase, Transmitter)
  local ClientData = ATM.ClientData[Alias]
  local Unit = ClientData.Unit
  local Type = ClientData.Type
  local Heliport = ClientData.Heliport
  local Group = Unit:GetGroup()
  local SchedulerObjects = ClientData.SchedulerObjects
  local Callsign = ClientData.Callsign
  local FlightCallsign = ClientData.FlightCallsign
  local Flight = ClientData.Flight
  local CallsignSub = Flight and FlightCallsign or Callsign
  local Delay = 1.5 + math.random() * (2.5 - 1.5)
  
  if AI_ATC:FunctionDelay(Alias, function() AI_ATC:HeloBase(Alias) end, Transmitter)==false then
    return
  end

  local Airbase, AirbaseCoord, AirbaseName, BreakZone, LandingType, Subtitle, LandingSubtitle, ApproachType, Position
  local Height, WindDirection, WindSpeed, Runway, VisualApproach, Randomizer, RunwayHeading, RecipricolHeading, Break
  
  AI_ATC:TerminateSchedules(Alias)
  AI_ATC:ResetMenus(Alias)
  USERSOUND:New("RADIO_TRANS_START.ogg"):ToUnit(Unit)
  
  SCHEDULER:New(nil, function()
    Airbase = AI_ATC_Airbase
    AirbaseCoord = Airbase:GetCoordinate()
    LandingSubtitle = "Cleared to land"
    Height = AirbaseCoord:GetLandHeight()
    WindDirection, WindSpeed = AirbaseCoord:GetWind(Height +10)
    WindDirection = AI_ATC:RectifyHeading(tostring(math.floor(WindDirection + 0.5)))
    WindSpeed = (tostring(math.floor(UTILS.MpsToKnots(WindSpeed)- 0.5)))
    if Heliport then
      Runway = AI_ATC.Runways.Heliport[1]
    else
      Runway = AI_ATC.Runways.Landing[1]
    end
  end, {}, 0.5 )
  
  local function Message()
    SCHEDULER:New(nil, function()
      AI_ATC:RepeatLastTransmission(Alias, function()Message() end)
      AI_ATC:ChannelOpen(12, Transmitter, Alias)
      local Subtitle = string.format("%s: %s, Runway %s. Wind %s at %s. ", Title, CallsignSub, Runway, WindDirection, WindSpeed)
      Subtitle = Subtitle .. LandingSubtitle
      RadioObject:NewTransmission("DeadAir.ogg", 0.100, "Airbase_ATC/Ground/SoundFiles/", nil, 0.3, Subtitle, 7)
      AI_ATC:Callsign(Callsign, RadioObject, Transmitter, Flight)
      RadioObject:NewTransmission("Runway.ogg", 0.473, "Airbase_ATC/Ground/SoundFiles/", nil, 0.01)
      AI_ATC:Runway(Runway, RadioObject, Transmitter)
      RadioObject:NewTransmission("Wind.ogg", 0.583, "Airbase_ATC/Ground/SoundFiles/", nil, 0.1)
      AI_ATC:ReadHeading(WindDirection, RadioObject, Transmitter)
      RadioObject:NewTransmission("At.ogg", 0.38, "Airbase_ATC/Ground/SoundFiles/", nil, 0.1)
      AI_ATC:ReadNumber(WindSpeed, RadioObject, Transmitter)
      RadioObject:NewTransmission("ClearedToLand.ogg", 0.784, "Airbase_ATC/Ground/SoundFiles/", nil, 0.05)
    end, {}, Delay )
  end
  
  Message()

  SCHEDULER:New(nil, function()
    AI_ATC:HeloLandingManager(Alias)
  end, {}, Delay + 10 )

end
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--************************************************************************ATC WINGMAN REPORT BASE********************************************************************************--
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function AI_ATC:WingmanReportBase(Alias, LandingType, Integer)
  local Transmitter = "Tower"
  local RadioObject = TOWER_RADIO
  local Title = string.format("%s %s", AI_ATC.Airbase, Transmitter)
  local ClientData = ATM.ClientData[Alias]
  local Unit = ClientData.Unit
  local Type = ClientData.Type
  local Group = Unit:GetGroup()
  local SchedulerObjects = ClientData.SchedulerObjects
  local Callsign = ClientData.Callsign
  local FlightCallsign = ClientData.FlightCallsign
  local Flight = ClientData.Flight
  local CallsignSub = Flight and FlightCallsign or Callsign
  local Runway = AI_ATC.Runways.Landing[1]
  local Delay = 1.5 + math.random() * (2.5 - 1.5)
  
  if AI_ATC:FunctionDelay(Alias, function() AI_ATC:WingmanReportBase(Alias, LandingType, Integer) end, Transmitter)==false then
    return
  end

  local Airbase, AirbaseCoord, AirbaseName, BreakZone, Subtitle, LandingSubtitle, ApproachType, Position
  local Height, WindDirection, WindSpeed, VisualApproach, Randomizer, RunwayHeading, RecipricolHeading, Break

  USERSOUND:New("RADIO_TRANS_START.ogg"):ToUnit(Unit)
  
  Callsign = string.sub(Callsign, 1, -2) .. Integer
  
  SCHEDULER:New(nil, function()
    Airbase = AI_ATC_Airbase
    AirbaseCoord = Airbase:GetCoordinate()
    if LandingType=="Full Stop" then
      LandingSubtitle = "Cleared to land"
    elseif LandingType=="Touch and Go" then
      LandingSubtitle = "Cleared Touch and Go"
    elseif LandingType=="Low Approach" then
      LandingSubtitle = "Cleared low Approach"
    elseif LandingType=="Option" then
      LandingSubtitle = "Cleared for the option"
    end
    Height = AirbaseCoord:GetLandHeight()
    WindDirection, WindSpeed = AirbaseCoord:GetWind(Height +10)
    WindDirection = AI_ATC:RectifyHeading(tostring(math.floor(WindDirection + 0.5)))
    WindSpeed = (tostring(math.floor(UTILS.MpsToKnots(WindSpeed)- 0.5)))
    if ATM.ClientData[Alias].Wingman2Menu then
      ATM.ClientData[Alias].Wingman2Menu:RemoveSubMenus()
      ATM.ClientData[Alias].Wingman3Menu:RemoveSubMenus()
      ATM.ClientData[Alias].Wingman4Menu:RemoveSubMenus()
      AI_ATC:WingmanClosedSubMenu(Alias)
    end
  end, {}, 0.5 )
  
  local function Message()
    SCHEDULER:New(nil, function()
      AI_ATC:RepeatLastTransmission(Alias, function()Message() end)
      AI_ATC:ChannelOpen(12, Transmitter, Alias)
      local Subtitle = string.format("%s: %s, Wind %s at %s. ", Title, Callsign, WindDirection, WindSpeed)
      Subtitle = Subtitle .. LandingSubtitle
      RadioObject:NewTransmission("DeadAir.ogg", 0.100, "Airbase_ATC/Ground/SoundFiles/", nil, 0.3, Subtitle, 7)
      AI_ATC:Callsign(Callsign, RadioObject, Transmitter, false)
      RadioObject:NewTransmission("Wind.ogg", 0.583, "Airbase_ATC/Ground/SoundFiles/", nil, 0.1)
      AI_ATC:ReadHeading(WindDirection, RadioObject, Transmitter)
      RadioObject:NewTransmission("At.ogg", 0.38, "Airbase_ATC/Ground/SoundFiles/", nil, 0.1)
      AI_ATC:ReadNumber(WindSpeed, RadioObject, Transmitter)
      if LandingType == "Full Stop" then
        RadioObject:NewTransmission("ClearedToLand.ogg", 0.784, "Airbase_ATC/Ground/SoundFiles/", nil, 0.05)
      elseif LandingType == "Touch and Go" then
        RadioObject:NewTransmission("ClearedTouchGo.ogg", 0.964, "Airbase_ATC/Ground/SoundFiles/", nil, 0.05)
      elseif LandingType == "Low Approach" then
        RadioObject:NewTransmission("ClearedLowApproach.ogg", 1.109, "Airbase_ATC/Ground/SoundFiles/", nil, 0.05)
      elseif LandingType == "Option" then
        RadioObject:NewTransmission("Option.ogg", 1.115, "Airbase_ATC/Ground/SoundFiles/", nil, 0.05)
      end
    end, {}, Delay )
  end
  
  Message()

end
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--****************************************************************************ATC CLOSED TRAFFIC*********************************************************************************--
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function AI_ATC:ClosedTraffic(Alias, audio)
  local Transmitter = "Tower"
  local RadioObject = TOWER_RADIO
  local RadioKey = "Ground"
  local Title = string.format("%s %s", AI_ATC.Airbase, Transmitter)
  local ClientData = ATM.ClientData[Alias]
  local Unit = ClientData.Unit
  local Type = ClientData.Type
  local Group = Unit:GetGroup()
  local SchedulerObjects = ClientData.SchedulerObjects 
  local Callsign = ClientData.Callsign
  local FlightCallsign = ClientData.FlightCallsign
  local Flight = ClientData.Flight
  local CallsignSub = Flight and FlightCallsign or Callsign
  local Delay = 1.5 + math.random() * (2.5 - 1.5)
  local AirbaseCoord = AI_ATC_Vec3
  local Break, AirbaseName, Runway, Position, SchedulerObject, SchedulerObject2, ExtSwtch
  local TrafficType, TrafficState, StateData, LandingNo, TrafficAudio, StateSub, SequenceSub
  
  AI_ATC:TerminateSchedules(Alias)
  AI_ATC:ResetMenus(Alias)
  AI_ATC:ReportBaseSubMenu(Alias)
  
  USERSOUND:New("RADIO_TRANS_START.ogg"):ToUnit(Unit)
  if AI_ATC:FunctionDelay(Alias, function() AI_ATC:ClosedTraffic(Alias, audio) end, Transmitter)==false then
    return
  end
  
  local StateTbl = {
    ["On Approach"]          = {filename = "OnApproach.ogg", duration = 0.719, subtitle = "on approach"},
    ["Re-entering pattern"]  = {filename = "OnApproach.ogg", duration = 0.719, subtitle = "on approach"},
    ["On Final Approach"]    = {filename = "OnFinal.ogg", duration = 0.570, subtitle = "on final"},
    ["Initial"]              = {filename = "AtInitial.ogg", duration = 0.606, subtitle = "at Initial"},
    ["in the Break"]         = {filename = "InTheBreak.ogg", duration = 0.564, subtitle = "in the break"},
    ["Left Downwind"]        = {filename = "OnLeftDownwind.ogg", duration = 0.947, subtitle = "on left downwind"},
    ["Right Downwind"]       = {filename = "OnRightDownwind.ogg", duration = 0.564, subtitle = "on right downwind"},
    ["Left Base"]            = {filename = "LeftBase.ogg", duration = 0.895, subtitle = "on left base"},
    ["Right Base"]           = {filename = "RightBase.ogg", duration = 0.893, subtitle = "on right base"},
    ["Low Key"]              = {filename = "LowKey.ogg", duration = 0.686, subtitle = "at Low Key"},
  }
  
  local function InitData()
    SCHEDULER:New(nil, function()
      local count = 1
      for alias, data in pairs(ATM.TowerControl) do
        if alias ~= Alias then
          if StateTbl[data.State] then
            if (data.State=="On Approach" or data.State=="Re-entering pattern") and
            (data.RequestedApproach=="Straight in" or data.RequestedApproach=="Instrument Straight in") then
              count = count + 1
              TrafficType = data.Type
              TrafficState = data.State
              StateData = StateTbl[TrafficState]
            elseif (data.State~="On Approach" and data.State~="Re-entering pattern") then
              count = count + 1
              TrafficType = data.Type
              TrafficState = data.State
              StateData = StateTbl[TrafficState]
            end
          end
        end
      end
      LandingNo = tostring(count)
      if TrafficType and StateData then
        TrafficAudio = AI_ATC_SoundFiles[RadioKey].Aircraft[TrafficType]
        StateSub = StateData.subtitle
        SequenceSub = string.format("You're number %s behind the %s %s for runway %s", LandingNo, TrafficType, StateSub, Runway)
      else
        SequenceSub = string.format("You're number %s for runway %s", LandingNo, Runway)
      end
    end, {}, 0.2)
  end

  SCHEDULER:New(nil, function()
    ExtSwtch = false
    Runway = AI_ATC.Runways.Landing[1]
    if Runway=="05" then
      Break = "Right"
    else
      Break = "Left"
    end
    Position = string.format("%s Downwind", Break)
    if not ATM.TowerControl[Alias] then
      ATM.TowerControl[Alias] = {RequestedApproach = "Closed traffic", State = Position, Type = Type, Contacts = {}, Schedules = {}, Count = ClientCount }
    else
      ATM.TowerControl[Alias].RequestedApproach = "Closed traffic"
      ATM.TowerControl[Alias].State = Position
      SCHEDULER:New(nil, function()
        if ATM.TowerControl and ATM.TowerControl[Alias] and ATM.TowerControl[Alias].Contacts then
          ATM.TowerControl[Alias].Contacts = {}
        end
      end, {}, 5)
    end
  end, {}, 0.5 )
  
  local function ExtendDownwind()
    if ExtSwtch~=true then
      ExtSwtch=true
      if AI_ATC:FunctionDelay(Alias, function() ExtendDownwind() end, Transmitter)==false then return end
      AI_ATC:RepeatLastTransmission(Alias, function()ExtendDownwind() end)
      AI_ATC:ChannelOpen(7, Transmitter, Alias)
      InitData()
      SCHEDULER:New(nil, function()
        local Subtitle = string.format("%s: %s %s.", Title, CallsignSub, SequenceSub)
        RadioObject:NewTransmission("DeadAir.ogg", 0.100, "Airbase_ATC/Ground/SoundFiles/", nil, 0.3, Subtitle, 7)
        AI_ATC:Callsign(Callsign, RadioObject, Transmitter, Flight)
        RadioObject:NewTransmission("Extend.ogg", 0.978, "Airbase_ATC/Ground/SoundFiles/", nil, 0.1)
        RadioObject:NewTransmission("YourNumber.ogg", 0.522, "Airbase_ATC/Ground/SoundFiles/", nil, 0.1)
        AI_ATC:ReadDigits(LandingNo, RadioObject, Transmitter)
        if TrafficType and StateData then
          RadioObject:NewTransmission("Behind.ogg", 0.557, "Airbase_ATC/Ground/SoundFiles/", nil, 0.1)
          RadioObject:NewTransmission(string.format("Aircraft/%s", TrafficAudio.filename), TrafficAudio.duration, string.format("Airbase_ATC/%s/", RadioKey), nil, nil)
          RadioObject:NewTransmission(string.format("SoundFiles/%s", StateData.filename), StateData.duration, string.format("Airbase_ATC/%s/", RadioKey), nil, 0.03)
        end
        RadioObject:NewTransmission("ForRunway.ogg", 0.662, "Airbase_ATC/Ground/SoundFiles/", nil, nil)
        AI_ATC:Runway(Runway, RadioObject, Transmitter)
      end, {}, 0.5 )
    end
  end
  
  local function Message()
    SCHEDULER:New(nil, function()
      AI_ATC:RepeatLastTransmission(Alias, function()Message() end)
      AI_ATC:ChannelOpen(12, Transmitter, Alias)
      local Subtitle = string.format("%s: %s %s closed traffic approved, report base.", Title, CallsignSub, Break)
      RadioObject:NewTransmission("DeadAir.ogg", 0.100, "Airbase_ATC/Ground/SoundFiles/", nil, 0.3, Subtitle, 4)
      AI_ATC:Callsign(Callsign, RadioObject, Transmitter, Flight)
      if Break == "Left" then
        RadioObject:NewTransmission("LeftTraffic.ogg", 1.544, "Airbase_ATC/Ground/SoundFiles/", nil, 0.01)
      elseif Break == "Right" then
        RadioObject:NewTransmission("RightTraffic.ogg", 1.533, "Airbase_ATC/Ground/SoundFiles/", nil, 0.01)
      end
      RadioObject:NewTransmission("ReportBase.ogg", 0.848, "Airbase_ATC/Ground/SoundFiles/", nil, 0.1)
    end, {}, Delay )
  end
  
  Message()

  SchedulerObject2 = SCHEDULER:New(nil, function()
    for alias, data in pairs(ATM.TowerControl) do
      if alias ~= Alias then
        local AppTyp = data.RequestedApproach
        local State  = data.State
        if (AppTyp == "Straight in" or AppTyp == "Instrument Straight in") and StateTbl[State] then 
          local ExtGrp = GROUP:FindByName(alias)
          if ExtGrp and ExtGrp:IsAlive() and AirbaseCoord
          and ATM.TowerControl[Alias] and ATM.TowerControl[Alias].Contacts then
            local ExtCoord = ExtGrp:GetCoordinate()
            local ExtRange = ExtCoord:Get2DDistance(AirbaseCoord)
            if ExtRange >= 4630 and ExtRange <= 12964 
            and ATM.TowerControl[Alias].Contacts[alias] then
              ExtendDownwind()
              SchedulerObject2:Stop()
              return
            end
          end
        end
      end
    end
  end, {}, 20, 2)
  table.insert(SchedulerObjects, SchedulerObject2)

  SchedulerObject = SCHEDULER:New(nil, function()
    if ATM.ClientData[Alias] and Unit then
      local Coord = Unit:GetCoordinate()
      local Range = Coord:Get2DDistance(AirbaseCoord)
      local Airborne = Unit:InAir()
      if Range >= 16668 then
        MESSAGE:New("Exceeded 9Nm from Incirlik", 20):ToUnit(Unit)
        AI_ATC:SayIntentions(Alias)
        SchedulerObject:Stop()
      end
    else
      SchedulerObject:Stop()
    end
  end, {}, 1, 1)
  table.insert(SchedulerObjects, SchedulerObject)

end
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--************************************************************************ATC WINGMAN CLOSED TRAFFIC*****************************************************************************--
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function AI_ATC:WingmanClosedTraffic(Alias, Integer)
  local Transmitter = "Tower"
  local RadioObject = TOWER_RADIO
  local RadioKey = "Ground"
  local Title = string.format("%s %s", AI_ATC.Airbase, Transmitter)
  local ClientData = ATM.ClientData[Alias]
  local Unit = ClientData.Unit
  local Type = ClientData.Type
  local Group = Unit:GetGroup()
  local ClientCount = Group:CountAliveUnits()
  local SchedulerObjects = ClientData.SchedulerObjects 
  local Callsign = ClientData.Callsign
  local FlightCallsign = ClientData.FlightCallsign
  local Flight = ClientData.Flight
  local CallsignSub = Flight and FlightCallsign or Callsign
  local Delay = 1.5 + math.random() * (2.5 - 1.5)
  local AirbaseCoord = AI_ATC_Vec3
  local Break, AirbaseName, Runway, Position, SchedulerObject, SchedulerObject2, ExtSwtch
  local TrafficType, TrafficState, StateData, LandingNo, TrafficAudio, StateSub, SequenceSub

  USERSOUND:New("RADIO_TRANS_START.ogg"):ToUnit(Unit)
  if AI_ATC:FunctionDelay(Alias, function() AI_ATC:WingmanClosedTraffic(Alias, Integer) end, Transmitter)==false then
    return
  end
  
  Callsign = string.sub(Callsign, 1, -2) .. Integer
  
  SCHEDULER:New(nil, function()
    ExtSwtch = false
    Runway = AI_ATC.Runways.Landing[1]
    if Runway=="05" then
      Break = "Right"
    else
      Break = "Left"
    end
    if ATM.ClientData[Alias].Wingman2Menu then
      ATM.ClientData[Alias].Wingman2Menu:RemoveSubMenus()
      ATM.ClientData[Alias].Wingman3Menu:RemoveSubMenus()
      ATM.ClientData[Alias].Wingman4Menu:RemoveSubMenus()
      AI_ATC:WingmanBaseSubMenu(Alias)
    end
  end, {}, 0.5 )
    
  local function Message()
    SCHEDULER:New(nil, function()
      AI_ATC:RepeatLastTransmission(Alias, function()Message() end)
      AI_ATC:ChannelOpen(12, Transmitter, Alias)
      local Subtitle = string.format("%s: %s %s closed traffic approved, report base.", Title, Callsign, Break)
      RadioObject:NewTransmission("DeadAir.ogg", 0.100, "Airbase_ATC/Ground/SoundFiles/", nil, 0.3, Subtitle, 4)
      AI_ATC:Callsign(Callsign, RadioObject, Transmitter, false)
      if Break == "Left" then
        RadioObject:NewTransmission("LeftTraffic.ogg", 1.544, "Airbase_ATC/Ground/SoundFiles/", nil, 0.01)
      elseif Break == "Right" then
        RadioObject:NewTransmission("RightTraffic.ogg", 1.533, "Airbase_ATC/Ground/SoundFiles/", nil, 0.01)
      end
      RadioObject:NewTransmission("ReportBase.ogg", 0.848, "Airbase_ATC/Ground/SoundFiles/", nil, 0.1)
    end, {}, Delay )
  end
  
  Message()

end
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--*****************************************************************************ATC BREAK OUT*************************************************************************************--
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function AI_ATC:BreakOut(Alias, NavPoint)

  if not ATM.ClientData[Alias] then
    return
  end

  local Transmitter    = "Tower"
  local RadioObject    = TOWER_RADIO
  local Title          = string.format("%s %s", AI_ATC.Airbase, Transmitter)
  local ClientData     = ATM.ClientData[Alias]
  local Unit           = ClientData.Unit
  local Group          = Unit:GetGroup()
  local ClientCount    = Group:CountAliveUnits()
  local ClientType     = ClientData.Type
  local SchedulerObjs  = ClientData.SchedulerObjects
  local ApproachType   = ClientData.Approach.Type
  local Callsign       = ClientData.Callsign
  local FlightCallsign = ClientData.FlightCallsign
  local Flight         = ClientData.Flight
  local CallsignSub    = Flight and FlightCallsign or Callsign
  local Runway         = AI_ATC.Runways.Landing[1]
  local Delay          = 1.5 + math.random() * (2.5 - 1.5)
  
  local TowerControl = ATM.TowerControl[Alias]
  if TowerControl and (TowerControl.State == "On Final Approach" 
  or TowerControl.State == string.format("Landed on runway %s", Runway)) then
    AI_ATC:GoAround(Alias, "VFR")
    return
  end

  if AI_ATC:FunctionDelay(Alias, function() AI_ATC:BreakOut(Alias, NavPoint) end, Transmitter) == false then
    return
  end
  
  USERSOUND:New("RADIO_TRANS_START.ogg"):ToUnit(Unit)
  AI_ATC:TerminateSchedules(Alias)
  AI_ATC:ResetMenus(Alias)
  
  local AirbaseCoord, Instruction, SchedulerObject

  SCHEDULER:New(nil, function()
    if not ATM.TowerControl[Alias] then
      ATM.TowerControl[Alias] = {RequestedApproach = "Straight in", State = "Outside Downwind", Type = ClientType, Contacts = {}, Schedules = {}, Count = ClientCount }
    else
      ATM.TowerControl[Alias].RequestedApproach = "Straight in"
      ATM.TowerControl[Alias].State = "Outside Downwind"
      SCHEDULER:New(nil, function()
        if ATM.TowerControl and ATM.TowerControl[Alias] and ATM.TowerControl[Alias].Contacts then
          ATM.TowerControl[Alias].Contacts = {}
        end
      end, {}, 5)
    end
    if ATM.ClientData[Alias].WingmanMenu then
      ATM.ClientData[Alias].WingmanMenu:RemoveSubMenus()
    end
  end, {}, 0.5)
  
  SCHEDULER:New(nil, function()
    AirbaseCoord = AI_ATC_Vec3
    if not NavPoint then
      if Runway=="05"  then
        NavPoint = "EAGLE"
      else
        NavPoint = "FALCON"
      end
    end
    Instruction = string.format("Break out! and report %s.", NavPoint)
    AI_ATC:NavpointSubMenu(Alias, NavPoint)
  end, {}, 1.0)
  
  local function RadioMessage()
    SCHEDULER:New(nil, function()
      AI_ATC:RepeatLastTransmission(Alias, RadioMessage)
      AI_ATC:ChannelOpen(5, Transmitter, Alias)
      local Subtitle = string.format("%s: %s %s.", Title, CallsignSub, Instruction)
      RadioObject:NewTransmission("DeadAir.ogg", 0.100, "Airbase_ATC/Ground/SoundFiles/", nil, 0.3, Subtitle, 5)
      AI_ATC:Callsign(Callsign, RadioObject, Transmitter, Flight)
      if NavPoint == "EAGLE" then
        RadioObject:NewTransmission("BreakOutEagle.ogg", 1.351, "Airbase_ATC/Ground/SoundFiles/", nil, 0.03)
      else
        RadioObject:NewTransmission("BreakOutFalcon.ogg", 1.485, "Airbase_ATC/Ground/SoundFiles/", nil, 0.03)
      end
    end, {}, Delay)
  end
    
  RadioMessage()

  SchedulerObject = SCHEDULER:New(nil, function()
    if not (ATM.ClientData[Alias] and Unit) then
      SchedulerObject:Stop()
      return
    end
    local Coord = Unit:GetCoordinate()
    local Range = Coord:Get2DDistance(AirbaseCoord)
    if Range >= 16668 then
      MESSAGE:New("Exceeded 9Nm from Incirlik", 20):ToUnit(Unit)
      AI_ATC:SayIntentions(Alias)
      SchedulerObject:Stop()
    end
  end, {}, 3, 1)
  table.insert(SchedulerObjs, SchedulerObject)

end
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--******************************************************************************ATC GO AROUND************************************************************************************--
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function AI_ATC:GoAround(Alias, Type)

  if not ATM.ClientData[Alias] then
    return
  end

  local Transmitter    = "Tower"
  local RadioObject    = TOWER_RADIO
  local Title          = string.format("%s %s", AI_ATC.Airbase, Transmitter)
  local ClientData     = ATM.ClientData[Alias]
  local Unit           = ClientData.Unit
  local Group          = Unit:GetGroup()
  local ClientCount    = Group:CountAliveUnits()
  local ClientType     = ClientData.Type
  local ApproachChart  = ClientData.Chart
  local SchedulerObjs  = ClientData.SchedulerObjects
  local ApproachType   = ClientData.Approach.Type
  local Callsign       = ClientData.Callsign
  local FlightCallsign = ClientData.FlightCallsign
  local Flight         = ClientData.Flight
  local CallsignSub    = Flight and FlightCallsign or Callsign
  local Delay          = 1.5 + math.random() * (2.5 - 1.5)
  local Destination, AirbaseCoord, Runway, Report, Instruction, SchedulerObject, AudioData
  
  AI_ATC:TerminateSchedules(Alias)
  AI_ATC:ResetMenus(Alias)
    
  USERSOUND:New("RADIO_TRANS_START.ogg"):ToUnit(Unit)
  if AI_ATC:FunctionDelay(Alias, function() AI_ATC:GoAround(Alias, Type) end, Transmitter)==false then
    return
  end
  
  local AirbaseCoord, Runway, Report, Instruction
  local finalApproach = Type or ApproachType
  
  local InstructionTable = {
    ["VFR"] = {
      ["05"] = { filename = "ReportEagle.ogg", duration = 2.787, subtitle = "Unable closed traffic, break out and report EAGLE."  },
      ["23"] = { filename = "ReportFalcon.ogg", duration = 2.789, subtitle = "Unable closed traffic, break out and report FALCON." },
      },
    ["IFR"] = {
      ["05"] = { filename = "RunwayHeading.ogg", duration = 3.048, subtitle = "Fly runway heading, climb and maintain 5000."  },
      ["23"] = { filename = "RunwayHeading2.ogg", duration = 3.599, subtitle = "Fly runway heading, climb and maintain 3500." },
    }
  }
  
  SCHEDULER:New(nil, function()
    if not ATM.TowerControl[Alias] then
      ATM.TowerControl[Alias] = {RequestedApproach = "Straight in", State = "Outside Downwind", Type = ClientType, Contacts = {}, Schedules = {}, Count = ClientCount }
    else
      if finalApproach == "VFR" then
        ATM.TowerControl[Alias].RequestedApproach = "Straight in"
        ATM.TowerControl[Alias].State = "Outside Downwind"
        SCHEDULER:New(nil, function()
          if ATM.TowerControl and ATM.TowerControl[Alias] and ATM.TowerControl[Alias].Contacts then
            ATM.TowerControl[Alias].Contacts = {}
          end
        end, {}, 5)
      elseif  finalApproach == "IFR" then
        ATM.TowerControl[Alias].RequestedApproach = "Missed Approach"
        ATM.TowerControl[Alias].State = "Missed Approach"
        if ATM.TowerControl[Alias].Schedules then
          for _, sched in ipairs(ATM.TowerControl[Alias].Schedules) do
            sched:Stop()
          end
        end
      end
    end
    if ATM.ClientData[Alias].WingmanMenu then
      ATM.ClientData[Alias].WingmanMenu:RemoveSubMenus()
    end
    if ApproachType=="Generic" then
      ApproachType = AI_ATC.Procedure
    end
    AirbaseCoord = AI_ATC_Vec3
    Runway = AI_ATC.Runways.Landing[1]
    if ApproachType=="VFR" then
      AudioData = InstructionTable["VFR"][Runway]
      Instruction = AudioData.subtitle
      AI_ATC:NavpointSubMenu(Alias)
    elseif ApproachType=="IFR" then
      AudioData = InstructionTable["IFR"][Runway]
      Instruction = AudioData.subtitle.." Contact Incirlik Approach on 340.775."
      AI_ATC:DepartureSubMenu(Alias, true)
    end
  end, {}, 0.5)
  
  local function Message()
    SCHEDULER:New(nil, function()
      AI_ATC:RepeatLastTransmission(Alias, function()Message() end)
      AI_ATC:ChannelOpen(12, Transmitter, Alias)
      local Subtitle = string.format("%s: %s %s.", Title, CallsignSub, Instruction)
      RadioObject:NewTransmission("DeadAir.ogg", 0.100, "Airbase_ATC/Ground/SoundFiles/", nil, 0.3, Subtitle, 5)
      AI_ATC:Callsign(Callsign, RadioObject, Transmitter, Flight)
      if ApproachType=="VFR" then
        RadioObject:NewTransmission(AudioData.filename, AudioData.duration, "Airbase_ATC/Ground/SoundFiles/", nil, 0.1)
      elseif ApproachType=="IFR" then
        RadioObject:NewTransmission(AudioData.filename, AudioData.duration, "Airbase_ATC/Ground/SoundFiles/", nil, 0.1)
        RadioObject:NewTransmission("ContactApproach.ogg", 2.879, "Airbase_ATC/Ground/SoundFiles/", nil, 0.03)
      end
    end, {}, Delay )
  end
  
  Message()
  
  SchedulerObject = SCHEDULER:New(nil, function()
    if ATM.ClientData[Alias] and Unit then
      local Airborne = Unit:InAir()
      local UnitSpeed = Unit:GetVelocityKNOTS()
      local Coord = Unit:GetCoordinate()
      if Coord then
        local Range = Coord:Get2DDistance(AirbaseCoord)
        local Airborne = Unit:InAir()
        if Range >= 16668 then
          MESSAGE:New("Exceeded 9Nm from Incirlik", 20):ToUnit(Unit)
          AI_ATC:SayIntentions(Alias)
          SchedulerObject:Stop()
        elseif not Airborne and UnitSpeed <= 90 then
          AI_ATC:LandingManager(Alias)
          SchedulerObject:Stop()
        end
      end
    else
      SchedulerObject:Stop()
    end
  end, {}, 1, 1)
  table.insert(SchedulerObjs, SchedulerObject)
  
end
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--****************************************************************************ATC BACK TO RADAR**********************************************************************************--
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function AI_ATC:BackToRadar(Alias)
  local Transmitter = "Tower"
  local RadioObject = TOWER_RADIO
  local Title = string.format("%s %s", AI_ATC.Airbase, Transmitter)
  local ClientData = ATM.ClientData[Alias]
  local Unit = ClientData.Unit
  local Type = ClientData.Type
  local Group = Unit:GetGroup()
  local ClientCount = Group:CountAliveUnits()
  local Callsign = ClientData.Callsign
  local FlightCallsign = ClientData.FlightCallsign
  local Flight = ClientData.Flight
  local CallsignSub = Flight and FlightCallsign or Callsign
  local Delay = 1.5 + math.random() * (2.5 - 1.5)
  local Destination, Report, Instruction, SchedulerObject, Runway, RunwayData, Turn, Heading, SoundFile
  
  AI_ATC:TerminateSchedules(Alias)
  AI_ATC:ResetMenus(Alias)
  AI_ATC:B2CheckInSubMenu(Alias)
    
  USERSOUND:New("RADIO_TRANS_START.ogg"):ToUnit(Unit)
  if AI_ATC:FunctionDelay(Alias, function() AI_ATC:BackToRadar(Alias) end, Transmitter)==false then
    return
  end
  
  if ATM.ClientData[Alias].WingmanMenu then
    ATM.ClientData[Alias].WingmanMenu:RemoveSubMenus()
  end
  
  if not ATM.TowerControl[Alias] then
    ATM.TowerControl[Alias] = {RequestedApproach = "Straight in", State = "Missed Approach", Type = Type, Contacts = {}, Schedules = {}, Count = ClientCount }
  else
    ATM.TowerControl[Alias].RequestedApproach = "Straight in"
    ATM.TowerControl[Alias].State = "Missed Approach"
    if ATM.TowerControl[Alias].Schedules then
      for _, sched in ipairs(ATM.TowerControl[Alias].Schedules) do
        sched:Stop()
      end
    end
  end
  
  local RunwayTable = {
    ["05"] = { Turn = "Right", Heading = "139", SoundFile = {filename = "TurnRight.ogg", duration = 0.922}},
    ["23"] = { Turn = "Left", Heading = "139", SoundFile = {filename = "TurnLeft.ogg", duration = 0.827}},
  }
  Runway = AI_ATC.Runways.Landing[1]
  RunwayData = RunwayTable[Runway]
  Turn = RunwayData.Turn
  Heading = RunwayData.Heading
  SoundFile = RunwayData.SoundFile

  local function Message()
    SCHEDULER:New(nil, function()
      AI_ATC:ChannelOpen(10, Transmitter, Alias)
      AI_ATC:RepeatLastTransmission(Alias, function()Message() end)
      local Subtitle = string.format("%s: %s Turn %s heading %s. Climb and maintain 5000. Contact Incirlik Approach on 340.775.", Title, CallsignSub, Turn, Heading)
      RadioObject:NewTransmission("DeadAir.ogg", 0.100, "Airbase_ATC/Ground/SoundFiles/", nil, 0.3, Subtitle, 8)
      AI_ATC:Callsign(Callsign, RadioObject, Transmitter, Flight)
      RadioObject:NewTransmission(SoundFile.filename, SoundFile.duration, "Airbase_ATC/Ground/SoundFiles/", nil, 0.01)
      AI_ATC:ReadHeading(Heading, RadioObject, Transmitter)
      
      RadioObject:NewTransmission("Climb5000.ogg", 1.765, "Airbase_ATC/Ground/SoundFiles/", nil, 0.01)
      RadioObject:NewTransmission("ContactApproach.ogg", 3.959, "Airbase_ATC/Ground/SoundFiles/", nil, 0.01)
    end, {}, Delay)
  end
  
  Message()
  
end
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--****************************************************************************ATC SAY INTENTIONS********************************************************************************--
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function AI_ATC:SayIntentions(Alias)
  local Transmitter = "Tower"
  local RadioObject = TOWER_RADIO
  local Title = string.format("%s %s", AI_ATC.Airbase, Transmitter)
  local ClientData = ATM.ClientData[Alias]
  local Unit = ClientData.Unit
  local Group = Unit:GetGroup()
  local SchedulerObjects = ClientData.SchedulerObjects
  local Callsign = ClientData.Callsign
  local FlightCallsign = ClientData.FlightCallsign
  local Flight = ClientData.Flight
  local CallsignSub = Flight and FlightCallsign or Callsign
  local Delay = 1.5 + math.random() * (2.5 - 1.5)
  
  if AI_ATC:FunctionDelay(Alias, function() AI_ATC:SayIntentions(Alias) end, Transmitter)==false then
    return
  end
  USERSOUND:New("RADIO_TRANS_START.ogg"):ToUnit(Unit)
  
  SCHEDULER:New(nil, function()
    AI_ATC:TerminateSchedules(Alias)
    AI_ATC:ResetMenus(Alias)
    AI_ATC:LandingSubMenu(Alias, true)
  end, {}, 0.5)
  
  local function Message()
    SCHEDULER:New(nil, function()
      AI_ATC:ChannelOpen(12, Transmitter, Alias)
      AI_ATC:RepeatLastTransmission(Alias, function()Message() end)
      local Subtitle = string.format("%s: %s Say intentions", Title, CallsignSub)
      RadioObject:NewTransmission("DeadAir.ogg", 0.100, "Airbase_ATC/Ground/SoundFiles/", nil, 0.3, Subtitle, 3)
      AI_ATC:Callsign(Callsign, RadioObject, Transmitter, Flight)
      RadioObject:NewTransmission("Intentions.ogg", 0.917, "Airbase_ATC/Ground/SoundFiles/", nil, 0.01)
    end, {}, Delay)
  end
  
  Message()
end
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--****************************************************************************ATC SAY INTENTIONS********************************************************************************--
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function AI_ATC:SayIntentions2(Alias)
  local Transmitter = "Tower"
  local RadioObject = TOWER_RADIO
  local Title = string.format("%s %s", AI_ATC.Airbase, Transmitter)
  local ClientData = ATM.ClientData[Alias]
  local Unit = ClientData.Unit
  local Group = Unit:GetGroup()
  local SchedulerObjects = ClientData.SchedulerObjects
  local Callsign = ClientData.Callsign
  local FlightCallsign = ClientData.FlightCallsign
  local Flight = ClientData.Flight
  local CallsignSub = Flight and FlightCallsign or Callsign
  local Delay = 1.5 + math.random() * (2.5 - 1.5)
  
  if AI_ATC:FunctionDelay(Alias, function() AI_ATC:SayIntentions2(Alias) end, Transmitter)==false then
    return
  end
  USERSOUND:New("RADIO_TRANS_START.ogg"):ToUnit(Unit)
  
  SCHEDULER:New(nil, function()
    AI_ATC:TerminateSchedules(Alias)
    AI_ATC:ResetMenus(Alias)
    AI_ATC:GoAroundSubMenu(Alias)
    if ATM.ClientData[Alias].WingmanMenu then
      ATM.ClientData[Alias].WingmanMenu:RemoveSubMenus()
    end
  end, {}, 0.5)
  
  local function Message()
    SCHEDULER:New(nil, function()
      AI_ATC:ChannelOpen(12, Transmitter, Alias)
      AI_ATC:RepeatLastTransmission(Alias, function()Message() end)
      local Subtitle = string.format("%s: %s Say intentions", Title, CallsignSub)
      RadioObject:NewTransmission("DeadAir.ogg", 0.100, "Airbase_ATC/Ground/SoundFiles/", nil, 0.3, Subtitle, 3)
      AI_ATC:Callsign(Callsign, RadioObject, Transmitter, Flight)
      RadioObject:NewTransmission("Intentions.ogg", 0.917, "Airbase_ATC/Ground/SoundFiles/", nil, 0.01)
    end, {}, Delay)
  end
  
  Message()
end
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--****************************************************************************ATC BACK TO RADAR**********************************************************************************--
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function AI_ATC:RadarVectorDeparture(Alias)
  local Transmitter = "Tower"
  local Agency = "Tower"
  local RadioObject = TOWER_RADIO
  local Title = string.format("%s %s", AI_ATC.Airbase, Transmitter)
  local ClientData = ATM.ClientData[Alias]
  local Unit = ClientData.Unit
  local Type = ClientData.Type
  local Group = Unit:GetGroup()
  local ApproachType = ClientData.Approach.Type
  local SchedulerObjects = ClientData.SchedulerObjects
  local Callsign = ClientData.Callsign
  local FlightCallsign = ClientData.FlightCallsign
  local Flight = ClientData.Flight
  local CallsignSub = Flight and FlightCallsign or Callsign
  local Delay = 1.5 + math.random() * (2.5 - 1.5)
  
  if Type=="PAR" then
    Title = "Final Controller"
    Transmitter = "SFA"
  end
  
  local RadioObject = AI_ATC:FindTransmitter(Alias, Transmitter)
  
  local Instruction, SoundFile, Runway
  USERSOUND:New("RADIO_TRANS_START.ogg"):ToUnit(Unit)
  
  SCHEDULER:New(nil, function()
    if ATM.TowerControl[Alias] and ATM.TowerControl[Alias].Schedules then
      for _, sched in ipairs(ATM.TowerControl[Alias].Schedules) do
        sched:Stop()
      end
      ATM.TowerControl[Alias] = nil
    end
    AI_ATC:ResetMenus(Alias)
    if ApproachType=="Generic" then
      ApproachType = AI_ATC.Procedure
    end
    if ApproachType=="VFR" then
      Instruction = "Contact Incirlik Departure on 340.775"
      SoundFile = "ContactDeparture.ogg"
      AI_ATC:DepartureSubMenu(Alias)
    elseif ApproachType=="IFR" then
      Instruction = "Contact Incirlik Approach on 340.775"
      SoundFile = "ContactApproach.ogg"
      AI_ATC:DepartureSubMenu(Alias, true)
      ATM.ClientData[Alias].Approach.Type = "IFR"
      local Runway = AI_ATC.Runways.Landing[1]
      ATM.ClientData[Alias].Recovery = AI_ATC.Recovery
    end
  end, {}, 0.5)
  
  local function Message()
    SCHEDULER:New(nil, function()
      AI_ATC:ChannelOpen(12, Transmitter, Alias)
      AI_ATC:RepeatLastTransmission(Alias, function()Message() end)
      local Subtitle = string.format("%s: %s %s", Title, CallsignSub, Instruction)
      RadioObject:NewTransmission("DeadAir.ogg", 0.100, "Airbase_ATC/Ground/SoundFiles/", nil, 0.3, Subtitle, 3)
      AI_ATC:Callsign(Callsign, RadioObject, Transmitter, Flight)
      RadioObject:NewTransmission(SoundFile, 4.017, "Airbase_ATC/Ground/SoundFiles/", nil, 0.01)
    end, {}, Delay)
  end
  
  Message()
  
end
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--****************************************************************************ATC LANDING MANAGER********************************************************************************--
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function AI_ATC:LandingManager(Alias, PAR)
  local Agency = "Tower"
  local Transmitter = "Tower"
  local Title = string.format("%s %s", AI_ATC.Airbase, Transmitter)
  local RadioObject = TOWER_RADIO
  local ClientData = ATM.ClientData[Alias]
  local Unit = ClientData.Unit
  local Group = Unit:GetGroup()
  local SchedulerObjects = ClientData.SchedulerObjects
  local ApproachType  = ClientData.Approach.Type
  if Jester then Jester:Silence() end
  local Callsign = ClientData.Callsign
  local FlightCallsign = ClientData.FlightCallsign
  local Flight = ClientData.Flight
  local CallsignSub = Flight and FlightCallsign or Callsign
  
  local Procedure, Runway, Exit, RunwayHeading, InitialRange, UnitCoord, AirbaseCoord, SchedulerObject, SchedulerObject2, SchedulerObject3, SchedulerObject4
  local Exceeded7nm, AbnormalAngle, ClimbOutDone, FinalHandled, TakeoffHandled = false, false, false, false, false
  local SchedulerObject_A, SchedulerObject_B, TrafficOnFinal, TrafficTrigger, variableRange, variableAngle, variableSpeed
  
  if not PAR then
    variableRange = 3352
    variableAngle = 10
    variableSpeed = 90
    AI_ATC:TerminateSchedules(Alias)
    AI_ATC:GoAroundSubMenu(Alias)
  else
    variableRange = 9260
    variableAngle = 15
    variableSpeed = 50
  end
  
  local function FinalCheck()
    if not ATM.RunwayOccupied then return false end
    for alias, _ in pairs(ATM.RunwayOccupied) do
      if alias ~= Alias then
        return true
      end
    end
    return false
  end

  SCHEDULER:New(nil, function()
    Procedure = AI_ATC.Procedure
    if ApproachType == "Generic" then
        ApproachType = Procedure
    end
    Runway = AI_ATC.Runways.Landing[1]
    Exit = AI_ATC_TaxiToPark[Runway].Exit
    AirbaseCoord = AI_ATC_Vec3
    UnitCoord = Unit:GetCoordinate()
    RunwayHeading = AI_ATC.Runways.Landing[5]
    InitialRange = UnitCoord:Get2DDistance(AirbaseCoord)
    TrafficOnFinal = false
    TrafficTrigger = false
  end, {}, 0.5)
  
  local function Execute()
    SchedulerObject = SCHEDULER:New(nil, function()
      if ATM.ClientData[Alias] and Unit and Unit:IsAlive() then
        local UnitSpeed = Unit:GetVelocityKNOTS()
        if AI_ATC:FunctionDelay(Alias, nil, Transmitter)==true then
          PLAYER_TOUCHDOWN = true
          local function Message()
            AI_ATC:RepeatLastTransmission(Alias, function()Message() end)
            AI_ATC:ChannelOpen(12, Transmitter, Alias)
            local Subtitle = string.format("%s: %s Welcome back, exit runway via Taxiway %s, Contact Ground for parking", Title, CallsignSub, Exit)
            RadioObject:NewTransmission("DeadAir.ogg", 0.100, "Airbase_ATC/Ground/SoundFiles/", nil, 0.3, Subtitle, 7)
            AI_ATC:Callsign(Callsign, RadioObject, Transmitter, Flight)
            RadioObject:NewTransmission("WelcomeBack.ogg", 2.508, "Airbase_ATC/Ground/SoundFiles/", nil, 0.01)
            AI_ATC:Phonetic(Exit, RadioObject, Transmitter)
            RadioObject:NewTransmission("ContactGround.ogg", 1.289, "Airbase_ATC/Ground/SoundFiles/", nil, 0.01)
          end
          Message()
          AI_ATC:ResetMenus(Alias)
          AI_ATC:ParkingSubMenu(Alias)
          
          if ATM.ClientData[Alias].WingmanMenu then
            ATM.ClientData[Alias].WingmanMenu:RemoveSubMenus()
          end
          
          if ATM.TowerControl[Alias] and ATM.TowerControl[Alias].Schedules then
            for _, sched in ipairs(ATM.TowerControl[Alias].Schedules) do
              sched:Stop()
            end
            ATM.TowerControl[Alias] = nil
          end
            
          if Jester then Jester:Speak() end
          SchedulerObject:Stop()
        end
      else
        SchedulerObject:Stop()
      end
    end, {}, 1, 1)
  end
  
  local function ClimbOut()
    SchedulerObject3 = SCHEDULER:New(nil, function()
      if ATM.ClientData[Alias] and Unit and Unit:IsAlive() then
        local Coord = Unit:GetCoordinate()
        local Heading = tonumber(AI_ATC:CorrectHeading(Unit:GetHeading()))
        local Range = Coord:Get2DDistance(AirbaseCoord)
        local Angle = AI_ATC:AngularDifference(Heading, RunwayHeading)
        local UnitSpeed = Unit:GetVelocityKNOTS()
        local Airborne = Unit:InAir()
        if Airborne and (Range >= variableRange or Angle >= variableAngle)  then
          MESSAGE:New("Pilot did not specify to rejoin pattern", 20):ToUnit(Unit)
          if ApproachType=="VFR" then
            AI_ATC:GoAround(Alias)
          else
            AI_ATC:SayIntentions2(Alias)
          end
          SchedulerObject3:Stop()
        elseif not Airborne and UnitSpeed<=variableSpeed then
          Execute()
          SchedulerObject3:Stop()
        end
      else
        SchedulerObject3:Stop()
      end
    end, {}, 1, 1)
    table.insert(SchedulerObjects, SchedulerObject3)
  end
  
  local function TakeOffCheck()
    if not ATM.RunwayOccupied[Alias] then
      ATM.RunwayOccupied[Alias] = {}
      SCHEDULER:New(nil, function()
        if ATM.RunwayOccupied[Alias] then
          ATM.RunwayOccupied[Alias] = nil
        end
      end, {}, 60)
    end
    SchedulerObject2 = SCHEDULER:New(nil, function()
      if ATM.ClientData[Alias] and Unit then
        local UnitSpeed = Unit:GetVelocityKNOTS()
        local Airborne = Unit:InAir()
        if Airborne then
          if ATM.RunwayOccupied[Alias] then
            ATM.RunwayOccupied[Alias] = nil
          end
          ClimbOut()
          SchedulerObject2:Stop()
        elseif not Airborne and UnitSpeed <= variableSpeed then
          Execute()
          SchedulerObject2:Stop()
        end
      else
        SchedulerObject2:Stop()
      end
    end, {}, 1, 1)
    table.insert(SchedulerObjects, SchedulerObject2)
  end
  
  local function StopBoth()
    if SchedulerObject_A and SchedulerObject_A.Stop then SchedulerObject_A:Stop() end
    if SchedulerObject_B and SchedulerObject_B.Stop then SchedulerObject_B:Stop() end
  end

  SchedulerObject_A = SCHEDULER:New(nil, function()
    if ATM.ClientData[Alias] and Unit then
      local Coord     = Unit:GetCoordinate()
      local Heading   = tonumber(AI_ATC:CorrectHeading(Unit:GetHeading()))
      local Range     = Coord:Get2DDistance(AirbaseCoord)
      local Airborne  = Unit:InAir()
      local Angle     = AI_ATC:AngularDifference(Heading, RunwayHeading)

      if not Exceeded7nm and Range >= InitialRange and Range >= 12964 then
        Exceeded7nm = true
        MESSAGE:New("Exceeded 7Nm from Incirlik", 20):ToUnit(Unit)
        AI_ATC:SayIntentions(Alias)
        StopBoth()
        return
      end

      if not AbnormalAngle and Range <= 2743 and Angle >= 10 then
        AbnormalAngle = true
        MESSAGE:New("Abnormal approach angle", 20):ToUnit(Unit)
        if ApproachType=="VFR" then
          AI_ATC:GoAround(Alias)
        else
          AI_ATC:SayIntentions2(Alias)
        end
        StopBoth()
        return
      end

      if not ClimbOutDone and Range <= 560 and Angle <= 10 and Airborne then
        ClimbOutDone = true
        ClimbOut()
        StopBoth()
        return
      end

    elseif not ATM.ClientData[Alias] and Unit then
      SchedulerObject_A:Stop()
    end
  end, {}, 10, 1.5)
  table.insert(SchedulerObjects, SchedulerObject_A)

  SchedulerObject_B = SCHEDULER:New(nil, function()
    if ATM.ClientData[Alias] and Unit then
      local Coord     = Unit:GetCoordinate()
      local Heading   = tonumber(AI_ATC:CorrectHeading(Unit:GetHeading()))
      local Range     = Coord:Get2DDistance(AirbaseCoord)
      local Airborne  = Unit:InAir()
      local Angle     = AI_ATC:AngularDifference(Heading, RunwayHeading)

      if Range <= 5556 and Angle <= 10 then
        if ATM.TowerControl[Alias] and not FinalHandled then
          FinalHandled = true
          ATM.TowerControl[Alias].State = "On Final Approach"
  
          if not TrafficTrigger then
            local TrafficOnFinal = FinalCheck()
            if TrafficOnFinal then
              TrafficTrigger = true
              AI_ATC:RunwayOccupied(Alias)
            end
          end
        end

        if not TakeoffHandled and not Airborne then
          TakeoffHandled = true
          TakeOffCheck()
          StopBoth()
          return
        end
      end
  
    elseif not ATM.ClientData[Alias] and Unit then
      SchedulerObject_B:Stop()
    end
  end, {}, 10.3, 1.2)
  table.insert(SchedulerObjects, SchedulerObject_B)

end
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--****************************************************************************ATC HELO LANDING MANAGER***************************************************************************--
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function AI_ATC:HeloLandingManager(Alias)
  local Transmitter = "Tower"
  local Title = string.format("%s %s", AI_ATC.Airbase, Transmitter)
  local RadioObject = TOWER_RADIO
  local ClientData = ATM.ClientData[Alias]
  local Heliport = ClientData.Heliport
  local Unit = ClientData.Unit
  local Group = Unit:GetGroup()
  local SchedulerObjects = ClientData.SchedulerObjects
  local ApproachType  = ClientData.Approach.Type
  local Callsign = ClientData.Callsign
  local FlightCallsign = ClientData.FlightCallsign
  local Flight = ClientData.Flight
  local CallsignSub = Flight and FlightCallsign or Callsign
  
  local Procedure, Exit, Taxiway, AirbaseCoord, AirbaseVec2, AirbaseZone, SchedulerObject, Runway

  SCHEDULER:New(nil, function()
    Procedure = AI_ATC.Procedure
    if ApproachType == "Generic" then
      ApproachType = Procedure
    end
    if Heliport then
      Runway = AI_ATC.Runways.Heliport[1]
      AirbaseCoord = AI_ATC_Navpoints.Kandahar_Heliport:GetCoordinate()
    else
      Runway = AI_ATC.Runways.Landing[1]
      AirbaseCoord = AI_ATC_Vec3
    end
    Taxiway = ClientData.Taxi[1]
    Exit = AI_ATC_TaxiToPark[Runway][Taxiway].Exit
    AirbaseVec2 = AirbaseCoord:GetVec2()
    AirbaseZone = ZONE_RADIUS:New("AirbaseZone", AirbaseVec2, 2500)
  end, {}, 0.5)
  
  local function Execute()
    if AI_ATC:FunctionDelay(Alias, function() Execute() end, Transmitter)==false then
      return
    end
    AI_ATC:RepeatLastTransmission(Alias, function()Execute() end)
    AI_ATC:ChannelOpen(12, Transmitter, Alias)
    local Subtitle = string.format("%s: %s Welcome back, exit runway via Taxiway %s, Contact Ground for parking", Title, CallsignSub, Exit)
    RadioObject:NewTransmission("DeadAir.ogg", 0.100, "Airbase_ATC/Ground/SoundFiles/", nil, 0.3, Subtitle, 7)
    AI_ATC:Callsign(Callsign, RadioObject, Transmitter, Flight)
    RadioObject:NewTransmission("WelcomeBack.ogg", 2.508, "Airbase_ATC/Ground/SoundFiles/", nil, 0.01)
    AI_ATC:Phonetic(Exit, RadioObject, Transmitter)
    RadioObject:NewTransmission("ContactGround.ogg", 1.289, "Airbase_ATC/Ground/SoundFiles/", nil, 0.01)

    AI_ATC:TerminateSchedules(Alias)
    AI_ATC:ResetMenus(Alias)
    AI_ATC:ParkingSubMenu(Alias)
          
    if ATM.TowerControl[Alias] then
      ATM.TowerControl[Alias] = nil
    end
  end
  
  SchedulerObject = SCHEDULER:New(nil, function()
    if ATM.ClientData[Alias] and Unit then
      local velocity = Unit:GetVelocityKNOTS()
      local Altitude = Unit:GetAltitude(true)
      if (Unit:IsInZone(AirbaseZone) and Unit:InAir()==false)
      or (Unit:IsInZone(AirbaseZone) and velocity <= 40 and Altitude <=50) then
        Execute()
        SchedulerObject:Stop()
      end
    else
      SchedulerObject:Stop()
    end
  end, {}, 1, 1)
  table.insert(SchedulerObjects, SchedulerObject)
end
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--**********************************************************************************AI_ATC ROLL OUT******************************************************************************--
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function AI_ATC:RollOutLanding(Alias)
  local Agency = "Tower"
  local Transmitter = "Tower"
  local Title = string.format("%s %s", AI_ATC.Airbase, Transmitter)
  local RadioObject = TOWER_RADIO
  local ClientData = ATM.ClientData[Alias]
  local Unit = ClientData.Unit
  local Group = Unit:GetGroup()
  local SchedulerObjects = ClientData.SchedulerObjects
  local ApproachType  = ClientData.Approach.Type
  local Exit = ClientData.Taxi[#ClientData.Taxi]
  if Jester then Jester:Silence() end
  local Callsign = ClientData.Callsign
  local FlightCallsign = ClientData.FlightCallsign
  local Flight = ClientData.Flight
  local CallsignSub = Flight and FlightCallsign or Callsign
  local Delay = 1.5 + math.random() * (2.5 - 1.5)
  
  AI_ATC:TerminateSchedules(Alias)
  
  if AI_ATC:FunctionDelay(Alias, function() AI_ATC:RollOutLanding(Alias) end, Transmitter)==false then
    return
  end
  USERSOUND:New("RADIO_TRANS_START.ogg"):ToUnit(Unit)
  
  local function Execute()
    PLAYER_TOUCHDOWN = true
    SCHEDULER:New(nil, function()
      AI_ATC:RepeatLastTransmission(Alias, function()Execute() end)
      AI_ATC:ChannelOpen(12, Transmitter, Alias)
      local Subtitle = string.format("%s: %s Welcome back, exit runway via Taxiway %s, Contact Ground for parking", Title, CallsignSub, Exit)
      RadioObject:NewTransmission("DeadAir.ogg", 0.100, "Airbase_ATC/Ground/SoundFiles/", nil, 0.3, Subtitle, 7)
      AI_ATC:Callsign(Callsign, RadioObject, Agency, Flight)
      RadioObject:NewTransmission("WelcomeBack.ogg", 2.508, "Airbase_ATC/Ground/SoundFiles/", nil, 0.01)
      AI_ATC:Phonetic(Exit, RadioObject, Agency)
      RadioObject:NewTransmission("ContactGround.ogg", 1.289, "Airbase_ATC/Ground/SoundFiles/", nil, 0.01)
      if Jester then Jester:Speak() end
    end, {}, Delay)

    AI_ATC:ResetMenus(Alias)
    AI_ATC:ParkingSubMenu(Alias)
    
    if ATM.ClientData[Alias].WingmanMenu then
      ATM.ClientData[Alias].WingmanMenu:RemoveSubMenus()
    end
          
    if AI_Instructor then
      AI_Instructor.PostLanding = true
    end

    if ATM.TowerControl[Alias] and ATM.TowerControl[Alias].Schedules then
      for _, sched in ipairs(ATM.TowerControl[Alias].Schedules) do
        sched:Stop()
      end
      ATM.TowerControl[Alias] = nil
    end

  end
  Execute()
end
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--**********************************************************************************AI_ATC PAR***********************************************************************************--
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function AI_ATC:TowerPAR(Alias)
  local Agency = "Tower"
  local Transmitter = "SFA"
  local RadioObject = AI_ATC:FindTransmitter(Alias, Transmitter)
  local Title = "Final Controller"
  local ClientData = ATM.ClientData[Alias]
  local UnitObject = ClientData.Unit
  local Type = ClientData.Type
  local Group = UnitObject:GetGroup()
  local ClientCount = Group:CountAliveUnits()
  local SchedulerObjects = ClientData.SchedulerObjects
  local ApproachMenu = ClientData.ApproachMenu
  local Callsign = ClientData.Callsign
  local FlightCallsign = ClientData.FlightCallsign
  local Flight = ClientData.Flight
  local CallsignSub = Flight and FlightCallsign or Callsign
  local Runway = AI_ATC.Runways.Landing[1]
  local RunwayHeading = AI_ATC.Runways.Landing[5]
  local Delay = 1.5 + math.random() * (2.5 - 1.5)
  
  AI_ATC.PARdata[Alias] = {}
  AI_ATC.PARdata[Alias].Course = {}
  AI_ATC.PARdata[Alias].Glidepath = {}
  AI_ATC.PARdata[Alias].AudioFSM = {
    State = "IDLE",
    LastDistanceCalled = 999,
    LastCourseStatus = nil,
    Did_DH  = false,
    Did_APR = false,
    Did_THR = false,
    LastSpokenHeading = nil,
    HeadingHoldUntil  = 0.0,
    PauseUntil = 0.0,
    OnCourseCycleCount = 0,
  }
  
  AI_ATC.PARdata[Alias].ApproachTick = {
    SchedulerCount = 0,
    tick1Complete = false,
    tick2Complete = false,
    tick3Complete = false,
    tick4Complete = false,
    tick5Complete = false,
    tick6Complete = false,
    tick7Complete = false,
    tick8Complete = false,
  }

  local AudioTbl = {
    ["slightly left of course"]  = { filename = "SlightlyLeft.ogg",      duration = 1.391, subtitle = "Slightly left of course" },
    ["slightly right of course"] = { filename = "SlightlyRight.ogg",     duration = 1.288, subtitle = "Slightly right of course" },
    ["left of course"]           = { filename = "LeftOfCourse.ogg",      duration = 0.839, subtitle = "left of course" },
    ["right of course"]          = { filename = "RightOfCourse.ogg",     duration = 0.820, subtitle = "right of course" },
    ["well left of course"]      = { filename = "WellLeft.ogg",          duration = 1.193, subtitle = "Well left of course" },
    ["well right of course"]     = { filename = "WellRight.ogg",         duration = 1.118, subtitle = "Well right of course" },
    ["on course"]                = { filename = "OnCourse.ogg",          duration = 0.783, subtitle = "On course" },
    ["slightly above glidepath"] = { filename = "SlightlyAbove.ogg",     duration = 1.503, subtitle = "Slightly above glidepath" },
    ["slightly below glidepath"] = { filename = "SlightlyBelow.ogg",     duration = 1.361, subtitle = "Slightly below glidepath" },
    ["well above glidepath"]     = { filename = "WellAbove.ogg",         duration = 1.207, subtitle = "Well above glidepath" },
    ["well below glidepath"]     = { filename = "WellBelow.ogg",         duration = 1.044, subtitle = "Well below glidepath" },
    ["on glidepath"]             = { filename = "OnGlidepath.ogg",       duration = 0.937, subtitle = "on glidepath" },
    ["slowly left"]              = { filename = "LeftSlowly.ogg",        duration = 1.411, subtitle = "Going left of course slowly" },
    ["rapidly left"]             = { filename = "LeftRapidly.ogg",       duration = 1.595, subtitle = "Going left of course rapidly" },
    ["slowly right"]             = { filename = "RightSlowly.ogg",       duration = 1.315, subtitle = "Going right of course slowly" },
    ["rapidly right"]            = { filename = "RightRapidly.ogg",      duration = 1.461, subtitle = "Going right of course rapidly" },
    ["correcting"]               = { filename = "Correcting.ogg",        duration = 0.636, subtitle = "and correcting" },
    ["and holding"]              = { filename = "Holding.ogg",           duration = 0.655, subtitle = "and holding" },
    ["coming up"]                = { filename = "ComingUp.ogg",          duration = 0.691, subtitle = "and coming up" },
    ["coming down"]              = { filename = "ComingDown.ogg",        duration = 0.853, subtitle = "and coming down" },
    ["increase"]                 = { filename = "DescentRate.ogg",       duration = 1.218, subtitle = "increase rate of descent" },
    ["decrease"]                 = { filename = "DecreaseDescent.ogg",   duration = 1.207, subtitle = "decrease rate of descent" },
    ["climb now"]                = { filename = "ClimbNow.ogg",          duration = 0.660, subtitle = "Climb NOW!" },
    ["left"]                     = { filename = "TurnLeft.ogg",          duration = 0.827, subtitle = "turn left heading" },
    ["right"]                    = { filename = "TurnRight.ogg",         duration = 0.922, subtitle = "turn right heading" },
  }
  
  local AltTbl = {
    ["Climb"] = { filename = "ClimbMaintain.ogg", duration = 1.023 },
    ["Maintain"] = { filename = "Maintain.ogg", duration = 0.636 },
    ["Descend"] = { filename = "Descend.ogg", duration = 1.128 },
  }

  local UnitCoord, Airbase, AirbaseCoord, WindDirection, WindSpeed, ApproachType, SchedulerObject
  local SchedulerCount, DepartureZone, TouchDownPoint, DecisionHeight, Bearing
  local GlideslopeAngle, GlideslopeRad, FieldElevMSL, Height, ApproachingGlideFlag, BeginDescentFlag
  local CheckInFlag, Cleared2LandFlag, DecisionHeightFlag, OverApproachFlag, OverThresholdFlag
  local GlidepathCallout, CourseCallout, InterceptHeading, CourseStatus, AltAdvisoryFlag, AltBase
  local VoiceHeading, HeadingStr, PARCallout, SuppressGlidepathFlag, TooLowFlag, IncreaseDescentFlag, DecreaseDescentFlag, ClimbNowFlag
  local A_x, A_y, H, vx, vy, vlen, Alt, AltSub, PatternAlt, PlayerAltitude, AltSubtitle, AltFile, condition, audioKey
  
  if AI_ATC:FunctionDelay(Alias, function() AI_ATC:TowerPAR(Alias) end, Transmitter)==false then 
    return 
  end
  
  AI_ATC:TerminateSchedules(Alias)
  AI_ATC:ResetMenus(Alias)
  AI_ATC:GCAGoAroundSubMenu(Alias, RadioObject)
  
  SCHEDULER:New(nil, function()
    ApproachType = ATM.ClientData[Alias].Landing.Procedure
    ATM.ClientData[Alias].Landing.Type = "Option"
    if not ATM.TowerControl[Alias] then
      ATM.TowerControl[Alias] = { RequestedApproach = ApproachType, State = "On Approach", Type = Type, Contacts = {}, Schedules = {}, Count = ClientCount }
    else
      ATM.TowerControl[Alias].RequestedApproach = ApproachType
      ATM.TowerControl[Alias].State = "On Approach"
    end
    if Runway=="05" then
      DepartureZone = AI_ATC_Navpoints["PAR_23"]:GetCoordinate()
      TouchDownPoint = AI_ATC_Navpoints["PAR_05"]:GetCoordinate()
      AltBase = 2300
    elseif Runway=="06R" then
      DepartureZone = AI_ATC_Navpoints["PAR_05"]:GetCoordinate()
      TouchDownPoint = AI_ATC_Navpoints["PAR_23"]:GetCoordinate()
      AltBase = 2300
    end
    UnitCoord = UnitObject:GetCoordinate()
    Airbase      = AI_ATC_Airbase
    AirbaseCoord = Airbase:GetCoordinate()
    Height       = AirbaseCoord:GetLandHeight()
    WindDirection, WindSpeed = AirbaseCoord:GetWind(Height + 10)
    WindDirection = AI_ATC:RectifyHeading(tostring(math.floor(WindDirection + 0.5)))
    WindSpeed     = tostring(math.floor(UTILS.MpsToKnots(WindSpeed) - 0.5))
    SchedulerCount = 0
    FieldElevMSL = TouchDownPoint:GetLandHeight()
    DecisionHeight = 76
    GlideslopeAngle = 3.0
    GlideslopeRad = math.rad(GlideslopeAngle)
    CheckInFlag = false
    Cleared2LandFlag = false
    DecisionHeightFlag = false
    OverApproachFlag = false
    OverThresholdFlag = false
    ApproachingGlideFlag = false
    BeginDescentFlag     = false
    SuppressGlidepathFlag = false 
    AltAdvisoryFlag = false
    TooLowFlag = false
    IncreaseDescentFlag = false
    DecreaseDescentFlag = false
    ClimbNowFlag = false
  end, {}, 0.5)
  
  local function NudgeHeading(hdg, runway_hdg)
    local diff = ((hdg - runway_hdg + 540) % 360) - 180
    if math.abs(diff) < 0.3 then
      return hdg
    end
    if diff > 0.0 then
      hdg = hdg + 1
    elseif diff < 0.0 then
      hdg = hdg - 1
    end
    hdg = hdg % 360
    if hdg < 0 then hdg = hdg + 360 end
    return hdg
  end
  
  local function CalculateAltitude(altitude)
    Alt = altitude
    AltSub = AI_ATC:ReadFlightLevel(Alt, RadioObject, Transmitter, false)
    PatternAlt = tonumber(Alt.."000")
    PlayerAltitude = math.abs(UnitObject:GetAltitude()* 3.28084)
    if PlayerAltitude < (PatternAlt - 500) then
      condition = "Climb and maintain"
      audioKey = "Climb"
    elseif math.abs(PlayerAltitude - PatternAlt) <= 500 then
      condition = "maintain"
      audioKey = "Maintain"
    elseif PlayerAltitude > (PatternAlt + 500) then
      condition = "Descend and maintain"
      audioKey = "Descend"
    end
    AltSubtitle = string.format("%s %s", condition, AltSub)
    AltFile = AltTbl[audioKey]
  end

  local function CheckIn()
    CheckInFlag = true
    local Subtitle = string.format("%s: %s, Radar contact, do not acknowledge further transmissions unless instructed.", Title, Callsign)
    RadioObject:NewTransmission("DeadAir.ogg", 0.100, "Airbase_ATC/Ground/SoundFiles/", nil, nil, Subtitle, 7)
    AI_ATC:Callsign(Callsign, RadioObject, Agency, false)
    RadioObject:NewTransmission("RadarContact.ogg", 0.847, "Airbase_ATC/Ground/PAR/", nil, 0.1)
    RadioObject:NewTransmission("NoAcknowledge.ogg", 2.774, "Airbase_ATC/Ground/PAR/", nil, 0.1)
  end
  
  local function RunwayInSight()
    local Subtitle = string.format("%s: Copy Runway in sight. Contact Incirlik Tower on 360.100.", Title)
    RadioObject:NewTransmission("DeadAir.ogg", 0.100, "Airbase_ATC/Ground/SoundFiles/", nil, nil, Subtitle, 2)
    RadioObject:NewTransmission("RunwayInsight.ogg", 1.186, "Airbase_ATC/Ground/PAR/", nil, 0.1)
    RadioObject:NewTransmission("ContactTower3.ogg", 3.122, "Airbase_ATC/Ground/PAR/", nil, 0.3)
    AI_ATC:TerminateSchedules(Alias)
    AI_ATC:ResetMenus(Alias)
    AI_ATC:TowerCheckIn2Menu(Alias)
  end
  MENU_GROUP_COMMAND:New(Group,"Runway in sight", ApproachMenu, function() RunwayInSight() end, Group)
  
  local function Cleared2Land()
    Cleared2LandFlag = true
    if not ATM.TowerControl[Alias] then
      ATM.TowerControl[Alias] = {RequestedApproach = "Instrument Straight in", State = "On Final Approach", Type = Type }
    else
      ATM.TowerControl[Alias].State = "On Final Approach"
    end
    local Subtitle = string.format("%s: Wind %s at %s. ", Title, WindDirection, WindSpeed)
    Subtitle = Subtitle .. "Cleared for the option"
    RadioObject:NewTransmission("DeadAir.ogg", 0.100, "Airbase_ATC/Ground/SoundFiles/", nil, 0.3, Subtitle, 7)
    RadioObject:NewTransmission("Wind.ogg", 0.583, "Airbase_ATC/Ground/SoundFiles/", nil, 0.1)
    AI_ATC:ReadHeading(WindDirection, RadioObject, Agency)
    RadioObject:NewTransmission("At.ogg", 0.38, "Airbase_ATC/Ground/SoundFiles/", nil, 0.1)
    AI_ATC:ReadNumber(WindSpeed, RadioObject, Agency)
    RadioObject:NewTransmission("Option.ogg", 1.115, "Airbase_ATC/Ground/SoundFiles/", nil, 0.05)
    AI_ATC:LandingManager(Alias, true)
  end
  
  local function TooLow()
    TooLowFlag = true
    local Subtitle = string.format("%s: Too low for safe approach. If runway is not in sight, execute published missed approach.", Title)
    RadioObject:NewTransmission("DeadAir.ogg",0.100,"Airbase_ATC/Ground/SoundFiles/",nil,nil,Subtitle,5)
    RadioObject:NewTransmission("TooLow.ogg", 4.697, "Airbase_ATC/Ground/SoundFiles/", nil, nil)
  end
  
  local function AtDecisionHeight()
    DecisionHeightFlag = true
    local Subtitle = string.format("%s: At decision height. If runway environment is not in sight, execute published missed approach.", Title)
    RadioObject:NewTransmission("DeadAir.ogg",0.100,"Airbase_ATC/Ground/SoundFiles/",nil,nil,Subtitle,5)
    RadioObject:NewTransmission("AtDecisionHeight.ogg", 0.983, "Airbase_ATC/Ground/PAR/", nil, nil)
    RadioObject:NewTransmission("RunwayEnv.ogg", 3.769, "Airbase_ATC/Ground/PAR/", nil, 0.1)
  end
  
  local function OverApproach()
    OverApproachFlag = true
    local Subtitle = string.format("%s: over approach lights.", Title)
    RadioObject:NewTransmission("DeadAir.ogg",0.100,"Airbase_ATC/Ground/SoundFiles/",nil,nil,Subtitle,2)
    RadioObject:NewTransmission("ApproachLights.ogg", 1.158, "Airbase_ATC/Ground/PAR/", nil, 0.1)
  end
  
  local function OverThreshold()
    OverThresholdFlag = true
    local Subtitle = string.format("%s: over landing threshold. Contact Incirlik Tower, on 360.100", Title)
    RadioObject:NewTransmission("DeadAir.ogg",0.100,"Airbase_ATC/Ground/SoundFiles/",nil,nil,Subtitle,4)
    RadioObject:NewTransmission("LandingThreshold.ogg", 1.159, "Airbase_ATC/Ground/PAR/", nil, nil)
    RadioObject:NewTransmission("ContactTower3.ogg", 3.122, "Airbase_ATC/Ground/PAR/", nil, 0.3)
    AI_ATC:ResetMenus(Alias)
    AI_ATC:TowerCheckIn2Menu(Alias)
  end
  
  local function AltAdvisory()
    AltAdvisoryFlag = true
    local feet = tostring(AltBase/1000)
    CalculateAltitude(feet)
    local Subtitle = string.format("%s: %s", Title, AltSubtitle)
    RadioObject:NewTransmission("DeadAir.ogg",0.100,"Airbase_ATC/Ground/SoundFiles/",nil,nil,Subtitle,2)
    RadioObject:NewTransmission(AltFile.filename, AltFile.duration, "Airbase_ATC/Ground/PAR/", nil, nil)
    AI_ATC:ReadFlightLevel(feet, RadioObject, Agency, true, 0.00)
  end
  
  local function AppGlidepath()
    ApproachingGlideFlag = true
    local Subtitle = string.format("%s: Approaching Glidepath, configure aircraft for landing.", Title)
    RadioObject:NewTransmission("DeadAir.ogg",0.100,"Airbase_ATC/Ground/SoundFiles/",nil,nil,Subtitle,2)
    RadioObject:NewTransmission("ApproachingGlidepath.ogg", 1.158, "Airbase_ATC/Ground/PAR/", nil, nil)
    RadioObject:NewTransmission("Configure.ogg", 1.488, "Airbase_ATC/Ground/PAR/", nil, 0.1)
  end
  
  local function BeginDescent()
    BeginDescentFlag = true
    local Subtitle = string.format("%s: Begin descent.", Title)
    RadioObject:NewTransmission("DeadAir.ogg",0.100,"Airbase_ATC/Ground/SoundFiles/",nil,nil,Subtitle, 2)
    RadioObject:NewTransmission("BeginDescent.ogg", 0.808, "Airbase_ATC/Ground/PAR/", nil, 0.1)
  end

  local function Distance2Land(distance)
    local Subtitle = string.format("%s: %d miles.", Title, distance)
    RadioObject:NewTransmission("DeadAir.ogg",0.100,"Airbase_ATC/Ground/SoundFiles/",nil,nil,Subtitle,2)
    AI_ATC:ReadDistance(tostring(distance), RadioObject, Agency)
  end
  
  local function OnCourseCall()
    local PARdata = AI_ATC.PARdata[Alias]
    local Subtitle = string.format("%s: heading %s.", Title, PARdata.HeadingStr)
    RadioObject:NewTransmission("DeadAir.ogg",0.100,"Airbase_ATC/Ground/SoundFiles/",nil,nil,Subtitle,3)
    RadioObject:NewTransmission("Heading.ogg", 0.449, "Airbase_ATC/Ground/PAR/", nil, 0.1)
    AI_ATC:ReadHeading(PARdata.HeadingStr, RadioObject, Agency)
  end
  
  local function CourseCall(direction)
    local PARdata = AI_ATC.PARdata[Alias]
    local AudioData = AudioTbl[direction]
    local Subtitle = string.format("%s: turn %s heading %s.", Title, direction, PARdata.HeadingStr)
    RadioObject:NewTransmission("DeadAir.ogg",0.100,"Airbase_ATC/Ground/SoundFiles/",nil,nil,Subtitle,3)
    RadioObject:NewTransmission(AudioData.filename, AudioData.duration, "Airbase_ATC/Ground/PAR/", nil, 0.1)
    AI_ATC:ReadHeading(PARdata.HeadingStr, RadioObject, Agency)
  end
  
  local function AudioTransmission()
    local PARdata = AI_ATC.PARdata[Alias]
    if not PARdata then return end
    local GlidepathData = PARdata.Glidepath or {}
    local CourseData    = PARdata.Course    or {}
    
    local dirKey    = CourseData.Direction
    local turnDir   = CourseData.TurnDirection
    local statKey   = CourseData.Status
    local gpStatKey = GlidepathData.Status
    local gpTrndKey = GlidepathData.Trend
    local crTrndKey = CourseData.Trend
  
    local GPStatus = gpStatKey and AudioTbl[gpStatKey] or nil
    local GPTrend  = gpTrndKey and AudioTbl[gpTrndKey] or nil
    local CRStatus = statKey   and AudioTbl[statKey]   or nil
    local CRTrend  = crTrndKey and AudioTbl[crTrndKey] or nil
    local CRDirAud = dirKey    and AudioTbl[dirKey]    or nil
  
    if SuppressGlidepathFlag and not BeginDescentFlag then
      GPStatus = nil
      GPTrend  = nil
    end
  
    local parts = {}
    if GPStatus and GPStatus.subtitle then table.insert(parts, GPStatus.subtitle) end
    
    if GPTrend and GPTrend.subtitle then
      table.insert(parts, GPTrend.subtitle)
    end
    
    local DescentAudio
    if ClimbNowFlag then
      DescentAudio = AudioTbl["climb now"]
      if DescentAudio then table.insert(parts, DescentAudio.subtitle) end
    elseif IncreaseDescentFlag then
      DescentAudio = AudioTbl["increase"]
      if DescentAudio then table.insert(parts, DescentAudio.subtitle) end
    elseif DecreaseDescentFlag then
      DescentAudio = AudioTbl["decrease"]
      if DescentAudio then table.insert(parts, DescentAudio.subtitle) end
    end
  
    if CRStatus and CRStatus.subtitle then table.insert(parts, CRStatus.subtitle) end
    if CRTrend  and CRTrend.subtitle  then table.insert(parts, CRTrend.subtitle)  end
    local willSpeakHeading = (statKey ~= "on course") and (PARdata.HeadingStr ~= nil)

    local FSM = PARdata.AudioFSM
    if willSpeakHeading and turnDir and FSM then
      local now     = timer.getTime()
      local newHdg  = tonumber(PARdata.HeadingStr)
      local changed = (newHdg ~= nil) and (FSM.LastSpokenHeading == nil or math.abs(newHdg - FSM.LastSpokenHeading) >= 1)
  
      -- Check if heading call was approved by Tick 6 decision logic
      local shouldCall = CourseData.ShouldCallHeading and changed and now >= (FSM.HeadingHoldUntil or 0)
      
      if shouldCall then
        CourseCall(turnDir)
        FSM.LastSpokenHeading = newHdg
        FSM.HeadingHoldUntil  = now + 3.0
        
        -- Update History to keep tracking synchronized
        if not AI_ATC.PARdata[Alias].History then
          AI_ATC.PARdata[Alias].History = {}
        end
        AI_ATC.PARdata[Alias].History.LastCalledHeading = newHdg
        AI_ATC.PARdata[Alias].History.LastHeadingCallTime = now
        
        --env.info(string.format("PAR[%s]: Off-course heading call - HDG=%s TURN=%s REASON=%s", 
          --Alias, PARdata.HeadingStr, turnDir, CourseData.CallReason or "UNKNOWN"))
      end
    end

    if CourseData.ShouldCallHeading and CourseData.Status == "on course" and PARdata.AudioFSM then
      OnCourseCall()
      --env.info(string.format("PAR[%s]: OnCourseCall() executed - cycle #%d", Alias, PARdata.AudioFSM.OnCourseCycleCount))
    end
    
    local Subtitle = table.concat(parts, ", ")
    RadioObject:NewTransmission("DeadAir.ogg", 0.100, "Airbase_ATC/Ground/SoundFiles/", nil, 0.3, Subtitle, 4)
  
    if GPStatus then RadioObject:NewTransmission(GPStatus.filename, GPStatus.duration, "Airbase_ATC/Ground/PAR/", nil, 0.1) end
    if GPTrend  then RadioObject:NewTransmission(GPTrend.filename,  GPTrend.duration,  "Airbase_ATC/Ground/PAR/", nil, 0.1) end
    
    if DescentAudio then
      RadioObject:NewTransmission(DescentAudio.filename, DescentAudio.duration, "Airbase_ATC/Ground/PAR/", nil, 0.1)
    end
    
    if CRStatus then RadioObject:NewTransmission(CRStatus.filename, CRStatus.duration, "Airbase_ATC/Ground/PAR/", nil, 0.1) end
    if CRTrend  then RadioObject:NewTransmission(CRTrend.filename,  CRTrend.duration,  "Airbase_ATC/Ground/PAR/", nil, 0.1) end
  end

  ---------------------------------------------------------------------------------------
  --*************************** APPROACH CONTROL FUNCTION *****************************--
  ---------------------------------------------------------------------------------------
  local function ApproachControl()
    
    local tick = AI_ATC.PARdata[Alias].ApproachTick

    -- Start timing for this execution cycle
    tick.CycleStartTime = timer.getTime()
    
    tick.tick1Complete = false
    tick.tick2Complete = false
    tick.tick3Complete = false
    tick.tick4Complete = false
    tick.tick5Complete = false
    tick.tick6Complete = false
    tick.tick7Complete = false
    tick.tick8Complete = false

    ---------------------------------------------------------------------------------------
    -- TICK 1 (0.1s): SETUP & POSITION DATA
    ---------------------------------------------------------------------------------------
    SCHEDULER:New(nil, function()
      if not ATM.ClientData[Alias] or not UnitObject then 
        return
      end
      if not AI_ATC.PARdata[Alias] then
        return
      end
      
      local tick = AI_ATC.PARdata[Alias].ApproachTick
      tick.SchedulerCount = tick.SchedulerCount + 1

      -- Get basic position data
      local UnitCoord = UnitObject:GetCoordinate()
      local Distance = TouchDownPoint:Get2DDistance(UnitCoord)
      local DistanceNM = Distance / 1852
      local DistanceCall = math.floor(DistanceNM + 0.5)
      local UnitAltitudeAGL = UnitObject:GetAltitude(true)
      local UnitAltitudeFeet = UnitAltitudeAGL * 3.28084
      
      -- Store in staging area
      tick.UnitCoord = UnitCoord
      tick.Distance = Distance
      tick.DistanceNM = DistanceNM
      tick.DistanceCall = DistanceCall
      tick.UnitAltitudeAGL = UnitAltitudeAGL
      tick.UnitAltitudeFeet = UnitAltitudeFeet
      
      -- Handle check-in on first scheduler iteration
      if tick.SchedulerCount == 1 then
        CheckIn()
        tick.tick1Complete = false -- Don't proceed to other ticks yet
        return
      end
      
      -- Initial glidepath evaluation (on second tick, after check-in)
      if tick.SchedulerCount == 2 and not SuppressGlidepathFlag then
        local initAltMSL = UnitObject:GetAltitude()
        local initAltDiff = initAltMSL - FieldElevMSL
        local initCorrectGP = Distance * math.tan(GlideslopeRad)
        local initGPDevAngle = math.deg(math.atan(initAltDiff / Distance)) - GlideslopeAngle
        local initAbsAngle = math.abs(initGPDevAngle)
        
        local initGPStatus = "on glidepath"
        if initAbsAngle > 0.2 then
          if initAbsAngle < 0.6 then
            initGPStatus = initGPDevAngle > 0 and "slightly above glidepath" or "slightly below glidepath"
          else
            initGPStatus = initGPDevAngle > 0 and "well above glidepath" or "well below glidepath"
          end
        end
        
        --env.info(string.format("PAR[%s] INITIAL GP EVAL: ALT=%dft MSL, GP_STATUS='%s', ANGLE=%+.2fdeg",
          --Alias, math.floor(initAltMSL * 3.28084), initGPStatus, initGPDevAngle))
        
        if initGPStatus == "well above glidepath" then
          SuppressGlidepathFlag = false
          BeginDescentFlag = true
          --env.info(string.format("PAR[%s] High on approach - glidepath guidance ENABLED", Alias))
        elseif initGPStatus == "slightly above glidepath" then
          SuppressGlidepathFlag = false
          BeginDescentFlag = true
        elseif initGPStatus == "well below glidepath" then
          local initAltFeet = initAltMSL * 3.28084
          local targetAlt = AltBase
          local tolerance = 300
          
          if initAltFeet >= (targetAlt - tolerance) and initAltFeet <= (targetAlt + tolerance) then
            SuppressGlidepathFlag = true
            --env.info(string.format("PAR[%s] At intercept altitude (%dft) - glidepath SUPPRESSED until intercept",
              --Alias, math.floor(initAltFeet)))
          else
            SuppressGlidepathFlag = true
            --env.info(string.format("PAR[%s] Wrong altitude (%dft) - issuing altitude advisory",
              --Alias, math.floor(initAltFeet)))
            SCHEDULER:New(nil, function() 
              AltAdvisory() 
            end, {}, 2.0)
          end
        else
          SuppressGlidepathFlag = false
          --env.info(string.format("PAR[%s] Near glidepath - normal guidance", Alias))
        end
      end
      
      -- Special callout flags
      if (not DecisionHeightFlag) and 
         ((UnitAltitudeFeet <= 313 and UnitAltitudeFeet > 150) or 
          (UnitAltitudeFeet <= 300 and Distance >= 3704)) then
        DecisionHeightFlag = true
      elseif (not OverApproachFlag) and (not OverThresholdFlag) and DecisionHeightFlag and (Distance <= 950) then
        OverApproachFlag = true
      elseif (not OverThresholdFlag) and (Distance <= 120) then
        OverThresholdFlag = true
      end
      
      AI_ATC.PARdata[Alias].CurrentDistance = DistanceCall
      
      tick.tick1Complete = true
      
    end, {}, 0.1)

    ---------------------------------------------------------------------------------------
    -- TICK 2 (0.2s): GLIDEPATH CALCULATION
    ---------------------------------------------------------------------------------------
    SCHEDULER:New(nil, function()
      if not AI_ATC.PARdata[Alias] then return end
      local tick = AI_ATC.PARdata[Alias].ApproachTick
      if not tick.tick1Complete then return end
      
      local Distance = tick.Distance
      local UnitAltitudeAGL = tick.UnitAltitudeAGL
      
      local UnitAltitude = UnitObject:GetAltitude()
      local AltDiff = UnitAltitude - FieldElevMSL
      local CorrectGlidepath = Distance * math.tan(GlideslopeRad)
      local GlidepathDeviation = (AltDiff - CorrectGlidepath) * 3.28084
      local DeviationAngle = math.deg(math.atan(AltDiff / Distance)) - GlideslopeAngle
      
      -- Initialize glidepath history if needed
      if not AI_ATC.PARdata[Alias].GlidepathHistory then
        AI_ATC.PARdata[Alias].GlidepathHistory = {
          LastDeviation = nil,
          LastUpdateTime = nil,
        }
      end
      
      local GPHistory = AI_ATC.PARdata[Alias].GlidepathHistory
      local currentTime = timer.getTime()
      local deltaTime = GPHistory.LastUpdateTime and (currentTime - GPHistory.LastUpdateTime) or 0.4
      
      -- Glidepath Status (position only)
      local GlidepathStatus = "on glidepath"
      local AbsAngle = math.abs(DeviationAngle)
      if AbsAngle > 0.2 then
        if AbsAngle < 0.6 then
          GlidepathStatus = DeviationAngle > 0 and "slightly above glidepath" or "slightly below glidepath"
        else
          GlidepathStatus = DeviationAngle > 0 and "well above glidepath" or "well below glidepath"
        end
      end
    
      -- ENHANCED TREND DETECTION
      local deviationRate = 0
      local absRate = 0
      if GPHistory.LastDeviation and deltaTime > 0.1 then
        deviationRate = (DeviationAngle - GPHistory.LastDeviation) / deltaTime
        absRate = math.abs(deviationRate)
      end
      
      local TrendStatus = nil
      local CorrectiveAction = "NONE"
      
      -- Reset all advisory flags
      IncreaseDescentFlag = false
      DecreaseDescentFlag = false
      ClimbNowFlag = false
      
      if GlidepathStatus ~= "on glidepath" then
        -- Rate threshold for trend detection (degrees per second)
        local slowThreshold = 0.015   -- ~1 degree per minute
        local rapidThreshold = 0.035  -- ~2 degrees per minute
        
        if absRate < slowThreshold then
          -- Minimal movement - holding position
          TrendStatus = "and holding"
          
          -- Set corrective flag if holding while off glidepath
          if DeviationAngle > 0.2 then
            CorrectiveAction = "INCREASE_DESCENT"
            IncreaseDescentFlag = true
          elseif DeviationAngle < -0.2 then
            -- Below and holding - may need slight correction
            CorrectiveAction = "HOLDING_LOW"
          end
          
        else
          -- Significant movement - determine direction
          local movingAway = (deviationRate > 0 and DeviationAngle > 0) or 
                            (deviationRate < 0 and DeviationAngle < 0)
          
          if movingAway then
            -- Drifting away from glidepath - WRONG DIRECTION
            if DeviationAngle > 0 then
              -- Above glidepath and climbing - need MORE descent
              TrendStatus = "and holding"  -- Use "holding" since no "climbing" audio
              CorrectiveAction = "INCREASE_DESCENT"
              IncreaseDescentFlag = true
              
            else
              -- Below glidepath and descending - DANGEROUS
              TrendStatus = "and holding"  -- Use "holding" since no "descending" audio
              
              -- URGENT: Well below and sinking fast = immediate action needed
              if GlidepathStatus == "well below glidepath" and absRate > rapidThreshold then
                CorrectiveAction = "CLIMB_NOW"
                ClimbNowFlag = true
              else
                CorrectiveAction = "DECREASE_DESCENT"
                DecreaseDescentFlag = true
              end
            end
          else
            -- Moving toward glidepath - GOOD (correcting)
            if DeviationAngle > 0 then
              TrendStatus = "coming down"
              CorrectiveAction = "CORRECTING"
            else
              TrendStatus = "coming up"
              CorrectiveAction = "CORRECTING"
            end
          end
        end
      end
      
      -- Build glidepath callout
      local GlidepathCallout = GlidepathStatus
      if TrendStatus and GlidepathStatus ~= "on glidepath" then
        GlidepathCallout = GlidepathStatus .. " " .. TrendStatus
      end
      
      -- Store results with enhanced data
      AI_ATC.PARdata[Alias].Glidepath = {
        DeviationFeet = GlidepathDeviation,
        DeviationAngle = DeviationAngle,
        Status = GlidepathStatus,
        Trend = TrendStatus,
        Callout = GlidepathCallout,
        PreviousAngle = DeviationAngle,
        DeviationRate = deviationRate,
        AbsRate = absRate,
        CorrectiveAction = CorrectiveAction,
      }
      
      -- Update history
      GPHistory.LastDeviation = DeviationAngle
      GPHistory.LastUpdateTime = currentTime
      
      -- Enhanced debug logging
      --env.info(string.format(
        --"PAR[%s] GLIDEPATH: ALT=%dft AGL=%dft CORRECT=%dft DEV=%+.1fft ANGLE=%+.2fdeg | STATUS='%s' PREV=%.2f TREND='%s' | RATE=%+.3f°/s ACTION=%s",
        --Alias, 
        --math.floor(UnitAltitude * 3.28084 + 0.5),
       --math.floor(UnitAltitudeAGL + 0.5),
        --math.floor(CorrectGlidepath * 3.28084 + 0.5),
        --GlidepathDeviation,
        --DeviationAngle,
        --GlidepathStatus,
        --GPHistory.LastDeviation and GPHistory.LastDeviation or -999,
        --TrendStatus or "nil",
        --deviationRate,
        --CorrectiveAction
      --))
      
      tick.GlidepathCallout = GlidepathCallout
      tick.tick2Complete = true
      
    end, {}, 0.2)

    ---------------------------------------------------------------------------------------
    -- TICK 3 (0.3s): COURSE GEOMETRY & WIND
    ---------------------------------------------------------------------------------------
    SCHEDULER:New(nil, function()
      if not AI_ATC.PARdata[Alias] then return end
      local tick = AI_ATC.PARdata[Alias].ApproachTick
      if not tick.tick1Complete then return end
      
      -- Helper functions
      local function V2(v3) return { x = v3.x, y = v3.z } end
      local function sub(a,b) return { x = a.x - b.x, y = a.y - b.y } end
      local function norm(a) local x,y=(a.x or 0),(a.y or 0); return math.sqrt(x*x + y*y) end
      
      -- Initialize history
      if not AI_ATC.PARdata[Alias].History then
        AI_ATC.PARdata[Alias].History = {
          LastCrossTrack = nil,
          LastUpdateTime = nil,
          LastCalledHeading = nil,
          LastHeadingCallTime = nil,
          StatusTransitionTime = nil,
        }
      end
      
      local History = AI_ATC.PARdata[Alias].History
      local currentTime = timer.getTime()
      local deltaTime = History.LastUpdateTime and (currentTime - History.LastUpdateTime) or 0.4
      
      local UnitCoord = tick.UnitCoord
      
      -- Get aircraft state
      local P3  = UnitCoord:GetVec3()
      local A3  = TouchDownPoint:GetVec3()
      local B3  = DepartureZone:GetVec3()
      local P   = V2(P3)
      local A   = V2(A3)
      local B   = V2(B3)
      
      -- Velocity and ground speed
      local velocity = UnitObject:GetVelocityVec3()
      local velocity2D = V2(velocity)
      local groundSpeed = norm(velocity2D)
      local groundSpeedKts = groundSpeed * 1.94384
      local magVar = AI_ATC.MagDec

      -- Ground track
      local actualTrackTrue
      if groundSpeed > 1.0 then
        actualTrackTrue = math.deg(math.atan2(velocity.x, velocity.z))
        if actualTrackTrue < 0 then actualTrackTrue = actualTrackTrue + 360 end
      else
        actualTrackTrue = UnitObject:GetHeading()
      end
      
      local actualTrackMag = (actualTrackTrue - magVar) % 360
      if actualTrackMag < 0 then actualTrackMag = actualTrackMag + 360 end
      local actualTrack = actualTrackMag
      
      local aircraftHeadingTrue = UnitObject:GetHeading()
      local aircraftHeadingMag = (aircraftHeadingTrue - magVar) % 360
      if aircraftHeadingMag < 0 then aircraftHeadingMag = aircraftHeadingMag + 360 end
    
      local thr_m  = UnitCoord:Get2DDistance(TouchDownPoint)
      local thr_nm = thr_m / 1852
    
      -- Centerline vector
      local AB_in  = sub(A, B)
      local AB_len = math.max(norm(AB_in), 1e-6)
      local hx, hy = AB_in.x / AB_len, AB_in.y / AB_len
    
      local AP  = sub(P, A)
      local t   = (AP.x * AB_in.x + AP.y * AB_in.y) / math.max(AB_len*AB_len, 1e-6)
    
      local along = AP.x * hx + AP.y * hy
      local cross = hx * AP.y - hy * AP.x
      local XTE_m  = math.abs(cross)
    
      local along_for_ang = (along >= 1.0) and along or 1.0
      local DeviationAngle = math.deg(math.atan2(cross, along_for_ang))
      local AbsDeviation   = math.abs(DeviationAngle)
      
      -- Wind correction angle
      local windCorrectionAngle = 0
      local windDebug = {
        available = false,
        altitude = 0,
        dirTrue = nil,
        dirMag = nil,
        spdKts = nil,
        relativeWind = nil,
        crosswind = nil,
        wca = 0
      }
      
      if groundSpeedKts > 50 then
        local aircraftAlt = UnitObject:GetAltitude()
        local windDirTrue, windSpeedMps = UnitCoord:GetWind()
        
        windDebug.altitude = math.floor(aircraftAlt * 3.28084)
        
        if windDirTrue and windSpeedMps then
          local windSpdKts = windSpeedMps * 1.94384
          local windDirMag = (windDirTrue - magVar) % 360
          if windDirMag < 0 then windDirMag = windDirMag + 360 end
          
          windDebug.dirTrue = windDirTrue
          windDebug.dirMag = windDirMag
          windDebug.spdKts = windSpdKts
          
          if windSpdKts > 1 then
            windDebug.available = true
            local relativeWind = ((windDirMag - RunwayHeading + 180) % 360) - 180
            windDebug.relativeWind = relativeWind
            
            local crosswindComponent = windSpdKts * math.sin(math.rad(relativeWind))
            windDebug.crosswind = crosswindComponent
            
            if groundSpeedKts > 0 then
              local sinWCA = crosswindComponent / groundSpeedKts
              sinWCA = math.max(-1.0, math.min(1.0, sinWCA))
              local wca = math.deg(math.asin(sinWCA))
              
              windCorrectionAngle = wca
              windDebug.wca = wca
              windDebug.wcaApplied = windCorrectionAngle
            end
          end
        end
      end
      
      -- Crosstrack rate
      local crossTrackRate = 0
      if History.LastCrossTrack and deltaTime > 0.1 then
        crossTrackRate = (cross - History.LastCrossTrack) / deltaTime
      end
      
      -- Direction
      local dir_eps = 1e-6
      local Direction
      if cross > dir_eps then
        Direction = "left"
      elseif cross < -dir_eps then
        Direction = "right"
      else
        local prevDir = AI_ATC.PARdata[Alias].Course and AI_ATC.PARdata[Alias].Course.Direction
        Direction = prevDir or "right"
      end
      
      -- Store Tick 3 results
      tick.geometry = {
        cross = cross,
        along = along,
        XTE_m = XTE_m,
        thr_m = thr_m,
        thr_nm = thr_nm,
        t = t,
        AB_len = AB_len,
      }
      
      tick.aircraft = {
        groundSpeed = groundSpeed,
        groundSpeedKts = groundSpeedKts,
        actualTrack = actualTrack,
        actualTrackTrue = actualTrackTrue,
        actualTrackMag = actualTrackMag,
        aircraftHeadingTrue = aircraftHeadingTrue,
        aircraftHeadingMag = aircraftHeadingMag,
        magVar = magVar,
      }
      
      tick.deviation = {
        DeviationAngle = DeviationAngle,
        AbsDeviation = AbsDeviation,
        crossTrackRate = crossTrackRate,
        absRate = math.abs(crossTrackRate),
      }
      
      tick.wind = {
        windCorrectionAngle = windCorrectionAngle,
        windDebug = windDebug,
      }
      
      tick.time = {
        currentTime = currentTime,
        deltaTime = deltaTime,
      }
      
      tick.Direction = Direction
      
      History.LastCrossTrack = cross
      History.LastUpdateTime = currentTime
      
      tick.tick3Complete = true
      
    end, {}, 0.3)

    ---------------------------------------------------------------------------------------
    -- TICK 4 (0.4s): COURSE CLASSIFICATION & TRENDS
    ---------------------------------------------------------------------------------------
    SCHEDULER:New(nil, function()
      if not AI_ATC.PARdata[Alias] then return end
      local tick = AI_ATC.PARdata[Alias].ApproachTick
      if not tick.tick3Complete then return end
      
      local geo = tick.geometry
      local dev = tick.deviation
      local Direction = tick.Direction
      
      local thr_nm = geo.thr_nm
      local cross = geo.cross
      local AbsDeviation = dev.AbsDeviation
      local crossTrackRate = dev.crossTrackRate
      local absRate = dev.absRate
      
      -- Previous status
      local prevStatus = AI_ATC.PARdata[Alias].Course and AI_ATC.PARdata[Alias].Course.Status or nil
      
      -- Thresholds with hysteresis - THREE STATE SYSTEM
      local OnCourseThreshold = (thr_nm > 6) and 0.5 or ((thr_nm > 3) and 0.3 or 0.2)
      local SlightThreshold   = (thr_nm > 6) and 1.5 or ((thr_nm > 3) and 1.25 or 1.0)
      local MediumThreshold   = (thr_nm > 6) and 4.5 or ((thr_nm > 3) and 3.5 or 3.0)
      
      local baseOnCourse = OnCourseThreshold
      local baseSlightThreshold = SlightThreshold
      local baseMediumThreshold = MediumThreshold
      
      local hysteresisMargin = 0.1
      local hysteresisApplied = "NONE"
      
      if prevStatus == "on course" then
        OnCourseThreshold = OnCourseThreshold + (hysteresisMargin * 0.5)
        hysteresisApplied = "ON_STAY"
      elseif prevStatus and prevStatus:find("well") then
        MediumThreshold = MediumThreshold - hysteresisMargin
        SlightThreshold = SlightThreshold - hysteresisMargin
        OnCourseThreshold = OnCourseThreshold - (hysteresisMargin * 0.5)
        hysteresisApplied = "WELL_EXIT"
      elseif prevStatus and (prevStatus == "left of course" or prevStatus == "right of course") then
        SlightThreshold = SlightThreshold - hysteresisMargin
        OnCourseThreshold = OnCourseThreshold - (hysteresisMargin * 0.5)
        hysteresisApplied = "MEDIUM_EXIT"
      elseif prevStatus and prevStatus:find("slightly") then
        OnCourseThreshold = OnCourseThreshold - (hysteresisMargin * 0.5)
        hysteresisApplied = "SLIGHT_EXIT"
      end
      
      local CourseStatus
      if AbsDeviation < OnCourseThreshold then
        CourseStatus = "on course"
      elseif AbsDeviation < SlightThreshold then
        CourseStatus = (cross > 0) and "slightly left of course" or "slightly right of course"
      elseif AbsDeviation < MediumThreshold then
        CourseStatus = (cross > 0) and "left of course" or "right of course"
      else
        CourseStatus = (cross > 0) and "well left of course" or "well right of course"
      end
      
      -- Trend analysis
      local courseTrend = nil
      if CourseStatus ~= "on course" then
        if absRate > 0.5 then
          local driftingAway = (crossTrackRate > 0 and cross > 0) or (crossTrackRate < 0 and cross < 0)
          
          if absRate > 1.5 then
            courseTrend = driftingAway and ("rapidly " .. Direction) or "correcting"
          else
            courseTrend = driftingAway and ("slowly " .. Direction) or "correcting"
          end
        else
          courseTrend = "and holding"
        end
      end
      
      -- Store Tick 4 results
      tick.course = {
        CourseStatus = CourseStatus,
        prevStatus = prevStatus,
        courseTrend = courseTrend,
        OnCourseThreshold = OnCourseThreshold,
        SlightThreshold = SlightThreshold,
        MediumThreshold = MediumThreshold,
        baseOnCourse = baseOnCourse,
        baseSlightThreshold = baseSlightThreshold,
        baseMediumThreshold = baseMediumThreshold,
        hysteresisApplied = hysteresisApplied,
      }
      
      tick.tick4Complete = true
      
    end, {}, 0.4)

    ---------------------------------------------------------------------------------------
    -- TICK 5 (0.5s): INTERCEPT ANGLE CALCULATION
    ---------------------------------------------------------------------------------------
    SCHEDULER:New(nil, function()
      if not AI_ATC.PARdata[Alias] then return end
      local tick = AI_ATC.PARdata[Alias].ApproachTick
      if not tick.tick4Complete then return end
      
      local function clamp(x, lo, hi)
        if x < lo then return lo elseif x > hi then return hi else return x end
      end
      
      local geo = tick.geometry
      local dev = tick.deviation
      local crs = tick.course
      local wnd = tick.wind
      
      local thr_nm = geo.thr_nm
      local cross = geo.cross
      local XTE_m = geo.XTE_m
      local DeviationAngle = dev.DeviationAngle
      local AbsDeviation = dev.AbsDeviation
      local crossTrackRate = dev.crossTrackRate
      local absRate = dev.absRate
      local CourseStatus = crs.CourseStatus
      local windCorrectionAngle = wnd.windCorrectionAngle
      
      local maxInt = (thr_nm > 10 and 20) or (thr_nm > 6 and 15) or (thr_nm > 3 and 10) or 6
      local gain = 1.25
      local xte_bonus = clamp((XTE_m / 100), 0, 6)
    
      -- Improvement tracking
      local prevAbs = AI_ATC.PARdata[Alias].Course and AI_ATC.PARdata[Alias].Course.CourseDeviation
      local improving = (prevAbs ~= nil) and (AbsDeviation < prevAbs - 0.02)
      
      -- Rate damping
      local rateDampingFactor = 1.0
      local dampingApplied = false
      if absRate > 1.5 then
        local correctingWell = (crossTrackRate > 0 and cross < 0) or (crossTrackRate < 0 and cross > 0)
        if correctingWell then
          rateDampingFactor = 0.7
          dampingApplied = true
        end
      end
    
      local interceptMethod = ""
      local InterceptAngle = 0
      
      if CourseStatus == "on course" then
        InterceptAngle = 0
        interceptMethod = "ON_COURSE"
    
      elseif CourseStatus == "slightly left of course" or CourseStatus == "slightly right of course" then
        local interceptBase
        
        if AbsDeviation < 0.5 then
          interceptBase = 1.5 + (AbsDeviation * 2.0)  -- Was 0.5 + 1.0*dev, now 1.5-2.5
        elseif AbsDeviation < 1.0 then
          interceptBase = 3.0 + (AbsDeviation * 1.5)  -- Was 1.0 + 1.0*dev, now 2.5-3.25
        elseif AbsDeviation < 1.5 then
          interceptBase = 4.0 + (AbsDeviation * 1.0)  -- Was 2.0 + 0.8*dev, now 3.5-4.0
        else
          interceptBase = 5.0 + (AbsDeviation * 0.8)  -- Was 3.0 + 0.5*dev, now 4.0+
        end
        
        local distanceBoost = 0
        if thr_nm > 6 and AbsDeviation > 1.0 then
          distanceBoost = 0.5
        end
        
        local improvementFactor = 1.0
        if improving and AbsDeviation < 1.0 then
          improvementFactor = 0.85  -- Slightly less reduction when improving
        end
        
        local dir = (cross > 0) and 1 or -1
        InterceptAngle = clamp(dir * (interceptBase + distanceBoost) * improvementFactor * rateDampingFactor, -maxInt, maxInt)
        
        interceptMethod = string.format("SLIGHT(base=%.1f dist=%.1f imp=%.2f)", interceptBase, distanceBoost, improvementFactor)
      
      elseif CourseStatus == "left of course" or CourseStatus == "right of course" then
        -- MEDIUM state - moderate deviations requiring active correction
        local interceptBase = 3.0 + ((AbsDeviation - 1.5) * 1.5)
        
        local distanceBoost = 0
        if thr_nm > 6 and AbsDeviation > 2.0 then
          distanceBoost = 0.5
        end
        
        local improvementFactor = 1.0
        if improving and AbsDeviation < 3.0 then
          improvementFactor = 0.85
        end
        
        local dir = (cross > 0) and 1 or -1
        InterceptAngle = clamp(dir * (interceptBase + distanceBoost) * improvementFactor * rateDampingFactor, -maxInt, maxInt)
        
        interceptMethod = string.format("MEDIUM(base=%.1f dist=%.1f imp=%.2f)", interceptBase, distanceBoost, improvementFactor)
      
      else
        -- "well L/R of course"
        local signed_bonus = (cross > 0) and xte_bonus or -xte_bonus
        InterceptAngle = clamp((DeviationAngle * gain + signed_bonus) * rateDampingFactor, -maxInt, maxInt)
        interceptMethod = string.format("WELL(gain=%.2f bonus=%+.1f)", gain, signed_bonus)
      end
    
      -- Close-in override (three-state system)
      local closeInOverride = false
      if thr_nm <= 0.6 then
        closeInOverride = true
        if AbsDeviation <= 0.3 then
          CourseStatus = "on course"
          InterceptAngle = 0
          interceptMethod = "CLOSE_ON"
        elseif AbsDeviation <= 1.0 then
          CourseStatus = (cross > 0) and "slightly left of course" or "slightly right of course"
          local dir = (cross > 0) and 1 or -1
          InterceptAngle = clamp(dir * math.max(2, AbsDeviation * 0.8), -maxInt, maxInt)
          interceptMethod = "CLOSE_SLIGHT"
        elseif AbsDeviation <= 3.0 then
          CourseStatus = (cross > 0) and "left of course" or "right of course"
          local dir = (cross > 0) and 1 or -1
          local mediumBase = 3.0 + ((AbsDeviation - 1.0) * 1.5)
          InterceptAngle = clamp(dir * mediumBase, -maxInt, maxInt)
          interceptMethod = "CLOSE_MEDIUM"
        else
          CourseStatus = (cross > 0) and "well left of course" or "well right of course"
          local signed_bonus = (cross > 0) and xte_bonus or -xte_bonus
          InterceptAngle = clamp((DeviationAngle * gain + signed_bonus) * rateDampingFactor, -maxInt, maxInt)
          interceptMethod = "CLOSE_WELL"
        end
      end
      
      -- Heading calculation
      local InterceptHeading = (RunwayHeading + InterceptAngle + windCorrectionAngle) % 360
      if InterceptHeading < 0 then InterceptHeading = InterceptHeading + 360 end
      
      -- Store Tick 5 results
      tick.intercept = {
        InterceptAngle = InterceptAngle,
        InterceptHeading = InterceptHeading,
        interceptMethod = interceptMethod,
        maxInt = maxInt,
        rateDampingFactor = rateDampingFactor,
        dampingApplied = dampingApplied,
        improving = improving,
        closeInOverride = closeInOverride,
      }
      
      -- Update CourseStatus if close-in override changed it
      tick.course.CourseStatus = CourseStatus
      
      tick.tick5Complete = true
      
    end, {}, 0.5)

    ---------------------------------------------------------------------------------------
    -- TICK 6 (0.6s): HEADING DECISION LOGIC
    ---------------------------------------------------------------------------------------
    SCHEDULER:New(nil, function()
      if not AI_ATC.PARdata[Alias] then return end
      local tick = AI_ATC.PARdata[Alias].ApproachTick
      if not tick.tick5Complete then return end
      
      local air = tick.aircraft
      local crs = tick.course
      local int = tick.intercept
      local tim = tick.time
      local Direction = tick.Direction
      
      local History = AI_ATC.PARdata[Alias].History
      local currentTime = tim.currentTime
      
      local shouldCallHeading = false
      local headingToCall = int.InterceptHeading
      local callReason = "NONE"
      
      local trackError = ((int.InterceptHeading - air.actualTrack + 180) % 360) - 180
      local trackErrorMag = ((int.InterceptHeading - air.actualTrackMag + 180) % 360) - 180
      local headingError = ((int.InterceptHeading - air.aircraftHeadingMag + 180) % 360) - 180
      
      local turnDirection = nil
      if math.abs(headingError) > 1 then
        if headingError > 0 then
          turnDirection = "right"
        else
          turnDirection = "left"
        end
      end
      
      if crs.CourseStatus ~= "on course" then
        -- IMMEDIATE heading call when departing FROM on-course
        if crs.prevStatus == "on course" then
          -- Check if we've passed decision height - if so, suppress course calls
          local FSM = AI_ATC.PARdata[Alias].AudioFSM
          if FSM and FSM.Did_DH then
            --env.info(string.format("PAR[%s]: SUPPRESSED immediate course call (post-DH)", Alias))
            -- Don't make the call, just reset the on-course tracking
            crs.OnCourseCycleCount = 0
            History.WasOnCourse = false
          else
            local departureHeading = math.floor(int.InterceptHeading + 0.5)
            local voiceHeading = (departureHeading == 0) and 360 or departureHeading
            local headingStr = string.format("%03d", voiceHeading)
            
            -- ALWAYS provide immediate correction when departing centerline
            -- This is critical for PAR - no filtering needed
            local departureTurnDir = turnDirection
          if not departureTurnDir then
            if headingError > 0 then
              departureTurnDir = "right"
            elseif headingError < 0 then
              departureTurnDir = "left"
            else
              departureTurnDir = (Direction == "left") and "right" or "left"
            end
          end
          
          AI_ATC.PARdata[Alias].HeadingStr = headingStr
          CourseCall(departureTurnDir)
          
          History.LastCalledHeading = departureHeading
          History.LastHeadingCallTime = currentTime
          shouldCallHeading = false
          callReason = "DEPARTED_ON_COURSE_IMMEDIATE"
          --env.info(string.format("PAR[%s]: DEPARTED ON-COURSE IMMEDIATE CALL - HDG=%03d TURN=%s", 
            --Alias, departureHeading, departureTurnDir))
          end  -- End of if FSM and FSM.Did_DH else block
        
        
        elseif not History.LastCalledHeading then
          shouldCallHeading = true
          callReason = "INITIAL"
        elseif math.abs(((int.InterceptHeading - History.LastCalledHeading + 180) % 360) - 180) >= 2 then
          -- Call immediately if commanded heading changed by 2+ degrees
          -- This catches course corrections and prevents delayed guidance
          shouldCallHeading = true
          callReason = "HDG_CHANGE"
        elseif History.LastHeadingCallTime and (currentTime - History.LastHeadingCallTime) >= 1.5 and
               not crs.Improving and History.WasImproving then
          -- If aircraft WAS improving but stopped, issue corrective heading
          -- Wait at least 1.5s since last call to avoid rapid-fire
          shouldCallHeading = true
          callReason = "STOPPED_IMPROVING"
        elseif (crs.CourseStatus == "slightly left of course" or crs.CourseStatus == "slightly right of course") and
               History.LastHeadingCallTime and (currentTime - History.LastHeadingCallTime) > 2.0 then
          -- FREQUENT heading calls when "slightly" off course - every 2s
          shouldCallHeading = true
          callReason = "SLIGHT_PERIODIC"
        elseif (crs.CourseStatus == "left of course" or crs.CourseStatus == "right of course") and
               History.LastHeadingCallTime and (currentTime - History.LastHeadingCallTime) > 2.5 then
          -- FREQUENT heading calls for medium deviation - every 2.5s  
          shouldCallHeading = true
          callReason = "MEDIUM_PERIODIC"
        elseif (crs.CourseStatus == "well left of course" or crs.CourseStatus == "well right of course") and
               History.LastHeadingCallTime and (currentTime - History.LastHeadingCallTime) > 3.0 then
          -- FREQUENT heading calls for well off course - every 3s
          shouldCallHeading = true
          callReason = "WELL_PERIODIC"
        elseif math.abs(trackError) > 8 and 
               History.LastHeadingCallTime and (currentTime - History.LastHeadingCallTime) > 6 then
          shouldCallHeading = true
          callReason = "TRACK_ERROR"
        end
      else
        -- ON COURSE logic
        local FSM = AI_ATC.PARdata[Alias].AudioFSM
        
        if crs.prevStatus and crs.prevStatus ~= "on course" then
          -- JUST REACHED on-course status (transition)
          -- Check if we've passed decision height - if so, suppress course calls
          if FSM and FSM.Did_DH then
            --env.info(string.format("PAR[%s]: SUPPRESSED reached on-course call (post-DH)", Alias))
            FSM.OnCourseCycleCount = 1
          else
            FSM.OnCourseCycleCount = 1
            
            local immediateHeading = math.floor(int.InterceptHeading + 0.5)
            local voiceHeading = (immediateHeading == 0) and 360 or immediateHeading
            local headingStr = string.format("%03d", voiceHeading)
            
            -- ALWAYS provide heading when reaching on-course to prevent drift
            -- This is CRITICAL for PAR operations - NO SUPPRESSION
            local immediateTurnDir = turnDirection
          if not immediateTurnDir then
            if headingError > 0 then
              immediateTurnDir = "right"
            elseif headingError < 0 then
              immediateTurnDir = "left"
            else
              immediateTurnDir = (Direction == "left") and "right" or "left"
            end
          end
          
          AI_ATC.PARdata[Alias].HeadingStr = headingStr
          CourseCall(immediateTurnDir)
          
          History.LastCalledHeading = immediateHeading
          History.LastHeadingCallTime = currentTime
          shouldCallHeading = false
          callReason = "REACHED_ON_COURSE_IMMEDIATE"
          --env.info(string.format("PAR[%s]: REACHED ON-COURSE - IMMEDIATE heading call HDG=%03d TURN=%s (CRITICAL)", 
            --Alias, immediateHeading, immediateTurnDir))
          end  -- End of if FSM and FSM.Did_DH else block
        else
          -- ALREADY on-course (steady state) - increment cycle count for periodic heading calls
          FSM.OnCourseCycleCount = FSM.OnCourseCycleCount + 1
          
          -- Every second "on course" callout (cycles 3, 5, 7, 9, etc.) should include heading
          if FSM.OnCourseCycleCount >= 3 and (FSM.OnCourseCycleCount % 2 == 1) then
            shouldCallHeading = true
            headingToCall = int.InterceptHeading
            callReason = string.format("ON_COURSE_PERIODIC_%d", FSM.OnCourseCycleCount)
            
            --env.info(string.format("PAR[%s]: ON-COURSE cycle #%d - WILL call heading %03d (every 2nd cycle)", 
              --Alias, FSM.OnCourseCycleCount, math.floor(int.InterceptHeading + 0.5)))
          else
            shouldCallHeading = false
            --env.info(string.format("PAR[%s]: ON-COURSE cycle #%d - NO heading callout this cycle", 
              --Alias, FSM.OnCourseCycleCount))
          end
        end
      end
      
      -- Store Tick 6 results
      tick.heading = {
        shouldCallHeading = shouldCallHeading,
        headingToCall = headingToCall,
        callReason = callReason,
        turnDirection = turnDirection,
        trackError = trackError,
        trackErrorMag = trackErrorMag,
        headingError = headingError,
      }
      
      -- Update history if heading was called
      if shouldCallHeading then
        History.LastCalledHeading = headingToCall
        History.LastHeadingCallTime = currentTime
      end
      
      -- Always track improvement trend for next cycle
      History.WasImproving = crs.Improving or false
      
      tick.tick6Complete = true
      
    end, {}, 0.6)

    ---------------------------------------------------------------------------------------
    -- TICK 7 (0.7s): PAR CALLOUT ASSEMBLY & DEBUG LOGGING
    ---------------------------------------------------------------------------------------
    SCHEDULER:New(nil, function()
      if not AI_ATC.PARdata[Alias] then return end
      local tick = AI_ATC.PARdata[Alias].ApproachTick
      if not tick.tick6Complete then return end
      
      local geo = tick.geometry
      local air = tick.aircraft
      local dev = tick.deviation
      local crs = tick.course
      local wnd = tick.wind
      local int = tick.intercept
      local hdg = tick.heading
      local tim = tick.time
      local History = AI_ATC.PARdata[Alias].History
      
      -- Assemble PAR callout
      local CourseStatus = crs.CourseStatus
      local speakHeading = int.InterceptHeading
      
      if CourseStatus ~= "on course" then
        speakHeading = NudgeHeading(int.InterceptHeading, RunwayHeading)
      end
      
      local roundedHeading = math.floor(speakHeading + 0.5)
      local VoiceHeading = (roundedHeading == 0) and 360 or roundedHeading
      local HeadingStr = string.format("%03d", VoiceHeading)
      
      local GlidepathCallout = tick.GlidepathCallout or "on glidepath"
      local CourseCallout = CourseStatus
      local PARCallout = GlidepathCallout .. ", " .. CourseCallout
      
      if CourseStatus ~= "on course" then
        PARCallout = PARCallout .. ", fly heading " .. HeadingStr
      end
      
      AI_ATC.PARdata[Alias].PARCallout = PARCallout
      AI_ATC.PARdata[Alias].HeadingStr = HeadingStr
      
      -- Debug logging
      --env.info(string.format(
        --"PAR[%s] GEOM: RWY=%03d THR=%.2fnm XTE=%+.1fm ALONG=%+.0fm CROSS=%+.1fm",
        --Alias, RunwayHeading, geo.thr_nm, geo.XTE_m, geo.along, geo.cross
      --))
      
      local windStr = wnd.windDebug.available and 
        string.format("@%dft WD=%03dT/%03dM WS=%02dkt REL=%+.1f XW=%+.1fkt WCA=%+.1f", 
          wnd.windDebug.altitude, 
          math.floor(wnd.windDebug.dirTrue + 0.5), 
          math.floor(wnd.windDebug.dirMag + 0.5),
          math.floor(wnd.windDebug.spdKts + 0.5),
          wnd.windDebug.relativeWind,
          wnd.windDebug.crosswind,
          wnd.windDebug.wcaApplied) or
        string.format("@%dft UNAVAIL", wnd.windDebug.altitude)
      
      --env.info(string.format(
        --"PAR[%s] STATE: GS=%.0fkt TRK=%03dT/%03dM (MagVar=%+d) | WIND: %s",
        --Alias, air.groundSpeedKts, math.floor(air.actualTrackTrue + 0.5), 
        --math.floor(air.actualTrackMag + 0.5), math.floor(air.magVar), windStr
      --))
      
      --env.info(string.format(
        --"PAR[%s] COURSE: DEV=%+.2f (ABS=%.2f) DIR=%s | THRESH: OnCrs=%.2f[%.2f] Slight=%.2f[%.2f] Medium=%.2f[%.2f] HYS=%s | STATUS='%s' PREV='%s'",
        --Alias, dev.DeviationAngle, dev.AbsDeviation, tick.Direction,
        --crs.OnCourseThreshold, crs.baseOnCourse, crs.SlightThreshold, crs.baseSlightThreshold,
        --crs.MediumThreshold, crs.baseMediumThreshold,
        --crs.hysteresisApplied, crs.CourseStatus, crs.prevStatus or "nil"
      --))
      
      --env.info(string.format(
        --"PAR[%s] RATE: XTE_RATE=%+.2fm/s (ABS=%.2f) DT=%.3fs | PREV_DEV=%.2f IMPROVING=%s | TREND='%s'",
        --Alias, dev.crossTrackRate, dev.absRate, tim.deltaTime,
        --AI_ATC.PARdata[Alias].Course and AI_ATC.PARdata[Alias].Course.CourseDeviation or -999, 
        --tostring(int.improving), crs.courseTrend or "nil"
      --))
      
      --env.info(string.format(
        --"PAR[%s] INTCPT: METHOD=%s ANGLE=%+d MAX=%d DAMP=%.2f(%s) | HDG_CMD=%03d (RWY+INT+WCA=%03d%+d%+.1f)",
        --Alias, int.interceptMethod, math.floor(int.InterceptAngle + 0.5), int.maxInt, 
        --int.rateDampingFactor, int.dampingApplied and "YES" or "NO",
        --math.floor(int.InterceptHeading + 0.5), RunwayHeading, 
        --math.floor(int.InterceptAngle + 0.5), wnd.windCorrectionAngle
      --))
      
      local lastCallDelta = History.LastHeadingCallTime and 
        string.format("%.1fs", tim.currentTime - History.LastHeadingCallTime) or "never"
      local lastHdgDelta = History.LastCalledHeading and
        string.format("%+d", math.floor(((int.InterceptHeading - History.LastCalledHeading + 180) % 360) - 180)) or "n/a"
      
      --env.info(string.format(
        --"PAR[%s] TRACK_ERR: vs_TRUE=%+.1f vs_MAG=%+.1f | HDG_ERR=%+.1f HDG=%03dM | CALL_HDG=%s REASON=%s TO_HDG=%03d LAST=%s DELTA=%s CLOSE_IN=%s",
        --Alias, hdg.trackError, hdg.trackErrorMag, hdg.headingError, math.floor(air.aircraftHeadingMag + 0.5),
        --hdg.shouldCallHeading and "YES" or "NO", hdg.callReason,
        --math.floor(hdg.headingToCall + 0.5), lastCallDelta, lastHdgDelta,
        --int.closeInOverride and "YES" or "NO"
      --))
    
      --env.info(string.format("PAR[%s] ------------------------------------------------", Alias))
      
      tick.tick7Complete = true
      
    end, {}, 0.7)

    ---------------------------------------------------------------------------------------
    -- TICK 8 (0.8s): FINAL DATA STORAGE
    ---------------------------------------------------------------------------------------
    SCHEDULER:New(nil, function()
      if not AI_ATC.PARdata[Alias] then return end
      local tick = AI_ATC.PARdata[Alias].ApproachTick
      if not tick.tick7Complete then return end
      
      local geo = tick.geometry
      local air = tick.aircraft
      local dev = tick.deviation
      local crs = tick.course
      local wnd = tick.wind
      local int = tick.intercept
      local hdg = tick.heading
      local History = AI_ATC.PARdata[Alias].History
      local tim = tick.time
      
      -- Store final course data
      AI_ATC.PARdata[Alias].Course = {
        CourseDeviation   = dev.AbsDeviation,
        Direction         = tick.Direction,
        TurnDirection     = hdg.turnDirection,
        RawDeviationAngle = dev.DeviationAngle,
        Status            = crs.CourseStatus,
        CourseState       = crs.CourseStatus,
        PrevStatus        = crs.prevStatus,
        Trend             = crs.courseTrend,
        Callout           = crs.CourseStatus,
        InterceptHeading  = int.InterceptHeading,
        InterceptAngle    = int.InterceptAngle,
        CrossTrack_m      = geo.cross,
        AlongTrack_m      = tick.geometry.t * tick.geometry.AB_len,
        CrossTrackRate    = dev.crossTrackRate,
        ActualTrack       = air.actualTrack,
        ActualTrackTrue   = air.actualTrackTrue,
        ActualTrackMag    = air.actualTrackMag,
        MagneticVariation = air.magVar,
        WindCorrectionAngle = wnd.windCorrectionAngle,
        TrackError        = hdg.trackError,
        TrackErrorMag     = hdg.trackErrorMag,
        ShouldCallHeading = hdg.shouldCallHeading,
        HeadingToCall     = hdg.headingToCall,
        CallReason        = hdg.callReason,
        WindDebug         = wnd.windDebug,
        GroundSpeedKts    = air.groundSpeedKts,
        InterceptMethod   = int.interceptMethod,
        RateDampingFactor = int.rateDampingFactor,
        DampingApplied    = int.dampingApplied,
        HysteresisApplied = crs.hysteresisApplied,
        CloseInOverride   = int.closeInOverride,
      }
      
      -- Track status transitions
      if crs.prevStatus ~= crs.CourseStatus then
        History.StatusTransitionTime = tim.currentTime
        
        local FSM = AI_ATC.PARdata[Alias].AudioFSM
        if crs.prevStatus == "on course" and crs.CourseStatus ~= "on course" then
          FSM.OnCourseCycleCount = 0
          --env.info(string.format("PAR[%s]: Departed on-course status - reset counter", Alias))
        end
      end
      
      -- Clear completion flags for next cycle
      tick.tick1Complete = false
      tick.tick2Complete = false
      tick.tick3Complete = false
      tick.tick4Complete = false
      tick.tick5Complete = false
      tick.tick6Complete = false
      tick.tick7Complete = false
      
      tick.tick8Complete = true
      
      -- Debug: Log execution time
      local executionTime = timer.getTime() - (tick.CycleStartTime or timer.getTime())
      --env.info(string.format("PAR[%s]: Tick 8 complete - execution time: %.3fs", Alias, executionTime))
      
    end, {}, 0.8)

    ---------------------------------------------------------------------------------------
    -- TICK 9 (0.9s): AUDIO FSM
    ---------------------------------------------------------------------------------------
    SCHEDULER:New(nil, function()
      if not AI_ATC.PARdata[Alias] then return end
      local tick = AI_ATC.PARdata[Alias].ApproachTick
      
      -- Initialize FSM
      AI_ATC.PARdata[Alias].AudioFSM = AI_ATC.PARdata[Alias].AudioFSM or {
        State = "IDLE",
        LastDistanceCalled = 999,
        LastCourseStatus = nil,
        Did_DH  = false,
        Did_APR = false,
        Did_THR = false,
        LastSpokenHeading = nil,
        HeadingHoldUntil  = 0.0,
        PauseUntil = 0.0,
        OnCourseCycleCount = 0,
      }
    
      local FSM     = AI_ATC.PARdata[Alias].AudioFSM
      local PARdata = AI_ATC.PARdata[Alias]
      local CurrentDistance = PARdata.CurrentDistance or 999
      local currentTime = timer.getTime()
      
      local Distance = tick.Distance or 99999
      local DistanceNM = Distance / 1852
      local UnitAltitudeAGL = tick.UnitAltitudeAGL or 0
      
      -- PRIORITY 1: SPECIAL CALLOUTS
      if DecisionHeightFlag and not FSM.Did_DH then
        FSM.Did_DH = true
        if Distance >= 3704 then
          --env.info(string.format("PAR FSM [%s]: SPECIAL CALLOUT - TOO LOW", Alias))
          TooLow()
        else
          --env.info(string.format("PAR FSM [%s]: SPECIAL CALLOUT - Decision Height", Alias))
          AtDecisionHeight()
        end
        return
      end
      
      if OverApproachFlag and not FSM.Did_APR then
        FSM.Did_APR = true
        --env.info(string.format("PAR FSM [%s]: SPECIAL CALLOUT - Over Approach Lights", Alias))
        OverApproach()
        return
      end
      
      if OverThresholdFlag and not FSM.Did_THR then
        FSM.Did_THR = true
        ----env.info(string.format("PAR FSM [%s]: SPECIAL CALLOUT - Over Landing Threshold", Alias))
        OverThreshold()
        if SchedulerObject and SchedulerObject.Stop then
          SchedulerObject:Stop()
          SchedulerObject = nil
          AI_ATC.PARdata[Alias] = nil
        end
        return
      end
      
      -- Once decision height is reached, suppress all course/glidepath guidance
      -- Only special callouts (approach lights and threshold) should proceed
      if FSM.Did_DH then
        --env.info(string.format("PAR FSM [%s]: Post-DH - suppressing all regular guidance", Alias))
        return
      end
      
      -- PRIORITY 2: GLIDEPATH INTERCEPT
      local RawGlidepathData = PARdata and PARdata.Glidepath or {}
      local rawGpStatus = RawGlidepathData.Status
      
      if not AI_ATC.PARdata[Alias].GlidepathTracking then
        AI_ATC.PARdata[Alias].GlidepathTracking = {
          SeenAbove = false,
          SeenBelow = false,
          SeenOn = false,
        }
      end
      local GPTrack = AI_ATC.PARdata[Alias].GlidepathTracking
      
      if rawGpStatus == "slightly above glidepath" or rawGpStatus == "well above glidepath" then
        GPTrack.SeenAbove = true
      elseif rawGpStatus == "slightly below glidepath" or rawGpStatus == "well below glidepath" then
        GPTrack.SeenBelow = true
      elseif rawGpStatus == "on glidepath" then
        GPTrack.SeenOn = true
      end
      
      if not ApproachingGlideFlag then
        local shouldCallApproaching = false
        local approachReason = ""
        
        if rawGpStatus == "slightly below glidepath" then
          shouldCallApproaching = true
          approachReason = "classic intercept from below"
        elseif tick.SchedulerCount >= 2 and tick.SchedulerCount <= 3 and rawGpStatus == "on glidepath" then
          shouldCallApproaching = true
          approachReason = "started on glidepath"
        elseif GPTrack.SeenAbove and rawGpStatus == "slightly above glidepath" then
          shouldCallApproaching = true
          approachReason = "intercepting from above"
        elseif DistanceNM < 6.0 and not ApproachingGlideFlag then
          shouldCallApproaching = true
          approachReason = "distance fallback"
        end
        
        if shouldCallApproaching then
          ApproachingGlideFlag = true
          --env.info(string.format("PAR FSM [%s]: APPROACHING GLIDEPATH - Reason: %s", Alias, approachReason))
          AppGlidepath()
          return
        end
      end
      
      if ApproachingGlideFlag and not BeginDescentFlag then
        local shouldCallBeginDescent = false
        local descentReason = ""
        
        if rawGpStatus == "on glidepath" then
          shouldCallBeginDescent = true
          descentReason = "established on glidepath"
        elseif DistanceNM < 4.0 then
          shouldCallBeginDescent = true
          descentReason = "distance fallback at 4nm"
        end
        
        if shouldCallBeginDescent then
          BeginDescentFlag = true
          --env.info(string.format("PAR FSM [%s]: BEGIN DESCENT - Reason: %s", Alias, descentReason))
          BeginDescent()
          return
        end
      end
      
      -- PRIORITY 3: SUPPRESSION
      -- Don't suppress if we have pending special callouts that need to be announced
      local hasSpecialCallouts = (DecisionHeightFlag and not FSM.Did_DH) or 
                                  (OverApproachFlag and not FSM.Did_APR) or 
                                  (OverThresholdFlag and not FSM.Did_THR)
      
      if Distance <= 1000 and not hasSpecialCallouts then
        if FSM.State ~= "SUPPRESSED" then
          --env.info(string.format("PAR FSM [%s]: REGULAR PAR SUPPRESSED - Dist=%.2fnm AGL=%dft",             
            --Alias, DistanceNM, math.floor(UnitAltitudeAGL)))
          FSM.State = "SUPPRESSED"
        end
        return
      end
      
      if FSM.State == "SUPPRESSED" then
        --env.info(string.format("PAR FSM [%s]: Resuming regular PAR guidance", Alias))
        FSM.State = "IDLE"
      end
      
      -- PRIORITY 4: REGULAR FSM
      if FSM.State == "IDLE" then
        local roundedDistance = math.floor(CurrentDistance + 0.5)
        if roundedDistance ~= FSM.LastDistanceCalled and roundedDistance >= 1 and roundedDistance <= 15 then
          FSM.State = "DISTANCE_CALL"
          FSM.LastDistanceCalled = roundedDistance
          --env.info(string.format("PAR FSM [%s]: IDLE -> DISTANCE_CALL (Distance: %d)", Alias, roundedDistance))
        else
          FSM.State = "PAR_GUIDANCE"
          --env.info(string.format("PAR FSM [%s]: IDLE -> PAR_GUIDANCE (no distance call)", Alias))
        end
    
      elseif FSM.State == "DISTANCE_CALL" then
        Distance2Land(FSM.LastDistanceCalled)
    
        if FSM.LastDistanceCalled == 5 and not Cleared2LandFlag then
          Cleared2Land()
        end
      
        FSM.State = "PAR_GUIDANCE"
        --env.info(string.format("PAR FSM [%s]: DISTANCE_CALL -> PAR_GUIDANCE", Alias))
        
      elseif FSM.State == "PAR_GUIDANCE" then
        AudioTransmission()
        
        SCHEDULER:New(nil, function()
          FSM.State = "PAUSING"
          FSM.PauseUntil = timer.getTime() + 4.0
          ----env.info(string.format("PAR FSM [%s]: PAR_GUIDANCE -> PAUSING (3s)", Alias))
        end, {}, 4.0)
        
        FSM.State = "WAITING_FOR_PAUSE"
    
      elseif FSM.State == "WAITING_FOR_PAUSE" then
        -- Wait for scheduled transition
        
      elseif FSM.State == "PAUSING" then
        if currentTime >= FSM.PauseUntil then
          FSM.State = "IDLE"
          ----env.info(string.format("PAR FSM [%s]: PAUSING -> IDLE", Alias))
        end
      end
      
    end, {}, 0.9)
  
  end

  SchedulerObject = SCHEDULER:New(nil, function()
    if not ATM.ClientData[Alias] or not UnitObject then 
      SchedulerObject:Stop()
      return
    end
    if not AI_ATC.PARdata[Alias] then
      SchedulerObject:Stop()
      return
    end
    ApproachControl()
  end, {}, 1, 1)
  table.insert(SchedulerObjects, SchedulerObject)

end
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--****************************************************************************GCA SAY INTENTIONS********************************************************************************--
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function AI_ATC:GCAPushTower(Alias, RadioObject)
  local Agency = "Tower"
  local Transmitter = "Tower"
  local Title = string.format("%s %s", AI_ATC.Airbase, Transmitter)
  local ClientData = ATM.ClientData[Alias]
  local Unit = ClientData.Unit
  local Type = ClientData.Chart
  local Group = Unit:GetGroup()
  local SchedulerObjects = ClientData.SchedulerObjects
  local Callsign = ClientData.Callsign
  local FlightCallsign = ClientData.FlightCallsign
  local Flight = ClientData.Flight
  local CallsignSub = Flight and FlightCallsign or Callsign
  local Delay = 1.5 + math.random() * (2.5 - 1.5)
  
  if Type=="PAR" then
    Title = "Final Controller"
    Transmitter = "SFA"
  end

  if AI_ATC:FunctionDelay(Alias, function() AI_ATC:GCAPushTower(Alias, RadioObject) end, Transmitter)==false then
    return
  end
  
  AI_ATC:TerminateSchedules(Alias)
  AI_ATC:ResetMenus(Alias)
  AI_ATC:TowerCheckIn2Menu(Alias)
  USERSOUND:New("RADIO_TRANS_START.ogg"):ToUnit(Unit)
  
  local function Message()
    SCHEDULER:New(nil, function()
      AI_ATC:ChannelOpen(12, Transmitter, Alias)
      AI_ATC:RepeatLastTransmission(Alias, function()Message() end)
      local Subtitle = string.format("%s: %s Contact Incirlik Tower, on 360.100.", Title, CallsignSub)
      RadioObject:NewTransmission("DeadAir.ogg", 0.100, "Airbase_ATC/Ground/SoundFiles/", nil, 0.3, Subtitle, 3)
      AI_ATC:Callsign(Callsign, RadioObject, Agency, Flight)
      RadioObject:NewTransmission("ContactTower3.ogg", 3.122, "Airbase_ATC/Ground/SoundFiles/", nil, 0.01)
    end, {}, Delay)
  end
  
  Message()
end
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--****************************************************************************GCA SAY INTENTIONS********************************************************************************--
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function AI_ATC:GCATowerCheckIn(Alias)
  local Transmitter = "Tower"
  local RadioObject = TOWER_RADIO
  local Title = string.format("%s %s", AI_ATC.Airbase, Transmitter)
  local ClientData = ATM.ClientData[Alias]
  local Unit = ClientData.Unit
  local Type = ClientData.Chart
  local Group = Unit:GetGroup()
  local SchedulerObjects = ClientData.SchedulerObjects
  local Callsign = ClientData.Callsign
  local FlightCallsign = ClientData.FlightCallsign
  local Flight = ClientData.Flight
  local CallsignSub = Flight and FlightCallsign or Callsign
  local Delay = 1.5 + math.random() * (2.5 - 1.5)

  
  if AI_ATC:FunctionDelay(Alias, function() AI_ATC:GCATowerCheckIn(Alias) end, Transmitter)==false then
    return
  end
  USERSOUND:New("RADIO_TRANS_START.ogg"):ToUnit(Unit)
  
  SCHEDULER:New(nil, function()
    AI_ATC:ResetMenus(Alias)
    AI_ATC:GoAroundSubMenu(Alias, true)
  end, {}, 0.5)
  
  local function Message()
    SCHEDULER:New(nil, function()
      AI_ATC:ChannelOpen(5, Transmitter, Alias)
      AI_ATC:RepeatLastTransmission(Alias, function()Message() end)
      local Subtitle = string.format("%s: %s, %s Say intentions", Title, CallsignSub, Title)
      RadioObject:NewTransmission("DeadAir.ogg", 0.100, "Airbase_ATC/Ground/SoundFiles/", nil, 0.3, Subtitle, 3)
      AI_ATC:Callsign(Callsign, RadioObject, Transmitter, Flight)
      AI_ATC:AirbaseName(AI_ATC.Airbase, RadioObject, Transmitter)
      RadioObject:NewTransmission("Tower.ogg", 0.384, "Airbase_ATC/Ground/SoundFiles/", nil, nil)
      RadioObject:NewTransmission("Intentions.ogg", 0.917, "Airbase_ATC/Ground/SoundFiles/", nil, 0.3)
    end, {}, Delay)
  end
  
  Message()
end
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--****************************************************************************ATC TAXI TO PARKING********************************************************************************--
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function AI_ATC:TaxiParking(Alias)
  local Transmitter = "Ground"
  local Title = string.format("%s %s", AI_ATC.Airbase, Transmitter)
  local RadioObject = GROUND_RADIO
  local ClientData = ATM.ClientData[Alias]
  local Unit = ClientData.Unit
  local GroupObject = Unit:GetGroup()
  local Spot = ClientData.SpotNumber
  local MarkCoord = ClientData.SpotCoord
  local SchedulerObjects = ClientData.SchedulerObjects
  local TaxiData = ClientData.Taxi
  local Count = 0
  local Iteration = 10
  local Delay = 1.5 + math.random() * (1.5 - 1.0)
  local Callsign = ClientData.Callsign
  local FlightCallsign = ClientData.FlightCallsign
  local Flight = ClientData.Flight
  local CallsignSub = Flight and FlightCallsign or Callsign
  local HoldShort, TurnDirection, Hold = AI_ATC:HoldShortLanding(Alias)
  local Runway = AI_ATC.Runways.Landing[1]
  local AudioFile, TurnSub, Duration, Taxiway, Exit, HoldShortSub, Instruction

  local TurnTable = {
    ["Left"] = { filename = "LeftTurn.ogg", duration = 0.522 },
    ["Right"] = { filename = "RightTurn.ogg", duration = 0.546 },
  }
  
  if AI_ATC:FunctionDelay(Alias, function() AI_ATC:TaxiParking(Alias) end, Transmitter)==false then
    return
  end

  USERSOUND:New("RADIO_TRANS_START.ogg"):ToUnit(Unit)
  
  SCHEDULER:New(nil, function()
    AI_ATC:TerminateSchedules(Alias)
    AI_ATC:ResetMenus(Alias)
    AI_ATC:ClearanceSubMenu(Alias)

    if Hold==true then
      AudioFile = TurnTable[TurnDirection]
      if TurnDirection=="Left" then
        TurnSub = "Left turn"
      else
        TurnSub = "Right turn"
      end
      Duration = 5
      Taxiway = ClientData.Taxi[1]
      Exit = AI_ATC_TaxiToPark[Runway][Taxiway].Exit
      Instruction = string.format("%s %s, hold short runway %s", TurnSub, Exit, HoldShort)
      AI_ATC:LandingHoldSubMenu(Alias, HoldShort)
    else
      Duration = 1
      Instruction = ""
      AI_ATC:TaxiSubMenu(Alias)
    end
  end, {}, 0.5)

  local function Execute(parkingspot)
    if MarkCoord~=nil then
      ATM.ClientData[Alias].Mark = MarkCoord:MarkToGroup(parkingspot, GroupObject, true)
    end
    SCHEDULER:New(nil, function()
      AI_ATC:RepeatLastTransmission(Alias, function()Execute(parkingspot) end)
      AI_ATC:ChannelOpen(8, Transmitter, Alias)
      local Subtitle = string.format("%s: %s %s", Title, CallsignSub, Instruction)
      RadioObject:NewTransmission("DeadAir.ogg", 0.100, "Airbase_ATC/Ground/SoundFiles/", nil, 0.3, Subtitle, Duration)
      AI_ATC:Callsign(Callsign, RadioObject, Transmitter, Flight)
      if Hold==true then
        RadioObject:NewTransmission(AudioFile.filename, AudioFile.duration, "Airbase_ATC/Ground/SoundFiles/", nil, 0.2)
        AI_ATC:Phonetic(Exit, RadioObject, Transmitter)
        RadioObject:NewTransmission("HoldShort.ogg", 0.615, "Airbase_ATC/Ground/SoundFiles/", nil, 0.2)
        RadioObject:NewTransmission("Runway.ogg", 0.473, "Airbase_ATC/Ground/SoundFiles/", nil, 0.03)
        AI_ATC:Runway(HoldShort, RadioObject, Transmitter)
      else
        AI_ATC:TaxiToParking(Alias, RadioObject, Transmitter)
        local Subtitle = string.format("%s: and you'll be in parking space %s", Title, parkingspot )
        RadioObject:NewTransmission("ParkingSpace.ogg", 1.382, "Airbase_ATC/Ground/SoundFiles/", nil, nil, Subtitle, 3)
        AI_ATC:SpotNumber(Spot, RadioObject, Transmitter)
      end
    end, {}, Delay)
  end
  
  ATC_Coroutine:AddCoroutine(function()
    local inputString = nil
    for key, value in pairs(Incirlik_ParkingSpot) do
      Count = Count + 1
      if value.Number == Spot then
        Execute(key)
        ATM.ClientData[Alias].ParkingSpace = key
        break
      end
      if Count >= Iteration then
        Count = 0
        coroutine.yield()
      end
    end
  end)
end
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--*******************************************************************************ATC CROSS RUNWAY LANDING************************************************************************--
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function AI_ATC:CrossRunwayLanding(Alias, Audio)
  local Transmitter = "Ground"
  local Title = string.format("%s %s", AI_ATC.Airbase, Transmitter)
  local RadioObject = GROUND_RADIO
  local ClientData = ATM.ClientData[Alias]
  local Unit = ClientData.Unit
  local Group = Unit:GetGroup()
  local Runway = AI_ATC.Runways.Takeoff[1]
  local HoldShort = ATM.GroundControl[Alias].HoldShortLanding
  local Spot = ClientData.SpotNumber
  local ParkingSpace = ClientData.ParkingSpace  
  local TaxiData = ClientData.Taxi
  local Callsign = ClientData.Callsign
  local FlightCallsign = ClientData.FlightCallsign
  local Flight = ClientData.Flight
  local CallsignSub = Flight and FlightCallsign or Callsign
  local Delay = 1.5 + math.random() * (2.5 - 1.5)
  
  if AI_ATC:FunctionDelay(Alias, function() AI_ATC:CrossRunwayLanding(Alias, Audio) end, Transmitter)==false then
    return
  end
  
  AI_ATC:RepeatLastTransmission(Alias, function() AI_ATC:CrossRunwayLanding(Alias, true) end)
  
  if Audio~=true then
    USERSOUND:New("RADIO_TRANS_START.ogg"):ToUnit(Unit)
    AI_ATC:ResetMenus(Alias)
    AI_ATC:ClearanceSubMenu(Alias)
    AI_ATC:TaxiSubMenu(Alias)
  end

  SCHEDULER:New(nil, function()
    AI_ATC:ChannelOpen(7, Transmitter, Alias)
    local Subtitle = string.format("%s: %s Cross runway %s and you'll be in parking space %s", Title, CallsignSub, HoldShort, ParkingSpace)
    RadioObject:NewTransmission("DeadAir.ogg", 0.100, "Airbase_ATC/Ground/SoundFiles/", nil, 0.3, Subtitle, 6)
    AI_ATC:Callsign(Callsign, RadioObject, Transmitter, Flight)
    RadioObject:NewTransmission("CrossRunway.ogg", 0.740, "Airbase_ATC/Ground/SoundFiles/", nil, nil)
    AI_ATC:Runway(HoldShort, RadioObject, Transmitter)
    RadioObject:NewTransmission("ParkingSpace.ogg", 1.382, "Airbase_ATC/Ground/SoundFiles/", nil, nil)
    AI_ATC:SpotNumber(Spot, RadioObject, Transmitter)
  end,{}, Delay)
  
end
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--*******************************************************************************START AI_ATC************************************************************************************--
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function AI_ATC:Start()
  local Subtitle = "********************************************AI_ATC(Incirlik AFB) v2.9.23 HAS STARTED********************************************************************"
  env.info(Subtitle)
  AI_ATC:EnableCrewChief(true)
  AI_ATC:InitATIS()
  AI_ATC:FindTankerUnits()
  AI_ATC:InitClients()
  AI_ATC:InitRadios()
  AI_ATC:GroundController(false)
  AI_ATC:TowerController(false)
  SCHEDULER:New(nil, function()
    AI_ATC:StartATIS()
  end, {}, 1)
end

SCHEDULER:New(nil, function()
  --AI_ATC:SetCallsign("NELLIS_F-5E", "Burnin' Stogie", "31")
  AI_ATC:Start()
end, {}, 3)