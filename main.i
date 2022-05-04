# 1 "main.c"
# 1 "<built-in>"
# 1 "<command line>"
# 1 "main.c"



# 1 "gba.h" 1







typedef unsigned char u8;
typedef unsigned short u16;
typedef unsigned int u32;

typedef signed char s8;
typedef signed short s16;
typedef signed int s32;

typedef unsigned char byte;
typedef unsigned short hword;
typedef unsigned int word;
# 211 "gba.h"
enum
{
    VBLANK_HANDLER,
    HBLANK_HANDLER,
    VCOUNT_HANDLER,
    TIMER0_HANDLER,
    TIMER1_HANDLER,
    TIMER2_HANDLER,
    TIMER3_HANDLER,
    SERIAL_COM_HANDLER,
    DMA0_HANDLER,
    DMA1_HANDLER,
    DMA2_HANDLER,
    DMA3_HANDLER,
    KEYS_HANDLER,
    CART_HANDLER,
    MAX_INTERRUPT_HANDLERS,
};
# 267 "gba.h"
typedef void (*fp)(void);
# 5 "main.c" 2
# 1 "grp23gbalib.h" 1
# 1 "Sprites_UniSnakes.h" 1





int palette[] = {
((0) + (0<<5) + (0<<10)),
((31) + (31<<5) + (31<<10)),
((16) + (31<<5) + (16<<10)),
((0) + (31<<5) + (31<<10)),
((26) + (26<<5) + (26<<10)),
((9) + (9<<5) + (9<<10)),
((31) + (31<<5) + (0<<10)),
((31) + (0<<5) + (0<<10)),
((29) + (26<<5) + (23<<10)),
((11) + (8<<5) + (3<<10)),
};



