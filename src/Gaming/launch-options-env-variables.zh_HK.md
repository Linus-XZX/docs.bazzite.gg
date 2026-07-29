---
title: 啟動選項與環境函數
---

# 啟動選項與環境函數

## 前言

今時今日，在 Linux 上運行遊戲比起兩年前簡單得多。即便如此，你仍可使用各種啟動選項與環境函數進行進階設定。下文將展示一些設置這些進階選項的範例。

## 使用DXVK、MangoHud 和 vkBasalt 的設定範本

![Template|690x334, 50%](../img/DXVK_Mango_VkBasalt_templ.png)

你可使用右鍵選單中選取並使用各種預安裝工具的設定範本創建一個新的文檔。此外，你亦可以使用一些用以修改這些設定檔，提供圖形使用者介面的程式，如 [**Mango Juice**](https://flathub.org/zh-Hant/apps/io.github.radiolamp.mangojuice)。

## Steam 啟動選項與快捷設置

你可以在 Steam 的啟動選項中傳遞環境函數、參數和指令至遊戲中。此外， Bazzite 亦提供一些設置常用選項的小工具。

### 常見的啟動選項排列模式

絕大部分的 Steam 啟動選項皆跟隨此排列模式： `環境函數=1 腳本／程式 %command% --參數`

- `%command%` 為 Steam 客戶端運行的遊戲程式執行檔（大部分時間，此實際是為使用 Proton 運行的遊戲生成的指令清單）。此字眼必須於啟動選項中出現，除非：
  - 啟動選項為空白或僅包含參數
  - 腳本／程式繞過 Steam 客戶端自行啟動遊戲程式
- 環境函數必須於 `%command%` 前出現，除非：
  - 你已在 `~/.config/environment.d` 或其他位置設定全域環境函數
  - 你已在 Bazzite Portal 設定全域環境函數（而其修改同上）
  - 腳本／程式已自行設置環境函數
- 其他需傳遞至遊戲（即遊戲自身會收到的）參數需排列於 `%command%` 之後

**範例:**
```bash
PROTON_LOG=1 %command%                    # 開啟 Proton 日誌
STEAMDECK=0 %command%                     # 關閉 Steam Deck 模式
PROTON_ENABLE_NGX_UPDATER=1 %command%     # 啟用 Proton 的 DLSS DLL檔覆寫功能
%command% --in-process-gpu                # 修復某些 Unity 遊戲的啟動白屏問題
scb %command%                             # 使用 ScopeBuddy（gamescope 輔助程式）啟動遊戲
```

### Proton 的啟動選項
<small>_咁熟口面！？ 冇錯，呢部份係抄[Proton-CachyOS Wiki](https://wiki.cachyos.org/configuration/gaming/#environment-variables)㗎！_</small>

大部分的 Proton 分支皆設有它們自己的 Unstable 設置，詳情請查閱各分支的文檔：

- Proton-CachyOS
  - [Readme](https://github.com/CachyOS/proton-cachyos/blob/cachyos_main/README.md#proton-cachyos-config-options)
  - [Changelogs](https://github.com/CachyOS/proton-cachyos/blob/cachyos_main/CHANGELOG.md)
- Proton-EM
  - [Readme](https://github.com/Etaash-mathamsetty/Proton/blob/em-11-hdr/README.md)
  - [EM-ADDITIONS](https://github.com/Etaash-mathamsetty/Proton/blob/em-10-hdrtest/docs/EM-ADDITIONS.md)
  - [FSR4](https://github.com/Etaash-mathamsetty/Proton/blob/em-10-hdrtest/docs/FSR4.md)
  - [Wine-Wayland](https://github.com/Etaash-mathamsetty/Proton/blob/em-10-hdrtest/docs/CHANGES.md)

### Bazzite 的快捷設置

Bazzite 提供數個常用環境函數的快捷設置。

#### Steam Deck 模式

- **`sd0 %command%`** - `SteamDeck=0 %command%` 的快捷設置
  - 關閉某些遊戲提供的 Steam Deck 專用優化
  - 例： 若未設定`SteamDeck=0` ，Expedition 33 會於設定中隱藏大部份畫面設定，且將畫質調至比「最低」更低的檔位。

#### 對於 Nvidia 用家的 DLSS 設置 (dlss-swapper)

- **`dlss-swapper %command%`** - 啟用最新版本的 DLSS 配置
  - 以下環境函數： `PROTON_ENABLE_NGX_UPDATER=1 DXVK_NVAPI_DRS_SETTINGS=NGX_DLSS_SR_OVERRIDE=on,NGX_DLSS_RR_OVERRIDE=on,NGX_DLSS_FG_OVERRIDE=on,NGX_DLSS_SR_OVERRIDE_RENDER_PRESET_SELECTION=render_preset_latest,NGX_DLSS_RR_OVERRIDE_RENDER_PRESET_SELECTION=render_preset_latest %command%`
- **`dlss-swapper-dll %command%`** - 同上，但關閉 `NGX updater`

!!! 額外資訊
    
    由於 DLSS 中各版本的性能與畫質皆有差異（而非如 FSR 般的一刀切越新=越好）， Bazzite 仍會繼續提供此環境函數快捷設置。你可以此版本與可於 Bazzite Portal 上設置的 `PROTON_DLSS_UPGRADE=1` 作比較。

#### 如何設置啟動選項

1. 在 Steam 裏選取並打開右鍵列表
2. 點擊**內容...**
3. 在**一般**分頁中，尋找**啟動選項**設置
4. 修改你的啟動選項

![Launch Options view|833x594, 75%](../img/Steam_Launch_Options.png)

## 關於幀率限制器

無論你是否使用 Gamescope 或 Steam 遊戲模式，你都有多種不同的幀率限制器可供使用。遺憾的是，目前並沒有一個絕對最佳，並對所有設置適用的幀率限制器。

以下為各幀率限制器的比較圖表：

=== "Steam 遊戲模式"

    | 幀率限制方式 | 設置方式 | 是否需要遊戲內設置垂直同步？ | 是否無需重啟遊戲以應用設置？ | 延遲 | 建議 | 額外資訊 |
    |---|---|---|---|---|---|---|
    | **Gamescope 幀率限制器** | **Quick Access Menu → Performance → Framerate Limit** | 否 | 是 | 一般 | **是** | 自動啟用驅動層垂直同步，將顯著增加延遲 |
    | **Gamescope 內建 mangoapp** | - | - | - | - | – | 無法運作 |
    | **外設 MangoHUD** | **啟動選項：** `MANGOHUD=1 %command%` | 否 | 是 | 一般 | – | 於`MangoHud.conf`中設置`fps_limit=0,{fps}...`（`0`為關閉），或使用 [MangoJuice](https://flathub.org/zh-Hant/apps/io.github.radiolamp.mangojuice) |
    | **DXVK/VKD3D 運行環境幀率限制器** | **DXVK(D3D8/9/10/11):** `DXVK_FRAME_RATE={fps} %command%`<br>**VKD3D(D3D12):** `VKD3D_FRAME_RATE={fps} %command%` | 否 | 否 | 佳 | – | 僅限使用 DXVK/VKD3D 的遊戲 |

=== "桌面模式 (GNOME / KDE Plasma 桌面)"

    | 幀率限制方式 | 設置方式 | 是否需要遊戲內設置垂直同步？ | 是否無需重啟遊戲以應用設置？ | 延遲 | 建議 | 額外資訊 |
    |---|---|---|---|---|---|---|
    | **Gamescope 幀率限制器** | **Launch Options**: `gamescope -r {fps} -- %command%` / `--framerate-limit {fps}` | 是 | 是* | 一般 | – | *需使用 `gamescopectl debug_set_fps_limit {fps}`以無需重啟地更改限制器幀率 |
    | **Gamescope 內建 mangoapp** | **啟動選項：** `gamescope --mangoapp -- %command%` | 是 | 是 | 一般 | – | 設定或不生效，設置方式與 MangoHUD 相同 |
    | **外設 MangoHUD** | **啟動選項：** `MANGOHUD=1 %command%` | 否 | 是 | 一般 | **是** | 於`MangoHud.conf`中設置`fps_limit=0,{fps}...`（`0`為關閉），或使用 [MangoJuice](https://flathub.org/zh-Hant/apps/io.github.radiolamp.mangojuice) |
    | **DXVK/VKD3D 運行環境幀率限制器** | **DXVK(D3D8/9/10/11):** `DXVK_FRAME_RATE={fps} %command%`<br>**VKD3D(D3D12):** `VKD3D_FRAME_RATE={fps} %command%` | 否 | 否 | 佳 | – | 僅限使用 DXVK/VKD3D 的遊戲 |

若幀率限制器設置無法正常運作，你可以嘗試另一種幀率限制器及／或以下設置：
- 於 Gamescope 及遊戲中關閉幀率自適應同步及移除 `--adaptive-sync`
- 在遊戲中打開垂直同步

!!! 額外資訊
    
    顯示延遲是一個複雜的議題，且因不同配置而異。目前，世上並不存在適用於所有情況的「最佳」幀率限制器，若想為自身配置尋求最低的延遲，進行多次測試是不可避免的。

    此外，自 3.0 版本起，上游的 DXVK 和 VKD3D 已移除透過 `DXVK_FRAME_RATE` 環境變數設定幀率限制。此環境變數設定的支援功能已轉移至下游專案，例如 Proton-CachyOS 及其他 Proton 變體（Valve 官方的 Proton 則使用上游的 DXVK/VKD3D）。若你需要或希望使用 DXVK/VKD3D 運行環境的幀率限制功能，請使用 [Proton 分支](#proton-launch-options) 或 [DXVK Low-Latency](https://github.com/netborg-afps/dxvk-low-latency) 搭配 WINE 使用。
    
    你可以先嘗試使用包含 DXVK-LL 的 Proton-CachyOS ，然後啟用 `PROTON_DXVK_LOWLATENCY=1`。

## 基於 ScopeBuddy 進行進階啟動選項管理

如你需要更加進階地管理啟動選項和 Gamescope，你可以嘗試使用 **[ScopeBuddy](../Advanced/scopebuddy.md)** 。
