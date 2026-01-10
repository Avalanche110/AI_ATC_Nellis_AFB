-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--*****************************************************************************AI_TRAFFIC****************************************************************************************--
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
AI_Traffic = {}
AI_Traffic.Departure = {}
AI_Traffic.Approach = {}

AI_Traffic.TrafficParking = {
  ["A-10C_2"]       = { 195, 196, 197, 198 },
  ["AV8BNA"]        = { 246, 245, 244, 243 },
  ["A6E"]           = { 226, 225, 224, 223 },
  ["F-14B"]         = { 102, 101, 100, 99 },
  ["F-15C"]         = { 83, 84, 78, 79 },
  ["F-15ESE"]       = { 36, 37, 38, 39 },
  ["F-16C_50"]      = { 122, 123, 124, 125 },
  ["FA-18C_hornet"] = { 51, 52, 53, 54 },
  ["F-5E-3"]        = { 226, 225, 224, 223 },
  ["F-4E-45MC"]     = { 122, 123, 124, 125 },
  ["M-2000C"]       = { 104, 103, 102, 101 },
  ["MB-339A"]       = { 226, 225, 224, 223 },
  ["Tornado GR4"]   = { 6, 5, 4, 3 },
}
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--*****************************************************************************AI_TRAFFIC SPAWN DEPARTURE************************************************************************--
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function AI_Traffic:SpawnDeparture()
  
  local ManeuverTbl
  if AI_ATC.Procedure=="IFR" then
    ManeuverTbl      = { "AI_DREAM_7", "AI_FYTTR_7" }
  else
    ManeuverTbl      = { "AI_FLEX_NORTH", "AI_DREAM_7", "AI_FYTTR_7" }
  end

  local FighterTemplate  = { "A-10C-II","AV-8B", "A-6E", "F-14B", "F-15C","F-15E","F-16C","F-4E","F-5E","F/A-18C","M-2000C","MB-339A","Tornado" }
  local HeavyTemplate    = { "C-17A","KC-130","KC-135","B-52","B-1B" }

  local Grpng, SpawnTable, RandomTemplate, SchedulerObject

  AI_Traffic.Departure = AI_Traffic.Departure or {}
  AI_Traffic.Departure.PreviousManeuver = AI_Traffic.Departure.PreviousManeuver or nil

  local function baseManeuver(name) return (name:gsub("%-2$", "")) end

  local function pickManeuver()
    local prevBase = AI_Traffic.Departure.PreviousManeuver and baseManeuver(AI_Traffic.Departure.PreviousManeuver) or nil
    local candidates = {}
    for _, m in ipairs(ManeuverTbl) do
      if baseManeuver(m) ~= prevBase then table.insert(candidates, m) end
    end
    if #candidates == 0 then
      for _, m in ipairs(ManeuverTbl) do table.insert(candidates, m) end
    end
    return candidates[math.random(#candidates)]
  end

  local Maneuver = pickManeuver()
  AI_Traffic.Departure.PreviousManeuver = Maneuver

  if Maneuver ~= "AI_FLEX_NORTH" then
    RandomTemplate = 1
  else
    RandomTemplate = math.random(1,2)
  end

  if RandomTemplate == 1 then
    SpawnTable = FighterTemplate
    Grpng = (math.random(1,2) == 1) and 2 or 4
  else
    SpawnTable = HeavyTemplate
    Grpng = 1
  end

  local spawnTemplateName = SpawnTable[math.random(#SpawnTable)]
  local spawnGrp = GROUP:FindByName(spawnTemplateName)
  if not spawnGrp then
    env.info(string.format("[AI_TRAFFIC] Missing spawn template group: %s", tostring(spawnTemplateName)))
    SCHEDULER:New(nil, function() AI_Traffic:SpawnDeparture() end, {}, 2)
    return
  end

  local template = spawnGrp:GetTemplate()
  local callsign = spawnGrp:GetCallsign()

  local DonorName = Maneuver
  local donorGrp = GROUP:FindByName(DonorName)
  if not donorGrp then
    env.info(string.format("[AI_TRAFFIC] Missing donor group: %s", tostring(DonorName)))
    SCHEDULER:New(nil, function() AI_Traffic:SpawnDeparture() end, {}, 2)
    return
  end
  local donorTemplate = donorGrp:GetTemplate()
  if not donorTemplate or not donorTemplate.route then
    env.info(string.format("[AI_TRAFFIC] Bad donor template/route: %s", tostring(DonorName)))
    SCHEDULER:New(nil, function() AI_Traffic:SpawnDeparture() end, {}, 2)
    return
  end
  template.route = donorTemplate.route

  local SpawnObject = SPAWN:NewFromTemplate(template, DonorName, callsign, true)
  SpawnObject:InitSkill("Excellent")
  SpawnObject:InitCategory(Group.Category.AIRPLANE)
  SpawnObject:InitCoalition(coalition.side.BLUE)
  SpawnObject:InitCountry(country.id.CJTF_BLUE)
  SpawnObject:InitGrouping(Grpng)

  SpawnObject:OnSpawnGroup(function (spawnGroup)
    local SchedulerObject
    SchedulerObject = SCHEDULER:New(nil, function()
      if not spawnGroup or not spawnGroup:IsAlive() then
        if SchedulerObject then SchedulerObject:Stop(); SchedulerObject = nil end
        return
      end
      local coord = spawnGroup:GetCoordinate()
      if not coord then return end
      local distance = coord:Get2DDistance(AI_ATC_Vec3)
      if distance >= 31484 then
        spawnGroup:Destroy()
        SCHEDULER:New(nil, function() AI_Traffic:SpawnTraffic() end, {}, 5)
        if SchedulerObject then SchedulerObject:Stop(); SchedulerObject = nil end
      end
    end, {}, 5, 5)
  end)

  local ACType = SpawnObject.SpawnTemplate.units[1].type
  local Parking = AI_Traffic.TrafficParking[ACType] or {16}
  local Result = UTILS.OneLineSerialize(Parking)
  env.info(string.format("[AI_TRAFFIC] Nominated Parking Spots: %s -- %s", tostring(spawnTemplateName), Result))

  local SpwnGrp = SpawnObject:SpawnAtParkingSpot(AI_ATC.AirbaseID, Parking, SPAWN.Takeoff.Cold)
  
  SCHEDULER:New(nil, function()
    if not SpwnGrp then
      AI_Traffic:SpawnDeparture()
    end
  end, {}, 2)
end
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--*****************************************************************************AI_TRAFFIC SPAWN APPROACH************************************************************************--
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function AI_Traffic:SpawnApproach()
  local ManeuverTbl
  if AI_ATC.Procedure=="VFR" then
    ManeuverTbl = {
      "AI_Outside Downwind","AI_Straight in","AI_Overhead","AI_Missed Approach",
      "AI_Outside Downwind-2","AI_Straight in-2","AI_Overhead-2","AI_Missed Approach-2"
      --"AI_Overhead", "AI_Overhead-2",
    }
  else
    ManeuverTbl = {"AI_Straight in","AI_Missed Approach","AI_Straight in-2","AI_Missed Approach-2"}
  end
  local FighterTemplate = { "A-10C-II","AV-8B","A-6E","F-15C","F-15E","F-16C","F-4E","F-5E","F/A-18C","M-2000C","MB-339A","Tornado" }
  local TwoShipTemplate = { "A-10C-II-2","AV-8B-2","A-6E-2","F-15C-2","F-15E-2","F-16C-2","F-4E-2","F-5E-2","F/A-18C-2","M-2000C-2","MB-339A-2","Tornado-2" }
  local HeavyTemplate   = { "C-17A","KC-130","KC-135","B-52","B-1B" }

  AI_Traffic.Approach = AI_Traffic.Approach or {}
  AI_Traffic.Approach.PreviousManeuver = AI_Traffic.Approach.PreviousManeuver or nil

  local function baseManeuver(name) return (name:gsub("%-2$", "")) end

  local function pickManeuver()
    local prevBase = AI_Traffic.Approach.PreviousManeuver and baseManeuver(AI_Traffic.Approach.PreviousManeuver) or nil
    local candidates = {}
    for _, m in ipairs(ManeuverTbl) do
      if baseManeuver(m) ~= prevBase then table.insert(candidates, m) end
    end
    if #candidates == 0 then
      for _, m in ipairs(ManeuverTbl) do table.insert(candidates, m) end
    end
    return candidates[math.random(#candidates)]
  end

  local function SpawnRandomGroup()
    local Heading
    local Maneuver = pickManeuver()
    AI_Traffic.Approach.PreviousManeuver = Maneuver

    local spawnTemplateName
    if Maneuver == "AI_Straight in" or Maneuver == "AI_Missed Approach"
       or Maneuver == "AI_Straight in-2" or Maneuver == "AI_Missed Approach-2" then
      Heading = 222
      if Maneuver:find("%-2$") then
        spawnTemplateName = TwoShipTemplate[math.random(#TwoShipTemplate)]
      else
        if math.random(1,2) == 1 then
          spawnTemplateName = HeavyTemplate[math.random(#HeavyTemplate)]
        else
          spawnTemplateName = FighterTemplate[math.random(#FighterTemplate)]
        end
      end
    else
      Heading = 192
      if Maneuver:find("%-2$") then
        spawnTemplateName = TwoShipTemplate[math.random(#TwoShipTemplate)]
      else
        spawnTemplateName = FighterTemplate[math.random(#FighterTemplate)]
      end
    end

    local spawnGrp = GROUP:FindByName(spawnTemplateName)
    if not spawnGrp then
      env.info(string.format("[SPAWN-APP] Missing spawn template group: %s", tostring(spawnTemplateName)))
      SCHEDULER:New(nil, SpawnRandomGroup, {}, 1)
      return
    end
    local template = spawnGrp:GetTemplate()
    if not template or not template.units or #template.units == 0 then
      env.info(string.format("[SPAWN-APP] Bad template for: %s", tostring(spawnTemplateName)))
      SCHEDULER:New(nil, SpawnRandomGroup, {}, 1)
      return
    end
    local callsign = spawnGrp:GetCallsign() or spawnTemplateName

    -- fuel trim
    for _, u in ipairs(template.units) do
      if u.payload and u.payload.fuel then u.payload.fuel = u.payload.fuel / 3 end
    end

    local donorGrp = GROUP:FindByName(Maneuver)
    if not donorGrp then
      env.info(string.format("[SPAWN-APP] Missing donor group: %s", tostring(Maneuver)))
      SCHEDULER:New(nil, SpawnRandomGroup, {}, 1)
      return
    end
    local donorTemplate = donorGrp:GetTemplate()
    if not donorTemplate then
      env.info(string.format("[SPAWN-APP] Bad donor template: %s", tostring(Maneuver)))
      SCHEDULER:New(nil, SpawnRandomGroup, {}, 1)
      return
    end

    template.route = donorTemplate.route
    template.x     = donorTemplate.x
    template.y     = donorTemplate.y

    for i, unit in ipairs(template.units) do
      local d = donorTemplate.units and donorTemplate.units[i]
      if d then
        unit.alt = d.alt; unit.x = d.x; unit.y = d.y
      else
        local lead = donorTemplate.units and donorTemplate.units[1]
        if lead then
          unit.alt = unit.alt or lead.alt
          unit.x   = unit.x   or lead.x
          unit.y   = unit.y   or lead.y
        end
      end
    end

    local SpawnObject = SPAWN:NewFromTemplate(template, callsign, nil, true)
    SpawnObject:InitHeading(Heading)

    SpawnObject:OnSpawnGroup(function (spawnGroup)
      local SchedulerObject
      if not spawnGroup or not spawnGroup:IsAlive() then return end

      spawnGroup:HandleEvent(EVENTS.Land)

      SchedulerObject = SCHEDULER:New(nil, function()
        if not spawnGroup or not spawnGroup:IsAlive() then
          if SchedulerObject then SchedulerObject:Stop(); SchedulerObject = nil end
          return
        end
        local coord = spawnGroup:GetCoordinate()
        if not coord then return end
        local distance = coord:Get2DDistance(AI_ATC_Vec3)
        local altitude = spawnGroup:GetAltitude(true)

        if distance >= 31484 then
          spawnGroup:Destroy()
          if SchedulerObject then SchedulerObject:Stop(); SchedulerObject = nil end
          AI_Traffic:SpawnTraffic()
          return
        end

        if altitude <= 20 then
          SCHEDULER:New(nil, function()
            if spawnGroup and spawnGroup:IsAlive() then
              spawnGroup:Destroy()
              AI_Traffic:SpawnTraffic()
            end
          end, {}, 30)
          spawnGroup:UnHandleEvent(EVENTS.Land)
          if SchedulerObject then SchedulerObject:Stop(); SchedulerObject = nil end
        end
      end, {}, 5, 5)

      function spawnGroup:OnEventLand(EventData)
        spawnGroup:UnHandleEvent(EVENTS.Land)
        SCHEDULER:New(nil, function()
          if SchedulerObject then SchedulerObject:Stop(); SchedulerObject = nil end
          if self and self:IsAlive() then self:Destroy() end
          SCHEDULER:New(nil, function() AI_Traffic:SpawnTraffic() end, {}, 1)
        end, {}, 10)
      end
    end)

    SpawnObject:Spawn()
  end

  SpawnRandomGroup()
end

-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--*****************************************************************************AI_TRAFFIC INITIALIZE*****************************************************************************--
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function AI_Traffic:SpawnTraffic()
  local Randomizer = math.random(1, 2)
  if Randomizer==1 then
    AI_Traffic:SpawnDeparture()
  else
    AI_Traffic:SpawnApproach()
  end
end

SCHEDULER:New(nil, function()
  AI_Traffic:SpawnTraffic()
end, {}, 5)
