fx_version 'cerulean'
game 'gta5'
lua54 'yes'

version '1.0.0'
author 'Platrox#0468'

shared_scripts { '@ox_lib/init.lua', 'configuration/*.lua' }

client_scripts { 'bridge/**/client.lua', 'client/*.lua' }

server_scripts { 'bridge/**/server.lua', 'server/*.lua' }

dependencies { 'ox_lib' }