u16 sprites[] = {



0,0,0,0,0,0,0,0,
0,0,0,0,0,0,0,0,
0,0,0,0,0,0,2,2,
0,0,0,0,0,0,2,2,
0,0,0,0,2,2,2,2,
0,0,0,0,2,0,2,0,
0,0,0,0,2,2,2,2,
0,0,0,0,0,7,2,2,

0,0,0,0,0,0,0,0,
0,0,0,0,0,0,0,0,
2,2,0,0,0,0,0,0,
2,2,2,0,0,0,0,0,
2,2,2,0,0,0,0,0,
2,2,2,0,0,0,0,0,
2,2,2,0,0,0,0,0,
2,2,2,0,0,0,0,0,

0,0,0,0,7,7,7,2,
0,0,7,7,7,7,2,2,
0,7,7,7,0,0,2,2,
0,0,7,0,0,0,2,2,
0,0,0,0,0,0,2,2,
0,0,0,0,0,0,0,0,
0,0,0,0,0,0,0,0,
0,0,0,0,0,0,0,0,

9,2,2,0,0,0,0,0,
2,9,2,2,0,0,0,0,
2,2,9,2,2,2,0,0,
2,2,2,2,2,2,2,0,
2,2,2,2,2,2,0,0,
0,0,0,0,0,0,0,0,
0,0,0,0,0,0,0,0,
0,0,0,0,0,0,0,0,



0,0,0,0,0,0,0,0,
0,0,0,0,0,0,0,0,
0,0,0,0,0,0,2,2,
0,0,0,0,0,2,2,2,
0,0,0,0,0,2,2,2,
0,0,0,0,0,2,2,2,
0,0,0,0,0,2,2,2,
0,0,0,0,0,2,2,2,

0,0,0,0,0,0,0,0,
0,0,0,0,0,0,0,0,
2,2,0,0,0,0,0,0,
2,2,0,0,0,0,0,0,
2,2,2,2,0,0,0,0,
0,2,0,2,0,0,0,0,
2,2,2,2,0,0,0,0,
2,2,7,0,0,0,0,0,

0,0,0,0,0,2,2,9,
0,0,0,0,2,2,9,2,
0,0,2,2,2,9,2,2,
0,2,2,2,2,2,2,2,
0,0,2,2,2,2,2,2,
0,0,0,0,0,0,0,0,
0,0,0,0,0,0,0,0,
0,0,0,0,0,0,0,0,

2,7,7,7,0,0,0,0,
2,2,7,7,7,7,0,0,
2,2,0,0,7,7,7,0,
2,2,0,0,0,7,0,0,
2,2,0,0,0,0,0,0,
0,0,0,0,0,0,0,0,
0,0,0,0,0,0,0,0,
0,0,0,0,0,0,0,0,



0,0,0,0,0,0,0,0,
0,0,0,0,0,0,0,0,
0,0,0,0,0,0,9,9,
0,0,0,0,0,9,9,9,
0,0,0,0,0,9,8,8,
0,0,0,0,0,8,8,8,
0,0,0,0,0,8,8,8,
0,0,0,0,0,8,8,8,

0,0,0,0,0,0,0,0,
0,0,0,0,0,0,0,0,
9,9,9,9,0,0,0,0,
9,9,9,9,0,0,0,0,
8,8,8,8,0,0,0,0,
0,8,0,8,0,0,0,0,
8,8,8,8,0,0,0,0,
0,0,8,8,0,0,0,0,

0,0,0,0,0,1,8,8,
0,0,0,0,1,1,1,1,
0,0,0,8,0,1,7,7,
0,0,0,0,0,1,1,1,
0,0,0,0,0,0,5,5,
0,0,0,0,0,5,5,0,
0,0,0,0,0,5,0,0,
0,0,0,0,0,0,0,0,

8,8,8,1,0,0,0,0,
1,1,1,1,0,0,0,0,
7,7,1,0,8,0,0,0,
1,1,1,0,0,0,0,0,
5,5,0,0,0,0,0,0,
0,5,0,0,0,0,0,0,
0,5,5,0,0,0,0,0,
0,0,0,0,0,0,0,0,



0,0,0,0,0,0,0,0,
0,0,0,0,0,0,0,0,
0,0,0,0,0,0,3,3,
0,0,0,0,0,0,3,3,
0,0,0,0,3,3,3,3,
0,0,0,0,3,0,3,0,
0,0,0,0,3,3,3,3,
0,0,0,0,0,7,3,3,

0,0,0,0,0,0,0,0,
0,0,0,0,0,0,0,0,
3,3,0,0,0,0,0,0,
3,3,3,0,0,0,0,0,
3,3,3,0,0,0,0,0,
3,3,3,0,0,0,0,0,
3,3,3,0,0,0,0,0,
3,3,3,0,0,0,0,0,

0,0,0,0,7,7,7,3,
0,0,7,7,7,7,3,3,
0,7,7,7,0,0,3,3,
0,0,7,0,0,0,3,3,
0,0,0,0,0,0,3,3,
0,0,0,0,0,0,0,0,
0,0,0,0,0,0,0,0,
0,0,0,0,0,0,0,0,

9,3,3,0,0,0,0,0,
3,9,3,3,0,0,0,0,
3,3,9,3,3,3,0,0,
3,3,3,3,3,3,3,0,
3,3,3,3,3,3,0,0,
0,0,0,0,0,0,0,0,
0,0,0,0,0,0,0,0,
0,0,0,0,0,0,0,0,



0,0,0,0,0,0,0,0,
0,0,0,0,0,0,0,0,
0,0,0,0,0,0,3,3,
0,0,0,0,0,3,3,3,
0,0,0,0,0,3,3,3,
0,0,0,0,0,3,3,3,
0,0,0,0,0,3,3,3,
0,0,0,0,0,3,3,3,

0,0,0,0,0,0,0,0,
0,0,0,0,0,0,0,0,
3,3,0,0,0,0,0,0,
3,3,0,0,0,0,0,0,
3,3,3,3,0,0,0,0,
0,3,0,3,0,0,0,0,
3,3,3,3,0,0,0,0,
3,3,7,0,0,0,0,0,

0,0,0,0,0,3,3,9,
0,0,0,0,3,3,9,3,
0,0,3,3,3,9,3,3,
0,3,3,3,3,3,3,3,
0,0,3,3,3,3,3,3,
0,0,0,0,0,0,0,0,
0,0,0,0,0,0,0,0,
0,0,0,0,0,0,0,0,

3,7,7,7,0,0,0,0,
3,3,7,7,7,7,0,0,
3,3,0,0,7,7,7,0,
3,3,0,0,0,7,0,0,
3,3,0,0,0,0,0,0,
0,0,0,0,0,0,0,0,
0,0,0,0,0,0,0,0,
0,0,0,0,0,0,0,0,



0,0,0,0,0,0,0,0,
0,0,0,0,0,0,0,1,
0,0,0,0,0,0,1,1,
0,0,0,0,0,1,1,0,
0,0,0,0,1,1,0,0,
0,0,0,0,1,1,0,0,
0,0,0,0,0,1,1,0,
0,0,0,0,0,0,1,1,

0,0,0,0,0,0,0,0,
1,1,1,0,0,0,0,0,
1,1,1,1,0,0,0,0,
0,0,0,1,0,0,0,0,
0,0,0,1,0,0,0,0,
0,0,0,0,0,0,0,0,
0,0,0,0,0,0,0,0,
0,0,0,0,0,0,0,0,

0,0,0,0,0,0,0,1,
0,0,0,0,0,0,0,0,
0,0,0,0,0,0,0,0,
0,0,0,0,1,0,0,0,
0,0,0,0,1,0,0,0,
0,0,0,0,0,1,0,0,
0,0,0,0,0,1,1,1,
0,0,0,0,0,0,0,0,

1,1,0,0,0,0,0,0,
0,1,1,0,0,0,0,0,
0,0,1,1,0,0,0,0,
0,0,1,1,0,0,0,0,
0,0,1,1,0,0,0,0,
1,1,1,0,0,0,0,0,
1,1,0,0,0,0,0,0,
0,0,0,0,0,0,0,0,



0,0,0,0,0,0,0,0,
0,0,0,1,1,1,1,1,
0,0,0,1,1,1,1,1,
0,0,0,0,0,0,0,1,
0,0,0,0,0,0,0,1,
0,0,0,0,0,0,0,1,
0,0,0,0,0,0,0,1,
0,0,0,0,0,0,0,1,

0,0,0,0,0,0,0,0,
1,1,1,1,1,1,0,0,
1,1,1,1,1,1,0,0,
1,0,0,0,0,0,0,0,
1,0,0,0,0,0,0,0,
1,0,0,0,0,0,0,0,
1,0,0,0,0,0,0,0,
1,0,0,0,0,0,0,0,

0,0,0,0,0,0,0,1,
0,0,0,0,0,0,0,1,
0,0,0,0,0,0,0,1,
0,0,0,0,0,0,0,1,
0,0,0,0,0,0,0,1,
0,0,0,0,0,0,0,1,
0,0,0,0,0,0,0,1,
0,0,0,0,0,0,0,0,

1,0,0,0,0,0,0,0,
1,0,0,0,0,0,0,0,
1,0,0,0,0,0,0,0,
1,0,0,0,0,0,0,0,
1,0,0,0,0,0,0,0,
1,0,0,0,0,0,0,0,
1,0,0,0,0,0,0,0,
0,0,0,0,0,0,0,0,



0,0,0,0,0,0,0,0,
0,0,0,0,0,0,0,0,
0,0,0,0,0,0,0,1,
0,0,0,0,0,0,0,1,
0,0,0,0,0,0,1,1,
0,0,0,0,0,0,1,1,
0,0,0,0,0,0,1,0,
0,0,0,0,0,1,1,0,

0,0,0,0,0,0,0,0,
1,0,0,0,0,0,0,0,
1,1,0,0,0,0,0,0,
1,1,0,0,0,0,0,0,
0,1,1,0,0,0,0,0,
0,1,1,0,0,0,0,0,
0,0,1,0,0,0,0,0,
0,0,1,1,0,0,0,0,

0,0,0,0,0,1,1,0,
0,0,0,0,0,1,1,1,
0,0,0,0,1,1,1,1,
0,0,0,0,1,1,0,0,
0,0,0,1,1,0,0,0,
0,0,0,1,1,0,0,0,
0,0,1,1,0,0,0,0,
0,0,0,0,0,0,0,0,

0,0,1,1,0,0,0,0,
1,1,1,1,0,0,0,0,
1,1,1,1,0,0,0,0,
0,0,0,1,1,0,0,0,
0,0,0,0,1,1,0,0,
0,0,0,0,1,1,0,0,
0,0,0,0,0,1,1,0,
0,0,0,0,0,0,0,0,



0,0,0,0,0,0,0,0,
0,0,0,0,1,1,1,1,
0,0,0,0,1,1,0,0,
0,0,0,0,1,1,0,0,
0,0,0,0,1,1,0,0,
0,0,0,0,1,1,0,0,
0,0,0,0,1,1,0,0,
0,0,0,0,1,1,1,1,

0,0,0,0,0,0,0,0,
1,1,0,0,0,0,0,0,
0,1,1,0,0,0,0,0,
0,0,1,1,0,0,0,0,
0,0,0,1,0,0,0,0,
0,0,0,1,0,0,0,0,
0,0,1,1,0,0,0,0,
1,1,1,0,0,0,0,0,

0,0,0,0,1,1,1,1,
0,0,0,0,1,1,0,0,
0,0,0,0,1,1,0,0,
0,0,0,0,1,1,0,0,
0,0,0,0,1,1,0,0,
0,0,0,0,1,1,0,0,
0,0,0,0,1,1,0,0,
0,0,0,0,0,0,0,0,

1,1,0,0,0,0,0,0,
0,1,1,0,0,0,0,0,
0,1,1,0,0,0,0,0,
0,0,1,1,0,0,0,0,
0,0,1,1,0,0,0,0,
0,0,0,1,1,0,0,0,
0,0,0,1,1,0,0,0,
0,0,0,0,0,0,0,0,



0,0,0,0,0,1,1,0,
0,0,0,0,0,1,1,0,
0,0,0,0,0,1,1,0,
0,0,0,0,0,1,1,0,
0,0,0,0,0,1,1,0,
0,0,0,0,0,1,1,0,
0,0,0,0,0,1,1,0,
0,0,0,0,0,1,1,0,

0,0,0,0,0,0,0,0,
0,0,0,0,0,0,0,0,
0,0,0,0,0,0,0,0,
0,0,0,0,0,0,0,0,
0,0,0,0,0,0,0,0,
0,0,0,0,0,0,0,0,
0,0,0,0,0,0,0,0,
0,0,0,0,0,0,0,0,

0,0,0,0,0,1,1,0,
0,0,0,0,0,1,1,0,
0,0,0,0,0,1,1,0,
0,0,0,0,0,1,1,0,
0,0,0,0,0,1,1,0,
0,0,0,0,0,1,1,1,
0,0,0,0,0,1,1,1,
0,0,0,0,0,0,0,0,

0,0,0,0,0,0,0,0,
0,0,0,0,0,0,0,0,
0,0,0,0,0,0,0,0,
0,0,0,0,0,0,0,0,
0,0,0,0,0,0,0,0,
1,1,1,1,0,0,0,0,
1,1,1,1,0,0,0,0,
0,0,0,0,0,0,0,0,



0,0,0,0,0,0,0,0,
0,0,0,0,0,1,1,1,
0,0,0,0,0,1,1,1,
0,0,0,0,1,1,0,0,
0,0,0,1,0,0,0,0,
0,0,1,1,0,0,0,0,
0,0,1,1,0,0,0,0,
0,0,1,1,0,0,0,0,

0,0,0,0,0,0,0,0,
1,1,1,0,0,0,0,0,
1,1,1,0,0,0,0,0,
0,0,0,1,1,0,0,0,
0,0,0,0,1,0,0,0,
0,0,0,0,1,1,0,0,
0,0,0,0,1,1,0,0,
0,0,0,0,1,1,0,0,

0,0,1,1,0,0,0,0,
0,0,1,1,0,0,0,0,
0,0,1,1,0,0,0,0,
0,0,0,1,0,0,0,0,
0,0,0,0,1,1,0,0,
0,0,0,0,0,1,1,1,
0,0,0,0,0,0,1,1,
0,0,0,0,0,0,0,0,

0,0,0,0,1,1,0,0,
0,0,0,0,1,1,0,0,
0,0,0,0,1,1,0,0,
0,0,0,0,1,0,0,0,
0,0,0,1,1,0,0,0,
1,1,1,1,0,0,0,0,
1,1,1,0,0,0,0,0,
0,0,0,0,0,0,0,0,



0,0,0,0,0,0,0,0,
0,0,0,0,0,1,1,1,
0,0,0,0,0,1,1,1,
0,0,0,0,0,1,1,0,
0,0,0,0,0,1,1,0,
0,0,0,0,0,1,1,0,
0,0,0,0,0,1,1,0,
0,0,0,0,0,1,1,1,

0,0,0,0,0,0,0,0,
1,1,1,1,0,0,0,0,
1,1,1,1,0,0,0,0,
0,0,0,0,0,0,0,0,
0,0,0,0,0,0,0,0,
0,0,0,0,0,0,0,0,
0,0,0,0,0,0,0,0,
1,1,1,1,0,0,0,0,

0,0,0,0,0,1,1,1,
0,0,0,0,0,1,1,0,
0,0,0,0,0,1,1,0,
0,0,0,0,0,1,1,0,
0,0,0,0,0,1,1,0,
0,0,0,0,0,1,1,1,
0,0,0,0,0,1,1,1,
0,0,0,0,0,0,0,0,

1,1,1,1,0,0,0,0,
0,0,0,0,0,0,0,0,
0,0,0,0,0,0,0,0,
0,0,0,0,0,0,0,0,
0,0,0,0,0,0,0,0,
1,1,1,1,0,0,0,0,
1,1,1,1,0,0,0,0,
0,0,0,0,0,0,0,0,



0,0,0,0,0,0,0,0,
0,0,0,0,0,0,0,0,
1,0,0,0,0,0,0,0,
1,1,0,0,0,0,0,1,
0,1,0,0,0,0,0,1,
0,1,0,0,0,0,1,1,
0,1,1,0,0,0,1,0,
0,1,1,0,0,0,1,0,

0,0,0,0,0,0,0,0,
1,0,0,0,0,0,0,0,
1,0,0,0,0,0,0,1,
1,1,0,0,0,0,1,1,
1,1,0,0,0,0,1,0,
1,1,0,0,0,0,1,0,
0,1,0,0,0,1,1,0,
0,1,0,0,0,1,0,0,

0,0,1,0,0,0,1,0,
0,0,1,0,0,1,1,0,
0,0,1,0,0,1,0,0,
0,0,1,1,1,1,0,0,
0,0,0,1,1,1,0,0,
0,0,0,1,1,1,0,0,
0,0,0,0,1,0,0,0,
0,0,0,0,0,0,0,0,

0,1,0,0,0,1,0,0,
0,1,1,0,0,1,0,0,
0,0,1,0,0,1,0,0,
0,0,1,1,1,1,0,0,
0,0,0,1,1,1,0,0,
0,0,0,1,1,1,0,0,
0,0,0,0,1,0,0,0,
0,0,0,0,0,0,0,0,



0,0,0,0,0,0,0,0,
0,0,0,0,0,0,0,1,
0,0,0,0,0,0,0,1,
0,0,0,0,0,0,0,1,
0,0,0,0,0,0,0,1,
0,0,0,0,0,0,0,1,
0,0,0,0,0,0,0,1,
0,0,0,0,0,0,0,1,

0,0,0,0,0,0,0,0,
1,0,0,0,0,0,0,0,
1,0,0,0,0,0,0,0,
1,0,0,0,0,0,0,0,
1,0,0,0,0,0,0,0,
1,0,0,0,0,0,0,0,
1,0,0,0,0,0,0,0,
1,0,0,0,0,0,0,0,

0,0,0,0,0,0,0,1,
0,0,0,0,0,0,0,1,
0,0,0,0,0,0,0,1,
0,0,0,0,0,0,0,1,
0,0,0,0,0,0,0,1,
0,0,0,0,0,0,0,1,
0,0,0,0,0,0,0,1,
0,0,0,0,0,0,0,0,

1,0,0,0,0,0,0,0,
1,0,0,0,0,0,0,0,
1,0,0,0,0,0,0,0,
1,0,0,0,0,0,0,0,
1,0,0,0,0,0,0,0,
1,0,0,0,0,0,0,0,
1,0,0,0,0,0,0,0,
0,0,0,0,0,0,0,0,



0,0,0,0,0,0,0,0,
0,0,0,1,1,0,0,0,
0,0,0,1,1,1,0,0,
0,0,0,1,1,1,0,0,
0,0,0,1,1,1,1,0,
0,0,0,1,0,0,1,0,
0,0,0,1,0,0,0,1,
0,0,0,1,0,0,0,1,

0,0,0,0,0,0,0,0,
0,0,0,0,1,0,0,0,
0,0,0,0,1,0,0,0,
0,0,0,0,1,0,0,0,
0,0,0,0,1,0,0,0,
0,0,0,0,1,0,0,0,
0,0,0,0,1,0,0,0,
1,0,0,0,1,0,0,0,

0,0,0,1,0,0,0,0,
0,0,0,1,0,0,0,0,
0,0,0,1,0,0,0,0,
0,0,0,1,0,0,0,0,
0,0,0,1,0,0,0,0,
0,0,0,1,0,0,0,0,
0,0,0,1,0,0,0,0,
0,0,0,0,0,0,0,0,

1,0,0,0,1,0,0,0,
1,1,0,0,1,0,0,0,
0,1,1,0,1,0,0,0,
0,0,1,0,1,0,0,0,
0,0,1,1,1,0,0,0,
0,0,0,1,1,0,0,0,
0,0,0,1,1,0,0,0,
0,0,0,0,0,0,0,0,



0,0,0,0,0,0,0,0,
0,0,0,1,1,0,0,0,
0,0,0,1,1,0,0,0,
0,0,0,1,1,0,0,0,
0,0,0,1,1,0,0,0,
0,0,0,1,1,0,0,0,
0,0,0,1,1,0,0,0,
0,0,0,1,1,0,0,0,

0,0,0,0,0,0,0,0,
0,0,0,1,1,0,0,0,
0,0,0,1,1,0,0,0,
0,0,0,1,1,0,0,0,
0,0,0,1,1,0,0,0,
0,0,0,1,1,0,0,0,
0,0,0,1,1,0,0,0,
0,0,0,1,1,0,0,0,

0,0,0,1,1,0,0,0,
0,0,0,1,1,0,0,0,
0,0,0,1,1,0,0,0,
0,0,0,1,1,0,0,0,
0,0,0,1,1,1,0,0,
0,0,0,0,1,1,1,1,
0,0,0,0,0,1,1,1,
0,0,0,0,0,0,0,0,

0,0,0,1,1,0,0,0,
0,0,0,1,1,0,0,0,
0,0,0,1,1,0,0,0,
0,0,0,1,1,0,0,0,
0,0,1,1,1,0,0,0,
1,1,1,1,0,0,0,0,
1,1,1,0,0,0,0,0,
0,0,0,0,0,0,0,0,



0,0,0,0,0,0,0,0,
0,0,0,0,0,1,1,0,
0,0,0,0,0,1,1,0,
0,0,0,0,0,1,1,0,
0,0,0,0,0,1,1,0,
0,0,0,0,0,1,1,0,
0,0,0,0,0,1,1,0,
0,0,0,0,0,1,1,1,

0,0,0,0,0,0,0,0,
0,0,0,1,1,0,0,0,
0,0,0,1,1,0,0,0,
0,0,1,1,0,0,0,0,
0,0,1,1,0,0,0,0,
1,1,1,0,0,0,0,0,
1,1,0,0,0,0,0,0,
1,0,0,0,0,0,0,0,

0,0,0,0,0,1,1,1,
0,0,0,0,0,1,1,1,
0,0,0,0,0,1,1,0,
0,0,0,0,0,1,1,0,
0,0,0,0,0,1,1,0,
0,0,0,0,0,1,1,0,
0,0,0,0,0,1,1,0,
0,0,0,0,0,0,0,0,

1,0,0,0,0,0,0,0,
1,0,0,0,0,0,0,0,
1,1,0,0,0,0,0,0,
1,1,1,0,0,0,0,0,
0,0,1,1,0,0,0,0,
0,0,1,1,1,0,0,0,
0,0,0,1,1,0,0,0,
0,0,0,0,0,0,0,0,



0,0,0,0,0,0,0,0,
0,0,0,0,0,0,0,0,
0,0,0,0,0,0,0,0,
0,0,0,0,0,0,0,0,
0,0,0,0,0,0,0,0,
0,0,0,0,0,0,0,0,
0,0,0,0,0,0,0,0,
0,0,0,0,0,0,0,0,

0,0,0,0,0,0,0,0,
0,0,0,0,0,0,0,0,
0,0,0,0,0,0,0,0,
0,0,0,0,0,0,0,0,
0,0,0,0,0,0,0,0,
0,0,0,0,0,0,0,0,
0,0,0,0,0,0,0,0,
0,0,0,0,0,0,0,0,

0,0,0,0,0,0,0,0,
0,0,0,0,0,0,0,0,
0,0,0,0,0,0,0,0,
0,0,0,0,0,0,0,0,
0,0,0,0,0,0,0,0,
0,0,0,0,0,0,0,0,
0,0,0,0,0,0,0,0,
0,0,0,0,0,0,0,0,

0,0,0,0,0,0,0,0,
0,0,0,0,0,0,0,0,
0,0,0,0,0,0,0,0,
0,0,0,0,0,0,0,0,
0,0,0,0,0,0,0,0,
0,0,0,0,0,0,0,0,
0,0,0,0,0,0,0,0,
0,0,0,0,0,0,0,0,
};
# 2 "grp23gbalib.h" 2


