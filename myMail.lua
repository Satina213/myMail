if not myMailDB then
    local myMailDB = {}
end
professions = {
    ["TAILORING"] = {["professionID"] = 6,
                    ["characters"] = {}},
    ["ENCHANTING"] = {["professionID"] = 7,
                    ["characters"] = {}},
    ["HERBALISM"] = {["professionID"] = 6,
                    ["characters"] = {}},
    ["ALCHEMY"] = {["professionID"] = 6,
                    ["characters"] = {}},
    ["MINING"] = {["professionID"] = 6,
                    ["characters"] = {}},
    ["BLACKSMITHING"] = {["professionID"] = 6,
                    ["characters"] = {}},
    ["JEWELCRAFTING"] = {["professionID"] = 6,
                    ["characters"] = {}},
    ["SKINNING"] = {["professionID"] = 7,
                    ["characters"] = {}},
    ["LEATHERWORKING"] = {["professionID"] = 5,
                    ["characters"] = {}},
    ["COOKING"] = {["professionID"] = 6,
                    ["characters"] = {}}
}
print(GetProfessions())
for i in GetProfessions() do
    if i then
        print(GetProfessionInfo(i))
    end
end
print(GetProfessionInfo(GetProfessions()))
local mainFrame = CreateFrame("Frame", "myMailMainFrame", UIParent, "BasicFrameTemplateWithInset")
mainFrame:SetSize(500,350)
mainFrame:SetPoint("CENTER", UIParent, "CENTER", 0, 0)
mainFrame.TitleBg:SetHeight(30)
mainFrame.title = mainFrame:CreateFontString(nil, "OVERLAY", "GameFontHighlight")
mainFrame.title:SetPoint("TOPLEFT", mainFrame.TitleBg, "TOPLEFT", 5, -3)
mainFrame.title:SetText("myMail")
mainFrame:EnableMouse(true)
mainFrame:SetMovable(true)
mainFrame:RegisterForDrag("LeftButton")
mainFrame:SetScript("OnDragStart", function(self)
    self:StartMoving()
end)
mainFrame:SetScript("OnDragStop", function(self)
    self:StopMovingOrSizing()
end)
mainFrame:SetScript("OnShow", function()
    PlaySound(808)
    -- magic number
end)
mainFrame:SetScript("OnHide", function()
    PlaySound(808)
    -- same magic number
end)

-- SLASH COMMANDS
SLASH_OPENMAIN1 = "/mym"
SLASH_OPENMAIN2 = "/mymail"
SlashCmdList["OPENMAIN"] = function()
    if mainFrame:IsShown() then
        mainFrame:Hide()
    else
        mainFrame:Show()
    end
end


-- this code adds the mainframe to a table of frames that let esc be used
table.insert(UISpecialFrames, "myMailMainFrame")

print("myMail loaded")