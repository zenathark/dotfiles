import XMonad
import XMonad.Hooks.ManageDocks
import XMonad.Hooks.DynamicLog
import XMonad.Actions.SpawnOn
import XMonad.Util.EZConfig          (additionalKeys)
import System.Environment            (getEnv)
import XMonad.Util.Run
import XMonad.Util.Loggers
import XMonad.Layout.Spacing
import XMonad.Layout.Gaps
import XMonad.Hooks.UrgencyHook

import qualified XMonad.StackSet as W
import qualified Data.Map        as M
  


myBar = "yabar -c ~/.xmonad/yabar.conf"

myPP xmproc = dynamicLogWithPP $ defaultPP { ppOutput = hPutStrLn xmproc
                                           , ppHidden = pad
                                           , ppCurrent = wrap "[" "]"
                                           , ppTitle = shorten 40
                                           , ppLayout = pad
                                           , ppUrgent = pad
                                           , ppWsSep = ""
                                           , ppSep = ""
                                           }

myModMask = mod4Mask
toggleStrutsKey XConfig {XMonad.modMask = modMask} = (modMask, xK_b)

myStartupHook = spawnHere "feh --bg-scale $HOME/.xmonad/background.jpg"
    >> spawnHere "xbanish"
    >> spawn "compton"
    >> spawn "emacs --daemon"

myConfig theme xmproc = defaultConfig
    { terminal		= "termite"
    , modMask 		= myModMask
    , layoutHook 	= avoidStruts $ gaps [(D,20)] $ spacing 3 $ Tall 1 (3/100) (1/2) 
    , manageHook 	= manageHook defaultConfig <+> manageDocks
    , startupHook 	= myStartupHook
    , normalBorderColor = (color4 theme)
    , focusedBorderColor = (color2 theme)
    , logHook           =  myPP xmproc
    , workspaces = ["1", "2"]
    } `additionalKeys` (customKeys theme)

data Theme = Theme { color0 :: String
                   , color1 :: String
                   , color2 :: String
                   , color3 :: String
                   , color4 :: String
                   , color5 :: String
                   , color6 :: String
                   , color7 :: String
                   , color8 :: String
                   , color9 :: String
                   , color10 :: String
                   , color11 :: String
                   , color12 :: String
                   , color13 :: String
                   , color14 :: String
                   , color15 :: String
                   , color16 :: String
                   , color17 :: String
                   , color18 :: String
                   , color19 :: String
                   , color20 :: String
                   , color21 :: String
                   , normalFont :: String
                   , monoFont :: String
                   , headerFont :: String
                   , dmenuPrompt :: String
                   } deriving (Show)
                                        
buildDmenuFlag flag value theme = " " ++ flag ++ " '" ++ (value theme) ++ "'"
buildDmenuString theme =
                let fn = buildDmenuFlag "-fn" headerFont theme
                    nb = buildDmenuFlag "-nb" color0 theme
                    nf = buildDmenuFlag "-nf" color5 theme
                    sb = buildDmenuFlag "-sb" color2 theme
                    sf = buildDmenuFlag "-sf" color6 theme
                    ppt = buildDmenuFlag "-p" dmenuPrompt theme
                in "dmenu_run" ++ " -p '---'"

customKeys theme =
                   [ ((myModMask              , xK_c), spawn $ buildDmenuString theme)
                   , ((myModMask              , xK_h), windows W.focusDown)
                   , ((myModMask              , xK_t), windows W.focusUp)
                   , ((myModMask .|. shiftMask, xK_h), windows W.swapDown)
                   , ((myModMask .|. shiftMask, xK_t), windows W.swapUp)
                   , ((myModMask              , xK_d), sendMessage Shrink)
                   , ((myModMask              , xK_n), sendMessage Expand)
                   ]
                   
main = do
    let theme = Theme { color0  = "#282c34"
                      , color8  = "#545862"
                      , color7  = "#abb2bf"
                      , color15 = "#c8ccd4"

                      -- Red
                      , color1  = "#e06c75"
                      , color9  = "#e06c75"
                      
                      -- Green
                      , color2  = "#98c379"
                      , color10 = "#98c379"
                      
                      -- Yellow
                      , color3  = "#e5c07b"
                      , color11 = "#e5c07b"
                      
                      -- Blue
                      , color4  = "#61afef"
                      , color12 = "#61afef"
                      
                      -- Purple
                      , color5  = "#c678dd"
                      , color13 = "#c678dd"
                      
                      -- Teal
                      , color6  = "#56b6c2"
                      , color14 = "#56b6c2"
                      
                      -- Extra colors
                      , color16 = "#d19a66"
                      , color17 = "#be5046"
                      , color18 = "#353b45"
                      , color19 = "#3e4451"
                      , color20 = "#565c64"
                      , color21 = "#b6bdca"

                      -- Fonts
                      , normalFont = "Lato-9"
                      , monoFont = "Hack-9"
                      , headerFont = "Lato Bold-9"
                      , dmenuPrompt = "λ."

                      }

    xmproc <- spawnPipe "socat unix-listen:/tmp/xmonad.sock,fork,reuseaddr stdio"
    -- xmonad =<< statusBar myBar (myPP xmproc) toggleStrutsKey (myConfig theme xmproc)
    spawn myBar
    xmonad $ withUrgencyHook NoUrgencyHook $ myConfig theme xmproc
