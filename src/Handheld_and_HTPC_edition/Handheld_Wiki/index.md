---
title: Handheld Compatibility
---

# Handheld Compatibility

## SteamOS-like Functionality

!!! info

    Bazzite uses [OpenGamepadUI](https://github.com/ShadowBlip/OpenGamepadUI) and [InputPlumber](https://github.com/shadowblip/InputPlumber) for proper handheld support. 
    
    In the past, this was done using Handheld Daemon. You may learn more about that [here](https://universal-blue.discourse.group/t/a-brighter-future-for-bazzite/11575).

Bazzite-Deck images ship with [Steam Gaming Mode](../Steam_Gaming_Mode.md) which is intended to mimic the experience of SteamOS. The goal is to have earlier support for most x86_64 handheld PCs before SteamOS and with the same benefits of the desktop version of Bazzite.

## Supported Handhelds

!!! info "This list is non-exhaustive and does not necessarily indicate that unlisted handhelds do not work with Bazzite."

_Click the name of each hardware to view post-installation setup, known working features, issues and workarounds._

- [**ASUS Handhelds**](./ASUS_ROG_Ally.md)
- [**Lenovo Handhelds**](./Lenovo_Legion_Go.md)
- [**GPD Handhelds**](./GPD_Handhelds.md)
- [**OneXPlayer Handhelds**](./OneXPlayer_Handhelds.md)
- [**Ayn Handhelds**](./Ayn_Handhelds.md)
- [**Ayaneo Handhelds**](./Ayaneo_Handhelds.md)
- [**Steam Deck**](./Steam_Deck.md)
- [**Other Handhelds**](./Other_Handhelds.md) 

## OGUI Setup

!!! info "[OpenGamepadUI(OGUI)](https://github.com/ShadowBlip/OpenGamepadUI) is intended and enabled by default for handhelds that are **not** the Steam Deck."

1. Double press the 'side menu button' to access OpenGamepadUI overlay in Steam Gaming Mode

2. Select the controller emulation and RGB color you want

!!! note

    Gyro functionality **requires** DualSense emulation.

## TDP Controls

![TDP|690x431, 75%](../../img/TDP.jpeg)

There are a few options for TDP Controls that work with Bazzite:

- [SimpleDeckyTDP](https://github.com/aarron-lee/SimpleDeckyTDP) plugin supports TDP, GPU, Power Governor, among other settings.
  - A [graphical application](https://github.com/aarron-lee/SimpleDeckyTDP-Desktop) is available, but needs to be manually installed.
- [PowerControl](https://github.com/mengmeet/PowerControl) supports TDP, GPU, and fan control on select devices.

### How do I open the OGUI Overlay?

![Overlay|690x431, 75%](../../img/HHD_Overlay.jpeg)
![RGB|690x431, 75%](../../img/HHD_RGB.jpeg)

Press, hold, or double-tap the Quick Access Menu button.

## Controller Information

For most handheld hardware, besides the Steam Deck, emulation of a DualSense controller is used for full functionality. Double tap or hold the side menu button to access settings for controller emulation including switching to an Xbox controller with reduced functionality.

If your device has paddles, you will want to use the DualSense Edge controller (**excluding the Ayn Loki**). It’s disabled by default because some games do not map it correctly.

Some games and emulators may need Steam Input **disabled** to work correctly with your controls.

### Desktop Controls

![desktop_controls_step_1|588x500, 75%](../../img/handheld_desktop_controls_1.png)

Desktop controller layout may not exist by default if Steam doesn't setup your handheld controller properly. This can be fixed in Steam's controller settings.

The virtual keyboard is provided by Steam's on-screen keyboard, which requires setup in Desktop Mode. There is **no default keybinding for Steam's on-screen keyboard**, so it needs to be remapped to <kbd>**X**</kbd> or any key of your preference. 

The desktop controller layout may not exist by default if Steam doesn't setup your handheld controller properly. This can be fixed in Steam's controller settings.

## Decky Setup

To install [Decky Loader](https://decky.xyz), open a host terminal and enter:

```bash
ujust setup-decky
```

You can access Decky Loader by pressing the 'side menu button', also known as the Quick Access Menu (QAM), once from within Steam Gamemode or Steam Big Picture Mode.

The Quick Access Menu is accessible from the keyboard with Control + 2, or with an external controller using Xbox/PS button + A/X.

### Decky Plugins

!!! info

    Decky may break or uninstall after updates especially if there is an update.

Install optional [Decky plugins](https://plugins.deckbrew.xyz/) for your handheld. If you experience any major issues then it is recommended to uninstall Decky before reporting Bazzite bugs.

## Unsupported Handhelds

!!! note

    Certain handhelds have been confirmed to boot Bazzite, but are plagued by missing driver support for Linux including missing audio drivers.

Unsupported handhelds _could work_ with Bazzite, but you may encounter unexpected and undocumented changes. If your handheld hardware is not listed, you may still give Bazzite a try with the Bazzite-Deck image.

Your mileage may vary with untested hardware. Bazzite does **not** have the required setup for unsupported handheld, so you may need to setup different functionality manually. 

!!! note

    You may also submit PRs in getting your device officially supported on Bazzite if you feel like it is in a good state with Linux support.

## e-GPU Caveats:

- The same [GPU hardware requirements](/Gaming/Hardware_compatibility_for_gaming.md#steam-gaming-mode-requirements) that apply for Steam Gaming Mode also apply for e-GPUs.
  - Nvidia GPUs are **unsupported**, though Bazzite provides an experimental `-deck-nvidia` image.

>[**General Linux e-GPU Guide + Script**](https://github.com/ewagner12/all-ways-egpu)
