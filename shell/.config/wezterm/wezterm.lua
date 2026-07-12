local wezterm = require("wezterm")
local act = wezterm.action

local config = wezterm.config_builder()

-- Pas de barre de titre système (façon Firefox), mais bords redimensionnables conservés
config.window_decorations = "RESIZE"

config.keys = {
	-- Créer un panneau à droite
	{ key = "phys:Equal", mods = "ALT|SHIFT", action = act.SplitHorizontal({ domain = "CurrentPaneDomain" }) },

	-- Créer un panneau en bas
	{ key = "phys:Minus", mods = "ALT|SHIFT", action = act.SplitVertical({ domain = "CurrentPaneDomain" }) },

	-- Naviguer entre les panneaux (vim-style)
	{ key = "h", mods = "ALT", action = act.ActivatePaneDirection("Left") },
	{ key = "j", mods = "ALT", action = act.ActivatePaneDirection("Down") },
	{ key = "k", mods = "ALT", action = act.ActivatePaneDirection("Up") },
	{ key = "l", mods = "ALT", action = act.ActivatePaneDirection("Right") },

	-- Naviguer entre les panneaux (flèches)
	{ key = "LeftArrow", mods = "ALT", action = act.ActivatePaneDirection("Left") },
	{ key = "DownArrow", mods = "ALT", action = act.ActivatePaneDirection("Down") },
	{ key = "UpArrow", mods = "ALT", action = act.ActivatePaneDirection("Up") },
	{ key = "RightArrow", mods = "ALT", action = act.ActivatePaneDirection("Right") },

	-- Maximiser / restaurer le panneau courant
	{ key = "m", mods = "ALT", action = act.TogglePaneZoomState },

	-- Créer un onglet
	{ key = "t", mods = "ALT|SHIFT", action = act.SpawnTab("CurrentPaneDomain") },
}

return config
