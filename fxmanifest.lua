fx_version 'cerulean'
game 'gta5'

author 'Vaco'
description 'PS_Parking meter_system'
version '1.0.0'

lua54 'yes'

shared_script '@ox_lib/init.lua'




client_scripts {
'config.lua',
'locales/*',
'client/client.lua',
'client/client_function.lua',
'client/client_targets.lua',




}

server_scripts {
    '@oxmysql/lib/MySQL.lua',
    'config.lua',
    'server/server.lua',
    'server/server_function.lua',
    'server/discord_weebhook.lua',
    'locales/*',
    
}
