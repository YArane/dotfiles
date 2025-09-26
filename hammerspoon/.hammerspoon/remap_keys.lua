local remap = {}

remap.press = function(modifiers, character)
	local event = require("hs.eventtap").event
	event.newKeyEvent(modifiers, character, true):post()
	event.newKeyEvent(modifiers, character, false):post()
end

remap.bind = function(mod1, arg1, mod2, arg2)
	local hotkey = hs.hotkey.bind(mod1, arg1, nil, function()
		remap.press(mod2, arg2)
	end)
	return hotkey
end

return remap
