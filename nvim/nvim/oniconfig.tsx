
import * as React from "react"
import * as Oni from "oni-api"

export const activate = (oni: Oni.Plugin.Api) => {
    console.log("config activated")

    // Input
    //
    // Add input bindings here:
    //
    oni.input.bind("<c-enter>", () => console.log("Control+Enter was pressed"))
    oni.input.bind("<s-c-g>", () => oni.commands.executeCommand("sneak.show"))
    //
    // Or remove the default bindings here by uncommenting the below line:
    //
    // oni.input.unbind("<c-p>")

}

export const deactivate = (oni: Oni.Plugin.Api) => {
    console.log("config deactivated")
}

export const configuration = {
    //add custom config here, such as

  //  "ui.colorscheme"            : "onedark"
    "ui.hideMenu"               : true,
    "oni.loadInitVim"           : true,
    "autoClosingPairs.enabled"  : true,
//    "commandline.mode"          : true,
//    "wildmenu.mode"             : false,
    "sidebar.enabled"           : false,
    "sidebar.default.open"      : false,
    "learnign.enabled"          : false,
    "achievements.enabled"      : false,
    "editor.typingPrediction"   : false,
    "editor.textMateHighlighting.enabled" : false

    //"oni.useDefaultConfig": true,
    //"oni.bookmarks": ["~/Documents"],
    "editor.fontSize"       : "12px",
    "editor.fontFamily"     : "Fira Code",

    // UI customizations
    "ui.animations.enabled" : true,
    "ui.fontSmoothing"      : "auto",
}
