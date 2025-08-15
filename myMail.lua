if not myMailDB then
myMailDB = {}
end
professionList = {"Alchemy", "Blacksmithing", "Enchanting", "Engineering", "Herbalism", "Inscription", "Jewelcrafting", "Leatherworking", "Mining", "Skinning", "Tailoring", "Cooking", "Fishing", "First-aid"}
local player = UnitName("PLAYER")
local mainFrame = CreateFrame("FRAME", "myMailMainFrame", UIParent, "BasicFrameTemplateWithInset")
mainFrame:SetSize(700, 500)
mainFrame:SetPoint("CENTER", UIParent, "CENTER", 0, 0)
mainFrame.TitleBg:SetHeight(30)
mainFrame.title = mainFrame:CreateFontString(nil, "OVERLAY", "GameFontHighlight")
mainFrame.title:SetPoint("TOPLEFT", mainFrame.TitleBg, "TOPLEFT", 5, -3)
mainFrame.title:SetText("myMail Main Frame!")
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
end)
mainFrame:SetScript("OnHide", function()
    PlaySound(808)
end)
local yOffSet = -30
local yJump = 30

local f = CreateFrame("Frame")
local function eventHandler(self, event, ...)
    if event == "PLAYER_LOGIN" then
        local primary, secondary = GetProfessions()
        if primary then
            local primary, _, primarySkill = GetProfessionInfo(primary)    
            primary = string.upper(primary)
            myMailDB[primary] = myMailDB[primary] or {}
            myMailDB[primary][player] = primarySkill    
        end
        if secondary then
            local secondary, _, secondarySkill = GetProfessionInfo(secondary)
            secondary = string.upper(secondary)
            myMailDB[secondary] = myMailDB[secondary] or {}
            myMailDB[secondary][player] = secondarySkill    
        end
        mainFrame.lines = {}
        for _, prof in ipairs(professionList) do
            -- for _, char in pairs(myMailDB[prof] or {}) do
            --     mainFrame.prof = mainFrame.prof or {}
                

            -- end
            local line = mainFrame:CreateFontString(nil, "OVERLAY", "GameFontHighlight")
            line:SetPoint("TOPLEFT", mainFrame, "TOPLEFT", 15, yOffSet)
            prof = string.upper(prof)
            line:SetText(prof)
            yOffSet = yOffSet - yJump
            table.insert(mainFrame.lines, line)
        end
        print("mymail event handler ran")
    end
end
f:SetScript("OnEvent", eventHandler)
f:RegisterEvent("PLAYER_LOGIN")

SLASH_RESET1 = "/mmreset"
SlashCmdList["RESET"] = function()
    myMailDB = {}
    print("You must reload now")
end

print("My Mail Loaded")