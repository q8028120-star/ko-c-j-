-- Script Steal an Egg (Roblox Lua)
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local Workspace = game:GetService("Workspace")

-- Hàm tự động tìm và nhặt tất cả trứng có ProximityPrompt trong map
local function autoStealEggs()
    print("[Script]: Bắt đầu quét tìm trứng trên map...")
    
    for _, obj in pairs(Workspace:GetDescendants()) do
        -- Kiểm tra nếu vật thể chứa ProximityPrompt và tên liên quan đến 'Egg'
        if obj:IsA("ProximityPrompt") then
            local parentModel = obj.Parent
            if parentModel and string.find(string.lower(parentModel.Name), "egg") then
                pcall(function()
                    local character = LocalPlayer.Character
                    if character and character:FindFirstChild("HumanoidRootPart") then
                        -- Dịch chuyển nhân vật ngay cạnh quả trứng
                        character.HumanoidRootPart.CFrame = parentModel.PrimaryPart and parentModel.PrimaryPart.CFrame or parentModel.CFrame
                        task.wait(0.2)
                        
                        -- Kích hoạt tương tác nhặt trứng
                        fireproximityprompt(obj)
                        print("[Script]: Đã nhặt thành công: " + parentModel.Name)
                    end
                end)
                task.wait(0.1) -- Độ trễ nhỏ giữa các lần nhặt để tránh crash game
            end
        end
    end
    print("[Script]: Đã quét xong lượt này!")
end

-- Chạy hàm tự động
autoStealEggs()
