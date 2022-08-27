local TEXT_SIZE = UDim2.new(1, 0, 1, 0)
local GUI_SIZE = UDim2.new(5, 0, 3, 0)
local STUDS_OFFSET = Vector3.new(0, 3, 0)
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

    -- Fullbright
    pcall(
        function()
            game.Lighting.Ambient = Color3.fromRGB(180, 180, 180)
            game.Lighting.GlobalShadows = false
            game.Lighting.Atmosphere:Destroy()
        end
    )

	-- Entity ESP
	local FOLDER = game.Workspace.Game.Players
	for _, PARENT in pairs(FOLDER:GetChildren()) do
        local TEMP = PARENT:FindFirstChild("Force")
        if not HasESP(PARENT) and PARENT.Name ~= YOU and TEMP ~= nil then
            local GUI = Instance.new("BillboardGui")
            local TEXT = Instance.new("TextLabel")

            GUI.Parent = PARENT
            GUI.AlwaysOnTop = true
            GUI.Size = GUI_SIZE
            GUI.StudsOffset = STUDS_OFFSET

            TEXT.Parent = GUI
            TEXT.Size = TEXT_SIZE
            TEXT.BackgroundTransparency = 1
            TEXT.TextScaled = true
            TEXT.TextColor3 = Color3.fromRGB(0, 255, 0)
            TEXT.Text = PARENT.Name
            TEXT.Font = FONT
        elseif not HasESP(PARENT) and PARENT.Name ~= YOU then
            local GUI = Instance.new("BillboardGui")
            local TEXT = Instance.new("TextLabel")

            GUI.Parent = PARENT
            GUI.AlwaysOnTop = true
            GUI.Size = GUI_SIZE
            GUI.StudsOffset = Vector3.new(0, 2, 0)

            TEXT.Parent = GUI
            TEXT.Size = TEXT_SIZE
            TEXT.BackgroundTransparency = 1
            TEXT.TextScaled = true
            TEXT.TextColor3 = Color3.fromRGB(255, 0, 0)
            TEXT.Text = "NEXTBOT"
            TEXT.Font = "Highway"
        end
	end
    
	wait(1)
end
