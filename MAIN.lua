local OrionLib = loadstring(game:HttpGet(('https://raw.githubusercontent.com/shlexware/Orion/main/source')))()
local Window = OrionLib:MakeWindow({Name = "Tower Of Easy", HidePremium = true, IntroText = "Towers Suck Honestly", SaveConfig = false, ConfigFolder = "TOE"})
local Home = Window:MakeTab({
	Name = "Main",
	Icon = "rbxassetid://4483345998",
	PremiumOnly = false
})
local HomeSection = Home:AddSection({
	Name = "Main"
})
local Player = Window:MakeTab({
	Name = "Player",
	Icon = "rbxassetid://4483345998",
	PremiumOnly = false
})
local PlayerSection = Player:AddSection({
	Name = "Player"
})
local Extra = Window:MakeTab({
	Name = "Extra",
	Icon = "rbxassetid://4483345998",
	PremiumOnly = false
})
local ExtraSection = Extra:AddSection({
	Name = "Extra"
})
repeat wait() until game:IsLoaded() and game.Workspace:FindFirstChild("tower") ~= nil
wait()
function cmdnum(str)
	return tonumber(str) ~= nil
end
wait()
local cmdp = game:GetService("Players")
local cmdlp = cmdp.LocalPlayer
local player = cmdlp

