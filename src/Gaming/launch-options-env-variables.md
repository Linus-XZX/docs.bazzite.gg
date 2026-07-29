---
title: Launch Options and Environment Variables
---

# Launch Options and Environment Variables

## Preface

Linux gaming is far more intuitive today than it was years ago. However, there are still advanced launch options and configurations that can be ran from Bazzite. This guide will show off examples of advanced gaming tweaks that can be done on a Bazzite installation.

## Configuration Templates for DXVK, MangoHud, & vkBasalt

![Template|690x334, 50%](../img/DXVK_Mango_VkBasalt_templ.png)

Bazzite users can use templates for some of the pre-installed tools which can be accessed by right clicking anywhere in the file manager.  There are also applications like [**Mango Juice**](https://flathub.org/en/apps/io.github.radiolamp.mangojuice) that acts as a graphical method of configuring Mangohud.

## Steam Launch Options and Shortcuts

Steam launch options allow you to pass environment variables, arguments, and commands to games when they start. Bazzite includes several shortcuts and UX improvements to make common launch options easier to use, especially on handheld devices.

### Common Launch Option Patterns

Most Steam launch options follow this pattern: `ENVIRONMENT_VARIABLES command_or_script %command% --arguments`

- `%command%` represents the game executable and must be included except in following cases:
  - Launch option is empty or only contains arguments
  - Command or script launches game by itself without using Steam.
- Environment variables must go before `%command%` except in the following cases where it can be omitted:
  - You have already set a global environment variable in `~/.config/environment.d` or other locations
  - You have set a global environment variable in Bazzite Portal (same modification as above)
  - Command or script passed in front of `%command%` have already set it for you.
- Additional arguments (meant for the game executable itself) can go after `%command%`

**Examples:**
```bash
PROTON_LOG=1 %command%                    # Enable Proton logging
STEAMDECK=0 %command%                     # Disable Steam Deck mode
PROTON_ENABLE_NGX_UPDATER=1 %command%     # Enable DLSS updates
%command% --in-process-gpu                # Fixes a blank screen in some Unity games
scb %command%                             # Use ScopeBuddy (a Gamescope helper) to launch the game
```

### Proton Launch Options
<small>_Looks familiar? This section is copied from the [Proton-CachyOS Wiki](https://wiki.cachyos.org/configuration/gaming/#environment-variables)_</small>

Custom Proton versions have unstable configuration options by default. For the latest information on their respective configuration options, refer to their documentation.

- Proton-CachyOS
  - [Readme](https://github.com/CachyOS/proton-cachyos/blob/cachyos_main/README.md#proton-cachyos-config-options)
  - [Changelogs](https://github.com/CachyOS/proton-cachyos/blob/cachyos_main/CHANGELOG.md)
- Proton-EM
  - [Readme](https://github.com/Etaash-mathamsetty/Proton/blob/em-11-hdr/README.md)
  - [EM-ADDITIONS](https://github.com/Etaash-mathamsetty/Proton/blob/em-10-hdrtest/docs/EM-ADDITIONS.md)
  - [FSR4](https://github.com/Etaash-mathamsetty/Proton/blob/em-10-hdrtest/docs/FSR4.md)
  - [Wine-Wayland](https://github.com/Etaash-mathamsetty/Proton/blob/em-10-hdrtest/docs/CHANGES.md)

### Bazzite's Launch Option Shortcuts

Bazzite includes several shortcuts to simplify common launch options:

#### For Steam Deck Mode Control

- **`sd0 %command%`** - Shorthand for `SteamDeck=0 %command%`
  - Disables Steam Deck specific features that may conflict with your setup
  - Example: Expedition 33 hides most graphics settings unless you set `SteamDeck=0`, and enforces lower than lowest settings.

#### For NVIDIA Users (dlss-swapper)

- **`dlss-swapper %command%`** - Enables latest DLSS presets with NGX updater
  - Replaces: `PROTON_ENABLE_NGX_UPDATER=1 DXVK_NVAPI_DRS_SETTINGS=NGX_DLSS_SR_OVERRIDE=on,NGX_DLSS_RR_OVERRIDE=on,NGX_DLSS_FG_OVERRIDE=on,NGX_DLSS_SR_OVERRIDE_RENDER_PRESET_SELECTION=render_preset_latest,NGX_DLSS_RR_OVERRIDE_RENDER_PRESET_SELECTION=render_preset_latest %command%`
- **`dlss-swapper-dll %command%`** - Same as above but skips NGX updater

!!! info

    Since for DLSS there are reasons (e.g. performance, quality) to stay on an older model, having the ability to manually specify a model version is still relevant. Therefore, this will still be provided in addition to the newer `PROTON_DLSS_UPGRADE=1` accessible via Bazzite Portal.

#### Where to Set Launch Options

1. Right-click game in Steam library
2. Select **Properties**
3. In the General tab, find **Launch Options** field
4. Enter your launch options

![Launch Options view|833x594, 75%](../img/Steam_Launch_Options.png)

## Frame Rate Limiting Issues and Inconsistency

When using Gamescope, framerate limits can be applied in several ways. Unfortunately not all methods work for every enviroment, game, or hardware configuration.

Many inconsistencies can be observed, especially when applying framerate limits in desktop mode.

The tables below show the behavior of different framerate limiting methods.

=== "Steam Game Mode (Steam Gaming Mode Session)"

    | Method | Setup steps | Requires V-Sync On In-Game? | Change limit without restarting game? | Latency | Preferred | Notes |
    |---|---|---|---|---|---|---|
    | **Gamescope FPS limiter** | Use **Quick Access Menu → Performance → Framerate Limit** | No | Yes | Generally Worse | **Preferred** | Automatically enables v-sync at driver-level whenever the framerate cap is enabled. Additional latency will be introduced. |
    | **MangoAPP (embedded)** | - | - | - | - | – | N/A - doesn't work at all. |
    | **MangoHUD (external)** | **Launch Options:** `MANGOHUD=1 %command%` | No | Yes | Generally Worse | – | Set `fps_limit=0,{fps}...` (`0`=no cap) in `MangoHud.conf` or use [MangoJuice](https://flathub.org/en/apps/io.github.radiolamp.mangojuice). |
    | **DXVK/VKD3D runtime frame limiter** | **DXVK(D3D8/9/10/11):** `DXVK_FRAME_RATE={fps} %command%`<br>**VKD3D(D3D12):** `VKD3D_FRAME_RATE={fps} %command%` | No | No | Generally Better | – | Applies only to DXVK/VKD3D titles (no effect on native OpenGL or Vulkan games). |

=== "Desktop Mode (GNOME / KDE Plasma Desktop Session)"

    | Method | Setup steps | Requires V-Sync On In-Game? | Change limit without restarting game? | Latency | Preferred | Notes |
    |---|---|---|---|---|---|---|
    | **Gamescope FPS limiter** | **Launch Options**: `gamescope -r {fps} -- %command%` / `--framerate-limit {fps}` | Yes | Yes* | Generally Worse | – | *Use `gamescopectl debug_set_fps_limit {fps}` to change the limiter value live without restarting. |
    | **MangoAPP (embedded)** | **Launch Options:** `gamescope --mangoapp -- %command%` | Yes | Yes | Generally Worse | – | Caps are sometimes not effective. Configuration method is identical to MangoHUD. |
    | **MangoHUD (external)** | **Launch Options:** `MANGOHUD=1 %command%` | No | Yes | Generally Better | **Preferred** | Caps are almost always effective. Set `fps_limit=0,{fps}...` (`0`=no cap) in `MangoHud.conf` or use [MangoJuice](https://flathub.org/en/apps/io.github.radiolamp.mangojuice). |
    | **DXVK/VKD3D runtime frame limiter** | **DXVK(D3D8/9/10/11):** `DXVK_FRAME_RATE={fps} %command%`<br>**VKD3D(D3D12):** `VKD3D_FRAME_RATE={fps} %command%` | No | No | Generally Better | – |  Applies only to DXVK/VKD3D titles (no effect on native OpenGL or Vulkan games). |

If your framerate limiter isn't working, the following steps can often help:

- Disable adaptive sync/VRR or remove the `--adaptive-sync` flag from your gamescope arguments.
- Set Vsync in-game to "on".

!!! Note

    Latency is a complex topic and is different for each configuration. There is no "best" frame limiter for every situation, and extensive testing is unavoidable should one seek the lowest latency for their own configuration.
    
    Additionally, upstream DXVK and VKD3D has removed setting frame limit via the `DXVK_FRAME_RATE` environmental variable since version 3.0. The support for these environmental variable has since moved to downstream such as Proton-CachyOS and other Proton Variants (Valve's official Proton uses upstream DXVK/VKD3D). If you need/want to use the DXVK/VKD3D runtime frame limiter, use [custom Proton versions](#proton-launch-options) or [DXVK Low-Latency](https://github.com/netborg-afps/dxvk-low-latency) for use with WINE.
    
    A good starting point would be Proton-CachyOS, which includes DXVK-LL that can be activated with `PROTON_DXVK_LOWLATENCY=1`.

## Advanced Launch Options Management using ScopeBuddy

For users who need more complex launch option management, consider the **[ScopeBuddy documentation](../Advanced/scopebuddy.md)** for even more advanced Gamescope launch option management.
