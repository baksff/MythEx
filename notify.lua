local myth = {}

function myth:SendNotify(title2, timee, text)
    local NotificationUI = Instance.new("ScreenGui")
    local Frame = Instance.new("Frame")
    local UICorner = Instance.new("UICorner")
    local title = Instance.new("TextLabel")
    local desc = Instance.new("TextLabel")

    NotificationUI.Name = "NotificationUI"
    NotificationUI.Parent = game:GetService("CoreGui")
    NotificationUI.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

    Frame.Parent = NotificationUI
    Frame.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
    Frame.Position = UDim2.new(1, 1, 0.868, 0)
    Frame.Size = UDim2.new(0, 260, 0, 100)

    UICorner.Parent = Frame

    title.Name = "title"
    title.Parent = Frame
    title.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    title.BackgroundTransparency = 1.000
    title.Size = UDim2.new(0, 260, 0, 35)
    title.Font = Enum.Font.SourceSansBold
    title.Text = title2
    title.TextColor3 = Color3.fromRGB(255, 255, 255)
    title.TextSize = 30.000

    desc.Name = "desc"
    desc.Parent = Frame
    desc.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    desc.BackgroundTransparency = 1.000
    desc.Position = UDim2.new(0, 0, 0.343636155, 0)
    desc.Size = UDim2.new(0, 260, 0, 65)
    desc.Font = Enum.Font.SourceSansBold
    desc.Text = text
    desc.TextColor3 = Color3.fromRGB(255, 255, 255)
    desc.TextSize = 20.000
    desc.TextWrapped = true

    wait(1)
    Frame:TweenPosition(UDim2.new(0.834, 0, 0.868, 0))
    wait(timee)
    Frame:TweenPosition(UDim2.new(0.834, 0, 1, 1))
    wait(5)
    NotificationUI:Destroy()
end
return myth
