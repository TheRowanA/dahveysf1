-- BASE For f1
local PANEL = {}

include("vgui/f1menu/cl_rules.lua")


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

    -- Side Panel
    self.SidePanel = vgui.Create("DPanel", self.BasePanel)
    self.SidePanel:SetSize(100, ScrH() * 0.8)
    self.SidePanel:SetPos(0, 0)
    self.SidePanel:Dock(LEFT)
    self.SidePanel:SetBackgroundColor(dahveysf1.config.SideBgColour)

    -- Tabs Buttons
    local tabPreCount, tabCount = 0, 0

    for i = 0, 9 do

        for k, v in pairs(dahveysf1.tabs, false) do

            if v.enable then
                continue
            end

            if (i != v.order) then
                continue
            end

            local currentTab = tabCount

            -- Buttons
            self.TabButton = vgui.Create("DButton", self.SidePanel)
            self.TabButton:SetText("")
            self.TabButton:SetSize(97, 35)
            self.TabButton:SetPos(0, 0)
            self.TabButton:Dock(TOP)
            self.TabButton:DockMargin(4, 4, 4, 4)
            self.TabButton.Paint = function (this , w, h)
                
                draw.RoundedBox(0, 0, 0, 97, 35, dahveysf1.config.ButtonColour)
				draw.DrawText( string.upper(dahveysf1.lang[k]), "gmaterialHeader", 48, 10, gmaterial.color.headerText, TEXT_ALIGN_CENTER)

			end
            self.TabButton.DoClick = function()

                tabPreCount, dahveysf1.currentTab = dahveysf1.currentTab, currentTab

            end

            tabCount = tabCount + 1

        end

    end

    self:HideShow(dahveysf1.currentTab)

end

function PANEL:Paint()

    local w, h = self:GetSize()
    draw.RoundedBox(0, 0, 0, w, h, dahveysf1.config.BgColour)
    
end

function PANEL:reset()
    
    dahveysf1.currentTab = 0
    
end

function PANEL:HideShow(panel)

    if self.TabPanel then
        self.TabPanel:Remove()
    end

    if panel == 0 then
        self.TabPanel = vgui.Create("dahveys_f1menu_rules", self.BasePanel)
    end
    
end


vgui.Register("dahveys_f1menu", PANEL)
