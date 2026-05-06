-- ROBLOX ADIDAS COMMUNITY ANIMATION PACK
-- StarterPlayer > StarterCharacterScripts içine koy

local humanoid = script.Parent:WaitForChild("Humanoid")
local rootPart = script.Parent:WaitForChild("HumanoidRootPart")

-- Animasyon nesneleri oluştur
local animations = {
    idle = Instance.new("Animation"),
    walk = Instance.new("Animation"),
    run = Instance.new("Animation"),
    jump = Instance.new("Animation"),
    fall = Instance.new("Animation"),
}

-- Geçerli Roblox animasyon ID'leri
animations.idle.AnimationId = "rbxassetid://507766666"
animations.walk.AnimationId = "rbxassetid://507777855"
animations.run.AnimationId = "rbxassetid://507777725"
animations.jump.AnimationId = "rbxassetid://507765000"
animations.fall.AnimationId = "rbxassetid://507767968"

-- Hata kontrolü ile animasyonları yükle
local loadedAnimations = {}
for name, anim in pairs(animations) do
    if anim.AnimationId ~= "" then
        pcall(function()
            loadedAnimations[name] = humanoid:LoadAnimation(anim)
        end)
    end
end

local currentAnimation = nil

-- Animasyon oynat fonksiyonu
local function playAnimation(animName)
    if not loadedAnimations[animName] then return end
    
    if currentAnimation and currentAnimation ~= loadedAnimations[animName] then
        pcall(function()
            currentAnimation:Stop()
        end)
    end
    
    currentAnimation = loadedAnimations[animName]
    pcall(function()
        currentAnimation:Play()
    end)
end

-- Durum değişimini takip et
humanoid.StateChanged:Connect(function(oldState, newState)
    if newState == Enum.HumanoidStateType.Idle then
        playAnimation("idle")
    elseif newState == Enum.HumanoidStateType.Running then
        playAnimation("run")
    elseif newState == Enum.HumanoidStateType.Jumping then
        playAnimation("jump")
    elseif newState == Enum.HumanoidStateType.Falling then
        playAnimation("fall")
    end
end)

print("✓ Adidas Community Animasyonları Yüklendi!")
