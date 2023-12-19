-- Imports - Base
import XMonad
import System.IO (hPutStrLn)

-- Imports - Hooks
import XMonad.Hooks.DynamicLog (dynamicLogWithPP, wrap, xmobarPP, xmobarColor, shorten, PP(..))
import XMonad.Hooks.ManageDocks (avoidStruts, docks, manageDocks)

-- Imports - Layouts
import XMonad.Layout.ResizableTile

-- Imports - Layout Modifiers
import XMonad.Layout.Renamed
import XMonad.Layout.Spacing

-- Imports - Utilities
import XMonad.Util.Run (spawnPipe)
import XMonad.Util.EZConfig (additionalKeysP)
import XMonad.Util.NamedActions
import XMonad.Util.SpawnOnce

myModMask :: KeyMask
myModMask = mod1Mask

myTerminal :: String
myTerminal = "kitty"

myEditor :: String
myEditor = myTerminal ++ " -e nvim  "

myBorderWidth :: Dimension
myBorderWidth = 3

myWorkSpaces = map show [1..9]

mySpacing i = spacingRaw False (Border i i i i) True (Border i i i i) True

tall = renamed [Replace "tall"]
       $ mySpacing 8
       $ ResizableTall 1 (3/100) (1/2) []

monocle = renamed [Replace "monocle"]
          $ Full
       
myLayoutHook = avoidStruts
               $ myDefaultLayout
            where
                myDefaultLayout = tall
                                  ||| monocle
    

myLogHook h = dynamicLogWithPP $ xmobarPP
                { ppOutput          = hPutStrLn h
                , ppCurrent         = xmobarColor "#81A1C1" "" . wrap "[""]"
                , ppHidden          = xmobarColor "#D8DEE9" ""
                , ppTitle           = xmobarColor "#4C566A" "" . shorten 60
                , ppSep             = " | "
                , ppHiddenNoWindows = xmobarColor "#4C566A" ""
                }

myStartupHook = do
    spawnOnce "picom"
    spawn "feh --randomize --bg-fill ~/.dotfiles/wallpapers/*"

main :: IO ()
main = do
    xmproc <- spawnPipe ("xmobar $HOME/.config/xmobar/.xmobarrc")
    xmonad $ docks $ def
        { modMask       = myModMask
        , terminal      = myTerminal
        , borderWidth   = myBorderWidth
        , normalBorderColor = "#4C566A"
        , focusedBorderColor = "#81A1C1"
        , workspaces    = myWorkSpaces
        , manageHook    = manageDocks <+> manageHook def
        , layoutHook    = myLayoutHook
        , logHook       = myLogHook xmproc
        , startupHook   = myStartupHook
        }
        `additionalKeysP`
        [ ("M-C-r"          , spawn "xmonad --recompile")
        , ("M-S-r"          , spawn "xmonad --restart")
        , ("M-S-x"          , spawn "xmonad --exit")
        , ("M-q"            , kill)
        , ("M-d"            , spawn "dmenu_run")
        , ("M-<Return>"     , spawn myTerminal)
        , ("M-S-<Return>"   , spawn "thunar")
        , ("M-f"            , spawn "firefox" )
        ]


