if Config.Framework == "ESX" then
    ESX = exports['es_extended']:getSharedObject()
end

-- Add a wait loop to ensure ESX is loaded
if Config.Framework == "ESX" then
    while not ESX do
        Citizen.Wait(100)
    end
end

if Config.Framework == "qb-core" then
    QBCore = exports['qb-core']:GetCoreObject()
end



RegisterCommand("park", function(source, args, rawCommand)

    TriggerEvent('PS_Parking_meter_system:RobParkingMeter')

end)




RegisterNetEvent('PS_Parking_meter_system:OpenMenu', function()
    local xPlayer = PlayerPedId()
	local clientId = GetPlayerServerId(PlayerId())
    local playerCoords = GetEntityCoords(xPlayer)

   
    local maxDistance = Config.MaxDistanceGetVehicles

    
    local licensePlates = {}

    
    for vehicle in EnumerateVehicles() do
        local vehicleCoords = GetEntityCoords(vehicle)
        local distance = #(playerCoords - vehicleCoords)

        if distance < maxDistance then
            local plate = GetVehicleNumberPlateText(vehicle)
            table.insert(licensePlates, {label = plate, value = plate})
        end
    end
	
	if #licensePlates == 0 then
		local plate = translations.NoVehicleNearby
        table.insert(licensePlates, {label = plate, value = plate})
end

    
    local streetHash = GetStreetNameAtCoord(playerCoords.x, playerCoords.y, playerCoords.z)
    local streetName = GetStreetNameFromHashKey(streetHash)

    
    local ParkingMenu = lib.inputDialog(translations.ParkinMeterMenuTitel, {
        {type = 'select', options = licensePlates, label = translations.LicensePlate, default = licensePlates[1] and licensePlates[1].value or '', disabled = false, required = true},
        {type = 'slider', label = translations.DurationParkingTime, disabled = false, required = true, min = Config.MinParkingTime, max = Config.MaxParkingTime},
        {type = 'input', label = translations.StreetName, disabled = true, required = false, default = streetName},
        {type = 'date', label = translations.Date, default = true, required = false, disabled = true, format = "YYYY-MM-DD", returnString = true},
        {type = 'time', label = translations.Time, default = true, format = 24, returnString = true, required = false, disabled = true},
    })

    if (ParkingMenu == nil) or (ParkingMenu[1] == translations.NoVehicleNearby)  then
        return nil
    else
        local LicensePlate = ParkingMenu[1]
        local ParkDuration = ParkingMenu[2]
        local Streetname = ParkingMenu[3]
        local Date = ParkingMenu[4]
        local Time = ParkingMenu[5]

        TriggerServerEvent('PS_Parking_meter_system:InsertInDB',clientId, LicensePlate, ParkDuration, Streetname, Date, Time)
        

        return LicensePlate
    end
end)


function EnumerateVehicles()
    return coroutine.wrap(function()
        local handle, vehicle = FindFirstVehicle()
        if not handle or handle == -1 then return end

        local finished = false
        repeat
            coroutine.yield(vehicle)
            finished, vehicle = FindNextVehicle(handle)
        until not finished

        EndFindVehicle(handle)
    end)
end




RegisterNetEvent('PS_Parking_meter_system:CheckParkingTime', function()
    local xPlayer = PlayerPedId()
	local clientId = GetPlayerServerId(PlayerId())
    local pos = GetEntityCoords(xPlayer)
    local targetVehicle = GetClosestVehicle(pos.x, pos.y, pos.z, 5.0, 0, 70)
    local LicensePlate = GetVehicleNumberPlateText(targetVehicle)

	local streetHash = GetStreetNameAtCoord(pos.x, pos.y, pos.z)
    local streetName = GetStreetNameFromHashKey(streetHash)

    TriggerServerEvent('PS_Parking_meter_system:GetDataFromDB',clientId, LicensePlate, streetName)
	
end)


if Config.UseRobbery then 
RegisterNetEvent('PS_Parking_meter_system:PoliceCheckResult', function()
local minPoliceCount = Config.MinPoliceCount
local clientId = GetPlayerServerId(PlayerId())
TriggerServerEvent('CheckPoliceCount', clientId, minPoliceCount)

end)


RegisterNetEvent('PS_Parking_meter_system:RobParkingMeter', function()
    local xPlayer = PlayerPedId()
	local clientId = GetPlayerServerId(PlayerId())
    local pos = GetEntityCoords(xPlayer)

	
    lib.callback('PS_Parking_meter_system:HasItem', false, function(hasItem)
		if hasItem then 
			TriggerServerEvent('PS_Parking_meter_system:Robbery_GetDataFromDB',clientId, pos)
			else 
			local msg = translations.NoItemToRob
			local type = "error"
			
			Notify(msg, type)
		end
    end)

end)



RegisterNetEvent('PS_Parking_meter_system:RobParkingMeterProgressbar', function(pos, identifier)
    local progressName = "PS_ParkingMeter_Rob"
    local progressDuration = Config.RobParkingMeterDuration
    local progressLabel = Config.RobParkingMeterProgressLabel
    local progressanimDict = "mini@repair"
    local progressanim = "fixing_a_ped"

    if Config.Progressbar == "qb-progressbar" then
        exports['progressbar']:Progress({
            name = progressName,
            duration = progressDuration,
            label = progressLabel,
            useWhileDead = false,
            canCancel = true,
            controlDisables = {
                disableMovement = true,
                disableCarMovement = true,
                disableMouse = true,
                disableCombat = true,
            },
            animation = {
                animDict = progressanimDict,
                anim = progressanim,
                flags = 49,
            },
            prop = { },
            propTwo = {}
        }, function(cancelled)
            if not cancelled then
               RobberySkillcheck(pos, identifier)
            else
                
            end
        end)
    elseif Config.Progressbar == "ESX-Progressbar" then 
        exports["esx_progressbar"]:Progressbar(progressLabel, progressDuration, {
            FreezePlayer = true, 
            animation = {
                type = "anim",
                dict = progressanimDict, 
                lib = progressanim
            },
            onFinish = function()
            RobberySkillcheck(pos, identifier)
            end
        })
    elseif Config.Progressbar == "custom-progressbar" then 
        CustomProgressbar(progressName, progressDuration, progressLabel, progressanimDict, progressanim)
        Wait(progressDuration)
        RobberySkillcheck(pos, identifier)
    elseif Config.Progressbar == "ox-progressbar" then 
        if lib.progressBar({
            duration = progressDuration,
            label = progressLabel,
            useWhileDead = false,
            canCancel = true,
            anim = {
                dict = progressanimDict,
                clip = progressanim
            },
        }) then
            RobberySkillcheck(pos, identifier)
        end
    elseif Config.Progressbar == "ox-progressCircle" then 
        if lib.progressCircle({
            duration = progressDuration,
            label = progressLabel,
            useWhileDead = false,
            canCancel = true,
            anim = {
                dict = progressanimDict,
                clip = progressanim
            },
        }) then
            RobberySkillcheck(pos, identifier)
        end
    end
end)


function RobberySkillcheck(pos, identifier)
    local SkillCheck = false
	local clientId = GetPlayerServerId(PlayerId())
    local success

    if Config.SkillCheck then 
        success = lib.skillCheck(Config.SkillcheckSettings,{'w', 'a', 's', 'd'})
    else 
        success = true
    end

    if success then 
        TriggerServerEvent('PS_Parking_meter_system:RobberyInsertInDB',clientId, pos, identifier)
		TriggerEvent('PS_Parking_meter_system:AlertPolice')
    end
end




end