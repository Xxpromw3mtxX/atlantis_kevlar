ESX = nil
local isDead = false

Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(0)
    end
end)

AddEventHandler('esx:onPlayerDeath', function(data)
    isDead = true
    SetPedArmour(GetPlayerPed(-1), Config['reset'])
    armourOFF()
end)

AddEventHandler('playerSpawned', function(spawn)
    IsDead = false
    SetPedArmour(GetPlayerPed(-1), Config['reset'])
    ClearPedBloodDamage(GetPlayerPed(-1))
    ResetPedVisibleDamage(GetPlayerPed(-1))
    ClearPedLastWeaponDamage(GetPlayerPed(-1))
    ResetPedMovementClipset(GetPlayerPed(-1), 0)
end)

RegisterNetEvent('atlantis_kevlar:equipLightArmour')
AddEventHandler('atlantis_kevlar:equipLightArmour', function()
    if GetPedArmour(GetPlayerPed(-1)) >= Config['light_weight'] then
        TriggerEvent('mythic_notify:client:SendAlert', {type = 'error', text = _U('already_equipped'), length = 2500})
    else
        equipArmor(Config['light'], Config['light_weight'])
        TriggerEvent('mythic_notify:client:SendAlert', {type = 'success', text = _U('light_equip'), length = 2500})
    end 
end)

RegisterNetEvent('atlantis_kevlar:equipMediumArmour')
AddEventHandler('atlantis_kevlar:equipMediumArmour', function()
    if GetPedArmour(GetPlayerPed(-1)) >= Config['medium_weight'] then
        TriggerEvent('mythic_notify:client:SendAlert', {type = 'error', text = _U('already_equipped'), length = 2500})
    else
        equipArmor(Config['medium'], Config['medium_weight'])
        TriggerEvent('mythic_notify:client:SendAlert', {type = 'success', text = _('medium_equip'), length = 2500})
    end
end)

RegisterNetEvent('atlantis_kevlar:equipHeavyArmour')
AddEventHandler('atlantis_kevlar:equipHeavyArmour', function()
    if GetPedArmour(GetPlayerPed(-1)) >= Config['heavy_weight'] then
        TriggerEvent('mythic_notify:client:SendAlert', {type = 'error', text = _U('already_equipped'), length = 2500})
    else
        equipArmor(Config['heavy'], Config['heavy_weight'])
        TriggerEvent('mythic_notify:client:SendAlert', {type = 'success', text = _U('heavy_equip'), length = 2500})
    end
end)

RegisterNetEvent('atlantis_kevlar:armourRemoveClient')
AddEventHandler('atlantis_kevlar:armourRemoveClient', function()
    SetPedArmour(GetPlayerPed(-1), Config['reset'])
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