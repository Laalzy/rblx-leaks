--[[ first gui template that i deobfed
 _          _         ____  
| |    ___ | |    ___|  _ \ 
| |   / _ \| |   / _ \ |_) |
| |__| (_) | |__|  __/  _ < 
|_____\___/|_____\___|_| \_\
--]]
local players = game:GetService("Players")
local tweenService = game:GetService("TweenService")
local userInputService = game:GetService("UserInputService")
local coreGui = game:GetService("CoreGui")
local runService = game:GetService("RunService")
local soundService = game:GetService("SoundService")
local lighting = game:GetService("Lighting")
local xenoDISCORDINVITE = _G.XENO_DISCORD_INVITE or "no"
local playerGui = players.LocalPlayer:WaitForChild("PlayerGui")
local tweenInfo = TweenInfo.new(0.5, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out)
local tweenInfo2 = TweenInfo.new(0.4, Enum.EasingStyle.Exponential, Enum.EasingDirection.In)
local tweenInfo3 = TweenInfo.new(0.4, Enum.EasingStyle.Quint, Enum.EasingDirection.In)
local tweenInfo4 = TweenInfo.new(0.3, Enum.EasingStyle.Quint, Enum.EasingDirection.In)
local tweenInfo5 = TweenInfo.new(0.5, Enum.EasingStyle.Quint, Enum.EasingDirection.Out)
local tweenInfo6 = TweenInfo.new(0.3, Enum.EasingStyle.Quint, Enum.EasingDirection.Out)
local tweenInfo7 = TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
local tweenInfo8 = TweenInfo.new(0.2, Enum.EasingStyle.Back, Enum.EasingDirection.Out)
local tweenInfo9 = TweenInfo.new(0.6, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out)

local v1 = {
  Purple = {
    Header = Color3.fromRGB(20, 20, 28),
    Accent1 = Color3.fromRGB(130, 0, 255),
    Accent2 = Color3.fromRGB(190, 100, 255),
    SwitchOn = Color3.fromRGB(140, 0, 255),
    Text = Color3.fromRGB(255, 255, 255),
  },
  Green = {
    Header = Color3.fromRGB(20, 28, 20),
    Accent1 = Color3.fromRGB(0, 255, 110),
    Accent2 = Color3.fromRGB(120, 255, 160),
    SwitchOn = Color3.fromRGB(0, 200, 80),
    Text = Color3.fromRGB(255, 255, 255),
  },
  Blue = {
    Header = Color3.fromRGB(20, 24, 30),
    Accent1 = Color3.fromRGB(0, 160, 255),
    Accent2 = Color3.fromRGB(80, 220, 255),
    SwitchOn = Color3.fromRGB(0, 140, 255),
    Text = Color3.fromRGB(255, 255, 255),
  },
  Red = {
    Header = Color3.fromRGB(30, 20, 20),
    Accent1 = Color3.fromRGB(255, 40, 60),
    Accent2 = Color3.fromRGB(255, 100, 120),
    SwitchOn = Color3.fromRGB(220, 0, 60),
    Text = Color3.fromRGB(255, 255, 255),
  },
}

local v2 = {
  Background = Color3.fromRGB(12, 12, 18),
  Header = v1.Purple.Header,
  Accent1 = v1.Purple.Accent1,
  Accent2 = v1.Purple.Accent2,
  Text = v1.Purple.Text,
  SwitchOff = Color3.fromRGB(50, 50, 55),
  SwitchOn = v1.Purple.SwitchOn,
  IsGradient = true,
}

local v3 = {
  Gradients = {},
  Headers = {},
  Accents = {},
  AccentFills = {},
  Switches = {},
  Strokes = {},
  Keybinds = {},
}

local layoutOrder = 0
local v4 = {}

local xeno10 = Instance.new("ScreenGui")
xeno10.Name = "XENO 1.0"
xeno10.ResetOnSpawn = false
xeno10.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
xeno10.IgnoreGuiInset = true

local function f1(xeno102)
  if not pcall(function() xeno102.Parent = coreGui end) then
    xeno102.Parent = playerGui
  end
end

f1(xeno10)

local xenoDepthField = Instance.new("BlurEffect")
xenoDepthField.Name = "XENODepthField"
xenoDepthField.Size = 0
xenoDepthField.Parent = lighting

local function getInstance(p1, map)
  local instance = Instance.new(p1)

  for key, value in pairs(map) do
    instance[key] = value
  end

  return instance
end

local function f2(parent)
  local instance2 = getInstance("UIGradient", { Parent = parent })

  if v2.IsGradient then
    instance2.Color = ColorSequence.new({
      ColorSequenceKeypoint.new(0, v2.Accent1), ColorSequenceKeypoint.new(1, v2.Accent2),
    })
  else
    instance2.Color = ColorSequence.new({
      ColorSequenceKeypoint.new(0, v2.Accent1), ColorSequenceKeypoint.new(1, v2.Accent1),
    })
  end

  table.insert(v3.Gradients, instance2)
  return instance2
end

local f3

local function f4(key2)
  local v5 = v1[key2]

  if not v5 then
    return
  end

  v2.Header = v5.Header
  v2.Accent1 = v5.Accent1
  v2.Accent2 = v5.Accent2
  v2.SwitchOn = v5.SwitchOn
  v2.Text = v5.Text

  f3()
  v4:Notify("THEME UPDATED", "Active: " .. key2, 2)
end

local function f5(isGradient)
  v2.IsGradient = isGradient
  f3()
end

function f3()
  for _, value2 in pairs(v3.Gradients) do
    value2.Color = v2.IsGradient and ColorSequence.new({
      ColorSequenceKeypoint.new(0, v2.Accent1), ColorSequenceKeypoint.new(1, v2.Accent2),
    }) or ColorSequence.new({
      ColorSequenceKeypoint.new(0, v2.Accent1), ColorSequenceKeypoint.new(1, v2.Accent1),
    })
  end

  for _, value3 in pairs(v3.Headers) do
    tweenService:Create(value3, tweenInfo5, { BackgroundColor3 = v2.Header }):Play()
  end

  for _, value4 in pairs(v3.Accents) do
    tweenService:Create(value4, tweenInfo5, { TextColor3 = v2.Accent1 }):Play()
  end

  for _, value5 in pairs(v3.AccentFills) do
    tweenService:Create(value5, tweenInfo5, { BackgroundColor3 = v2.Accent1 }):Play()
  end

  for _, value6 in pairs(v3.Switches) do
    local switchOn = value6.Active and v2.SwitchOn or v2.SwitchOff
    tweenService:Create(value6.Instance, tweenInfo5, { BackgroundColor3 = switchOn }):Play()
  end

  for _, value7 in pairs(v3.Keybinds) do
    tweenService:Create(value7.Label, tweenInfo5, { TextColor3 = v2.Accent1 }):Play()
  end
end

local function f6(p2)
  local position, position2

  local function f7(input)
    local v6 = input.Position - position
    local absoluteSize = xeno10.AbsoluteSize
    local absoluteSize2 = p2.AbsoluteSize
    local x = absoluteSize.X
    local scale = position2.X.Scale
    local offset = position2.X.Offset
    local x2 = v6.X
    local y = absoluteSize.Y
    local scale2 = position2.Y.Scale
    local offset2 = position2.Y.Offset
    local y2 = v6.Y
    local v7 = p2.AnchorPoint.X * absoluteSize2.X
    local v8 = p2.AnchorPoint.Y * absoluteSize2.Y
    local clamp = math.clamp
    local x3 = absoluteSize.X
    local x4 = absoluteSize2.X
    local v9 = clamp(x * scale + offset + x2 - v7, 0, x3 - x4)
    local clamp2 = math.clamp
    local y3 = absoluteSize.Y
    local y4 = absoluteSize2.Y
    local v10 = clamp2(y * scale2 + offset2 + y2 - v8, 0, y3 - y4)

    tweenService:Create(p2, TweenInfo.new(0.05), {
      Position = UDim2.fromOffset(v9 + v7, v10 + v8),
    }):Play()
  end

  local inputBegan = p2.InputBegan
  local v11

  inputBegan:Connect(function(p3)
    if p3.UserInputType == Enum.UserInputType.MouseButton1
      or p3.UserInputType == Enum.UserInputType.Touch then
      v11 = true
      position = p3.Position
      position2 = p2.Position

      p3.Changed:Connect(function()
        if p3.UserInputState == Enum.UserInputState.End then
          v11 = false
        end
      end)
    end
  end)

  local inputChanged = p2.InputChanged
  local v12

  inputChanged:Connect(function(p4)
    if p4.UserInputType == Enum.UserInputType.MouseMovement
      or p4.UserInputType == Enum.UserInputType.Touch then
      v12 = p4
    end
  end)

  userInputService.InputChanged:Connect(function(input2)
    if input2 == v12 and v11 then
      f7(input2)
    end
  end)
end

local parent2 = getInstance("Frame", {
  Size = UDim2.new(0.3, 0, 1, 0),
  AnchorPoint = Vector2.new(1, 1),
  Position = UDim2.new(0.98, 0, 0.98, 0),
  BackgroundTransparency = 1,
  BorderSizePixel = 0,
  ZIndex = 2000,
  Parent = xeno10,
})

getInstance("UIListLayout", {
  Parent = parent2,
  VerticalAlignment = Enum.VerticalAlignment.Bottom,
  HorizontalAlignment = Enum.HorizontalAlignment.Right,
  Padding = UDim.new(0, 10),
})

local v13 = {}