void fillPalette(void)
{
    int i;


    for (i = 0; i < 10; i++)
        ((unsigned short *) 0x5000200)[i] = palette[i];
}


void drawSprite(int numb, int N, int x, int y)
{

    *(unsigned short *)(0x7000000 + 8*N) = y | 0x2000;
    *(unsigned short *)(0x7000002 + 8*N) = x | 0x4000;
    *(unsigned short *)(0x7000004 + 8*N) = numb*8;
}


void clearScreen(void)
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
    int i;


    for (i = 0; i < 128*16*16; i++)
        ((unsigned short *) 0x6010000)[i] = (sprites[i*2+1] << 8) + sprites[i*2];


    for(i = 0; i < 128; i++)
        drawSprite(0, i, 240,160);
}


void menuScreen(void)
{

        drawSprite(15,0,50,60);
        drawSprite(14,1,65,60);
        drawSprite(13,2,75,60);
        drawSprite(5,3,100,60);
        drawSprite(14,4,115,60);
        drawSprite(7,5,130,60);
        drawSprite(16,6,145,60);
        drawSprite(11,7,160,60);
        drawSprite(5,8,175,60);


        drawSprite(1,9,115,100);


        drawSprite(5,10,85,140);
        drawSprite(6,11,100,140);
        drawSprite(7,12,115,140);
        drawSprite(8,13,130,140);
        drawSprite(6,14,145,140);

}

