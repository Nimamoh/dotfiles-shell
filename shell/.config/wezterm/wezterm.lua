local wezterm = require("wezterm")
local act = wezterm.action

local config = wezterm.config_builder()

-- Pas de barre de titre système (façon Firefox), mais bords redimensionnables conservés
config.window_decorations = "RESIZE"

-- Légère transparence de la fenêtre
config.window_background_opacity = 0.92

-- Onglets façon KDE/Breeze : plats, rectangulaires, surlignage sur l'onglet actif
config.use_fancy_tab_bar = false
config.tab_bar_at_bottom = false
config.hide_tab_bar_if_only_one_tab = false
config.tab_max_width = 32

config.colors = {
	tab_bar = {
		background = "#232629",

		active_tab = {
			bg_color = "#3daee9", -- bleu Breeze
			fg_color = "#232629",
			intensity = "Bold",
		},

		inactive_tab = {
			bg_color = "#31363b",
			fg_color = "#bdc3c7",
		},

		inactive_tab_hover = {
			bg_color = "#3a3f44",
			fg_color = "#eff0f1",
		},

		new_tab = {
			bg_color = "#232629",
			fg_color = "#7f8c8d",
		},

		new_tab_hover = {
			bg_color = "#3daee9",
			fg_color = "#232629",
		},
	},
}

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
