--[[
this script looks like ai slop so no one would care about it
.---.                  .---.                            
|   |                  |   |      __.....__             
|   |                  |   |  .-''         '.           
|   |    .-''` ''-.    |   | /     .-''"'-.  `. .-,.--. 
|   |  .'          '.  |   |/     /________\   \|  .-. |
|   | /              ` |   ||                  || |  | |
|   |'                '|   |\    .-------------'| |  | |
|   ||         .-.    ||   | \    '-.____...---.| |  '- 
|   |.        |   |   .|   |  `.             .' | |     
'---' .       '._.'  / '---'    `''-...... -'   | |     
       '._         .'                           |_|     
          '-....-'`                                     
--]]
local coreGui = game:GetService("CoreGui")
local players = game:GetService("Players")
local runService = game:GetService("RunService")
local userInputService = game:GetService("UserInputService")
local workspaceService = game:GetService("Workspace")
local replicatedStorage = game:GetService("ReplicatedStorage")
local collectionService = game:GetService("CollectionService")
local soundService = game:GetService("SoundService")
local tweenService = game:GetService("TweenService")
local lighting = game:GetService("Lighting")
-- these loadstring's down here and not obfuscated so i dont putted them in my repo if you want you can do it myself
local fluentModded = loadstring(game:HttpGet("https://github.com/StyearX/Fluent-Modded/releases/download/1.6.0/main.lua"))()
local interfaceManager = loadstring(game:HttpGet("https://raw.githubusercontent.com/dawid-scripts/Fluent/master/Addons/InterfaceManager.lua"))()
local saveManager = loadstring(game:HttpGet("https://raw.githubusercontent.com/dawid-scripts/Fluent/master/Addons/SaveManager.lua"))()

local function f1(p1, p2)
  local ok, result = pcall(function()
    if makefolder and isfolder and not isfolder("MalamSamaNenek") then
      makefolder("MalamSamaNenek")
    end

    local v1 = "MalamSamaNenek/" .. p2
    local httpGet = game:HttpGet(p1, true)

    if not httpGet or #httpGet < 500 then
      error("data kosong / gagal unduh")
    end

    writefile(v1, httpGet)
    return getcustomasset(v1)
  end)

  if ok and result then
    return result
  end

  warn("[MalamSamaNenek] gagal memuat " .. p2 .. ": " .. tostring(result))
  return nil
end

local v2 = f1("https://files.catbox.moe/j5nukf.jpg", "icon.jpg")
local v3 = f1("https://files.catbox.moe/gkrpsv.jpg", "background.jpg")
local v4 = v2 ~= nil
local v5 = v3 ~= nil
local v6 = v2 or "rbxassetid://109639117875913"
local localPlayer = players.LocalPlayer

local touchEnabled = userInputService.TouchEnabled and not userInputService.MouseEnabled
  and not userInputService.KeyboardEnabled

local function f2(title, content, subContent, image, p3)
  fluentModded:Notify({
    Title = title,
    Content = content,
    SubContent = subContent,
    Image = image,
    Duration = p3 or 3,
  })
end

local v7 = {
  Dark = "rbxassetid://112989097449975",
  Charcoal = "rbxassetid://100096489709504",
  ["Pearl White"] = "rbxassetid://91320093440746",
  ["Blood Red"] = "rbxassetid://82205615960902",
  ["Neon Purple"] = "rbxassetid://122136578005735",
  ["Deep Ocean"] = "rbxassetid://125419002163537",
  ["Midnight Blue"] = "rbxassetid://117942410949253",
  ["Royal Blue"] = "rbxassetid://102100010369948",
  ["Deep Violet"] = "rbxassetid://78622715445158",
  Rose = "rbxassetid://123035916719169",
  ["Neon Cyber"] = "rbxassetid://121871712581976",
  ["Arctic Frost"] = "rbxassetid://133933491104820",
  ["Cotton Candy"] = "rbxassetid://128869678908856",
  Cyanic = "rbxassetid://78285794098636",
  ["Amber Glow"] = "rbxassetid://81215128277340",
  Bloomings = "rbxassetid://138908725318095",
  Crimson = "rbxassetid://73057086743861",
  Gold = "rbxassetid://100401168268376",
  ["Lavender Pink"] = "rbxassetid://126095928220634",
}

local nenekMinimizerUI = Instance.new("ScreenGui")
nenekMinimizerUI.Name = "NenekMinimizerUI"
nenekMinimizerUI.Parent = coreGui
nenekMinimizerUI.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
nenekMinimizerUI.ResetOnSpawn = false
nenekMinimizerUI.DisplayOrder = 999

local mainOpen = Instance.new("TextButton")
mainOpen.Name = "MainOpen"
mainOpen.Parent = nenekMinimizerUI
mainOpen.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
mainOpen.BackgroundTransparency = 1
mainOpen.Position = UDim2.new(0.1, 0, 0.11, 0)
mainOpen.Size = UDim2.new(0, 64, 0, 64)
mainOpen.Text = ""
mainOpen.Visible = true

Instance.new("UICorner").Parent = mainOpen

local rotatingBackground = Instance.new("ImageLabel")
rotatingBackground.Name = "RotatingBackground"
rotatingBackground.Parent = mainOpen
rotatingBackground.Size = UDim2.new(2.7, 0, 2.7, 0)
rotatingBackground.Position = UDim2.new(0.5, 0, 0.5, 0)
rotatingBackground.AnchorPoint = Vector2.new(0.5, 0.5)
rotatingBackground.BackgroundTransparency = 1
rotatingBackground.Image = ""
rotatingBackground.SizeConstraint = Enum.SizeConstraint.RelativeXX
rotatingBackground.ZIndex = 0

local staticIcon = Instance.new("ImageLabel")
staticIcon.Name = "StaticIcon"
staticIcon.Parent = mainOpen
staticIcon.Size = UDim2.new(1, 0, 1.2, 0)
staticIcon.Position = UDim2.new(0.5, 0, 0.5, 0)
staticIcon.AnchorPoint = Vector2.new(0.5, 0.5)
staticIcon.BackgroundTransparency = 1
staticIcon.Image = v6
staticIcon.ZIndex = 1

local uiCorner = Instance.new("UICorner")
uiCorner.CornerRadius = UDim.new(1, 0)
uiCorner.Parent = staticIcon

local v8 = tick()
local rotation = 0
local v9 = v8

task.spawn(function()
  while true do
    local v10 = tick()
    local v11 = v9
    v9 = v10
    rotation = (rotation + 90 * (v10 - v11)) % 360
    rotatingBackground.Rotation = rotation
    task.wait()
  end
end)

local function f3(theme)
  rotatingBackground.Image = v7[theme] or ""
end

local v12

task.spawn(function()
  while true do
    task.wait(0.1)

    if fluentModded and fluentModded.Theme then
      local theme2 = fluentModded.Theme

      if theme2 ~= v12 then
        v12 = theme2
        f3(theme2)
      end
    end
  end
end)

local function f4(mainOpen2, mainOpen3)
  local flag = false
  local flag2 = false
  local count = 0
  mainOpen3:SetAttribute("Locked", false)
  local position, position2

  local function f5(input)
    if mainOpen3:GetAttribute("Locked") then
      return
    end

    local v13 = input.Position - position

    mainOpen3.Position = UDim2.new(
      position2.X.Scale, position2.X.Offset + v13.X, position2.Y.Scale,
      position2.Y.Offset + v13.Y
    )
  end

  local function f6()
    local v14 = not mainOpen3:GetAttribute("Locked")
    mainOpen3:SetAttribute("Locked", v14)

    f2(
      v14 and "Button Locked" or "Button Unlocked",
      v14 and "Tombol terkunci." or "Tombol bisa digeser.", "Info", nil, 2
    )
  end

  mainOpen2.InputBegan:Connect(function(input2)
    if input2.UserInputType ~= Enum.UserInputType.MouseButton1
      and input2.UserInputType ~= Enum.UserInputType.Touch then
      return
    end

    flag = not mainOpen3:GetAttribute("Locked")
    flag2 = true
    position = input2.Position
    position2 = mainOpen3.Position
    count = count + 1
    local v15 = count

    task.delay(1, function()
      if flag2 and v15 == count then
        f6()
      end
    end)

    input2.Changed:Connect(function()
      if input2.UserInputState == Enum.UserInputState.End then
        flag = false
        flag2 = false
      end
    end)
  end)

  local v16

  mainOpen2.InputChanged:Connect(function(input3)
    if not position then
      return
    end

    if input3.UserInputType == Enum.UserInputType.MouseMovement
      or input3.UserInputType == Enum.UserInputType.Touch then
      if (input3.Position - position).Magnitude > 6 then
        flag2 = false
        v16 = input3
      end
    end
  end)

  userInputService.InputChanged:Connect(function(input4)
    if v16 and input4 == v16 and flag then
      f5(input4)
    end
  end)
