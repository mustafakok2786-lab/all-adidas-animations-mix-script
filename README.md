local Players = game:GetService("Players")
local player = Players.LocalPlayer

local mixedIDs = {
    idle = "rbxassetid://126354114956642",
    walk = "rbxassetid://75183215343859",
    run = "rbxassetid://123973978164540",
    jump = "rbxassetid://18538153691",
    fall = "rbxassetid://18538164337",
    swim = "rbxassetid://106537993816942",
    climb = "rbxassetid://123695349157584"
}

local function apply(char)
    local anim = char:WaitForChild("Animate")
    local hum = char:WaitForChild("Humanoid")
   
    local function update(name, id)
        local folder = anim:FindFirstChild(name)
        if folder then
            for _, obj in pairs(folder:GetChildren()) do
                if obj:IsA("Animation") then
                    obj.AnimationId = id
                end
            end
        end
    end

    update("idle", mixedIDs.idle)
    update("walk", mixedIDs.walk)
    update("run", mixedIDs.run)
    update("jump", mixedIDs.jump)
    update("fall", mixedIDs.fall)
    update("swim", mixedIDs.swim)
    update("climb", mixedIDs.climb)

    local animator = hum:FindFirstChildOfClass("Animator")
    if animator then
        for _, track in pairs(animator:GetPlayingAnimationTracks()) do
            track:Stop()
        end
    end
end

if player.Character then 
    apply(player.Character) 
end
player.CharacterAdded:Connect(apply)
