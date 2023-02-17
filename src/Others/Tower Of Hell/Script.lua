local Players = game:GetService('Players')
local RunService = game:GetService('RunService')
local TweenService = game:GetService('TweenService')
local UserInputService = game:GetService('UserInputService')

local Functions = require(script.Parent.functions)

return function()
    local Library = Functions.LoadLibrary()
    require(script.Parent.anticheat)()

    _G.FarmingOne = false
    _G.FarmingTwo = false
    _G.InfiniteJump = false

    local Home = Library:CreateTab("Home")
    Home:CreateSection("Script Credits")
    Home:CreateParagraph({Title = "Developers", Content = "\nSuno#2182\nAltLexon#1574"})
    Home:CreateSection("Updates")
    Home:CreateParagraph({Title = "Features", Content = "\nReleased Fluid Hub 1.0"})
    Home:CreateSection("Information")
    Home:CreateParagraph({Title = "Basic Information", Content = "\nRunning version "..require(script.Parent.version)})
    local Farming = Library:CreateTab("Farming")
    Farming:CreateSection("Auto Farms")
    Farming:CreateToggle({
        Name = "Tween Farming",
        CurrentValue = false,
        Flag = "Tweenedfarming",
        Callback = function(Value)
            _G.FarmingOne = Value
            if _G.FarmingOne then
                if _G.FarmingTwo then
                    _G.FarmingOne = false
                else
                    _G.FarmingOne = true
                end
            end
        end
    })
    coroutine.wrap(function()
        while RunService.Heartbeat:Wait() do
            if _G.FarmingOne and not _G.FarmingTwo then
                TweenService:Create(Players.LocalPlayer.Character.HumanoidRootPart, TweenInfo.new(1, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut), {CFrame = game:GetService("Workspace").tower.sections.finish.FinishGlow.CFrame + Vector3.new(2, 0, 0)}):Play()
            elseif not _G.FarmingOne and _G.FarmingTwo then
                Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game:GetService("Workspace").tower.sections.finish.FinishGlow.CFrame
            end
        end
    end)()
    Library:CreateTab("Tools")

    local Modifications = Library:CreateTab("Modifications")
    Modifications:CreateSection("Local Player")
    Modifications:CreateSlider({
        Name = "Walk Speed",
        Range = {0, 125},
        Increment = 5,
        Suffix = "A",
        CurrentValue = tonumber(Players.LocalPlayer.Character.Humanoid.WalkSpeed),
        Flag = "WS",
        Callback = function(Value)
            Players.LocalPlayer.Character.Humanoid.WalkSpeed = Value
        end,
    })
    Modifications:CreateSlider({
        Name = "Jump Power",
        Range = {0, 200},
        Increment = 10,
        Suffix = "A",
        CurrentValue = tonumber(Players.LocalPlayer.Character.Humanoid.JumpPower),
        Flag = "JP",
        Callback = function(Value)
            Players.LocalPlayer.Character.Humanoid.JumpPower = Value
        end,
    })
    Modifications:CreateToggle({
        Name = "Noclip",
        CurrentValue = false,
        Flag = "Noclip",
        Callback = function(Value)
          Functions.Noclip(Value)
        end,
    })
    Modifications:CreateToggle({
        Name = "Infinite Jump",
        CurrentValue = false,
        Flag = "InfJump",
        Callback = function(Value)
            _G.InfiniteJump = Value
        end,
    })
    coroutine.wrap(function()
        while RunService.Heartbeat:Wait() do
            if _G.InfiniteJump then
                UserInputService.InputBegan:Connect(function(input)
                    if input.KeyCode == Enum.KeyCode.Space then
                        Players.LocalPlayer.Character.Humanoid:ChangeState(Enum.HumanoidStateType.Jumping)
                    end
                end)
            end
        end
    end)()
    Library:CreateTab("Options")
end