function v4:Notify(text, text2, p5, key3)
  if key3 and v13[key3] then
    local v14 = v13[key3]
    v14.Expiry = tick() + p5

    if v14.Frame and v14.Frame.Parent then
      local content = v14.Frame:FindFirstChild("Content")

      if content then
        local message = content:FindFirstChild("Message")

        if message then
          message.Text = text2
        end
      end
    end

    return
  end

  if key3 then
    v13[key3] = { Frame = nil, Expiry = tick() + p5 }
  end

  task.spawn(function()
    local instance3 = getInstance("Frame", {
      Name = "Notif",
      Size = UDim2.new(0, 280, 0, 0),
      BackgroundColor3 = v2.Background,
      BackgroundTransparency = 0.1,
      BorderSizePixel = 0,
      ZIndex = 2001,
      Parent = parent2,
    })

    getInstance("UICorner", { CornerRadius = UDim.new(0, 14), Parent = instance3 })
    local instance4 = getInstance("UIStroke", { Thickness = 1.5, Parent = instance3 })
    f2(instance4).Rotation = 45

    local parent3 = getInstance("Frame", {
      Name = "Content",
      Size = UDim2.new(1, 0, 1, 0),
      BackgroundTransparency = 1,
      Visible = false,
      Parent = instance3,
      ZIndex = 2002,
    })

    f2((getInstance("TextLabel", {
      Text = "❖",
      Font = Enum.Font.GothamBold,
      TextSize = 18,
      TextColor3 = Color3.new(1, 1, 1),
      Size = UDim2.new(0, 30, 0, 30),
      Position = UDim2.new(0, 10, 0, 10),
      BackgroundTransparency = 1,
      Parent = parent3,
      ZIndex = 2002,
    })))

    getInstance("TextLabel", {
      Text = text,
      Font = Enum.Font.GothamBold,
      TextColor3 = Color3.new(1, 1, 1),
      TextSize = 14,
      Size = UDim2.new(1, -50, 0, 20),
      Position = UDim2.new(0, 40, 0, 8),
      BackgroundTransparency = 1,
      TextXAlignment = Enum.TextXAlignment.Left,
      Parent = parent3,
      ZIndex = 2002,
    })

    getInstance("TextLabel", {
      Name = "Message",
      Text = text2,
      Font = Enum.Font.Gotham,
      TextColor3 = v2.Text,
      TextSize = 12,
      Size = UDim2.new(1, -20, 0, 30),
      Position = UDim2.new(0, 15, 0, 30),
      BackgroundTransparency = 1,
      TextXAlignment = Enum.TextXAlignment.Left,
      TextWrapped = true,
      Parent = parent3,
      ZIndex = 2002,
    })

    if key3 and v13[key3] then
      v13[key3].Frame = instance3
    end

    local create = tweenService:Create(instance3, TweenInfo.new(
      0.4, Enum.EasingStyle.Quint, Enum.EasingDirection.Out
    ), { Size = UDim2.new(0, 280, 0, 70) })

    create:Play()
    create.Completed:Wait()

    parent3.Visible = true

    if key3 then
      while tick() < v13[key3].Expiry do
        task.wait(0.1)

        if not v13[key3] or not instance3.Parent then
          return
        end
      end

      v13[key3] = nil
    else
      task.wait(p5)
    end

    if instance3.Parent then
      local clone = instance3:Clone()
      clone.Parent = xeno10

      clone.Position = UDim2.fromOffset(
        instance3.AbsolutePosition.X, instance3.AbsolutePosition.Y
      )

      clone.AnchorPoint = Vector2.new(0, 0)

      instance3:Destroy()
      local tweenInfo10 = TweenInfo.new(0.6, Enum.EasingStyle.Quint, Enum.EasingDirection.In)
      local fromOffset = UDim2.fromOffset
      local x5 = clone.AbsolutePosition.X
      local absolutePosition = clone.AbsolutePosition

      tweenService:Create(clone, tweenInfo10, {
        Position = fromOffset(x5 + 300, absolutePosition.Y),
        BackgroundTransparency = 1,
      }):Play()

      task.wait(0.6)
      clone:Destroy()
    end
  end)
end

local instance5 = getInstance("Frame", {
  Name = "XENOMain",
  BackgroundColor3 = v2.Background,
  BorderSizePixel = 0,
  Size = UDim2.new(0, 0, 0, 0),
  Position = UDim2.new(0.5, 0, 0.5, 0),
  AnchorPoint = Vector2.new(0.5, 0.5),
  Visible = false,
  ClipsDescendants = true,
  Active = true,
  ZIndex = 1,
  Parent = xeno10,
})

f6(instance5)
getInstance("UICorner", { CornerRadius = UDim.new(0, 18), Parent = instance5 })
local instance6 = getInstance("UIStroke", { Thickness = 2, Parent = instance5 })
f2(instance6).Rotation = 60

local parent4 = getInstance("Frame", {
  Size = UDim2.new(1, 0, 0, 50),
  BackgroundColor3 = v2.Header,
  BackgroundTransparency = 0.5,
  BorderSizePixel = 0,
  Parent = instance5,
})

table.insert(v3.Headers, parent4)

f2((getInstance("TextLabel", {
  Text = "XENO 1.0",
  Font = Enum.Font.GothamBlack,
  TextSize = 18,
  TextColor3 = Color3.new(1, 1, 1),
  Size = UDim2.new(0.5, 0, 1, 0),
  Position = UDim2.new(0.05, 0, 0, 0),
  BackgroundTransparency = 1,
  TextXAlignment = Enum.TextXAlignment.Left,
  Parent = parent4,
})))

local parent5 = getInstance("Frame", {
  Size = UDim2.new(0, 160, 0, 30),
  Position = UDim2.new(1, -170, 0.5, -15),
  BackgroundTransparency = 1,
  BorderSizePixel = 0,
  Parent = parent4,
})

local function f8(text3, p6, p7)
  local instance7 = getInstance("TextButton", {
    Size = UDim2.new(0, 35, 1, 0),
    Position = UDim2.new(0, (p6 - 1) * 40, 0, 0),
    BackgroundColor3 = v2.Header,
    BackgroundTransparency = 0.5,
    Text = text3,
    TextColor3 = Color3.new(1, 1, 1),
    Font = Enum.Font.GothamBlack,
    TextSize = 13,
    AutoButtonColor = false,
    BorderSizePixel = 0,
    Parent = parent5,
  })

  getInstance("UICorner", { CornerRadius = UDim.new(0, 10), Parent = instance7 })

  f2((getInstance("UIStroke", { Thickness = 1.5, Parent = instance7 })))
  f2(instance7)

  table.insert(v3.Headers, instance7)
  instance7.MouseButton1Click:Connect(p7)
end

local flag = false
local flag2 = false

f8("X", 4, function()
  tweenService:Create(xenoDepthField, TweenInfo.new(0.4), { Size = 0 }):Play()

  local create2 = tweenService:Create(instance5, tweenInfo4, { Size = UDim2.new(0, 0, 0, 0) })
  create2:Play()
  create2.Completed:Wait()

  xeno10:Destroy()
end)

local v15

f8("-", 3, function()
  if flag2 then
    return
  end

  flag2 = true
  tweenService:Create(xenoDepthField, TweenInfo.new(0.4), { Size = 0 }):Play()

  local create3 = tweenService:Create(instance5, tweenInfo3, { Size = UDim2.new(0, 0, 0, 0) })
  create3:Play()

  flag = false
  tweenService:Create(v15, TweenInfo.new(0.4), { Rotation = 0 }):Play()
  create3.Completed:Wait()
  instance5.Visible = false
  flag2 = false
  v4:Notify("SYSTEM", "Minimized to tray.", 2)
end)

f8("DC", 2, function()
  if setclipboard then
    pcall(setclipboard, xenoDISCORDINVITE)
    v4:Notify("DISCORD", "Invite copied to clipboard!", 2)
  else
    v4:Notify("DISCORD", "Check console for invite.", 2)
    print("Discord Invite: " .. xenoDISCORDINVITE)
  end
end)

local instance8 = getInstance("Frame", {
  Size = UDim2.new(0.9, 0, 0, 0),
  Position = UDim2.new(0.05, 0, 0.15, 0),
  BackgroundColor3 = v2.Header,
  BackgroundTransparency = 1,
  ClipsDescendants = true,
  ZIndex = 10,
  BorderSizePixel = 0,
  Parent = instance5,
})

getInstance("UICorner", { CornerRadius = UDim.new(0, 14), Parent = instance8 })

local notifications = getInstance("UIStroke", {
  Thickness = 2,
  Parent = instance8,
  Transparency = 1,
})

f2(notifications)
v3.Strokes.Notifications = notifications
table.insert(v3.Headers, instance8)

local parent6 = getInstance("ScrollingFrame", {
  Size = UDim2.new(1, 0, 1, 0),
  BackgroundTransparency = 1,
  BorderSizePixel = 0,
  ScrollBarThickness = 2,
  ScrollingDirection = Enum.ScrollingDirection.Y,
  AutomaticCanvasSize = Enum.AutomaticSize.Y,
  CanvasSize = UDim2.new(0, 0, 0, 0),
  Parent = instance8,
})

getInstance("UIListLayout", {
  Parent = parent6,
  HorizontalAlignment = Enum.HorizontalAlignment.Center,
  SortOrder = Enum.SortOrder.LayoutOrder,
  Padding = UDim.new(0, 8),
})

getInstance("UIPadding", {
  PaddingTop = UDim.new(0, 10),
  PaddingBottom = UDim.new(0, 10),
  Parent = parent6,
})

getInstance("TextLabel", {
  Text = "📢 NOTIFICATIONS",
  Font = Enum.Font.GothamBold,
  TextColor3 = v2.Text,
  Size = UDim2.new(1, 0, 0, 30),
  BackgroundTransparency = 1,
  BorderSizePixel = 0,
  Parent = parent6,
  LayoutOrder = 1,
})

local function f9(title, message2, layoutOrder2)
  local parent7 = getInstance("Frame", {
    Size = UDim2.new(0.9, 0, 0, 60),
    BackgroundColor3 = v2.Header,
    BackgroundTransparency = 0.3,
    BorderSizePixel = 0,
    Parent = parent6,
    LayoutOrder = layoutOrder2,
  })

  getInstance("UICorner", { CornerRadius = UDim.new(0, 10), Parent = parent7 })
  f2((getInstance("UIStroke", { Thickness = 1, Transparency = 0.7, Parent = parent7 })))

  getInstance("TextLabel", {
    Text = title,
    Font = Enum.Font.GothamBold,
    TextColor3 = v2.Text,
    Size = UDim2.new(1, -20, 0, 18),
    Position = UDim2.new(0, 10, 0, 8),
    BackgroundTransparency = 1,
    TextXAlignment = Enum.TextXAlignment.Left,
    TextSize = 14,
    Parent = parent7,
  })

  getInstance("TextLabel", {
    Text = message2,
    Font = Enum.Font.Gotham,
    TextColor3 = v2.Text,
    TextTransparency = 0.3,
    Size = UDim2.new(1, -20, 0, 30),
    Position = UDim2.new(0, 10, 0, 26),
    BackgroundTransparency = 1,
    TextXAlignment = Enum.TextXAlignment.Left,
    TextYAlignment = Enum.TextYAlignment.Top,
    TextSize = 12,
    TextWrapped = true,
    Parent = parent7,
  })
