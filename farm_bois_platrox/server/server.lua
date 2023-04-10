lib.callback.register('farm_bois_platrox:checkAxe', function(source, itemname)
    local item = HasItem(source, itemname)
    if item >= 1 then
        return true
    else
        return false
    end
end)

lib.callback.register('farm_bois_platrox:getBoisData', function(source)
    local data = Config.rocks[math.random(#Config.rocks)]
    return data
end)

local addCommas = function(n)
	return tostring(math.floor(n)):reverse():gsub("(%d%d%d)","%1,")
								  :gsub(",(%-?)$","%1"):reverse()
end

RegisterServerEvent("farm_bois_platrox:cutBois")
AddEventHandler("farm_bois_platrox:cutBois", function(data, index)
    local playerPed = GetPlayerPed(source)
    local playerCoord = GetEntityCoords(playerPed)
    local distance = #(playerCoord - Config.miningAreas[index])
    if distance == nil then
        KickPlayer(source, Strings.kicked)
        return
    end
    if distance > 10 then
        KickPlayer(Strings.kicked)
        return
    end
    if Framework == 'esx' and not Config.oldESX then
        local player = GetPlayer(source)
        if player.canCarryItem(data.item, 1) then
            AddItem(source, data.item, 1)
            TriggerClientEvent('farm_bois_platrox:notify', source, Strings.rewarded, Strings.rewarded_desc..' '..data.label, 'error')
        else
	    TriggerClientEvent('farm_bois_platrox:notify', source, Strings.cantcarry, Strings.cantcarry_desc..' '..data.label, 'success')
        end
    else
        AddItem(source, data.item, 1)
        TriggerClientEvent('farm_bois_platrox:notify', source, Strings.rewarded, Strings.rewarded_desc..' '..data.label, 'success')
    end
end)

RegisterServerEvent('farm_bois_platrox:sellBois')
AddEventHandler('farm_bois_platrox:sellBois', function()
    local playerPed = GetPlayerPed(source)
    local playerCoord = GetEntityCoords(playerPed)
    local distance = #(playerCoord - Config.sellShop.coords)
    if distance == nil then
        KickPlayer(source, Strings.kicked)
        return
    end
    if distance > 3 then
        KickPlayer(source, Strings.kicked)
        return
    end
    for i=1, #Config.rocks do
        if HasItem(source, Config.rocks[i].item) >= 1 then
            local rewardAmount = 0
            for j=1, HasItem(source, Config.rocks[i].item) do
                rewardAmount = rewardAmount + math.random(Config.rocks[i].price[1], Config.rocks[i].price[2])
            end
            if rewardAmount > 0 then
                AddMoney(source, 'money', rewardAmount)
                TriggerClientEvent('farm_bois_platrox:notify', source, Strings.sold_for, (Strings.sold_for_desc):format(HasItem(source, Config.rocks[i].item), Config.rocks[i].label, addCommas(rewardAmount)), 'success')
                RemoveItem(source, Config.rocks[i].item, HasItem(source, Config.rocks[i].item))
            end
        end
    end
end)

RegisterServerEvent('farm_bois_platrox:axeBroke')
AddEventHandler('farm_bois_platrox:axeBroke', function()
    if HasItem(source, 'axe') >= 1 then
        RemoveItem(source, 'axe', 1)
    else
        Wait(2000)
        KickPlayer(source, Strings.kicked)
    end
end)