end

f4(mainOpen, mainOpen)

local udim = UDim2.fromOffset(64, 64)
local udim2 = UDim2.new(0.1, 0, 0.11, 0)

fluentModded:CreateMinimizer({
  Icon = v6,
  Size = udim,
  Position = udim2,
  Corner = 12,
  BackgroundTransparency = 1,
  IconCorner = 6,
  Transparency = 0,
  Lockable = true,
  LockHoldTime = 1,
  Draggable = true,
}).Visible = true

local colorSequence = ColorSequence.new(Color3.fromHex("#191919"), Color3.fromHex("#0a0a0a"))
local background = v3 or ""

local colorSequence2 = ColorSequence.new({
  ColorSequenceKeypoint.new(0, Color3.fromHex("#1e1e1e")),
  ColorSequenceKeypoint.new(0.5, Color3.fromHex("#503296")),
  ColorSequenceKeypoint.new(1, Color3.fromHex("#1e1e1e")),
})

local color = Color3.fromHex("#3c1e78")

local colorSequence3 = ColorSequence.new({
  ColorSequenceKeypoint.new(0, Color3.fromHex("#191919")),
  ColorSequenceKeypoint.new(1, Color3.fromHex("#503296")),
})

local colorSequence4 = ColorSequence.new({
  ColorSequenceKeypoint.new(0, Color3.fromHex("#0f0f0f")),
  ColorSequenceKeypoint.new(0.5, Color3.fromHex("#3c1e78")),
  ColorSequenceKeypoint.new(1, Color3.fromHex("#0f0f0f")),
})

fluentModded:AddTheme({
  Name = "Nenek Violet",
  Accent = "#7850c8",
  AcrylicMain = "#141414",
  AcrylicBorder = "#0f0f0f",
  AcrylicGradient = colorSequence,
  AcrylicNoise = 0.9,
  TitleBarLine = "#6433b4",
  Tab = "#8256d2",
  Element = "#6e46be",
  ElementBorder = "#5a32aa",
  InElementBorder = "#8c64dc",
  ElementTransparency = 0.9,
  ElementBorderThickness = 0.5,
  ToggleSlider = "#6433b4",
  ToggleToggled = "#966ee6",
  SliderRail = "#502890",
  CheckboxUnchecked = "#5a32aa",
  CheckboxChecked = "#8c64dc",
  CheckboxCheck = "#c8aaff",
  ProgressBarRail = "#461e96",
  ProgressBarFill = "#a078f0",
  DropdownFrame = "#6433b4",
  DropdownHolder = "#6e46be",
  DropdownBorder = "#502890",
  DropdownOption = "#7850c8",
  Keybind = "#8256d2",
  Input = "#6433b4",
  InputFocused = "#966ee6",
  InputIndicator = "#aa82fa",
  Dialog = "#6e46be",
  DialogHolder = "#8256d2",
  DialogHolderLine = "#5a32aa",
  DialogButton = "#8c64dc",
  DialogButtonBorder = "#502890",
  DialogBorder = "#7850c8",
  DialogInput = "#6433b4",
  DialogInputLine = "#966ee6",
  Text = "#dcc8ff",
  SubText = "#b4a0dc",
  Hover = "#a078f0",
  HoverChange = 0.5,
  Background = background,
  BackgroundTransparency = v3 and 0 or 1,
  ShineEnabled = true,
  Shine = { Speed = 2.5, RotationSpeed = 1, ColorSequence = colorSequence2 },
  StrokeShine = true,
  StrokeDark = color,
  ButtonGradient = { Background = colorSequence3, Stroke = colorSequence4 },
  WarningNotifyColor = "#b478ff",
  SuccessNotifyColor = "#a0c8ff",
  ErrorNotifyColor = "#c864c8",
  InfoNotifyColor = "#8c64dc",
})

local window = fluentModded:CreateWindow({
  Title = "MALAM SAMA NENEK",
  SubTitle = "Made by: XYNZ",
  TabWidth = touchEnabled and 130 or 150,
  Acrylic = true,
  Size = touchEnabled and UDim2.fromOffset(560, 560) or UDim2.fromOffset(640, 600),
  Theme = "Nenek Violet",
  Background = true,
  Tags = {
    { Text = "Unknown", Color = Color3.fromRGB(150, 110, 230) },
    { Text = "Hello " .. tostring(localPlayer.DisplayName), Color = Color3.fromRGB(0, 0, 0) },
  },
  TitleIcon = v6,
  Search = { Search = true, Highlight = true, HighlightColor = Color3.fromRGB(120, 80, 200) },
  UserInfo = {
    UserInfo = true,
    UserInfoTitle = localPlayer.Name,
    UserInfoSubtitle = localPlayer.DisplayName,
    UserInfoColor = Color3.fromRGB(120, 80, 200),
  },
  FolderName = "MalamSamaNenek",
  ScreenGuiName = "MalamSamaNenek",
})

local v17 = {
  Esp = window:AddTab({ Title = "ESP", Icon = "eye" }),
  Auto = window:AddTab({ Title = "Auto Win", Icon = "key" }),
  Player = window:AddTab({ Title = "Player", Icon = "user" }),
  Coin = window:AddTab({ Title = "Coin", Icon = "coins" }),
  Visual = window:AddTab({ Title = "Visual", Icon = "sun" }),
  Weapon = window:AddTab({ Title = "Weapon", Icon = "swords" }),
  Patch = window:AddTab({ Title = "Patch", Icon = "wrench" }),
  Settings = window:AddTab({ Title = "Settings", Icon = "settings" }),
}

local mouseButton1Click = mainOpen.MouseButton1Click
local connect = mouseButton1Click.Connect

local function f7(instance)
  for _, value in ipairs(instance:GetDescendants()) do
    if value:IsA("ProximityPrompt") then
      value.HoldDuration = 0
      value.RequiresLineOfSight = false
      pcall(fireproximityprompt, value)
    elseif value:IsA("ClickDetector") then
      pcall(fireclickdetector, value)
    end
  end
end

connect(mouseButton1Click, function()
  for _, value2 in ipairs({ coreGui, localPlayer:FindFirstChildOfClass("PlayerGui") }) do
    if value2 then
      local malamSamaNenek = value2:FindFirstChild("MalamSamaNenek")

      if malamSamaNenek and malamSamaNenek:IsA("ScreenGui") then
        malamSamaNenek.Enabled = not malamSamaNenek.Enabled
        return
      end
    end
  end
end)

local function getHumanoidRootPart()
  return (localPlayer.Character or localPlayer.CharacterAdded:Wait()):WaitForChild("HumanoidRootPart")
end

local function f8(waitForChild)
  local humanoidRootPart = getHumanoidRootPart()
  local getPivot

  if waitForChild:IsA("Model") then
    getPivot = waitForChild:GetPivot()
  elseif waitForChild:IsA("BasePart") then
    getPivot = waitForChild.CFrame
  end

  if getPivot then
    humanoidRootPart.CFrame = getPivot + Vector3.new(0, 3, 0)
  end
end

local color2 = Color3.fromRGB(0, 200, 255)
local color3 = Color3.fromRGB(255, 255, 0)
local color4 = Color3.fromRGB(0, 255, 120)
local color5 = Color3.fromRGB(255, 140, 0)
local color6 = Color3.fromRGB(255, 120, 200)

local function f9(instance2)
  if instance2:IsA("BasePart") then
    return instance2
  end

  return instance2.PrimaryPart or instance2:FindFirstChildWhichIsA("BasePart", true)
end

local map = {}

local function f10(instance3)
  if not instance3 then
    return
  end

  local getDescendants = instance3:GetDescendants()
  table.insert(getDescendants, instance3)

  for _, value3 in ipairs(getDescendants) do
    if value3.Name:find("^_NenekESP") then
      map[value3] = nil
      value3:Destroy()
    end
  end
