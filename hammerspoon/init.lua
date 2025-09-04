-- scroll with middle mouse click
local mouse_scroll_wheel = require('mouse_scroll_wheel')

-- remap scroll lock to command
local FRemap = require('foundation_remapping')
local remapper = FRemap.new()
remapper:remap('ScrollLock', 'lcmd')
remapper:register()

-- other bindings
local remap = require("remap_keys")
local app = require("app")

local copy = remap.bind("ctrl", "c", "cmd", "c")
local paste = remap.bind("ctrl", "v", "cmd", "v")
local cut = remap.bind("ctrl", "x", "cmd", "x")

local copy_shift = remap.bind({ "ctrl", "shift" }, "c", "cmd", "c")
local paste_shift = remap.bind({ "ctrl", "shift" }, "v", "cmd", "v")

local select_all = remap.bind("ctrl", "a", "cmd", "a")
local open = remap.bind("ctrl", "o", "cmd", "o")
local new = remap.bind("ctrl", "n", "cmd", "n")
local find = remap.bind("ctrl", "f", "cmd", "f")
local screenshot = remap.bind({ "alt", "shift" }, "5", { "cmd", "shift" }, "5")

local new_tab = remap.bind("ctrl", "t", "cmd", "t")
--local close_tab = remap.bind("ctrl", "w", "cmd", "w")

local history = remap.bind("ctrl", "h", "cmd", "y")
local finder_delete = remap.bind(nil, "forwarddelete", "cmd", "delete")
local spotlight = remap.bind("ctrl", "space", "cmd", "space")

--app.disable("com.googlecode.iterm2", { paste, copy, close_tab, select_all, new_tab, spotlight })
--app.disable("com.jetbrains.intellij.ce", { paste, close_tab })
app.disable("com.googlecode.iterm2", { paste, copy, select_all, new_tab, spotlight })
app.disable("com.jetbrains.intellij.ce", { paste })
app.disable("com.jetbrains.intellij", { paste })
--app.disable("com.jetbrains.pycharm", {paste, close_tab})
app.enable("com.googlecode.iterm2", { copy_shift, paste_shift })
app.enable("com.google.Chrome", { history })
app.enable("com.apple.finder", { finder_delete })

function moveWindowToDisplay(d)
    return function()
        local displays = hs.screen.allScreens()
        local win = hs.window.focusedWindow()
        win:moveToScreen(displays[d], false, true)
    end
end

hs.hotkey.bind({ "alt", "shift" }, "left", moveWindowToDisplay(1))
hs.hotkey.bind({ "alt", "shift" }, "right", moveWindowToDisplay(2))
