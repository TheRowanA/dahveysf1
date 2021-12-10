-- BASE For f1

local PANEL = {}




function PANEL:Init()

    self:SetSize(ScrW(), ScrH())
    self:Center()
    --self:SetBackgroundColor(Color(0,0,0,220))
    self:SetVisible(false)

    self:SetSkin("Dahveyflat") -- MOVE THIS TO A CONFIG FILE

    self.BasePanel = vgui.Create("DPanel", self)
    self.BasePanel:SetSize(1280, 720)
    self.BasePanel:Center()
    self.BasePanel:SetText("Meh")
    
    --self.alpha = 0
    --self.alphaBackground = 0
    
end

function PANEL:Paint()

    local w, h = self:GetSize()
    draw.RoundedBox(0, 0, 0, w, h, Color(0,0,0,166))
    
end


vgui.Register("dahveys_f1menu", PANEL)
