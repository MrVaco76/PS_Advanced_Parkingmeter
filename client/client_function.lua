

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
RegisterNetEvent('PS_Parking_meter_system:AlertPolice', function() 
    if Config.UseDispatch then
	if math.random(1, 100) <= Config.ChanceToAlertPolice then
        if Config.Dispatch == "emergencydispatch" then
			TriggerEvent('emergencydispatch:emergencycall:new', "police", "A parking meter was robbed", false)
        elseif Config.Dispatch == "ps-dispatch" then
           exports["ps-dispatch"]:ParkingmeterRobbery() 
			end
		end
	end
end)

end