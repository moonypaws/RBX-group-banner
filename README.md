# [ENGLISH] RBX Group Banner

## Overview

RBX Group Banner is a Roblox server-side script designed to automatically ban users from your game if they are members of specified "bad" groups. These groups might include scammers, exploiters, or those owned by shady individuals. The script pulls group IDs from a module script (`BannedGroupsModule.lua`) and uses Roblox's official ban API to enforce bans upon player join.

This helps maintain a safe and fair environment in your Roblox experience by preventing problematic users from participating.

**Key Features:**
- Automatic detection and banning of members from banned groups.
- Configurable list of banned group IDs.
- Ignores default "level 1" roles (e.g., the basic member role in Roblox groups) to avoid unnecessary bans.
- Easy integration into your Roblox game's server script.
- Auto updates when script runs.

**Note:** This script does not target or hate group members indiscriminately, it's focused on protecting your game from known bad people.

## Installation

1. **Clone or Download the Repository:**
   - Download from this repo.'s releases!

2. **Add to Your Project:**
   - Place import script at Server script service
   - make sure to enable: HTTPS requests, Load String Enabled

   *WARNING: LoadStringEnabled makes your game also vulneable for exploits!
		NOTE: LoadStringEnabled is CANNOT run from clients unless they use 3th party software (this counts as exploits); 
		read roblox's documents for more information*

3. **Publish and Test:**
   - Publish your place to Roblox and test in a live server.

## Usage

- The script runs automatically on player join via `Players.PlayerAdded`.
- If a joining player is in a banned group (beyond the default role), they will be banned using Roblox's `Players:BanAsync(banConfig)` method.

### Example Configuration in `BannedGroupsModule.lua`

```lua
local forbiddenGroups = {
	[123123123] = { -- Example Group
		IgnoreRoleLevel1 = true, -- prevents banning innocent members who might have joined unknowingly.
		reason = "This group/community has a dark past or shady developers.",
		banAscnAfterKick = true -- bans user whit roblox ban API
	}

  --(Other groups)
}

return bannedGroups
```

### Demonstration

Here are some screenshots showing the script in action during testing:

