ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

RegisterServerEvent('Reload_Burger:add')
AddEventHandler('Reload_Burger:add', function(type, amount, name)
	local xPlayer  = ESX.GetPlayerFromId(source)

	if type == 'money' then
		xPlayer.addMoney(amount)
		local society = (amount / 100)*15 
		TriggerEvent('esx_addonaccount:getSharedAccount', 'society_taco', function(account)
			account.addMoney(society)
		end)
	elseif type == 'item' then
		xPlayer.addInventoryItem(name, amount)
	end
end)


RegisterServerEvent('nk-burgershot:CraftingSuccess')
AddEventHandler('nk-burgershot:CraftingSuccess', function(CraftItem)
    local src = source
    local xPlayer = ESX.GetPlayerFromId(src)
    local item = Crafting.Items[CraftItem]
    for itemname, v in pairs(item.needs) do
        xPlayer.removeInventoryItem(itemname, v.count)
    end
    if CraftItem == "weapon_pistol" or CraftItem == "weapon_combatpistol" then
        xPlayer.addWeapon(CraftItem, 0)
    else
        xPlayer.addInventoryItem(CraftItem, 1)
    end
    
    TriggerClientEvent('mythic_notify:client:SendAlert', src, { type = 'inform', text = 'Kamu telah membuat 1x ' ..item.label..''})
end)

ESX.RegisterServerCallback('nk-burgershot:HasTheItems', function(source, cb, CraftItem)
    local xPlayer = ESX.GetPlayerFromId(source)
    local item = Crafting.Items[CraftItem]
    for itemname, v in pairs(item.needs) do
        if xPlayer.getInventoryItem(itemname).count < v.count then
            cb(false)
        end
    end
    cb(true)
end)
