-- BASE For f1
local PANEL = {}




function PANEL:Init()

    self:SetSize(ScrW(), ScrH())
    self:Center()
    self:SetVisible(false)

    self:SetSkin(dahveysf1.config.DermaSkin)

    -- Base Panel
    self.BasePanel = vgui.Create("DPanel", self)
    self.BasePanel:SetSize(ScrW() * 0.8, ScrH() * 0.8)
    self.BasePanel:Center()
    
    -- Header Panel
    self.HeadPanel = vgui.Create("DPanel", self.BasePanel)
    self.HeadPanel:SetSize(ScrW() * 0.8, 80)
    self.HeadPanel:SetPos(0, 0)
    self.HeadPanel:Dock(TOP)
    self.HeadPanel:SetBackgroundColor(dahveysf1.config.HeaderBgColour)

    -- Header Text
    self.HeadText = vgui.Create("DLabel", self.HeadPanel)
    self.HeadText:SetText(GetHostName())
    self.HeadText:SetPos(0, 0)
    self.HeadText:SetSize(ScrW() * 0.8, 20)
    self.HeadText:SetFont("gmaterialName")
    self.HeadText:DockMargin(20, 30, 0, 30)
    self.HeadText:Dock(LEFT)
    
    -- Close Button
    self.CloseButton = vgui.Create("DButton", self.HeadPanel)
    self.CloseButton:SetText("")
    self.CloseButton:SetSize(40, 40)
    self.CloseButton:SetPos(0, 0)
    self.CloseButton:DockMargin(20, 20, 20, 20)
    self.CloseButton:Dock(RIGHT)
    self.CloseButton.Paint = function(this, w, h)
    end
    self.CloseButton.DoClick = function()
        DarkRP.closeF1Menu()
    end

    self.CloseImage = vgui.Create("DImage", self.CloseButton)
	self.CloseImage:SetSize(25, 25)
	self.CloseImage:Center()
	self.CloseImage:SetImage("vgui/gmaterial/close")

end

function PANEL:Paint()

    local w, h = self:GetSize()
    draw.RoundedBox(0, 0, 0, w, h, dahveysf1.config.BgColour)
    
end


vgui.Register("dahveys_f1menu", PANEL)
