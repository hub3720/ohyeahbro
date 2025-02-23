
local VirtualUser = game:GetService("VirtualUser") local player = game:GetService("Players").LocalPlayer local stages = game:GetService("Workspace").BoatStages.NormalStages local goldenChest = game:GetService("Workspace").BoatStages.NormalStages.TheEnd.GoldenChest.Trigger

local autoFarmActive = false

local function win() repeat wait() until player.Character local character = player.Character or player:WaitForChild("Character")

for _, stage in ipairs(stages:GetChildren()) do
    if stage:FindFirstChild("Darkness") then continue end
    character:MoveTo(stage.Position)
    wait(0.5)
end

character:MoveTo(goldenChest.Position)
firetouchinterest(character.HumanoidRootPart, goldenChest, 0)
wait(0.5)
firetouchinterest(character.HumanoidRootPart, goldenChest, 1)

end

local function startAutoFarm() while autoFarmActive do pcall(win) wait(1) end end

local screenGui = Instance.new("ScreenGui") screenGui.Parent = game.CoreGui

local frame = Instance.new("Frame") frame.Size = UDim2.new(0, 300, 0, 200) frame.Position = UDim2.new(0.5, -150, 0.5, -100) frame.BackgroundColor3 = Color3.fromRGB(255, 255, 255) frame.BorderSizePixel = 0 frame.Parent = screenGui

local minimizeButton = Instance.new("TextButton") minimizeButton.Size = UDim2.new(0, 50, 0, 20) minimizeButton.Position = UDim2.new(0, 0, 0, -20) minimizeButton.BackgroundColor3 = Color3.fromRGB(0, 0, 255) minimizeButton.Text = "_" minimizeButton.TextColor3 = Color3.fromRGB(0, 0, 0) minimizeButton.Parent = frame

local autoFarmButton = Instance.new("TextButton") autoFarmButton.Size = UDim2.new(0, 280, 0, 50) autoFarmButton.Position = UDim2.new(0, 10, 0, 75) autoFarmButton.BackgroundColor3 = Color3.fromRGB(0, 0, 0) autoFarmButton.Text = "Auto Farm" autoFarmButton.TextColor3 = Color3.fromRGB(255, 255, 255) autoFarmButton.Parent = frame

autoFarmButton.MouseButton1Click:Connect(function() autoFarmActive = not autoFarmActive if autoFarmActive then autoFarmButton.Text = "Auto Farm (On)" startAutoFarm() else autoFarmButton.Text = "Auto Farm (Off)" player.Character:BreakJoints() end end)

local minimized = false minimizeButton.MouseButton1Click:Connect(function() minimized = not minimized frame.Visible = not minimized

if minimized then
    minimizeButton.Text = "⮜"
    minimizeButton.Position = UDim2.new(0, 0, 0, 0)
else
    minimizeButton.Text = "_"
    frame.Visible = true
end

end)


