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

function try(f, catch_f)
    local status, exception = pcall(f)
    if not status then
        catch_f(exception)
    end
end

AddEvent("ingame_editor:RunClient", function(code)
    if code == "" then return end
    print(code)
--    try(function()
        loadstring(code)()
--        ExecuteWebJS(WebUI, "SetError()")
--    end, function(err)
--        print("ERROR: "..err)
--        ExecuteWebJS(WebUI, "SetError('"..err.."')")
--    end)
end)
