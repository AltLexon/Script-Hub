local rbxmSuite = loadstring(game:HttpGetAsync("https://github.com/richie0866/rbxm-suite/releases/latest/download/rbxm-suite.lua"))()
rbxmSuite.launch("Scripts/Script Hub/FluidHub.rbxm", {
    runscripts = true,
    deferred = true,
    nocache = false,
    nocirculardeps = true,
    debug = true,
    verbose = false
})