end

local function makeTextLabel(instance4, color7, base)
  local nenekESPHL = instance4:FindFirstChild("_NenekESP_HL")

  if not nenekESPHL then
    nenekESPHL = Instance.new("Highlight")
    nenekESPHL.Name = "_NenekESP_HL"
    nenekESPHL.Adornee = instance4
    nenekESPHL.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
    nenekESPHL.FillTransparency = 0.5
    nenekESPHL.OutlineTransparency = 0
    nenekESPHL.Parent = instance4
  end

  nenekESPHL.Enabled = true
  nenekESPHL.FillColor = color7
  nenekESPHL.OutlineColor = color7

  local instance5 = f9(instance4)

  if instance5 then
    local nenekESPBB = instance5:FindFirstChild("_NenekESP_BB")

    if not nenekESPBB then
      nenekESPBB = Instance.new("BillboardGui")
      nenekESPBB.Name = "_NenekESP_BB"
      nenekESPBB.Adornee = instance5
      nenekESPBB.AlwaysOnTop = true
      nenekESPBB.MaxDistance = math.huge
      nenekESPBB.LightInfluence = 0
      nenekESPBB.Size = UDim2.fromOffset(150, 36)
      nenekESPBB.StudsOffsetWorldSpace = Vector3.new(0, 3, 0)

      local label = Instance.new("TextLabel")
      label.Name = "Label"
      label.BackgroundTransparency = 1
      label.Size = UDim2.fromScale(1, 1)
      label.Font = Enum.Font.GothamBold
      label.TextSize = 14
      label.TextStrokeTransparency = 0
      label.TextStrokeColor3 = Color3.new(0, 0, 0)
      label.Parent = nenekESPBB

      nenekESPBB.Parent = instance5
    end

    nenekESPBB.Label.TextColor3 = color7
    map[nenekESPBB] = { part = instance5, base = base }
  end
end

task.spawn(function()
  while task.wait(0.2) do
    local currentCamera = workspaceService.CurrentCamera

    if currentCamera then
      local position3 = currentCamera.CFrame.Position

      for key, value4 in pairs(map) do
        if key.Parent and value4.part.Parent then
          key.Label.Text = string.format(
            "%s\n[%d m]", value4.base, (value4.part.Position - position3).Magnitude
          )
        else
          map[key] = nil
        end
      end
    end
  end
end)

local function f11(name, p4)
  return string.find(string.lower(name), p4, 1, true) ~= nil
end

local map2 = {
  Key = {
    on = false,
    root = function() return workspaceService:FindFirstChild("PuzzleItems") end,
    scan = function(instance6)
      for _, value5 in ipairs(instance6:GetChildren()) do
        if value5:IsA("Model") then
          if value5.Name == "Key" then
            makeTextLabel(value5, color2, "Key")
          elseif value5.Name == "PasscodeNote" then
            makeTextLabel(value5, color3, "Passcode")
          end
        end
      end
    end,
  },
  FlipFlop = {
    on = false,
    root = function() return workspaceService:FindFirstChild("FlipFlops") end,
    scan = function(instance7)
      for _, value6 in ipairs(instance7:GetChildren()) do
        if value6:IsA("Model") then
          makeTextLabel(value6, color4, "FlipFlop")
        end
      end
    end,
  },
  Opah = {
    on = false,
    root = function() return workspaceService:FindFirstChild("Opah") end,
    scan = function(instance8)
      if instance8:IsA("Model") or instance8:IsA("BasePart") then
        makeTextLabel(instance8, color5, "Opah")
      else
        for _, value7 in ipairs(instance8:GetChildren()) do
          if value7:IsA("Model") or value7:IsA("BasePart") then
            makeTextLabel(value7, color5, "Opah")
          end
        end
      end
    end,
  },
  Planks = {
    on = false,
    root = function() return workspaceService end,
    scan = function()
      local function f12()
        local list = {}

        for _, value8 in ipairs(workspaceService:GetDescendants()) do
          if (value8:IsA("Folder") or value8:IsA("Model")) and value8.Name:lower() == "planks" then
            for _, value9 in ipairs(value8:GetChildren()) do
              if value9:IsA("Model") or value9:IsA("BasePart") then
                table.insert(list, value9)
              end
            end
          end
        end

        return list
      end

      for _, value10 in ipairs(f12()) do
        makeTextLabel(value10, color6, "Plank")
      end
    end,
  },
}

local function f13(key2, on)
  map2[key2].on = on

  if not on then
    f10(map2[key2].root())
  end
end

task.spawn(function()
  while task.wait(0.25) do
    for _, value11 in pairs(map2) do
      if value11.on then
        local v18 = value11.root()

        if v18 then
          pcall(value11.scan, v18)
        end
      end
    end
  end
end)

local addSection = v17.Esp:AddSection("ESP Highlight", "solar/eye-bold")

addSection:AddToggle("EspKey", {
  Title = "Esp Key",
  Description = "Highlight dan nama Key & Passcode",
  Default = false,
  Callback = function(value12) f13("Key", value12) end,
})

addSection:AddToggle("EspFlipFlop", {
  Title = "Esp FlipFlop",
  Description = "Highlight dan nama FlipFlop",
  Default = false,
  Callback = function(value13) f13("FlipFlop", value13) end,
})

addSection:AddToggle("EspOpah", {
  Title = "Esp Opah",
  Description = "Highlight dan nama Opah",
  Default = false,
  Callback = function(value14) f13("Opah", value14) end,
})

addSection:AddToggle("EspPlanks", {
  Title = "Esp Planks",
  Description = "Highlight dan nama papan (planks)",
  Default = false,
  Callback = function(value15) f13("Planks", value15) end,
})

local f14

local function f15()
  local v19 = f14()

  if not v19 then
    return nil
  end

  local ok2, result2 = pcall(function() return v19.ContentText end)

  if ok2 and result2 and result2 ~= "" then
    return result2
  end

  return nil
end

function f14()
  local puzzleItems = workspaceService:FindFirstChild("PuzzleItems")
  local passcodeNote = puzzleItems and puzzleItems:FindFirstChild("PasscodeNote")
  local paper = passcodeNote and passcodeNote:FindFirstChild("Paper")
  local writing = paper and paper:FindFirstChild("Writing")
  return writing and writing:FindFirstChild("Code")
end

local addParagraph = v17.Auto:AddSection("Kode Keypad", "solar/lock-keyhole-bold"):AddParagraph({
  Title = "Kode (hanya tampilan)",
  Content = '<font size="26"><b>- - - -</b></font>',
})

task.spawn(function()
  local v20

  while task.wait(0.4) do
    local v21 = f15() or "belum terdeteksi"

    if v21 ~= v20 then
      v20 = v21
      pcall(function() addParagraph:SetDesc('<font size="26"><b>' .. v21 .. "</b></font>") end)
    end
  end
end)

local function getGsub(instance9)
  local text = instance9:IsA("TextButton") and instance9.Text or ""

  if text == "" then
    local findFirstChildWhichIsA = instance9:FindFirstChildWhichIsA("TextLabel", true)
    text = findFirstChildWhichIsA and findFirstChildWhichIsA.Text or ""
  end

  return text:gsub("%s+", "")
end

local function f16(p5)
  pcall(function()
    for _, value16 in ipairs({
      "MouseButton1Down", "MouseButton1Click", "Activated", "MouseButton1Up",
    }) do
      if getconnections then
        for _, value17 in ipairs(getconnections(p5[value16])) do
          value17:Fire()
        end
      end

      if firesignal then
        pcall(firesignal, p5[value16])
      end
    end
  end)
end

local function f17()
  local puzzleItems2 = workspaceService:FindFirstChild("PuzzleItems")
  local list2 = {}

  if puzzleItems2 then
    for _, value18 in ipairs(puzzleItems2:GetChildren()) do
      if value18:IsA("Model") and value18.Name == "Key" then
        table.insert(list2, value18)
      end
    end
  end

  return list2
end

