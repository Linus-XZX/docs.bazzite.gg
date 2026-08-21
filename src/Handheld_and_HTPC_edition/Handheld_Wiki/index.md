---
title: Handheld Compatibility
---

# Handheld Compatibility

## SteamOS-like Functionality

!!! info

    [Bazzite Deck 44](https://universal-blue.discourse.group/t/bazzites-biggest-update-deck-44-has-launched-happy-birthday-to-universal-blue/12373) uses [OpenGamepadUI](https://github.com/ShadowBlip/OpenGamepadUI) and [InputPlumber](https://github.com/shadowblip/InputPlumber) for proper handheld support. 
    
    In the past, this was done using Handheld Daemon. You may learn more about that [here](https://universal-blue.discourse.group/t/a-brighter-future-for-bazzite/11575).

Bazzite-Deck images ship with [Steam Gaming Mode](../Steam_Gaming_Mode.md) which is intended to mimic the experience of SteamOS. The goal is to have earlier support for most x86_64 handheld PCs before SteamOS and with the same benefits of the desktop version of Bazzite.

---

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

---

## OGUI Setup

!!! info "[OpenGamepadUI(OGUI)](https://github.com/ShadowBlip/OpenGamepadUI) is intended and enabled by default for handhelds that are **not** the Steam Deck."

1. Double tap :material-microsoft-xbox-controller-menu: or press :material-microsoft-xbox:/:material-sony-playstation:/:material-steam: + :material-gamepad-circle-right: to access OpenGamepadUI overlay in Steam Gaming Mode.

2. Select the controller icon to change the change the Emulated controller type.

!!! note "Gyro functionality **requires** DualSense emulation, though RGB can still be controlled using the Huesync Decky Plugin without it."

---

## TDP Controls

![TDP|409x1004, 33%](/img/TDP.png) ![OGUI Power Profiles|1920x1200, 30%](/img/OGUI_Profile.jpg)

There are a few options for TDP Controls that work with Bazzite:

!!! info "If you open OpenGamepadUI and see the message **Waiting for PowerStation service...**, this means your device does not use PowerStation for TDP. This is completely normal and is the expected behavior."

!!! tip "If detailed TDP configurations cannot be found, try selecting the **Performance** profile → scroll down and enable TDP and GPU Clocks. This should enable detailed TDP configuration in Watts."

=== "Steam Client Quick Access Menu (QAM)"

    If your device's TDP can be controlled via SteamOS Manager, the option will be available here. If it does not appear, check OpenGamepadUI or use other means of adjusting the TDP of your device.
    
    - This menu can be accessed anytime using the Quick Access Menu button (varies by handheld) or by pressing :material-microsoft-xbox:/:material-sony-playstation:/:material-steam: + :material-gamepad-circle-down:.
    - Select the **:material-lightning-bolt: Lightning Bolt Icon** and enable **Advanced** options
    - TDP can then be changed by using the dedicated TDP Dropdown.
    - Custom TDP may be set by selecting "Custom", scrolling down and toggling "Custom TDP", then changing the TDP slider that appears.
    
    > [These devices](https://github.com/ublue-os/bazzite/blob/main/system_files/desktop/shared/usr/libexec/hwsupport/steamos-manager-hardware) will use this method by default.
  
=== "OpenGamepadUI (OGUI)"

    This is the 2nd place where you may find TDP controls for your device. In this menu, TDP controls are provided by [PowerStation](https://github.com/ShadowBlip/PowerStation). If your device can be configured via the Steam QAM, performance configurations may or may not be available here. You may use any of the two to configure your device.
    
    - OGUI can be opened with :material-microsoft-xbox:/:material-sony-playstation:/:material-steam: + :material-gamepad-circle-right: or double tapping/long pressing :material-microsoft-xbox-controller-menu:. How this is mapped will depend on your device.
    
    > [These devices](https://github.com/ublue-os/bazzite/blob/main/system_files/desktop/shared/usr/libexec/hwsupport/powerstation-hardware) will use this method by default.
  
=== "Decky Plugins"

    You may also use Decky Plugins to configure TDP for your device if both Steam QAM and OGUI do not provide them. However, note that these plugins will interfere and conflict if you have multiple plugins turned on. Make sure you only have one means of TDP Control(including OGUI/PowerStation) running!
    
    - [SimpleDeckyTDP](https://github.com/aarron-lee/SimpleDeckyTDP) plugin supports TDP, GPU, Power Governor, amongst other settings.
      - A [graphical application](https://github.com/aarron-lee/SimpleDeckyTDP-Desktop) is available, but needs to be manually installed.
    - [PowerControl](https://github.com/mengmeet/PowerControl) supports TDP, GPU, and fan control on select devices.
    - [Panel de Control](https://github.com/Hooandee/panel-de-control) also allow for custom TDP, Fan Control and smart leanring for profile based on how you use your device.

---

### How do I open the OGUI Overlay?

![Overlay|690x431, 75%](/img/OGUI_Overlay.jpg)

OGUI can be opened with :material-microsoft-xbox:/:material-sony-playstation:/:material-steam: + :material-gamepad-circle-right: or double tapping/long pressing :material-microsoft-xbox-controller-menu:. How this is mapped may depend on your device.

!!! note "OGUI is currently selectively enabled for devices in an allowlist and is not currently intended to be used with HTPC setups. If you have a handheld on which OGUI is not appearing, please open an issue on Github!"

> You may see 

---

## Controller Information

For most handheld hardware, besides the Steam Deck, emulation of a DualSense controller is used for full functionality. Double tap/hold :material-microsoft-xbox-controller-menu: to open the QAM and access settings for controller emulation.

!!! warning "Emulating an Xbox controller will cause reduced or missing functions."

If your device has paddles, you will want to use the DualSense Edge or Steam Deck controller (**excluding the Ayn Loki**). It’s disabled by default because some games do not map it correctly.

Some games and emulators may need Steam Input to be **disabled** to work correctly with your controls.

### Desktop Controls

![desktop_controls_step_1|850x722, 75%](/img/handheld_desktop_control.png)

Desktop controller layout may not exist by default if Steam doesn't setup your handheld controller properly. This can be fixed in Steam's controller settings.

The virtual keyboard is provided by Steam's on-screen keyboard, which requires setup in Desktop Mode. There is **no default keybinding for Steam's on-screen keyboard**, so it needs to be remapped to <kbd>X</kbd> or any key of your preference. 

The desktop controller layout may not exist by default if Steam doesn't setup your handheld controller properly. This can be fixed in Steam's controller settings.

---

## Decky Setup

To install [Decky Loader](https://decky.xyz), open a host terminal and enter:

```bash
ujust setup-decky
```

You can access Decky Loader by pressing :material-microsoft-xbox-controller-menu: once to open the QAM from within Steam Gaming Mode or Steam Big Picture Mode.

Alternatively, The Quick Access Menu is accessible from the keyboard with Control + 2, or with an external controller by pressing :material-microsoft-xbox:/:material-sony-playstation:/:material-steam: + :material-gamepad-circle-down:

### Decky Plugins

!!! info "Decky may break or be uninstalled after an update."

Install optional [Decky plugins](https://plugins.deckbrew.xyz/) for your handheld. If you experience any major issues with Decky, it is recommended to uninstall it before reporting Bazzite bugs.

---

## Unsupported Handhelds

!!! note

    Certain handhelds have been confirmed to boot Bazzite, but are plagued by missing driver support for Linux including missing audio drivers.

Unsupported handhelds _could work_ with Bazzite, but you may encounter unexpected and undocumented changes. If your handheld hardware is not listed, you may still give Bazzite a try with the Bazzite-Deck image.

Your mileage may vary with untested hardware. Bazzite does **not** automatically apply fixes, tweaks and setup on unsupported handhelds, so you may need to setup different functionalities manually. 

!!! note

    You may also submit PRs to get your device officially supported on Bazzite if you feel like it is in a good state with Linux support.

> Instructions for enabling OGUI on unsupported Handhelds are available [here](./Other_Handhelds/#enabling-ogui-on-unsupported-devices)

---

## e-GPU Caveats:

- The same [GPU hardware requirements](/Gaming/Hardware_compatibility_for_gaming.md#steam-gaming-mode-requirements) that apply for Steam Gaming Mode will also apply for e-GPUs.
  - Nvidia GPUs are **unsupported**, though Bazzite provides an experimental `-deck-nvidia` image.

> You may read and follow this [**General Linux e-GPU Guide + Script**](https://github.com/ewagner12/all-ways-egpu) at your own risk.

---