end

local list = {}

local function f10()
  for _, value8 in ipairs(parent6:GetChildren()) do
    if value8:IsA("Frame") then
      value8:Destroy()
    end
  end

  local ok, result = pcall(function()
    return game:HttpGet("https://raw.githubusercontent.com/zxkuhl/XENO/refs/heads/main/notifications.lua")
  end)

  if ok and result then
    local ok2, result2 = pcall(function() return loadstring(result)() end)

    if ok2 and result2 and type(result2) == "table" then
      list = result2

      for index, value9 in ipairs(list) do
        f9(value9.title, value9.message, index + 1)
      end
    else
      getInstance("TextLabel", {
        Text = "Failed to load notifications",
        Font = Enum.Font.Gotham,
        TextColor3 = v2.Text,
        TextTransparency = 0.5,
        Size = UDim2.new(1, 0, 0, 100),
        BackgroundTransparency = 1,
        Parent = parent6,
        LayoutOrder = 2,
      })
    end
  else
    getInstance("TextLabel", {
      Text = "Could not fetch notifications",
      Font = Enum.Font.Gotham,
      TextColor3 = v2.Text,
      TextTransparency = 0.5,
      Size = UDim2.new(1, 0, 0, 100),
      BackgroundTransparency = 1,
      Parent = parent6,
      LayoutOrder = 2,
    })
  end

  if #list == 0 then
    getInstance("TextLabel", {
      Text = "No notifications yet",
      Font = Enum.Font.Gotham,
      TextColor3 = v2.Text,
      TextTransparency = 0.5,
      Size = UDim2.new(1, 0, 0, 100),
      BackgroundTransparency = 1,
      Parent = parent6,
      LayoutOrder = 2,
    })
  end
end

f8("📢", 0, function()
  local scale3 = instance8.Size.Y.Scale
  local notifications2 = v3.Strokes.Notifications

  if not (scale3 > 0.1) then
    f10()

    instance8.BackgroundTransparency = 0.5
    instance8.Visible = true

    tweenService:Create(instance8, tweenInfo5, { Size = UDim2.new(0.9, 0, 0.65, 0) }):Play()

    if notifications2 then
      tweenService:Create(notifications2, tweenInfo5, { Transparency = 0 }):Play()
    end
  else
    local create4 = tweenService:Create(instance8, tweenInfo6, {
      Size = UDim2.new(0.9, 0, 0, 0),
    })

    if notifications2 then
      tweenService:Create(notifications2, tweenInfo6, { Transparency = 1 }):Play()
    end

    create4:Play()
    create4.Completed:Wait()

    instance8.BackgroundTransparency = 1
    instance8.Visible = false
  end
end)

Scroll = getInstance("ScrollingFrame", {
  Size = UDim2.new(1, 0, 1, -50),
  Position = UDim2.new(0, 0, 0, 50),
  BackgroundTransparency = 1,
  BorderSizePixel = 0,
  ScrollBarThickness = 2,
  ScrollingDirection = Enum.ScrollingDirection.Y,
  AutomaticCanvasSize = Enum.AutomaticSize.Y,
  CanvasSize = UDim2.new(0, 0, 0, 0),
  Parent = instance5,
})

getInstance("UICorner", { CornerRadius = UDim.new(0, 18), Parent = Scroll })

getInstance("UIListLayout", {
  Parent = Scroll,
  HorizontalAlignment = Enum.HorizontalAlignment.Center,
  Padding = UDim.new(0, 10),
  SortOrder = Enum.SortOrder.LayoutOrder,
})

getInstance("UIPadding", {
  PaddingTop = UDim.new(0, 15),
  PaddingBottom = UDim.new(0, 15),
  Parent = Scroll,
})

local instance9 = getInstance("Frame", {
  Size = UDim2.new(0.9, 0, 0, 0),
  Position = UDim2.new(0.05, 0, 0.15, 0),
  BackgroundColor3 = v2.Header,
  BackgroundTransparency = 1,
  ClipsDescendants = true,
  ZIndex = 10,
  BorderSizePixel = 0,
  Parent = instance5,
})

getInstance("UICorner", { CornerRadius = UDim.new(0, 14), Parent = instance9 })
local v16 = getInstance("UIStroke", { Thickness = 2, Parent = instance9, Transparency = 1 })
f2(v16)
v3.Strokes.Settings = v16
table.insert(v3.Headers, instance9)

local parent8 = getInstance("ScrollingFrame", {
  Size = UDim2.new(1, 0, 1, 0),
  BackgroundTransparency = 1,
  BorderSizePixel = 0,
  ScrollBarThickness = 2,
  ScrollingDirection = Enum.ScrollingDirection.Y,
  AutomaticCanvasSize = Enum.AutomaticSize.Y,
  CanvasSize = UDim2.new(0, 0, 0, 0),
  Parent = instance9,
})

getInstance("UIListLayout", {
  Parent = parent8,
  HorizontalAlignment = Enum.HorizontalAlignment.Center,
  SortOrder = Enum.SortOrder.LayoutOrder,
  Padding = UDim.new(0, 10),
})

getInstance("UIPadding", {
  PaddingTop = UDim.new(0, 10),
  PaddingBottom = UDim.new(0, 10),
  Parent = parent8,
})

local v17 = 0.6
local v18 = 1
local v19 = 1
local v20, v21, v22

local function f11(p8)
  local hue, saturation, brightness = p8:ToHSV()
  v17 = hue
  v18 = saturation
  v19 = brightness

  if v20 and v21 and v22 then
    v20.BackgroundColor3 = Color3.fromHSV(v17, 1, 1)
    v21.Position = UDim2.new(1 - v17, 0, 1 - v18, 0)
  end
end

f8("⚙", 1, function()
  local scale4 = instance9.Size.Y.Scale
  local v23 = v3.Strokes.Settings

  if not (scale4 > 0.1) then
    instance9.BackgroundTransparency = 0.5
    instance9.Visible = true

    tweenService:Create(instance9, tweenInfo5, { Size = UDim2.new(0.9, 0, 0.65, 0) }):Play()

    if v23 then
      tweenService:Create(v23, tweenInfo5, { Transparency = 0 }):Play()
    end
  else
    local create5 = tweenService:Create(instance9, tweenInfo6, {
      Size = UDim2.new(0.9, 0, 0, 0),
    })

    if v23 then
      tweenService:Create(v23, tweenInfo6, { Transparency = 1 }):Play()
    end

    create5:Play()
    create5.Completed:Wait()

    instance9.BackgroundTransparency = 1
    instance9.Visible = false
  end
end)

getInstance("TextLabel", {
  Text = "THEME SETTINGS",
  Font = Enum.Font.GothamBold,
  TextColor3 = v2.Text,
  Size = UDim2.new(1, 0, 0, 30),
  BackgroundTransparency = 1,
  BorderSizePixel = 0,
  Parent = parent8,
  LayoutOrder = 1,
})

local instance10 = getInstance("TextButton", {
  Size = UDim2.new(0.85, 0, 0, 32),
  BackgroundColor3 = v2.SwitchOn,
  Text = "Gradient Mode: ON",
  Font = Enum.Font.GothamBold,
  TextColor3 = Color3.new(1, 1, 1),
  AutoButtonColor = false,
  BorderSizePixel = 0,
  Parent = parent8,
  LayoutOrder = 2,
})

getInstance("UICorner", { CornerRadius = UDim.new(0, 8), Parent = instance10 })
table.insert(v3.Switches, { Instance = instance10, Active = true })

instance10.MouseButton1Click:Connect(function()
  f5(not v2.IsGradient)
  local isGradient2 = v2.IsGradient

  tweenService:Create(instance10, tweenInfo6, {
    BackgroundColor3 = isGradient2 and v2.SwitchOn or v2.SwitchOff,
  }):Play()

  instance10.Text = isGradient2 and "Gradient Mode: ON" or "Gradient Mode: OFF"
end)

local parent9 = getInstance("Frame", {
  Size = UDim2.new(1, 0, 0, 40),
  BackgroundTransparency = 1,
  BorderSizePixel = 0,
  Parent = parent8,
  LayoutOrder = 3,
})

getInstance("UIGridLayout", {
  Parent = parent9,
  CellSize = UDim2.new(0.2, 0, 0.9, 0),
  HorizontalAlignment = Enum.HorizontalAlignment.Center,
  VerticalAlignment = Enum.VerticalAlignment.Center,
  CellPadding = UDim2.new(0, 10, 0, 0),
})

local function f12(p9, accent1)
  local parent10 = getInstance("TextButton", {
    BackgroundColor3 = accent1,
    Text = "",
    AutoButtonColor = false,
    BorderSizePixel = 0,
    Parent = parent9,
  })

  getInstance("UICorner", { CornerRadius = UDim.new(0, 8), Parent = parent10 })

  getInstance("UIStroke", {
    Thickness = 2,
    Color = Color3.fromRGB(255, 255, 255),
    Transparency = 0.5,
    Parent = parent10,
  })

  parent10.MouseButton1Up:Connect(function()
    f4(p9)
    f11(accent1)
  end)
end

f12("Purple", v1.Purple.Accent1)
f12("Green", v1.Green.Accent1)
f12("Blue", v1.Blue.Accent1)
f12("Red", v1.Red.Accent1)

getInstance("TextLabel", {
  Text = "CUSTOM ACCENT",
  Font = Enum.Font.GothamBold,
  TextColor3 = v2.Text,
  Size = UDim2.new(1, 0, 0, 20),
  BackgroundTransparency = 1,
  TextTransparency = 0.5,
  TextSize = 12,
  Parent = parent8,
  LayoutOrder = 4,
})

