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

# [TÜRKÇE] RBX Grup Yasaklayıcı

## Genel Bakış

RBX Grup Yasaklayıcı'ı, belirli "kötü" grupların üyesi olan kullanıcıları oyununuzdan otomatik olarak yasaklamak için tasarlanmış bir Roblox sunucu tarafı betiğidir. Bu gruplar dolandırıcılar, istismarcılar veya şüpheli kişilere ait grupları içerebilir. Betik, grup kimliklerini bir modül betiğinden (`BannedGroupsModule.lua`) alır ve oyuncu katılımında yasaklamaları uygulamak için Roblox'un resmi yasaklama API'sini kullanır.

Bu, sorunlu kullanıcıların katılımını önleyerek Roblox deneyiminizde güvenli ve adil bir ortam sağlamanıza yardımcı olur.

**Temel Özellikler:**
- Yasaklı gruplardaki üyelerin otomatik olarak algılanması ve yasaklanması.
- Yasaklı grup kimliklerinin yapılandırılabilir listesi.
- Gereksiz yasaklamaları önlemek için varsayılan "1. seviye" rolleri (örneğin, Roblox gruplarındaki temel üye rolü) yok sayar.
- Roblox oyununuzun sunucu betiğine kolay entegrasyon.
- Betik çalıştığında otomatik güncellemeler.

**Not:** Bu betik, grup üyelerini ayrım gözetmeksizin hedef almaz veya onlardan nefret etmez; oyununuzu bilinen kötü niyetli kişilerden korumaya odaklanır.

## Kurulum

1. **Depoyu Klonlayın veya İndirin:**
- Yakında Roblox'un pazar yerinde/Roblox betik modelinde!

2. **Projenize Ekleyin:**
- İçe aktarma betiğini Sunucu betik hizmetine yerleştirin
- Şunları etkinleştirdiğinizden emin olun: HTTPS istekleri, Yükleme Dizesi Etkin

*UYARI: LoadStringEnabled, oyununuzu istismarlara karşı da savunmasız hale getirir!
NOT: LoadStringEnabled, üçüncü taraf yazılım kullanmadıkları sürece istemciler tarafından ÇALIŞTIRILAMAZ (bu istismar olarak sayılır);
Daha fazla bilgi için Roblox belgelerini okuyun*

3. **Yayınla ve Test Et:**
- Yerinizi Roblox'ta yayınlayın ve canlı bir sunucuda test edin.

## Kullanım

- Betik, `Players.PlayerAdded` aracılığıyla oyuncu katıldığında otomatik olarak çalışır. - Katılan bir oyuncu yasaklı bir gruptaysa (varsayılan rolün dışında), Roblox'un `Players:BanAsync(banConfig)` metodu kullanılarak yasaklanır.

### `BannedGroupsModule.lua`da Örnek Yapılandırma

```lua
local forbiddenGroups = {
  [123123123] = { -- Örnek Grup
  IgnoreRoleLevel1 = true, -- farkında olmadan katılmış olabilecek masum üyelerin yasaklanmasını önler. reason = "Bu grup/topluluğun karanlık bir geçmişi veya şüpheli geliştiricileri var.",
  banAscnAfterKick = true -- kullanıcıyı Roblox yasaklama API'si ile yasaklar
}
  --(Diğer gruplar)
}

return bannedGroups
```

### Gösterim

İşte test sırasında betiğin nasıl çalıştığını gösteren bazı ekran görüntüleri:

![Ekran Görüntüsü 1: Oyuncu Katılım Algılama](https://github.com/moonypaws/RBX-group-banner/blob/496154042c98e808487d97dfb72d6fc045ca0753/Ekran%20g%C3%B6r%C3%BCnt%C3%BCs%C3%BC%202025-10-16%20233349.png)
*Başlık: Yasaklanmış bir gruptan katılan bir oyuncunun algılanması grup.*

![Ekran Görüntüsü 2: Yasaklama Uygulaması](https://github.com/moonypaws/RBX-group-banner/blob/496154042c98e808487d97dfb72d6fc045ca0753/Ekran%20g%C3%B6r%C3%BCnt%C3%BCs%C3%BC%202025-10-16%20233503.png)
*Başlık: Roblox API'si kullanılarak yasaklama uygulanıyor.*

![Ekran Görüntüsü 3: Oyuncu, yeniden katıl](https://github.com/moonypaws/RBX-group-banner/blob/496154042c98e808487d97dfb72d6fc045ca0753/Ekran%20g%C3%B6r%C3%BCnt%C3%BCs%C3%BC%202025-10-16%20233534.png)
*Başlık: Oyuncu yasaklandı!.*

## Katkıda Bulunanlar

Yasaklı grupların listesini genişletmek veya senaryoyu geliştirmek için katkılarınızı bekliyoruz!

- **Kötü Grupları Gönderin:** Yeni grup kimlikleri önermek için [Discord sunucumuza](https://www.discord.gg/6TJJwcqXkg) katılın. İncelenmek üzere kanıt (örneğin, raporlara veya olaylara bağlantılar) sağlayın.
- **Sorunlar:** Hataları veya özellik taleplerini GitHub Sorunları aracılığıyla bildirin.

## Notlar

- Bu betik hala test aşamasındadır; daha detaylı açıklamalar ve özellikler yakında eklenecektir.
- Ban API'lerini kullanırken Roblox Hizmet Şartları'na uyduğunuzdan emin olun.
- "Seviye 1" rolleri için varsayılan yoksayma özelliği, farkında olmadan katılmış olabilecek masum üyelerin yasaklanmasını engeller.
