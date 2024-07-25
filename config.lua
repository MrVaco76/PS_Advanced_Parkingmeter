Config = {}
Config.Debug = false
Config.Framework = "qb-core"  -- Specify your framework, e.g., ESX or qb-core
Config.locales = "en"  -- Specify your language
Config.Inventory = "Old-QbInventory"  -- Choose your inventory system: New-QbInventory, Old-QbInventory, OX-Inventory, or custom
Config.MoneyType = "bank"  -- Specify whether the seller receives money as bank or cash (for ESX, specify 'cash' if required)
Config.TargetSystem = "qb-target" --ox-target or qb-target
Config.Progressbar = "qb-progressbar"  --qb-progressbar/ ESX-Progressbar/ox-progressbar/ ox-progressCircle/ custom-progressbar
Config.UTCTime = 0 --Put here you UTC time + you can get it from here for your region https://en.wikipedia.org/wiki/List_of_UTC_offsets
Config.DeleteOldEntries = true --Put this to ture if you want to delete all unused entries in the Database on an script restart or server restart

----Discord Webhook----

Config.ServerName = "Atombude" --Put here your name from the Bot
Config.BotName = "PlexScripts"
Config.IconURL = "https://i.imgur.com/PB4LO09.png"
Config.Titel = "Parkingmeter system"

--Your Discordweblink need to be placed in server/discord_weebhook.lua


Config.MaxDistanceGetVehicles = 30 
Config.MinParkingTime = 1
Config.MaxParkingTime = 30
Config.PricePerMinutes = 1


Config.JobCanCheckParkingTime =  "police"



Config.BonesForTarget = { -- Bones for the targetsystem; currently on the car
        "seat_dside_f",
        "seat_pside_f",
        "seat_dside_r",
        "seat_pside_r",
        "door_dside_f",
        "door_dside_r",
        "door_pside_f",
        "door_pside_r"
      }
	 
	 
Config.TargetPropModels = { 

    "prop_parknmeter_01",
    "prop_parknmeter_02",
}


--Robery setting
Config.UseRobbery = true
Config.MinPoliceCount = 1
Config.UseDispatch = true 
Config.ChanceToAlertPolice = 100
Config.Dispatch = "emergencydispatch"  --ps-dispatch
Config.GetRobMoney  = math.random(100, 225)
Config.RobItem = "lockpick"
Config.RemoveItem = true
Config.RobParkingMeterDuration = 5000
Config.RobParkingMeterProgressLabel = "Parking meter is being robbed!"
Config.SkillCheck = false 
Config.SkillcheckSettings = {'easy', 'easy', {areaSize = 60, speedMultiplier = 1}, 'easy'} 
Config.TimeBeforeCanRobAgain = 5