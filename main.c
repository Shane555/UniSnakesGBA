// -----------------------------------------------------------------------------
// C-Skeleton to be used with HAM Library from www.ngine.de
// -----------------------------------------------------------------------------
#include "gba.h"
#include "grp23gbalib.h"

void Handler(void)
{
    REG_IME = 0x00; // Stop all other interrupt handling, while we handle this current one
    
    if ((REG_IF&INT_TIMER0) == INT_TIMER0) // when timer0 is invoked
    {
        	triggerbutton_checkupdate();
    }

    REG_IF = REG_IF; // Update interrupt table, to confirm we have handled this interrupt
    
    REG_IME = 0x01;  // Re-enable interrupt handling
}


// -----------------------------------------------------------------------------
// Project Entry Point
// -----------------------------------------------------------------------------
int main(void)
{
	
    // Set Mode 2
    *(unsigned short *) 0x4000000 = 0x40 | 0x2 | 0x1000;

	 //Fill SpritePal and SpriteData
	 fillPalette(); //Fill the palette in GBA mem
	 fillSprites(); //Load the sprites in GBA mem
	
    // Set Handler Function for interrupts and enable selected interrupts
    REG_INT = (int)&Handler;
    REG_IE = INT_TIMER0; 		// enable timer interrupt for timer0
	 REG_IME = 0x1;		// Enable interrupt handling

    // Set Timer Mode (fill that section and replace TMX with selected timer number)
    REG_TM0D =	50000; //set initial timer value
    REG_TM0CNT |= TIMER_FREQUENCY_64|TIMER_ENABLE|TIMER_INTERRUPTS; //Ensures timer starts from 50000 and counts up till 65335 every 3.8 micro-seconds before resetting to 50000

	

    while(1);

	return 0;
}
