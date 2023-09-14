
-- █▀▄ █▀▀ █▀ █▀▀ █▀█ ▀█▀    █▀▀ ▄▀█ █▀█    █▀▄▀█ █▀▀ █▀▀ █░█ ▄▀█ █▄░█ █ █▀▀ 
-- █▄▀ ██▄ ▄█ ██▄ █▀▄ ░█░    █▄▄ █▀█ █▀▄    █░▀░█ ██▄ █▄▄ █▀█ █▀█ █░▀█ █ █▄▄ 

local cfg = require("gears.filesystem").get_configuration_dir()
local path = cfg .. ((...):match("(.-)[^%.]+$")):gsub("%.", "/") -- path to this file's dir

return {
  type = "dark",
  wall = path .. "wallpaper",
  accent_image = path .. "accent_image",

  primary = {
    base = "#378546",
  },
  neutral = {
    dark  = "#232a2e",
    base  = "#3d484d",
    light = "#d3c6aa",
  },
  colors = {
    red = "#e67e80",
    green = "#a7c080",
    yellow = "#dbbc7f",
  },
  accents = {
    "#e67e81",
    "#dbbc7e",
    "#a7c080",
    "#e69876",
    "#83c092",
    "#7fbbb3",
    "#d699b6",
  },

  -- Pulsebar is a style where the bar background is transparent.
  -- Depending on which wallpaper you use, you may want to change the
  -- font color of the bar icons so that they're actually visible against
  -- the wallpaper.
  -- Options: dark light
  pulsebar_fg_l = "dark",
  pulsebar_fg_m = "dark",
  pulsebar_fg_r = "dark",

  integrations = {
    kitty = "Everforest Dark Medium",
    nvim  = "everforest",
  }
}