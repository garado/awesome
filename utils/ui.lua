local wibox = require("wibox")
local gears = require("gears")
local beautiful = require("beautiful")
local xresources = require("beautiful.xresources")
local dpi = xresources.apply_dpi

local _ui = {} 

-- for dashboard
-- credit: @rxhyn
function _ui.create_boxed_widget(widget_to_be_boxed, width, height, bg_color)
	local box_container = wibox.container.background()
  box_container.bg = bg_color
	box_container.forced_height = height
	box_container.forced_width = width
  --box_container.shape = gears.shape.rounded_rect
  box_container.shape = gears.shape.rect

	local boxed_widget = wibox.widget({
		--- Add margins
		{
			--- Add background color
			{
				--- The actual widget goes here
				widget_to_be_boxed,
				top = dpi(15),
				bottom = dpi(15),
				left = dpi(15),
				right = dpi(15),
				widget = wibox.container.margin,
			},
			widget = box_container,
		},
		margins = dpi(10),
		color = "#FF000000",
		widget = wibox.container.margin,
	})
	return boxed_widget
end

function _ui.colorize_text(text, color)
	return "<span foreground='" .. color .. "'>" .. text .. "</span>"
end

return _ui
