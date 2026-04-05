local isAduty = false
local oldAppearance = {
    components = {},
    props = {}
}

RegisterKeyMapping('aduty', 'Toggle Admin Duty', 'keyboard', Config.DefaultKeybind or '')

RegisterNetEvent('tgow-aduty:client:toggleDuty', function(outfitData)
    local ped = PlayerPedId()

    if not isAduty then
        -- Save current appearance
        for i = 0, 11 do
            oldAppearance.components[i] = {
                drawable = GetPedDrawableVariation(ped, i),
                texture = GetPedTextureVariation(ped, i),
                palette = GetPedPaletteVariation(ped, i)
            }
        end

        for i = 0, 8 do
            oldAppearance.props[i] = {
                drawable = GetPedPropIndex(ped, i),
                texture = GetPedPropTextureIndex(ped, i)
            }
        end

        -- Determine gender
        local model = GetEntityModel(ped)
        local outfit = nil
        if model == GetHashKey("mp_f_freemode_01") then
            outfit = outfitData.female
        else
            outfit = outfitData.male -- fallback to male for any other ped
        end

        -- Apply outfit components
        if outfit and outfit.components then
            for comp_id, comp in pairs(outfit.components) do
                SetPedComponentVariation(ped, tonumber(comp_id), comp.drawable, comp.texture or 0, 0)
            end
        end

        -- Apply outfit props
        if outfit and outfit.props then
            for prop_id, prop in pairs(outfit.props) do
                local p_id = tonumber(prop_id)
                if prop.drawable == -1 then
                    ClearPedProp(ped, p_id)
                else
                    SetPedPropIndex(ped, p_id, prop.drawable, prop.texture or 0, true)
                end
            end
        end

        isAduty = true
        TriggerServerEvent('tgow-aduty:server:log', true, outfitData.label)
        lib.notify({
            title = 'Aduty',
            description = _U('aduty_on', outfitData.label),
            type = 'success'
        })
    else
        -- Restore old appearance
        for compId, comp in pairs(oldAppearance.components) do
            SetPedComponentVariation(ped, compId, comp.drawable, comp.texture, comp.palette)
        end

        for propId, prop in pairs(oldAppearance.props) do
            if prop.drawable == -1 then
                ClearPedProp(ped, propId)
            else
                SetPedPropIndex(ped, propId, prop.drawable, prop.texture, true)
            end
        end

        isAduty = false
        TriggerServerEvent('tgow-aduty:server:log', false, outfitData.label)
        lib.notify({
            title = 'Aduty',
            description = _U('aduty_off'),
            type = 'info'
        })
    end
end)
