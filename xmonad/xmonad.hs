import XMonad
import XMonad.Hooks.ManageDocks
import XMonad.Hooks.DynamicLog
import XMonad.Actions.SpawnOn
import XMonad.Util.EZConfig          (additionalKeys)
import System.Environment            (getEnv)
import XMonad.Util.Run
import XMonad.Util.Loggers
import Data.ByteString.UTF8          (fromString, toString)
import XMonad.Layout.Spacing

import qualified XMonad.StackSet as W
import qualified Data.Map        as M
  


myBar = "xmobar"

myPP = xmobarPP { ppCurrent = wrap "<" ">"
                , ppTitle   = shorten 40
                }

myModMask = mod4Mask
toggleStrutsKey XConfig {XMonad.modMask = modMask} = (modMask, xK_b)

myStartupHook = spawnHere "feh --bg-scale $HOME/.xmonad/background.jpg"
    >> spawnHere "xbanish"
    >> spawn "compton"
    >> spawn "emacs --daemon"

myConfig =  defaultConfig
    { terminal		= "termite"
    , modMask 		= myModMask
    , layoutHook 	= spacing 2 $ Tall 1 (3/100) (1/2) 
      -- avoidStruts $ layoutHook defaultConfig
    , manageHook 	= manageHook defaultConfig <+> manageDocks
    , startupHook 	= myStartupHook
    } `additionalKeys` customKeys

data Theme = Theme { defaultBackground :: String
                   , lighterBackground :: String
                   , selectionBackground :: String
                   , comments :: String
                   , darkForeground :: String
                   , defaultForeground :: String
                   , lightForeground :: String
                   , lightBackground :: String
                   , variables :: String
                   , types :: String
                   , bold :: String
                   , diff :: String
                   , quotes :: String
                   , headings :: String
                   , italic :: String
                   , sectionHeaders :: String
                   , normalFont :: String
                   , monoFont :: String
                   , headerFont :: String
                   , dmenuPrompt :: String
                   } deriving (Show)
                                        
buildDmenuFlag flag value theme = " " ++ flag ++ " '#" ++ (value theme) ++ "'"
buildDmenuString =
               --  let fn = buildDmenuFlag "-fn" headerFont theme
               --      nb = buildDmenuFlag "-nb" defaultBackground theme
               --      nf = buildDmenuFlag "-nf" defaultForeground theme
               --      sb = buildDmenuFlag "-sb" selectionBackground theme
               --      sf = buildDmenuFlag "-sf" lightForeground theme
               --      ppt = buildDmenuFlag "-p" dmenuPrompt theme
               --  in 
                   "dmenu_run "

customKeys =
                   [ ((myModMask              , xK_c), spawn $ buildDmenuString)
                   , ((myModMask              , xK_h), windows W.focusDown)
                   , ((myModMask              , xK_t), windows W.focusUp)
                   , ((myModMask .|. shiftMask, xK_h), windows W.swapDown)
                   , ((myModMask .|. shiftMask, xK_t), windows W.swapUp)
                   , ((myModMask              , xK_d), sendMessage Shrink)
                   , ((myModMask              , xK_n), sendMessage Expand)
                   ]
                   
main = do
    xmonad =<< statusBar myBar myPP toggleStrutsKey myConfig
