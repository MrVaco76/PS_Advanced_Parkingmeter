function ExtractIdentifiers(playerId)
    local identifiers = {}

    for i = 0, GetNumPlayerIdentifiers(playerId) - 1 do
        local id = GetPlayerIdentifier(playerId, i)

        if string.find(id, "steam:") then
            identifiers['steam'] = id
        elseif string.find(id, "discord:") then
            identifiers['discord'] = id
        elseif string.find(id, "license:") then
            identifiers['license'] = id
        elseif string.find(id, "license2:") then
            identifiers['license2'] = id
        end
    end

    return identifiers
end




function DiscordWebhook(color, name, message, footer)
    local embed = {
          {
              ["color"] = color,
				["author"] = {
					["icon_url"] = Config.IconURL,
					["name"] = Config.ServerName,
				},
              ["title"] = "**".. name .."**",
              ["description"] ="**" .. message .."**",
              ["footer"] = {
                  ["text"] = os.date('%d/%m/%Y [%X]'),
              },
          }
      }

    PerformHttpRequest('PUT HERE YOUR DC WEBHOOK', function(err, text, headers) end, 'POST', json.encode({username = Config.BotName, embeds = embed}), { ['Content-Type'] = 'application/json' })
  end