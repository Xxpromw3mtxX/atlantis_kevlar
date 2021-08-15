ESX = nil

TriggerEvent('esx:getSharedObject', function(obj)
	ESX = obj
end)

RegisterServerEvent('atlantis_kevlar:armourRemoveItem')
AddEventHandler('atlantis_kevlar:armourRemoveItem', function(item)
    local xPlayer = ESX.GetPlayerFromId(source)
    xPlayer.removeInventoryItem(item, 1)
end)

ESX.RegisterUsableItem(Config['light'], function(source)
	TriggerClientEvent('atlantis_kevlar:equipArmour', source, Config['light'], Config['light_weight'])
end)

ESX.RegisterUsableItem(Config['medium'], function(source)
	TriggerClientEvent('atlantis_kevlar:equipArmour', source, Config['medium'], Config['medium_weight'])
end)

ESX.RegisterUsableItem(Config['heavy'], function(source)
	TriggerClientEvent('atlantis_kevlar:equipArmour', source, Config['heavy'], Config['heavy_weight'])
end)

RegisterServerEvent('atlantis_kevlar:armourRemove')
AddEventHandler('atlantis_kevlar:armourRemove', function(armourWeight)
    local xPlayer = ESX.GetPlayerFromId(source)

    TriggerClientEvent('atlantis_kevlar:armourRemoveClient', source)

	if armourWeight <= Config['light_weight'] then
		xPlayer.addInventoryItem(Config['light'], 1)
	elseif armourWeight > Config['light_weight'] and armourWeight <= Config['medium_weight'] or armourWeight < Config['heavy_weight'] then
		xPlayer.addInventoryItem(Config['medium'], 1)
	elseif armourWeight == Config['heavy_weight'] then
		xPlayer.addInventoryItem(Config['heavy'], 1)
	end
end)