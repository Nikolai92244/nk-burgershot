Keys = {
	["ESC"] = 322, ["F1"] = 288, ["F2"] = 289, ["F3"] = 170, ["F5"] = 166, ["F6"] = 167, ["F7"] = 168, ["F8"] = 169, ["F9"] = 56, ["F10"] = 57,
	["~"] = 243, ["1"] = 157, ["2"] = 158, ["3"] = 160, ["4"] = 164, ["5"] = 165, ["6"] = 159, ["7"] = 161, ["8"] = 162, ["9"] = 163, ["-"] = 84, ["="] = 83, ["BACKSPACE"] = 177,
	["TAB"] = 37, ["Q"] = 44, ["W"] = 32, ["E"] = 38, ["R"] = 45, ["T"] = 245, ["Y"] = 246, ["U"] = 303, ["P"] = 199, ["["] = 39, ["]"] = 40, ["ENTER"] = 18,
	["CAPS"] = 137, ["A"] = 34, ["S"] = 8, ["D"] = 9, ["F"] = 23, ["G"] = 47, ["H"] = 74, ["K"] = 311, ["L"] = 182,
	["LEFTSHIFT"] = 21, ["Z"] = 20, ["X"] = 73, ["C"] = 26, ["V"] = 0, ["B"] = 29, ["N"] = 249, ["M"] = 244, [","] = 82, ["."] = 81,
	["LEFTCTRL"] = 36, ["LEFTALT"] = 19, ["SPACE"] = 22, ["RIGHTCTRL"] = 70,
	["HOME"] = 213, ["PAGEUP"] = 10, ["PAGEDOWN"] = 11, ["DELETE"] = 178,
	["LEFT"] = 174, ["RIGHT"] = 175, ["TOP"] = 27, ["DOWN"] = 173,
	["NENTER"] = 201, ["N4"] = 108, ["N5"] = 60, ["N6"] = 107, ["N+"] = 96, ["N-"] = 97, ["N7"] = 117, ["N8"] = 61, ["N9"] = 118
}



-- Client Events Register
RegisterNetEvent('esx:playerLoaded')
RegisterNetEvent('esx:setJob')
RegisterNetEvent('Ori_tacoruns:searchforjob')

ESX = nil
local PlayerData = {}
local inMission = false
local MissionCoords = false
local Mblip = false
local have = false
local jobVeh = false
local isProcessing = false

-- Setup ESX Core
Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(0)
	end

	while ESX.GetPlayerData().job == nil do
		Citizen.Wait(10)
	end

	ESX.PlayerData = ESX.GetPlayerData()
end)

-- Take Player Data After Player Loadout
AddEventHandler('esx:playerLoaded', function(xPlayer)
	ESX.PlayerData = xPlayer 
end)

-- Takes Player Job After /setjob
AddEventHandler('esx:setJob', function(job)
	ESX.PlayerData.job = burgershot
	
	Citizen.Wait(10)
end)

local PlayerData = {}

Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(0)
	end

	while ESX.GetPlayerData().job == nil do
        Citizen.Wait(10)
	end
	
    PlayerData = ESX.GetPlayerData()
end)

function IsJobTrue1()
    if PlayerData ~= nil then
        local IsJobTrue1 = false
        if PlayerData.job ~= nil and PlayerData.job.name == 'burgershot' then
            IsJobTrue1 = true
        end
        return IsJobTrue1
    end
end



RegisterNetEvent('esx:playerLoaded')
AddEventHandler('esx:playerLoaded', function(xPlayer)
    PlayerData = xPlayer
end)

RegisterNetEvent('esx:setJob')
AddEventHandler('esx:setJob', function(job)
    PlayerData.job = job
end)

function loadAnimDict( dict )
    while ( not HasAnimDictLoaded( dict ) ) do
        RequestAnimDict( dict )
        Citizen.Wait( 0 )
    end
end

