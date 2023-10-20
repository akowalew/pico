#include "rp2040.h"

void BootMain(void)
{
    RESETS_CLR->RESET_b.io_bank0 = 1;
    while(!RESETS->RESET_DONE_b.io_bank0);
    IO_BANK0->GPIO25_CTRL_b.FUNCSEL = IO_BANK0_GPIO25_CTRL_FUNCSEL_sio_25;
    SIO->GPIO_OE = 1 << 25;

    while( 1 )
    {
        SIO->GPIO_OUT_XOR = 1 << 25;
        for( volatile unsigned int a = 5000000; a > 0; a-- )
        {

        }
    }
}