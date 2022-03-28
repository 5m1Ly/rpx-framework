fx_version 'cerulean'
game 'gta5'

author 'Sm1Ly'
description "Resource to get te base"
version '0.0.1'

shared_scripts {
	'shared/cfg/public/*.cfg.lua',
	'shared/scripts/*.c.lua',
	'shared/scripts/*.f.lua',
	'shared/scripts/*.e.lua'
}

server_scripts {
	'shared/cfg/private/*.cfg.lua',
	'src/private/__base.lua',
	'src/private/**/*.c.lua',
	'src/private/**/*.f.lua',
	'src/private/**/*.e.lua',
}

client_scripts {
	'src/public/__base.lua',
	'src/public/**/*.c.lua',
	'src/public/**/*.f.lua',
	'src/public/**/*.e.lua',
}

files {
	'view/css/px-master.css'
}