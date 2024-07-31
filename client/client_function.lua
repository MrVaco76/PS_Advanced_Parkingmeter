

function Notify(msg, type)
    if Config.Framework == "ESX" then
        if type == "info" then 
            ESX.ShowNotification(msg, type, 5000)   
        end
        if type == "success" then
            ESX.ShowNotification(msg, type, 5000)   
        end
        if type == "error" then
            ESX.ShowNotification(msg, type, 5000)
        end
    elseif Config.Framework == "qb-core" then
        if type == "primary" then 
            QBCore.Functions.Notify(msg, "primary", 5000)
        end
        if type == "success" then
            QBCore.Functions.Notify(msg, "success", 5000)
        end
        if type == "error" then
            QBCore.Functions.Notify(msg, "error", 5000)
        end
    else
        print("Unknown framework specified in Config.Framework!")
    end
end


function CustomProgressbar(progressName, progressDuration, progressLabel, progressanimDict, progressanim)
-- Put here your own progressbar 
end 

if Config.UseRobbery then
    RegisterNetEvent('PS_Parking_meter_system:AlertPolice', function(coords) 
        local clientId = GetPlayerServerId(PlayerId())
        if Config.UseDispatch then
            if math.random(1, 100) <= Config.ChanceToAlertPolice then
                if Config.Dispatch == "emergencydispatch" then
                    TriggerServerEvent('PS_Parking_meter_system:AlertPoliceServer', coords)
                elseif Config.Dispatch == "ps-dispatch" then
                    exports["ps-dispatch"]:ParkingmeterRobbery()
                elseif Config.Dispatch == "qs-dispatch" then
                    exports['qs-dispatch']:ToggleDuty(true)
                    local playerInfo = exports['qs-dispatch']:GetPlayerInfo()
                    local title = "10-60 - Parking Meter Robbery"
                    local message = "A Parking Meter is being robbed"

                    TriggerServerEvent('qs-dispatch:server:CreateDispatchCall', {
                        job = { 'police' },
                        callLocation = playerInfo.coords,
                        callCode = { code = 'Parking Meter Robbery', snippet = '10-60' },
                        message = message,
                        flashes = false,
                        image = nil,
                        blip = {
                            sprite = 488,
                            scale = 0.8,
                            colour = 1,
                            flashes = true,
                            text = 'Parking Meter Robbery',
                            time = (10 * 60 * 1000),
                        }
                    })
                end
            end
        end
    end)
end