local function f18(text2)
  local playerGui = localPlayer:WaitForChild("PlayerGui")
  task.wait(0.4)

  for i = 1, #text2 do
    local getDescendants2 = playerGui.GetDescendants
    local sub = text2:sub(i, i)

    for _, value19 in ipairs(getDescendants2(playerGui)) do
      if (value19:IsA("TextButton") or value19:IsA("ImageButton")) and value19.Visible
        and getGsub(value19) == sub then
        f16(value19)
        break
      end
    end

    task.wait(0.15)
  end

  for _, value20 in ipairs(playerGui:GetDescendants()) do
    if (value20:IsA("TextButton") or value20:IsA("ImageButton")) and value20.Visible then
      local lower = getGsub(value20):lower()

      if lower == "enter" or lower == "ok" or lower == "submit" or lower == "confirm"
        or lower == "✓" then
        f16(value20)
        break
      end
    end
  end
end

local autoWin = false

local function f19()
  while autoWin do
    local v22 = f17()

    if #v22 == 0 then
      break
    end

    local instance10 = v22[1]
    f8(instance10)
    task.wait(0.15)
    f7(instance10)
    task.wait(0.25)
    local frontDoor = workspaceService:FindFirstChild("FrontDoor")
    local puzzleLocks = frontDoor and frontDoor:FindFirstChild("PuzzleLocks")

    if puzzleLocks then
      for _, value21 in ipairs(puzzleLocks:GetChildren()) do
        if not autoWin then
          return
        elseif value21:IsA("Model") then
          f8(value21)
          task.wait(0.1)
          f7(value21)
          task.wait(0.15)
        end
      end
    end

    local total = 0

    while autoWin and instance10.Parent and total < 1.5 do
      task.wait(0.1)
      total = total + 0.1
    end

    task.wait(0.1)
  end

  if not autoWin then
    return
  end

  local frontDoor2 = workspaceService:FindFirstChild("FrontDoor")

  local waitForChild2 = frontDoor2
  waitForChild2 = frontDoor2 and frontDoor2:WaitForChild("Keypad", 5)

  if not waitForChild2 then
    f2("Auto Win", "Keypad tidak ditemukan", "Error", nil, 4)
    return
  end

  local total2 = 0
  local v23, v24

  repeat
    v23 = f15()

    if v23 then
      break
    end

    task.wait(0.2)
    total2 = total2 + 0.2
    v24 = total2 > 10 or not autoWin
  until v24

  if not v23 or not autoWin then
    f2("Auto Win", "Kode belum terbaca", "Warning", nil, 4)
    return
  end

  f8(waitForChild2)
  task.wait(0.2)
  f7(waitForChild2)
  f18(v23)
  f2("Auto Win", "Selesai, kode: " .. v23, "Success", nil, 5)
end

local addSection2 = v17.Auto:AddSection("Auto Win", "solar/cup-star-bold")

addSection2:AddToggle("AutoWin", {
  Title = "Auto Win",
  Description = "Menyelesaikan puzzle secara otomatis",
  Default = false,
  Callback = function(value22)
    autoWin = value22

    if value22 then
      task.spawn(function()
        local ok3, result3 = pcall(f19)

        if not ok3 then
          warn("[AutoWin]", result3)
        end

        autoWin = false
      end)
    end
  end,
})

local v25 = false

local function f20()
  while v25 do
    local flipFlops = workspaceService:FindFirstChild("FlipFlops")
    local list3 = {}

    if flipFlops then
      for _, value23 in ipairs(flipFlops:GetChildren()) do
        if value23:IsA("Model") then
          table.insert(list3, value23)
        end
      end
    end

    if #list3 == 0 then
      task.wait(1)
    else
      for _, value24 in ipairs(list3) do
        if not v25 then
          return
        elseif value24.Parent then
          f8(value24)
          task.wait(0.15)
          f7(value24)
          task.wait(0.2)
        end
      end
    end
  end
end

addSection2:AddToggle("AutoFlipFlop", {
  Title = "Auto FlipFlop",
  Description = "Ambil semua FlipFlop otomatis",
  Default = false,
  Callback = function(value25)
    v25 = value25

    if value25 then
      task.spawn(function()
        local ok4, result4 = pcall(f20)

        if not ok4 then
          warn("[AutoFlipFlop]", result4)
        end
      end)
    end
  end,
})

local v26 = false
local walkSpeed = 16

local addSection3 = v17.Player:AddSection("Movement", "solar/running-bold")

addSection3:AddSlider("WalkSpeedSlider", {
  Title = "Walk Speed",
  Min = 16,
  Max = 200,
  Default = 16,
  Rounding = 0,
  LeftIcons = "minus",
  RightIcons = "plus",
  Callback = function(value26) walkSpeed = value26 end,
})

addSection3:AddToggle("WalkSpeedToggle", {
  Title = "Aktifkan Walk Speed",
  Default = false,
  Callback = function(value27)
    v26 = value27

    if not value27 then
      local humanoid = localPlayer.Character
        and localPlayer.Character:FindFirstChildOfClass("Humanoid")

      if humanoid then
        humanoid.WalkSpeed = 16
      end
    end
  end,
})

runService.Heartbeat:Connect(function()
  if v26 then
    local humanoid2 = localPlayer.Character
      and localPlayer.Character:FindFirstChildOfClass("Humanoid")

    if humanoid2 and humanoid2.WalkSpeed ~= walkSpeed then
      humanoid2.WalkSpeed = walkSpeed
    end
  end
end)

local infiniteStamina = false
local v27 = {}

local function f21()
  local ok5, result5 = pcall(function()
    return require(replicatedStorage:WaitForChild("SprintSystem", 3):WaitForChild(
      "SprintConfig", 3
    ))
  end)

  if ok5 and type(result5) == "table" then
    pcall(function()
      if setreadonly then
        setreadonly(result5, false)
      end
    end)

    return result5
  end
end

local map3 = {
  DrainPerSecond = 0,
  RegenPerSecond = 1000000,
  ExhaustedRegenPerSecond = 1000000,
  RegenDelay = 0,
  MinStaminaToStart = 0,
  ExhaustRecoverAt = 0,
}

local function f22(p6)
  local v28 = f21()

  if not v28 then
    return false
  end

  for key3, value28 in pairs(map3) do
    if p6 then
      if v27[key3] == nil then
        v27[key3] = v28[key3]
      end

      v28[key3] = value28
    elseif v27[key3] ~= nil then
      v28[key3] = v27[key3]
    end
  end

  return true
end

local addSection4 = v17.Player:AddSection("Stamina", "solar/bolt-bold")

addSection4:AddToggle("InfStamina", {
  Title = "Infinite Stamina",
  Description = "Lari tanpa batas stamina",
  Default = false,
  Callback = function(value29)
    infiniteStamina = value29

    if not f22(value29) and value29 then
      f2("Infinite Stamina", "Config sprint tidak ditemukan", "Error", nil, 4)
      pcall(function() fluentModded.Options.InfStamina:SetValue(false) end)
      infiniteStamina = false
    end
  end,
})

task.spawn(function()
  while task.wait(2) do
    if infiniteStamina then
      f22(true)
    end
  end
end)

local v29 = false
local sprintSpeed = 30
local v30

local function f23()
  local v31 = f21()

  if not v31 then
    return false
  end

  if v30 == nil then
    v30 = { SprintSpeed = v31.SprintSpeed, RunSoundSpeed = v31.RunSoundSpeed }
  end

  v31.SprintSpeed = sprintSpeed
  v31.RunSoundSpeed = ((v31.WalkSpeed or 16) + sprintSpeed) / 2

  return true
end

local function f24()
  local v32 = f21()

  if v32 and v30 then
    v32.SprintSpeed = v30.SprintSpeed
    v32.RunSoundSpeed = v30.RunSoundSpeed
  end

  v30 = nil
end

addSection4:AddSlider("SprintSpeedSlider", {
  Title = "Sprint Speed",
  Description = "Atur kecepatan lari",
  Min = 16,
  Max = 200,
  Default = 30,
  Rounding = 0,
  LeftIcons = "minus",
  RightIcons = "plus",
  Callback = function(value30)
    sprintSpeed = value30

    if v29 then
      f23()
    end
  end,
})

addSection4:AddToggle("SprintSpeedToggle", {
  Title = "Aktifkan Sprint Speed",
  Default = false,
  Callback = function(value31)
    v29 = value31

    if value31 then
      if not f23() then
        f2("Sprint Speed", "Config sprint tidak ditemukan", "Error", nil, 4)
        v29 = false
      end
    else
      f24()
    end
  end,
})

task.spawn(function()
  while task.wait(2) do
    if v29 then
      f23()
    end
  end
end)

local rounded = 999999
local infiniteCoin = false
local f25

