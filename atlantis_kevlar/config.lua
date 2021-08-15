Config = {}

-- Language settings
Config.Locale = 'it'

-- Using mythic_notify?
Config.mythic = true -- If you're not using mythic, it will use the default ESX notification system

-- Customize the amount of shield that each Kevlar vest guarantee
Config.Kevlar = {
    ['light'] = 20,
    ['medium'] = 40,
    ['heavy'] = 100
}

-- Kevlar names, needed if using krz_personalmenu
Config['light'] = 'light'  -- Change if you want to change the name of the light armour
Config['medium'] = 'medium' -- Change if you want to change the name of the medium armour
Config['heavy'] = 'heavy' -- Change if you want to change the name of the heavy armour