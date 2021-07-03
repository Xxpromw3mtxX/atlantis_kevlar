ESX = nil

TriggerEvent('esx:getSharedObject', function(obj)
	ESX = obj
end)

RegisterServerEvent('lfKevlar:armourRemoveItem')
AddEventHandler('lfKevlar:armourRemoveItem', function(item)
    local xPlayer = ESX.GetPlayerFromId(source)
    xPlayer.removeInventoryItem(item, 1)
end)

ESX.RegisterUsableItem(Config['light'], function(source)
	TriggerClientEvent('lfKevlar:equipLightArmour', source)
end)

ESX.RegisterUsableItem(Config['medium'], function(source)
	TriggerClientEvent('lfKevlar:equipMediumArmour', source)
end)

ESX.RegisterUsableItem(Config['heavy'], function(source)
	TriggerClientEvent('lfKevlar:equipHeavyArmour', source)
end)