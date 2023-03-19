local ok, nvim_web_devicons = pcall(require, "nvim-web-devicons")
if not ok then
	print("'nvim-web-devicons' not installed")
	return
end

nvim_web_devicons.set_icon({
	md = {
		icon = "",
		color = "gray",
		name = "Markdown",
	},
})

nvim_web_devicons.set_icon({
	env = {
		icon = "",
		color = "gray",
		name = "Env",
	},
})

nvim_web_devicons.set_icon({
	[".env.local"] = {
		icon = "",
		color = "gray",
		name = "EnvLocal",
	},
})

nvim_web_devicons.set_icon({
	[".env.development"] = {
		icon = "",
		color = "gray",
		name = "EnvDevelopment",
	},
})

nvim_web_devicons.set_icon({
	[".env.production"] = {
		icon = "",
		color = "gray",
		name = "EnvProduction",
	},
})
