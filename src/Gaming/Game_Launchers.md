---
title: Game Launchers
---

# Game Launchers

## Steam Setup

Steam can run Windows games on Linux. It utilizes a wide range of projects and patches all packed into a piece of software built-in to Steam called [**Proton**](https://github.com/ValveSoftware/Proton) for Windows compatibility. You may read [this](/Gaming/gaming-intro/#steam-games) for more details.

### Forcing A Specific Proton / Steam Play Tool Version

#### Important Notes

- Games with a Linux port will be used by default on Desktop images.
- Valve selects the default runner on _Handheld/HTPC_ images. 
- Some games run better with a specific version of Proton than using the Linux port, though the vice versa may be true sometimes as well.

Run that specific version by going into the game's **Properties** → **Compatibility**, enable **Force the use of a specific Steam Play compatibility tool** and select under the drop-down menu.

!!! warning "**Only** use the Linux native version of Counter Strike 2 (i.e. DISABLE **Force the use of a specific Steam Play compatibility tool**). You may get VAC-banned for running CS2 through Proton."

#### Image Example

![Cog Icon > Properties|690x284, 75%](../img/Steam_Setup_Cog.png)
![Compatibility tab|690x492, 75%](../img/Steam_Setup_Compat_Tab.png)


## Non-Steam Games

You may use Lutris(Pre-installed) or various other launchers like [**Heroic Games Launcher**](https://flathub.org/en/apps/com.heroicgameslauncher.hgl)(for GOG/Epic/Amazon games) and [**Faugus**](https://flathub.org/en/apps/io.github.Faugus.faugus-launcher) to help manage Proton Prefixes, Proton Runner version, and [Launch Options](/Gaming/launch-options-env-variables/) for your non-Steam Games.

!!! note "You may install other launchers through **Bazaar**."

!!! info "You may also add non-Steam Games to Steam and let Steam manage your prefixes, which is useful in Steam Gaming Mode."

### Setup

Typically, you only need to specify the game location by using the **Add locally installed game** option. The Proton Prefix will then be created and managed automatically for you by the respective launcher. Should you want to manage the locations of the Prefix yourself, you may also choose the respective options in the launcher of your choice.

!!! note "Lutris offers two methods to play Windows games on Bazzite.  Community-driven scripts or manually adding the executable.  It is **highly recommended to use the manual method** as some scripts are poorly maintained."

### Manually adding a Windows game to Lutris

!!! note

    Most other launchers follow a similar setup step to the instructions detailed below.

![Add Locally Installed Game|632x496, 75%](../img/Lutris_Setup_Add_Local_Game.png)

![Lutris manually adding games example 1|690x213](../img/Lutris_Setup_Add_Local_Game_1.png)

By default, Lutris will use the `~/Games` directory for each game's [**prefix directory**](/Gaming/Managing_and_modding_games/#what-is-a-proton-or-wine-prefix).

### Adding Shortcuts and Desktop Entries

![Lutris_Right_Click_Menu|421x447, 75%](../img/Lutris_Setup_Shortcut.png)

You may add a shortcut for the game into the App Menu or your Desktop by going into the Edit Tab or the Right Click Context Menu of the launcher of your choice and selecting the respective entries.
