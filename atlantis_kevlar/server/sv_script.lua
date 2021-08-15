ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

RegisterServerEvent('atlantis_kevlar:armourRemoveItem')
AddEventHandler('atlantis_kevlar:armourRemoveItem', function(item)
    local xPlayer = ESX.GetPlayerFromId(source)
    xPlayer.removeInventoryItem(item, 1)
end)

for item, value in pairs(Config.Kevlar) do
    ESX.RegisterUsableItem(k, function(source)
        TriggerClientEvent('atlantis_kevlar:equipArmour', source, k)
    end)
end


RegisterServerEvent('atlantis_kevlar:armourRemove')
AddEventHandler('atlantis_kevlar:armourRemove', function(type)
    local xPlayer = ESX.GetPlayerFromId(source)

    TriggerClientEvent('atlantis_kevlar:armourRemoveClient', source)
    xPlayer.addInventoryItem(type, 1)
end)
