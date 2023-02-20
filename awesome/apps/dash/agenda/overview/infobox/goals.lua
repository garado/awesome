
-- █░█░█ █▀▀ █▀▀ █▄▀ █░░ █▄█    █▀▀ █▀█ ▄▀█ █░░ █▀ 
-- ▀▄▀▄▀ ██▄ ██▄ █░█ █▄▄ ░█░    █▄█ █▄█ █▀█ █▄▄ ▄█ 

local wibox = require("wibox")
local beautiful  = require("beautiful")
local xresources = require("beautiful.xresources")
local dpi = xresources.apply_dpi
local colorize = require("helpers.ui").colorize_text

local goals = wibox.widget({
  wibox.widget({
    markup = colorize("No goals so far.\nPerhaps you'd like to set some?", beautiful.fg_1),
    font   = beautiful.font_reg_s,
    align  = "center",
    valign = "center",
    widget = wibox.widget.textbox,
  }),
  spacing = dpi(5),
  layout  = wibox.layout.fixed.vertical,
})

local widget = wibox.widget({
  {
    markup = colorize("Weekly Goals", beautiful.fg_0),
    font   = beautiful.font_reg_l,
    align  = "center",
    valign = "center",
    widget = wibox.widget.textbox,
  },
  goals,
  spacing = dpi(10),
  widget  = wibox.layout.fixed.vertical,
})

return widget