Citizen.CreateThread(function()
	while true do
	Citizen.Wait(0)
		for k,v in pairs(Config.drinkmake) do
			local coords = GetEntityCoords(GetPlayerPed(-1))
				if (GetDistanceBetweenCoords(coords, v.x, v.y, v.z, true) < 3.0)  then
				if not inMission then
					DrawText3D(v.x, v.y, v.z, ('Press E to prep a drink'))	
					if IsControlJustReleased(0, 46) and (GetDistanceBetweenCoords(coords, v.x, v.y, v.z, true) < 0.3) then
						--ESX.TriggerServerCallback('Reload_Tacoruns:getPlayers', function(plys)
							--print(plys)
							--if plys > 0 then
								TaskStartScenarioInPlace(PlayerPedId(), "world_human_aa_coffee", 0, true)
								local finished = exports['nk-taskbar']:taskBar(6000,"Prepping a Drink")
								Citizen.Wait(1000)
								ClearPedTasksImmediately(PlayerPedId())
								TriggerServerEvent('Reload_Burger:add', 'item', 1, Config.Drink)
							--else
							--end
						--end)	
					end
				end
		end
	end
end
end)

Citizen.CreateThread(function()
	while true do
	Citizen.Wait(0)
		for k,v in pairs(Config.drinkmake2) do
			local coords = GetEntityCoords(GetPlayerPed(-1))
				if (GetDistanceBetweenCoords(coords, v.x, v.y, v.z, true) < 3.0)  then
				if not inMission then
					DrawText3D(v.x, v.y, v.z, ('Press E to prep a drink'))	
					if IsControlJustReleased(0, 46) and (GetDistanceBetweenCoords(coords, v.x, v.y, v.z, true) < 0.3) then
						--ESX.TriggerServerCallback('Reload_Tacoruns:getPlayers', function(plys)
							--print(plys)
							--if plys > 0 then
								TaskStartScenarioInPlace(PlayerPedId(), "world_human_aa_coffee", 0, true)
								local finished = exports['nk-taskbar']:taskBar(6000,"Prepping a Drink")
								Citizen.Wait(1000)
								ClearPedTasksImmediately(PlayerPedId())
								TriggerServerEvent('Reload_Burger:add', 'item', 1, Config.Drink)
							--else
							--end
						--end)	
					end
				end
		end
	end
end
end)

Citizen.CreateThread(function()
	while true do
	Citizen.Wait(0)
		for k,v in pairs(Config.donutgrab) do
			local coords = GetEntityCoords(GetPlayerPed(-1))
				if (GetDistanceBetweenCoords(coords, v.x, v.y, v.z, true) < 3.0)  then
				if not inMission then
					DrawText3D(v.x, v.y, v.z, ('Press E to grab a donut'))	
					if IsControlJustReleased(0, 46) and (GetDistanceBetweenCoords(coords, v.x, v.y, v.z, true) < 0.3) then
						--ESX.TriggerServerCallback('Reload_Tacoruns:getPlayers', function(plys)
							--print(plys)
							--if plys > 0 then
								TaskStartScenarioInPlace(PlayerPedId(), "world_human_stand_fire", 0, true)
								local finished = exports['nk-taskbar']:taskBar(4500,"Grabbing a Donut")
								Citizen.Wait(1000)
								ClearPedTasksImmediately(PlayerPedId())
								TriggerServerEvent('Reload_Burger:add', 'item', 1, Config.Donut)
							--else
							--end
						--end)	
					end
				end
		end
	end
end
end)

function OpenStash()
  TriggerEvent('inventory:stash', 'Ingredient Storage')
end
  
function OpenInv()
  TriggerEvent('inventory:stash', 'Burgershot Drivethru')
end

function OpenPickup()
    TriggerEvent('inventory:stash', 'Pick Up Order')
  end

