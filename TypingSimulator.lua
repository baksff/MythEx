--[[ 
made by baksff#9674
$
moonsec is shit, he broke my script :/
$
don't pass off my script as your own, pls
]]--
getgenv().autotap = false
getgenv().autosell = false
getgenv().autodevices = false
getgenv().autoegg = false
getgenv().worker1 = false
getgenv().worker10 = false
getgenv().worker100 = false
getgenv().autoreb = false
getgenv().automsg = false
getgenv().autoreincarnation = false

--// Locals
local sell = game:GetService("Workspace").Sell.Open
local plr = game.Players.LocalPlayer.Character.HumanoidRootPart
local devic = game:GetService("Players").LocalPlayer.PlayerGui.MainUI.UpgradesComputer.Devices1
local eggs = game:GetService("Workspace").Eggs
local loc = game:GetService("Workspace").Portals.TeleportSpots
local work1 = game:GetService("Players").LocalPlayer.PlayerGui.MainUI.UpgradesMenu.Workers1
local work10 = game:GetService("Players").LocalPlayer.PlayerGui.MainUI.UpgradesMenu.Workers10
local work100 = game:GetService("Players").LocalPlayer.PlayerGui.MainUI.UpgradesMenu.Workers100
local plrId = game:GetService("Players").LocalPlayer.UserId


--// Lists
local eggsList = {}
for _,v in next, eggs:GetChildren() do
    if not v.Name:lower():find("robux") then
        table.insert(eggsList,v.Name)
    end
end
local mapsList = {}
for _,v in pairs(loc:GetChildren()) do
    table.insert(mapsList,v.Name)
end
local rebList = {
    1,
    10,
    50,
    250,
    750,
    2500,
    5000,
    15000,
    35000,
    80000,
    200000,
    500000,
    1300000,
    2000000,
    8000000,
    15000000,
    55000000,
    150000000,
    450000000,
    900000000,
    2500000000,
    10000000000,
    50000000000,
    250000000000,
    1250000000000
}
local reinList = {
    1,
    5,
    15,
    50,
    150,
    350,
    500,
    1000,
    3500,
    9000,
    25000
}

--// Functions
function doTap()
    spawn(function()
        while autotap do
            wait()
            local args = {[1] = "Click"}
            game:GetService("ReplicatedStorage").Remotes.Mines:FindFirstChild(tonumber(plrId)):FireServer(unpack(args))
        end
    end)
end

function autoSell()
    spawn(function()
        while autosell do
            wait()
            for _,v in pairs(sell:GetChildren()) do
                if v:IsA("TouchTransmitter") then
                    firetouchinterest(plr, v.Parent, 0)
                    wait()
                    firetouchinterest(plr, v.Parent, 1)
                end
            end
        end
    end)
end

function autoDevice()
    spawn(function()
        while autodevices do
            wait()
            for _,v in pairs(devic:GetChildren()) do
                if v.ClassName == "ImageLabel" then
                    game:GetService("ReplicatedStorage").Remotes.BuyDevice:FireServer(unpack({
                        [1] = v.Name,
                        [2] = "purchase"
                    }))
                end
            end
        end
    end)
end

function autoRebirth(a)
    spawn(function()
        while autoreb do
            wait()
            game:GetService("ReplicatedStorage").Remotes.Rebirth:FireServer(unpack({
                [1] = "Prestige",
                [2] = selectedRebirth
            }))
        end
    end)
end

function autoRein(a)
    spawn(function()
        while autoreincarnation do
            wait()
            game:GetService("ReplicatedStorage").Remotes.Rebirth:FireServer(unpack({
                [1] = "Reincarnation",
                [2] = selectedReincarnation
            }))
        end
    end)
end

function buyWorker1()
    spawn(function()
        while worker1 do
            wait()
            for _,v in pairs(work1:GetChildren()) do
                if v.ClassName == "ImageLabel" then
                    game:GetService("ReplicatedStorage").Remotes.BuyMine:FireServer(unpack({
                        [1] = v.Name,
                        [2] = 1
                    }))
                end
            end
        end
    end)
end
function buyWorker10()
    spawn(function()
        while worker10 do
            wait()
            for _,v in pairs(work10:GetChildren()) do
                if v.ClassName == "ImageLabel" then
                    game:GetService("ReplicatedStorage").Remotes.BuyMine:FireServer(unpack({
                        [1] = v.Name,
                        [2] = 10
                    }))
                end
            end
        end
    end)
end
function buyWorker100()
    spawn(function()
        while worker100 do
            wait()
            for _,v in pairs(work100:GetChildren()) do
                if v.ClassName == "ImageLabel" then
                    game:GetService("ReplicatedStorage").Remotes.BuyMine:FireServer(unpack({
                        [1] = v.Name,
                        [2] = 100
                    }))
                end
            end
        end
    end)
end

function buyEgg(a, amount)
    spawn(function()
        while task.wait() do
            if not getgenv().autoegg or not selectedEgg then
                break
            end
            if selectedEgg then
                game:GetService("ReplicatedStorage").RemoteEvents.EggOpened:InvokeServer(unpack({
                [1] = selectedEgg,
                [2] = tostring(amount)
                }))
            end
        end
    end)
