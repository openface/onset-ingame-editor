AddEvent("OnPackageStart", function()
    print "*********************************************"
    print " WARNING: Ingame editor package is running!  "
    print " DO NOT RUN THIS PACKAGE ON A PUBLIC SERVER! "
    print "*********************************************"
end)

AddRemoteEvent("ingame_editor:RunServer", function(player, code)
    if code == "" then return end

    -- make the player available
    _G['player'] = player
    load(code)()
end)

