module Custom.MyKeys where

    -- Custom (my personal configs)
import Custom.MyGridMenu
import Custom.MyPrompts
import Custom.MyScratchpads
import Custom.MyTreeMenu
import Custom.MyVariables

    -- Base
import XMonad
import System.Exit (exitSuccess)
import qualified XMonad.StackSet as W

    -- Actions
import XMonad.Actions.CopyWindow (kill1, killAllOtherCopies)
import XMonad.Actions.CycleWS (moveTo, shiftToNext, shiftToPrev, shiftTo, WSType(..), nextScreen, prevScreen, nextWS, prevWS, toggleWS)
import XMonad.Actions.Promote
import XMonad.Actions.GridSelect
import XMonad.Actions.RotSlaves (rotSlavesDown, rotAllDown)
import qualified XMonad.Actions.TreeSelect as TS
import XMonad.Actions.WindowGo (runOrRaise)
import XMonad.Actions.WithAll (sinkAll, killAll)
import qualified XMonad.Actions.Search as S
import XMonad.Actions.WorkspaceNames

    -- Data
import Data.Maybe (isJust)

    -- Hooks
import XMonad.Hooks.ManageDocks (avoidStruts, docksEventHook, manageDocks, ToggleStruts(..))

    -- Layouts and modifiers
import XMonad.Layout.LimitWindows (limitWindows, increaseLimit, decreaseLimit)
import XMonad.Layout.MultiToggle.Instances (StdTransformers(NBFULL, MIRROR, NOBORDERS))
import XMonad.Layout.ResizableTile
import XMonad.Layout.WindowArranger (windowArrange, WindowArrangerMsg(..))
import qualified XMonad.Layout.ToggleLayouts as T (toggleLayouts, ToggleLayout(Toggle))
import qualified XMonad.Layout.MultiToggle as MT (Toggle(..))

    -- Prompt
import XMonad.Prompt
import XMonad.Prompt.Shell (shellPrompt)

    -- Utilities
import XMonad.Util.NamedScratchpad
import XMonad.Util.Run (runProcessWithInput, safeSpawn, spawnPipe)
import XMonad.Util.SpawnOnce

------------------------------------------------------------------------
-- KEYBINDINGS
------------------------------------------------------------------------
-- I am using the Xmonad.Util.EZConfig module which allows keybindings
-- to be written in simpler, emacs-like format.
myKeys :: [(String, X ())]
myKeys =
    -- Xmonad
        [ ("M-C-r", spawn "xmonad --recompile")      -- Recompiles xmonad
        , ("M-S-r", spawn "xmonad --restart")        -- Restarts xmonad
        , ("M-C-q", io exitSuccess)                  -- Quits xmonad

    -- Open my preferred terminal
        , ("M-<Return>", spawn myTerminal)

    -- Run Prompt
        -- , ("M-S-<Return>", shellPrompt dtXPConfig)   -- Shell Prompt
        , ("M-S-<Return>", spawn "rofi -show drun -theme ~/.config/rofi/slate.rasi -lines 8")   -- Shell Prompt
        , ("M-s", spawn "rofi -show window -theme ~/.config/rofi/slate.rasi -lines 8")   -- Shell Prompt
        
    -- Windows
        , ("M-q", kill1)                           -- Kill the currently focused client
        , ("M-S-q", killAll)                         -- Kill all windows on current workspace

    -- Floating windows
        , ("M-f", sendMessage (T.Toggle "floats"))       -- Toggles my 'floats' layout
        , ("M-<Delete>", withFocused $ windows . W.sink) -- Push floating window back to tile
        , ("M-S-<Delete>", sinkAll)                      -- Push ALL floating windows to tile

    -- Grid Select (CTRL-g followed by a key)
        , ("C-g g", spawnSelected' myAppGrid)                 -- grid select favorite apps
        , ("C-M1-g", spawnSelected' myAppGrid)                -- grid select favorite apps
        , ("M-g s", goToSelected $ mygridConfig myColorizer)  -- goto selected window
        , ("C-g b", bringSelected $ mygridConfig myColorizer) -- bring selected window

    -- Tree Select/
        , ("M-t t", treeselectAction tsDefaultConfig)

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
        , ("M-C-<Return>", namedScratchpadAction myScratchPads "terminal")
        , ("M-C-c", namedScratchpadAction myScratchPads "mocp")

    --- My Applications 
        , ("M-p", spawn "arandr")
        , ("M-e", spawn "thunar")
        , ("M-w", spawn "vivaldi-stable")
        , ("M-S-w",spawn "vivaldi-stable --incognito" )
        , ("M-n", spawn "notion-snap")

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
        ]
        -- The following lines are needed for named scratchpads.
          where nonNSP          = WSIs (return (\ws -> W.tag ws /= "nsp"))
                nonEmptyNonNSP  = WSIs (return (\ws -> isJust (W.stack ws) && W.tag ws /= "nsp"))

