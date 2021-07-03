ESX = nil
local PedArmour = GetPedArmour(GetPlayerPed(-1))
local light = 'Light'
local medium = 'Medium'
local heavy = 'Heavy'

Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(0)
	end
end)

function equipArmor(type, weight)
    SetPedArmour(GetPlayerPed(-1), 0)
    ClearPedBloodDamage(GetPlayerPed(-1))
    ResetPedVisibleDamage(GetPlayerPed(-1))
    ClearPedLastWeaponDamage(GetPlayerPed(-1))
    ResetPedMovementClipset(GetPlayerPed(-1), 0)

    TriggerServerEvent('lfKevlar:armourRemoveItem', type)
    TriggerEvent('skinchanger:getSkin', function(skin)
        if skin.sex == 0 then
            TriggerEvent('skinchanger:loadClothes', skin, {['bproof_1'] = 1,  ['bproof_2'] = 1})
            SetPedArmour(GetPlayerPed(-1), weight)
        else
            TriggerEvent('skinchanger:loadClothes', skin, {['bproof_1'] = 1,  ['bproof_2'] = 1})
            SetPedArmour(GetPlayerPed(-1), weight)
        end
    end)
end

RegisterNetEvent('lfKevlar:equipLightArmour')
AddEventHandler('lfKevlar:equipLightArmour', function()
    if PedArmour == 20 then
        TriggerEvent('mythic_notify:client:SendAlert', {type = 'error', text = _U('light_equipped'), length = 2500})
    else
        equipArmor(light, 20)
        TriggerEvent('mythic_notify:client:SendAlert', {type = 'success', text = _U('light_equip'), length = 2500})
    end 
end)

RegisterNetEvent('lfKevlar:equipMediumArmour')
AddEventHandler('lfKevlar:equipMediumArmour', function()
    if PedArmour == 40 then
        TriggerEvent('mythic_notify:client:SendAlert', {type = 'error', text = _U('medium_equipped'), length = 2500})
    else
        equipArmor(light, 40)
        TriggerEvent('mythic_notify:client:SendAlert', {type = 'success', text = _('medium_equip'), length = 2500})
    end
end)

RegisterNetEvent('lfKevlar:equipHeavyArmour')
AddEventHandler('lfKevlar:equipHeavyArmour', function()
    if PedArmour == 100 then
        TriggerEvent('mythic_notify:client:SendAlert', {type = 'error', text = _U('heavy_equipped'), length = 2500})
    else
        equipArmor(light, 100)
        TriggerEvent('mythic_notify:client:SendAlert', {type = 'success', text = _U('heavy_equip'), length = 2500})
    end
end)