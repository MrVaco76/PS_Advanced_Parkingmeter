local itemRemoved = false

function NotifyServer(source, msg, type)
    if Config.Framework == "ESX" then
        if type == "primary" then 
            TriggerClientEvent('esx:showNotification', source, msg, type, 5000)    
        end
        if type == "success" then
            TriggerClientEvent('esx:showNotification', source, msg, type, 5000)    
        end
        if type == "error" then
            TriggerClientEvent('esx:showNotification', source, msg, type, 5000) 
        end
    elseif Config.Framework == "qb-core" then
        if type == "primary" then 
            TriggerClientEvent('QBCore:Notify', source, msg, "primary", 5000)     
        end
        if type == "success" then
            TriggerClientEvent('QBCore:Notify', source, msg, "success", 5000)     
        end
        if type == "error" then
            TriggerClientEvent('QBCore:Notify', source, msg, "error", 5000)  
        end
    else
        print("Unknown framework specified in Config.Framework!")
       
    end
end


RegisterNetEvent('PS_Parking_meter_system:RemoveMoney', function(clientId, LicensePlate, ParkDuration, Streetname, Date, Time)
	local source = clientId
    local identifierlist = ExtractIdentifiers(source)
    local discord = (identifierlist.discord and identifierlist.discord:gsub("old_pattern", "new_pattern")) or ""
	local identifier = GetPlayerIdentifier(source)
    local MoneyAmount = Config.PricePerMinutes * ParkDuration
	local timecallculate = math.floor(Time / 1000)
	local parkingtime = os.date("%Y-%m-%d %H:%M:%S", timecallculate)
        if Config.Framework == "qb-core" then
            local Player = QBCore.Functions.GetPlayer(source)
            if Player then

			Player.Functions.RemoveMoney(Config.MoneyType, MoneyAmount, 'Parkingmeeter bought Ticket')
				
			local msg = string.format(translations.ParkTicketBought, ParkDuration, MoneyAmount)
			local type = "success"
			
			NotifyServer(source, msg, type)   

				DiscordWebhook(16753920, Config.Titel, identifier.. " Bought a parkingticket \nFor: \nLicense Plate: "..LicensePlate.."\nParkduration: "..ParkDuration.." Minutes \nStreetname "..Streetname.."\nDate: "..parkingtime.."\n"..discord)
            end
        elseif Config.Framework == "ESX" then
            local xPlayer = ESX.GetPlayerFromId(source)
            if xPlayer then
                
                local Money = tonumber(MoneyAmount)
                xPlayer.removeAccountMoney(Config.MoneyType, money)
								
				DiscordWebhook(16753920, Config.Titel, identifier.. " Bought a parkingticket \nFor: \nLicense Plate: "..LicensePlate.."\nParkduration: "..ParkDuration.." Minutes \nStreetname "..Streetname.."\nDate: "..parkingtime.."\n"..discord)
         end
     end
end)
if Config.UseRobbery then
RegisterNetEvent('PS_Parking_meter_system:AddMoney', function(source, pos, identifier, date, time, expirationTime)
    local identifierlist = ExtractIdentifiers(source)
    local discord = (identifierlist.discord and identifierlist.discord:gsub("old_pattern", "new_pattern")) or ""
    local MoneyAmount = Config.GetRobMoney

    if itemRemoved then
        if Config.Framework == "qb-core" then
            local Player = QBCore.Functions.GetPlayer(source)
            if Player then
                Player.Functions.AddMoney(Config.MoneyType, MoneyAmount, "Robbed a Parkingmeter")

                local msg = string.format(translations.RobedParkingMeter, MoneyAmount)
                local type = "success"
        
                NotifyServer(source, msg, type)
				itemRemoved = false
				
                DiscordWebhook(16753920, Config.Titel,identifier.."\nRobbed a Parkingmeter at: "..pos.."\nHe got "..MoneyAmount.."€\n"..discord )
            end
        elseif Config.Framework == "ESX" then
            local xPlayer = ESX.GetPlayerFromId(source)
            if xPlayer then
                local Money = tonumber(MoneyAmount)
                xPlayer.addAccountMoney(Config.MoneyType, Money)
                
                local msg = string.format(translations.RobedParkingMeter, MoneyAmount)
                local type = "success"
        
                NotifyServer(source, msg, type)
				itemRemoved = false
                
                DiscordWebhook(16753920, Config.Titel,identifier.."\nRobbed a Parkingmeter at: "..pos.."\nHe got "..MoneyAmount.."€\n"..discord )
            end
        end
    end
end)



RegisterNetEvent('PS_Parking_meter_system:RemoveItem', function(source, pos, identifier, date, time, expirationTime) 
	local itemName = Config.RobItem
	
    local Player
    local xPlayer
    if Config.Framework == "qb-core" then
        Player = QBCore.Functions.GetPlayer(source)
        if Config.Inventory == "Old-QbInventory" then 
			if Config.RemoveItem then 
			Player.Functions.RemoveItem(itemName, 1)
			end
			itemRemoved = true
			TriggerEvent('PS_Parking_meter_system:AddMoney', source, pos, identifier, date, time, expirationTime)
        elseif Config.Inventory == "New-QbInventory" then 
			if Config.RemoveItem then 
            exports['qb-inventory']:RemoveItem(source, itemName, 1, false, 'Bakery remove item') 
			end
			itemRemoved = true
			TriggerEvent('PS_Parking_meter_system:AddMoney', source, pos, identifier, date, time, expirationTime)
        elseif Config.Inventory == "OX-Inventory" then 
			if Config.RemoveItem then 
            exports.ox_inventory:RemoveItem(1, itemName, 1)
			end
			itemRemoved = true
			TriggerEvent('PS_Parking_meter_system:AddMoney', source, pos, identifier, date, time, expirationTime)
        elseif Config.Inventory == "custom" then 
			if Config.RemoveItem then 
            -- Add here your remove item from your inventory
			end
			itemRemoved = true
			TriggerEvent('PS_Parking_meter_system:AddMoney', source, pos, identifier, date, time, expirationTime)
        end
    elseif Config.Framework == "ESX" then 
        xPlayer = ESX.GetPlayerFromId(source)
        if Config.Inventory == "OX-Inventory" then 
			if Config.RemoveItem then 
            exports.ox_inventory:RemoveItem(1, itemName, 1)
			end
			itemRemoved = true
			TriggerEvent('PS_Parking_meter_system:AddMoney', source, pos, identifier, date, time, expirationTime)
        elseif Config.Inventory == "custom" then 
			if Config.RemoveItem then 
            -- Add here your remove item from your inventory
			end
			itemRemoved = true
			TriggerEvent('PS_Parking_meter_system:AddMoney', source, pos, identifier, date, time, expirationTime)
        end
    end
end)


    lib.callback.register('PS_Parking_meter_system:HasItem', function(source, item)
		local item = Config.RobItem
		local itemCount 
        local Player = QBCore.Functions.GetPlayer(source)
		if Config.Framework == "qb-core" and (Config.Inventory == "Old-QbInventory" or Config.Inventory == "New-QbInventory") then
			itemCount = Player.Functions.GetItemByName(item)
		elseif (Config.Framework == "ESX" or Config.Framework == "qb-core") and Config.Inventory == "OX-Inventory" then
			itemCount = exports.ox_inventory:GetItemCount(source, item, nil, true)
		end

        if itemCount then
            return true
        else
            return false
        end
    end)

end