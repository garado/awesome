-- ▄▀█ █░█░█ █▀▀ █▀ █▀█ █▀▄▀█ █▀▀
-- █▀█ ▀▄▀▄▀ ██▄ ▄█ █▄█ █░▀░█ ██▄
-- package manager for luarocks
pcall(require, "luarocks.loader")

-- standard awesome library
local gears = require("gears")
local beautiful = require("beautiful")


-- ▀█▀ █░█ █▀▀ █▀▄▀█ █▀▀
-- ░█░ █▀█ ██▄ █░▀░█ ██▄
local theme_dir = gears.filesystem.get_configuration_dir() .. "theme/"
beautiful.init(theme_dir .. "theme.lua")


-- █▀▀ █▀█ █▄░█ █▀▀ █ █▀▀ █░█ █▀█ ▄▀█ ▀█▀ █ █▀█ █▄░█
-- █▄▄ █▄█ █░▀█ █▀░ █ █▄█ █▄█ █▀▄ █▀█ ░█░ █ █▄█ █░▀█
require("configuration")


-- █▀▄▀█ █▀█ █▀▄ █░█ █░░ █▀▀ █▀
-- █░▀░█ █▄█ █▄▀ █▄█ █▄▄ ██▄ ▄█
require("modules")


-- █░█ █
-- █▄█ █
require("ui")


require("utils")

-- Garbage collection
collectgarbage("setpause", 110)
collectgarbage("setstepmul", 1000)
gears.timer({
	timeout = 5,
	autostart = true,
	call_now = true,
	callback = function()
		collectgarbage("collect")
	end,
})


-- █▀▀ █▀█ █▀▀ █▀▄ █ ▀█▀ █▀
-- █▄▄ █▀▄ ██▄ █▄▀ █ ░█░ ▄█
-- @rxyhn
