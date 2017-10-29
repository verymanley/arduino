

#include <avr/pgmspace.h> // allows use of PROGMEM to store patterns in flash

#define CUBESIZE 3
#define PLANESIZE CUBESIZE*CUBESIZE
#define PLANETIME 3333 // time each plane is displayed in us -> 100 Hz refresh
#define TIMECONST 20 // multiplies DisplayTime to get ms - why not =100?

// LED Pattern Table in PROGMEM - last column is display time in 100ms units
// TODO this could be a lot more compact but not with binary pattern representation
prog_uchar PROGMEM PatternTable[ ] = {

// flash each LED in sequence:

// blink on and off
B111, B111, B111, B111, B111, B111, B111, B111, B111, 3,
B000, B000, B000, B000, B000, B000, B000, B000, B000, 3,
B111, B111, B111, B111, B111, B111, B111, B111, B111, 2,
B000, B000, B000, B000, B000, B000, B000, B000, B000, 2,
B111, B111, B111, B111, B111, B111, B111, B111, B111, 2,
B000, B000, B000, B000, B000, B000, B000, B000, B000, 2,
B111, B111, B111, B111, B111, B111, B111, B111, B111, 1,
B000, B000, B000, B000, B000, B000, B000, B000, B000, 1,
B111, B111, B111, B111, B111, B111, B111, B111, B111, 1,
B000, B000, B000, B000, B000, B000, B000, B000, B000, 1,
B111, B111, B111, B111, B111, B111, B111, B111, B111, 1,
B000, B000, B000, B000, B000, B000, B000, B000, B000, 1,
B111, B111, B111, B111, B111, B111, B111, B111, B111, 1,
B000, B000, B000, B000, B000, B000, B000, B000, B000, 1,
B111, B111, B111, B111, B111, B111, B111, B111, B111, 1,
B000, B000, B000, B000, B000, B000, B000, B000, B000, 1,

// Left->Right column, then Top->Bottom row, then Upper->Lower plane
B100, B000, B000, B000, B000, B000, B000, B000, B000, 1,
B010, B000, B000, B000, B000, B000, B000, B000, B000, 1,
B001, B000, B000, B000, B000, B000, B000, B000, B000, 1,
B000, B100, B000, B000, B000, B000, B000, B000, B000, 1,
B000, B010, B000, B000, B000, B000, B000, B000, B000, 1,
B000, B001, B000, B000, B000, B000, B000, B000, B000, 1,
B000, B000, B100, B000, B000, B000, B000, B000, B000, 1,
B000, B000, B010, B000, B000, B000, B000, B000, B000, 1,
B000, B000, B001, B000, B000, B000, B000, B000, B000, 1,
B000, B000, B000, B100, B000, B000, B000, B000, B000, 1,
B000, B000, B000, B010, B000, B000, B000, B000, B000, 1,
B000, B000, B000, B001, B000, B000, B000, B000, B000, 1,
B000, B000, B000, B000, B100, B000, B000, B000, B000, 1,
B000, B000, B000, B000, B010, B000, B000, B000, B000, 1,
B000, B000, B000, B000, B001, B000, B000, B000, B000, 1,
B000, B000, B000, B000, B000, B100, B000, B000, B000, 1,
B000, B000, B000, B000, B000, B010, B000, B000, B000, 1,
B000, B000, B000, B000, B000, B001, B000, B000, B000, 1,
B000, B000, B000, B000, B000, B000, B100, B000, B000, 1,
B000, B000, B000, B000, B000, B000, B010, B000, B000, 1,
B000, B000, B000, B000, B000, B000, B001, B000, B000, 1,
B000, B000, B000, B000, B000, B000, B000, B100, B000, 1,
B000, B000, B000, B000, B000, B000, B000, B010, B000, 1,
B000, B000, B000, B000, B000, B000, B000, B001, B000, 1,
B000, B000, B000, B000, B000, B000, B000, B000, B100, 1,
B000, B000, B000, B000, B000, B000, B000, B000, B010, 1,

B000, B000, B000, B000, B000, B000, B000, B000, B001, 1,
B000, B000, B000, B000, B000, B000, B000, B000, B010, 1,
B000, B000, B000, B000, B000, B000, B000, B000, B100, 1,
B000, B000, B000, B000, B000, B000, B000, B001, B000, 1,
B000, B000, B000, B000, B000, B000, B000, B010, B000, 1,
B000, B000, B000, B000, B000, B000, B000, B100, B000, 1,
B000, B000, B000, B000, B000, B000, B001, B000, B000, 1,
B000, B000, B000, B000, B000, B000, B010, B000, B000, 1,
B000, B000, B000, B000, B000, B000, B100, B000, B000, 1,
B000, B000, B000, B000, B000, B001, B000, B000, B000, 1,
B000, B000, B000, B000, B000, B010, B000, B000, B000, 1,
B000, B000, B000, B000, B000, B100, B000, B000, B000, 1,
B000, B000, B000, B000, B001, B000, B000, B000, B000, 1,
B000, B000, B000, B000, B010, B000, B000, B000, B000, 1,
B000, B000, B000, B000, B100, B000, B000, B000, B000, 1,
B000, B000, B000, B001, B000, B000, B000, B000, B000, 1,
B000, B000, B000, B010, B000, B000, B000, B000, B000, 1,
B000, B000, B000, B100, B000, B000, B000, B000, B000, 1,
B000, B000, B001, B000, B000, B000, B000, B000, B000, 1,
B000, B000, B010, B000, B000, B000, B000, B000, B000, 1,
B000, B000, B100, B000, B000, B000, B000, B000, B000, 1,
B000, B001, B000, B000, B000, B000, B000, B000, B000, 1,
B000, B010, B000, B000, B000, B000, B000, B000, B000, 1,
B000, B100, B000, B000, B000, B000, B000, B000, B000, 1,
B001, B000, B000, B000, B000, B000, B000, B000, B000, 1,
B010, B000, B000, B000, B000, B000, B000, B000, B000, 1,

B100, B000, B000, B000, B000, B000, B000, B000, B000, 1,
B010, B000, B000, B000, B000, B000, B000, B000, B000, 1,
B001, B000, B000, B000, B000, B000, B000, B000, B000, 1,
B000, B100, B000, B000, B000, B000, B000, B000, B000, 1,
B000, B010, B000, B000, B000, B000, B000, B000, B000, 1,
B000, B001, B000, B000, B000, B000, B000, B000, B000, 1,
B000, B000, B100, B000, B000, B000, B000, B000, B000, 1,
B000, B000, B010, B000, B000, B000, B000, B000, B000, 1,
B000, B000, B001, B000, B000, B000, B000, B000, B000, 1,
B000, B000, B000, B100, B000, B000, B000, B000, B000, 1,
B000, B000, B000, B010, B000, B000, B000, B000, B000, 1,
B000, B000, B000, B001, B000, B000, B000, B000, B000, 1,
B000, B000, B000, B000, B100, B000, B000, B000, B000, 1,
B000, B000, B000, B000, B010, B000, B000, B000, B000, 1,
B000, B000, B000, B000, B001, B000, B000, B000, B000, 1,
B000, B000, B000, B000, B000, B100, B000, B000, B000, 1,
B000, B000, B000, B000, B000, B010, B000, B000, B000, 1,
B000, B000, B000, B000, B000, B001, B000, B000, B000, 1,
B000, B000, B000, B000, B000, B000, B100, B000, B000, 1,
B000, B000, B000, B000, B000, B000, B010, B000, B000, 1,
B000, B000, B000, B000, B000, B000, B001, B000, B000, 1,
B000, B000, B000, B000, B000, B000, B000, B100, B000, 1,
B000, B000, B000, B000, B000, B000, B000, B010, B000, 1,
B000, B000, B000, B000, B000, B000, B000, B001, B000, 1,
B000, B000, B000, B000, B000, B000, B000, B000, B100, 1,
B000, B000, B000, B000, B000, B000, B000, B000, B010, 1,

// Some little cube - big cube fun
B111, B111, B111, B111, B111, B111, B111, B111, B111, 4,
B000, B000, B000, B000, B011, B011, B000, B011, B011, 4,
B000, B000, B000, B000, B000, B000, B000, B000, B001, 4,
B000, B000, B000, B000, B011, B011, B000, B011, B011, 4,

B111, B111, B111, B111, B111, B111, B111, B111, B111, 3,
B000, B000, B000, B000, B011, B011, B000, B011, B011, 3,
B000, B000, B000, B000, B000, B000, B000, B000, B001, 3,
B000, B000, B000, B000, B011, B011, B000, B011, B011, 3,

B111, B111, B111, B111, B111, B111, B111, B111, B111, 2,
B000, B000, B000, B000, B011, B011, B000, B011, B011, 2,
B000, B000, B000, B000, B000, B000, B000, B000, B001, 2,
B000, B000, B000, B000, B011, B011, B000, B011, B011, 2,

B111, B111, B111, B111, B111, B111, B111, B111, B111, 1,
B000, B000, B000, B000, B011, B011, B000, B011, B011, 1,
B000, B000, B000, B000, B000, B000, B000, B000, B001, 1,
B000, B000, B000, B000, B011, B011, B000, B011, B011, 1,

B111, B111, B111, B111, B111, B111, B111, B111, B111, 1,
B000, B000, B000, B000, B011, B011, B000, B011, B011, 1,
B000, B000, B000, B000, B000, B000, B000, B000, B001, 1,
B000, B000, B000, B000, B011, B011, B000, B011, B011, 1,

B111, B111, B111, B111, B111, B111, B111, B111, B111, 1,
B000, B000, B000, B000, B011, B011, B000, B011, B011, 1,
B000, B000, B000, B000, B000, B000, B000, B000, B001, 1,
B000, B000, B000, B000, B011, B011, B000, B011, B011, 1,

B111, B111, B111, B111, B111, B111, B111, B111, B111, 1,
B000, B000, B000, B000, B011, B011, B000, B011, B011, 1,
B000, B000, B000, B000, B000, B000, B000, B000, B001, 1,
B000, B000, B000, B000, B011, B011, B000, B011, B011, 1,

B111, B111, B111, B111, B111, B111, B111, B111, B111, 2,
B000, B011, B011, B000, B011, B011, B000, B000, B000, 2,
B000, B000, B001, B000, B000, B000, B000, B000, B000, 2,
B000, B011, B011, B000, B011, B011, B000, B000, B000, 2,
B111, B111, B111, B111, B111, B111, B111, B111, B111, 2,
B000, B000, B000, B110, B110, B000, B110, B110, B000, 2,
B000, B000, B000, B000, B000, B000, B100, B000, B000, 2,
B000, B000, B000, B110, B110, B000, B110, B110, B000, 2,
B111, B111, B111, B111, B111, B111, B111, B111, B111, 2,
B000, B011, B011, B000, B011, B011, B000, B000, B000, 2,
B000, B000, B001, B000, B000, B000, B000, B000, B000, 2,
B000, B011, B011, B000, B011, B011, B000, B000, B000, 2,
B111, B111, B111, B111, B111, B111, B111, B111, B111, 2,
B000, B000, B000, B110, B110, B000, B110, B110, B000, 2,
B000, B000, B000, B000, B000, B000, B100, B000, B000, 2,
B000, B000, B000, B110, B110, B000, B110, B110, B000, 2,

B111, B111, B111, B111, B111, B111, B111, B111, B111, 1,
B000, B011, B011, B000, B011, B011, B000, B000, B000, 1,
B000, B000, B001, B000, B000, B000, B000, B000, B000, 1,
B000, B011, B011, B000, B011, B011, B000, B000, B000, 1,
B111, B111, B111, B111, B111, B111, B111, B111, B111, 1,
B000, B000, B000, B110, B110, B000, B110, B110, B000, 1,
B000, B000, B000, B000, B000, B000, B100, B000, B000, 1,
B000, B000, B000, B110, B110, B000, B110, B110, B000, 1,
B111, B111, B111, B111, B111, B111, B111, B111, B111, 1,
B000, B011, B011, B000, B011, B011, B000, B000, B000, 1,
B000, B000, B001, B000, B000, B000, B000, B000, B000, 1,
B000, B011, B011, B000, B011, B011, B000, B000, B000, 1,
B111, B111, B111, B111, B111, B111, B111, B111, B111, 1,
B000, B000, B000, B110, B110, B000, B110, B110, B000, 1,
B000, B000, B000, B000, B000, B000, B100, B000, B000, 1,
B000, B000, B000, B110, B110, B000, B110, B110, B000, 1,

B111, B111, B111, B111, B111, B111, B111, B111, B111, 1,
B000, B011, B011, B000, B011, B011, B000, B000, B000, 1,
B000, B000, B001, B000, B000, B000, B000, B000, B000, 1,
B000, B011, B011, B000, B011, B011, B000, B000, B000, 1,
B111, B111, B111, B111, B111, B111, B111, B111, B111, 1,
B000, B000, B000, B110, B110, B000, B110, B110, B000, 1,
B000, B000, B000, B000, B000, B000, B100, B000, B000, 1,
B000, B000, B000, B110, B110, B000, B110, B110, B000, 1,
B111, B111, B111, B111, B111, B111, B111, B111, B111, 1,
B000, B011, B011, B000, B011, B011, B000, B000, B000, 1,
B000, B000, B001, B000, B000, B000, B000, B000, B000, 1,
B000, B011, B011, B000, B011, B011, B000, B000, B000, 1,
B111, B111, B111, B111, B111, B111, B111, B111, B111, 1,
B000, B000, B000, B110, B110, B000, B110, B110, B000, 1,
B000, B000, B000, B000, B000, B000, B100, B000, B000, 1,
B000, B000, B000, B110, B110, B000, B110, B110, B000, 1,

// Diagonal wipe, starting in the center
B111, B111, B111, B111, B111, B111, B111, B111, B111, 5,
B111, B111, B111, B111, B111, B111, B111, B101, B111, 1,
B111, B111, B111, B111, B101, B111, B111, B101, B111, 1,
B111, B111, B111, B111, B101, B111, B111, B100, B111, 1,
B111, B101, B111, B111, B100, B111, B111, B100, B110, 1,
B111, B101, B111, B111, B100, B111, B111, B100, B110, 1,
B111, B011, B111, B111, B100, B110, B111, B100, B100, 1,
B111, B100, B110, B111, B100, B100, B111, B100, B000, 1,
B111, B100, B100, B111, B100, B000, B111, B000, B000, 1,
B111, B100, B000, B111, B000, B000, B011, B000, B000, 1,
B111, B000, B000, B011, B000, B000, B001, B001, B000, 1,

/* 
** 2-LED wide diagonal stripe that orbits the cube 
** with center flashies then after break changes direction
*/
B011, B000, B000, B001, B001, B000, B000, B011, B001, 1,
B001, B001, B000, B000, B001, B001, B000, B000, B011, 1,
B000, B001, B001, B000, B000, B011, B000, B010, B110, 1,
B000, B000, B011, B000, B000, B110, B000, B100, B100, 1,
B000, B000, B110, B000, B100, B100, B100, B110, B000, 1,
B000, B100, B100, B100, B100, B000, B110, B000, B000, 1,
B100, B100, B000, B110, B000, B000, B011, B010, B000, 1,
B110, B000, B000, B011, B000, B000, B001, B001, B000, 1,
B011, B000, B000, B001, B011, B000, B000, B001, B001, 1,
B001, B001, B000, B000, B001, B001, B000, B000, B011, 1,
B000, B001, B001, B000, B010, B011, B000, B000, B110, 1,
B000, B000, B011, B000, B000, B110, B000, B100, B100, 1,
B000, B000, B110, B000, B110, B100, B100, B100, B000, 1,
B000, B100, B100, B100, B100, B000, B110, B000, B000, 1,
B100, B100, B000, B110, B010, B000, B011, B000, B000, 1,
B110, B000, B000, B011, B000, B000, B001, B001, B000, 1,
B011, B010, B000, B001, B001, B000, B000, B001, B001, 1,
B001, B001, B000, B000, B001, B001, B000, B000, B011, 1,
B000, B011, B001, B000, B000, B011, B000, B000, B110, 1,
B000, B000, B011, B000, B000, B110, B000, B100, B100, 1,
B000, B010, B110, B000, B100, B100, B100, B100, B000, 1,
B000, B100, B100, B100, B100, B000, B110, B000, B000, 1,
B100, B110, B000, B110, B000, B000, B011, B000, B000, 1,

B110, B000, B000, B011, B000, B000, B001, B001, B000, 1,
B100, B110, B000, B110, B000, B000, B011, B000, B000, 1,
B000, B100, B100, B100, B100, B000, B110, B000, B000, 1,
B000, B010, B110, B000, B100, B100, B100, B100, B000, 1,
B000, B000, B011, B000, B000, B110, B000, B100, B100, 1,
B000, B011, B001, B000, B000, B011, B000, B000, B110, 1,
B001, B001, B000, B000, B001, B001, B000, B000, B011, 1,
B011, B010, B000, B001, B001, B000, B000, B001, B001, 1,
B110, B000, B000, B011, B000, B000, B001, B001, B000, 1,
B100, B100, B000, B110, B010, B000, B011, B000, B000, 1,
B000, B100, B100, B100, B100, B000, B110, B000, B000, 1,
B000, B000, B110, B000, B110, B100, B100, B100, B000, 1,
B000, B000, B011, B000, B000, B110, B000, B100, B100, 1,
B000, B001, B001, B000, B010, B011, B000, B000, B110, 1,
B001, B001, B000, B000, B001, B001, B000, B000, B011, 1,
B011, B000, B000, B001, B011, B000, B000, B001, B001, 1,
B110, B000, B000, B011, B000, B000, B001, B001, B000, 1,
B100, B100, B000, B110, B000, B000, B011, B010, B000, 1,
B000, B100, B100, B100, B100, B000, B110, B000, B000, 1,
B000, B000, B110, B000, B100, B100, B100, B110, B000, 1,
B000, B000, B011, B000, B000, B110, B000, B100, B100, 1,
B000, B001, B001, B000, B000, B011, B000, B010, B110, 1,
B001, B001, B000, B000, B001, B001, B000, B000, B011, 1,

B011, B000, B000, B001, B001, B000, B000, B011, B001, 1,
B001, B001, B000, B000, B001, B001, B000, B000, B011, 1,
B000, B001, B001, B000, B000, B011, B000, B010, B110, 1,
B000, B000, B011, B000, B000, B110, B000, B100, B100, 1,
B000, B000, B110, B000, B100, B100, B100, B110, B000, 1,
B000, B100, B100, B100, B100, B000, B110, B000, B000, 1,
B100, B100, B000, B110, B000, B000, B011, B010, B000, 1,
B110, B000, B000, B011, B000, B000, B001, B001, B000, 1,
B011, B000, B000, B001, B011, B000, B000, B001, B001, 1,
B001, B001, B000, B000, B001, B001, B000, B000, B011, 1,
B000, B001, B001, B000, B010, B011, B000, B000, B110, 1,
B000, B000, B011, B000, B000, B110, B000, B100, B100, 1,
B000, B000, B110, B000, B110, B100, B100, B100, B000, 1,
B000, B100, B100, B100, B100, B000, B110, B000, B000, 1,
B100, B100, B000, B110, B010, B000, B011, B000, B000, 1,
B110, B000, B000, B011, B000, B000, B001, B001, B000, 1,
B011, B010, B000, B001, B001, B000, B000, B001, B001, 1,
B001, B001, B000, B000, B001, B001, B000, B000, B011, 1,
B000, B011, B001, B000, B000, B011, B000, B000, B110, 1,
B000, B000, B011, B000, B000, B110, B000, B100, B100, 1,
B000, B010, B110, B000, B100, B100, B100, B100, B000, 1,
B000, B100, B100, B100, B100, B000, B110, B000, B000, 1,
B100, B110, B000, B110, B000, B000, B011, B000, B000, 1,

B110, B000, B000, B011, B000, B000, B001, B001, B000, 1,
B100, B110, B000, B110, B000, B000, B011, B000, B000, 1,
B000, B100, B100, B100, B100, B000, B110, B000, B000, 1,
B000, B010, B110, B000, B100, B100, B100, B100, B000, 1,
B000, B000, B011, B000, B000, B110, B000, B100, B100, 1,
B000, B011, B001, B000, B000, B011, B000, B000, B110, 1,
B001, B001, B000, B000, B001, B001, B000, B000, B011, 1,
B011, B010, B000, B001, B001, B000, B000, B001, B001, 1,
B110, B000, B000, B011, B000, B000, B001, B001, B000, 1,
B100, B100, B000, B110, B010, B000, B011, B000, B000, 1,
B000, B100, B100, B100, B100, B000, B110, B000, B000, 1,
B000, B000, B110, B000, B110, B100, B100, B100, B000, 1,
B000, B000, B011, B000, B000, B110, B000, B100, B100, 1,
B000, B001, B001, B000, B010, B011, B000, B000, B110, 1,
B001, B001, B000, B000, B001, B001, B000, B000, B011, 1,
B011, B000, B000, B001, B011, B000, B000, B001, B001, 1,
B110, B000, B000, B011, B000, B000, B001, B001, B000, 1,
B100, B100, B000, B110, B000, B000, B011, B010, B000, 1,
B000, B100, B100, B100, B100, B000, B110, B000, B000, 1,
B000, B000, B110, B000, B100, B100, B100, B110, B000, 1,
B000, B000, B011, B000, B000, B110, B000, B100, B100, 1,
B000, B001, B001, B000, B000, B011, B000, B010, B110, 1,
B001, B001, B000, B000, B001, B001, B000, B000, B011, 1,

// siren
B100, B100, B100, B100, B100, B100, B100, B100, B100, 2,
B111, B000, B000, B111, B000, B000, B111, B000, B000, 2,
B001, B001, B001, B001, B001, B001, B001, B001, B001, 2,
B000, B000, B111, B000, B000, B111, B000, B000, B111, 2,

B100, B100, B100, B100, B100, B100, B100, B100, B100, 1,
B111, B000, B000, B111, B000, B000, B111, B000, B000, 1,
B001, B001, B001, B001, B001, B001, B001, B001, B001, 1,
B000, B000, B111, B000, B000, B111, B000, B000, B111, 1,

B100, B100, B100, B100, B100, B100, B100, B100, B100, 1,
B111, B000, B000, B111, B000, B000, B111, B000, B000, 1,
B001, B001, B001, B001, B001, B001, B001, B001, B001, 1,
B000, B000, B111, B000, B000, B111, B000, B000, B111, 1,

B000, B000, B111, B000, B000, B111, B000, B000, B111, 1,
B001, B001, B001, B001, B001, B001, B001, B001, B001, 1,
B111, B000, B000, B111, B000, B000, B111, B000, B000, 1,
B100, B100, B100, B100, B100, B100, B100, B100, B100, 1,

B000, B000, B111, B000, B000, B111, B000, B000, B111, 1,
B001, B001, B001, B001, B001, B001, B001, B001, B001, 1,
B111, B000, B000, B111, B000, B000, B111, B000, B000, 1,
B100, B100, B100, B100, B100, B100, B100, B100, B100, 1,

B000, B000, B111, B000, B000, B111, B000, B000, B111, 1,
B001, B001, B001, B001, B001, B001, B001, B001, B001, 1,
B111, B000, B000, B111, B000, B000, B111, B000, B000, 1,
B100, B100, B100, B100, B100, B100, B100, B100, B100, 1,

B111, B111, B111, B000, B000, B000, B000, B000, B000, 2,
B100, B100, B100, B100, B100, B100, B100, B100, B100, 2,
B000, B000, B000, B000, B000, B000, B111, B111, B111, 2,
B001, B001, B001, B001, B001, B001, B001, B001, B001, 2,

B111, B111, B111, B000, B000, B000, B000, B000, B000, 1,
B100, B100, B100, B100, B100, B100, B100, B100, B100, 1,
B000, B000, B000, B000, B000, B000, B111, B111, B111, 1,
B001, B001, B001, B001, B001, B001, B001, B001, B001, 1,

B111, B111, B111, B000, B000, B000, B000, B000, B000, 1,
B100, B100, B100, B100, B100, B100, B100, B100, B100, 1,
B000, B000, B000, B000, B000, B000, B111, B111, B111, 1,
B001, B001, B001, B001, B001, B001, B001, B001, B001, 1,

B001, B001, B001, B001, B001, B001, B001, B001, B001, 1,
B000, B000, B000, B000, B000, B000, B111, B111, B111, 1,
B100, B100, B100, B100, B100, B100, B100, B100, B100, 1,
B111, B111, B111, B000, B000, B000, B000, B000, B000, 1,

B001, B001, B001, B001, B001, B001, B001, B001, B001, 1,
B000, B000, B000, B000, B000, B000, B111, B111, B111, 1,
B100, B100, B100, B100, B100, B100, B100, B100, B100, 1,
B111, B111, B111, B000, B000, B000, B000, B000, B000, 1,

B001, B001, B001, B001, B001, B001, B001, B001, B001, 1,
B000, B000, B000, B000, B000, B000, B111, B111, B111, 1,
B100, B100, B100, B100, B100, B100, B100, B100, B100, 1,
B111, B111, B111, B000, B000, B000, B000, B000, B000, 1,

B111, B111, B111, B000, B000, B000, B000, B000, B000, 2,
B111, B000, B000, B111, B000, B000, B111, B000, B000, 2,
B000, B000, B000, B000, B000, B000, B111, B111, B111, 2,
B000, B000, B111, B000, B000, B111, B000, B000, B111, 2,

B111, B111, B111, B000, B000, B000, B000, B000, B000, 1,
B111, B000, B000, B111, B000, B000, B111, B000, B000, 1,
B000, B000, B000, B000, B000, B000, B111, B111, B111, 1,
B000, B000, B111, B000, B000, B111, B000, B000, B111, 1,

B111, B111, B111, B000, B000, B000, B000, B000, B000, 1,
B111, B000, B000, B111, B000, B000, B111, B000, B000, 1,
B000, B000, B000, B000, B000, B000, B111, B111, B111, 1,
B000, B000, B111, B000, B000, B111, B000, B000, B111, 1,

B000, B000, B111, B000, B000, B111, B000, B000, B111, 1,
B000, B000, B000, B000, B000, B000, B111, B111, B111, 1,
B111, B000, B000, B111, B000, B000, B111, B000, B000, 1,
B111, B111, B111, B000, B000, B000, B000, B000, B000, 1,

B000, B000, B111, B000, B000, B111, B000, B000, B111, 1,
B000, B000, B000, B000, B000, B000, B111, B111, B111, 1,
B111, B000, B000, B111, B000, B000, B111, B000, B000, 1,
B111, B111, B111, B000, B000, B000, B000, B000, B000, 1,

B000, B000, B111, B000, B000, B111, B000, B000, B111, 1,
B000, B000, B000, B000, B000, B000, B111, B111, B111, 1,
B111, B000, B000, B111, B000, B000, B111, B000, B000, 1,
B111, B111, B111, B000, B000, B000, B000, B000, B000, 1,

// slide
B111, B100, B100, B111, B100, B100, B111, B100, B100, 2,
B010, B111, B010, B010, B111, B010, B010, B111, B010, 2,
B001, B001, B111, B001, B001, B111, B001, B001, B111, 2,

B001, B001, B111, B001, B001, B111, B001, B001, B111, 2,
B010, B111, B010, B010, B111, B010, B010, B111, B010, 2,
B111, B100, B100, B111, B100, B100, B111, B100, B100, 2,

B111, B100, B100, B111, B100, B100, B111, B100, B100, 1,
B010, B111, B010, B010, B111, B010, B010, B111, B010, 1,
B001, B001, B111, B001, B001, B111, B001, B001, B111, 1,

B001, B001, B111, B001, B001, B111, B001, B001, B111, 1,
B010, B111, B010, B010, B111, B010, B010, B111, B010, 1,
B111, B100, B100, B111, B100, B100, B111, B100, B100, 1,

B010, B111, B010, B010, B111, B010, B010, B111, B010, 1,
B001, B001, B111, B001, B001, B111, B001, B001, B111, 1,

B010, B111, B010, B010, B111, B010, B010, B111, B010, 1,
B111, B100, B100, B111, B100, B100, B111, B100, B100, 1,

B010, B111, B010, B010, B111, B010, B010, B111, B010, 1,
B001, B001, B111, B001, B001, B111, B001, B001, B111, 1,

B010, B111, B010, B010, B111, B010, B010, B111, B010, 1,
B111, B100, B100, B111, B100, B100, B111, B100, B100, 1,

// explosion
B000, B000, B000, B000, B000, B000, B000, B000, B000, 2,
B000, B000, B000, B000, B010, B000, B000, B000, B000, 2,
B000, B010, B000, B010, B111, B010, B000, B010, B000, 2,
B111, B111, B111, B111, B111, B111, B111, B111, B111, 2,
B000, B010, B000, B010, B111, B010, B000, B010, B000, 2,
B000, B000, B000, B000, B010, B000, B000, B000, B000, 2,
B000, B000, B000, B000, B000, B000, B000, B000, B000, 2,

B000, B000, B000, B000, B000, B000, B000, B000, B000, 1,
B000, B000, B000, B000, B010, B000, B000, B000, B000, 1,
B000, B010, B000, B010, B111, B010, B000, B010, B000, 1,
B111, B111, B111, B111, B111, B111, B111, B111, B111, 1,
B000, B010, B000, B010, B111, B010, B000, B010, B000, 1,
B000, B000, B000, B000, B010, B000, B000, B000, B000, 1,
B000, B000, B000, B000, B000, B000, B000, B000, B000, 1,

B000, B000, B000, B000, B000, B000, B000, B000, B000, 1,
B000, B000, B000, B000, B010, B000, B000, B000, B000, 1,
B000, B010, B000, B010, B111, B010, B000, B010, B000, 1,
B111, B111, B111, B111, B111, B111, B111, B111, B111, 1,
B000, B010, B000, B010, B111, B010, B000, B010, B000, 1,
B000, B000, B000, B000, B010, B000, B000, B000, B000, 1,
B000, B000, B000, B000, B000, B000, B000, B000, B000, 1,

B000, B000, B000, B000, B000, B000, B000, B000, B000, 2,
B000, B000, B000, B000, B010, B000, B000, B000, B000, 2,
B000, B010, B000, B010, B111, B010, B000, B010, B000, 2,
B111, B111, B111, B111, B111, B111, B111, B111, B111, 2,
B000, B010, B000, B010, B111, B010, B000, B010, B000, 2,
B000, B000, B000, B000, B010, B000, B000, B000, B000, 2,
B000, B000, B000, B000, B000, B000, B000, B000, B000, 2,

B000, B000, B000, B000, B000, B000, B000, B000, B000, 1,
B000, B000, B000, B000, B010, B000, B000, B000, B000, 1,
B000, B010, B000, B010, B111, B010, B000, B010, B000, 1,
B111, B111, B111, B111, B111, B111, B111, B111, B111, 1,
B000, B010, B000, B010, B111, B010, B000, B010, B000, 1,
B000, B000, B000, B000, B010, B000, B000, B000, B000, 1,
B000, B000, B000, B000, B000, B000, B000, B000, B000, 1,

B000, B000, B000, B000, B000, B000, B000, B000, B000, 1,
B000, B000, B000, B000, B010, B000, B000, B000, B000, 1,
B000, B010, B000, B010, B111, B010, B000, B010, B000, 1,
B111, B111, B111, B111, B111, B111, B111, B111, B111, 1,
B000, B010, B000, B010, B111, B010, B000, B010, B000, 1,
B000, B000, B000, B000, B010, B000, B000, B000, B000, 1,
B000, B000, B000, B000, B000, B000, B000, B000, B000, 1,

B000, B000, B000, B000, B000, B000, B000, B000, B000, 2,
B000, B000, B000, B000, B010, B000, B000, B000, B000, 2,
B000, B010, B000, B010, B111, B010, B000, B010, B000, 2,
B111, B111, B111, B111, B111, B111, B111, B111, B111, 2,
B000, B010, B000, B010, B111, B010, B000, B010, B000, 2,
B000, B000, B000, B000, B010, B000, B000, B000, B000, 2,
B000, B000, B000, B000, B000, B000, B000, B000, B000, 2,

B000, B000, B000, B000, B000, B000, B000, B000, B000, 1,
B000, B000, B000, B000, B010, B000, B000, B000, B000, 1,
B000, B010, B000, B010, B111, B010, B000, B010, B000, 1,
B111, B111, B111, B111, B111, B111, B111, B111, B111, 1,
B000, B010, B000, B010, B111, B010, B000, B010, B000, 1,
B000, B000, B000, B000, B010, B000, B000, B000, B000, 1,
B000, B000, B000, B000, B000, B000, B000, B000, B000, 1,

B000, B000, B000, B000, B000, B000, B000, B000, B000, 1,
B000, B000, B000, B000, B010, B000, B000, B000, B000, 1,
B000, B010, B000, B010, B111, B010, B000, B010, B000, 1,
B111, B111, B111, B111, B111, B111, B111, B111, B111, 1,

// rain
B111, B111, B111, B000, B000, B000, B000, B000, B000, 1,
B011, B111, B111, B100, B000, B000, B000, B000, B000, 1,
B011, B111, B111, B000, B000, B000, B100, B000, B000, 1,

B001, B111, B111, B010, B000, B000, B100, B000, B000, 1,
B001, B111, B111, B000, B000, B000, B110, B000, B000, 1,

B000, B111, B111, B001, B000, B000, B110, B000, B000, 1,
B000, B111, B111, B000, B000, B000, B111, B000, B000, 1,

B000, B011, B111, B000, B100, B000, B111, B000, B000, 1,
B000, B011, B111, B000, B000, B000, B111, B100, B000, 1,

B000, B001, B111, B000, B010, B000, B111, B100, B000, 1,
B000, B001, B111, B000, B000, B000, B111, B110, B000, 1,

B000, B000, B111, B000, B001, B000, B111, B110, B000, 1,
B000, B000, B111, B000, B000, B000, B111, B111, B000, 1,

B000, B000, B011, B000, B000, B100, B111, B111, B000, 1,
B000, B000, B011, B000, B000, B000, B111, B111, B100, 1,

B000, B000, B001, B000, B000, B010, B111, B111, B100, 1,
B000, B000, B001, B000, B000, B000, B111, B111, B110, 1,

B000, B000, B000, B000, B000, B001, B111, B111, B110, 1,
B000, B000, B000, B000, B000, B000, B111, B111, B111, 1,


B000, B000, B000, B000, B000, B001, B111, B111, B110, 1,
B000, B000, B001, B000, B000, B000, B111, B111, B110, 1,

B000, B000, B001, B000, B000, B010, B111, B111, B100, 1,
B000, B000, B011, B000, B000, B000, B111, B111, B100, 1,

B000, B000, B011, B000, B000, B100, B111, B111, B000, 1,
B000, B000, B111, B000, B000, B000, B111, B111, B000, 1,

B000, B000, B111, B000, B001, B000, B111, B110, B000, 1,
B000, B001, B111, B000, B000, B000, B111, B110, B000, 1,

B000, B001, B111, B000, B010, B000, B111, B100, B000, 1,
B000, B011, B111, B000, B000, B000, B111, B100, B000, 1,

B000, B011, B111, B000, B100, B000, B111, B000, B000, 1,
B000, B111, B111, B000, B000, B000, B111, B000, B000, 1,

B000, B111, B111, B001, B000, B000, B110, B000, B000, 1,
B001, B111, B111, B000, B000, B000, B110, B000, B000, 1,

B001, B111, B111, B010, B000, B000, B100, B000, B000, 1,
B011, B111, B111, B000, B000, B000, B100, B000, B000, 1,

B011, B111, B111, B100, B000, B000, B000, B000, B000, 1,
B111, B111, B111, B000, B000, B000, B000, B000, B000, 1,


B111, B111, B111, B000, B000, B000, B000, B000, B000, 1,
B011, B111, B111, B100, B000, B000, B000, B000, B000, 1,
B011, B111, B111, B000, B000, B000, B100, B000, B000, 1,

B001, B111, B111, B010, B000, B000, B100, B000, B000, 1,
B001, B111, B111, B000, B000, B000, B110, B000, B000, 1,

B000, B111, B111, B001, B000, B000, B110, B000, B000, 1,
B000, B111, B111, B000, B000, B000, B111, B000, B000, 1,

B000, B011, B111, B000, B100, B000, B111, B000, B000, 1,
B000, B011, B111, B000, B000, B000, B111, B100, B000, 1,

B000, B001, B111, B000, B010, B000, B111, B100, B000, 1,
B000, B001, B111, B000, B000, B000, B111, B110, B000, 1,

B000, B000, B111, B000, B001, B000, B111, B110, B000, 1,
B000, B000, B111, B000, B000, B000, B111, B111, B000, 1,

B000, B000, B011, B000, B000, B100, B111, B111, B000, 1,
B000, B000, B011, B000, B000, B000, B111, B111, B100, 1,

B000, B000, B001, B000, B000, B010, B111, B111, B100, 1,
B000, B000, B001, B000, B000, B000, B111, B111, B110, 1,

B000, B000, B000, B000, B000, B001, B111, B111, B110, 1,
B000, B000, B000, B000, B000, B000, B111, B111, B111, 1,


B000, B000, B000, B000, B000, B001, B111, B111, B110, 1,
B000, B000, B001, B000, B000, B000, B111, B111, B110, 1,

B000, B000, B001, B000, B000, B010, B111, B111, B100, 1,
B000, B000, B011, B000, B000, B000, B111, B111, B100, 1,

B000, B000, B011, B000, B000, B100, B111, B111, B000, 1,
B000, B000, B111, B000, B000, B000, B111, B111, B000, 1,

B000, B000, B111, B000, B001, B000, B111, B110, B000, 1,
B000, B001, B111, B000, B000, B000, B111, B110, B000, 1,

B000, B001, B111, B000, B010, B000, B111, B100, B000, 1,
B000, B011, B111, B000, B000, B000, B111, B100, B000, 1,

B000, B011, B111, B000, B100, B000, B111, B000, B000, 1,
B000, B111, B111, B000, B000, B000, B111, B000, B000, 1,

B000, B111, B111, B001, B000, B000, B110, B000, B000, 1,
B001, B111, B111, B000, B000, B000, B110, B000, B000, 1,

B001, B111, B111, B010, B000, B000, B100, B000, B000, 1,
B011, B111, B111, B000, B000, B000, B100, B000, B000, 1,

B011, B111, B111, B100, B000, B000, B000, B000, B000, 1,
B111, B111, B111, B000, B000, B000, B000, B000, B000, 1,

// down-up
B000, B000, B000, B111, B111, B111, B000, B000, B000, 2,
B000, B000, B000, B000, B000, B000, B111, B111, B111, 2,
B000, B000, B000, B111, B111, B111, B000, B000, B000, 2,
B111, B111, B111, B000, B000, B000, B000, B000, B000, 2,

B000, B000, B000, B111, B111, B111, B000, B000, B000, 1,
B000, B000, B000, B000, B000, B000, B111, B111, B111, 1,
B000, B000, B000, B111, B111, B111, B000, B000, B000, 1,
B111, B111, B111, B000, B000, B000, B000, B000, B000, 1,

// snake
B111, B111, B111, B000, B000, B000, B000, B000, B000, 2,
B011, B111, B111, B100, B000, B000, B000, B000, B000, 1,
B011, B111, B111, B000, B000, B000, B100, B000, B000, 1,

B011, B111, B111, B000, B000, B000, B000, B000, B000, 2,
B001, B111, B111, B010, B000, B000, B000, B000, B000, 1,
B001, B111, B111, B000, B000, B000, B010, B000, B000, 1,

B001, B111, B111, B000, B000, B000, B000, B000, B000, 2,
B000, B111, B111, B001, B000, B000, B000, B000, B000, 1,
B000, B111, B111, B000, B000, B000, B001, B000, B000, 1,

B000, B111, B111, B000, B000, B000, B000, B000, B000, 2,
B000, B011, B111, B000, B100, B000, B000, B000, B000, 1,
B000, B011, B111, B000, B000, B000, B000, B100, B000, 1,

B000, B011, B111, B000, B000, B000, B000, B000, B000, 2,
B000, B001, B111, B000, B010, B000, B000, B000, B000, 1,
B000, B001, B111, B000, B000, B000, B000, B010, B000, 1,

B000, B001, B111, B000, B000, B000, B000, B000, B000, 2,
B000, B000, B111, B000, B001, B000, B000, B000, B000, 1,
B000, B000, B111, B000, B000, B000, B000, B001, B000, 1,


B000, B000, B111, B000, B000, B000, B000, B000, B000, 2,

B000, B100, B110, B000, B000, B000, B000, B000, B000, 2,
B100, B100, B100, B000, B000, B000, B000, B000, B000, 2,
B100, B100, B000, B100, B000, B000, B000, B000, B000, 2,
B100, B000, B000, B100, B000, B000, B100, B000, B000, 2,
B000, B000, B000, B100, B000, B000, B110, B000, B000, 2,
B000, B000, B000, B000, B000, B000, B111, B000, B000, 2,
B000, B000, B000, B001, B000, B000, B011, B000, B000, 2,
B001, B000, B000, B001, B000, B000, B001, B000, B000, 2,
B001, B001, B000, B001, B000, B000, B000, B000, B000, 2,
B001, B001, B001, B000, B000, B000, B000, B000, B000, 2,
B000, B001, B001, B000, B000, B001, B000, B000, B000, 2,
B000, B000, B001, B000, B000, B001, B000, B000, B001, 2,
B000, B000, B000, B000, B000, B001, B000, B000, B011, 2,
B000, B000, B000, B000, B000, B000, B000, B000, B111, 2,
B000, B000, B000, B000, B000, B100, B000, B000, B110, 2,
B000, B000, B100, B000, B000, B100, B000, B000, B100, 2,
B000, B000, B110, B000, B000, B100, B000, B000, B000, 2,
B000, B000, B111, B000, B000, B000, B000, B000, B000, 2,
B000, B000, B011, B000, B000, B000, B000, B000, B000, 2,
B000, B000, B001, B000, B000, B000, B000, B000, B000, 2,



// this is a dummy element for end of table (duration=0)
B000, B000, B000, B000, B000, B000, B000, B000, B000, 0
};

