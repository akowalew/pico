ENTRY(Main)

SECTIONS
{
    /* Physical address is 0x10000000 (FLASH start) but the load address is 0x20041F00 
       because this is the place where first stage bootloader will load us to RAM */
    .boot2 0x20041F00 : AT (0x10000000) 
    { 
        PROVIDE (__BOOT_START = .);
    
        *(.boot2*)

        PROVIDE (__BOOT_END = .);

        /* We want to ensure, that final ELF image will have exactly 256 bytes */
        . = 0x100;

        /* But we cannot allow that any data will go into CRC area */
        ASSERT (__BOOT_END - __BOOT_START < 252, "Error");
    } 

    .text 0x20000100 : AT (0x10000100) 
    { 
        *(.text.main*)
        *(.text*)
    } 
}