local function f26(rounded2)
  local v33 = f25()

  if not v33 then
    return false
  end

  firesignal(v33.OnClientEvent, "Earned", {
    Mult = 1,
    Doubled = false,
    Amount = rounded2,
    Text = "Jumpa selipar!",
    Big = false,
  })

  return true
end

function f25()
  local duitShared = replicatedStorage:FindFirstChild("DuitShared")
  return duitShared and duitShared:FindFirstChild("DuitRemote")
end

local function f27(rounded3)
  local v34 = f25()

  if not v34 then
    return false
  end

  firesignal(v34.OnClientEvent, "State", {
    Temporary = false,
    Has2x = false,
    ReviveTokens = 0,
    DuitSlotCost = 400,
    StarterPack = {
      AutoOpen = false,
      EndsIn = 0,
      Available = false,
      Restricted = false,
      Bought = false,
    },
    Duit = rounded3,
    Settings = {
      SkipRollAnim = false,
      Sfx = 1,
      Layout = "",
      Music = 1,
      Language = "id",
      NewsSeen = 4,
    },
    ClassSlots = { "Racer", "Ghost", "", "", "" },
    Equipped = "Racer",
    ActiveSlot = 1,
    DailyStreak = 6,
    LightOn = false,
    SlotCount = 2,
    KenduriDaily = {
      FlawlessWins = 1,
      Wins = 1,
      Keys2Wins = 1,
      ResetAt = 1794758400,
      BossWins = 0,
      FlawlessBossWins = 0,
      Day = 20772,
      Paid = { flawless = true, keys1 = true },
      Keys3Wins = 1,
      State = "Open",
      Now = 1794704489,
      Keys1Wins = 1,
    },
    Classes = {},
    RoundLimit = { SprayNyamuk = { Cap = 3, Used = 0 } },
    Restricted = false,
    EquippedTitle = "TetamuKenduri",
    Tickets = 0,
    DailyCanClaim = false,
    TrollCredits = 0,
    Favorited = true,
    DuitSlotBought = true,
    VIPChestCanClaim = false,
    PlaySeconds = 3589,
    Passes = {},
    LuckyTickets = 0,
    DailyNextIndex = 1,
    GiftsClaimed = { ["1"] = true, ["3"] = true, ["2"] = true },
    Items = { SprayNyamuk = 1 },
    Pity = 3,
    ItemsOwned = { SprayNyamuk = 1 },
    TrollAllCredits = 0,
    GiftCredits = {},
    NextDayIn = 53911,
    Titles = { TetamuKenduri = true },
    Tips = {},
  })

  return true
end

local addSection5 = v17.Coin:AddSection("Coin", "solar/wallet-money-bold")

addSection5:AddInput("CoinAmount", {
  Title = "Jumlah Coin",
  Placeholder = "999999",
  Default = "999999",
  Numeric = true,
  Finished = true,
  Callback = function(value32)
    local v35 = tonumber(value32)

    if v35 then
      rounded = math.floor(v35)
    end
  end,
})

addSection5:AddButton({
  Title = "Set Coin",
  Description = "Ubah jumlah coin",
  Icon = "solar/wallet-money-bold",
  Callback = function()
    if f27(rounded) then
      f2("Coin", "Coin diset ke " .. rounded, "Success", nil, 3)
    else
      f2("Coin", "Remote Duit tidak ditemukan", "Error", nil, 3)
    end
  end,
})

addSection5:AddButton({
  Title = "Tambah Coin",
  Description = "Tambah coin sesuai jumlah",
  Icon = "solar/add-circle-bold",
  Callback = function()
    if not f26(rounded) then
      f2("Coin", "Remote Duit tidak ditemukan", "Error", nil, 3)
    end
  end,
})

addSection5:AddToggle("InfCoin", {
  Title = "Infinite Coin",
  Description = "Coin terus terisi otomatis",
  Default = false,
  Callback = function(value33) infiniteCoin = value33 end,
})

task.spawn(function()
  while task.wait(1) do
    if infiniteCoin then
      pcall(f27, rounded)
    end
  end
end)

local function f28(findFirstChild)
  if not findFirstChild:IsA("Model") or findFirstChild.Name ~= "BlackOpah" then
    return false
  end

  local humanoidRootPart2 = findFirstChild:FindFirstChild("HumanoidRootPart")
  return humanoidRootPart2 and humanoidRootPart2:FindFirstChild("BossGlow") ~= nil
end

local v36 = {}

local function f29(p7, p8)
  local v37 = p7 .. "." .. p8

  if v36[v37] then
    return v36[v37]
  end

  local ok6, result6 = pcall(function()
    return require(replicatedStorage:WaitForChild(p7, 3):WaitForChild(p8, 3))
  end)

  if ok6 and type(result6) == "table" then
    pcall(function()
      if setreadonly then
        setreadonly(result6, false)
      end
    end)

    v36[v37] = result6
    return result6
  end
end

local function f30()
  return f29("BossShared", "BossConfig")
end

local function f31()
  return f29("GameShared", "GameConfig")
end

local function f32()
  local v38
  pcall(function() v38 = f29("GameShared", "JumpscareConfig") end)
  return v38
end

local v39 = false

local function f33()
  local findFirstChild2 = workspaceService:FindFirstChild("BlackOpah", true)

  if findFirstChild2 and f28(findFirstChild2) then
    return findFirstChild2
  end

  for _, value34 in ipairs(workspaceService:GetDescendants()) do
    if f28(value34) then
      return value34
    end
  end
end

local v40 = {}

local function f34()
  local character = localPlayer.Character
  local tool = character and character:FindFirstChildOfClass("Tool")
  return tool ~= nil and v40[tool.Name] == true
end

local function f35()
  local seen = {}
  local bossShared = replicatedStorage:FindFirstChild("BossShared")
  local weapons = bossShared and bossShared:FindFirstChild("Weapons")

  if weapons then
    for _, value35 in ipairs(weapons:GetChildren()) do
      seen[value35.Name] = true
    end
  end

  local v41 = f30()

  if v41 and v41.WeaponById then
    for key4 in pairs(v41.WeaponById) do
      seen[key4] = true
    end
  end

  v40 = seen
end

local addSection6 = v17.Auto:AddSection("Boss", "solar/target-bold")
local instance11

addSection6:AddToggle("AutoAimBoss", {
  Title = "Auto Aim Boss",
  Description = "Bidik BlackOpah otomatis (hanya saat pegang weapon boss)",
  Default = false,
  Callback = function(value36)
    v39 = value36

    if not value36 then
      return
    end

    task.spawn(function()
      local flag3 = false
      local v42 = 0
      local v43 = 0

      while v39 do
        if tick() - v43 >= 3 then
          v43 = tick()
          f35()
        end

        if not (instance11 and instance11.Parent) and tick() - v42 > 1 then
          v42 = tick()
          instance11 = f33()

          if instance11 and not flag3 then
            flag3 = true
            f2("Auto Aim", "Boss: " .. instance11.Name, "Success", nil, 3)
          end
        elseif not (instance11 and instance11.Parent) then
          flag3 = false
        end

        local character2 = localPlayer.Character

        local humanoidRootPart3 = character2

        humanoidRootPart3 = character2
          and localPlayer.Character:FindFirstChild("HumanoidRootPart")

        local humanoidRootPart4 = instance11 and instance11.Parent
          and instance11:FindFirstChild("HumanoidRootPart")

        if humanoidRootPart4 and humanoidRootPart3 and f34() then
          local v44 = humanoidRootPart4.Position - humanoidRootPart3.Position

          if v44.Magnitude > 0.1 then
            pcall(function() replicatedStorage.BossShared.BossFX:FireServer("Aim", v44.Unit) end)
          end
        end

        task.wait(0.1)
      end
    end)
  end,
})

local autoKampang = false
local v45 = false
local f36

local function f37()
  local bossDrums = workspaceService:FindFirstChild("BossDrums")
    or workspaceService:FindFirstChild("BossDrums", true)

  local list4 = {}

  if bossDrums then
    for _, value37 in ipairs(bossDrums:GetChildren()) do
      if f36(value37) then
        table.insert(list4, value37)
      end
    end
  end

  table.sort(list4, function(p9, p10)
    local v46 = tonumber(p9.Name:match("%d+"))
    local v47 = tonumber(p10.Name:match("%d+"))

    if v46 and v47 and v46 ~= v47 then
      return v46 < v47
    end

    return p9.Name < p10.Name
  end)

  return list4