local parent11 = getInstance("Frame", {
  Size = UDim2.new(0.85, 0, 0, 130),
  BackgroundTransparency = 1,
  Parent = parent8,
  LayoutOrder = 5,
})

v20 = getInstance("ImageButton", {
  Size = UDim2.new(1, 0, 0, 100),
  Position = UDim2.new(0, 0, 0, 0),
  BackgroundColor3 = Color3.fromHSV(v17, 1, 1),
  Image = "rbxassetid://4155801252",
  Parent = parent11,
})

getInstance("UICorner", { CornerRadius = UDim.new(0, 8), Parent = v20 })

v21 = getInstance("Frame", {
  Size = UDim2.new(0, 10, 0, 10),
  AnchorPoint = Vector2.new(0.5, 0.5),
  BackgroundColor3 = Color3.new(1, 1, 1),
  Position = UDim2.new(0.5, 0, 0, 0),
  Parent = v20,
})

getInstance("UICorner", { CornerRadius = UDim.new(1, 0), Parent = v21 })
getInstance("UIStroke", { Thickness = 2, Color = Color3.new(0, 0, 0), Parent = v21 })

v22 = getInstance("ImageButton", {
  Size = UDim2.new(1, 0, 0, 15),
  Position = UDim2.new(0, 0, 0, 110),
  BackgroundColor3 = Color3.new(0, 0, 0),
  BorderSizePixel = 0,
  Parent = parent11,
})

getInstance("UICorner", { CornerRadius = UDim.new(0, 6), Parent = v22 })

getInstance("UIGradient", {
  Color = ColorSequence.new({
    ColorSequenceKeypoint.new(0, Color3.new(0, 0, 0)),
    ColorSequenceKeypoint.new(1, Color3.new(1, 1, 1)),
  }),
  Parent = v22,
})

local function f13()
  local color = Color3.fromHSV(v17, v18, v19)

  v2.Accent1 = color
  v2.Accent2 = Color3.fromHSV(v17, math.clamp(v18 - 0.2, 0, 1), math.clamp(v19 + 0.1, 0, 1))
  v2.SwitchOn = color

  v20.BackgroundColor3 = Color3.fromHSV(v17, 1, 1)
  f3()
end

local flag3 = false
local flag4 = false

local function f14(input3)
  if flag3 then
    local position3 = input3.Position
    local clamped = math.clamp(position3.X - v20.AbsolutePosition.X, 0, v20.AbsoluteSize.X)
    local clamped2 = math.clamp(position3.Y - v20.AbsolutePosition.Y, 0, v20.AbsoluteSize.Y)
    v17 = 1 - clamped / v20.AbsoluteSize.X
    v18 = 1 - clamped2 / v20.AbsoluteSize.Y
    v21.Position = UDim2.new(0, clamped, 0, clamped2)
    f13()
  elseif flag4 then
    local position4 = input3.Position

    v19 = math.clamp(position4.X - v22.AbsolutePosition.X, 0, v22.AbsoluteSize.X)
      / v22.AbsoluteSize.X

    f13()
  end
end

v20.InputBegan:Connect(function(input4)
  if input4.UserInputType == Enum.UserInputType.MouseButton1
    or input4.UserInputType == Enum.UserInputType.Touch then
    flag3 = true
    f14(input4)
  end
end)

v22.InputBegan:Connect(function(input5)
  if input5.UserInputType == Enum.UserInputType.MouseButton1
    or input5.UserInputType == Enum.UserInputType.Touch then
    flag4 = true
    f14(input5)
  end
end)

userInputService.InputEnded:Connect(function(input6)
  if input6.UserInputType == Enum.UserInputType.MouseButton1
    or input6.UserInputType == Enum.UserInputType.Touch then
    flag3 = false
    flag4 = false
  end
end)

userInputService.InputChanged:Connect(function(input7)
  if input7.UserInputType == Enum.UserInputType.MouseMovement
    or input7.UserInputType == Enum.UserInputType.Touch then
    if flag3 or flag4 then
      f14(input7)
    end
  end
end)

local function f15(p10)
  layoutOrder = layoutOrder + 1
  p10.LayoutOrder = layoutOrder
end

function v4.AddSearchBar(p11)
  local instance11 = getInstance("Frame", {
    Size = UDim2.new(0.9, 0, 0, 35),
    BackgroundColor3 = v2.Header,
    BackgroundTransparency = 0.6,
    BorderSizePixel = 0,
    Parent = Scroll,
  })

  f15(instance11)
  table.insert(v3.Headers, instance11)
  getInstance("UICorner", { CornerRadius = UDim.new(0, 8), Parent = instance11 })
  f2((getInstance("UIStroke", { Thickness = 1.5, Parent = instance11 })))

  getInstance("TextLabel", {
    Text = "🔍",
    BackgroundTransparency = 1,
    Size = UDim2.new(0, 30, 1, 0),
    TextSize = 14,
    Parent = instance11,
  })

  local instance12 = getInstance("TextBox", {
    Size = UDim2.new(1, -35, 1, 0),
    Position = UDim2.new(0, 35, 0, 0),
    BackgroundTransparency = 1,
    Text = "",
    PlaceholderText = "Search features...",
    TextColor3 = v2.Text,
    PlaceholderColor3 = Color3.fromRGB(150, 150, 150),
    Font = Enum.Font.GothamBold,
    TextSize = 13,
    TextXAlignment = Enum.TextXAlignment.Left,
    Parent = instance11,
  })

  instance12.Focused:Connect(function()
    tweenService:Create(instance11, tweenInfo6, { BackgroundTransparency = 0.2 }):Play()
  end)

  instance12.FocusLost:Connect(function()
    tweenService:Create(instance11, tweenInfo6, { BackgroundTransparency = 0.6 }):Play()
  end)

  instance12.Changed:Connect(function(p12)
    if p12 == "Text" then
      local lower = instance12.Text:lower()

      for _, value10 in pairs(Scroll:GetChildren()) do
        if value10:IsA("Frame") or value10:IsA("TextButton") then
          if value10 ~= instance11 and value10 ~= instance9 then
            if lower == "" then
              value10.Visible = true
            else
              local visible = false
              local findFirstChild = value10:FindFirstChild("ComponentTitle", true)

              if findFirstChild and findFirstChild:IsA("TextLabel")
                and findFirstChild.Text:lower():find(lower, 1, true) then
                visible = true
              end

              if not visible and value10:IsA("TextButton")
                and value10.Text:lower():find(lower, 1, true) then
                visible = true
              end

              value10.Visible = visible
            end
          end
        end
      end
    end
  end)
end

function v4.AddHeader(_, text4)
  local parent12 = getInstance("Frame", {
    Size = UDim2.new(0.95, 0, 0, 30),
    BackgroundTransparency = 1,
    Parent = Scroll,
  })

  f15(parent12)

  getInstance("TextLabel", {
    Name = "ComponentTitle",
    Text = text4,
    Font = Enum.Font.GothamBlack,
    TextSize = 16,
    TextColor3 = v2.Text,
    Size = UDim2.new(1, 0, 1, 0),
    Position = UDim2.new(0, 10, 0, 0),
    BackgroundTransparency = 1,
    TextXAlignment = Enum.TextXAlignment.Left,
    Parent = parent12,
  })

  local instance13 = getInstance("Frame", {
    Size = UDim2.new(1, 0, 0, 2),
    Position = UDim2.new(0, 0, 1, -2),
    BackgroundColor3 = v2.Accent1,
    BorderSizePixel = 0,
    Parent = parent12,
  })

  table.insert(v3.AccentFills, instance13)
end

function v4.AddLabel(_, text5)
  local parent13 = getInstance("Frame", {
    Size = UDim2.new(0.9, 0, 0, 25),
    BackgroundTransparency = 1,
    Parent = Scroll,
  })

  f15(parent13)

  getInstance("TextLabel", {
    Name = "ComponentTitle",
    Text = text5,
    Font = Enum.Font.Gotham,
    TextSize = 13,
    TextColor3 = v2.Text,
    TextTransparency = 0.4,
    Size = UDim2.new(1, 0, 1, 0),
    BackgroundTransparency = 1,
    TextXAlignment = Enum.TextXAlignment.Left,
    Parent = parent13,
  })
end

function v4.AddKeybind(_, text6, p13, p14, p15)
  local parent14 = getInstance("Frame", {
    Size = UDim2.new(0.9, 0, 0, 45),
    BackgroundColor3 = v2.Header,
    BorderSizePixel = 0,
    Parent = Scroll,
  })

  f15(parent14)
  table.insert(v3.Headers, parent14)

  getInstance("UICorner", { CornerRadius = UDim.new(0, 10), Parent = parent14 })

  getInstance("TextLabel", {
    Name = "ComponentTitle",
    Text = text6,
    Size = UDim2.new(0.6, 0, 1, 0),
    Position = UDim2.new(0, 15, 0, 0),
    BackgroundTransparency = 1,
    TextColor3 = v2.Text,
    Font = Enum.Font.GothamBold,
    TextSize = 13,
    TextXAlignment = Enum.TextXAlignment.Left,
    Parent = parent14,
  })

  local instance14 = getInstance("TextButton", {
    Text = tostring(p13):gsub("Enum.KeyCode.", ""),
    Size = UDim2.new(0, 80, 0, 25),
    Position = UDim2.new(1, -95, 0.5, -12.5),
    BackgroundColor3 = v2.SwitchOff,
    AutoButtonColor = false,
    Font = Enum.Font.GothamBold,
    TextSize = 12,
    TextColor3 = v2.Accent1,
    Parent = parent14,
  })

  getInstance("UICorner", { CornerRadius = UDim.new(0, 6), Parent = instance14 })
  table.insert(v3.Keybinds, { Label = instance14 })
  local keyCode = p13
  local flag5 = false

  instance14.MouseButton1Click:Connect(function()
    flag5 = true
    instance14.Text = "..."

    tweenService:Create(instance14, tweenInfo6, {
      BackgroundColor3 = v2.Accent1,
      TextColor3 = Color3.new(1, 1, 1),
    }):Play()

    local connect

    connect = userInputService.InputBegan:Connect(function(input8)
      if input8.UserInputType == Enum.UserInputType.Keyboard then
        keyCode = input8.KeyCode
        instance14.Text = tostring(keyCode):gsub("Enum.KeyCode.", "")
        flag5 = false

        tweenService:Create(instance14, tweenInfo6, {
          BackgroundColor3 = v2.SwitchOff,
          TextColor3 = v2.Accent1,
        }):Play()

        if p14 then
          p14(keyCode)
        end

        if p15 then
          v4:Notify(
            "Keybind Set", "Bound to: " .. tostring(keyCode):gsub("Enum.KeyCode.", ""), 2
          )
        end

        connect:Disconnect()
      end
    end)
  end)

  userInputService.InputBegan:Connect(function(input9, p16)
    if not flag5 and input9.KeyCode == keyCode and not p16 then
      if p14 then
        p14(keyCode)
      end

      if p15 then
        v4:Notify("Keybind Triggered", text6 .. " activated", 1.5)
      end
    end
  end)