/*
** Defining pins in array makes it easier to rearrange how cube is wired
** Adjust numbers here until LEDs flash in order - L to R, T to B
** Note that analog inputs 0-5 are also digital outputs 14-19!
** Pin DigitalOut0 (serial RX) and AnalogIn5 are left open for future apps
*/

int LEDPin[ ] = {0, 1, 2, 3, 4, 5, 8, 7, 6};
int PlanePin[ ] = {16, 15, 14};

// initialization
void setup()
{
int pin; // loop counter
// set up LED pins as output (active HIGH)
for (pin=0; pin<PLANESIZE; pin++) {
pinMode( LEDPin[pin ], OUTPUT );
}
// set up plane pins as outputs (active LOW)
for (pin=0; pin<CUBESIZE; pin++) {
pinMode( PlanePin[pin ], OUTPUT );
}
}

// display pattern in table until DisplayTime is zero (then repeat)
void loop()
{
// declare variables
byte PatternBuf[ PLANESIZE]; // saves current pattern from PatternTable
int PatternIdx;
byte DisplayTime; // time*100ms to display pattern
unsigned long EndTime;
int plane; // loop counter for cube refresh
int patbufidx; // indexes which byte from pattern buffer
int ledrow; // counts LEDs in refresh loop
int ledcol; // counts LEDs in refresh loop
int ledpin; // counts LEDs in refresh loop

// Initialize PatternIdx to beginning of pattern table
PatternIdx = 0;
// loop over entries in pattern table - while DisplayTime>0
do {
// read pattern from PROGMEM and save in array
memcpy_P( PatternBuf, PatternTable+PatternIdx, PLANESIZE );
PatternIdx += PLANESIZE;
// read DisplayTime from PROGMEM and increment index
DisplayTime = pgm_read_byte_near( PatternTable + PatternIdx++ );
// compute EndTime from current time (ms) and DisplayTime
EndTime = millis() + ((unsigned long) DisplayTime) * TIMECONST;

// loop while DisplayTime>0 and current time < EndTime
while ( millis() < EndTime ) {
patbufidx = 0; // reset index counter to beginning of buffer
// loop over planes
for (plane=0; plane<CUBESIZE; plane++) {
// turn previous plane off
if (plane==0) {
digitalWrite( PlanePin[CUBESIZE-1 ], HIGH );
} else {
digitalWrite( PlanePin[plane-1 ], HIGH );
}

// load current plane pattern data into ports
ledpin = 0;
for (ledrow=0; ledrow<CUBESIZE; ledrow++) {
for (ledcol=0; ledcol<CUBESIZE; ledcol++) {
digitalWrite( LEDPin[ledpin++ ], PatternBuf[patbufidx ] & (1 << ledcol) );
}
patbufidx++;
}

// turn current plane on
digitalWrite( PlanePin[plane ], LOW );
// delay PLANETIME us
delayMicroseconds( PLANETIME );
} // for plane
} // while <EndTime
} while (DisplayTime > 0); // read patterns until time=0 which signals end
}

