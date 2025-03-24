/* ===================================
SpringListDriver (No Work Goes Here)

This program will work similarly to SpringArrayDriver,
but it will use a linked list of OrbNodes instead of
an array. This driver file is complete, all your work should
be done in the OrbList class. When working, the program can
be controlled as follows:

Keyboard commands:
  1: Create a new list of orbs in a line.
  2: Create a new list of random orbs.
  =: add a new node to the front of the list
  -: remove the node at the front
  SPACE: Toggle moving on/off
  g: Toggle earth gravity on/off

Mouse Commands:
  mousePressed: if the mouse is over an
    orb, remove it from the list.
=================================== */


int NUM_ORBS = 10;
int MIN_SIZE = 10;
int MAX_SIZE = 60;
float MIN_MASS = 10;
float MAX_MASS = 100;
float G_CONSTANT = 1;
float D_COEF = 0.1;

int SPRING_LENGTH = 50;
float  SPRING_K = 0.005;

int MOVING = 0;
int BOUNCE = 1;
int GRAVITY = 2;
int DRAGF = 3;
int VECTOR_FIELD = 4;
int MULTIPLE = 5;
int SPRINGS = 6;
boolean[] toggles = new boolean[7];
String[] modes = {"Moving", "Bounce", "Gravity", "Drag", "Vector Field", "Multiple", "Spring"};

FixedOrb earth;
Orb[] planets;
OrbList slinky;

void setup() {
  size(600, 600);
  planets = new Orb[2];
  planets[0] = new Orb(100, 100, 50, 100);
  planets[1] = new Orb(400, 400, 50, 100);
  earth = new FixedOrb(width/2, height / 2, 100, 500);

  slinky = new OrbList();
  slinky.populate(NUM_ORBS, true);
}//setup

void draw() {
  background(255);
  displayMode();

  if (toggles[SPRINGS]) {
    slinky.display();
  }
  if (toggles[MOVING]) {


    if (toggles[GRAVITY]) {
      slinky.applyGravity(earth, GRAVITY);
    }
    slinky.run(toggles[BOUNCE]);
  }//moving
}//draw



void keyPressed() {
  if (key == ' ') { toggles[MOVING] = !toggles[MOVING]; }
  if (key == 'b') { toggles[BOUNCE] = !toggles[BOUNCE]; }

}//keyPressed


void displayMode() {
  textAlign(LEFT, TOP);
  textSize(20);
  noStroke();
  int spacing = 85;
  int x = 0;

  for (int m=0; m<toggles.length; m++) {
    //set box color
    if (toggles[m]) { fill(0, 255, 0); }
    else { fill(255, 0, 0); }

    float w = textWidth(modes[m]);
    rect(x, 0, w+5, 20);
    fill(0);
    text(modes[m], x+2, 2);
    x+= w+5;
  }
}//display