function findplr(args, tbl)
	if tbl == nil then
		local tbl = cmdp:GetPlayers()
		if args == "me" then
			return cmdlp
		elseif args == "random" then 
			return tbl[math.random(1,#tbl)]
		elseif args == "new" then
			local vAges = {} 
			for _,v in pairs(tbl) do
				if v.AccountAge < 30 and v ~= cmdlp then
					vAges[#vAges+1] = v
				end
			end
			return vAges[math.random(1,#vAges)]
		elseif args == "old" then
			local vAges = {} 
			for _,v in pairs(tbl) do
				if v.AccountAge > 30 and v ~= cmdlp then
					vAges[#vAges+1] = v
				end
			end
			return vAges[math.random(1,#vAges)]
		elseif args == "bacon" then
			local vAges = {} 
			for _,v in pairs(tbl) do
				if v.Character:FindFirstChild("Pal Hair") or v.Character:FindFirstChild("Kate Hair") and v ~= cmdlp then
					vAges[#vAges+1] = v
				end
			end
			return vAges[math.random(1,#vAges)]
		elseif args == "friend" then
			local vAges = {} 
			for _,v in pairs(tbl) do
				if v:IsFriendsWith(cmdlp.UserId) and v ~= cmdlp then
					vAges[#vAges+1] = v
				end
			end
			return vAges[math.random(1,#vAges)]
		elseif args == "notfriend" then
			local vAges = {} 
			for _,v in pairs(tbl) do
				if not v:IsFriendsWith(cmdlp.UserId) and v ~= cmdlp then
					vAges[#vAges+1] = v
				end
			end
			return vAges[math.random(1,#vAges)]
		elseif args == "ally" then
			local vAges = {} 
			for _,v in pairs(tbl) do
				if v.Team == cmdlp.Team and v ~= cmdlp then
					vAges[#vAges+1] = v
				end
			end
			return vAges[math.random(1,#vAges)]
		elseif args == "enemy" then
			local vAges = {} 
			for _,v in pairs(tbl) do
				if v.Team ~= cmdlp.Team then
					vAges[#vAges+1] = v
				end
			end
			return vAges[math.random(1,#vAges)]
		elseif args == "near" then
			local vAges = {} 
			for _,v in pairs(tbl) do
				if v ~= cmdlp then
					local math = (v.Character:FindFirstChild("HumanoidRootPart").Position - cmdlp.Character.HumanoidRootPart.Position).magnitude
					if math < 30 then
						vAges[#vAges+1] = v
					end
				end
			end
			return vAges[math.random(1,#vAges)]
		elseif args == "far" then
			local vAges = {} 
			for _,v in pairs(tbl) do
				if v ~= cmdlp then
					local math = (v.Character:FindFirstChild("HumanoidRootPart").Position - cmdlp.Character.HumanoidRootPart.Position).magnitude
					if math > 30 then
						vAges[#vAges+1] = v
					end
				end
			end
			return vAges[math.random(1,#vAges)]
		else 
			for _,v in pairs(tbl) do
				if v.Name:lower():find(args:lower()) or v.DisplayName:lower():find(args:lower()) then
					return v
				end
			end
		end
	else
		for _, plr in pairs(tbl) do
			if plr.UserName:lower():find(args:lower()) or plr.DisplayName:lower():find(args:lower()) then
				return plr
			end
		end
	end
end
wait()
_G.noclip = false
 
 local Loop  game:GetService('RunService').Stepped:connect(function()
            if _G.noclip then
                for i, v in pairs(game.Players.LocalPlayer.Character:GetChildren()) do
                    if v:IsA("BasePart") then
                        if v.CanCollide ~= not _G.noclip then
                            v.CanCollide = not _G.noclip
                        end
                    end
                end
            end
        end)
wait()
Home:AddButton({
Name = "Godmode",
Callback = function()
require(game:GetService("ReplicatedStorage").Mutators.invincibility).mutate()
end})

Home:AddButton({
Name = "Teleport To Top",
Callback = function()
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(game:GetService("Workspace").tower.sections.finish.FinishGlow.Position)
end})

Home:AddButton({
Name = "No Teleport Win",
Callback = function()
repeat wait() until game:IsLoaded() and game.Workspace:FindFirstChild("tower")
for _,v in pairs(game:GetService("Workspace").tower.sections.finish.FinishGlow:GetDescendants()) do
if v:IsA("TouchTransmitter") then
firetouchinterest(game.Players.LocalPlayer.Character.HumanoidRootPart, v.Parent, 0)
wait()
firetouchinterest(game.Players.LocalPlayer.Character.HumanoidRootPart, v.Parent, 1)
end
end
end})

Home:AddButton({
Name = "Cheap Tool (Costs 40)",
Callback = function()
local args = {
    [1] = "trowel"
}

game:GetService("ReplicatedStorage"):WaitForChild("buyItem"):InvokeServer(unpack(args))
end})

Home:AddButton({
Name = "Inf Yield",
Callback = function()
loadstring(game:HttpGet('https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source'))()
end})

Extra:AddTextbox({
Name = "(NEEDS TOOL) Bring:",
Default = "Username or Display-Name",
TextDisappear = true,
Callback = function(user)
repeat wait() until game:IsLoaded() and game.Players.LocalPlayer.Character:FindFirstChild("Humanoid") and game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
wait()
	local target = findplr(user)
	cmdlp.Character.Humanoid.Name = 1
	local l = cmdlp.Character["1"]:Clone()
	l.Parent = cmdlp.Character
	l.Name = "Humanoid"
	wait(.2)
	cmdlp.Character["1"]:Destroy()
	workspace.CurrentCamera.CameraSubject = cmdlp.Character
	cmdlp.Character.Humanoid.DisplayDistanceType = "None"
	cmdlp.Character.Humanoid:UnequipTools()
	local v = cmdlp.Backpack:FindFirstChildOfClass("Tool")
	v.Parent = cmdlp.Character
	v.Parent = cmdlp.Character.HumanoidRootPart
	firetouchinterest(target.Character.HumanoidRootPart, v.Handle, 0)
	firetouchinterest(target.Character.HumanoidRootPart, v.Handle, 1)
	pcall(function() cmdlp.Character.HumanoidRootPart.CFrame = NormPos end)
	wait(.3)
	cmdlp.Character:Remove()
	cmdlp.CharacterAdded:Wait()
end})

Player:AddSlider({
	Name = "WalkSpeed",
	Min = 16,
	Max = 250,
	Default = 5,
	Color = Color3.fromRGB(255,255,255),
	Increment = 1,
	ValueName = "",
	Callback = function(ws)
repeat wait() until game.Players.LocalPlayer.Character:FindFirstChild("Humanoid")
	game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = ws
end})

Player:AddSlider({
	Name = "JumpPower",
	Min = 50,
	Max = 350,
	Default = 5,
	Color = Color3.fromRGB(255,255,255),
	Increment = 1,
	ValueName = "",
	Callback = function(jp)
repeat wait() until game.Players.LocalPlayer.Character:FindFirstChild("Humanoid")
	game.Players.LocalPlayer.Character.Humanoid.JumpPower = jp
end})

Player:AddSlider({
	Name = "Gravity",
	Min = 1,
	Max = 196.2,
	Default = 196.2,
	Color = Color3.fromRGB(255,255,255),
	Increment = 1,
	ValueName = "",
	Callback = function(gr)
repeat wait() until game:IsLoaded()
	game.Workspace.Gravity = gr
end})

Player:AddButton({
Name = "Set To Normal Gravity",
Callback = function()
repeat wait() until game:IsLoaded()
game.Workspace.Gravity = 196.2
end})

Home:AddToggle({
Name = "Auto Farm",
Default = false,
Callback = function(onb)
if onb then
repeat wait() until game:IsLoaded() and game:GetService("Workspace"):FindFirstChild("tower"):FindFirstChild("sections"):FindFirstChild("finish")
if game:GetService("Workspace"):FindFirstChild("tower"):FindFirstChild("sections"):FindFirstChild("finish") ~= nil then
_G.work = true
while _G.work == true do
wait()
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(game:GetService("Workspace").tower.sections.finish.FinishGlow.Position)
end
end
else
_G.work = false
end
end})

Player:AddTextbox({
Name = "Spin (number)",
Default = "Enter A Number",
TextDisappear = true,
Callback = function(numb)
	local spinSpeed = numb
	for i,v in pairs(game.Players.LocalPlayer.Character.HumanoidRootPart:GetChildren()) do
		if v.Name == "Spinning" then
			v:Destroy()
		end
	end
	local Spin = Instance.new("BodyAngularVelocity")
	Spin.Name = "Spinning"
	Spin.Parent = game.Players.LocalPlayer.Character.HumanoidRootPart
	Spin.MaxTorque = Vector3.new(0, math.huge, 0)
	Spin.AngularVelocity = Vector3.new(0,numb,0)
end})

Player:AddButton({
Name = "Stop Spinning",
Callback = function()
	for i,v in pairs(game.Players.LocalPlayer.Character.HumanoidRootPart:GetChildren()) do
		if v.Name == "Spinning" then
			v:Destroy()
		end
	end
end})

Player:AddButton({
Name = "FE Backflips",
Callback = function()
loadstring(game:HttpGet('https://raw.githubusercontent.com/dudeididntliterally/feback/main/backflips.lua'))()
end})

Extra:AddButton({
Name = "Rejoin",
Callback = function()
local TeleportService = game:GetService("TeleportService")
TeleportService:Teleport(game.PlaceId, game.Players.LocalPlayer)
wait()
TeleportService:TeleportToPlaceInstance(game.PlaceId, game.JobId, game.Players.LocalPlayer)
end})

Player:AddToggle({
Name = "Noclip",
Default = false,
Callback = function(noc)
if noc then
_G.noclip = true
else
_G.noclip = false
end
end})
