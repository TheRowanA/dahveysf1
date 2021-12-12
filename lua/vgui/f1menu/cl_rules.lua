local PANEL = {}

function PANEL:Init()

    -- Rules Base
    self:SetSize(ScrW() * 0.8, ScrH() * 0.8)
    self:DockMargin(5, 5, 5, 5)
    self:Dock(FILL)
    self:SetVisible(true)
    self.Paint = function (self, w, h)
		draw.RoundedBoxEx( 4, 0, 0, w, h, dahveysf1.config.HeaderBgColour, false, false, false , false )
	end

    -- Loading Text
    self.LoadText = vgui.Create("DLabel", self)
    self.LoadText:SetText("LOADING >>>...<<<")
    self.LoadText:CenterHorizontal(0.45)
    self.LoadText:CenterVertical(0.45)
    self.LoadText:SetSize(ScrW() * 0.8, 35)
    self.LoadText:SetFont("gmaterialName")

    -- HTML Panel
    self.HTML = vgui.Create("DHTML", self)
    self.HTML:Dock(TOP)
    self.HTML:SetSize(ScrW() * 0.8, ScrH() * 0.8)
    self.HTML:SetPos(0, 0)
    self.HTML:OpenURL(dahveysf1.config.rulesURL)

end

vgui.Register("dahveys_f1menu_rules", PANEL)
