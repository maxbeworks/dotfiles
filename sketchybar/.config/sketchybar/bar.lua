local colors = require("colors").sections.bar

sbar.bar {
  topmost = "window",
  height = 44,
  notch_display_height = 44,
  padding_right = 4,
  padding_left = 4,
  margin = 10,
  corner_radius = 10,
  y_offset = 5,
  blur_radius = 20,
  border_color = colors.border,
  border_width = 1,
  color = colors.bg,
}