![Screenshot 1: Player Join Detection](https://github.com/moonypaws/RBX-group-banner/blob/496154042c98e808487d97dfb72d6fc045ca0753/Ekran%20g%C3%B6r%C3%BCnt%C3%BCs%C3%BC%202025-10-16%20233349.png)
*Caption: Detecting a player joining from a banned group.*

![Screenshot 2: Ban Enforcement](https://github.com/moonypaws/RBX-group-banner/blob/496154042c98e808487d97dfb72d6fc045ca0753/Ekran%20g%C3%B6r%C3%BCnt%C3%BCs%C3%BC%202025-10-16%20233503.png)
*Caption: Applying the ban using Roblox API.*

![Screenshot 3: Player tries to rejoin](https://github.com/moonypaws/RBX-group-banner/blob/496154042c98e808487d97dfb72d6fc045ca0753/Ekran%20g%C3%B6r%C3%BCnt%C3%BCs%C3%BC%202025-10-16%20233534.png)
*Caption: Player banned!.*

## Contributing

We welcome contributions to expand the list of banned groups or improve the script!

- **Submit Bad Groups:** Join our [Discord server](https://www.discord.gg/6TJJwcqXkg) to suggest new group IDs. Provide evidence (e.g., links to reports or incidents) for review.
- **Issues:** Report bugs or feature requests via GitHub Issues.

## Notes

- This script is still in testing—more detailed explanations and features coming soon.
- Ensure you comply with Roblox's Terms of Service when using ban APIs.
- The default ignore for "level 1" roles prevents banning innocent members who might have joined unknowingly.

------------------------------------------------------------------------------------------------------------------------------------------------------------

# [TÜRKÇE] RBX Group Ban Script

## Genel Bakış

RBX Group Ban Script, Roblox sunucu tarafı bir betiğidir ve belirtilen "kötü" grupların üyelerini oyununuzdan otomatik olarak yasaklamak için tasarlanmıştır. Bu gruplar dolandırıcılar, exploit kullanıcıları veya şüpheli bireylere ait olan grupları içerebilir. Script, grup ID'lerini bir modül betiğinden (`BannedGroupsModule.lua`) çeker ve oyuncunun katılımı sırasında Roblox'un resmi ban API'sini kullanarak yasakları uygular.

Bu, Roblox deneyiminizde sorunlu kullanıcıların katılımını engelleyerek güvenli ve adil bir ortamı korumanıza yardımcı olur.

**Ana Özellikler:**
- Yasaklanmış grupların üyelerinin otomatik algılanması ve yasaklanması.
- Yapılandırılabilir yasaklanmış grup ID'leri listesi.
- Varsayılan "seviye 1" rolleri (örneğin, Roblox gruplarındaki temel üye rolü) görmezden gelerek gereksiz yasakları önler.
- Roblox oyununuzun sunucu betiğine kolay entegrasyon.
- Script çalıştığında otomatik güncelleme.

**Not:** Bu script, grup üyelerine ayrımcılık yapmaz veya nefret etmez; yalnızca bilinen kötü kişilerden oyununuzu korumaya odaklanır.

## Kurulum

1. **Depoyu Klonlayın veya İndirin:**
   - Bu repo'nun yayınlarından indirin!

2. **Projeye Ekleyin:**
   - Import betiğini Server Script Service'e yerleştirin
   - Şu ayarları etkinleştirin: HTTPS istekleri, Load String Enabled

   *UYARI: LoadStringEnabled oyununuzu exploit'lere karşı da savunmasız hale getirir!
		NOT: LoadStringEnabled istemcilerden ÜÇÜNCÜ PARTİ YAZILIM kullanmadıkça çalıştırılamaz (bu exploit sayılır); 
		daha fazla bilgi için Roblox belgelerini okuyun*

3. **Yayınlayın ve Test Edin:**
   - Yerleşiminizi Roblox'a yayınlayın ve canlı sunucuda test edin.

## Kullanım

- Script, `Players.PlayerAdded` aracılığıyla oyuncu katılımında otomatik olarak çalışır.
- Katılan oyuncu yasaklanmış bir gruptaysa (varsayılan rolün ötesinde), Roblox'un `Players:BanAsync(banConfig)` yöntemiyle yasaklanır.

### `BannedGroupsModule.lua` İçinde Örnek Yapılandırma

```lua
local forbiddenGroups = {
	[123123123] = { -- Örnek Grup
		IgnoreRoleLevel1 = true, -- Bilmeden katılmış masum üyelerin yasaklanmasını önler.
		reason = "Bu grup/topluluk karanlık bir geçmişe sahip veya şüpheli geliştiricilere aittir.",
		banAscnAfterKick = true -- Kullanıcıyı Roblox ban API'si ile yasaklar
	}

  --(Diğer gruplar)
}

return bannedGroups
```

### Gösterim

Test sırasında script'in çalıştığını gösteren ekran görüntüleri:

![Ekran Görüntüsü 1: Oyuncu Katılım Algılama](https://github.com/moonypaws/RBX-group-banner/blob/496154042c98e808487d97dfb72d6fc045ca0753/Ekran%20g%C3%B6r%C3%BCnt%C3%BCs%C3%BC%202025-10-16%20233349.png)
*Başlık: Yasaklanmış gruptan katılan oyuncunun algılanması.*

![Ekran Görüntüsü 2: Ban Uygulama](https://github.com/moonypaws/RBX-group-banner/blob/496154042c98e808487d97dfb72d6fc045ca0753/Ekran%20g%C3%B6r%C3%BCnt%C3%BCs%C3%BC%202025-10-16%20233503.png)
*Başlık: Roblox API'si ile ban uygulanması.*

![Ekran Görüntüsü 3: Oyuncu Tekrar Katılmaya Çalışıyor](https://github.com/moonypaws/RBX-group-banner/blob/496154042c98e808487d97dfb72d6fc045ca0753/Ekran%20g%C3%B6r%C3%BCnt%C3%BCs%C3%BC%202025-10-16%20233534.png)
*Başlık: Oyuncu yasaklandı!.*

## Katkı Sağlama

Yasaklanmış gruplar listesini genişletmek veya script'i iyileştirmek için katkılarınızı bekliyoruz!

- **Kötü Grupları Bildirin:** Yeni grup ID'leri önermek için [Discord sunucumuza](https://www.discord.gg/6TJJwcqXkg) katılın. İnceleme için kanıt sağlayın (örneğin, rapor veya olay bağlantıları).
- **Sorunlar:** Hataları veya özellik isteklerini GitHub Issues aracılığıyla bildirin.

## Notlar

- Bu script hala test aşamasındadır—daha detaylı açıklamalar ve özellikler yakında eklenecek.
- Ban API'lerini kullanırken Roblox'un Hizmet Şartlarına uyduğunuzdan emin olun.
- Varsayılan "seviye 1" rolleri görmezden gelme özelliği, bilmeden katılmış masum üyelerin yasaklanmasını önler.
