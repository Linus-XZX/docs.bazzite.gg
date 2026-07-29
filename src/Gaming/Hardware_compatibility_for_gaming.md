---
title: Hardware Compatibility for Linux Gaming
---

# Hardware Compatibility for Linux Gaming

## Minimum System Requirements

- **Firmware**: UEFI (CSM/Legacy boot is [**UNSUPPORTED**](../General/FAQ.md#does-bazzite-support-csmlegacy-boot))
- **Processor (CPU)** : 2GHz quad core processor or better
  - **Architecture**: x86-64
- **System Memory (RAM)**: 8GB
- **Graphics**: A graphics card that can utilize Vulkan 1.3 or higher
- **Storage**: 50GB of free space on an internal **Solid-State Drive (SSD)**
  - **Recommended Storage**: 120GB of free space on an internal **Solid-State Drive (SSD)**
  - Existing disks **must** be **GPT**. Attempting to install Bazzite to an MBR (Master Boot Record) partitioned disk will fail.
    - Microsoft provides a [tool to convert existing Windows installations to GPT](https://learn.microsoft.com/en-us/windows/deployment/mbr-to-gpt).
    !!! warning "Make sure you backup all important personal files before doing any operations on your disk!"
  - **External Storage & Secondary Drives**: All drives must be formatted as **BTRFS (Solid-State Drives [SSDs])** or **Ext4 (Hard Disk Drives [HDDs])**. _Please backup the files and reformat them post-installation._
  > See [here](#unsupported-filesystems-for-secondary-drives) for more information.
- **Network**: Stable internet connection with no bandwidth caps (_not required for installation_)

!!! note

    Certain peripherals are **not** compatible with Linux, and thus Bazzite, depending on the manufacterer. For **Wi-Fi Adapters**, [a list of **known compatible** USB Wi-Fi adapters](https://github.com/morrownr/USB-WiFi/blob/main/home/USB_WiFi_Adapters_that_are_supported_with_Linux_in-kernel_drivers.md) is available.

>[**The Hardware for Linux website**](https://linux-hardware.org/?view=computers) is a good indicator for how well OEM hardware is supported on the Linux desktop.

### Steam Gaming Mode Requirements

!!! note

    These specific requirements only apply to [Bazzite-Deck images](/Handheld_and_HTPC_edition/Steam_Gaming_Mode.md) which ships with all handheld Bazzite ISO downloads, and are similar to that of [SteamOS](https://store.steampowered.com/steamos/)

- Modern AMD GPU
  - RX 4xx series and up
    - 600M/700M integrated GPUs are also supported
- Intel Arc GPUs are supported with **minor caveats** compared to AMD hardware
- Nvidia GPU is supported with [**major caveats**](/Handheld_and_HTPC_edition/quirks/#nvidia-gpu-exclusive-issues-with-steam-gaming-mode) compared to AMD hardware. Unfortunately, this is out of control of Bazzite maintainers.
- Requires a [**Steam**](https://store.steampowered.com/) account
  - Signing up for an account can be done post-installation if you don't have one already

### Compatible Handhelds

The [**Handheld Wiki**](../Handheld_and_HTPC_edition/Handheld_Wiki/index.md) lists tested handhelds with proper support, including the Steam Deck, ASUS ROG Ally, Lenovo Legion Go, and a handful of other handhelds.

<hr>

## Vulkan Compatible GPU

!!! attention

    Linux gaming is heavily dependent on having compatible hardware with [Vulkan](/General/terms/#software).

### Viewing Your GPU's Vulkan Version

If you're using a device with an older or weaker GPU that supports **Vulkan 1.1 or 1.2**, but not **Vulkan 1.3 or later**, use Proton-CachyOS with DXVK-Sarek as described below.  Check which Vulkan version your GPU uses, enter this in the **terminal**:

```bash
vulkaninfo | grep 'Instance Version'
```

![Vulkan Command](https://github.com/user-attachments/assets/ccca14ca-3001-4aa6-bf47-e0dcbdb73936)

- If it outputs less than `1.3` in the `Vulkan Instance Version:` or does not work at all, then you will run into issues including unplayable games and worse performance.

- Really old devices may need to resort to OpenGL translation which performs worse, has graphical issues, etc.

> Try using [**DXVK-Sarek**](https://github.com/pythonlover02/DXVK-Sarek) if your have hardware that can only utilize Vulkan 1.1/1.2. It is officially supported in [Proton-CachyOS](https://github.com/CachyOS/proton-cachyos) and enabled using the [Environment Variable](/Gaming/launch-options-env-variables) `PROTON_DXVK_SAREK=1`. However, do not use this option with anti-cheat or multiplayer games.

!!! info "You may install [Proton-CachyOS](https://github.com/CachyOS/proton-cachyos) with ProtonPlus or ProtonUp-Qt."

### GPUs Without Vulkan Support

If your GPU does not support Vulkan at all then you need to use this **launch option for all games running through Proton**:

```bash
PROTON_USE_WINED3D=1 %command%
```

This will use the OpenGL translation as opposed to Vulkan.

<hr>

## Storage Filesystems

!!! note

    Bazzite will automatically mount secondary drives that are formatted as Ext4 or BTRFS by default.

**BTRFS is the default and recommended filesystem for Bazzite**.  Any secondary drives that you plan to play video games on should be **backed up and reformatted to either Ext4 or BTRFS, however the drive will lose all of the data when performing this operation**.  You can use [**GNOME Disks to format the drives appropriately at your own risk**](../Advanced/Auto-Mounting_Secondary_Drives.md).

!!! warning "All data on the drive will be lost when reformatting."

### Unsupported Filesystems for Secondary Drives

!!! warning

    NTFS and exFAT/FAT32 are NOT SUPPORTED. These filesystems can and will eventually lead to DATA CORRUPTION under Linux, and/or does not support the features needed for Proton/WINE. Do NOT use them!
    WinBTRFS still have BUGS, and the file permission/ownership system on Windows is very different to that of Linux, with no guarantee that you won't run into issues and/or data loss later down the road.
    
    All of this means that there is Unfortunately no reliable cross-platform filesystem that can be shared between Windows and Linux.

!!! warning "All data on the drive will be lost when reformatting."
    
!!! info
    
    To disable the NTFS nag, run `ujust _disable-ntfs-service`. **ONLY DO THIS IF YOU KNOW WHAT YOU ARE DOING. THIS WILL NOT PREVENT DATA LOSS, ONLY DISABLE THE WARNING.**


#### NTFS

If you are coming from Windows and plan to game on a secondary drive with games already installed on it, then we regret to inform you that the NTFS filesystem is **unsupported** for PC gaming on Bazzite.

Playing games off of NTFS causes various issues, including but not limited to **games not launching at all**, and will eventually result in **data corruption** and **permanent data loss**!

#### exFAT and FAT32

FAT32 and exFAT are **unsupported**. Both filesystems **do not support symbolic links** which is required for Proton prefixes to work properly.  However, there are scenarios where a microSD card is formatted to exFAT _may work_ in some cases, but this method is unsupported as something the Bazzite maintainers do not plan to accommodate.

Additionally, the FAT family of filesystems are not [Journaling file systems](https://en.wikipedia.org/wiki/Journaling_file_system). This means data loss or corruption on FAT is more likely to happen, with recovery being much, much harder. Therefore, Bazzite also advises to avoid storing important data without backups on FAT filesystems.

### Sharing Games with a Windows Dual-Boot

Install the unofficial [WinBtrfs](https://github.com/maharmstone/btrfs) driver on your Windows installation **at your own risk**. Please make sure to read any documentation associated with this project before installing the driver on Windows.

#### Video Tutorial

https://www.youtube.com/watch?v=h6fc-3CCXbA
