Config = {}

Config.oldESX = false -- Does not apply to qb users (If set to true, won't check if player can carry item)

Config.axe = {
    prop = `prop_tool_fireaxe`, --Default: `prop_tool_fireaxe`
    breakChance = 5 -- When failing to mine rock, this is the percentage of a chance that your axe will 'break'
}

Config.rocks = { -- Items obtained from cuting
    { item = 'acajou', label = 'Bûche Acajou', price = {190, 220}, difficulty = {'easy', 'medium', 'easy'} },
    { item = 'acacia', label = 'Bûche Acacia', price = {150, 180}, difficulty = {'easy', 'easy', 'medium'} },
    { item = 'sapin', label = 'Bûche Sapin', price = {110, 140}, difficulty = {'easy', 'easy'} },
    { item = 'bouleau', label = 'Bûche Bouleau', price = {70, 100}, difficulty = {'easy', 'easy'} },
    { item = 'chene', label = 'Bûche Chêne', price = {40, 60}, difficulty = {'easy', 'easy'} },
}


Config.miningAreas = {
    vec3(-537.34, 5483.33, 65.94), -- vec3 of locations for cutting woods
    vec3(-535.46, 5491.19, 88.83),
    vec3(-560.13, 5460.46, 63.62),
    vec3(-551.65, 5446.0, 64.22),
    vec3(-579.81, 5471.17, 59.7),
    vec3(-577.74, 5427.47, 59.06),
    vec3(-594.77, 5452.38, 59.42)
}

Config.sellShop = {
    enabled = true, -- Enable spot to sell the things cutted?
    coords = vec3(-509.83, -1001.66, 23.55-1), -- Location of buyer
    heading = 91.16, -- Heading of ped
    ped = 'cs_andreas' -- Ped name here
}

RegisterNetEvent('farm_bois_platrox:notify')
AddEventHandler('farm_bois_platrox:notify', function(title, message, msgType)	
    -- Place notification system info here, ex: exports['mythic_notify']:SendAlert('inform', message)
    if not msgType then
        lib.notify({
            title = title,
            description = message,
            type = 'inform'
        })
    else
        lib.notify({
            title = title,
            description = message,
            type = msgType
        })
    end
end)
