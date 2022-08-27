local TEXT_SIZE = UDim2.new(1, 0, 1, 0)
local GUI_SIZE = UDim2.new(5, 0, 3, 0)
local FONT = "SourceSansItalic"
local YOU = tostring(game:GetService("Players").LocalPlayer.Name)

while true do
    -- Functions
    local function HasESP(ELEMENT)
        local TEMP = ELEMENT:FindFirstChild("BillboardGui")
        if TEMP == nil then
            return false
        else
            return true
        end
    end

    -- Refresh Variables
    local PLAYERS = game:GetService("Players"):GetPlayers()

    -- Fullbright
    pcall(
        function()
            game.Lighting.Ambient = Color3.fromRGB(200, 200, 200)
        end
    )

	-- Item/Player/Vent Monster ESP
	local FOLDER = game.Workspace
	for _, PARENT in pairs(FOLDER:GetChildren()) do
        for _, PLAYER in pairs(PLAYERS) do
            if not HasESP(PARENT) and PARENT.Name ~= YOU and PLAYER.Name ~= YOU and PARENT.Name == PLAYER.Name then
                local GUI = Instance.new("BillboardGui")
                local TEXT = Instance.new("TextLabel")

                GUI.Parent = PARENT:FindFirstChild("Head")
                GUI.AlwaysOnTop = true
                GUI.Size = GUI_SIZE
                GUI.StudsOffset = Vector3.new(0, 2, 0)

                TEXT.Parent = GUI
                TEXT.Size = TEXT_SIZE
                TEXT.BackgroundTransparency = 1
                TEXT.TextScaled = true
                TEXT.TextColor3 = Color3.fromRGB(0, 255, 0)
                TEXT.Text = PARENT.Name
                TEXT.Font = FONT

                local GUI = Instance.new("BillboardGui")
                GUI.Parent = PARENT
            end
        end
        if not HasESP(PARENT) and string.find(PARENT.Name, "Block") then
            local GUI = Instance.new("BillboardGui")
            local TEXT = Instance.new("TextLabel")

            GUI.Parent = PARENT
            GUI.AlwaysOnTop = true
            GUI.Size = GUI_SIZE

            TEXT.Parent = GUI
            TEXT.Size = TEXT_SIZE
            TEXT.BackgroundTransparency = 1
            TEXT.TextScaled = true
            TEXT.TextColor3 = Color3.fromRGB(255, 255, 0)
            TEXT.Text = "block"
            TEXT.Font = FONT
        elseif not HasESP(PARENT) and string.find(PARENT.Name, "Food") then
            local GUI = Instance.new("BillboardGui")
            local TEXT = Instance.new("TextLabel")

            GUI.Parent = PARENT
            GUI.AlwaysOnTop = true
            GUI.Size = GUI_SIZE

            TEXT.Parent = GUI
            TEXT.Size = TEXT_SIZE
            TEXT.BackgroundTransparency = 1
            TEXT.TextScaled = true
            TEXT.TextColor3 = Color3.fromRGB(255, 255, 0)
            TEXT.Text = "food"
            TEXT.Font = FONT
        elseif not HasESP(PARENT) and string.find(PARENT.Name, "Fuse") then
            local GUI = Instance.new("BillboardGui")
            local TEXT = Instance.new("TextLabel")

            GUI.Parent = PARENT
            GUI.AlwaysOnTop = true
            GUI.Size = GUI_SIZE

            TEXT.Parent = GUI
            TEXT.Size = TEXT_SIZE
            TEXT.BackgroundTransparency = 1
            TEXT.TextScaled = true
            TEXT.TextColor3 = Color3.fromRGB(255, 255, 0)
            TEXT.Text = "fuse"
            TEXT.Font = FONT
        elseif not HasESP(PARENT) and string.find(PARENT.Name, "Battery") then
            local GUI = Instance.new("BillboardGui")
            local TEXT = Instance.new("TextLabel")

            GUI.Parent = PARENT
            GUI.AlwaysOnTop = true
            GUI.Size = GUI_SIZE

            TEXT.Parent = GUI
            TEXT.Size = TEXT_SIZE
            TEXT.BackgroundTransparency = 1
            TEXT.TextScaled = true
            TEXT.TextColor3 = Color3.fromRGB(255, 255, 0)
            TEXT.Text = "battery"
            TEXT.Font = FONT
        elseif not HasESP(PARENT) and string.find(PARENT.Name, "Ticket") then
            local GUI = Instance.new("BillboardGui")
            local TEXT = Instance.new("TextLabel")

            GUI.Parent = PARENT
            GUI.AlwaysOnTop = true
            GUI.Size = GUI_SIZE

            TEXT.Parent = GUI
            TEXT.Size = TEXT_SIZE
            TEXT.BackgroundTransparency = 1
            TEXT.TextScaled = true
            TEXT.TextColor3 = Color3.fromRGB(255, 255, 0)
            TEXT.Text = "ticket"
            TEXT.Font = FONT
        elseif not HasESP(PARENT) and PARENT.Name == "Purple_ArmIdle" then
            local GUI = Instance.new("BillboardGui")
            local TEXT = Instance.new("TextLabel")

            GUI.Parent = PARENT
            GUI.AlwaysOnTop = true
            GUI.Size = GUI_SIZE

            TEXT.Parent = GUI
            TEXT.Size = TEXT_SIZE
            TEXT.BackgroundTransparency = 1
            TEXT.TextScaled = true
            TEXT.TextColor3 = Color3.fromRGB(255, 0, 0)
            TEXT.Text = "PURPLE"
            TEXT.Font = "Highway"
        end
	end
    
    -- Monster ESP
    local FOLDER = game.Workspace.Monsters
    for _, PARENT in pairs(FOLDER:GetChildren()) do
        if not HasESP(PARENT) then
            local GUI = Instance.new("BillboardGui")
            local TEXT = Instance.new("TextLabel")

            GUI.Parent = PARENT
            GUI.AlwaysOnTop = true
            GUI.Size = GUI_SIZE

            TEXT.Parent = GUI
            TEXT.Size = TEXT_SIZE
            TEXT.BackgroundTransparency = 1
            TEXT.TextScaled = true
            TEXT.TextColor3 = Color3.fromRGB(255, 0, 0)
            TEXT.Text = string.upper(PARENT.Name)
            TEXT.Font = "Highway"
        end
    end

    -- Objective ESP
    local FOLDER = game.Workspace.GroupBuildStructures
    for _, PARENT in pairs(FOLDER:GetChildren()) do
        if not HasESP(PARENT) then
            local GUI = Instance.new("BillboardGui")
            local TEXT = Instance.new("TextLabel")

            GUI.Parent = PARENT
            GUI.AlwaysOnTop = true
            GUI.Size = GUI_SIZE

            TEXT.Parent = GUI
            TEXT.Size = TEXT_SIZE
            TEXT.BackgroundTransparency = 1
            TEXT.TextScaled = true
            TEXT.TextColor3 = Color3.fromRGB(0, 255, 255)
            TEXT.Text = "objective"
            TEXT.Font = FONT
        end
    end
    
	wait(2)
end
