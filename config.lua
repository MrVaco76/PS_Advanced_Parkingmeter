Config = {}
Config.Debug = false
Config.Framework = "qb-core"  -- Specify your framework, e.g., ESX or qb-core
Config.locales = "en"  -- Specify your language (en/pt/de/fr)
Config.Inventory = "Old-QbInventory"  -- Choose your inventory system: New-QbInventory, Old-QbInventory, OX-Inventory, qs-inventory or custom
Config.MoneyType = "bank"  -- Specify whether the seller receives money as bank or cash (for ESX, specify 'money' if required)
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


Config.MaxDistanceGetVehicles = 30 -- Automatically get the vehicle plate based on the distance between the person and the cars
Config.MinParkingTime = 1 -- The minimum parkingtime for a car
Config.MaxParkingTime = 30 -- The maximum parkingtime for a car
Config.PricePerMinutes = 1 -- Here you can add your price the person have to pay per minutes 

Config.AllCanCheckVehicle = false --Enter 'false' here if only the jobs in JobCanCheckParkingTime are allowed to check the ticket.
Config.JobCanCheckParkingTime =  {"ambulance", "mechanic", "police"} -- The job to checke if the vehicle has a parking ticket For qb-target it looks like this Config.JobCanCheckParkingTime = {["police"] = 0, ["sast"] = 0}



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
	 
	 
Config.TargetPropModels = { -- Props for the parkingmeter

    "prop_parknmeter_01",
    "prop_parknmeter_02",
}


--Robery setting
Config.UseRobbery = true -- Put this to true if you want to use the robbery system
Config.MinPoliceCount = 0 -- Minimum police to start the robbery
Config.UseDispatch = true  -- If you want to send a dispatch to the police
Config.ChanceToAlertPolice = 100 -- The probability of sending a dispatch is 100%. Lower the number to decrease the chance.
Config.Dispatch = "emergencydispatch"  --ps-dispatch, emergencydispatch, codem-dispatch or qs-dispatch you can add you own dispatch system in client_function.lua
Config.GetRobMoney  = math.random(100, 225) -- How much money the get from the robbery
Config.RobItem = "lockpick" -- Put here the item if wich they need to rob the parkingmeter
Config.RemoveItem = true -- If you want that the item get removed put this to true
Config.RobParkingMeterDuration = 5000 -- How long it takes to rob a parkingmeter 
Config.RobParkingMeterProgressLabel = "Parking meter is being robbed!" -- Text from the progressbar
Config.SkillCheck = false -- if you want a skillCheck for your robbery 
Config.SkillcheckSettings = {'easy', 'easy', {areaSize = 60, speedMultiplier = 1}, 'easy'} -- edit here the difficulty of the skillcheck
Config.TimeBeforeCanRobAgain = 1 -- Put here the time before the person can make a new robbery 5 = 5 minutes