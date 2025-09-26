
local app = {}
local application = require("application")

app.disable = function(bundleID, maps)
	application.onChange(bundleID, function(name, type, app)
		if hs.application.frontmostApplication():name() == name then
			for i, map in ipairs(maps) do	
				map:disable()
			end
		else
			for i, map in ipairs(maps) do	
				map:enable()
			end
		end
	end, true)
end

app.enable = function(bundleID, maps)
	application.onChange(bundleID, function(name, type, app)
		if hs.application.frontmostApplication():name() == name then
			for i, map in ipairs(maps) do	
				map:enable()
			end
		else
			for i, map in ipairs(maps) do	
				map:disable()
			end
		end
	end, true)
end

hs.hotkey.bind({"alt", "shift"}, "b", function()
	print(hs.application.frontmostApplication():bundleID())
end)
return app