Citizen.CreateThread(function()
    while true do 
        Citizen.Wait(1)
        if IsJobTrue1() then
            local pos = GetEntityCoords(GetPlayerPed(-1))
            if IsJobTrue1()  then
                if (GetDistanceBetweenCoords(pos.x, pos.y, pos.z, Config.Locations["stashburger"].coords.x, Config.Locations["stashburger"].coords.y, Config.Locations["stashburger"].coords.z, true) < 10.0) then
                    DrawMarker(2, Config.Locations["stashburger"].coords.x, Config.Locations["stashburger"].coords.y, Config.Locations["stashburger"].coords.z, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.3, 0.2, 0.15, 200, 200, 200, 222, false, false, false, true, false, false, false)
                    if (GetDistanceBetweenCoords(pos.x, pos.y, pos.z, Config.Locations["stashburger"].coords.x, Config.Locations["stashburger"].coords.y, Config.Locations["stashburger"].coords.z, true) < 1.5) then
                            DrawText3D(Config.Locations["stashburger"].coords.x, Config.Locations["stashburger"].coords.y, Config.Locations["stashburger"].coords.z, "~g~E~w~ - Stash Burger ")
                        if IsControlJustReleased(0, Keys["E"]) then
                            OpenInv()
                            end
                        end
                end
            else
                Citizen.Wait(2500)
            end
        else
            Citizen.Wait(2500)
        end
    end
end)

Citizen.CreateThread(function()
    while true do 
        Citizen.Wait(1)
        if IsJobTrue1() then
            local pos = GetEntityCoords(GetPlayerPed(-1))
            if IsJobTrue1()  then
                if (GetDistanceBetweenCoords(pos.x, pos.y, pos.z, Config.Locations["stashingredient"].coords.x, Config.Locations["stashingredient"].coords.y, Config.Locations["stashingredient"].coords.z, true) < 10.0) then
                    DrawMarker(2, Config.Locations["stashingredient"].coords.x, Config.Locations["stashingredient"].coords.y, Config.Locations["stashingredient"].coords.z, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.3, 0.2, 0.15, 200, 200, 200, 222, false, false, false, true, false, false, false)
                    if (GetDistanceBetweenCoords(pos.x, pos.y, pos.z, Config.Locations["stashingredient"].coords.x, Config.Locations["stashingredient"].coords.y, Config.Locations["stashingredient"].coords.z, true) < 1.5) then
                            DrawText3D(Config.Locations["stashingredient"].coords.x, Config.Locations["stashingredient"].coords.y, Config.Locations["stashingredient"].coords.z, "~g~E~w~ - Stash Ingredient ")
                        if IsControlJustReleased(0, Keys["E"]) then
                            OpenStash()
                            end
                        end
                end
            else
                Citizen.Wait(2500)
            end
        else
            Citizen.Wait(2500)
        end
    end
end)

Citizen.CreateThread(function()
    while true do 
        Citizen.Wait(1)
        if IsJobTrue1() then
            local pos = GetEntityCoords(GetPlayerPed(-1))
            if IsJobTrue1()  then
                if (GetDistanceBetweenCoords(pos.x, pos.y, pos.z, Config.Locations["stashpickup"].coords.x, Config.Locations["stashpickup"].coords.y, Config.Locations["stashpickup"].coords.z, true) < 10.0) then
                    DrawMarker(2, Config.Locations["stashpickup"].coords.x, Config.Locations["stashpickup"].coords.y, Config.Locations["stashpickup"].coords.z, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.3, 0.2, 0.15, 200, 200, 200, 222, false, false, false, true, false, false, false)
                    if (GetDistanceBetweenCoords(pos.x, pos.y, pos.z, Config.Locations["stashpickup"].coords.x, Config.Locations["stashpickup"].coords.y, Config.Locations["stashpickup"].coords.z, true) < 3.0) then
                            DrawText3D(Config.Locations["stashpickup"].coords.x, Config.Locations["stashpickup"].coords.y, Config.Locations["stashpickup"].coords.z, "~g~E~w~ - Stash Pick Up Order ")
                        if IsControlJustReleased(0, Keys["E"]) then
                            OpenPickup()
                            end
                        end
                end
            else
                Citizen.Wait(2500)
            end
        else
            Citizen.Wait(2500)
        end
    end
end)




local CurrentCraft = nil
-- Location Loop
Citizen.CreateThread(function()
    while true do
        Citizen.Wait(7)
        if ESX ~= nil and Crafting.Locations ~= nil then
            local pos = GetEntityCoords(GetPlayerPed(-1), true)
            for i=1, #Crafting.Locations, 1 do
                if GetDistanceBetweenCoords(pos.x, pos.y, pos.z, Crafting.Locations[i].x, Crafting.Locations[i].y, Crafting.Locations[i].z, true) < 2.5 then
                        ESX.ShowHelpNotification('Press ~INPUT_CONTEXT~ To Cooking')
                        if IsControlJustReleased(0, Keys["E"]) then
                            OpenCraftMenu()
                        end
                    end
                end
            end
        end
    end)

