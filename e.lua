
for i, v in ipairs(game.Workspace.Map.Ingame.Map:GetChildren()) do
  if v.Name == "Generator" then
    local left = true
    local right = true
    local center = true
    local available = 0
    for index, value in ipairs(game.Players:GetChildren()) do
    	if v.Character.HumanoidRootPart.CFrame == v.Positions.Left.CFrame then
    		available +=1
    		left = false
    	end
    	if v.Character.HumanoidRootPart.CFrame == v.Positions.Right.CFrame then
    		available +=1
    		right = false
    	end
    	if v.Character.HumanoidRootPart.CFrame == v.Positions.Center.CFrame then
    		available +=1
    		center = false
    	end
    end
    if available > 0 then
    	local positiontoUse
    	if left == true then
    		positiontoUse = "Left"
    	elseif right == true then
    		positiontoUse = "Right"
    	elseif center == true then
    		positiontoUse = "Center"
    	end
    	if positiontoUse then
        game.Players.LocalPlayer.Character.PrimaryPart.CFrame = v.Positions[positiontoUse].CFrame
        v.Remotes.RF:InvokeServer("enter")
        for i = 1, 4 do
          wait(0.25)
          v.Remotes.RE:FireServer()
        end
        wait(0.2)
      end
    end
  end
end
