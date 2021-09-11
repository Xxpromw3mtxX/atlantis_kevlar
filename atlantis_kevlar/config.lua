Config = {}

-- Language settings
Config.Locale = 'it'

-- Using mythic_notify?
Config.mythic = false -- If you're not using mythic, it will use the default ESX notification system

-- Customize the amount of shield that each Kevlar vest guarantee
Config.Kevlar = {
    ['gap20'] = 20,
    ['gap40'] = 40,
    ['gap100'] = 100
}

-- Kevlar names, needed if using krz_personalmenu
Config['light'] = 'gap20'  -- Change if you want to change the name of the light armour
Config['medium'] = 'gap40' -- Change if you want to change the name of the medium armour
Config['heavy'] = 'gap100' -- Change if you want to change the name of the heavy armour