-- NUI that get triggered on success
RegisterNUICallback('CraftingSuccess', function()
    SetNuiFocus(false, false)
    ClearPedTasks(GetPlayerPed(-1))
    FreezeEntityPosition(GetPlayerPed(-1),false)
    TriggerServerEvent("nk-burgershot:CraftingSuccess", CurrentCraft)
end)

function OpenCraftMenu()
    local elements = {}
    for item, v in pairs(Crafting.Items) do
        local elementlabel = v.label .. ": "
        local somecount = 1
        for k, need in pairs(v.needs) do
            if somecount == 1 then
                somecount = somecount + 1
                elementlabel = elementlabel .. need.label .. " ("..need.count..")"
            else
                elementlabel = elementlabel .. " - "..need.label .. " ("..need.count..")"
            end
        end
        table.insert(elements, {value = item, label = elementlabel})
    end
    ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'crafting_actions', {
        title    = "Cooking Item",
        elements = elements,
        align    = 'center',
    }, function(data, menu)
        menu.close()
        CurrentCraft = data.current.value
        ESX.TriggerServerCallback('nk-burgershot:HasTheItems', function(result)
            if result then
                TaskStartScenarioInPlace(PlayerPedId(), "PROP_HUMAN_BBQ", 0, true)
				local finished = exports['nk-taskbar']:taskBar(6000,"Making A Food")
				Citizen.Wait(500)
            	ClearPedTasksImmediately(PlayerPedId())
                Citizen.Wait(500)
                TriggerServerEvent("nk-burgershot:CraftingSuccess", CurrentCraft)
            else
                exports['mythic_notify']:SendAlert('error', 'You Dont Have Ingredients')
            end
        end, CurrentCraft)

    end, function(data, menu)
        menu.close()
    end)
end

function DrawText3D(x,y,z, text)
    local onScreen,_x,_y=World3dToScreen2d(x,y,z)
    local px,py,pz=table.unpack(GetGameplayCamCoords())
    SetTextScale(0.35, 0.35)
    SetTextFont(4)
    SetTextProportional(1)
    SetTextColour(255, 255, 255, 215)
    SetTextEntry("STRING")
    SetTextCentre(1)
    AddTextComponentString(text)
    DrawText(_x,_y)
    local factor = (string.len(text)) / 370
    DrawRect(_x,_y+0.0125, 0.015+ factor, 0.03, 41, 11, 41, 68)
end

local blips = {

	{title="Burgershot", colour=5, id=106, x = -1171.91, y = -897.88, z = 14.02},
  
}

Citizen.CreateThread(function()

    for _, info in pairs(blips) do
      info.blip = AddBlipForCoord(info.x, info.y, info.z)
      SetBlipSprite(info.blip, info.id)
      SetBlipDisplay(info.blip, 4)
      SetBlipScale(info.blip, 0.6)
      SetBlipColour(info.blip, info.colour)
      SetBlipAsShortRange(info.blip, true)
	  BeginTextCommandSetBlipName("STRING")
      AddTextComponentString(info.title)
      EndTextCommandSetBlipName(info.blip)
    end
end)

-- TARGET TODO

---TODO TARGET TRACKING

Citizen.CreateThread(function()

    exports['bt-target']:AddBoxZone("cyka", vector3(-1197.62, -899.4, 13.94), 1, 1, {
    name="cyka",
    heading=35,
    ---debugPoly=true,
    minZ=13.94-1.2,
    maxZ=13.94+1.9
    }, {
		options = {
            {
                event = "gui:openstash",
                icon = "fa fa-circle",
                label = "Open Ingredient",
            },

			{
                event = "cancel",
                icon = "fa fa-circle",
                label = "Cancel",
            },
        },

        job = {"all"},
        distance = 1.5
    })

end)



RegisterNetEvent("gui:openstash")
AddEventHandler("gui:openstash", function()
    OpenStash()
end)

RegisterNetEvent("gui:pickup")
AddEventHandler("gui:pickup", function()
    OpenPickup()
end)


