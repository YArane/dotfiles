--if true then return {} end -- WARN: REMOVE THIS LINE TO ACTIVATE THIS FILE

-- AstroCommunity: import any community modules here
-- We import this file in `lazy_setup.lua` before the `plugins/` folder.
-- This guarantees that the specs are processed before any user plugins.

---@type LazySpec
return {
	"AstroNvim/astrocommunity",
	{ import = "astrocommunity.pack.toml" },
	{ import = "astrocommunity.pack.markdown" },
	{ import = "astrocommunity.pack.yaml" },

	{ import = "astrocommunity.pack.docker" },
	{ import = "astrocommunity.pack.helm" },

	{ import = "astrocommunity.pack.bash" },
	{ import = "astrocommunity.pack.lua" }, -- requires unzip
	{ import = "astrocommunity.pack.java" },
	--{ import = "astrocommunity.pack.sql" }, -- requires go
}
