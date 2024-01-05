-- Pull in the wezterm API
local wezterm = require("wezterm")
-- This table will hold the configuration.
local config = {}
-- In newer versions of wezterm, use the config_builder which will
-- help provide clearer error messages
if wezterm.config_builder then
	config = wezterm.config_builder()
end

-- This is where you actually apply your config choices

config.color_scheme = "GruvboxDark"
-- You can specify some parameters to inluence the font selection;
-- for example, this selects a Bold, Italic font variant.
-- config.font = wezterm.font("VictorMono Nerd Font Mono", { weight = "Regular", italic = false })
-- config.font = wezterm.font_with_fallback({ "VictorMono Nerd Font Mono", "Fira Code", "苹方-简" })
-- config.font = wezterm.font({ family = "VictorMono Nerd Font Mono" })
-- config.font = wezterm.font({ family = "VictorMono Nerd Font Mono" })
-- config.font = wezterm.font({ family = "Terminess Nerd Font" })
config.font = wezterm.font_with_fallback({
	"Terminess Nerd Font",
	"苹方-简",
	"HarmonyOS Sans SC",
	"梦源黑体 CN",
	"VictorMono Nerd Font Mono",
	"Fira Code",
	"抖音美好体",
})
config.font_size = 26.0
config.font_rules = {
	{
		intensity = "Bold",
		italic = true,
		font = wezterm.font({
			family = "Terminess Nerd Font",
			weight = "Bold",
			style = "Italic",
		}),
	},
	{
		italic = true,
		intensity = "Half",
		font = wezterm.font({
			family = "Terminess Nerd Font",
			weight = "DemiBold",
			style = "Italic",
		}),
	},
	{
		italic = true,
		intensity = "Normal",
		font = wezterm.font({
			family = "Terminess Nerd Font",
			style = "Normal",
		}),
	},
}
config.window_background_opacity = 0.8
-- config.text_background_opacity = 0.3
-- config.default_prog = { "/usr/local/bin/fish", "-l" }
-- config.default_prog = { "/usr/local/bin/zsh", "-l" }
-- config.default_prog = { "/usr/local/bin/tmux" }
config.command_palette_font_size = 26.0
config.command_palette_fg_color = "#DCDCDC"
config.command_palette_bg_color = "#3F5B62"
-- and finally, return the configuration to wezterm
return config
