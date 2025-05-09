local icons = require "icons"
local colors = require("colors").sections.widgets.cpu -- Assuming you have this
local settings = require "settings"

-- Execute the CPU monitoring process
sbar.exec "killall cpu_load >/dev/null; $CONFIG_DIR/helpers/event_providers/cpu_load/bin/cpu_load cpu_update 2.0"

local cpu = sbar.add("item", "widgets.cpu", {
  position = "right",
  padding_right = 8,
  padding_left = 0,
  icon = {
    string = icons.cpu,
    color = colors.icon,
    padding_left = 8,
  },
  label = {
    string = "??%",
    padding_right = 8,
  },
  click_script = "open -a 'Activity Monitor'"
})

cpu:subscribe({ "cpu_update", "system_woke", "forced" }, function(env)
  local load = tonumber(env.total_load or "0")

  local color = colors.icon
  if load > 30 then
    if load < 60 then
      color = colors.yellow
    elseif load < 80 then
      color = colors.orange
    else
      color = colors.red
    end
  end

  cpu:set {
    icon = {
      color = color,
    },
    label = {
      string = load .. "%",
    },
  }
end)

-- Add background styling like your wifi example
cpu:subscribe("mouse.clicked", function()
  sbar.animate("tanh", 8, function()
    cpu:set {
      background = {
        shadow = {
          distance = 0,
        },
      },
      y_offset = -4,
      padding_left = 4,
      padding_right = 4,
    }
    cpu:set {
      background = {
        shadow = {
          distance = 4,
        },
      },
      y_offset = 0,
      padding_left = 0,
      padding_right = 8,
    }
  end)
end)
