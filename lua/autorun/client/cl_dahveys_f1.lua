-- Load Clientside

hook.Add("OnGamemodeLoaded", "dahveysf1_gamemodeloaded_wait", function()
    include("dahveysf1/cl_f1menu_init.lua")
end)
