-- TargetUI ModuleScript

local TargetUI = {}

-- Define UI elements
local TargetFrame = Instance.new("Frame")
TargetFrame.Size = UDim2.new(0, 200, 0, 100)
TargetFrame.Position = UDim2.new(0, 10, 0, 10)
TargetFrame.BackgroundColor3 = Color3.fromRGB(20, 20, 20) -- Dark dark grey
TargetFrame.BorderSizePixel = 1.5 -- Border pixel size 1.5
TargetFrame.BorderColor3 = Color3.fromRGB(50, 50, 50) -- Less darker grey for border
TargetFrame.Visible = false -- Initially hidden

local TargetNameLabel = Instance.new("TextLabel")
TargetNameLabel.Size = UDim2.new(1, 0, 0.2, 0)
TargetNameLabel.Position = UDim2.new(0, 0, 0, 0)
TargetNameLabel.BackgroundTransparency = 1
TargetNameLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
TargetNameLabel.TextStrokeTransparency = 0.5
TargetNameLabel.Font = Enum.Font.SourceSansBold
TargetNameLabel.TextSize = 18
TargetNameLabel.TextXAlignment = Enum.TextXAlignment.Left

local TargetHealthLabel = Instance.new("TextLabel")
TargetHealthLabel.Size = UDim2.new(1, 0, 0.4, 0)
TargetHealthLabel.Position = UDim2.new(0, 0, 0.2, 0)
TargetHealthLabel.BackgroundTransparency = 1
TargetHealthLabel.TextColor3 = Color3.fromRGB(255, 0, 0)
TargetHealthLabel.TextStrokeTransparency = 0.5
TargetHealthLabel.Font = Enum.Font.SourceSans
TargetHealthLabel.TextSize = 16
TargetHealthLabel.TextXAlignment = Enum.TextXAlignment.Left

local TargetArmorLabel = Instance.new("TextLabel")
TargetArmorLabel.Size = UDim2.new(1, 0, 0.4, 0)
TargetArmorLabel.Position = UDim2.new(0, 0, 0.6, 0)
TargetArmorLabel.BackgroundTransparency = 1
TargetArmorLabel.TextColor3 = Color3.fromRGB(0, 255, 255)
TargetArmorLabel.TextStrokeTransparency = 0.5
TargetArmorLabel.Font = Enum.Font.SourceSans
TargetArmorLabel.TextSize = 16
TargetArmorLabel.TextXAlignment = Enum.TextXAlignment.Left

-- Function to update UI visibility based on the toggle state
function TargetUI.UpdateVisibility(enabled)
    if enabled then
        TargetFrame.Visible = true
    else
        TargetFrame.Visible = false
    end
end

-- Function to update UI with target information
function TargetUI.UpdateTarget(target)
    if target then
        TargetNameLabel.Text = "Name: " .. target.Name
        TargetHealthLabel.Text = "Health: " .. tostring(target.Health)
        if target:FindFirstChild("BodyEffects") and target.BodyEffects:FindFirstChild("Armor") then
            TargetArmorLabel.Text = "Armor: " .. tostring(target.BodyEffects.Armor.Value)
        else
            TargetArmorLabel.Text = "Armor: N/A"
        end
    else
        TargetNameLabel.Text = "Name: N/A"
        TargetHealthLabel.Text = "Health: N/A"
        TargetArmorLabel.Text = "Armor: N/A"
    end
end

-- Attach labels to frame
TargetNameLabel.Parent = TargetFrame
TargetHealthLabel.Parent = TargetFrame
TargetArmorLabel.Parent = TargetFrame

return TargetUI
