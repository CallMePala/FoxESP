local TEXT_SIZE = UDim2.new(1, 0, 1, 0)
local GUI_SIZE = UDim2.new(5, 0, 3, 0)
local YOU = tostring(game:GetService("Players").LocalPlayer.Name)
local FONT = "SourceSansItalic"

while true do
    -- Functions
    local function HasESP(ELEMENT, PLAYER)
        if PLAYER then
            local TEMP = ELEMENT:FindFirstChild("Head")
            if TEMP == nil then
                return true
            else
                local TEMP = TEMP:FindFirstChild("BillboardGui")
                if TEMP == nil then
                    return false
                else
                    return true
                end
            end
        else
            local TEMP = ELEMENT:FindFirstChild("BillboardGui")
            if TEMP == nil then
                return false
            else
                return true
            end
        end
    end

    local function IsTeam(ELEMENT)
        local TEMP = ELEMENT:FindFirstChildOfClass("BillboardGui")
        if TEMP == nil or TEMP.Name ~= "AllyOverhead" then
            return false
        else
            return true
        end
    end

    -- Refresh Variables
    local PLAYERS = game:GetService("Players"):GetPlayers()

	-- Player ESP
	local FOLDER = game.Workspace
	for _, PARENT in pairs(FOLDER:GetChildren()) do
        for _, PLAYER in pairs(PLAYERS) do
            if not IsTeam(PARENT) and not HasESP(PARENT, true) and PARENT.Name ~= YOU and PLAYER.Name ~= YOU and PARENT.Name == PLAYER.Name then
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
                TEXT.TextColor3 = Color3.fromRGB(255, 0, 0)
                TEXT.Text = "ENEMY"
                TEXT.Font = "Highway"
                
                pcall(
                    function()
                        PARENT:FindFirstChild("Shading").DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
                    end
                )
            end
        end
    end

    -- Duck ESP
    pcall(
        function()
            local FOLDER = game.Workspace.CompetitiveMap.Ducks
            for _, PARENT in pairs(FOLDER:GetChildren()) do
                if not HasESP(PARENT.Target.Duck, false) then
                    local GUI = Instance.new("BillboardGui")
                    local TEXT = Instance.new("TextLabel")

                    GUI.Parent = PARENT.Target.Duck
                    GUI.AlwaysOnTop = true
                    GUI.Size = GUI_SIZE

                    TEXT.Parent = GUI
                    TEXT.Size = TEXT_SIZE
                    TEXT.BackgroundTransparency = 1
                    TEXT.TextScaled = true
                    TEXT.TextColor3 = Color3.fromRGB(255, 255, 0)
                    TEXT.Text = "duck"
                    TEXT.Font = FONT
                end
            end
        end
    )

    wait(1)
end
