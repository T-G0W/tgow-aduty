fx_version 'cerulean'
game 'gta5'

author 'T-GOW'
description 'Modular Admin Duty System supporting ESX, QBCore, Qbox'
version '1.0.0'

shared_scripts {
    '@ox_lib/init.lua',
    'locales/de.lua',
    'locales/en.lua',
    'Config.lua'
}

client_scripts {
    'client/main.lua'
}

server_scripts {
    'server/main.lua'
}
