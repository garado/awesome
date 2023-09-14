
-- █▄▄ █▀█ █ █▀▀ █░█ ▀█▀ █▄░█ █▀▀ █▀ █▀
-- █▄█ █▀▄ █ █▄█ █▀█ ░█░ █░▀█ ██▄ ▄█ ▄█

local awful = require("awful")
local naughty = require("naughty")

local brightnotif

awesome.connect_signal("module::brightness", function()
  awful.spawn.easy_async_with_shell("brightnessctl get",
    function(stdout)
      local _val = string.gsub(stdout, '%W','')
      local val = tonumber(_val)
      val = tonumber(val)
      val = (val * 100) / 255
      val = math.floor(val, 0)

      if not brightnotif then
        brightnotif = naughty.notification {
          title = "Brightness",
          app_name = "System message",
          message = "Brightness at " .. val .. "%",
          auto_reset_timeout = true,
          timeout = 1.25,
        }
        brightnotif:connect_signal("destroyed", function()
          brightnotif = nil
        end)
      else
        brightnotif.message = "Brightness at " .. val .. "%"
      end
    end)
end)
