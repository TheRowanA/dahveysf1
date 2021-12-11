include("cl_config.lua")
include("vgui/f1menu/cl_base.lua")

function DarkRP.openF1Menu()

    if f1Panel then

        f1Panel:Remove()
        f1Panel = nil
        
    end

    f1Panel = vgui.Create("dahveys_f1menu")
    f1Panel:SetVisible(true)
    gui.EnableScreenClicker(true)

end

function DarkRP.closeF1Menu()

    if f1Panel then

        f1Panel:Remove()
        f1Panel = nil
        gui.EnableScreenClicker(false)

    end

end