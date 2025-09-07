-- No CreateToggle wrapper, just the script logic
local pid = game.PlaceId
if pid ~= 189707 then
    local gameName = game:GetService("MarketplaceService"):GetProductInfo(pid).Name
    Rayfield:Notify({
        Title = "Error ❌ -Huthub",
        Content = "This game is \"" .. gameName .. "\" dude...",
        Duration = 6.5,
        Image = 4483362458,
    })
    return
end

local rs = game:GetService("RunService")
local hb = rs.Heartbeat
local rsd = rs.RenderStepped
local lp = game.Players.LocalPlayer
local z = Vector3.zero

local function f(c)
    local r = c:WaitForChild("HumanoidRootPart")
    if r then
        local con
        con = hb:Connect(function()
            if not r.Parent then
                con:Disconnect()
            end
            local v = r.AssemblyLinearVelocity
            r.AssemblyLinearVelocity = z
            rsd:Wait()
            r.AssemblyLinearVelocity = v
        end)
    end
end

f(lp.Character)
lp.CharacterAdded:Connect(f)
