ESX = nil

TriggerEvent('esx:getSharedObject', function(obj)
	ESX = obj
end)

RegisterServerEvent('atlantis_kevlar:armourRemoveItem')
AddEventHandler('atlantis_kevlar:armourRemoveItem', function(item)
    local xPlayer = ESX.GetPlayerFromId(source)
    xPlayer.removeInventoryItem(item, 1)
end)

for k, v in pairs(Config.Kevlar) do
	ESX.RegisterUsableItem(k, function(source)
		TriggerClientEvent('atlantis_kevlar:equipArmour', source, k, v)
	end)
end


-- krz_personalmenu settings DON'T MESS WITH THEM
RegisterServerEvent('atlantis_kevlar:armourRemove')
AddEventHandler('atlantis_kevlar:armourRemove', function(armourWeight)
    local xPlayer = ESX.GetPlayerFromId(source)

    TriggerClientEvent('atlantis_kevlar:armourRemoveClient', source)
	
	if armourWeight <= Config.Kevlar['light'] then
		xPlayer.addInventoryItem(Config['light'], 1)
	elseif armourWeight > Config.Kevlar['light'] and armourWeight <= Config.Kevlar['medium'] or armourWeight < Config.Kevlar['heavy'] then
		xPlayer.addInventoryItem(Config['medium'], 1)
	elseif armourWeight == Config.Kevlar['heavy'] then
		xPlayer.addInventoryItem(Config['heavy'], 1)
	end
end)