---
title: 管理及安裝遊戲模組
---

# 管理及安裝遊戲模組

## 轉譯層與管理 Windows 遊戲

![Proton Plus|1797x1412, 43%](../img/proton-plus.png)

Windows 遊戲需要通過例如 Wine／Proton 的轉譯層才能運行於 Bazzite 之上。 你可以使用 ProtonPlus 或 ProtonUp-Qt管理不同的 Proton 分支或 [Luxtorpeda](https://codeberg.org/luxtorpeda/luxtorpeda)。

## Protontricks

![Protontricks|660x500](../img/Protontricks.png)

部分遊戲需要使用 [Protontricks](https://github.com/Matoking/protontricks) （預安裝）或 [Winetricks](https://github.com/Winetricks/winetricks) （供非 Steam 遊戲使用，包含在 Lutris 中）以正常工作。

## 檔案總管裏的隱藏檔案

!!! 溫馨提示

    你可使用 Winecfg 打開**顯示隱藏檔案**以用於會呼叫 Wine 檔案總管的 Windows 程式。

桌面 Linux 包含不少重要的隱藏檔案與文件夾。你可以在系統的檔案總管程式中啟用**Show Hidden Files**以查看預設隱藏的檔案與文件夾。

隱藏的檔案和文件夾皆帶有`.`前綴。


### 甚麼是 Proton／WINE Prefix？

Proton／WINE 設有一個虛擬 Windows 目錄，這一般被稱為 Prefix 或 Bottle。 Windows 遊戲所創建及存取的檔案如遊戲存檔、設置檔、登錄檔等等皆儲存於此<small>_`%appdata%`，我想你了_</small>，但遊戲本體則不在此限。

!!! 溫馨提示

    Steam 遊戲的本體一般會位於 `~/.steam/root/steamapps/common/遊戲名稱`

不少 Windows 遊戲會於 `My Documents` 或 `AppData` 創建及存取文件，這些文件皆位於 Prefix 之內。你可於其中修改，備份，及安裝遊戲模組和插件。

![AppID|690x482, 75%](../img/Steam_AppID.png)

在 Steam 中安裝的遊戲的 Prefix 位於 `~/.steam/root/steamapps/compatdata/<APPID>`（APPID為對應遊戲的一串數字）

- 你可於**內容 → 更新 → App ID** 查看 App ID
- 繼續前往 `.../pfx/drive_c/` 以修改、備份、或安裝你的遊戲模組

你可以自由設定非 Steam 遊戲的 Prefix 位置， Lutris 預設使用 `~/Games`。

#### Proton Prefix 炸了？

!!! warning "移除 Proton Prefix 會**_刪除遊戲存檔和設置_**！"

=== "使用 Protontricks"
    
    1. 在 Protontricks 中選擇你的遊戲
    2. 點選 Select the default wineprefix
    3. 點選 Delete ALL DATA AND APPLICATIONS INSIDE THIS PROTON PREFIX
        
=== "人手移除 Prefix"

    開啟並移除帶有對應數字 App ID 的文件夾。
    
    注意**不要**移除整個 `compatdata` 文件夾，這樣做會移除所有遊戲的 Prefix 與連帶的全部遊戲存檔和設置。

## 安裝遊戲模組／啟動器

-   **Steam 創意工坊**為安裝模組的最簡單方式，但其未必被所有遊戲所支援，且需要你在 Steam 上擁有此遊戲。 
-   有些模組管理器提供 Linux 版本，如 [r2modman](https://github.com/ebkr/r2modmanPlus) 
-   你亦可人手將模組檔案放置至遊戲或 Prefix 的文件夾中（位置因遊戲而異）
    -   有的時候，你亦需要額外手動添加 [WINE DLL 覆寫設定](#wine-dll)。
-   你亦可以將僅提供 Windows 版本的遊戲／模組啟動器添加至 Steam 之中，然後將其 Prefix 符號連結（Symlink）至遊戲本體的 Prefix 中。

### 添加 WINE DLL 覆寫設定

你可以以下方式設置WINE DLL 覆寫設定：

=== "Protontricks (Steam 遊戲)"

    1. 在 Protontricks 中選擇你的遊戲
    2. 點選 Select the default wineprefix
    3. 點選 **Run wincfg**
    4. 於 Libraries 分頁, 設置你的 WINE DLL 覆寫設定
    
=== "Wine Configuration (非 Steam 遊戲)"

    1. 於 Lutris、 Faugus Launcher 或其他 Proton／WINE 啟動器中，選取你的遊戲並打開 **Wine Configuration**
    2. 於 Libraries 分頁, 設置你的 WINE DLL 覆寫設定

=== "環境函數"
    
    於 Steam 啟動設置中添加你的環境函數，如下：
    **DirectInput8 DLL 覆寫**: 
    ```bash
    WINEDLLOVERRIDES="dinput8=n,b" %command%
    ```
