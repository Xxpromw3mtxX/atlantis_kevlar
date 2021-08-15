ESX = nil

Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(0)
    end
end)

AddEventHandler('esx:onPlayerDeath', function(data)
    SetPedArmour(GetPlayerPed(-1), 0)
    armourOFF()
end)

AddEventHandler('playerSpawned', function(spawn)
    local player = PlayerPedId(-1)

    SetPedArmour(player, 0)
    ClearPedBloodDamage(player)
    ResetPedVisibleDamage(player)
end)

RegisterNetEvent('atlantis_kevlar:equipArmour')
AddEventHandler('atlantis_kevlar:equipArmour', function(type, weight)
    if GetPedArmour(PlayerPedId(-1)) >= Config[type .. '_weight'] then
        notify('error', _U('already_equipped'))
    else
        equipArmor(type, Config[type .. '_weight'])
        notify('inform', _U(type .. '_equip'))
    end
end)

RegisterNetEvent('atlantis_kevlar:armourRemoveClient')
AddEventHandler('atlantis_kevlar:armourRemoveClient', function()
    SetPedArmour(GetPlayerPed(-1), 0)
    armourOFF()
end)


function equipArmor(item, weight)
    TriggerServerEvent('atlantis_kevlar:armourRemoveItem', item)
    SetPedArmour(GetPlayerPed(-1), weight)
    armourON()
end

function armourON()
    TriggerEvent('skinchanger:getSkin', function(skin)
        TriggerEvent('skinchanger:loadClothes', skin, {['bproof_1'] = 1,  ['bproof_2'] = 1}) 
    end)
end

function armourOFF()
    TriggerEvent('skinchanger:getSkin', function(skin)
        TriggerEvent('skinchanger:loadClothes', skin, {['bproof_1'] = 0,  ['bproof_2'] = 0})  
    end)
end

function notify(type, msg)
    if Config.mythic then
        TriggerEvent('mythic_notify:client:SendAlert', {type = type, text = msg, length = 2500})
    else
        ESX.ShowNotification(msg)
    end
end