# raspberryjammod-minetest
Raspberry Jam Mod for Minetest

Implements most of Raspberry PI Minecraft API in Minetest.

If you have secure.enable_security = true in minetest.conf, then make sure you have raspberryjammod
listed under secure.trusted_mods. Raspberry Jam Mod cannot be rewritten without needing to be trusted,
because of the following essential features:
 - loading tcp/ip socket dynamic library
 - executing and terminating python interpreter with /py command.
 