end

function f36(instance12)
  if instance12:IsA("BasePart") then
    return instance12
  end

  if instance12:IsA("Model") and instance12.PrimaryPart then
    return instance12.PrimaryPart
  end

  return instance12:FindFirstChildWhichIsA("BasePart", true)
end

local function f38(instance13)
  if instance13:IsA("ProximityPrompt") then
    pcall(function()
      instance13.HoldDuration = 0
      instance13.RequiresLineOfSight = false

      if instance13.MaxActivationDistance < 30 then
        instance13.MaxActivationDistance = 30
      end
    end)

    pcall(fireproximityprompt, instance13)
  elseif instance13:IsA("ClickDetector") then
    pcall(fireclickdetector, instance13)
  end
end

local function f39(instance14)
  local parent = instance14.Parent

  if parent and parent:IsA("BasePart") then
    return parent.Position
  end

  if parent and parent:IsA("Attachment") then
    return parent.WorldPosition
  end
end

local function f40()
  while autoKampang do
    local list5 = f37()

    if #list5 == 0 then
      task.wait(1)
    else
      local list6 = {}

      for _, value38 in ipairs(workspaceService:GetDescendants()) do
        if value38:IsA("ProximityPrompt") or value38:IsA("ClickDetector") then
          table.insert(list6, value38)
        end
      end

      local list7 = {}

      for _, value39 in ipairs(list5) do
        local parent2 = value39.Parent and f36(value39)

        if parent2 then
          local v48 = { part = parent2, targets = {} }

          for _, value40 in ipairs(list6) do
            if value40.Parent then
              local v49 = f39(value40)

              if value40:IsDescendantOf(value39)
                or v49 and (v49 - parent2.Position).Magnitude <= 15 then
                table.insert(v48.targets, value40)
              end
            end
          end

          table.insert(list7, v48)
        end
      end

      if v45 then
        for _, value41 in ipairs(list7) do
          if not autoKampang then
            return
          end

          getHumanoidRootPart().CFrame = value41.part.CFrame + Vector3.new(0, 3, 0)
          task.wait(0.08)

          for _, value42 in ipairs(value41.targets) do
            f38(value42)
          end
        end
      else
        for _, value43 in ipairs(list7) do
          for _, value44 in ipairs(value43.targets) do
            task.spawn(f38, value44)
          end
        end
      end

      task.wait(1.3)
    end
  end
end

addSection6:AddToggle("AutoKampang", {
  Title = "Auto Kampang",
  Description = "Interact semua kampang serentak",
  Default = false,
  Callback = function(value45)
    autoKampang = value45

    if not value45 then
      return
    end

    local v50 = #f37()

    if v50 > 0 then
      f2("Auto Kampang", v50 .. " kampang ditemukan", "Success", nil, 3)
    else
      f2("Auto Kampang", "BossDrums belum ada, menunggu...", "Warning", nil, 3)
    end

    task.spawn(function()
      while autoKampang do
        local ok7, result7 = pcall(f40)

        if not ok7 then
          warn("[AutoKampang]", result7)
          task.wait(1)
        end
      end
    end)
  end,
})

local addToggle = addSection6.AddToggle

local function f41()
  local character3 = localPlayer.Character
  local humanoid3 = character3 and character3:FindFirstChildOfClass("Humanoid")
  return humanoid3 ~= nil and humanoid3.Health <= 0
end

addToggle(addSection6, "DrumTeleport", {
  Title = "Teleport ke Kampang",
  Description = "Pindah ke kampang saat interact",
  Default = false,
  Callback = function(value46) v45 = value46 end,
})

local v51 = false
local v52 = 0

