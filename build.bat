@echo off

rem pushd tools
rem cl makeboot.c /nologo /Zi /MT /W4 /Wall /WX /wd4200 /wd4201 /wd4668 /wd4189 /wd4100 /wd5045 /link /INCREMENTAL:NO /DEBUG:FULL /WX
rem popd

set CFLAGS=%CFLAGS% -Wall -Wextra -Wpedantic -Werror -Wfatal-errors -Wshadow 
set CFLAGS=%CFLAGS% -Wno-unused-function -Wno-unused-variable -Wno-unused-parameter -Wno-unused-but-set-variable
set CFLAGS=%CFLAGS% -O0 -g3 -ffreestanding -nostdlib
set CFLAGS=%CFLAGS% -mtune=cortex-m0plus -mcpu=cortex-m0plus -mthumb

arm-none-eabi-gcc boot_sram.s main.c -o boot.elf %CFLAGS% -Wl,-Tboot.ld
tools\makeboot.exe boot.elf
arm-none-eabi-size boot.elf
