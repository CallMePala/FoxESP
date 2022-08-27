local TEXT_SIZE = UDim2.new(1, 0, 1, 0)
local GUI_SIZE = UDim2.new(5, 0, 3, 0)
local STUDS_OFFSET = Vector3.new(0, 3, 0)
local FONT = "SourceSansItalic"
local YOU = tostring(game:GetService("Players").LocalPlayer.Name)

while true do
    -- Functions
    local function IsDestroyed(ELEMENT)
        if ELEMENT.Parent then
            return false
        end
        local _, RESULT =
            pcall(
            function()
                ELEMENT.Parent = ELEMENT
            end
        )
        return RESULT:match("locked") and true or false
    end

    local function HasESP(ELEMENT)
        local TEMP = ELEMENT:FindFirstChild("BillboardGui")
        if TEMP == nil then
            return false
        else
            return true
        end
    end

    local function ExitESP(ELEMENT, NAME)
        if not HasESP(ELEMENT) then
            local GUI = Instance.new("BillboardGui")
            local TEXT = Instance.new("TextLabel")
        
            GUI.Parent = ELEMENT
            GUI.AlwaysOnTop = true
            GUI.Size = GUI_SIZE
            GUI.StudsOffset = STUDS_OFFSET
        
            TEXT.Parent = GUI
            TEXT.Size = TEXT_SIZE
            TEXT.BackgroundTransparency = 1
            TEXT.TextScaled = true
            if NAME == 1 then
                TEXT.TextColor3 = Color3.fromRGB(0, 255, 255)
                TEXT.Text = "exit"
            elseif NAME == 2 then
                TEXT.TextColor3 = Color3.fromRGB(255, 0, 0)
                TEXT.Text = "wrong exit"
            end
            TEXT.Font = FONT
        
            ELEMENT.Changed:Connect(
                function()
                    if IsDestroyed(ELEMENT) == true then
                        GUI:Destroy()
                    end
                end
            )
        end
    end

    local function OtherESP(ELEMENT, NAME)
        if not HasESP(ELEMENT) then
            local GUI = Instance.new("BillboardGui")
            local TEXT = Instance.new("TextLabel")
        
            GUI.Parent = ELEMENT
            GUI.AlwaysOnTop = true
            GUI.Size = GUI_SIZE
            GUI.StudsOffset = STUDS_OFFSET
        
            TEXT.Parent = GUI
            TEXT.Size = TEXT_SIZE
            TEXT.BackgroundTransparency = 1
            TEXT.TextScaled = true
            if NAME == 1 then
                TEXT.TextColor3 = Color3.fromRGB(110, 0, 255)
                TEXT.Text = "lost soul"
            elseif NAME == 2 then
                TEXT.TextColor3 = Color3.fromRGB(110, 0, 255)
                TEXT.Text = "ben chair"
            end
            TEXT.Font = FONT
        
            ELEMENT.Changed:Connect(
                function()
                    if IsDestroyed(ELEMENT) == true then
                        GUI:Destroy()
                    end
                end
            )
        end
    end

    -- Fullbright
    pcall(
        function()
            game.Lighting.Ambient = Color3.fromRGB(180, 180, 180)
            game.Lighting.Atmosphere:Destroy()
        end
    )

	-- Player ESP
	local FOLDER = game.Workspace.Characters

	for _, PARENT in pairs(FOLDER:GetChildren()) do
		if not HasESP(PARENT) and PARENT.Name ~= "Studio" and PARENT.Name ~= YOU then
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
		end
	end

	-- Entity ESP
	local FOLDER = game.Workspace.Entities

	for _, PARENT in pairs(FOLDER:GetChildren()) do
		if not HasESP(PARENT) and PARENT.Name ~= "Studio" and PARENT.Name ~= YOU then
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
            TEXT.Text = string.lower(PARENT.Name)
            TEXT.Font = FONT
		end
	end

	-- Simulation Core ESP
	local FOLDER = game.Workspace.Ignored.Trophies

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
            TEXT.TextColor3 = Color3.fromRGB(255, 255, 255)
            TEXT.Text = "simulation core"
            TEXT.Font = FONT

            PARENT.Changed:Connect(
                function()
                    if IsDestroyed(PARENT) == true then
                        GUI:Destroy()
                    end
                end
            )
        end
	end

	-- Interact ESP
	local FOLDER = game.Workspace.Ignored.Interacts

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
            TEXT.TextColor3 = Color3.fromRGB(255, 255, 0)
            TEXT.Text = "interactable"
            TEXT.Font = FONT

            PARENT.Changed:Connect(
                function()
                    if IsDestroyed(PARENT) == true then
                        GUI:Destroy()
                    end
                end
            )
        end
	end

    -- Jumpscare ESP
    local FOLDER = game.Workspace.Ignored.ClientsCache.Model

	for _, PARENT in pairs(FOLDER:GetChildren()) do
        if PARENT == game.Workspace.Ignored.ClientsCache.Model.Root then
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
                TEXT.Text = "JUMPSCARE"
                TEXT.Font = "Highway"

                PARENT.Changed:Connect(
                    function()
                        if IsDestroyed(PARENT) == true then
                            GUI:Destroy()
                        end
                    end
                )
            end
        end
	end

	-- Exit ESP
	pcall(
        function()
            if game.Workspace.Buildings["0"] then
                ExitESP(game.Workspace.Buildings["0"].Exits.Part, 1)
                OtherESP(game.Workspace.Buildings["0"]:FindFirstChild("A person"), 1)
                OtherESP(game.Workspace.Buildings["0"]:FindFirstChild("Ben's Chair"), 2)
            end
	    end
    )

	pcall(
        function()
            if game.Workspace.Buildings["1"] then
                ExitESP(game.Workspace.Buildings.Rendered.Level2Entrance.Gate, 1)
            end
	    end
    )

	pcall(
        function()
            if game.Workspace.Buildings["2"] then
                ExitESP(game.Workspace.Buildings["2"].Exits.Part, 1)
            end
	    end
    )

	pcall(
        function()
            if game.Workspace.Buildings["3"] then
                ExitESP(game.Workspace.Buildings.Rendered.Level4Entrance.EntrancePart, 1)
                if game.Workspace.Buildings.Rendered.Level4Entrance.Part.Position == Vector3.new(580.134, 18.9816, -116.654) then
                    game.Workspace.Buildings.Rendered.Level4Entrance.Part.Name = "IgnoredExit"
                else
                    ExitESP(game.Workspace.Buildings.Rendered.Level4Entrance.Part, 1)
                end
            end
	    end
    )

	pcall(
        function()
            if game.Workspace.Buildings["4"] then
                ExitESP(game.Workspace.Buildings["4"].Exit.Part, 1)
            end
	    end
    )

	pcall(
        function()
            if game.Workspace.Buildings["5"] then
                ExitESP(game.Workspace.Buildings["5"].Exits.Part, 1)
            end
	    end
    )

	pcall(
        function()
            if game.Workspace.Buildings["6"] then
                ExitESP(game.Workspace.Buildings["6"].Exits.Part, 1)
            end
	    end
    )

	pcall(
        function()
            if game.Workspace.Buildings["7"] then
                ExitESP(game.Workspace.Buildings["7"].Exits.Part, 1)
            end
	    end
    )

	pcall(
            function()
            if game.Workspace.Buildings["8"] then
                ExitESP(game.Workspace.Buildings["8"].Exits.Part, 1)
            end
	    end
    )

	pcall(
        function()
            if game.Workspace.Buildings["9"] then
                ExitESP(game.Workspace.Buildings["9"].Exits.Part, 1)
            end
	    end
    )

	pcall(
        function()
            if game.Workspace.Buildings["10"] then
                local TEMP = game.Workspace.Buildings["10"].Exits.Part:FindFirstChild("match")
                if TEMP == nil then
                    ExitESP(game.Workspace.Buildings["10"].Exits.Part, 2)
                else
                    ExitESP(game.Workspace.Buildings["10"].Exits.Part, 1)
                end
            end
	    end
    )

	pcall(
        function()
            if game.Workspace.Buildings["11"] then
                ExitESP(game.Workspace.Buildings["11"].Exits.Part, 1)
            end
	    end
    )

	pcall(
        function()
            if game.Workspace.Buildings["12"] then
                ExitESP(game.Workspace.Buildings["12"].Exits.Exit, 1)
            end
	    end
    )

	wait(2)
end
