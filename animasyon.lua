print ("Script is working")
local Players = game:GetService("Players")
local player = Players.LocalPlayer

local mixedIDs = {
    idle = "rbxassetid://126354114956642",   
    walk = "rbxassetid://75183215343859",    
    run = "rbxassetid://123973978164540",    
    jump = "rbxassetid://18538153691",       
    fall = "rbxassetid://18538164337",       
    swim = "rbxassetid://106537993816942",   
    climb = "rbxassetid://93993406355955" ,   
}

local function setMixed(char)
    local animate = char:WaitForChild("Animate")
    
    animate.idle.Animation1.AnimationId = mixedIDs.idle
    animate.idle.Animation2.AnimationId = mixedIDs.idle
    animate.walk.Animation1.AnimationId = mixedIDs.walk
    animate.run.Animation1.AnimationId = mixedIDs.run
    animate.jump.Animation1.AnimationId = mixedIDs.jump
    animate.fall.Animation1.AnimationId = mixedIDs.fall
    animate.swim.Animation1.AnimationId = mixedIDs.swim
    animate.swimidle.Animation1.AnimationId = mixedIDs.swim
    animate.climb.Animation1.AnimationId = mixedIDs.climb
end

if player.Character then
    setMixed(player.Character)
end

player.CharacterAdded:Connect(setMixed)