end

function v4.AddSlider(_, p17, p18, p19, p20, p21, p22)
  local parent15 = getInstance("Frame", {
    Size = UDim2.new(0.9, 0, 0, 50),
    BackgroundColor3 = v2.Header,
    BorderSizePixel = 0,
    Parent = Scroll,
  })

  f15(parent15)
  table.insert(v3.Headers, parent15)

  getInstance("UICorner", { CornerRadius = UDim.new(0, 10), Parent = parent15 })

  getInstance("TextLabel", {
    Name = "ComponentTitle",
    Text = p17,
    Font = Enum.Font.GothamBold,
    TextSize = 13,
    TextColor3 = v2.Text,
    Size = UDim2.new(1, -20, 0, 20),
    Position = UDim2.new(0, 15, 0, 5),
    BackgroundTransparency = 1,
    TextXAlignment = Enum.TextXAlignment.Left,
    Parent = parent15,
  })

  local instance15 = getInstance("TextLabel", {
    Text = tostring(p20),
    Font = Enum.Font.Gotham,
    TextSize = 13,
    TextColor3 = v2.Accent1,
    Size = UDim2.new(0, 50, 0, 20),
    Position = UDim2.new(1, -65, 0, 5),
    BackgroundTransparency = 1,
    TextXAlignment = Enum.TextXAlignment.Right,
    Parent = parent15,
  })

  table.insert(v3.Accents, instance15)

  local instance16 = getInstance("TextButton", {
    Text = "",
    AutoButtonColor = false,
    Size = UDim2.new(0.9, 0, 0, 6),
    Position = UDim2.new(0.05, 0, 0, 32),
    BackgroundColor3 = v2.SwitchOff,
    BorderSizePixel = 0,
    Parent = parent15,
  })

  getInstance("UICorner", { CornerRadius = UDim.new(1, 0), Parent = instance16 })

  local instance17 = getInstance("Frame", {
    Size = UDim2.new(0, 0, 1, 0),
    BackgroundColor3 = v2.Accent1,
    BorderSizePixel = 0,
    Parent = instance16,
  })

  getInstance("UICorner", { CornerRadius = UDim.new(1, 0), Parent = instance17 })
  table.insert(v3.AccentFills, instance17)
  local flag6 = false

  local function f16(input10)
    local clamped3 = math.clamp((input10.Position.X - instance16.AbsolutePosition.X)
      / instance16.AbsoluteSize.X, 0, 1)

    tweenService:Create(instance17, TweenInfo.new(
      0.08, Enum.EasingStyle.Quad, Enum.EasingDirection.Out
    ), { Size = UDim2.new(clamped3, 0, 1, 0) }):Play()

    local rounded = math.floor(p18 + (p19 - p18) * clamped3)
    instance15.Text = tostring(rounded)

    if p21 then
      p21(rounded)
    end

    if p22 then
      v4:Notify("Slider", p17 .. ": " .. rounded, 2, "SliderNotif" .. p17)
    end
  end

  instance16.InputBegan:Connect(function(input11)
    if input11.UserInputType == Enum.UserInputType.MouseButton1
      or input11.UserInputType == Enum.UserInputType.Touch then
      flag6 = true
      f16(input11)
    end
  end)

  userInputService.InputEnded:Connect(function(input12)
    if input12.UserInputType == Enum.UserInputType.MouseButton1
      or input12.UserInputType == Enum.UserInputType.Touch then
      flag6 = false
    end
  end)

  userInputService.InputChanged:Connect(function(input13)
    if flag6
      and (input13.UserInputType == Enum.UserInputType.MouseMovement
        or input13.UserInputType == Enum.UserInputType.Touch) then
      f16(input13)
    end
  end)
end

function v4.AddSwitch(_, text7, p23, p24)
  local parent16 = getInstance("Frame", {
    Size = UDim2.new(0.9, 0, 0, 45),
    BackgroundColor3 = v2.Header,
    BorderSizePixel = 0,
    Parent = Scroll,
  })

  f15(parent16)
  table.insert(v3.Headers, parent16)

  getInstance("UICorner", { CornerRadius = UDim.new(0, 10), Parent = parent16 })

  getInstance("TextLabel", {
    Name = "ComponentTitle",
    Text = text7,
    Size = UDim2.new(0.7, 0, 1, 0),
    Position = UDim2.new(0, 15, 0, 0),
    BackgroundTransparency = 1,
    TextColor3 = v2.Text,
    Font = Enum.Font.GothamBold,
    TextSize = 13,
    TextXAlignment = Enum.TextXAlignment.Left,
    Parent = parent16,
  })

  local instance18 = getInstance("TextButton", {
    Text = "",
    Size = UDim2.new(0, 40, 0, 20),
    Position = UDim2.new(1, -55, 0.5, -10),
    BackgroundColor3 = v2.SwitchOff,
    AutoButtonColor = false,
    Parent = parent16,
  })

  getInstance("UICorner", { CornerRadius = UDim.new(1, 0), Parent = instance18 })

  local parent17 = getInstance("Frame", {
    Size = UDim2.new(0, 16, 0, 16),
    Position = UDim2.new(0, 2, 0.5, -8),
    BackgroundColor3 = Color3.new(1, 1, 1),
    Parent = instance18,
  })

  getInstance("UICorner", { CornerRadius = UDim.new(1, 0), Parent = parent17 })
  local v24 = { Instance = instance18, Active = false }
  table.insert(v3.Switches, v24)

  instance18.MouseButton1Click:Connect(function()
    v24.Active = not v24.Active
    local udim = v24.Active and UDim2.new(1, -18, 0.5, -8) or UDim2.new(0, 2, 0.5, -8)
    local switchOn2 = v24.Active and v2.SwitchOn or v2.SwitchOff

    tweenService:Create(parent17, tweenInfo6, { Position = udim }):Play()
    tweenService:Create(instance18, tweenInfo6, { BackgroundColor3 = switchOn2 }):Play()

    if p23 then
      p23(v24.Active)
    end

    if p24 then
      v4:Notify(text7, "Status: " .. (v24.Active and "Enabled" or "Disabled"), 2)
    end
  end)
end

function v4.AddButton(_, text8, p25, p26)
  local instance19 = getInstance("TextButton", {
    Size = UDim2.new(0.9, 0, 0, 45),
    BackgroundColor3 = v2.Header,
    BackgroundTransparency = 0.5,
    Text = text8,
    Font = Enum.Font.GothamBold,
    TextSize = 13,
    TextColor3 = v2.Text,
    AutoButtonColor = false,
    BorderSizePixel = 0,
    Parent = Scroll,
  })

  f15(instance19)
  table.insert(v3.Headers, instance19)
  getInstance("UICorner", { CornerRadius = UDim.new(0, 10), Parent = instance19 })

  local function f17()
    if p25 then
      p25()
    end

    if p26 then
      v4:Notify("Action Triggered", "Button: " .. text8, 2)
    end
  end

  instance19.MouseButton1Down:Connect(function()
    tweenService:Create(instance19, tweenInfo7, { Size = UDim2.new(0.88, 0, 0, 43) }):Play()
  end)

  instance19.MouseButton1Up:Connect(function()
    tweenService:Create(instance19, tweenInfo8, { Size = UDim2.new(0.9, 0, 0, 45) }):Play()
    f17()
  end)

  instance19.MouseLeave:Connect(function()
    tweenService:Create(instance19, tweenInfo8, { Size = UDim2.new(0.9, 0, 0, 45) }):Play()
  end)
end

