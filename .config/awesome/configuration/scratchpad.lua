local awful = require("awful")
local bling = require("module.bling")
local beautiful = require("beautiful")
local dpi = beautiful.xresources.apply_dpi
local awestore = require("awestore")
local helpers = require("helpers")

local anim_y = awestore.tweened(1100, {
    duration = 300,
    easing = awestore.easing.cubic_in_out
})

local anim_x = awestore.tweened(1920, {
    duration = 300,
    easing = awestore.easing.cubic_in_out
})

local function check_if_alive(cmd)
    awful.spawn.easy_async_with_shell("pgrep -u $USER -x " .. cmd,
            function(stdout, stderr, reason, exit_code)
                if exit_code == 1 then
                    awful.spawn(cmd)
                end
            end)
end

local music_scratch = bling.module.scratchpad:new {
    command = music,
    rule = { instance = "music" },
    sticky = false,
    autoclose = false,
    floating = true,
    geometry = { x = dpi(10), y = dpi(566), height = dpi(500), width = dpi(1000) },
    reapply = true,
    awestore = { x = anim_x }
}

awesome.connect_signal("scratch::music", function()
    check_if_alive("mopidy")
    music_scratch:toggle()
end)

local term_scratch = bling.module.scratchpad:new {
    command = "alacritty",
    rule = { instance = "spad" },
    sticky = true,
    autoclose = true,
    floating = true,
    geometry = { x = 360, y = 90, height = 900, width = 1200 },
    reapply = true,
    dont_focus_before_close = false,
    awestore = { x = anim_x, y = anim_y }
}
awesome.connect_signal("scratch::term",
        function()
            term_scratch:toggle()
        end)

local thunar_scratch = bling.module.scratchpad:new {
    command = "thunar",
    rule = { instance = "spad" },
    sticky = true,
    autoclose = true,
    floating = true,
    geometry = { x = 360, y = 90, height = 900, width = 1200 },
    reapply = true,
    dont_focus_before_close = false,
    awestore = { x = anim_x, y = anim_y }
}
awesome.connect_signal("scratch::thunar",
        function()
            thunar_scratch:toggle()
        end)
