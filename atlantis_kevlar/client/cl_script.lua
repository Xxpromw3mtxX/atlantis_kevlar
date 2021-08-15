local ESX = nil
Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(0)
    end
end)

AddEventHandler('esx:onPlayerDeath', function(data)
    SetPedArmour(PlayerPedId(), 0)
    armourOFF()
end)

AddEventHandler('playerSpawned', function(spawn)
    local player = PlayerPedId()

    SetPedArmour(player, 0)
    ClearPedBloodDamage(player)
    ResetPedVisibleDamage(player)
end)

RegisterNetEvent('atlantis_kevlar:equipArmour')
AddEventHandler('atlantis_kevlar:equipArmour', function(type)
    if GetPedArmour(PlayerPedId()) >= Config.Kevlar[type] then
        if Config.MythicNotify then
            TriggerEvent('mythic_notify:client:SendAlert', {type = 'error', text = _U('already_equipped'), length = 2500})
        else
            ESX.ShowNotification(_U('already_equipped'))
        end
    else
        equipArmour(Config.Kevlar[type])
        if Config.MythicNotify then
            TriggerEvent('mythic_notify:client:SendAlert', {type = 'success', text = _U('light_equip'), length = 2500})
        else
            ESX.ShowNotification(_U('already_equipped'))
        end
    end 
end)

RegisterNetEvent('atlantis_kevlar:armourRemoveClient')
AddEventHandler('atlantis_kevlar:armourRemoveClient', function(type)
    local player = PlayerPedId()
    local oldArmour = GetPedArmour(player)
    SetPedArmour(player, oldArmour - Config.Kevlar[type])

    if oldArmour - Config.Kevlar[type] <= 0 then
        armourOFF()
    end
end)


function equipArmour(type)
    TriggerServerEvent('atlantis_kevlar:armourRemoveItem', type)
    local player = PlayerPedId()
    local oldArmour = GetPedArmour(player)
    SetPedArmour(player, oldArmour + Config.Kevlar[type])
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
