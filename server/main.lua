lib.addCommand('aduty', {
    help = 'Admin Dienst betreten/verlassen',
}, function(source, args, raw)
    local src = source
    local discordId = nil

    -- Extract discord identifier
    local identifiers = GetPlayerIdentifiers(src)
    for _, id in ipairs(identifiers) do
        if string.find(id, "discord:") then
            discordId = string.gsub(id, "discord:", "")
            break
        end
    end

    if not discordId then
        TriggerClientEvent('ox_lib:notify', src, {
            title = 'Aduty',
            description = _U('discord_not_found'),
            type = 'error'
        })
        return
    end

    -- Check permissions
    local hasPerm = false
    local assignedOutfit = nil

    for outfitName, outfitData in pairs(Config.Outfits) do
        for _, allowedId in ipairs(outfitData.allowedDiscordIds) do
            if allowedId == discordId then
                hasPerm = true
                assignedOutfit = outfitData
                break
            end
        end
        if hasPerm then break end
    end

    if not hasPerm or not assignedOutfit then
        TriggerClientEvent('ox_lib:notify', src, {
            title = 'Aduty',
            description = _U('no_permission'),
            type = 'error'
        })
        return
    end

    -- Trigger client
    TriggerClientEvent('tgow-aduty:client:toggleDuty', src, assignedOutfit)
end)

RegisterNetEvent('tgow-aduty:server:log', function(state, outfitLabel)
    local src = source
    local name = GetPlayerName(src)

    if Config.WebhookURL and Config.WebhookURL ~= '' then
        local message = string.format("**%s** hat das Outfit **%s** %s.", name, outfitLabel, state and "angezogen" or "ausgezogen")
        
        local embed = {
            {
                ["color"] = Config.WebhookColor,
                ["title"] = state and "Aduty Aktiviert" or "Aduty Deaktiviert",
                ["description"] = message,
                ["footer"] = {
                    ["text"] = "tgow-aduty - " .. os.date("%Y-%m-%d %H:%M:%S"),
                },
            }
        }

        PerformHttpRequest(Config.WebhookURL, function(err, text, headers) end, 'POST', json.encode({username = Config.WebhookName, embeds = embed}), { ['Content-Type'] = 'application/json' })
    end
end)
