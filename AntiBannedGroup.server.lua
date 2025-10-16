local Players = game:GetService("Players")
local HttpService = game:GetService("HttpService")
local ServerScriptService = game:GetService("ServerScriptService")
local Logger = require(ServerScriptService.GoogleSheetLogger)

-- Bu URL, yasaklı grup listesini okumak içindir.
local WEBHOOK_URL_GET = "https://script.google.com/macros/s/AKfycbz3vyrLYfG5mqk3jTQUcZ4vKoO37I6PDH6KpBHQh56gOe8R5QJbLJzk5bB9FNhY9z2m0g/exec?action=getGroups"

local forbiddenGroups = {}

-- Google Sheets'ten yasaklı grupları çekme fonksiyonu
local function fetchForbiddenGroups()
    local success, response = pcall(function()
        return HttpService:GetAsync(WEBHOOK_URL_GET)
    end)

    if success then
        local decodedSuccess, groupData = pcall(function()
            return HttpService:JSONDecode(response)
        end)

        if decodedSuccess and type(groupData) == "table" then
            forbiddenGroups = groupData
            print("Yasaklı grup listesi Google Sheets'ten başarıyla çekildi. Toplam " .. #groupData .. " grup tanımı yüklendi.")
            
            -- Gelen veriyi Luau'nun beklediği formata dönüştür
            local formattedGroups = {}
            for _, groupInfo in ipairs(groupData) do
                -- Gelen ID'yi sayıya çevir
                local groupId = tonumber(groupInfo.id)
                if groupId then
                    formattedGroups[groupId] = {
                        IgnoreRoleLevel1 = groupInfo.ignoreRoleLevel1,
                        reason = groupInfo.reason,
                        banAscnAfterKick = groupInfo.banAfterKick
                    }
                end
            end
            forbiddenGroups = formattedGroups
            
        else
            warn("Google Sheets'ten gelen veri çözümlenemedi veya format yanlış:", response)
        end
    else
        warn("Google Sheets'ten yasaklı grup listesi alınamadı:", response)
    end
end


-- Bir oyuncu oyuna katıldığında bu fonksiyon çalışır
local function onPlayerAdded(player)
    -- Oyuncunun tüm gruplarını kontrol etmek için yasaklı gruplar listesinde döngüye gir
    for groupId, groupConfig in pairs(forbiddenGroups) do
        local success, isInGroup = pcall(function() return player:IsInGroup(groupId) end)
        
        if success and isInGroup then
            local playerRank = player:GetRankInGroup(groupId)

            if groupConfig.IgnoreRoleLevel1 and playerRank == 1 then
                continue
            end

            print(player.Name .. " adlı oyuncu yasaklı bir grupta (ID: " .. groupId .. ") olduğu için oyundan atılıyor.")
            
            -- BİLGİLERİ GOOGLE SHEETS'E GÖNDER
            Logger.logBannedPlayer(player, groupId, groupConfig.reason)

            player:Kick("Reason: " .. groupConfig.reason)

            if groupConfig.banAscnAfterKick then
                local banSuccess, banErr = pcall(function()
                    Players:BanAsync({
                        UserIds = { player.UserId },
                        Duration = -1,
                        DisplayReason = "You have been permanently banned. Reason: " .. groupConfig.reason,
                        PrivateReason = "Banned for being in a forbidden group (ID: " .. groupId .. ").",
                        ExcludeAltAccounts = false,
                        ApplyToUniverse = true,
                    })
                end)

                if banSuccess then
                    print(player.Name .. " (UserId: " .. player.UserId .. ") başarıyla kalıcı olarak yasaklandı.")
                else
                    warn("Kullanıcı yasaklanırken bir hata oluştu: " .. tostring(banErr))
                end
            end
            break
        end
    end
end

-- Script başlangıcında grupları çek
fetchForbiddenGroups()

-- Oyuncu ekleme event'ini bağla
Players.PlayerAdded:Connect(onPlayerAdded)

