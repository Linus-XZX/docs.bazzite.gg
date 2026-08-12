---
title: Cardwire
---

# Cardwire

![Screenshot of Cardwire|2224x1468, 25%](https://github.com/OpenGamingCollective/cardwire/raw/main/assets/org.opengamingcollective.cardwire.screenshot.png)

## Overview

Cardwire is a GPU manager for Linux using eBPF LSM hooks to intercept file operations on GPU device nodes, such as `/dev/dri/renderDX`, `/dev/dri/cardX`, sysfs `config`, `nvidiaX` and other GPU-related files.

When a GPU is "blocked," the eBPF program returns -ENOENT for any syscall targeting that device, effectively hiding it from apps. This provides several key benefits:

-   Instant App Startup: Prevents applications (like Electron apps or GTK apps) from attempting to initialize the GPU, this eliminates the 3–4 second "hang" typically caused by waiting for a sleeping GPU to power up
-   Power Efficiency: By blocking access at the syscall level, the GPU is never woken from its lowest power state (D3cold), extending battery life on laptops
-   Non-Invasive: Unlike traditional methods that might require driver unloading, risky unbind or complex Wayland setups, this approach is transparent to the rest of the system and easy to toggle

!!! note "X11 is not supported. Cardwire requires Wayland."

---

## Configuration

Cardwire can either be used with the included GUI or through the command line.

```console
CLI for cardwire GPU management

Usage: cardwire <COMMAND>

Commands:
set      Set to the desired mode
get      Get the current mode
list     Print the gpu list
gpu      Manage a specific GPU by its id
config   Manage daemon configuration
manager  Manager operations
debug    Debug operations
launch   Launch a program on the specified GPU
help     Print this message or the help of the given subcommand(s)

Options:
-h, --help     Print help
-V, --version  Print version
```

---

## Usage

If you want to manually specify a game to launch using a specific GPU, you may add the following [environment variable](/Gaming/launch-options-env-variables.md) to Steam launch options:

```bash
cardwire launch %command%
```

!!! note "Other GPU management tools such as `switcherooctl`, `envycontrol`, `supergfxctl` should not be used in conjunction with cardwire."

> You may learn more at the [Cardwire Docs](https://opengamingcollective.github.io/cardwire/).

---

## Project website

https://github.com/OpenGamingCollective/cardwire
