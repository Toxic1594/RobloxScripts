getgenv().autoclick = false
getgenv().autocraft = false
getgenv().autorebirth = false
getgenv().rebirthamount = 0
getgenv().autohatch = false
getgenv().eggname = 0
getgenv().hatchmethod = 0
getgenv().antiafk = false
getgenv().worldboost = false
getgenv().boostselected = 0
-----------------------------------------------------------------------------------------------------------
function funcAutoClick()
    while getgenv().autoclick == true do
game:GetService("ReplicatedStorage").Events.Click3:FireServer()
wait()

    end

end
-----------------------------------------------------------------------------------------------------------
function funcAutoCraft()
local args = {
    [1] = "CraftAll",
    [2] = {}
}

while getgenv().autocraft == true do
game:GetService("ReplicatedStorage").Functions.Request:InvokeServer(unpack(args))
wait(0.1)
end
end
-----------------------------------------------------------------------------------------------------------
function funcAutoRebirth()
while getgenv().autorebirth == true do
local args = {
    [1] = tonumber(getgenv().rebirthamount) 
}

game:GetService("ReplicatedStorage").Events.Rebirth:FireServer(unpack(args))
wait(0.01)
    end


end
-----------------------------------------------------------------------------------------------------------
--[[function funcgeteggs()
    local Children = game.workspace.Scripts.Eggs:GetChildren()
   getgenv().fkinstance = ""
    for i = 1, #Children do
        fkinstance = Children[i].Name
        getgenv().sortedeggs = sortedeggs..",".."\""..fkinstance.."\""
    end
    print (getgenv().sortedeggs)
end--]]

-----------------------------------------------------------------------------------------------------------
function antiafk()--not assigned
    --[[ while getgenv().antiafk == true do
        local vu = game:GetService("VirtualUser")
        game:GetService("Players").LocalPlayer.Idled:connect(function()
           vu:Button2Down(Vector2.new(0,0),workspace.CurrentCamera.CFrame)
           wait(1)
           vu:Button2Up(Vector2.new(0,0),workspace.CurrentCamera.CFrame)
        end)
    end--]]
    while getgenv().antiafk == true do
    local VirtualUser = game:service'VirtualUser'
    game:service'Players'.LocalPlayer.Idled:connect(function()
    VirtualUser:CaptureController()
    VirtualUser:ClickButton2(Vector2.new())
    end)
    wait(1)
end
end
-----------------------------------------------------------------------------------------------------------
function applyworldboost()
while getgenv().worldboost == true and getgenv().boostselected != 0 do
local args = {
    [1] = getgenv().boostselected
}

game:GetService("ReplicatedStorage").Events.WorldBoost:FireServer(unpack(args))

wait(2)

end

end

function hatchegg()
while getgenv().autohatch == true and getgenv().eggname != 0 and getgenv().hatchmethod != 0 do

local args = {
    [1] = getgenv().eggname,
    [2] = getgenv().hatchmethod
}

game:GetService("ReplicatedStorage").Functions.Unbox:InvokeServer(unpack(args))
wait(0.1)
end

end






local library = loadstring(game:HttpGet('https://raw.githubusercontent.com/jakepscripts/moonlib/main/moonlibv2.lua'))()
local main = library:CreateWindow("SP-Cheats Rebirth Legends by Singleplayer#2437 | GUI By MoonLIB <3", "#19cf83", 9160626035)

main:CreateTab("Main")
main:CreateTab("Misc")
main:CreateTab("Info")
main:CreateLabel("Main","Automatic stuff")
main:CreateToggle("Main","Autoclick",false, function(togglestate)
    getgenv().autoclick = togglestate
    if togglestate then
        print("autoclick is: ",togglestate)
        funcAutoClick()
    
    end
end)
    main:CreateToggle("Main","Autocraft",false, function(togglestate)
        getgenv().autocraft = togglestate
        if togglestate then
            print("autoclick is: ",togglestate)
            funcAutoCraft()
        end
    end)
    main:CreateToggle("Main","Auto Rebirth",false,function(togglestate)
        getgenv().autorebirth = togglestate
        print ("autorebirth: ", togglestate)
        if togglestate then
            funcAutoRebirth()
        end
    end)
    main:CreateDropdown("Main","Rebirth Amount","The rebirth amount is set in steps, so 1=1,2=10 rebirts and so on",{"1","2","3","4","5","6","7","8","9","10","11","12","13","14","15","16","17","18","19","20","21","22","23","24","25","26","27","28","29","30"}, function(args)
getgenv().rebirthamount = args

    end)
    main:CreateToggle("Main","Auto Hatch",false,function(togglestate)
        getgenv().autohatch = togglestate
        print ("autohatch: ", togglestate)
        if togglestate then
            hatchegg()
        end
    end)
main:CreateDropdown("Main","Select Egg",false,{"Basic","King","Forest","Beach","Winter","Desert","Volcano","Lava","Mythic","Magma","Atlantis","Water","Moon","Cyber","Magic","Heaven","Nuclear","Void","Spooky","Cave","Easter","Easter Part 2"},function(args)
getgenv().eggname = args
end)
main:CreateDropdown("Main","Hatch Method",false,{"Single","Triple"},function(args)
getgenv().hatchmethod = args
end)
main:CreateToggle("Misc","Anti Afk","no afk kick anymore",function(togglestate)
getgenv().antiafk = togglestate
print("anti afk: ", togglestate)
if (togglestate) then
    antiafk()
    end

end)
main:CreateToggle("Misc","World click boost","exploit to get boost on every map",function(togglestate)
getgenv().worldboost = togglestate
print ("world boost:", togglestate)
if (togglestate) then
applyworldboost()
end
end)
main:CreateDropdown("Misc","Boost amount",false,{"Spawn","King","Forest","Beach","Winter","Desert","Volcano","Lava","Mythic","Magma","Atlantis","Water","Moon","Cyber","Magic","Heaven","Nuclear","Void","Spooky","Cave"},function(args)
getgenv().boostselected = args
end)
main:CreateButton("Info","Copy Discord to clipboard",false,function()
    setclipboard("Singleplayer#2437")

end)