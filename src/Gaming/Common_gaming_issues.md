---
title: Common Gaming Issues
---

# Common Gaming Issues

## Native Linux Port Versus Windows Version

Some Linux ports may have missing functionality or worse performance than on the Windows version running through Proton. However, there are scenarios where using the native port exclusively is your only option, and may even be desirable.

If a Linux native game does not launch, then try forcing the **Legacy Runtime** compatibility layer by enabling "**Force the use of a specific Steam Play compatibility tool**" under **Steam** → game's **properties** → **Compatibility** and selecting it under the drop-down menu.

!!! warning "**Only** use the Linux native version of Counter Strike 2 (i.e. DISABLE **Force the use of a specific Steam Play compatibility tool**). You may get VAC-banned for running CS2 through Proton."

## Denuvo Anti-Tamper DRM Locking Games

Games that use Denuvo Anti-Tamper DRM consider changing Proton versions as activating the game on different hardware. This may cause you to get locked out of the game temporarily if you change the Proton version more than 5 times within a 24-hour period. In this case, you will need to wait 24 hours before you can launch the game again.

---

## Source 1 Engine Audio and Custom Content Bugs

!!! note

    This only applies to specific games running on the [Source engine](https://www.pcgamingwiki.com/wiki/Engine:Source).

!!! attention

    Do **not** attempt to follow this workaround until you run into issues with audio or the specific scenario mentioned below regarding _Left 4 Dead 2_.

Missing voice lines or custom content not loading in Source games? SELinux is blocking MP3 decoding and other middleware because it [**executes heap memory**](https://github.com/ValveSoftware/steam-for-linux/issues/43).

This has also been confirmed to cause issues joining and hosting custom maps in _Left 4 Dead 2_.

### The fix for audio/custom content issues:

!!! warning

    Configuring SELinux is intended for advanced users and if used irresponsibly, it can break other components in your system and weaken the security of your device.

To fix the aforementioned audio/custom content issues, you may create and install a module to allow Source games to pass through SELinux based on previous security logs caused by `hl2_linux`.

You may proceed **at your own risk**!

=== "Create and install the policy module"

    ```bash
    sudo -i
    cd /tmp
    ausearch -c 'hl2_linux' --raw | audit2allow -M my-hl2linux
    semodule -X 300 -i my-hl2linux.pp
    ```
    Reboot your device and test if you still encounter the aforementioned issues.

=== "Disable the policy module"

    ```bash
    semodule -X 300 -d my-hl2linux
    ```

=== "Remove the policy module"

    ```bash
    semodule -X 300 -r my-hl2linux
    ```
    You may remove the `.pp` file in `/root/` should you want to do that.

---

## Steam Games Not Launching

Steam games might not launch for a variety of reasons. The following lists common reasons for games to appear to close immediately (i.e. going from **Running** to **Play** immediately or after a short time).

### `gamemoderun`

!!! note

      Not to be confused with **Gaming Mode** on Deck images. (Feral) GameMode is a library that allows games to request optimizations from the OS.

Games will not launch if you add `gamemoderun %command%` to your launch options, which is commonly found on ProtonDB.

Please remove it from your launch options, due to the following three reasons:  <small>_of five people, three must pay a price..._</small>

-   GameMode is neither installed nor supported in Bazzite
-   It generally doesn't do anything useful on modern hardware
-   ... and in some cases can even hurt performance

It might work if you layer the `gamemode` package, but this is **NOT** supported.

### NTFS formatted drive permission issues:

Make sure your games are **not** on an NTFS (Windows) partition. More information can be found [**here**](./Hardware_compatibility_for_gaming.md#unsupported-filesystems-for-secondary-drives).

### Multi-user WINE quirks:

!!! note

    Bazzite-Deck does not support multiple Linux user accounts, this information only applies to the Desktop edition of Bazzite.

Sometimes Steam games will completely refuse to launch on a secondary user account. This may be due to the ownership of the WINE prefix files. You might see an error like this in ` ~/.local/share/Steam/logs/console-linux.txt` on the secondary user account:

```
wineserver: /SteamLibrary/steamapps/compatdata/377160/pfx is not owned by you
```

You can fix this by creating a separate Steam library folder to hold the prefix data for Proton and creating a symbolic link (_symlink_) for the other folders (like common game data).

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

Similarly, copy or symlink the appmanifest files from each library for games to show up properly in each Steam library. 

---

## Gathering Proton Log Files

If you encounter issues with launching a game through Proton, you may follow the steps below to obtain Proton log files

1.  Add the `PROTON_LOG=1 %command%` [environment variable](/Gaming/launch-options-env-variables) in Steam **launch options** or the corresponding entry in other launchers:
2.  Launch the game
3.  A log file should appear in your Home directory named after the game's application ID number. Look for `~/steam-{App ID}.log`, with `{App ID}` being a bunch of numbers

You can use this log file for requesting support or to submit a bug report to Valve.
