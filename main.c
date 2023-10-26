#include "rp2040.h"

static void BusyWait(unsigned int Count)
{
    while(Count--)
    {
        // Do nothing
    }
}

__attribute__((section(".text.main"), used))
void Main(void)
{
    asm("bkpt");

    XOSC->CTRL = (XOSC_CTRL_FREQ_RANGE_1_15MHZ << XOSC_CTRL_FREQ_RANGE_Pos);
    XOSC->STARTUP = (0xC4 << XOSC_STARTUP_DELAY_Pos);
    XOSC->
    RESETS_CLR->RESET_b.io_bank0 = 1;
    while(!RESETS->RESET_DONE_b.io_bank0);
    IO_BANK0->GPIO25_CTRL_b.FUNCSEL = IO_BANK0_GPIO25_CTRL_FUNCSEL_sio_25;
    SIO->GPIO_OE = 1 << 25;

    RESETS_CLR->RESET_b.uart0 = 1;
    while(!RESETS->RESET_DONE_b.uart0);

    while( 1 )
    {
        SIO->GPIO_OUT_XOR = 1 << 25;
        BusyWait(1000000);
    }
}