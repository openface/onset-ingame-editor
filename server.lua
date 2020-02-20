AddRemoteEvent("ingame_editor:RunServer", function(player, code)
    if code == "" then return end

    -- make the player available
    _G['player'] = player
    load(code)()
end)

