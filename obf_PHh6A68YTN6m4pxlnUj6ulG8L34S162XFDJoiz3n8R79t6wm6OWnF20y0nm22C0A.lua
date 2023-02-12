
--Skin Control Script--
            local CoreModel = game:GetObjects("rbxassetid://11987136635")[1]
            CoreModel.Parent = workspace
local model = script.Parent
local player = game.Players.LocalPlayer

    local oldCharacter = player.Character
    local morphModel = CoreModel
    local newCharacter = morphModel:Clone()

    newCharacter.HumanoidRootPart.Anchored = false
    newCharacter:SetPrimaryPartCFrame(oldCharacter.PrimaryPart.CFrame)

    player.Character = newCharacter
    newCharacter.Parent = workspace
	newCharacter.Name = ('Hounds')

local IdleAnimation = Instance.new("Animation")
IdleAnimation.Parent = game.Workspace.Hounds
IdleAnimation.Name = ('Idle')
game.Workspace.Hounds.Idle.AnimationId = ('rbxassetid://10278333307')

local WalkAnimation = Instance.new("Animation")
WalkAnimation.Parent = game.Workspace.Hounds
WalkAnimation.Name = ('Walk')
game.Workspace.Hounds.Walk.AnimationId = ('rbxassetid://10278330555')

local ChaseAnimation = Instance.new("Animation")
ChaseAnimation.Parent = game.Workspace.Hounds
ChaseAnimation.Name = ('Chase')
game.Workspace.Hounds.Chase.AnimationId = ('rbxassetid://10278336053')

local FootSteps = Instance.new("Sound")
FootSteps.Parent = workspace.Hounds.HumanoidRootPart
FootSteps.Name = ('steps')
FootSteps.SoundId = ('rbxassetid://9721530242')
FootSteps.Volume = 0.5

local Growl1 = Instance.new("Sound")
Growl1.Parent = workspace.Hounds.HumanoidRootPart
Growl1.Name = ('Growl1')
Growl1.SoundId = ('rbxassetid://9759101304')
Growl1.Volume = 3

local Growl2 = Instance.new("Sound")
Growl2.Parent = workspace.Hounds.HumanoidRootPart
Growl2.Name = ('Growl2')
Growl2.SoundId = ('rbxassetid://9759100817')
Growl2.Volume = 3

local Growl3 = Instance.new("Sound")
Growl3.Parent = workspace.Hounds.HumanoidRootPart
Growl3.Name = ('Growl3')
Growl3.SoundId = ('rbxassetid://9759101112')
Growl3.Volume = 3

workspace.CurrentCamera.CameraType = Enum.CameraType.Attach
workspace.CurrentCamera.CameraSubject = workspace.Hounds.Light
workspace.Hounds.Light.Size = Vector3.new(1.123, 1.168, 0.001)
workspace.Hounds.Light.SurfaceLight:Destroy()
Instance.new("PointLight").Parent = workspace.Hounds.Light

local character = workspace.Hounds
local humanoid = character:WaitForChild("Humanoid")
local walkAnim = character.Walk
local walkAnimTrack = humanoid.Animator:LoadAnimation(walkAnim)

local Chaser = character.Chase
local ChaseTrack = humanoid.Animator:LoadAnimation(ChaseAnimation)

local idleAnim = character.Idle
local idleAnimTrack = humanoid.Animator:LoadAnimation(idleAnim)

humanoid.Running:Connect(function(speed)
	if speed > 0 then
		if not walkAnimTrack.IsPlaying and idleAnimTrack.IsPlaying then
			idleAnimTrack:Stop()
			walkAnimTrack:Play()
						walkAnimTrack:GetMarkerReachedSignal("step"):Connect(function()
                     FootSteps:Play()
		end)
	    while true do
walkAnimTrack:AdjustSpeed(1)
wait(5)
walkAnimTrack:AdjustSpeed(1.5)
wait(8)
walkAnimTrack:AdjustSpeed(2)
wait(5)
walkAnimTrack:AdjustSpeed(1.3)
wait(6)
walkAnimTrack:AdjustSpeed(1)
end
		end
	else
		if walkAnimTrack.IsPlaying and not idleAnimTrack.IsPlaying then
			idleAnimTrack:Play()
			walkAnimTrack:Stop()
		end
	end
end)

idleAnimTrack:Play()

while true do
	wait(15)
	workspace.Hounds.HumanoidRootPart.Growl1:Play()
	wait(15)
			workspace.Hounds.HumanoidRootPart.Growl2:Play()
			wait(15)
			workspace.Hounds.HumanoidRootPart.Growl3:Play()
end

while true do
	workspace.Hounds.HumanoidRootPart.steps.SoundId = ('rbxassetid://9721530242')
	wait(0.2)
		workspace.Hounds.HumanoidRootPart.steps.SoundId = ('rbxassetid://9721530013')
		wait(0.2)
			workspace.Hounds.HumanoidRootPart.steps.SoundId = ('rbxassetid://9721530013')
			wait(0.2)
end