local WebUI

AddEvent("OnPackageStart", function()
    WebUI = CreateWebUI(0.0, 0.0, 0.0, 0.0, 1, 60)
    SetWebAnchors(WebUI, 0.0, 0.0, 1.0, 1.0)
    LoadWebFile(WebUI, 'http://asset/' .. GetPackageName() .. '/ui/index.html')
    SetWebVisibility(WebUI, WEB_HIDDEN)
end)

AddEvent("OnKeyPress", function(key)
    if key == "F4" then
        if GetWebVisibility(WebUI) == WEB_HIDDEN then	
            SetWebVisibility(WebUI, WEB_VISIBLE)
            SetInputMode(INPUT_UI)
        else
            SetWebVisibility(WebUI, WEB_HIDDEN)
            SetInputMode(INPUT_GAME)
        end
    end
end)

AddEvent("ingame_editor:RunClient", function(code)
    if code == "" then return end
    loadstring(code)()
end)

AddEvent("ingame_editor:RunServer", function(code)
    if code == "" then return end
    CallRemoteEvent("ingame_editor:RunServer", code)
end)