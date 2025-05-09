local colors = require("colors").sections.bar

sbar.bar {
  topmost = "window",
  height = 42,
  notch_display_height = 42,
  padding_right = 12,
  padding_left = 12,
  margin = 10,
  corner_radius = 10,
  y_offset = 5,
  blur_radius = 20,
  border_color = colors.border,
  border_width = 1,
  color = colors.bg,
}
