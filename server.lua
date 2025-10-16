-- Gerekli servisleri dahil et
local Players = game:GetService("Players")
local HttpService = game:GetService("HttpService")

-- GitHub RAW URL'sini buraya koy (modül script'in RAW linki)
local moduleUrl = "https://raw.githubusercontent.com/moonypaws/RBX-group-banner/refs/heads/main/BannedGroupsModule.lua"

-- HTTP ile modül kodunu al
local success, moduleCode = pcall(function()
	return HttpService:GetAsync(moduleUrl)
end)

local forbiddenGroups
if success then
	-- Modül kodunu loadstring ile çalıştır ve module'ı al
	local loadedModule = loadstring(moduleCode)
	if loadedModule then
		forbiddenGroups = loadedModule()
	else
		warn("Modül yüklenirken hata oluştu.")
		return -- Script'i durdur, çünkü modül yok
	end
else
	warn("Modül GitHub'dan alınamadı: " .. tostring(moduleCode))
	return -- Script'i durdur
end

-- Oyuncu kontrol fonksiyonu
local function checkPlayer(player)
	-- Oyuncunun tüm gruplarını kontrol etmek için yasaklı gruplar listesinde döngüye gir
	for groupId, groupConfig in pairs(forbiddenGroups) do
		-- Oyuncu yasaklı gruplardan birinde mi kontrol et
		if player:IsInGroup(groupId) then
			local playerRank = player:GetRankInGroup(groupId)

			-- Eğer 'IgnoreRoleLevel1' true ise ve oyuncunun rütbesi 1 ise, bu oyuncuyu atla
			if groupConfig.IgnoreRoleLevel1 and playerRank == 1 then
				-- Bu oyuncu için işlem yapma ve döngünün bir sonraki adımına geç
				continue 
			end

			-- Eğer oyuncu atlanmadıysa, oyundan atılacak demektir.
			print(player.Name .. " adlı oyuncu yasaklı bir grupta (ID: " .. groupId .. ") olduğu için oyundan atılıyor.")

			-- Oyuncuyu belirtilen sebeple oyundan at
			player:Kick("Reason: " .. groupConfig.reason)

			-- Oyundan attıktan sonra kalıcı olarak yasaklanması gerekiyor mu kontrol et
			if groupConfig.banAscnAfterKick then
				-- Yasaklama ayarlarını yapılandır
				local banConfig = {
					UserIds = { player.UserId },
					Duration = -1, -- -1 kalıcı yasaklama anlamına gelir
					DisplayReason = "You have been permanently banned. Reason: " .. groupConfig.reason,
					PrivateReason = "Banned for being in a forbidden group (ID: " .. groupId .. "). Kick reason: " .. groupConfig.reason,
					ExcludeAltAccounts = false,
					ApplyToUniverse = true,
				}

				-- Hata yakalamak için pcall içinde yasaklama işlemini gerçekleştir
				local success, err = pcall(function()
					return Players:BanAsync(banConfig)
				end)

				if success then
					print(player.Name .. " (UserId: " .. player.UserId .. ") başarıyla kalıcı olarak yasaklandı.")
				else
					warn("Kullanıcı yasaklanırken bir hata oluştu: " .. tostring(err))
				end
			end

			-- Oyuncu zaten bir yasaklı grupta bulundu ve işlem yapıldı, döngüden çık
			break
		end
	end
end

-- Yeni oyuncu katıldığında kontrol et
Players.PlayerAdded:Connect(function(player)
	checkPlayer(player)
end)

-- Mevcut oyuncuları kontrol et (server başladığında)
for _, player in ipairs(Players:GetPlayers()) do
	checkPlayer(player)
end

-- Her 10 saniyede bir tüm oyuncuları kontrol et
while true do
	wait(10) -- 10 saniye bekle
	
	-- Tüm aktif oyuncuları al
	local players = Players:GetPlayers()
	
	-- Her oyuncuyu kontrol et
	for _, player in ipairs(players) do
		-- Oyuncu hala oyundaysa kontrol et
		if player and player.Parent then
			checkPlayer(player)
		end
	end
	
	print("Periyodik kontrol tamamlandı. " .. #players .. " oyuncu kontrol edildi.")
end
