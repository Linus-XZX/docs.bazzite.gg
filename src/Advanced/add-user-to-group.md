---
title: Adding User to a Group
---

# Adding User to a Group

## Foreword

[Users and Groups](https://wiki.archlinux.org/title/Users_and_groups) are used on Linux for access control, that is, to control access to the system's files, directories, and peripherals, and is cruicial to how Linux works.

!!! note "The following docs should also be applicable to other Fedora Atomic systems."

---

## Adding User to a Group on Atomic Systems

[Bazzite is based on Fedora Atomic](/General/Fedora_Atomic_Comparison/#comparison-of-bazzite-upstream-fedora-atomic-desktop), and Atomic systems use a slightly different way of managing Users & Groups. Therefore, `usermod` cannot be used directly. The following details steps to add your user to a particular group.

!!! warning "Follow this guide at your own discretion because you can **break** your system attempting any of this."

!!! info "If you only need to add your user to the input group for controller compatibility purposes, use the automated script at **Bazzite Portal → Tweak System → Add input to your user groups**."

---

#### 1. Backup User Groups 

Before starting, backup your user groups in `/etc/group` by running the following command:

```bash
sudo cp /etc/group /etc/group.bak
```

This copies your current group file to a file called `group.bak`. Additionally, it may prove to be helpful later on if you view and write down the current contents in `/etc/group`.

---

#### 2. Copy Group ID from `/usr/`

The Group ID then needs to be identified and copied. It can be found for any known group by running the following command:

!!! tip "Remember to replace `<your_group_name>` with the actual group name."

```bash
grep "<your_group_name>" /usr/lib/group
```

!!! example

    For example, the entry for the `dialout` group is `dialout:x:18`:

    ```bash
    grep "dialout" /usr/lib/group
    ```
    returns
    ```console
    dialout:x:18
    ```

!!! info "`/lib/` is a symlink to `/usr/lib/`."

---

#### 3. Write Group ID to Group File

This Group ID needs to be written into the working copy at `/etc/group`. This can be done by appending the entry manually to the `/etc/group` file, or via this one liner:

!!! tip "Remember to replace `<your_group_name>` with the actual group name."

```bash
grep "<your_group_name>" /usr/lib/group | sudo tee -a /etc/group
```

!!! example
    
    ```bash
    grep "dialout" /usr/lib/group | sudo tee -a /etc/group
    ```

!!! warning "Do **NOT** <small>_try to be smart and_</small> use bash's `>` or `>>` operator in this case. `>` overwrites the file, and both only work in a root shell. Follow the instructions."

---

#### 4. Use `usermod`

We can then add the user to group with the following command:

!!! tip "Remember to replace `<your_group_name>` with the actual group name, and `<username>` with your username."

```bash
sudo usermod -aG <your_group_name> <username>
```
!!! example
    
    ```bash
    sudo usermod -aG dialout bazzite
    ```

---

#### 5. Check and Reboot

Check that your `/etc/group` file contains at least the following three entries:

!!! tip "Remember to replace `<your_group_name>` with the actual group name, `<username>` with your username, and `group_ID` with the actual group ID."

*   `wheel:x:10:<username>`
*   `<username>:x:1000`
*   `<your_group_name>:x:<group_ID>:<username>`

If your `/etc/group` file does not contain the aforementioned entries, do **NOT** reboot and seek immediate help at [Bazzite's Discord Server](/community/#discord-no-discord-account) 

Otherwise, reboot and apply changes.

---

## I Broke My System and Lost `sudo` Access

If you accidentally deleted your `/etc/group` file, or have overwritten it, or broke it in any other way, you may still be able to arrive at a graphical session(i.e. the Desktop), but do not have access to:

*   Login via the display manager
*   Polkit authentication
*   `sudo`

You will not be able to write to `/etc/group` as access to `/etc/` requires `sudo`.

To fix this, the file needs to be edited in a root shell before the system arrives at a graphical session.

---

#### 1. Reboot into GRUB Command Editor

Reboot your device and tap <kbd>Esc</kbd> on the keyboard to reach the GRUB boot menu. If you have not hidden your GRUB menu, you may also tap <kbd>↓</kbd> continuously until the GRUB menu appears.

!!! tip

    *   If you press <kbd>Esc</kbd> too many times, you may end up at a `grub>` prompt.
    *   Return to the boot menu by typing `exit` and pressing <kbd>Enter</kbd>.

![Edit the command for the latest boot entry|690x351,75%](../img/Edit_the_command_for_the_latest_boot_entry.png)

---

#### 2. Edit the Boot Command Temporarily

Edit the last deployment by pressing <kbd>E</kbd> on your keyboard.

![Boot with init=/bin/bash|689x359,75%](../img/Boot_with_init_bin_bash.jpeg)

Append `init=/bin/bash` to the line beginning with `linux`.

![Reboot|689x359,75%](../img/Reset_Password_Reboot.jpeg)

Continue the boot process with <kbd>Ctrl</kbd>+<kbd>X</kbd>.

---

#### 3. Fix `/etc/group`

Once the boot process completes, the system will drop you to a **root shell**.

View and edit your `/etc/group` with any CLI text editor, such as `vim` or `nano`. It should contain the following:

!!! tip "Replace `<username>` with your username. If you hadn't set it during installation, it would be set to a default of `bazzite`."

*   `wheel:x:10:<username>`
*   `<username>:x:1000`

!!! example 
    
    ```console
    bash-5.2# cat /etc/group
    wheel:x:10:bazzite
    bazzite:x:1000
    ```
!!! note "If you have previously backed up your `/etc/group` file, you can copy it back with `cp /etc/group.bak /etc/group`"

---

#### 4. Add User to `wheel` Group

After fixing `/etc/group`, SELinux needs to be temporarily loaded to add the user back to the group properly. Run the following commands:

Mount SELinux
```bash
mount -t selinuxfs selinuxfs /sys/fs/selinux
```
Load SELinux Policy
```bash
/sbin/load_policy
```
Add user to `wheel` Group
!!! tip "Replace `<username>` with your username. If you hadn't set it during installation, it would be set to a default of `bazzite`."
```bash
/sbin/usermod -aG wheel <username>
```
Sync configurations
```bash
sync
```
Reboot
```bash
/sbin/reboot -ff
```

---
