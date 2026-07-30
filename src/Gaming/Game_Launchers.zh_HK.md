---
title: 遊戲啟動器
---

# 遊戲啟動器

## 使用 Steam

Steam 使用 [Proton 轉譯層](/General/terms/#bazzite_1)以運行 Windows 遊戲。詳見[遊玩 Steam 遊戲](/zh_HK/Gaming/gaming-intro)。

### 強制使用特定 Proton／Steam Play 工具

#### 重要注意事項

-   若遊戲提供原生 Linux 版本，Steam 會預設優先運行該版本
-   在 Bazzite 掌機版上， Valve 將預設使用其推介的 Steam Play 工具
-   在某些遊戲中，你或可使用其他 Proton 分支以獲取更好的體驗，但反之亦然

你可以在 **Steam → 內容... → 相容性**中打開**強制使用特定 Steam Play 相容性工具**以更改所使用的 Proton 分支或 Linux 原生版本（如有）。

!!! warning "請**務必**使用 Counter Strike 2（絕對武力 2） 的原生 Linux 版本（即關閉**強制使用特定 Steam Play 相容性工具**）。 使用 Proton 運行 CS2 有機會導致 VAC 封禁！"

#### 圖例

![Cog Icon > Properties|690x284, 75%](../img/Steam_Setup_Cog.png)
![Compatibility tab|690x492, 75%](../img/Steam_Setup_Compat_Tab.png)


## 非 Steam 遊戲

你可使用 Lutris 或其他啟動器（例如 [**Heroic Games Launcher**](https://flathub.org/zh-Hant/apps/com.heroicgameslauncher.hgl)（適用於 GOG/Epic/Amazon 遊戲）和 [**Faugus**](https://flathub.org/zh-Hant/apps/io.github.Faugus.faugus-launcher)），來協助管理非 Steam 遊戲的 Proton Prefix、Proton Runner 版本和分支以及[啟動選項與環境函數](/zh_HK/Gaming/launch-options-env-variables/)。

!!! note "你可以透過 **Bazaar 應用商店**安裝其他啟動器。"

!!! info "你亦能添加非 Steam 遊戲至 Steam ，並使用 Steam 管理你的 Proton Prefix。 這在 Bazzite 掌機版與 Steam 遊戲模式中相當有用。"

### 設置

大部分時間，你只需透過 **Add locally installed game** 選項來指定遊戲位置即可。隨後，啟動器會自動為你建立並管理 Proton Prefix。若你希望自行管理 Prefix 的位置，亦可於你選擇的啟動程式中選取相應的選項。

!!! note "Lutris 提供兩種遊玩 Windows 遊戲的方法：使用社群開發的腳本，或手動新增遊戲。由於部分腳本維護不佳，Bazzite **建議使用手動方法**。"

### 手動新增遊戲

!!! 溫馨提示

    其他啟動器的設置方式皆與以下步驟大同小異。

![Add Locally Installed Game|632x496, 75%](../img/Lutris_Setup_Add_Local_Game.png)

![Lutris manually adding games example 1|690x213](../img/Lutris_Setup_Add_Local_Game_1.png)

Lutris 會預設使用`~/Games`文件夾儲存遊戲的 [**Prefix**](/zh_HK/Gaming/Managing_and_modding_games/#protonwine-prefix) 。

### 添加桌面捷徑

![Lutris_Right_Click_Menu|421x447, 75%](../img/Lutris_Setup_Shortcut.png)

你可以透過進入啟動器的**編輯**分頁或右鍵選單並選擇相應的選項，將遊戲的捷徑新增至應用程式選單或桌面。
