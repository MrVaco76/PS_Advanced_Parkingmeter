if Config.Framework == "ESX" then
    ESX = exports['es_extended']:getSharedObject()
end


if Config.Framework == "ESX" then
    while not ESX do
        Citizen.Wait(100)
    end
end

if Config.Framework == "qb-core" then
    QBCore = exports['qb-core']:GetCoreObject()
end

AddEventHandler('onResourceStart', function(resourceName)
    if (GetCurrentResourceName() ~= resourceName) then
        
      return
    end	
	if Config.DeleteOldEntries then 
	
	TriggerEvent('PS_Parking_meter_system:DeleteOldContent')
	
	end
  end)
  
  RegisterCommand("delpark", function(source, args, rawCommand)

    TriggerEvent('PS_Parking_meter_system:DeleteOldContent')

end)

  
  

RegisterNetEvent('PS_Parking_meter_system:InsertInDB', function(source, LicensePlate, ParkDuration, Streetname, Date, Time)
    local xPlayer = source
    local seconds = math.floor(Time / 1000)
    local UTCTime = Config.UTCTime

    local currentTime = os.time()
    local newExpirationTime = currentTime + (ParkDuration * 60) 


    MySQL.Async.fetchAll([[
        SELECT * FROM PS_ParkingMeter
        WHERE licenseplate = @licenseplate AND streetname = @streetname
    ]], {
        ['@licenseplate'] = LicensePlate,
        ['@streetname'] = Streetname
    }, function(result)
        if #result > 0 then
            local ticket = result[1]
            local currentExpirationTime = tonumber(ticket.expiration_time) / 1000

            if newExpirationTime > currentExpirationTime then
                MySQL.Async.execute([[
                    UPDATE PS_ParkingMeter
                    SET parkduration = @parkduration,
                        parkingdate = @parkingdate,
                        parkingtime = DATE_ADD(FROM_UNIXTIME(@seconds), INTERVAL @UTCTime HOUR),
                        expiration_time = FROM_UNIXTIME(@newExpirationTime)
                    WHERE licenseplate = @licenseplate AND streetname = @streetname
                ]], {
                    ['@licenseplate'] = LicensePlate,
                    ['@streetname'] = Streetname,
                    ['@parkduration'] = ParkDuration,
                    ['@parkingdate'] = Date,
                    ['@seconds'] = seconds,
                    ['@UTCTime'] = UTCTime,
                    ['@newExpirationTime'] = newExpirationTime
                }, function(rowsChanged)
                    if rowsChanged > 0 then
                        TriggerEvent('PS_Parking_meter_system:RemoveMoney', source, LicensePlate, ParkDuration, Streetname, Date, Time)
                    else
                        local msg = translations.DataBaseError
                        local type = "error"
                        NotifyServer(xPlayer, msg, type)
                    end
                end)
            else
                local msg = string.format(translations.HasAllreadTicket, LicensePlate, Streetname)
                local type = "error"
                NotifyServer(xPlayer, msg, type)
            end
        else
            MySQL.Async.execute([[
                INSERT INTO PS_ParkingMeter (licenseplate, streetname, parkduration, parkingdate, parkingtime, expiration_time)
                VALUES (@licenseplate, @streetname, @parkduration, @parkingdate, 
                        DATE_ADD(FROM_UNIXTIME(@seconds), INTERVAL @UTCTime HOUR),
                        FROM_UNIXTIME(@newExpirationTime))
            ]], {
                ['@licenseplate'] = LicensePlate,
                ['@streetname'] = Streetname,
                ['@parkduration'] = ParkDuration,
                ['@parkingdate'] = Date,
                ['@seconds'] = seconds,
                ['@UTCTime'] = UTCTime,
                ['@newExpirationTime'] = newExpirationTime
            }, function(rowsChanged)
                if rowsChanged > 0 then
                    TriggerEvent('PS_Parking_meter_system:RemoveMoney', source, LicensePlate, ParkDuration, Streetname, Date, Time)
                else
                    local msg = translations.DataBaseError
                    local type = "error"
                    NotifyServer(xPlayer, msg, type)
                end
            end)
        end
    end)
end)





RegisterNetEvent('PS_Parking_meter_system:GetDataFromDB', function(source, LicensePlate, streetName)
    MySQL.Async.fetchAll('SELECT * FROM PS_ParkingMeter WHERE licenseplate = @licenseplate', {
        ['@licenseplate'] = LicensePlate
    }, function(results)
        if #results > 0 then
            local foundActiveTicket = false
            local currentTime = os.time()

            for _, row in ipairs(results) do

                local expirationTimeMillis = tonumber(row.expiration_time)
                if expirationTimeMillis then
                    local expirationTime = expirationTimeMillis / 1000

                    if currentTime <= expirationTime then
                        if streetName == row.streetname then
                            foundActiveTicket = true
                            local expirationDateTime = os.date("%Y-%m-%d %H:%M:%S", expirationTime)
                            local msg = string.format(translations.PrkingGood, LicensePlate, expirationDateTime)
                            local type = "success"
                            NotifyServer(source, msg, type)
                            break
                        end
                    end
                else
                end
            end

            if not foundActiveTicket then
                local msg = string.format(translations.NoParkingTicketForThisStreet, LicensePlate)
                local type = "error"
                NotifyServer(source, msg, type)
            end
        else
            local msg = string.format(translations.NoParkingTicket, LicensePlate)
            local type = "error"
            NotifyServer(source, msg, type)
        end
    end)
end)









