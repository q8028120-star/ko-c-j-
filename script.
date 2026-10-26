-- Roblox Lua Script: Auto Collect / Steal Egg Example
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local Workspace = game:GetService("Workspace")

-- Hàm tìm và nhặt tất cả trứng trong map
local function stealAllEggs()
    print("[Admin Hub]: Đang quét tìm trứng trên map...")
    
    -- Duyệt qua tất cả các vật thể trong Workspace
    for _, item in pairs(Workspace:GetDescendants()) do
        -- Kiểm tra nếu vật thể là 'Egg' hoặc chứa ProximityPrompt (nút tương tác)
        if item:IsA("ProximityPrompt") and string.find(string.lower(item.Parent.Name), "egg") then
            pcall(function()
                -- Di chuyển nhân vật đến vị trí quả trứng
                if LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
                    LocalPlayer.Character.HumanoidRootPart.CFrame = item.Parent.CFrame
                    task.wait(0.2)
                    -- Kích hoạt tương tác nhặt trứng
                    fireproximityprompt(item)
                    print("[Admin Hub]: Đã nhặt " .. item.Parent.Name)
                end
            end)
        end
    end
end

-- Chạy hàm
stealAllEggs()
