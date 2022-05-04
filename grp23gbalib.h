#include "Sprites_UniSnakes.h"
#define INPUT                      (KEY_MASK & (~REG_KEYS))

void fillPalette(void)
{
    int     i;

	// Fill the palette in GBA memory
    for (i = 0; i < NCOLS; i++)
        spritePal[i] = palette[i];
}


void drawSprite(int numb, int N, int x, int y)
{
	// Same as CA2, make specific sprite (based on its name/numb) appear on screen, as slide number N (each sprite needs a different, arbitrary, N >= 0)
    *(unsigned short *)(0x7000000 + 8*N) = y | 0x2000;
    *(unsigned short *)(0x7000002 + 8*N) = x | 0x4000;
    *(unsigned short *)(0x7000004 + 8*N) = numb*8;
}


void clearScreen(void) //clears and resets screen to be black by converting all sprites to black
{

	drawSprite(17,0,240,160);
	drawSprite(17,1,240,160);
	drawSprite(17,2,240,160);
	drawSprite(17,3,240,160);
	drawSprite(17,4,240,160);
	drawSprite(17,5,240,160);
	drawSprite(17,6,240,160);
	drawSprite(17,7,240,160);
	drawSprite(17,8,240,160);
	drawSprite(17,9,240,160);
	drawSprite(17,10,240,160);
	drawSprite(17,11,240,160);
	drawSprite(17,12,240,160);
	drawSprite(17,13,240,160);
	drawSprite(17,14,240,160);
	drawSprite(17,15,240,160);

}


void fillSprites(void)
{
    int     i;

	// Load all sprites in GBA memory
    for (i = 0; i < 128*16*16; i++)
        spriteData[i] = (sprites[i*2+1] << 8) + sprites[i*2];

	// draw all sprites on screen, but all of them outside of the screen (starting at position (240,160) the bottom right corner of the GBA screen)
    for(i = 0; i < 128; i++)
        drawSprite(0, i, 240,160);
}


void menuScreen(void) //start menu screen display
{
	//title of game
	drawSprite(15,0,50,60);
	drawSprite(14,1,65,60);
	drawSprite(13,2,75,60);
	drawSprite(5,3,100,60);
	drawSprite(14,4,115,60);
	drawSprite(7,5,130,60);
	drawSprite(16,6,145,60);
	drawSprite(11,7,160,60);
	drawSprite(5,8,175,60);

	//draw snake sprite
	drawSprite(1,9,115,100);
	
	//start word
	drawSprite(5,10,85,140);
	drawSprite(6,11,100,140);
	drawSprite(7,12,115,140);
	drawSprite(8,13,130,140);
	drawSprite(6,14,145,140);

}

void winScreen(void) //win screen display
{
	drawSprite(12,0,100,60);
	drawSprite(13,1,115,60);
	drawSprite(14,2,130,60);
}

void loseScreen(void) //lose screen display
{
	drawSprite(9,0,90,60);
	drawSprite(10,1,105,60);
	drawSprite(5,2,120,60);
	drawSprite(11,3,135,60);
}


