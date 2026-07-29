---
title: 遊戲常見問題
---

# 遊戲常見問題

## 原生 Linux 版本與轉譯 Windows 版本

一些原生 Linux 版本的遊戲對比 Windows 版本或會缺失功能或性能較差。 但有些時候，你只能使用此版本且此比運行 Windows 版本為更佳選擇。

若 Linux 原生版本無法正常運行，你可以在 **Steam → 內容... → 相容性**中打開**強制使用特定 Steam Play 相容性工具**。

!!! warning "請**務必**使用 Counter Strike 2（絕對武力 2） 的原生 Linux 版本（即關閉**強制使用特定 Steam Play 相容性工具**）。 使用 Proton 運行 CS2 有機會導致 VAC 封禁！"

## 被 Denuvo Anti-Tamper DRM 鎖定遊戲

使用 Denuvo Anti-Tamper DRM 的遊戲將更改 Proton 版本視為於新硬件上重新激活遊戲。在 24 小時內更改 Proton 版本超過 5 次有機會使你的遊戲被暫時鎖定，而你需等待 24 小時方能再次激活遊戲。

---

## Source 1 引擎的音效和自定義內容 Bug

!!! 溫馨提示

    此章節僅適用於使用 [Source 引擎](https://www.pcgamingwiki.com/wiki/Engine:Source) 的遊戲。

!!! 溫馨提示

    在非必要的情況下**不要**在 _Left 4 Dead 2（惡靈勢力2）_ 中使用以下指引。

安全性增強型 Linux （SELinux）會封鎖程式[使用「堆」記憶體池（Heap Memory，又稱「自由儲存區」）](https://github.com/ValveSoftware/steam-for-linux/issues/43)。這有機會導致 Source 引擎的遊戲無法正常對 MP3 音效檔進行解碼以及處理其他資源，導致音效及資源缺失。此外，此問題亦有機會影響在 _Left 4 Dead 2（惡靈勢力2）_ 中加入或架設自定義地圖。

### 修復 Source 引擎與 SELinux 的衝突

!!! warning "設定 SELinux 為**進階**設置。若操作不當，此舉可能會損壞的其他系統元件，並削弱裝置安全性。"

你可以根據 `hl2_linux` 所遇到的所有安全性封鎖記錄創建一個自訂政策模組以允許其執行，然後安裝並啟用此模組以修復 Source 引擎與 SELinux 的衝突。
**請自行承擔執行以下指令的所有後果**！

=== "創建並安裝政策模組"

    ```bash
    sudo -i
    cd /tmp
    ausearch -c 'hl2_linux' --raw | audit2allow -M my-hl2linux
    semodule -X 300 -i my-hl2linux.pp
    ```
    此後，你可重啟裝置並檢查是否仍遇到上述問題。

=== "停用政策模組"

    ```bash
    semodule -X 300 -d my-hl2linux
    ```

=== "移除政策模組"

    ```bash
    semodule -X 300 -r my-hl2linux
    ```
    若你想移除 `.pp`政策模組檔，你可於`/root/`中將其移除。
    
---

## 無法啟動 Steam 遊戲

有很多種原因可導致 Steam 遊戲無法啟動。下列將記錄常見引致 Steam 遊戲無法啟動的原因和解決辦法（泛指 Steam 遊戲由「停止」跳轉至「開始遊戲」而無彈窗或／及顯示錯誤）。

### `gamemoderun`

!!! 溫馨提示

    此處指的（Feral） GameMode 並不是於 Bazzite 掌機版中的 Steam 遊戲模式。（Feral） GameMode 為一個代遊戲向系統請求優化運行的函式庫。

若你在 Steam 啟動設置中添加 `gamemoderun %command%` ，該遊戲將不會正常啟動。此啟動設置常見於 ProtonDB。

請將此啟動設置移除，原因有三： <small>_人有五名，代價有三..._</small>

-   Bazzite 不支持，亦不預安裝 GameMode
-   GameMode 於近代硬件上幾乎無效
-   ...且有機會降低系統及遊戲性能

若你添加 `gamemode` 包至系統樹，此設置或能工作，但 Bazzite 對其不提供任何支持。

### NTFS 格式硬盤的權限問題

請確保你的遊戲並非儲存在 NTFS 格式的硬盤上。詳情請參考[此處](/zh_HK/Gaming/Hardware_compatibility_for_gaming/#_5)。

### 在多用戶設置上使用的 WINE 的特殊情況

!!! 溫馨提示

    Bazzite 掌機版不支持 Linux 多用戶設置。 此資訊僅適用於 Bazzite 桌面版。

有些時候，Steam 遊戲在次要用戶上時將完全無法啟動。此或為 WINE Prefix 檔案的所有權設置問題。你可透過於次要用戶檢查 `~/.local/share/Steam/logs/console-linux.txt` 是否包含以下訊息以鑑定你是否遇到此問題。

```
wineserver: /SteamLibrary/steamapps/compatdata/<App ID>/pfx is not owned by you
```

你可以創建一個屬於次要用戶的新 Steam Library 文件夾，然後將其中的 Prefix 數據及其他文件以符號連結（Symlink）指向至主用戶的 Prefix 中。

```console
USER2@bazzite: /mnt/ExtraStuff/USER2SteamLibrary/steamapps$ ls -la
total 32
drwxrwxr-x. 3 USER2 steamplayers 4096 Jan 29 15:19 .
drwxrwsr-x. 3 USER2 steamplayers 4096 Jan 29 16:13 ..
-rwxr-xr-x. 1 USER2 USER2         2287 Jan 29 15:19 appmanifest_377160.acf
lrwxrwxrwx. 1 USER2 USER2           51 Jan 29 15:10 common -> /mnt/ExtraStuff/USER1SteamLibrary/steamapps/common/
drwxr-xr-x. 3 USER2 USER2         4096 Jan 29 15:13 compatdata
lrwxrwxrwx. 1 USER2 USER2           56 Jan 29 15:12 shadercache -> /mnt/ExtraStuff/USER1SteamLibrary/steamapps/shadercache/
lrwxrwxrwx. 1 USER2 USER2           49 Jan 29 15:12 temp
lrwxrwxrwx. 1 USER2 USER2           53 Jan 29 15:12 workshop
```

---

## 獲取 Proton 日誌檔案

若你在使用 Proton 啟動遊戲時遇到問題，你可以使用以下方法獲取 Proton 日誌檔案。

1. 添加 `PROTON_LOG=1 %command%` [環境函數](/Gaming/launch-options-env-variables)至 Steam 或其他啟動器的啟動設置之中
2. 啟動遊戲
3. 日誌檔案將儲存於 `~/steam-{App ID}.log` <small>`{App ID}`對應遊戲的 App ID </small>

在 Bazzite 社區尋求幫助，或是提交 Bug Report 至上游（包括 Valve ）的項目庫的時候，此日誌檔案或能有助更快地找出問題所在。
