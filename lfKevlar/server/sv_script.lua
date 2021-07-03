ESX = nil

TriggerEvent('esx:getSharedObject', function(obj)
	ESX = obj
end)

RegisterServerEvent('lfKevlar:armourRemoveItem')
AddEventHandler('lfKevlar:armourRemoveItem', function(item)
    local xPlayer = ESX.GetPlayerFromId(source)
    xPlayer.removeInventoryItem(item, 1)
end)

ESX.RegisterUsableItem('Light', function(source)
	TriggerClientEvent('lfKevlar:equipLightArmour', source)
end)

ESX.RegisterUsableItem('Medium', function(source)
	TriggerClientEvent('lfKevlar:equipMediumArmour', source)
end)

ESX.RegisterUsableItem('Heavy', function(source)
	TriggerClientEvent('lfKevlar:equipHeavyArmour', source)
end)