void triggerbutton_checkupdate(void)
{	
    u16 buttons = INPUT;
	//initialise all the variables required for game setup
    static float snake_x = 16;
	 static float snake_y = 128;
	 static float enemy1_x = 70;
    static float enemy1_y = 100;
	 static float enemy2_x = 120;
	 static float enemy2_y = 60;
	 static float x_unitstep = 0.5;
	 static float y_unitstep = 0.5;
	 static float x_unitstep_e1 = 2;
	 static float y_unitstep_e1 = 2;
	 static float x_unitstep_e2 = 2;
	 static float y_unitstep_e2 = 2;

	 static int current_page = 0;
	 static int snake_direction = 1;  // 0 is facing left, 1 is facing right
	 static int enemy1_direction = 1; // 0 is facing left, 1 is facing right
    static int student1flag = 2;
	 static int student2flag = 2;


	 //PAGE 0 MENU//////////////////////////////////////////////////////////////////////////////////
	 if (current_page==0)
		{
			menuScreen();
			if ((buttons & KEY_START) == KEY_START)
			{
				current_page = 1;
				clearScreen();
				//reset game variables parameter if restart
     			snake_x = 16;
	 			snake_y = 128;
	 			enemy1_x = 70;
    			enemy1_y = 100;
	 			enemy2_x = 120;
	 			enemy2_y = 60;
				x_unitstep_e1 = 2;
				y_unitstep_e1 = 2;
				x_unitstep_e2 = 2;
				y_unitstep_e2 = 2;
	 			snake_direction = 1;  
	 			enemy1_direction = 1; 
    			student1flag = 2;
	 			student2flag = 2;
			}
		}

	 if ((buttons & KEY_UP) == KEY_UP) // Player presses 'UP' button 
	 	{
    		snake_y -= y_unitstep; // snake goes up
    	}  
	 if ((buttons & KEY_DOWN) == KEY_DOWN) // Player presses 'DOWN' button 
	 	{
    		snake_y += y_unitstep; // snake goes down
    	}  
	 if ((buttons & KEY_RIGHT) == KEY_RIGHT) // Player presses 'RIGHT' button 
	 	{
    		snake_x += x_unitstep; // snake goes right
			snake_direction = 1;
    	}  
	 if ((buttons & KEY_LEFT) == KEY_LEFT) // Player presses 'LEFT' button 
	 	{
    		snake_x -= x_unitstep; // snake goes left
			snake_direction = 0;
    	}
  

	 //PAGE 1 ///////////////////////////////////////////////////////////////////////////////////////
	 if (current_page ==1)
	 {
			drawSprite(student1flag,0,200,30);
			drawSprite(student2flag,1,170,120); //setup stationary sprites for stage
			drawSprite(snake_direction,2,snake_x,snake_y); //draws snake
			drawSprite(enemy1_direction+3,3,enemy1_x,enemy1_y); //draws enemy snake 1
			drawSprite(4,4,enemy2_x,enemy2_y); //draws enemy snake 2
			enemy1_x = enemy1_x + x_unitstep_e1; //updates position of enemy snake 1
			enemy2_y = enemy2_y + y_unitstep_e2; //updates position of enemy snake 2

			if (enemy1_x<3 || enemy1_x>237) //ensures enemy snake follows a fixed path cycle back and forth
				{
					x_unitstep_e1 = -x_unitstep_e1;
					enemy1_direction = 1-enemy1_direction; //flip direction of enemy
				}
			if (enemy2_y<3 || enemy2_y>148) //ensures enemy snake follows a fixed path cycle back and forth
				{
					y_unitstep_e2 = -y_unitstep_e2;
				}
			if (snake_x <0) 
				{
					if ((buttons & KEY_LEFT) == KEY_LEFT) //ensures snake does not go out of bounds on left side of screen
						{
							snake_x += x_unitstep;
						}				
				}
			if (snake_x >230) 
				{
					if ((buttons & KEY_RIGHT) == KEY_RIGHT) //ensures snake does not go out of bounds on right side of screen
						{
							snake_x -= x_unitstep;
						}				
				}
			if (snake_y <0) 
				{
					if ((buttons & KEY_UP) == KEY_UP) //ensures snake does not go out of bounds on top side of screen
						{
							snake_y += y_unitstep;
						}				
				}
			if (snake_y >150) 
				{
					if ((buttons & KEY_DOWN) == KEY_DOWN) //ensures snake does not go out of bounds on bottom side of screen
						{
							snake_y -= y_unitstep;
						}				
				}
			if (snake_x>192 && snake_x<208) //if snake touches student1, student1 'dies' by becoming black sprite
				{
					if (snake_y>22 && snake_y<38)
						{
							student1flag = 17;
						}
				}
			if (snake_x>162 && snake_x<178) //if snake touches student2, student2 'dies' by becoming black sprite
				{
					if (snake_y>112 && snake_y<128)
						{
							student2flag = 17;
						}
				}
			if (snake_x > enemy1_x - 8 && snake_x < enemy1_x + 8) //if snake touches enemy1, go to lose page
				{
					if (snake_y > enemy1_y - 8 && snake_y < enemy1_y + 8)
						{
							current_page = 3;
							clearScreen();
						}
				}
			if (snake_x > enemy2_x - 8 && snake_x < enemy2_x + 8) //if snake touches enemy2, go to lose page
				{
					if (snake_y > enemy2_y - 8 && snake_y < enemy2_y + 8)
						{
							current_page = 3;
							clearScreen();
						}
				}
			if (student1flag==17 && student2flag==17) //if both students are killed, go to win page
				{
					current_page = 2;
					clearScreen();
				}
	  }

	//PAGE 2 ////////////////////////////////////////////////////////////////////////////////////////		
	if (current_page == 2) //win page
		{
			winScreen();
			if ((buttons & KEY_A) == KEY_A) //go to main menu pressing button A
				{
					current_page = 0;
					clearScreen();
				}
		}

	//PAGE 3 ////////////////////////////////////////////////////////////////////////////////////////
	if (current_page == 3) //lose page
		{
			loseScreen();
			if ((buttons & KEY_A) == KEY_A) //go to main menu pressing button A
				{
					current_page = 0;
					clearScreen();
				}
		}

}