function v4.AddDropdown(_, text9, list2, p27, p28, p29)
  local flag7 = false

  local parent18 = getInstance("Frame", {
    Size = UDim2.new(0.9, 0, 0, 50),
    BackgroundColor3 = v2.Header,
    BackgroundTransparency = 0,
    BorderSizePixel = 0,
    ClipsDescendants = true,
    Parent = Scroll,
  })

  f15(parent18)
  table.insert(v3.Headers, parent18)
  getInstance("UICorner", { CornerRadius = UDim.new(0, 10), Parent = parent18 })

  local parent19 = getInstance("TextButton", {
    Size = UDim2.new(1, 0, 0, 50),
    BackgroundTransparency = 1,
    Text = "",
    Parent = parent18,
  })

  getInstance("TextLabel", {
    Name = "ComponentTitle",
    Text = text9,
    Font = Enum.Font.GothamBold,
    TextSize = 13,
    TextColor3 = v2.Text,
    Size = UDim2.new(0.4, 0, 1, 0),
    Position = UDim2.new(0, 15, 0, 0),
    BackgroundTransparency = 1,
    TextXAlignment = Enum.TextXAlignment.Left,
    Parent = parent19,
  })

  local parent20 = getInstance("Frame", {
    Size = UDim2.new(0.35, 0, 0.6, 0),
    Position = UDim2.new(0.55, 0, 0.2, 0),
    BackgroundColor3 = v2.Background,
    BackgroundTransparency = 0.5,
    Parent = parent19,
  })

  getInstance("UICorner", { CornerRadius = UDim.new(0, 6), Parent = parent20 })
  f2((getInstance("UIStroke", { Thickness = 1, Parent = parent20 })))

  local instance20 = getInstance("TextLabel", {
    Text = p27 or "...",
    Font = Enum.Font.GothamBold,
    TextSize = 12,
    TextColor3 = v2.Accent1,
    Size = UDim2.new(1, 0, 1, 0),
    BackgroundTransparency = 1,
    Parent = parent20,
  })

  table.insert(v3.Accents, instance20)

  local instance21 = getInstance("TextLabel", {
    Text = "v",
    Font = Enum.Font.GothamBold,
    TextSize = 14,
    TextColor3 = v2.Text,
    Size = UDim2.new(0, 30, 0, 30),
    Position = UDim2.new(1, -35, 0.5, -15),
    BackgroundTransparency = 1,
    Parent = parent19,
  })

  local parent21 = getInstance("Frame", {
    Size = UDim2.new(1, 0, 0, #list2 * 35),
    Position = UDim2.new(0, 0, 0, 50),
    BackgroundTransparency = 1,
    Visible = false,
    Parent = parent18,
  })

  getInstance("UIListLayout", {
    SortOrder = Enum.SortOrder.LayoutOrder,
    HorizontalAlignment = Enum.HorizontalAlignment.Center,
    Padding = UDim.new(0, 5),
    Parent = parent21,
  })

  getInstance("UIPadding", { PaddingTop = UDim.new(0, 5), Parent = parent21 })

  local function f18()
    flag7 = not flag7
    local v25 = flag7 and 50 + #list2 * 35 + #list2 * 5 + 5 or 50
    local rotation = flag7 and 180 or 0

    if flag7 then
      parent21.Visible = true
    end

    tweenService:Create(parent18, tweenInfo9, { Size = UDim2.new(0.9, 0, 0, v25) }):Play()
    tweenService:Create(instance21, tweenInfo5, { Rotation = rotation }):Play()

    if flag7 then
      for key4, value11 in pairs(parent21:GetChildren()) do
        if value11:IsA("Frame") then
          value11.BackgroundTransparency = 1
          local textButton = value11:FindFirstChildOfClass("TextButton")

          if textButton then
            textButton.TextTransparency = 1
          end

          local new = TweenInfo.new
          local exponential = Enum.EasingStyle.Exponential
          local easingDirection = Enum.EasingDirection

          tweenService:Create(
            value11, new(0.6 + key4 * 0.08, exponential, easingDirection.Out),
            { BackgroundTransparency = 0.4 }
          ):Play()

          if textButton then
            tweenService:Create(textButton, TweenInfo.new(0.6 + key4 * 0.08), {
              TextTransparency = 0,
            }):Play()
          end
        end
      end
    else
      wait(0.2)

      if not flag7 then
        parent21.Visible = false
      end
    end
  end

  parent19.MouseButton1Click:Connect(f18)

  for _, value12 in ipairs(list2) do
    local instance22 = getInstance("Frame", {
      Size = UDim2.new(0.95, 0, 0, 30),
      BackgroundColor3 = v2.Background,
      BackgroundTransparency = 0.4,
      BorderSizePixel = 0,
      Parent = parent21,
    })

    getInstance("UICorner", { CornerRadius = UDim.new(0, 6), Parent = instance22 })
    f2((getInstance("UIStroke", { Thickness = 1, Parent = instance22 })))

    local instance23 = getInstance("TextButton", {
      Size = UDim2.new(1, 0, 1, 0),
      BackgroundTransparency = 1,
      Text = value12,
      Font = Enum.Font.GothamBold,
      TextSize = 12,
      TextColor3 = v2.Text,
      Parent = instance22,
    })

    instance23.MouseEnter:Connect(function()
      tweenService:Create(instance22, tweenInfo6, { BackgroundTransparency = 0 }):Play()
      tweenService:Create(instance23, tweenInfo6, { TextColor3 = v2.Accent1 }):Play()
    end)

    instance23.MouseLeave:Connect(function()
      tweenService:Create(instance22, tweenInfo6, { BackgroundTransparency = 0.4 }):Play()
      tweenService:Create(instance23, tweenInfo6, { TextColor3 = v2.Text }):Play()
    end)

    instance23.MouseButton1Click:Connect(function()
      tweenService:Create(instance22, tweenInfo7, { Size = UDim2.new(0.9, 0, 0, 28) }):Play()
      wait(0.1)
      tweenService:Create(instance22, tweenInfo6, { Size = UDim2.new(0.95, 0, 0, 30) }):Play()
      instance20.Text = value12
      f18()

      if p28 then
        p28(value12)
      end

      if p29 then
        v4:Notify("Dropdown", "Selected: " .. value12, 2)
      end
    end)
  end
end

function v4.AddTextBox(_, text10, p30, p31, p32, p33)
  local parent22 = getInstance("Frame", {
    Size = UDim2.new(0.9, 0, 0, 45),
    BackgroundColor3 = v2.Header,
    BackgroundTransparency = 0.5,
    BorderSizePixel = 0,
    Parent = Scroll,
  })

  f15(parent22)
  table.insert(v3.Headers, parent22)
  getInstance("UICorner", { CornerRadius = UDim.new(0, 10), Parent = parent22 })
  f2((getInstance("UIStroke", { Thickness = 1.5, Parent = parent22 })))

  getInstance("TextLabel", {
    Name = "ComponentTitle",
    Text = text10,
    Font = Enum.Font.GothamBold,
    TextSize = 13,
    TextColor3 = v2.Text,
    Size = UDim2.new(0.4, 0, 1, 0),
    Position = UDim2.new(0, 15, 0, 0),
    BackgroundTransparency = 1,
    TextXAlignment = Enum.TextXAlignment.Left,
    Parent = parent22,
  })

  local instance24 = getInstance("TextBox", {
    Size = UDim2.new(0.5, 0, 0, 28),
    Position = UDim2.new(1, -15, 0.5, -14),
    AnchorPoint = Vector2.new(1, 0),
    BackgroundColor3 = v2.Background,
    BackgroundTransparency = 0.3,
    Text = p31 or "",
    PlaceholderText = p30 or "Enter text...",
    PlaceholderColor3 = Color3.fromRGB(140, 140, 140),
    TextColor3 = v2.Text,
    Font = Enum.Font.GothamBold,
    TextSize = 12,
    ClearTextOnFocus = false,
    Parent = parent22,
  })

  getInstance("UICorner", { CornerRadius = UDim.new(0, 6), Parent = instance24 })
  f2((getInstance("UIStroke", { Thickness = 1, Parent = instance24 })))

  instance24.Focused:Connect(function()
    tweenService:Create(parent22, tweenInfo6, { BackgroundTransparency = 0.2 }):Play()
  end)

  instance24.FocusLost:Connect(function(p34)
    tweenService:Create(parent22, tweenInfo6, { BackgroundTransparency = 0.5 }):Play()
    local text11 = instance24.Text

    if p32 then
      p32(text11)
    end

    if p33 then
      v4:Notify("Text Input", text10 .. ": " .. (text11 ~= "" and text11 or "Empty"), 2)
    end
  end)

  return instance24
end

function v4.AddStatusBar(p35)
  if xeno10:FindFirstChild("XENOStatusBar") then
    return
  end

  local instance25 = getInstance("Frame", {
    Name = "XENOStatusBar",
    Size = UDim2.new(0, 320, 0, 32),
    AnchorPoint = Vector2.new(1, 0),
    Position = UDim2.new(1, -12, 0, 12),
    BackgroundColor3 = v2.Header,
    BackgroundTransparency = 0.15,
    BorderSizePixel = 0,
    ZIndex = 1500,
    Parent = xeno10,
  })

  f6(instance25)
  getInstance("UICorner", { CornerRadius = UDim.new(0, 10), Parent = instance25 })
  local instance26 = getInstance("UIStroke", { Thickness = 2, Parent = instance25 })
  f2(instance26)

  table.insert(v3.Strokes, instance26)
  table.insert(v3.Headers, instance25)

  local instance27 = getInstance("TextLabel", {
    Size = UDim2.new(1, -20, 1, 0),
    Position = UDim2.new(0, 10, 0, 0),
    BackgroundTransparency = 1,
    Font = Enum.Font.GothamBold,
    TextSize = 13,
    TextXAlignment = Enum.TextXAlignment.Left,
    TextColor3 = v2.Text,
    ZIndex = 1501,
    Parent = instance25,
  })

  table.insert(v3.Accents, instance27)

  instance25.InputBegan:Connect(function(input14)
    if input14.UserInputType == Enum.UserInputType.MouseButton1 then
      ToggleUI()
    end
  end)

  local v26 = 60
  local v27 = 0
  local v28 = tick()

  runService.RenderStepped:Connect(function()
    v27 = v27 + 1
    local v29 = tick()

    if v29 - v28 >= 1 then
      v26 = v27
      v27 = 0
      v28 = v29
    end
  end)

  task.spawn(function()
    while instance25.Parent do
      instance27.Text = string.format(
        "XENO    %d FPS | %s | %s", v26, os.date("%I:%M %p"), os.date("%m/%d")
      )

      task.wait(1)
    end
  end)

  return instance25
end

function v4.AddMultiSelectDropdown(_, text12, list3, p36, p37, p38)
  local flag8 = false
  local seen = {}

  for _, value13 in ipairs(p36 or {}) do
    seen[value13] = true
  end

  local parent23 = getInstance("Frame", {
    Size = UDim2.new(0.9, 0, 0, 50),
    BackgroundColor3 = v2.Header,
    BackgroundTransparency = 0,
    BorderSizePixel = 0,
    ClipsDescendants = true,
    Parent = Scroll,
  })

  f15(parent23)
  table.insert(v3.Headers, parent23)
  getInstance("UICorner", { CornerRadius = UDim.new(0, 10), Parent = parent23 })

  local parent24 = getInstance("TextButton", {
    Size = UDim2.new(1, 0, 0, 50),
    BackgroundTransparency = 1,
    Text = "",
    Parent = parent23,
  })

  getInstance("TextLabel", {
    Text = text12,
    Font = Enum.Font.GothamBold,
    TextSize = 13,
    TextColor3 = v2.Text,
    Size = UDim2.new(0.4, 0, 1, 0),
    Position = UDim2.new(0, 15, 0, 0),
    BackgroundTransparency = 1,
    TextXAlignment = Enum.TextXAlignment.Left,
    Parent = parent24,
  })

  local parent25 = getInstance("Frame", {
    Size = UDim2.new(0.35, 0, 0.6, 0),
    Position = UDim2.new(0.55, 0, 0.2, 0),
    BackgroundColor3 = v2.Background,
    BackgroundTransparency = 0.5,
    Parent = parent24,
  })

  getInstance("UICorner", { CornerRadius = UDim.new(0, 6), Parent = parent25 })
  f2((getInstance("UIStroke", { Thickness = 1, Parent = parent25 })))

  local instance28 = getInstance("TextLabel", {
    Text = table.concat(p36 or {}, ", "),
    Font = Enum.Font.GothamBold,
    TextSize = 12,
    TextColor3 = v2.Accent1,
    Size = UDim2.new(1, 0, 1, 0),
    BackgroundTransparency = 1,
    Parent = parent25,
  })

  table.insert(v3.Accents, instance28)

  local instance29 = getInstance("TextLabel", {
    Text = "v",
    Font = Enum.Font.GothamBold,
    TextSize = 14,
    TextColor3 = v2.Text,
    Size = UDim2.new(0, 30, 0, 30),
    Position = UDim2.new(1, -35, 0.5, -15),
    BackgroundTransparency = 1,
    Parent = parent24,
  })

  local parent26 = getInstance("Frame", {
    Size = UDim2.new(1, 0, 0, #list3 * 35),
    Position = UDim2.new(0, 0, 0, 50),
    BackgroundTransparency = 1,
    Visible = false,
    Parent = parent23,
  })

  getInstance("UIListLayout", {
    SortOrder = Enum.SortOrder.LayoutOrder,
    HorizontalAlignment = Enum.HorizontalAlignment.Center,
    Padding = UDim.new(0, 5),
    Parent = parent26,
  })

  getInstance("UIPadding", { PaddingTop = UDim.new(0, 5), Parent = parent26 })

  for _, value14 in ipairs(list3) do
    local parent27 = getInstance("Frame", {
      Size = UDim2.new(1, -10, 0, 35),
      BackgroundTransparency = 1,
      Parent = parent26,
    })

    local parent28 = getInstance("TextButton", {
      Text = value14,
      Font = Enum.Font.Gotham,
      TextSize = 13,
      TextColor3 = v2.Text,
      Size = UDim2.new(1, 0, 1, 0),
      BackgroundColor3 = v2.Header,
      AutoButtonColor = false,
      BorderSizePixel = 0,
      Parent = parent27,
    })

    getInstance("UICorner", { CornerRadius = UDim.new(0, 8), Parent = parent28 })
    table.insert(v3.Headers, parent28)

    local instance30 = getInstance("TextLabel", {
      Text = "✓",
      Font = Enum.Font.GothamBold,
      TextSize = 14,
      TextColor3 = v2.Accent1,
      Size = UDim2.new(0, 20, 0, 20),
      Position = UDim2.new(1, -25, 0.5, -10),
      BackgroundTransparency = 1,
      Visible = seen[value14],
      Parent = parent28,
    })

    table.insert(v3.Accents, instance30)

    parent28.MouseButton1Click:Connect(function()
      seen[value14] = not seen[value14]
      instance30.Visible = seen[value14]
      local list4 = {}

      for key5, value15 in pairs(seen) do
        if value15 then
          table.insert(list4, key5)
        end
      end

      instance28.Text = table.concat(list4, ", ")

      if p37 then
        p37(list4)
      end

      if p38 then
        v4:Notify(text12, "Selected: " .. table.concat(list4, ", "), 2)
      end
    end)
  end

  parent24.MouseButton1Click:Connect(function()
    flag8 = not flag8
    local v30 = flag8 and 50 + #list3 * 35 + #list3 * 5 + 5 or 50
    local rotation2 = flag8 and 180 or 0

    if flag8 then
      parent26.Visible = true
    end

    tweenService:Create(parent23, tweenInfo9, { Size = UDim2.new(0.9, 0, 0, v30) }):Play()
    tweenService:Create(instance29, tweenInfo5, { Rotation = rotation2 }):Play()

    if not flag8 then
      task.wait(0.2)
      parent26.Visible = false
    end
  end)
end

local v31 = v4 or {}

local function f19()
  if not isfolder("XENOConfig") then
    makefolder("XENOConfig")
  end
end

function v31.AddFile(_, p39)
  f19()
  local v32 = "XENOConfig" .. "/" .. p39 .. ".txt"

  if not isfile(v32) then
    writefile(v32, "")
    v31:Notify("Config System", "Created file: " .. p39, 5)
  else
    v31:Notify("Config System", "File already exists: " .. p39, 5)
  end
end

function v31.AddToFile(_, p40, p41)
  f19()
  local v33 = "XENOConfig" .. "/" .. p40 .. ".txt"

  if isfile(v33) then
    writefile(v33, readfile(v33) .. tostring(p41) .. "\n")
    v31:Notify("Config System", "Added to file: " .. p40, 5)
  else
    v31:Notify("Config System", "File does not exist: " .. p40, 5)
  end
end

function v31.GetFile(_, p42)
  if not isfolder("XENOConfigs") then
    makefolder("XENOConfigs")
  end

  local v34 = "XENOConfigs" .. "/" .. p42 .. ".txt"

  if not isfile(v34) then
    v31:Notify("Config System", "File does not exist: " .. p42, 5)
    return nil
  end

  return (readfile(v34))
end

local function getUdim()
  if userInputService.TouchEnabled and not userInputService.MouseEnabled then
    return UDim2.new(0.65, 0, 0.75, 0)
  end

  return UDim2.new(0, 650, 0, 650)
end

local instance31 = getInstance("TextButton", {
  Name = "XENOToggle",
  Position = UDim2.new(0.02, 0, 0.5, 0),
  BackgroundColor3 = v2.Header,
  Text = "",
  AutoButtonColor = false,
  Active = true,
  Size = UDim2.new(0, 0, 0, 0),
  ZIndex = 100,
  Parent = xeno10,
})

f6(instance31)
getInstance("UICorner", { CornerRadius = UDim.new(0.25, 0), Parent = instance31 })
f2((getInstance("UIStroke", { Thickness = 2, Parent = instance31 })))

v15 = getInstance("TextLabel", {
  Text = "❖",
  Size = UDim2.new(1, 0, 1, 0),
  BackgroundTransparency = 1,
  TextColor3 = v2.Accent1,
  Font = Enum.Font.GothamBold,
  TextSize = 24,
  Parent = instance31,
})

f2(v15)
table.insert(v3.Accents, v15)

instance31.MouseButton1Click:Connect(function()
  if flag2 then
    return
  end

  flag2 = true
  flag = not flag
  tweenService:Create(v15, tweenInfo, { Rotation = flag and 180 or 0 }):Play()

  if flag then
    tweenService:Create(xenoDepthField, TweenInfo.new(0.5), { Size = 24 }):Play()

    instance5.Visible = true
    instance5.Size = UDim2.new(0, 0, 0, 0)

    local create6 = tweenService:Create(instance5, tweenInfo, { Size = getUdim() })
    create6:Play()
    create6.Completed:Wait()
  else
    tweenService:Create(xenoDepthField, TweenInfo.new(0.4), { Size = 0 }):Play()

    local create7 = tweenService:Create(instance5, tweenInfo2, { Size = UDim2.new(0, 0, 0, 0) })
    create7:Play()
    create7.Completed:Wait()

    if not flag then
      instance5.Visible = false
    end

    v31:Notify("SYSTEM", "Minimized to tray.", 2)
  end

  flag2 = false
end)

task.delay(300, function()
  if v31 and v31.Notify then
    v31:Notify("XENO LIBRARY", [[
Enjoying this Script library?
Make your own at https://discord.gg/TdaWNwNAMa]], 6)
  end
end)

task.delay(1, function()
  if v31 and v31.Notify then
    local localPlayer = players.LocalPlayer
    local displayName = localPlayer.DisplayName or localPlayer.Name

    v31:Notify(
      "Greetings, " .. displayName .. ".",
      "Hello, " .. displayName .. ", thanks for choosing XENO library.", 8
    )
  end
end)

if not isfolder("XENOConfig") then
  makefolder("XENOConfig")
end

local function f20()
  local v35 = "https://raw.githubusercontent.com/zxkuhl/XENO/main/XENOinit.mp3"
  local ok3, result3 = pcall(function() return game:HttpGet(v35) end)

  if ok3 then
    writefile("XENOConfig/XENOinit.mp3", result3)
    return true
  end

  return false
end

if not isfile("XENOConfig/XENOinit.mp3") then
  f20()
end

local v36 = "Purple"

if isfile("XENOConfig/HYD394") then
  local xenoConfigHYD394 = readfile("XENOConfig/HYD394")

  if xenoConfigHYD394 ~= "" and v1[xenoConfigHYD394] then
    v36 = xenoConfigHYD394
  end
else
  writefile("XENOConfig/HYD394", v36)
end

local function f21()
  local v37 = v1[v36]

  if not v37 then
    return
  end

  v2.Header = v37.Header
  v2.Accent1 = v37.Accent1
  v2.Accent2 = v37.Accent2
  v2.SwitchOn = v37.SwitchOn
  v2.Text = v37.Text

  f3()
end

f21()

local function makeSound()
  local sound

  if isfile("XENOConfig/XENOinit.mp3") then
    readfile("XENOConfig/XENOinit.mp3")

    sound = Instance.new("Sound")
    sound.SoundId = getcustomasset("XENOConfig/XENOinit.mp3")
    sound.Volume = 0.5
    sound.Parent = soundService
    sound:Play()
    sound.Ended:Connect(function() sound:Destroy() end)
  end
end

task.spawn(function()
  local parent29 = getInstance("Frame", {
    Size = UDim2.new(1, 0, 1, 0),
    BackgroundColor3 = Color3.new(0, 0, 0),
    BackgroundTransparency = 1,
    BorderSizePixel = 0,
    ZIndex = 2000,
    Parent = xeno10,
  })

  local parent30 = getInstance("Frame", {
    Size = UDim2.new(1, 0, 1, 0),
    BackgroundTransparency = 1,
    ZIndex = 2000,
    Parent = parent29,
  })

  for i = 1, 15 do
    local instance32 = getInstance("Frame", {
      Size = UDim2.new(0, math.random(2, 6), 0, math.random(2, 6)),
      Position = UDim2.new(math.random(), 0, math.random(), 0),
      BackgroundColor3 = Color3.fromRGB(138, 43, 226),
      BackgroundTransparency = 0.7,
      BorderSizePixel = 0,
      ZIndex = 2000,
      Parent = parent30,
    })

    task.spawn(function()
      while instance32.Parent do
        tweenService:Create(instance32, TweenInfo.new(
          math.random(2, 4), Enum.EasingStyle.Sine, Enum.EasingDirection.InOut, -1, true
        ), {
          Position = UDim2.new(math.random(), 0, math.random(), 0),
          BackgroundTransparency = math.random(30, 90) / 100,
        }):Play()

        wait(math.random(2, 4))
      end
    end)
  end

  local instance33 = getInstance("TextLabel", {
    Size = UDim2.new(1, 0, 0.2, 0),
    Position = UDim2.new(0, 0, 0.35, 0),
    BackgroundTransparency = 1,
    Text = "XENO 1.0",
    Font = Enum.Font.GothamBlack,
    TextSize = 24,
    TextColor3 = Color3.fromRGB(138, 43, 226),
    TextTransparency = 1,
    TextStrokeTransparency = 0.5,
    TextStrokeColor3 = Color3.fromRGB(138, 43, 226),
    ZIndex = 2000,
    Parent = parent29,
  })

  local instance34 = getInstance("TextLabel", {
    Size = UDim2.new(1, 0, 0.2, 0),
    Position = UDim2.new(0, 0, 0.35, 0),
    BackgroundTransparency = 1,
    Text = "XENO 1.0",
    Font = Enum.Font.GothamBlack,
    TextSize = 24,
    TextColor3 = Color3.new(1, 1, 1),
    TextTransparency = 1,
    ZIndex = 2001,
    Parent = parent29,
  })

  f2(instance34)

  local instance35 = getInstance("TextLabel", {
    Size = UDim2.new(1, 0, 0.08, 0),
    Position = UDim2.new(0, 0, 0.48, 0),
    BackgroundTransparency = 1,
    Text = "ADVANCED EXECUTION ENVIRONMENT",
    Font = Enum.Font.GothamBold,
    TextSize = 12,
    TextColor3 = Color3.fromRGB(138, 43, 226),
    TextTransparency = 1,
    ZIndex = 2001,
    Parent = parent29,
  })

  local instance36 = getInstance("TextLabel", {
    Size = UDim2.new(0.6, 0, 0.08, 0),
    Position = UDim2.new(0.2, 0, 0.58, 0),
    BackgroundTransparency = 1,
    Text = "Initializing...",
    Font = Enum.Font.Gotham,
    TextSize = 16,
    TextColor3 = Color3.fromRGB(200, 200, 200),
    TextTransparency = 1,
    ZIndex = 2001,
    Parent = parent29,
  })

  local instance37 = getInstance("TextLabel", {
    Size = UDim2.new(0.3, 0, 0.05, 0),
    Position = UDim2.new(0.35, 0, 0.75, 0),
    BackgroundTransparency = 1,
    Text = "v1.0.0 | Build 2026 | #KittyScripts<3",
    Font = Enum.Font.GothamBold,
    TextSize = 11,
    TextColor3 = Color3.fromRGB(120, 120, 120),
    TextTransparency = 1,
    ZIndex = 2001,
    Parent = parent29,
  })

  local instance38 = getInstance("Frame", {
    Size = UDim2.new(0.42, 0, 0.012, 0),
    Position = UDim2.new(0.29, 0, 0.655, 0),
    BackgroundColor3 = Color3.fromRGB(138, 43, 226),
    BackgroundTransparency = 1,
    BorderSizePixel = 0,
    ZIndex = 2001,
    Parent = parent29,
  })

  local instance39 = getInstance("Frame", {
    Size = UDim2.new(0.4, 0, 0.008, 0),
    Position = UDim2.new(0.3, 0, 0.657, 0),
    BackgroundColor3 = Color3.fromRGB(30, 30, 30),
    BackgroundTransparency = 1,
    BorderSizePixel = 0,
    ZIndex = 2001,
    Parent = parent29,
  })

  local instance40 = getInstance("Frame", {
    Size = UDim2.new(0, 0, 1, 0),
    BackgroundColor3 = Color3.fromRGB(138, 43, 226),
    BorderSizePixel = 0,
    ZIndex = 2002,
    Parent = instance39,
  })

  local instance41 = getInstance("UIGradient", {
    Color = ColorSequence.new({
      ColorSequenceKeypoint.new(0, Color3.fromRGB(75, 0, 130)),
      ColorSequenceKeypoint.new(0.5, Color3.fromRGB(138, 43, 226)),
      ColorSequenceKeypoint.new(1, Color3.fromRGB(186, 85, 211)),
    }),
    Parent = instance40,
  })

  local instance42 = getInstance("TextLabel", {
    Size = UDim2.new(0.1, 0, 0.06, 0),
    Position = UDim2.new(0.71, 0, 0.645, 0),
    BackgroundTransparency = 1,
    Text = "0%",
    Font = Enum.Font.GothamBold,
    TextSize = 14,
    TextColor3 = Color3.fromRGB(138, 43, 226),
    TextTransparency = 1,
    TextXAlignment = Enum.TextXAlignment.Left,
    ZIndex = 2001,
    Parent = parent29,
  })

  tweenService:Create(parent29, TweenInfo.new(1.2, Enum.EasingStyle.Sine), {
    BackgroundTransparency = 0,
  }):Play()

  wait(0.3)
  makeSound()

  tweenService:Create(
    instance33, TweenInfo.new(1.5, Enum.EasingStyle.Quint, Enum.EasingDirection.Out),
    { TextTransparency = 0.3, TextSize = 48 }
  ):Play()

  tweenService:Create(
    instance34, TweenInfo.new(1.5, Enum.EasingStyle.Quint, Enum.EasingDirection.Out),
    { TextTransparency = 0, TextSize = 48 }
  ):Play()

  task.spawn(function()
    while instance33.Parent do
      tweenService:Create(instance33, TweenInfo.new(
        1.5, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut, -1, true
      ), { TextTransparency = 0.6 }):Play()

      wait(3)
    end
  end)

  wait(0.8)

  tweenService:Create(instance35, TweenInfo.new(1, Enum.EasingStyle.Sine), {
    TextTransparency = 0.3,
    Position = UDim2.new(0, 0, 0.46, 0),
  }):Play()

  wait(0.5)

  tweenService:Create(instance36, TweenInfo.new(0.8), { TextTransparency = 0 }):Play()
  tweenService:Create(instance39, TweenInfo.new(0.8), { BackgroundTransparency = 0.5 }):Play()
  tweenService:Create(instance38, TweenInfo.new(0.8), { BackgroundTransparency = 0.7 }):Play()
  tweenService:Create(instance42, TweenInfo.new(0.8), { TextTransparency = 0 }):Play()
  tweenService:Create(instance37, TweenInfo.new(0.8), { TextTransparency = 0.5 }):Play()

  wait(0.3)

  for _, value16 in ipairs({
    { text = "hi!", progress = 0.15, wait = 0.5 },
    { text = "heres a joke!", progress = 0.3, wait = 0.4 },
    { text = "whyd the chicken cross the road", progress = 0.45, wait = 0.5 },
    { text = "...", progress = 0.6, wait = 0.4 }, { text = "idk", progress = 0.75, wait = 0.5 },
    { text = "lolz", progress = 0.9, wait = 0.4 },
    { text = "- zxkuhl", progress = 0.98, wait = 0.3 },
    { text = "Ready!", progress = 1, wait = 0.6 },
  }) do
    instance36.Text = value16.text
    instance42.Text = math.floor(value16.progress * 100) .. "%"

    tweenService:Create(instance40, TweenInfo.new(
      0.6, Enum.EasingStyle.Quad, Enum.EasingDirection.Out
    ), { Size = UDim2.new(value16.progress, 0, 1, 0) }):Play()

    tweenService:Create(instance41, TweenInfo.new(
      0.3, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut, -1, true
    ), { Offset = Vector2.new(0.5, 0) }):Play()

    wait(value16.wait)
  end

  tweenService:Create(
    instance36, TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
    { TextColor3 = Color3.fromRGB(138, 43, 226), TextSize = 18 }
  ):Play()

  wait(0.5)

  tweenService:Create(instance34, TweenInfo.new(1), { TextTransparency = 1 }):Play()
  tweenService:Create(instance33, TweenInfo.new(1), { TextTransparency = 1 }):Play()
  tweenService:Create(instance35, TweenInfo.new(1), { TextTransparency = 1 }):Play()
  tweenService:Create(instance36, TweenInfo.new(1), { TextTransparency = 1 }):Play()
  tweenService:Create(instance39, TweenInfo.new(1), { BackgroundTransparency = 1 }):Play()
  tweenService:Create(instance38, TweenInfo.new(1), { BackgroundTransparency = 1 }):Play()
  tweenService:Create(instance40, TweenInfo.new(1), { BackgroundTransparency = 1 }):Play()
  tweenService:Create(instance42, TweenInfo.new(1), { TextTransparency = 1 }):Play()
  tweenService:Create(instance37, TweenInfo.new(1), { TextTransparency = 1 }):Play()
  tweenService:Create(parent30, TweenInfo.new(1), { BackgroundTransparency = 1 }):Play()

  wait(0.6)

  tweenService:Create(parent29, TweenInfo.new(1.2, Enum.EasingStyle.Sine), {
    BackgroundTransparency = 1,
  }):Play()

  instance31.Visible = true
  instance31.Size = UDim2.new(0, 0, 0, 0)
  instance31.Rotation = -180

  tweenService:Create(
    instance31, TweenInfo.new(1, Enum.EasingStyle.Elastic, Enum.EasingDirection.Out),
    { Size = UDim2.new(0, 50, 0, 50), Rotation = 0 }
  ):Play()

  wait(0.5)
  parent29:Destroy()
end)

return v31
