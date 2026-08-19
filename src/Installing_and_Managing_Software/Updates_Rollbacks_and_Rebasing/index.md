---
title: Updates, Rollbacks, and Rebasing
---

# Updates, Rollbacks, and Rebasing

---

## Updates

Updates are automatic on Desktop images and manually done on Bazzite-Deck images, and both Bazzite variants upgrade everything at both a system-level and user-installed applications during the updating process.

> [**Updating Guide**](./updating_guide.md)

---

## Rollbacks

Swap back to a previous system update if there are major issues after updating via the GRUB menu or the `rpm-ostree rollback` command.

> [**Rollbacks Guide**](./rolling_back_system_updates.md)

---

## Rebasing

!!! warning

    Do **not** rebase to a different desktop environment than the one you are currently using. See [here](/General/FAQ/#can-i-switch-to-a-different-desktop-environment-on-my-current-installation) for more information.

Rebase to Bazzite builds from the last 90 days, change Bazzite update channels, swap between Desktop and Bazzite-Deck images, or move completely to a different Fedora Atomic Desktop image.

> [**Rebase Guide**](./rebase_guide.md)

---

## System Configuration Utilities

Bazzite provides various utilities to help configure your system. If you are not sure which one to use, simply update with **Bazzite Updater**.

=== "Bazzite Updater"

    Bazzite Updater provides a GUI that can be interacted with by using a **controller** to update and rollback the system image.

    > [**Bazzite Updater**](./bazzite_updater.md)

=== "Bazzite Portal"

    Bazzite Portal provides a GUI for commonly used system configurations and tweaks via `just` scripts. Rebasing to commonly used update branches such as `testing` can be done here.

    > [**Bazzite Portal**](/Installing_and_Managing_Software/Bazzite_Portal.md)

=== "Bazzite Rollback Helper"

    Advanced Command Line Utility to assist with rolling back to older Bazzite images, changing update branches, or swapping to a different Bazzite image.

    > [**Bazzite's Rollback Helper Utility Guide**](./bazzite_rollback_helper.md)

---
