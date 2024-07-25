## Support 

Join our Discord for support and feature scripts: https://discord.gg/XQHVstYRGx



## What does it do exactly?



## Installation instructions

1. Download the script.
2. Place it in your resources folder.
3. import the sql file to you database.
4. Edit the configuration file.
5. Add the items you want to the config.
6. Create the Sellpoints in the config.
7. Add the following line to your server.cfg: ensure PS_Economic_system.
8. Add the permission "Economi.AdminMenu" to your server.cfg 
9. Restart the server. 

## Depencies 

- ESX or QBCore
- ox-lib
- oxmysql

## For PS-Dispatch
1. Add the following code to your ps-dispatch/client/alerts.lua

local function ParkingmeterRobbery()
    local coords = GetEntityCoords(cache.ped)
    local dispatchData = {
        message = locale('parkinmeterrobbery'),
        codeName = 'parkinmeterrobbery',
        code = '10-10',
        icon = 'fa-solid fa-square-parking',
        priority = 2,
        coords = coords,
        gender = GetPlayerGender(),
        street = GetStreetAndZone(coords),
        alertTime = nil,
        jobs = { 'police'}
    }

    TriggerServerEvent('ps-dispatch:server:notify', dispatchData)
end
exports('ParkingmeterRobbery', ParkingmeterRobbery)

2. Add the following code to your ps-dispatch/shared/config.lua/Config.Blips

    ['atmrobbery'] = {
        radius = 0,
        sprite = 52,
        color = 1,
        scale = 1.5,
        length = 2,
        sound = 'Lose_1st',
        sound2 = 'robberysound',
        offset = false,
        flash = false
    },

3. Add the following code to your ps-dispatch/locales

"parkinmeterrobbery": "Parkingmeter Robbery",