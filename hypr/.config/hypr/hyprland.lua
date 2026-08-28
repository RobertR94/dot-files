-- ~/.config/hypr/hyprland.lua
-- Converted from hyprland.conf (hyprlang) for Hyprland 0.55+

------------------
---- PROGRAMS ----
------------------

local mainMod = "SUPER"
local terminal = "ghostty"
local fileManager = "dolphin"
local menu = "rofi -show drun"

------------------
---- MONITORS ----
------------------

hl.monitor({
	output = "HDMI-A-2",
	mode = "preferred",
	position = "auto",
	scale = 1,
})

-------------------------------
---- ENVIRONMENT VARIABLES ----
-------------------------------

hl.env("XCURSOR_THEME", "breeze_cursors")
hl.env("XCURSOR_SIZE", "24")

-------------------
---- AUTOSTART ----
-------------------

hl.on("hyprland.start", function()
	hl.exec_cmd("waybar")
	hl.exec_cmd("hyprpaper")
	hl.exec_cmd("hypridle")
	hl.exec_cmd("hyprctl setcursor breeze_cursors 24")
end)

-----------------------
---- LOOK AND FEEL ----
-----------------------

hl.config({
	general = {
		gaps_in = 4,
		gaps_out = 0,
		border_size = 0,
	},
})

---------------------
---- KEYBINDINGS ----
---------------------

-- General
hl.bind(mainMod .. " + T", hl.dsp.exec_cmd(terminal))
hl.bind(mainMod .. " + Q", hl.dsp.window.close())
hl.bind(
	mainMod .. " + E",
	hl.dsp.exec_cmd("command -v hyprshutdown >/dev/null 2>&1 && hyprshutdown || hyprctl dispatch 'hl.dsp.exit()'")
)
hl.bind(mainMod .. " + M", hl.dsp.exec_cmd(fileManager))
hl.bind(mainMod .. " + V", hl.dsp.window.float({ action = "toggle" }))
hl.bind(mainMod .. " + space", hl.dsp.exec_cmd(menu))
hl.bind(mainMod .. " + F", hl.dsp.window.fullscreen())

-- NOTE: this collides with the "focus right" bind below (both are keysym l).
-- Pick a different key for one of them.
hl.bind(mainMod .. " + L", hl.dsp.exec_cmd("hyprlock"))

-- Control
hl.bind(mainMod .. " + A", hl.dsp.exec_cmd("pavucontrol"))

-- Focus movement (vim keys)
hl.bind(mainMod .. " + h", hl.dsp.focus({ direction = "left" }))
hl.bind(mainMod .. " + j", hl.dsp.focus({ direction = "down" }))
hl.bind(mainMod .. " + k", hl.dsp.focus({ direction = "up" }))
hl.bind(mainMod .. " + l", hl.dsp.focus({ direction = "right" }))

-- Workspace switching / moving windows
for i = 1, 10 do
	local key = i % 10 -- 10 maps to key 0
	hl.bind(mainMod .. " + " .. key, hl.dsp.focus({ workspace = i }))
	hl.bind(mainMod .. " + CTRL + " .. key, hl.dsp.window.move({ workspace = i }))
end

-- Switch to workspace and launch its default app
local workspaceApps = {
	[1] = "ghostty",
	[2] = "ghostty",
	[3] = "firefox",
	[4] = "code",
	[5] = "firefox --new-window https://youtube.com",
	[6] = "android-studio",
	[7] = "discord",
}

for ws, app in pairs(workspaceApps) do
	hl.bind(mainMod .. " + SHIFT + " .. ws, function()
		hl.dispatch(hl.dsp.focus({ workspace = ws }))
		hl.dispatch(hl.dsp.exec_cmd(app))
	end)
end

-------------------
---- UTILITIES ----
-------------------

-- Screenshot selected area -> clipboard
hl.bind(mainMod .. " + p", hl.dsp.exec_cmd('grim -g "$(slurp)" - | wl-copy'))

-- Screenshot selected area -> file + clipboard
hl.bind(
	mainMod .. " + CTRL + p",
	hl.dsp.exec_cmd(
		"mkdir -p ~/Pictures/Screenshots && "
			.. "f=~/Pictures/Screenshots/Screenshot_$(date +%Y-%m-%d_%H-%M-%S).png && "
			.. 'grim -g "$(slurp)" "$f" && wl-copy < "$f"'
	)
)