end

function autoMessages()
    spawn(function()
        while automsg do
            wait()
            local args = {[1] = "Worker"}
            game:GetService("ReplicatedStorage").Remotes.Mines:FindFirstChild(tonumber(plrId)):FireServer(unpack(args))
        end
    end)
end

function getCurrentPlayerPOS()
    if not game.Players.LocalPlayer then
        return false
    end
    return game.Players.LocalPlayer.Character.HumanoidRootPart.Position
end

function teleportTO(a)
    if game.Players.LocalPlayer then
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = a
    end
end

function teleportWorld(a)
    if a then
        teleportTO(loc[a].CFrame)
    end
end

--// Library Setup
local gname = game:GetService("MarketplaceService"):GetProductInfo(game.PlaceId).Name
local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/Stebulous/solaris-ui-lib/main/source.lua"))()
local Window = Library:New({
   Name = "MythEx | "..gname.." | 1.0",
   FolderToSave = "MythEx"
})

--// Farming Tab
local MTab = Window:Tab("Farming")
local MSection = MTab:Section("These features will make it easier for you to play")
MSection:Toggle("Auto Click", false, "", function(v)
    getgenv().autotap = v
    if v then
        doTap()
    end
end)
MSection:Toggle("Auto Sell", false, "", function(v)
    getgenv().autosell = v
    if v then
        autoSell()
    end
end)
MSection:Toggle("Auto Buy Devices", false, "", function(v)
    getgenv().autodevices = v
    if v then
        autoDevice()
    end
end)
MSection:Toggle("Auto Messages", false, "", function(v)
    getgenv().automsg = v
    if v then
        autoMessages()
    end
end)

local WSection = MTab:Section("Auto buy workers")
WSection:Toggle("Auto Buy Workers (1)", false, "", function(v)
    getgenv().worker1 = v
    if v then
        buyWorker1()
    end
end)
WSection:Toggle("Auto Buy Workers (10)", false, "", function(v)
    getgenv().worker10 = v
    if v then
        buyWorker10()
    end
end)
WSection:Toggle("Auto Buy Workers (100)", false, "", function(v)
    getgenv().worker100 = v
    if v then
        buyWorker100()
    end
end)

--// Prestige Tab
local RTab = Window:Tab("Prestige")
local RSection = RTab:Section("Auto Prestige")
RSection:Dropdown("Select Amount", rebList,"","", function(v)
    selectedRebirth = v
 end)
RSection:Toggle("Auto Prestige", false, "", function(v)
    getgenv().autoreb = v
    if v then
        autoRebirth(selectedRebirth)
    end
end)

--// Reincarnation Tab
local RRTab = Window:Tab("Reincarnation")
local RRSection = RRTab:Section("Auto Reincarnation")
RRSection:Dropdown("Select Amount", reinList,"","", function(v)
    selectedReincarnation = v
 end)
RRSection:Toggle("Auto Reincarnation", false, "", function(v)
    getgenv().autoreincarnation = v
    if v then
        autoRein(selectedReincarnation)
    end
end)

--// Egg Tab
local ETab = Window:Tab("Egg")
local ESection = ETab:Section("You should be near the egg")
ESection:Dropdown("Select Egg", eggsList,"","", function(v)
    selectedEgg = v
 end)
ESection:Toggle("Auto Hatch (1x)", false, "", function(v)
    getgenv().autoegg = v
    if v then
        buyEgg(selectedEgg, "Single")
    end
end)
ESection:Toggle("Auto Hatch (3x)", false, "", function(v)
    getgenv().autoegg = v
    if v then
        buyEgg(selectedEgg, "Triple")
    end
end)

--// Locations Tab
local LTab = Window:Tab("Locations")
local LSection = LTab:Section("Locations")
LSection:Dropdown("Select Location", mapsList,"","", function(v)
    selectedWorld = v
end)
LSection:Button("Teleport to selected", function()
    if selectedWorld then
        teleportWorld(selectedWorld)
    end
end)

--// LocalPlayer Tab
local LPTab = Window:Tab("LocalPlayer")
local LPSection = LPTab:Section("LocalPlayer")
LPSection:Slider("WalkSpeed", 16,250,16,1,"", function(vv)
    game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = vv
end)
LPSection:Slider("JumpPower", 50,500,50,1,"", function(vv)
    game.Players.LocalPlayer.Character.Humanoid.JumpPower = vv
end)

--// Credits Tab
local CTab = Window:Tab("Credits")
local CSection = CTab:Section("Credits")
CSection:Button("Made by: baksff#9674 | (press to copy)", function()
    setclipboard("baksff#9674")
end)
CSection:Button("UI Library: Solaris Lib | (press to copy)", function()
    setclipboard("https://v3rmillion.net/showthread.php?tid=1142474")
end)

--// Settings Tab
local STab = Window:Tab("Settings")
local SSection = STab:Section("Settings")
SSection:Button("Destroy GUI", function()
    game:GetService("CoreGui"):FindFirstChild("dosage's solaris gui"):Destroy()
end)
