# Hydro Thunder(PC) QoL Patch Tool

A program written in Game Maker 8.2, which was made to address issues in the PC port of Hydro Thunder, as well as introduce some quality of life improvements.

It is designed primarily for the Eurocom 2001 release(the one that's less than 70mb and has like 3-4 files). As of the current verison, it can detect the Midway Arcade Treasures Deluxe Edition version, but it can only apply the Throttle Fix to it.

Hydro Thunder community Discord server, as this is where testing is done for future public builds, and where i post about what i'm working on: https://discord.gg/yxKT6EP

**NOTE: This tool takes the EXE modification approach to patching. There is currently no injection based option, but I plan to make one available in the future. It's simply me doing my best with what I know.**

You can choose which patches you want, or hit "Apply all" on the relevant pages. A copy of your EXE is made automatically before any patching is done.

# What each patch does in more detail:
Throttle fix - When no throttle input is given, it will sit at 25.9% on the gas, meaning that the boat will always have throttle input even when it shouldn't. This is because the game intentionally takes the input from your controls, subtracts 35% from it, and multiplies that result by 0.7407407(possibly a leftover from the arcade version, the original throttle controller has more forwards range than backwards). The result of that is then written to the value which the game depends on for throttle input. This messes with a super start trick where the throttle has to sit perfectly neutral when not using it, to pop off the starting line without jumping, saving a few tenths of a second depending on the boat you're using. Workarounds exist, but only with the analog throttle by holding it between about 30-60% down to put it at neutral(N64, PS1, and Xbox are the only ports which don't have this issue). Having to use analog inputs locks keyboard players out of the playing field for speedrun competition. This patch fixes that throttle issue by removing that unecessary math, putting it onpar with the original arcade, and those aforementioned console ports.

Controller fix - The dreaded bug is no more with this patch. You've no doubt run into this one if you've played this version before, but what is happening? When a controller is selected to be used, un-focusing the game will seemingly "unlatch" the controller from it. However, something goes wrong when it's supposed to be restored upon re-focusing, specific values do not line up correctly as the code expects. This causes your controller to not only no longer work, but the game is stuck believing a controller is there, when in fact it's just receiving invalid inputs. The only fixes for this were to restart the game, or going into the joystick menu and re-selecting your controller manually. Until now! A single asm opcode change fixes this issue, and testing has yet to reveal any side-effects.

Improve window stability - Intended for use with DXWnd/dgVoodoo2. If the game detects that anything could happen to put it out of fullscreen, it'll fall back to it's 320x240 software rendered window mode. Even with forcing, simply touching the game window will cause it to happen. And having to switch back can cause graphical glitches, or even a crash. This patches that out, making the window far more stable, now being able to be moved around and clicked out of/back into like a normal game.

Keep alive when unfocused - Mainly for use with DXWnd/dgVoodoo. Bear in mind that keyboard inputs will still register, and sound is muted(for now).

Disable CD Check - Changes one byte in the EXE to fool the game into believing the CD is present. Useful if you installed from an original disc, as the CD is only ever needed for this check.


# EXTRA PATCHES:
Don't change mixer volume - If the game detects that it's volume in the mixer isn't what it expects, it changes it to what it expects. This port seems to rely on that slider for it's volume, so this was understandable back in 2001. But nowadays, those who may want to set a finer volume adjustment than what the game normally can do can't. But with this patch, you can. This doesn't affect the internal volume setting itself, and it'll currently only last until you change that in-game volume setting, or restart the game.

Allow 1% volume - Just like it says on the tin. This is a loud game, so I felt this would be useful to some. The volume adjustment slider code is way more intricate than it ever needs to be, so this is the best I can do for now.

Don't move cursor on startup - Yeah, it does that. When windowed it has no buisness messing with the mouse, so this disables that.

# PRACTICE TOOLS:
These can be installed and uninstalled from your EXE. All that's changed are memory address references.
What this does is make some internal variables in the game visible to the player, such as your boat's speed and the wrong way turnaround timer. Having these things on hand is very useful for practicing speedruns, however they are intended for practice only. Which is where the uninstallation comes in to easily revert what changes were made.
