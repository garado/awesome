
-- ▀█▀ ▄▀█ █▀▀ █▀    ▄▀█ █▄░█ █▀▄    █▀█ █▀█ █▀█ ░░█ █▀▀ █▀▀ ▀█▀ █▀ 
-- ░█░ █▀█ █▄█ ▄█    █▀█ █░▀█ █▄▀    █▀▀ █▀▄ █▄█ █▄█ ██▄ █▄▄ ░█░ ▄█ 

local ui    = require("utils.ui")
local dpi   = ui.dpi
local wibox = require("wibox")
local task  = require("backend.system.task")
local keynav = require("modules.keynav")
local beautiful = require("beautiful")

local sidebar, nav_tags, nav_projects = require(... .. ".sidebar")()
local tasklist_header = require(... .. ".tasklist.header")
local tasklist_body, scrollbar   = require(... .. ".tasklist.list")()
local tasklist_details = require(... .. ".tasklist.details")
local tasklist_prompt = require(... .. ".tasklist.prompt")

local nav_tags_projects = keynav.area({
  name = "nav_tags_projects",
  items = {
    nav_tags,
    nav_projects,
    tasklist_body.area,
  },
  keys = {}
})

local _tasklist = wibox.widget({
  {
    tasklist_header,
    ui.vpad(dpi(8)),
    layout = wibox.layout.fixed.vertical,
  },
  {
    {
      scrollbar,
      tasklist_body,
      layout = wibox.layout.fixed.horizontal,
    },
    margins = dpi(10),
    widget = wibox.container.margin,
  },
  {
    {
      -- NOTE: If you don't have 2 layoutboxes like this and you instead have details/prompt
      -- in the same layoutbox and set spacing = dpi(10), tasklist_prompt will move around when you
      -- toggle the visibility of details. very annoying
      {
        tasklist_details,
        ui.vpad(dpi(10)),
        layout = wibox.layout.fixed.vertical,
      },
      tasklist_prompt,
      layout = wibox.layout.fixed.vertical,
    },
    margins = dpi(5),
    widget  = wibox.container.margin,
  },
  spacing = dpi(10),
  layout  = wibox.layout.align.vertical,
})

local tasklist = wibox.widget({
  {
    _tasklist,
    margins = dpi(10),
    widget = wibox.container.margin,
  },
  bg = beautiful.neutral[800],
  widget = wibox.container.background,
})

local content = wibox.widget({
  sidebar,
  tasklist,
  forced_width = dpi(2000),
  spacing = beautiful.dash_widget_gap,
  layout = wibox.layout.fixed.horizontal,
})

-- █▀ █ █▀▀ █▄░█ ▄▀█ █░░ █▀ 
-- ▄█ █ █▄█ █░▀█ █▀█ █▄▄ ▄█ 

task:connect_signal("task::show_tasklist", function() end)
task:connect_signal("ready::dependencies", function() end)

return function()
  return wibox.widget({
    ui.vpad(dpi(10)),
    content,
    layout = wibox.layout.fixed.vertical,
  }), nav_tags_projects
end
