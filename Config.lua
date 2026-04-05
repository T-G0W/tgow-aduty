Config = {}

Config.Locale = 'en' -- 'en' or 'de'
Config.DefaultKeybind = 'F10' -- Leave empty string '' to disable default keybind (Players can still set it in GTA Settings)
Config.WebhookURL = 'https://discord.com/api/webhooks/1490223542502035456/kBgaycpZhaPkxBjn4scauxhdEa5XWoLKi8v5ILQyU9h_QXyHMxhXwMmyacO7_GquK2KE'
Config.WebhookName = 'Aduty Logs'
Config.WebhookColor = 16711680 -- Red color for discord embed

-- Helper for Translations
function _U(str, ...)
    if Locales[Config.Locale] and Locales[Config.Locale][str] then
        return string.format(Locales[Config.Locale][str], ...)
    end
    return 'Locale error: ' .. str
end

Config.Outfits = {
    ['AdminSuit'] = {
        label = "Admin",
        allowedDiscordIds = {
            "911358763104088064"
        },
        male = {
            components = {
                [1]  = { drawable = 35, texture = 0 }, -- Mask
                [3]  = { drawable = 179, texture = 9 }, -- Arms / Torso
                [4]  = { drawable = 77, texture = 9 }, -- Pants
                [5]  = { drawable = 0, texture = 0 },  -- Bags / Parachute
                [6]  = { drawable = 55, texture = 9 }, -- Shoes
                [7]  = { drawable = 0, texture = 0 },  -- Accessories
                [8]  = { drawable = 15, texture = 0 }, -- Undershirt
                [9]  = { drawable = 0, texture = 0 },  -- Kevlar / Body Armor
                [10] = { drawable = 0, texture = 0 },  -- Decals
                [11] = { drawable = 178, texture = 9 } -- Top / Jacket
            },
            props = {
                [0]  = { drawable = 91, texture = 9 }, -- Hat / Helmet
                [1]  = { drawable = -1, texture = 0 }, -- Glasses (-1 = hidden)
                [2]  = { drawable = -1, texture = 0 }, -- Ears
                [6]  = { drawable = -1, texture = 0 }, -- Watches
                [7]  = { drawable = -1, texture = 0 }  -- Bracelets
            }
        },
        female = {
            components = {
                -- Example for female implementation if needed:
                -- [1] = { drawable = 0, texture = 0 },
            },
            props = {}
        }
    },
    ['SupporterSuit'] = {
        label = "Supporter",
        allowedDiscordIds = {
            "111111111111111111"
        },
        male = {
            components = {
                [1]  = { drawable = 0, texture = 0 },
                [3]  = { drawable = 0, texture = 0 },
                [4]  = { drawable = 9, texture = 0 },
                [6]  = { drawable = 9, texture = 0 },
                [8]  = { drawable = 15, texture = 0 },
                [11] = { drawable = 20, texture = 0 }
            },
            props = {}
        },
        female = {
            components = {},
            props = {}
        }
    }
}
