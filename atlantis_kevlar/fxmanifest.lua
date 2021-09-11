fx_version 'cerulean'
game 'gta5'

name 'atlantis_kevlar'
author 'lilfraae'
description 'Kelvar script'
version '1.0'

client_scripts {
    '@es_extended/locale.lua',
    'locales/*.lua',
    'config.lua',
    'client/cl_script.lua'
}

server_script {
    '@es_extended/locale.lua',
    'locales/*.lua',
    'config.lua',
    'server/sv_script.lua'
}