v17.Player:AddSection("Revive", "solar/heart-pulse-bold"):AddToggle("AutoRevive", {
  Title = "Auto Revive",
  Description = "Hidup ulang otomatis via ReviveRemote saat mati",
  Default = false,
  Callback = function(value47)
    v51 = value47

    if not value47 then
      return
    end

    if not (replicatedStorage:FindFirstChild("GameShared")
      and replicatedStorage.GameShared:FindFirstChild("ReviveRemote")) then
      f2("Auto Revive", "ReviveRemote tidak ditemukan", "Error", nil, 4)
      v51 = false
      return
    end
local function getTool()
  local character4 = localPlayer.Character
  return character4 and character4:FindFirstChildOfClass("Tool")
end

local v53 = {}
local v54 = {}

local function f42(key5, key6)
  if type(key5) ~= "table" then
    return
  end

  local v55 = v54[key5] and v54[key5][key6]

  if v55 == nil then
    return
  end

  pcall(function()
    if v55 == v53 then
      key5[key6] = nil
    else
      key5[key6] = v55
    end
  end)

  v54[key5][key6] = nil
end

local function f43(key7, key8, p11)
  if type(key7) ~= "table" then
    return
  end

  v54[key7] = v54[key7] or {}

  if v54[key7][key8] == nil then
    local v56 = key7[key8]
    v54[key7][key8] = v56 == nil and v53 or v56
  end

  pcall(function() key7[key8] = p11 end)
end

local function f44(p12, map4, p13)
  if type(p12) ~= "table" then
    return false
  end

  for key9, value48 in pairs(map4) do
    if p13 then
      f43(p12, key9, value48)
    else
      f42(p12, key9)
    end
  end

  return true
end

local autoFire = false
local f45

local function f46()
  local v57

  while autoFire do
    local tool2 = getTool()
    local v58 = f45(tool2)

    if v57 and (v57 ~= tool2 or not v58 or v58.Kind ~= "Stream") then
      pcall(function() v57:Deactivate() end)
      v57 = nil
    end

    if tool2 and v58 then
      if v58.Kind == "Charge" then
        pcall(function() tool2:Activate() end)
        task.wait((v58.ChargeTime or 1.1) + 0.05)
        pcall(function() tool2:Deactivate() end)
        task.wait(v58.MinInterval or 0.35)
      elseif v58.Kind == "Stream" then
        if v57 ~= tool2 then
          pcall(function() tool2:Activate() end)
          v57 = tool2
        end

        task.wait(0.25)
      else
        pcall(function() tool2:Activate() end)
        task.wait(math.max(0.05, 1 / (v58.Rate or 2)))
      end
    else
      task.wait(0.25)
    end
  end

  if v57 then
    pcall(function() v57:Deactivate() end)
  end
end

function f45(p14)
  local v59 = f30()
  return p14 and v59 and v59.WeaponById and v59.WeaponById[p14.Name]
end

local addSection7 = v17.Weapon:AddSection("Weapon Helper", "solar/target-bold")

addSection7:AddToggle("AutoFire", {
  Title = "Auto Fire",
  Description = "Tembak otomatis sesuai jenis weapon",
  Default = false,
  Callback = function(value49)
    autoFire = value49

    if value49 then
      task.spawn(function()
        local ok8, result8 = pcall(f46)

        if not ok8 then
          warn("[AutoFire]", result8)
        end
      end)
    end
  end,
})

addSection7:AddButton({
  Title = "Rocket Jump (Meriam)",
  Description = "Bidik ke kaki, tembak, lompat",
  Icon = "solar/bolt-bold",
  Callback = function()
    local tool3 = getTool()
    local character5 = localPlayer.Character
    local humanoidRootPart5 = character5 and character5:FindFirstChild("HumanoidRootPart")
    local humanoid4 = character5 and character5:FindFirstChildOfClass("Humanoid")
    local currentCamera2 = workspaceService.CurrentCamera

    if not (tool3 and tool3.Name == "Meriam" and humanoidRootPart5 and currentCamera2) then
      f2("Rocket Jump", "Pegang Meriam dulu", "Warning", nil, 3)
      return
    end

    local v60 = tick()

    runService:BindToRenderStep("NenekRocketJump", Enum.RenderPriority.Camera.Value + 1, function()
      if tick() - v60 > 0.3 then
        runService:UnbindFromRenderStep("NenekRocketJump")
        return
      end

      currentCamera2.CFrame = CFrame.new(
        currentCamera2.CFrame.Position, humanoidRootPart5.Position - Vector3.new(0, 6, 0)
      )
    end)

    task.wait(0.08)
    pcall(function() tool3:Activate() end)
    task.wait(0.05)

    if humanoid4 then
      humanoid4.Jump = true
    end
  end,
})

v17.Weapon:AddSection("Info Weapon", "solar/eye-bold"):AddParagraph({
  Title = "Weapon dipegang",
  Content = "-",
})
local v62 = false
local list8 = { "KO", "KOd", "KnockedOut", "Knocked", "Downed", "Down", "IsKO" }

local function f47(getPlayerFromCharacter)
  local character6 = getPlayerFromCharacter.Character

  if not character6 then
    return false
  end

  for _, value50 in ipairs(list8) do
    if character6:GetAttribute(value50) == true
      or getPlayerFromCharacter:GetAttribute(value50) == true then
      return true
    end
  end

  local humanoid5 = character6:FindFirstChildOfClass("Humanoid")
  return humanoid5 and humanoid5.Health <= 0
end

local function f48()
  while v62 do
    local instance15

    for _, value51 in ipairs(players:GetPlayers()) do
      if value51 ~= localPlayer and f47(value51) then
        local character7 = value51.Character

        local humanoidRootPart6 = character7
        humanoidRootPart6 = character7 and value51.Character:FindFirstChild("HumanoidRootPart")

        if humanoidRootPart6 then
          instance15 = humanoidRootPart6
          break
        end
      end
    end

    if instance15 and not f41() then
      local humanoidRootPart7 = getHumanoidRootPart()
      local v63 = tick()

      while v62 and instance15.Parent and tick() - v63 < 8 do
        humanoidRootPart7.CFrame = instance15.CFrame + Vector3.new(0, 2, 2)
        f7(instance15.Parent)
        task.wait(0.2)
        local getPlayerFromCharacter2 = players:GetPlayerFromCharacter(instance15.Parent)

        if not getPlayerFromCharacter2 or not f47(getPlayerFromCharacter2) then
          break
        end
      end
    else
      task.wait(0.5)
    end
  end
end

local addSection8 = v17.Auto:AddSection("Bantu Teman & Heal", "solar/bolt-bold")

addSection8:AddToggle("ReviveFriend", {
  Title = "Auto Revive Teman",
  Description = "Dekati teman KO supaya bangun lebih cepat",
  Default = false,
  Callback = function(value52)
    v62 = value52

    if value52 then
      task.spawn(function()
        local ok9, result9 = pcall(f48)

        if not ok9 then
          warn("[ReviveFriend]", result9)
        end
      end)
    end
  end,
})

local autoKuih = false
local v64 = 50
local v65 = {}
local v66 = 0

local function f49()
  if tick() - v66 < 2 then
    return v65
  end

  v66 = tick()
  local list9 = {}

  for _, value53 in ipairs(workspaceService:GetDescendants()) do
    if (value53:IsA("Model") or value53:IsA("BasePart")) and f11(value53.Name, "kuih") then
      if not (value53.Parent and value53.Parent:IsA("Model") and f11(value53.Parent.Name, "kuih")) then
        table.insert(list9, value53)
      end
    end
  end

  v65 = list9
  return list9
end

local f50

local function f51()
  while autoKuih do
    local humanoid6 = localPlayer.Character
      and localPlayer.Character:FindFirstChildOfClass("Humanoid")

    if humanoid6 and humanoid6.Health > 0 and humanoid6.Health < v64 then
      local v67 = f50()

      if v67 then
        local cframe = getHumanoidRootPart().CFrame
        f8(v67)
        task.wait(0.25)
        f7(v67)
        task.wait(0.6)

        if autoKuih then
          getHumanoidRootPart().CFrame = cframe
        end

        task.wait(1)
      else
        task.wait(1)
      end
    else
      task.wait(0.3)
    end
  end
end

function f50()
  local humanoidRootPart8 = localPlayer.Character
    and localPlayer.Character:FindFirstChild("HumanoidRootPart")

  if not humanoidRootPart8 then
    return
  end

  local v68
  local v69

  for _, value54 in ipairs(f49()) do
    if value54.Parent then
      local v70 = f9(value54)

      if v70 and v70.Transparency < 0.9 then
        local v71 = not v68
        local magnitude = (v70.Position - humanoidRootPart8.Position).Magnitude

        if v71 or magnitude < v68 then
          v69 = value54
          v68 = magnitude
        end
      end
    end
  end

  return v69
end

addSection8:AddSlider("KuihBelow", {
  Title = "Ambil kuih jika HP di bawah",
  Min = 10,
  Max = 90,
  Default = 50,
  Rounding = 0,
  LeftIcons = "minus",
  RightIcons = "plus",
  Callback = function(value55) v64 = value55 end,
})

addSection8:AddToggle("AutoKuih", {
  Title = "Auto Kuih",
  Description = "Teleport ke kuih terdekat saat HP rendah, lalu balik",
  Default = false,
  Callback = function(value56)
    autoKuih = value56

    if value56 then
      task.spawn(function()
        local ok10, result10 = pcall(f51)

        if not ok10 then
          warn("[AutoKuih]", result10)
        end
      end)
    end
  end,
})

local v72 = false
local v73 = {}
local v74 = 0
local f52

local function f53()
  while v72 do
    local flag4 = false

    for _, value57 in ipairs(f52()) do
      if not v72 then
        return
      elseif value57.Parent then
        f8(value57)
        task.wait(0.15)
        f7(value57)
        task.wait(0.2)
        flag4 = true
      end
    end

    if not flag4 then
      task.wait(1)
    end

    v74 = 0
  end
end

function f52()
  if tick() - v74 < 2 then
    return v73
  end

  v74 = tick()
  local seen2 = {}
  local list10 = {}

  local function f54(key10)
    if key10 and key10.Parent and not seen2[key10] then
      seen2[key10] = true
      table.insert(list10, key10)
    end
  end

  pcall(function()
    for _, value58 in ipairs(collectionService:GetTagged("planks")) do
      f54(value58)
    end
  end)

  for _, value59 in ipairs(workspaceService:GetDescendants()) do
    if (value59:IsA("Folder") or value59:IsA("Model")) and value59.Name:lower() == "planks" then
      for _, value60 in ipairs(value59:GetChildren()) do
        if value60:IsA("Model") or value60:IsA("BasePart") then
          f54(value60)
        end
      end
    end
  end

  v73 = list10
  return list10
end

v17.Auto:AddSection("Planks", "solar/target-bold"):AddToggle("AutoPlank", {
  Title = "Auto Cabut Planks",
  Description = "Teleport dan cabut semua papan otomatis",
  Default = false,
  Callback = function(value61)
    v72 = value61

    if value61 then
      task.spawn(function()
        local ok11, result11 = pcall(f53)

        if not ok11 then
          warn("[AutoPlank]", result11)
        end
      end)
    end
  end,
})

local addSection9 = v17.Patch:AddSection("Patch Config Lokal", "solar/bolt-bold")

local function f55(key11, title2, description, fn)
  addSection9:AddToggle(key11, {
    Title = title2,
    Description = description,
    Default = false,
    Callback = function(value62)
      if value62 and not fn(value62) then
        f2(title2, "Module config tidak ditemukan", "Error", nil, 4)
        pcall(function() fluentModded.Options[key11]:SetValue(false) end)
      end
    end,
  })
end

f55("FastWeapons", "Fast Weapons", "Rate tinggi, charge cepat, tanpa jeda", function(p15)
  local v75 = f30()

  if not (v75 and v75.Weapons) then
    return false
  end

  for _, value63 in ipairs(v75.Weapons) do
    if value63.Rate then
      if p15 then
        f43(value63, "Rate", 30)
      else
        f42(value63, "Rate")
      end
    end

    if value63.ChargeTime then
      if p15 then
        f43(value63, "ChargeTime", 0.15)
      else
        f42(value63, "ChargeTime")
      end
    end

    if value63.MinInterval then
      if p15 then
        f43(value63, "MinInterval", 0)
      else
        f42(value63, "MinInterval")
      end
    end
  end

  return true
end)

f55("PlayerBuff", "Player Buff", "Revive radius/rate besar, regen cepat", function(p16)
  local v76 = f30()

  if not (v76 and v76.Player) then
    return false
  end

  return f44(v76.Player, {
    ReviveRadius = 25,
    ReviveRate = 10,
    SpawnShield = 20,
    RegenDelay = 0,
    RegenPerSecond = 20,
  }, p16)
end)

f55("NoScareFx", "No Scare Effects", "Matikan Dread, Heartbeat, Flash, Phantom, Glitch", function(p17)
  local v77 = f31()

  if not (v77 and v77.Effects) then
    return false
  end

  return f44(v77.Effects, {
    Dread = false,
    Heartbeat = false,
    ChaseFlash = false,
    FlingFlash = false,
    Phantoms = false,
    Glitches = false,
  }, p17)
end)

local jumpPatch = false
local jumpHeight = 10

local function f56(p18)
  local v78 = f31()
  local v79 = f30()

  if not v78 then
    return false
  end

  f44(v78, { JumpHeight = jumpHeight, JumpCooldown = 0 }, p18)

  if v79 and v79.Player then
    f44(v79.Player, { JumpHeight = jumpHeight }, p18)
  end

  return true
end

addSection9:AddSlider("JumpHeightSlider", {
  Title = "Jump Height",
  Min = 3,
  Max = 60,
  Default = 10,
  Rounding = 0,
  LeftIcons = "minus",
  RightIcons = "plus",
  Callback = function(value64)
    jumpHeight = value64

    if jumpPatch then
      f56(true)
    end
  end,
})

addSection9:AddToggle("JumpPatch", {
  Title = "Jump Patch",
  Description = "Lompat lebih tinggi, tanpa cooldown",
  Default = false,
  Callback = function(value65)
    jumpPatch = value65

    if not f56(value65) then
      f2("Jump Patch", "GameConfig tidak ditemukan", "Error", nil, 4)
    end

    if not value65 then
      local v80 = f31()

      local humanoid7 = localPlayer.Character
        and localPlayer.Character:FindFirstChildOfClass("Humanoid")

      if humanoid7 and v80 and v80.JumpHeight then
        humanoid7.JumpHeight = v80.JumpHeight
      end
    end
  end,
})

runService.Heartbeat:Connect(function()
  if jumpPatch then
    local humanoid8 = localPlayer.Character
      and localPlayer.Character:FindFirstChildOfClass("Humanoid")

    if humanoid8 then
      if humanoid8.UseJumpPower then
        humanoid8.UseJumpPower = false
      end

      if humanoid8.JumpHeight ~= jumpHeight then
        humanoid8.JumpHeight = jumpHeight
      end
    end
  end
end)

local d = "138850305566950"
local v81 = f32()
local jumpscares = v81 and v81.Jumpscares and v81.Jumpscares[1]

if jumpscares then
  tostring(jumpscares.Image or ""):match("%d+")
  d = tostring(jumpscares.Sound or ""):match("%d+") or d
end

local function f57(instance16)
  if instance16:IsA("Sound") and string.find(instance16.SoundId, d, 1, true) then
    instance16.Volume = 0
    pcall(function() instance16:Stop() end)
  end
end

local v82 = false
local list11 = {}

local function f58(p19)
  v82 = p19

  for _, value66 in ipairs(list11) do
    pcall(function() value66:Disconnect() end)
  end

  list11 = {}

  if not p19 then
    return
  end

  local playerGui2 = localPlayer:FindFirstChildOfClass("PlayerGui")

  if playerGui2 then
    table.insert(list11, playerGui2.DescendantAdded:Connect(f57))
  end

  table.insert(list11, soundService.DescendantAdded:Connect(f57))

local addSection10 = v17.Visual:AddSection("Jumpscare", "solar/eye-bold")

addSection10:AddToggle("NoJumpscare", {
  Title = "No Jumpscare",
  Description = "Sembunyikan gambar dan suara jumpscare Opah",
  Default = false,
  Callback = function(value67) f58(value67) end,
})
local addParagraph2 = v17.Player:AddSection("Info", "solar/eye-bold"):AddParagraph({
  Title = "Nyawa (LivesHud)",
  Content = "-",
})

local function f59()
  local playerGui3 = localPlayer:FindFirstChildOfClass("PlayerGui")
  local findFirstChild3 = playerGui3 and playerGui3:FindFirstChild("LivesHud", true)

  if not findFirstChild3 then
    return "LivesHud tidak ditemukan"
  end

  local list12 = {}

  for _, value68 in ipairs(findFirstChild3:GetDescendants()) do
    if value68:IsA("TextLabel") and value68.Text ~= "" then
      table.insert(list12, value68.Text)
    end
  end

  if #list12 == 0 then
    return "tidak ada teks (mungkin berupa ikon)"
  end

  return table.concat(list12, " | ")
end

task.spawn(function()
  local v83

  while task.wait(1) do
    local v84 = f59()

    if v84 ~= v83 then
      pcall(function() addParagraph2:SetDesc(v84) end)
      v83 = v84
    end
  end
end)

local fullbright = false
local noFog = false
local map5

local function f60()
  if not map5 then
    map5 = {
      Brightness = lighting.Brightness,
      ClockTime = lighting.ClockTime,
      GlobalShadows = lighting.GlobalShadows,
      Ambient = lighting.Ambient,
      OutdoorAmbient = lighting.OutdoorAmbient,
      ExposureCompensation = lighting.ExposureCompensation,
    }
  end
end

local map6 = {}
local map7

local function f61()
  if not map7 then
    map7 = { FogStart = lighting.FogStart, FogEnd = lighting.FogEnd }
  end

  for _, value69 in ipairs(lighting:GetChildren()) do
    if value69:IsA("Atmosphere") and not map6[value69] then
      map6[value69] = {
        Density = value69.Density,
        Haze = value69.Haze,
        Offset = value69.Offset,
      }
    end
  end
end

local function f62()
  if map5 then
    for key12, value70 in pairs(map5) do
      pcall(function() lighting[key12] = value70 end)
    end

    map5 = nil
  end
end

local function f63()
  if map7 then
    for key13, value71 in pairs(map7) do
      pcall(function() lighting[key13] = value71 end)
    end

    map7 = nil
  end

  for key14, value72 in pairs(map6) do
    if key14.Parent then
      pcall(function()
        key14.Density = value72.Density
        key14.Haze = value72.Haze
        key14.Offset = value72.Offset
      end)
    end
  end

  map6 = {}
end

runService.RenderStepped:Connect(function()
  if fullbright then
    lighting.Brightness = 2
    lighting.ClockTime = 14
    lighting.GlobalShadows = false
    lighting.Ambient = Color3.fromRGB(190, 190, 190)
    lighting.OutdoorAmbient = Color3.fromRGB(190, 190, 190)
    lighting.ExposureCompensation = 0
  end

  if noFog then
    f61()

    lighting.FogStart = 900000000
    lighting.FogEnd = 9000000000

    for _, value73 in ipairs(lighting:GetChildren()) do
      if value73:IsA("Atmosphere") then
        value73.Density = 0
        value73.Haze = 0
      end
    end
  end
end)

local addSection11 = v17.Visual:AddSection("Visual", "solar/sun-bold")

addSection11:AddToggle("Fullbright", {
  Title = "Fullbright",
  Description = "Terang di mana saja",
  Default = false,
  Callback = function(value74)
    if value74 then
      f60()
    else
      f62()
    end

    fullbright = value74
  end,
})

addSection11:AddToggle("NoFog", {
  Title = "No Fog",
  Description = "Hilangkan kabut",
  Default = false,
  Callback = function(value75)
    if value75 then
      f61()
    else
      f63()
    end

    noFog = value75
  end,
})

pcall(function()
  interfaceManager:SetLibrary(fluentModded)
  interfaceManager:SetFolder("MalamSamaNenek")
  interfaceManager:BuildInterfaceSection(v17.Settings)
  interfaceManager:LoadSettings()
end)

pcall(function()
  saveManager:SetLibrary(fluentModded)
  saveManager:SetFolder("MalamSamaNenek/Config")
  saveManager:IgnoreThemeSettings()
  saveManager:BuildConfigSection(v17.Settings)
  saveManager:LoadAutoloadConfig()
end)

pcall(function() fluentModded:SetTheme("Nenek Violet") end)

task.spawn(function()
  for j = 1, 6 do
    task.wait(1)
  end
end)

fluentModded.NotifyInsideWindow = true
window:SelectTab(1)
f2("MALAM SAMA NENEK", "Loaded • by XYNZ", "Success", nil, 4)

if not v4 then
  f2("Icon", "Gagal muat icon kustom (cek console)", "Warning", nil, 5)
end

if not v5 then
  f2("Background", "Gagal muat background kustom (cek console)", "Warning", nil, 5)
end
