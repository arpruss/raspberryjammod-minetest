# raspberryjammod-minetest
Raspberry Jam Mod for Minetest

Implements most of Raspberry PI Minecraft API in Minetest.

## Intro
This fork was started to add Linux servers support.

## Setup
Copy or link the `raspberryjammod` dir into your `minetest/mods` dir, or into your game `mods` dir.

If you have `secure.enable_security = true` in `minetest.conf`, then make sure you have `raspberryjammod`
listed under `secure.trusted_mods`. Raspberry Jam Mod cannot be rewritten without needing to be trusted,
because of the following essential features:
 - loading tcp/ip socket dynamic library
 - executing and terminating python interpreter with `/py` command.

Setup fragment example:

```
secure.enable_security = true
secure.trusted_mods = raspberryjammod
```

## About lua-socket
`lua-socket` libraries use some binary files `core.dll` / `core.so`. I add to the project the `core.so` file from the **Raspbian** `.deb` package that works fine on my Raspberry Pi (ARM) server.

## Roadmap
I would like to make this module working in mutiplayer environment, probably adding a parameter to all python's processes.

## Real work/real glory
[Original Raspberry Jam Mod project](https://github.com/arpruss/raspberryjammod)
[Original Raspberry Jam Mod project](https://github.com/arpruss/raspberryjammod-minetest) - porting to Minetest
[Lua socket libraries](https://w3.impa.br/~diego/software/luasocket/)

