---
title: 硬體相容性
---

# 硬體相容性

## 最低系統需求

- **韌體**： UEFI ([**不支持**](../General/FAQ.md#does-bazzite-support-csmlegacy-boot) CSM/Legacy boot)
- **中央處理器 (CPU)** ： 2GHz、四核心或以上的處理器
  - **中央處理器架構**： x86-64
- **內存 (RAM)**： 8GB
- **顯示卡**： 支持 Vulkan 1.3 或以上的顯示卡
- **最低儲存空間**： 50GB 或以上的內置固態硬盤（SSD）
  - **建議儲存空間**： 120GB或以上的內置固態硬盤（SSD）
  - 安裝盤必須使用GUID磁碟分區表（GUID Partition Table、GPT）。在使用主引導記錄（Master Boot Record、MBR）的硬盤上安裝會導致安裝錯誤
    - Microsoft 提供一個 [將 MBR 磁碟分割轉換為 GPT 的工具](https://learn.microsoft.com/zh-hk/windows/deployment/mbr-to-gpt)。
    !!! warning "在對你的硬碟進行任何操作前，請務必備份你的個人資料！"
  - 外置及次要硬盤： 所有硬盤皆需為 BTRFS（適用於固態硬盤） 或 ext4（適用於旋轉硬碟） 格式。_請在安裝 Bazzite 後備份並重新格式化它們_。
  > 詳情請參考
- **網絡**： 穩定的互聯網連接（_安裝時毋須互聯網，互聯網連接僅用於更新。_）

!!! 溫馨提示

    某些外設硬件不支援 Linux 、而因此不支持 Bazzite。你可參考此[已知支援 Linux 的 USB Wi-Fi 適配器清單](https://github.com/morrownr/USB-WiFi/blob/main/home/USB_WiFi_Adapters_that_are_supported_with_Linux_in-kernel_drivers.md)。

> [**The Hardware for Linux 網址**](https://linux-hardware.org/?view=computers)是一個檢視各廠商 Linux 支援及相容性的優質指標

### Steam 遊戲模式的系統需求

!!! note

    下列系統需求僅適用於 Bazzite 掌機版，且與 [SteamOS](https://store.steampowered.com/steamos/) 系統需求大致相同。

- 近代的 AMD 顯示卡
  - RX 4xx 或更新的顯卡可運行 Steam 遊戲模式
    - 你亦可以使用 APU 上的 Radeon 600M/700M/8000S 系列核顯
- Intel ARC 系列在絕大部分情況下亦可運行 Steam 遊戲模式
- Nvidia 顯卡在 Steam 遊戲模式上僅有[最低限度的支持](/Handheld_and_HTPC_edition/quirks/#nvidia-gpu-exclusive-issues-with-steam-gaming-mode)<small>_能跑_</small>。
- 需 [**Steam**](https://store.steampowered.com/) 帳戶
  - 如你未擁有 Steam 帳戶，你可以在安裝後註冊

### 相容掌機

請參見[此分頁](./Handheld_and_HTPC_edition/Handheld_Wiki/index.md)。

<hr>

## Vulkan API 兼容性

!!! 溫馨提示

    由於種種原因，在 Linux 系統上運行遊戲極度依賴 [Vulkan](/zh_HK/General/terms/#bazzite_1)。

### 查閱顯卡的 Vulkan 版本

若你正在使用一些未支持 Vulkan 1.3 或更新版本的顯卡，你便需使用舊版 Proton、Wine以運行遊戲。對於這些顯卡來説，常用版本一般為 Proton/WINE 6 及 DXVK-Sarek。

你可在系統終端中輸入以下指令以查看顯卡支援的 Vulkan 版本：

```bash
vulkaninfo | grep 'Instance Version'
```

![Vulkan Command](https://github.com/user-attachments/assets/ccca14ca-3001-4aa6-bf47-e0dcbdb73936)

- 若此指令的輸出顯示 Vulkan 版本少於`1.3`，或沒有`Vulkan Instance Version:`輸出，你或會在運行遊戲時遇上如無法啟動遊戲、遊戲性能較差等問題。

- 十分老舊的顯示卡或需使用 OpenGL 傳譯層。這會導致各式各樣不同的問題，如性能損失、畫面顯示問題、渲染異常等。

> 如你的顯示卡僅支持 Vulkan 1.1/1.2，你可以嘗試使用 [**DXVK-Sarek**](https://github.com/pythonlover02/DXVK-Sarek) 。你可以透過設定 `PROTON_DXVK_SAREK=1` [環境函數](/Gaming/launch-options-env-variables)在 [Proton-CachyOS](https://github.com/CachyOS/proton-cachyos) 中使用它。 

!!! 溫馨提示 "使用 ProtonPlus 或 ProtonUp-Qt 以下載並安裝 [Proton-CachyOS](https://github.com/CachyOS/proton-cachyos) 。"

### 不支持 Vulkan 的顯示卡

若你的顯示卡完全不支持任何版本的 Vulkan API，你便需要在所有透過 Proton 運行的遊戲中設置以下啟動設定：

```bash
PROTON_USE_WINED3D=1 %command%
```

這會設置 Proton 使用 OpenGL 轉譯層，而非 DXVK 轉譯層。

<hr>

## 檔案儲存系統及格式

!!! 溫馨提示

    Bazzite 預設自動掛載所有 BTRFS 和 Ext4 格式的硬盤。

BTRFS 是 Bazzite 的預設及推介硬盤格式。若你欲遊玩儲存於非系統盤上的遊戲，那該硬盤應當使用 BTRFS 或 Ext4 格式。 如硬盤並非此格式，你便需要備份硬盤上的資料，並重新格式化這個硬盤。你可以[使用GNOME Disks格式化你的硬盤](../Advanced/Auto-Mounting_Secondary_Drives.md)，但請自行承擔相關風險。

!!! warning "格式化將移除硬盤上的所有資料。"

### 不支援的檔案系統／格式

!!! warning

    Bazzite 不支援 NTFS 及 exFAT/FAT32。這三種檔案系統在 Linux 環境下都可能且最終會導致資料損毀，且／或不支援 Proton/WINE 所需的功能。請勿使用它們！
    WinBTRFS 驅動目前仍存在Bug，且 Windows 的檔案權限系統與 Linux 截然不同，沒有人能夠保證這個設置日後不會遇到問題及／或資料遺失。

    綜上所述，遺憾的是目前尚無能夠在 Windows 與 Linux 之間可靠地共用的跨平台檔案系統。

!!! warning "格式化將移除硬盤上的所有資料。"

!!! 額外資訊

    你可以使用 `ujust _disable-ntfs-service` 指令以關閉 NTFS 警告，但這並不會使上述操作更加安全。

#### NTFS

若你原先使用 Windows ，而想遊玩安裝在外置硬盤上的遊戲，那這個硬盤很大機會正在使用 NTFS 格式。遺憾的是，Bazzite 並不支持遊玩安裝在 NTFS 格式上的遊戲。

在 NTFS 格式硬盤上遊玩遊戲的問題包括但不僅限於：

-  無法啟動遊戲
-  資料損毀
-  永久性的資料遺失

#### exFAT 和 FAT32

Bazzite 不支持遊玩安裝在 FAT32 或 exFAT 格式上的遊戲。這是因為 FAT 系列格式皆不支持 UNIX 符號連結（又稱軟連結）和 UNIX 檔案權限系統，而符號連結又是 WINE／Proton 所運行的必需條件。在某些情況下，你或可使用 exFAT 格式的SD卡遊玩遊戲，但 Bazzite 不建議、亦不支持這樣做。

此外， FAT 系列格式皆為非[日誌檔案系統](https://zh.wikipedia.org/wiki/%E6%97%A5%E5%BF%97%E6%96%87%E4%BB%B6%E7%B3%BB%E7%BB%9F)。這會間接地導致在 FAT 系列格式上的文件更加容易丟失或損壞，且令檔案復原更加困難。

### 在 Windows 上讀取 BTRFS 檔案

你可以在 Windows 上安裝非官方的 [WinBTRFS](https://github.com/maharmstone/btrfs) 驅動程式以在 Windows 上讀取 BTRFS 格式硬盤上的檔案。由於WinBTRFS 驅動目前仍存在Bug，且 Windows 的檔案權限系統與 Linux 截然不同，沒有人能夠保證這個設置日後不會遇到問題及／或資料遺失。同上，請自行承擔相關風險。