RegisterNetEvent('PS_Parking_meter_system:DeleteOldContent')
AddEventHandler('PS_Parking_meter_system:DeleteOldContent', function()

    local currentTime = os.time()
    
    MySQL.Async.execute('DELETE FROM PS_ParkingMeter WHERE expiration_time < FROM_UNIXTIME(@currentTime)', {
        ['@currentTime'] = currentTime
    }, function(affectedRows)
        if affectedRows > 0 then
            print(affectedRows .. " expired entries successfully deleted in PS_ParkingMeter.")
        end
    end)
    if Config.UseRobbery then
    MySQL.Async.execute('DELETE FROM PS_ParkingMeter_robbery WHERE robbery_expiration_time < FROM_UNIXTIME(@currentTime)', {
        ['@currentTime'] = currentTime
    }, function(affectedRows)
        if affectedRows > 0 then
            print(affectedRows .. " expired entries successfully deleted in PS_ParkingMeter_robbery.")
        end
    end)
end
end)



RegisterNetEvent('PS_Parking_meter_system:Robbery_GetDataFromDB', function(source, pos)
    local identifier

    if Config.Framework == "qb-core" then 
        identifier = GetPlayerIdentifier(source)
    elseif Config.Framework == "ESX" then 
        local xPlayer = ESX.GetPlayerFromId(source)
        identifier = xPlayer.getIdentifier()
    end

    
    MySQL.Async.fetchAll('SELECT * FROM PS_ParkingMeter_robbery WHERE identifier = @identifier', {
        ['@identifier'] = identifier
    }, function(results)
        
        if #results > 0 then
            local canRob = true
            for _, row in ipairs(results) do
                local expirationTimeMillis = tonumber(row.robbery_expiration_time)
                local expirationTimeSeconds = math.floor(expirationTimeMillis / 1000)
                local currentTime = os.time()

                if currentTime < expirationTimeSeconds then
                    local msg = translations.YouCanNotRobberAgain
                    local type = "error"
                    NotifyServer(source, msg, type)
                    canRob = false
                    break
                end
            end
            if canRob then
                TriggerClientEvent('PS_Parking_meter_system:RobParkingMeterProgressbar', source, pos, identifier)
            end
        else
            TriggerClientEvent('PS_Parking_meter_system:RobParkingMeterProgressbar', source, pos, identifier)
        end
    end)
end)



if Config.UseRobbery then

RegisterNetEvent('PS_Parking_meter_system:RobberyInsertInDB', function(source, pos, identifier)
    local currentTime = os.time()
    local date = os.date("%Y-%m-%d", currentTime)
    local time = os.date("%H:%M:%S", currentTime)
    local robbAgainTime = Config.TimeBeforeCanRobAgain
    local expirationTime = os.date("%Y-%m-%d %H:%M:%S", currentTime + (robbAgainTime * 60))

    MySQL.Async.execute([[
        INSERT INTO PS_ParkingMeter_robbery (identifier, robberydate, robberytime, robbery_expiration_time)
        VALUES (@identifier, @robberydate, @robberytime, @robbery_expiration_time)
        ON DUPLICATE KEY UPDATE
            robberydate = VALUES(robberydate),
            robberytime = VALUES(robberytime),
            robbery_expiration_time = VALUES(robbery_expiration_time)
    ]], {
        ['@identifier'] = identifier,
        ['@robberydate'] = date,
        ['@robberytime'] = time,
        ['@robbery_expiration_time'] = expirationTime
    }, function(rowsChanged)
        if rowsChanged > 0 then
          TriggerEvent('PS_Parking_meter_system:RemoveItem',source, pos, identifier, date, time, expirationTime)  
        else
            local msg = translations.DataBaseError
            local type = "error"
            NotifyServer(xPlayer, msg, type)
        end
    end)
end)


RegisterNetEvent('CheckPoliceCount', function(source, minPoliceCount)
    local source = source
    local policeCount = 0

    if Config.Framework == "qb-core" then
        for _, player in pairs(QBCore.Functions.GetPlayers()) do
            local Player = QBCore.Functions.GetPlayer(player)
            if Player and Player.PlayerData.job.name == "police" and Player.PlayerData.job.onduty then
                policeCount = policeCount + 1
            end
        end
    elseif Config.Framework == "ESX" then
        for _, player in ipairs(ESX.GetPlayers()) do
            local xPlayer = ESX.GetPlayerFromId(player)
            if xPlayer and xPlayer.job.name == "police" then
                policeCount = policeCount + 1
            end
        end
    end

    if policeCount >= minPoliceCount then
        TriggerClientEvent('PS_Parking_meter_system:RobParkingMeter', source)
    else
        local msg = translations.NotEnoughPolice 
		local type = "error"
		
		NotifyServer(source, msg, type)
    end
end)

end
