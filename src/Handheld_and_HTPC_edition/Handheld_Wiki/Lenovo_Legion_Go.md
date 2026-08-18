---
title: Lenovo Handhelds
---

# Lenovo Handhelds

!!! disclaimer

    This wiki may contain outdated information.

## Lenovo Legion Go

![legion_go|690x387, 100%](../../img/legion_go.jpeg)

### Optional Tweaks

- Configure the OpenGamepadUI Overlay by opening it with <kbd>Legion R</kbd>
- Adjust the scaling of the UI in the Display Settings

### Known Issues

- Performance overlay may report inaccurate power consumption.
- Adaptive/auto display brightness is currently broken.
  - Manual brightness slider in Steam's UI should still work.
- Updating UEFI/BIOS and controller firmware should be done in Windows at your own risk.

### BIOS update breaks Secure Boot key

![secure-boot|603x500, 100%](../../img/secure-boot.png)

Read our [Secure Boot guide](/General/Installation_Guide/secure_boot.md#method-b-after-installation-method) to re-enroll the key after a BIOS update if you keep Secure Boot enabled, which is the default for this device.

!!! info

    As of July 2025, external monitors works without issues. The external display can be set to its respective native resolution and refresh rate.

If your screen doesn't display the correct output or looks grainy, noisy, or oddly colorful then you will have to enter a [TTY session](/Handheld_and_HTPC_edition/quirks.md#tty-if-you-cannot-access-desktop-mode) or establish an ssh connection and enter this command:

```bash
mv ~/.config/kwinoutputconfig.json ~/.config/kwinoutputconfig.json.old
```

## External Resource

For more information, check out the [Legion Go Tips and Tricks guide](https://github.com/aarron-lee/legion-go-tricks) which includes useful scripts for this handheld.
