module KeyMappings where

-- Custom (my personal configs)
-- import Custom.MyGridMenu
-- import Custom.MyPrompts
-- import Custom.MyScratchpads
-- import Custom.MyTreeMenu
import Variables

    -- BASE
import XMonad
import System.Exit 
import qualified XMonad.StackSet as W
import qualified Data.Map as M

    -- ACTIONS
import XMonad.Actions.CopyWindow (kill1, killAllOtherCopies)
import XMonad.Actions.CycleWS (moveTo, shiftToNext, shiftToPrev, shiftTo, WSType(..), nextScreen, prevScreen, nextWS, prevWS, toggleWS)
import XMonad.Actions.Promote
-- import XMonad.Actions.GridSelect
import XMonad.Actions.RotSlaves (rotSlavesDown, rotAllDown)
-- import qualified XMonad.Actions.TreeSelect as TS
import XMonad.Actions.WindowGo (runOrRaise)
import XMonad.Actions.WithAll (sinkAll, killAll)
import qualified XMonad.Actions.Search as S
import XMonad.Actions.WorkspaceNames

-- HOOKS
import XMonad.Hooks.ManageDocks (avoidStruts, docksEventHook, manageDocks, ToggleStruts(..))

    -- LAYOUTS AND MODIFIERS
import XMonad.Layout.LimitWindows (limitWindows, increaseLimit, decreaseLimit)
import XMonad.Layout.MultiToggle.Instances (StdTransformers(NBFULL, MIRROR, NOBORDERS))
import XMonad.Layout.ResizableTile
import XMonad.Layout.WindowArranger (windowArrange, WindowArrangerMsg(..))
import qualified XMonad.Layout.ToggleLayouts as T (toggleLayouts, ToggleLayout(Toggle))
import qualified XMonad.Layout.MultiToggle as MT (Toggle(..))

    -- PROMPT
import XMonad.Prompt
-- import XMonad.Prompt.Shell (shellPrompt)

    -- UTILITIES
-- import XMonad.Util.NamedScratchpad
import XMonad.Util.Run (runProcessWithInput, safeSpawn, spawnPipe)
import XMonad.Util.SpawnOnce

