fx_version 'cerulean'
game 'gta5'
author 'Alucard Fagner/zera'
version '1.0.0'

shared_script 'config-side/config.lua'

client_scripts {
    'client-side/client.lua'
}

server_scripts {
    '@mysql-async/lib/MySQL.lua', -- Se você estiver usando MySQL-Async
    'server-side/server.lua'
}
