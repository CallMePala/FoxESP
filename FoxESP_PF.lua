local TEXT_SIZE = UDim2.new(1, 0, 1, 0)
local GUI_SIZE = UDim2.new(5, 0, 3, 0)
local STUDS_OFFSET = Vector3.new(0, 3, 0)
local FONT = "SourceSansItalic"

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
			game.Lighting.Ambient = Color3.fromRGB(200, 200, 200)
			game.Lighting.MapLighting.Ambient.Value = Color3.fromRGB(180, 180, 180)
			game.Lighting.MapLighting.OutdoorAmbient.Value = Color3.fromRGB(180, 180, 180)
			game.Lighting.MapLighting.ShaderObjects.Atmosphere:Destroy()
		end
	)

	-- Bright Blue ESP
	local TEAM = tostring(game:GetService("Players").LocalPlayer.Team)
	if TEAM == "Ghosts" then
		local FOLDER = game.Workspace.Players:FindFirstChild("Bright blue")

		for _, PARENT in pairs(FOLDER:GetChildren()) do
			if not HasESP(PARENT) then
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
				TEXT.TextColor3 = Color3.fromRGB(255, 0, 0)
				TEXT.Text = "ENEMY"
				TEXT.Font = "Highway"
			end
		end

	-- Bright Orange ESP
	elseif TEAM == "Phantoms" then
		local FOLDER = game.Workspace.Players:FindFirstChild("Bright orange")

		for _, PARENT in pairs(FOLDER:GetChildren()) do
			if not HasESP(PARENT) then
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
				TEXT.TextColor3 = Color3.fromRGB(255, 0, 0)
				TEXT.Text = "ENEMY"
				TEXT.Font = "Highway"
			end
		end
	end

	-- Gun ESP
	local FOLDER = game.Workspace.Ignore.GunDrop

	pcall(
			function()
				for _, PARENT in pairs(FOLDER:GetChildren()) do
					if not HasESP(PARENT) and PARENT.Name == "Dropped" then
						local GUI = Instance.new("BillboardGui")
						local TEXT = Instance.new("TextLabel")

						GUI.Parent = PARENT
						GUI.AlwaysOnTop = true
						GUI.Size = GUI_SIZE

						TEXT.Parent = GUI
						TEXT.Size = UDim2.new(1, 0, 1, 0)
						TEXT.BackgroundTransparency = 1
						TEXT.TextScaled = true
						TEXT.TextColor3 = Color3.fromRGB(255, 255, 0)
						TEXT.Text = PARENT.Gun.Value
						TEXT.Font = FONT
					end
				end
			end
		)

	-- Remove Dead/ESP
	local FOLDER = game.Workspace.Ignore.DeadBody

	for _, PARENT in pairs(FOLDER:GetChildren()) do
		PARENT:Destroy()
	end

	wait(1)
end
