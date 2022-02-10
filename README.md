*caution: currently is nothing fully supported*

A minimal library for cross platform retro games. The goal is to rely a lot on SDCC’s standard library and tools. But have everything for a hello world.

What should work at some point:
- printf
- loading tiles and manipulating their attributes

Best accompanied by [superfamiconv].

Build like:

```
/usr/bin/make SDCCBIN=/your/sdcc/bin/ TARGET=nes
```

Possible targets:
* gb (Nintendo Game Boy; sm83)
* nes (Nintendo Entertainment System; 6502)
* gg (Sega Game Gear; Z80)
* sms (Sega Master System; Z80A)

[superfamiconv]: https://github.com/Optiroc/SuperFamiconv