------------------------------------------------------------------------
-- KEYBINDINGS
------------------------------------------------------------------------
-- I am using the Xmonad.Util.EZConfig module which allows keybindings
-- to be written in simpler, emacs-like format.
myKeys :: [(String, X ())]
-- myKeys conf@(XConfig {XMonad.modMask = myModMask}) = M.fromList $
myKeys =
    -- Xmonad
        [ ("M-S-r", spawn "xmonad --recompile && xmonad --restart")        -- Recompiles and Restarts xmonad
        , ("M-C-r", spawn "xmonad --recompile")        -- Recompiles and Restarts xmonad
        , ("M-C-q", io (exitWith ExitSuccess))                  -- Quits xmonad

    -- Open my preferred terminal
        , ("M-<Return>", spawn myTerminal)

    -- Run Prompt
        -- , ("M-S-<Return>", shellPrompt dtXPConfig)   -- Shell Prompt
        , ("M-C-<Return>", spawn $ "dmenu_run -i -nb '#191919' -nf '#fea63c' -sb '#fea63c' -sf '#191919' -fn 'NotoMonoRegular:bold:pixelsize=14'")
        , ("M-S-<Return>", spawn "rofi -show drun -theme ~/.config/rofi/slate.rasi -lines 8")   -- Shell Prompt
        , ("M-s", spawn "rofi -show window -theme ~/.config/rofi/slate.rasi -lines 8")   -- Shell Prompt
        
    -- Windows
        , ("M-q", kill1)                           -- Kill the currently focused client
        , ("M-S-q", killAll)                         -- Kill all windows on current workspace

    -- Floating windows
        -- , ("M-f", sendMessage (T.Toggle "floats"))       -- Toggles my 'floats' layout
        , ("M-f", sendMessage $ MT.Toggle NBFULL)
        , ("M-<Delete>", withFocused $ windows . W.sink) -- Push floating window back to tile
        , ("M-S-<Delete>", sinkAll)                      -- Push ALL floating windows to tile

    -- Grid Select (CTRL-g followed by a key)
        -- , ("C-g g", spawnSelected' myAppGrid)                 -- grid select favorite apps
        -- , ("C-M1-g", spawnSelected' myAppGrid)                -- grid select favorite apps
        -- , ("M-g s", goToSelected $ mygridConfig myColorizer)  -- goto selected window
        -- , ("C-g b", bringSelected $ mygridConfig myColorizer) -- bring selected window

    -- Tree Select/
        -- , ("M-t t", treeselectAction tsDefaultConfig)

    -- Windows navigation
        , ("M-m", windows W.focusMaster)     -- Move focus to the master window
        , ("M-j", windows W.focusDown)       -- Move focus to the next window
        , ("M-k", windows W.focusUp)         -- Move focus to the prev window
        --, ("M-S-m", windows W.swapMaster)    -- Swap the focused window and the master window
        , ("M-S-j", windows W.swapDown)      -- Swap focused window with next window
        , ("M-S-k", windows W.swapUp)        -- Swap focused window with prev window
        , ("M-<Backspace>", promote)         -- Moves focused window to master, others maintain order
        , ("M1-S-<Tab>", rotSlavesDown)      -- Rotate all windows except master and keep focus in place
        , ("M1-C-<Tab>", rotAllDown)         -- Rotate all the windows in the current stack
        --, ("M-S-s", windows copyToAll)
        , ("M-C-s", killAllOtherCopies)

        -- Layouts
        , ("M-<Tab>", sendMessage NextLayout)                -- Switch to next layout
        -- , ("M-S-<Tab>", sendMessage PrevLayout)                -- Switch to next layout
        , ("M-C-M1-<Up>", sendMessage Arrange)
        , ("M-C-M1-<Down>", sendMessage DeArrange)
        , ("M-<U>", sendMessage (MT.Toggle NBFULL) >> sendMessage ToggleStruts) -- Toggles noborder/full
        , ("M-S-<Space>", sendMessage ToggleStruts)         -- Toggles struts
        , ("M-S-n", sendMessage $ MT.Toggle NOBORDERS)      -- Toggles noborder
        , ("M-<KP_Multiply>", sendMessage (IncMasterN 1))   -- Increase number of clients in master pane
        , ("M-<KP_Divide>", sendMessage (IncMasterN (-1)))  -- Decrease number of clients in master pane
        , ("M-S-<KP_Multiply>", increaseLimit)              -- Increase number of windows
        , ("M-S-<KP_Divide>", decreaseLimit)                -- Decrease number of windows

        , ("M-h", sendMessage Shrink)                       -- Shrink horiz window width
        , ("M-l", sendMessage Expand)                       -- Expand horiz window width
        , ("M-C-j", sendMessage MirrorShrink)               -- Shrink vert window width
        , ("M-C-k", sendMessage MirrorExpand)               -- Exoand vert window width

    -- Workspaces
        , ("M-.", nextScreen)  -- Switch focus to next monitor
        , ("M-,", prevScreen)  -- Switch focus to prev monitor
        , ("M-<R>", nextWS)
        , ("M-<L>", prevWS)
        , ("M-S-<D>", toggleWS)
        , ("M-C-<L>", swapTo Prev )
        , ("M-C-<R>", swapTo Next )
        , ("M-M1-<R>", moveTo Next EmptyWS)
        , ("M-d", moveTo Next EmptyWS)
        , ("M-M1-<L>", moveTo Prev EmptyWS)
        , ("M-S-<R>", shiftToNext >> nextWS)       -- Shifts focused window to next ws
        , ("M-S-<L>", shiftToPrev >> prevWS)  -- Shifts focused window to prev ws

    -- Scratchpads
        -- , ("M-C-<Return>", namedScratchpadAction myScratchPads "terminal")
        -- , ("M-C-c", namedScratchpadAction myScratchPads "mocp")

    --- My Applications 
        , ("M-p", spawn "arandr")
        , ("M-e", spawn "thunar")
        , ("M-w", spawn myBrowser)
        , ("M-S-w", spawn $ "brave --incognito --tor" )
        , ("M-n", spawn "notion-app")
        , ("M-v", spawn $ "pavucontrol" )
        , ("M-y", spawn $ "polybar-msg cmd toggle" )
        , ("M-x", spawn $ "arcolinux-logout" )
        , (("C-S-<Esc>"), spawn $ "xfce4-taskmanager")

    -- Multimedia Keys
        , ("<XF86AudioMute>",   spawn "amixer set Master toggle")  -- Bug prevents it from toggling correctly in 12.04.
        , ("<XF86AudioLowerVolume>", spawn "amixer set Master 5%- unmute")
        , ("<XF86AudioRaiseVolume>", spawn "amixer set Master 5%+ unmute")
        , ("<XF86HomePage>", spawn "firefox")
        , ("<XF86Search>", safeSpawn "firefox" ["https://www.google.com/"])
        , ("<XF86Mail>", runOrRaise "geary" (resource =? "thunderbird"))
        , ("<XF86Calculator>", runOrRaise "gcalctool" (resource =? "gcalctool"))
        , ("<XF86Eject>", spawn "toggleeject")
        , ("<Print>", spawn "xfce4-screenshooter -fs ~/Pictures/ScreenShots/")
        , ("<XF86AudioPlay>", spawn "playerctl play-pause")
        , ("<XF86AudioNext>", spawn "playerctl next")
        , ("<XF86AudioPrev>", spawn "playerctl previous")

    {- 
    --MULTIMEDIA KEYS

        -- Mute volume
        , ((0, xF86XK_AudioMute), spawn $ "amixer -q set Master toggle")
        -- Decrease volume
        , ((0, xF86XK_AudioLowerVolume), spawn $ "amixer -q set Master 5%-")
        -- Increase volume
        , ((0, xF86XK_AudioRaiseVolume), spawn $ "amixer -q set Master 5%+")
        -- Increase brightness
        , ((0, xF86XK_MonBrightnessUp),  spawn $ "xbacklight -inc 5")
        -- Decrease brightness
        , ((0, xF86XK_MonBrightnessDown), spawn $ "xbacklight -dec 5")
        --  , ((0, xF86XK_AudioPlay), spawn $ "mpc toggle")
        --  , ((0, xF86XK_AudioNext), spawn $ "mpc next")
        --  , ((0, xF86XK_AudioPrev), spawn $ "mpc prev")
        --  , ((0, xF86XK_AudioStop), spawn $ "mpc stop")
        , ((0, xF86XK_AudioPlay), spawn $ "playerctl play-pause")
        , ((0, xF86XK_AudioNext), spawn $ "playerctl next")
        , ((0, xF86XK_AudioPrev), spawn $ "playerctl previous")
        , ((0, xF86XK_AudioStop), spawn $ "playerctl stop")
    -}

    {-
        
    --  XMONAD LAYOUT KEYS

        -- Cycle through the available layout algorithms.
        , ((modMask, xK_space), sendMessage NextLayout)
        --Focus selected desktop
        --, ((mod1Mask, xK_Tab), nextWS)
        --Focus selected desktop
        , ((modMask, xK_Tab), nextWS)
        --Focus selected desktop
        , ((modMask, xK_Left ), prevWS)
        --Focus selected desktop
        , ((modMask, xK_Right ), nextWS)
        --  Reset the layouts on the current workspace to default.
        , ((modMask .|. shiftMask, xK_space), setLayout $ XMonad.layoutHook conf)
        -- Move focus to the next window.
        , ((modMask, xK_j), windows W.focusDown)
        -- Move focus to the previous window.
        , ((modMask, xK_k), windows W.focusUp  )
        -- Move focus to the master window.
        , ((modMask .|. shiftMask, xK_m), windows W.focusMaster  )
        -- Swap the focused window with the next window.
        , ((modMask .|. shiftMask, xK_j), windows W.swapDown  )
        -- Swap the focused window with the next window.
        , ((controlMask .|. modMask, xK_Down), windows W.swapDown  )
        -- Swap the focused window with the previous window.
        , ((modMask .|. shiftMask, xK_k), windows W.swapUp    )
        -- Swap the focused window with the previous window.
        , ((controlMask .|. modMask, xK_Up), windows W.swapUp  )
        -- Shrink the master area.
        , ((controlMask .|. shiftMask , xK_h), sendMessage Shrink)
        -- Expand the master area.
        , ((controlMask .|. shiftMask , xK_l), sendMessage Expand)
        -- Push window back into tiling.
        , ((modMask .|. shiftMask , xK_t), withFocused $ windows . W.sink)
        -- Increment the number of windows in the master area.
        , ((controlMask .|. modMask, xK_Left), sendMessage (IncMasterN 1))
        -- Decrement the number of windows in the master area.
        , ((controlMask .|. modMask, xK_Right), sendMessage (IncMasterN (-1)))

    -}
    {-
        -- Other Shortcuts
        --((modMask, xK_c), spawn $ "conky-toggle" )
        -- , ((modMask, xK_f), sendMessage $ Toggle NBFULL)
        --, ((modMask, xK_q), kill )
        --, ((modMask, xK_r), spawn $ "rofi-theme-selector" )
        --, ((modMask, xK_Escape), spawn $ "xkill" )

        ---- CONTROL + ALT KEYS

        ---- , ((controlMask .|. mod1Mask , xK_e ), spawn $ "arcolinux-tweak-tool")
        ---- , ((controlMask .|. mod1Mask , xK_k ), spawn $ "arcolinux-logout")
        ---- , ((controlMask .|. mod1Mask , xK_o ), spawn $ "$HOME/.xmonad/scripts/picom-toggle.sh")
        ---- , ((controlMask .|. mod1Mask , xK_p ), spawn $ "pamac-manager")
        ---- , ((controlMask .|. mod1Mask , xK_s ), spawn $ "spotify")

        ---- ALT + ... KEYS

        --, ((mod1Mask, xK_f), spawn $ "variety -f" )
        --, ((mod1Mask, xK_n), spawn $ "variety -n" )
        --, ((mod1Mask, xK_p), spawn $ "variety -p" )
        --, ((mod1Mask, xK_r), spawn $ "xmonad --restart" )
        --, ((mod1Mask, xK_t), spawn $ "variety -t" )
        --, ((mod1Mask, xK_Up), spawn $ "variety --pause" )
        --, ((mod1Mask, xK_Down), spawn $ "variety --resume" )
        --, ((mod1Mask, xK_Left), spawn $ "variety -p" )
        --, ((mod1Mask, xK_Right), spawn $ "variety -n" )

        ----SCREENSHOTS

        --, ((0, xK_Print), spawn $ "xfce4-screenshooter --fullscreen")
        --, ((shiftMask, xK_Print), spawn $ "xfce4-screenshooter --window" )
        --, ((controlMask .|. shiftMask , xK_Print ), spawn $ "gnome-screenshot -i")
    -}
        ]
        
        -- The following lines are needed for named scratchpads.
          -- where nonNSP          = WSIs (return (\ws -> W.tag ws /= "nsp"))
          --       nonEmptyNonNSP  = WSIs (return (\ws -> isJust (W.stack ws) && W.tag ws /= "nsp"))
