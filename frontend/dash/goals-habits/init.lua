
-- █▀▀ █▀█ ▄▀█ █░░ █▀    ▄▀█ █▄░█ █▀▄    █░█ ▄▀█ █▄▄ █ ▀█▀ █▀ 
-- █▄█ █▄█ █▀█ █▄▄ ▄█    █▀█ █░▀█ █▄▀    █▀█ █▀█ █▄█ █ ░█░ ▄█ 

local beautiful  = require("beautiful")
local ui    = require("utils.ui")
local dpi   = ui.dpi
local awful = require("awful")
local wibox = require("wibox")
local btn   = require("frontend.widget.button")
local header = require("frontend.widget.dash.header")
local dash  = require("backend.cozy.dash")
local keynav = require("modules.keynav")
local gstate = require("backend.system.goals")

-- Modules
local goals = require(... .. ".goals")

local nav_goals_habits = keynav.area({
  name  = "nav_goals_habits",
  items = {
    goals.area
  },
  keys  = {
    ["r"] = function()
      gstate:fetch_shortterm()
      gstate:fetch_longterm()
    end
  },
})

---------------------

local goals_header = header({
  title_text = "Goals &amp; habits",
})

local action_refresh = btn({
  text = "Refresh",
  func = function()
    goals:emit_signal("goals::refresh")
  end,
})

goals_header:add_action(action_refresh)

goals_header:add_sb("Goals")
goals_header:add_sb("Habits")

local content = goals

------------------

goals:connect_signal("goals::show_details", function(_, data)
  goals_header:update_title({ text = data.description })
end)

goals:connect_signal("goals::show_overview", function()
  goals_header:update_title({ text = "Goals &amp; habits" })
end)

local container = wibox.widget({
  goals_header,
  {
    content,
    margins = dpi(15),
    widget = wibox.container.margin,
  },
  forced_width  = dpi(2000),
  layout = wibox.layout.ratio.vertical,
})
container:adjust_ratio(1, 0, 0.08, 0.92)

return function()
  return wibox.widget({
    container,
    forced_height = dpi(2000),
    layout = wibox.layout.fixed.horizontal,
  }), nav_goals_habits
end
