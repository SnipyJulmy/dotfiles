local wezterm = require("wezterm")

local images = {
  "/Users/sij/Pictures/736563.jpeg",
  "/Users/sij/Pictures/1024452.jpg",
  "/Users/sij/Pictures/682156.jpeg",
  "/Users/sij/Pictures/736563.jpeg",
  -- "/Users/sij/Pictures/863992.png",
  "/Users/sij/Pictures/Ilya-Kuvshinov-redhead-freckles-blue-eyes-lips-1381433-wallhere.com.jpg",
  -- "/Users/sij/Pictures/snow_girl.jpg",
  "/Users/sij/Pictures/twitterBack.jpeg",
  "/Users/sij/Pictures/wallpaperflare.com_wallpaper (1).jpg",
  "/Users/sij/Pictures/wallpaperflare.com_wallpaper (2).jpg",
  "/Users/sij/Pictures/wallpaperflare.com_wallpaper (4).jpg",
  "/Users/sij/Pictures/butterfly.jpeg",
}

local function rndImage()
  return images[math.random(#images)]
end

return {
  font = wezterm.font("SauceCodePro Nerd Font Mono", { weight = "Bold", italic = false }),
  font_size = 14,
  color_scheme = "Gruvbox Dark",
  window_background_opacity = 1.0,
  window_background_image = rndImage(),
  window_background_image_hsb = {
    brightness = 0.06,
    hue = 1.0,
    saturation = 0.5,
  },
  text_background_opacity = 1.0,
  window_frame = {
    font = wezterm.font({ family = "Roboto", weight = "Bold" }),
    font_size = 12.0,
  },
  window_padding = {
    left = 0,
    right = 0,
    top = 0,
    bottom = 0,
  },
}