void winScreen(void)
{
        drawSprite(12,0,100,60);
        drawSprite(13,1,115,60);
        drawSprite(14,2,130,60);
}

void loseScreen(void)
{
        drawSprite(9,0,90,60);
        drawSprite(10,1,105,60);
        drawSprite(5,2,120,60);
        drawSprite(11,3,135,60);
}


void triggerbutton_checkupdate(void)
{
    u16 buttons = (0x3FF & (~*(volatile u16*)0x4000130));

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
         static int snake_direction = 1;
         static int enemy1_direction = 1;
    static int student1flag = 2;
         static int student2flag = 2;



         if (current_page==0)
                {
                        menuScreen();
                        if ((buttons & 0x008) == 0x008)
                        {
                                current_page = 1;
                                clearScreen();

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

         if ((buttons & 0x040) == 0x040)
                {
                snake_y -= y_unitstep;
        }
         if ((buttons & 0x080) == 0x080)
                {
                snake_y += y_unitstep;
        }
         if ((buttons & 0x010) == 0x010)
                {
                snake_x += x_unitstep;
                        snake_direction = 1;
        }
         if ((buttons & 0x020) == 0x020)
                {
                snake_x -= x_unitstep;
                        snake_direction = 0;
        }



         if (current_page ==1)
         {
                        drawSprite(student1flag,0,200,30);
                        drawSprite(student2flag,1,170,120);
                        drawSprite(snake_direction,2,snake_x,snake_y);
                        drawSprite(enemy1_direction+3,3,enemy1_x,enemy1_y);
                        drawSprite(4,4,enemy2_x,enemy2_y);
                        enemy1_x = enemy1_x + x_unitstep_e1;
                        enemy2_y = enemy2_y + y_unitstep_e2;

                        if (enemy1_x<3 || enemy1_x>237)
                                {
                                        x_unitstep_e1 = -x_unitstep_e1;
                                        enemy1_direction = 1-enemy1_direction;
                                }
                        if (enemy2_y<3 || enemy2_y>148)
                                {
                                        y_unitstep_e2 = -y_unitstep_e2;
                                }
                        if (snake_x <0)
                                {
                                        if ((buttons & 0x020) == 0x020)
                                                {
                                                        snake_x += x_unitstep;
                                                }
                                }
                        if (snake_x >230)
                                {
                                        if ((buttons & 0x010) == 0x010)
                                                {
                                                        snake_x -= x_unitstep;
                                                }
                                }
                        if (snake_y <0)
                                {
                                        if ((buttons & 0x040) == 0x040)
                                                {
                                                        snake_y += y_unitstep;
                                                }
                                }
                        if (snake_y >150)
                                {
                                        if ((buttons & 0x080) == 0x080)
                                                {
                                                        snake_y -= y_unitstep;
                                                }
                                }
                        if (snake_x>192 && snake_x<208)
                                {
                                        if (snake_y>22 && snake_y<38)
                                                {
                                                        student1flag = 17;
                                                }
                                }
                        if (snake_x>162 && snake_x<178)
                                {
                                        if (snake_y>112 && snake_y<128)
                                                {
                                                        student2flag = 17;
                                                }
                                }
                        if (snake_x > enemy1_x - 8 && snake_x < enemy1_x + 8)
                                {
                                        if (snake_y > enemy1_y - 8 && snake_y < enemy1_y + 8)
                                                {
                                                        current_page = 3;
                                                        clearScreen();
                                                }
                                }
                        if (snake_x > enemy2_x - 8 && snake_x < enemy2_x + 8)
                                {
                                        if (snake_y > enemy2_y - 8 && snake_y < enemy2_y + 8)
                                                {
                                                        current_page = 3;
                                                        clearScreen();
                                                }
                                }
                        if (student1flag==17 && student2flag==17)
                                {
                                        current_page = 2;
                                        clearScreen();
                                }
          }


        if (current_page == 2)
                {
                        winScreen();
                        if ((buttons & 0x001) == 0x001)
                                {
                                        current_page = 0;
                                        clearScreen();
                                }
                }


        if (current_page == 3)
                {
                        loseScreen();
                        if ((buttons & 0x001) == 0x001)
                                {
                                        current_page = 0;
                                        clearScreen();
                                }
                }

}
# 6 "main.c" 2

void Handler(void)
{
    *(u16*)0x4000208 = 0x00;

    if ((*(u16*)0x4000202&0x8) == 0x8)
    {
                triggerbutton_checkupdate();
    }

    *(u16*)0x4000202 = *(u16*)0x4000202;

    *(u16*)0x4000208 = 0x01;
}





int main(void)
{


    *(unsigned short *) 0x4000000 = 0x40 | 0x2 | 0x1000;


         fillPalette();
         fillSprites();


    (*(unsigned int*)0x3007FFC) = (int)&Handler;
    *(u16*)0x4000200 = 0x8;
         *(u16*)0x4000208 = 0x1;


    *(u16*)0x4000100 = 50000;
    *(u16*)0x4000102 |= 0x0001|0x0080|0x0040;



    while(1);

        return 0;
}