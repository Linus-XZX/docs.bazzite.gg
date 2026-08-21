---
title: Other Handhelds
---

# Other Handhelds

![generic handheld|348x158, 100%](/img/generic_handheld.jpeg)

## Untested Handhelds

!!! note

    Certain handhelds have been confirmed to boot Bazzite, but are plagued by missing driver support for Linux including missing audio drivers.

Unsupported handhelds _could work_ with Bazzite, but you may encounter unexpected and undocumented changes. If your handheld hardware is not listed, you may still give Bazzite a try with the Bazzite-Deck image.

Your mileage may vary with untested hardware. Bazzite does **not** automatically apply fixes, tweaks and setup on unsupported handhelds, so you may need to setup different functionalities manually. 

!!! note

    You may also submit PRs to get your device officially supported on Bazzite if you feel like it is in a good state with Linux support.

---

### Enabling OGUI on Unsupported Devices

!!! info "[OpenGamepadUI(OGUI)](https://github.com/ShadowBlip/OpenGamepadUI) is intended and enabled by default for handhelds that are **not** the Steam Deck."

!!! note "OGUI is currently selectively enabled for devices in an allowlist and is not currently intended to be used with HTPC setups. If you have a handheld on which OGUI is not appearing, please open an issue on Github!"

You may use the following interactive command to configure and enable OpenGamepadUI:

```bash
ujust configure-opengamepadui
```

---
