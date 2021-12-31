# rasPberrY MinT
#### formerly Raspberry Jam Mod for Minetest

Implements most of Raspberry PI Minecraft API in Minetest.

Original project by [Alexander Pruss](https://github.com/arpruss)

## Intro
This fork was started to add Linux servers support.

## Setup
Copy or link the `raspberrymint` dir into your `minetest/mods` dir, or into your game `mods` dir.

If you have `secure.enable_security = true` in `minetest.conf` (recommended),
then make sure you have `raspberrymint` listed under `secure.trusted_mods`.
Raspberry Mint cannot be rewritten without needing to be trusted,
because of the following essential features:
 - loading tcp/ip socket dynamic library
 - executing and terminating python interpreter with `/py` command.

`minetest.conf` fragment example:

```
secure.enable_security = true
secure.trusted_mods = raspberrymint
```

### Troubleshooting
You could need to add a row on your world's `world.mt` file:

```
load_mod_raspberrymint = true
``` 

## Running python scripts on Minetest

Connect to your Minetest server or run a local server and **authenticate yourself** using login and password.
Be sure to have `jammer` permissions: `\grantme jammer`.

Now try with: `\py cube`. If it works try with other script in `mcpipy` directory, omit the `.py` extension.
Some scripts needs additional parameters.

## Real work/real glory
[Original Raspberry Jam Mod project](https://github.com/arpruss/raspberryjammod) - original for Minecraft

[Original Raspberry Jam Mod project](https://github.com/arpruss/raspberryjammod-minetest) - porting to Minetest

[Lua socket libraries](https://w3.impa.br/~diego/software/luasocket/)

## About lua-socket
`lua-socket` libraries use some binary files `core.dll` / `core.so`.
I add the `core.so` file from **Raspbian** official package that works on my Raspberry Pi (ARM) server.
I add the `cx64.so` file (former `core.so`) from **Ubuntu** official package that works on my x86_64 workstation. 

## Why did you fork?
Raspberry Jam Mod runs on `Windows` and use `python 2.x`. Last project activity was 2 year old.

## Why did you rename the project?
Raspberry Jam Mod was on stand by from so many years that I needed to adapt the code to Minetest's _new_ security policy,
adding missing mod setup files (like `mod.conf` file) and so on.
No radical rewriting was done, but so many small changes are diffuses everywhere.
A full **Linux support** was my primary target, Windows support is not granted.
So I prefer to change mod's name because I'm not able to grant a regression-proof code.

## What's new
Raspberry Mint's Lua code is tested on Minetest 5.5.0-dev.
Raspberry Mint's Python code is now working on `Python 3.x`, 
all tests and examples (but one) actually run on `Linux`, I hope them works good on `Windows` yet.

Added `jammer` permissions.

### Weak security scripts
There are two example's scripts that could run arbitrary python's code. These scripts are renamed 

* `console.py.keepsafe`
* `turtleconsole.py.keepsafe`

you need to remove `.keepsafe` extension to make them work. Do it on a security and singleplayer environment only.

### NeuroSky script

I have no Neuro Sky devices on my own. So `neurosky.py` is not tested.

### Roadmap
* Make this module working in a multiplayer environment.
* Add a usage help to all modules need it.
* Add new sample scripts.
* Add new samples scripts using Turing machine's library.
* Tune up existing code.