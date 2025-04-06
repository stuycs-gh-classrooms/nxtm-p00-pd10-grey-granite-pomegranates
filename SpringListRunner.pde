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
float G_CONSTANT = 0.07;
float D_COEF = 0.1;

int SPRING_LENGTH = 50;
float  SPRING_K = 0.05;

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
Orb[] dragOrbs;
Orb[] fieldOrbs;
Orb[] comboOrbs;
OrbList slinky;

void setup() {
  size(600, 600);


  dragOrbs = new Orb[3];
  fieldOrbs = new Orb[500];
  earth = new FixedOrb(width/2, height / 2, 100, 500);
}//setup


void draw() {
  background(255);
  displayMode();
  //print('y');
  //println(  (height / 2) - mouseY);
  //print('x');
  //println(  mouseX - width / 2);

  if (toggles[SPRINGS]) {
    slinky.display();
    if (toggles[MOVING]) {
      slinky.applySprings(SPRING_LENGTH, SPRING_K);
      slinky.run(toggles[BOUNCE]);
    }
  } else if (toggles[GRAVITY]) {
    earth.display();
    planets[0].display();
    planets[1].display();
    if (toggles[MOVING]) {
      PVector g1 = planets[0].getGravity(earth, G_CONSTANT);
      PVector g2 = planets[1].getGravity(earth, G_CONSTANT);
      planets[0].applyForce(g1);
      planets[1].applyForce(g2);
      planets[0].move(toggles[BOUNCE]);
      planets[1].move(toggles[BOUNCE]);
    }
  } else if (toggles[DRAGF]) {
    fill(122, 147, 116);
    rect(0, 2 * height / 3, width, 1 * height / 3);

    fill(253, 46, 246);
    rect(0, height / 3, width, height / 3);
    for (int i = 0; i < dragOrbs.length; i++) {
      PVector f = new PVector(0, 5);
      if (toggles[MOVING]) {
        dragOrbs[i].applyForce(f);
        if (dragOrbs[i].center.y > height / 3) {
          PVector drag = dragOrbs[i].getDragForce(50);
          dragOrbs[i].applyForce(drag);
        }
        if (dragOrbs[i].center.y > 2 * height / 3) {
          PVector drag = dragOrbs[i].getDragForce(100);
          dragOrbs[i].applyForce(drag);
        }
        dragOrbs[i].move(toggles[BOUNCE]);
      }

      dragOrbs[i].display();
    }
  } else if (toggles[VECTOR_FIELD]) {
    for (int i = 0; i < fieldOrbs.length; i++) {
      if (toggles[MOVING]) {
        PVector f = fieldOrbs[i].getField();
        //println("Orb Pos: ");
        //print(fieldOrbs[i].center);
        //println(f);

        fieldOrbs[i].applyForce(f);

        fieldOrbs[i].move(toggles[BOUNCE]);
        fieldOrbs[i].drawLine();
      }

      fieldOrbs[i].display();
    }
    Boolean out = true;
    for (int i = 0; i < fieldOrbs.length; i++) {
      if (fieldOrbs[i].center.x > 0 && fieldOrbs[i].center.x < width && fieldOrbs[i].center.y < height && fieldOrbs[i].center.y > 0) {
        out = false;
      }
      
    }
    if (out) {
      for (int i = 0; i < fieldOrbs.length; i++) {
        fieldOrbs[i] = new Orb();
      }
    }
  } else if (toggles[MULTIPLE]) {
    
  } else if (toggles[SPRINGS]) {
  }
  if (toggles[MOVING]) {


    if (toggles[GRAVITY]) {
      //slinky.applyGravity(earth, GRAVITY);
    }
    //slinky.run(toggles[BOUNCE]);
  }//moving
}//draw



void keyPressed() {
  if (key == ' ') {
    toggles[MOVING] = !toggles[MOVING];
  }
  if (key == 'b') {
    toggles[BOUNCE] = !toggles[BOUNCE];

  }
  if (key == '1') {
    toggles[GRAVITY] = !toggles[GRAVITY];
    toggles[SPRINGS] = false;
    toggles[DRAGF] = false;
    toggles[VECTOR_FIELD] = false;
    toggles[MULTIPLE] = false;
    earth = new FixedOrb(width/2, height / 2, 100, 500);
    planets = new Orb[2];
    planets[0] = new Orb(100, 100, 50, 100);
    planets[1] = new Orb(500, 500, 50, 100);
  }
  if (key == '2') {
    toggles[SPRINGS] = !toggles[SPRINGS];
        toggles[GRAVITY] = false;
    toggles[DRAGF] = false;
    toggles[VECTOR_FIELD] = false;
    toggles[MULTIPLE] = false;
    slinky = new OrbList();
    slinky.populate(NUM_ORBS, true);
  }
  if (key == '3') {
    toggles[DRAGF] = !toggles[DRAGF];
        toggles[GRAVITY] = false;
    toggles[SPRINGS] = false;
    toggles[VECTOR_FIELD] = false;
    toggles[MULTIPLE] = false;
    dragOrbs = new Orb[3];
    for (int i = 0; i < dragOrbs.length; i++) {
      dragOrbs[i] = new Orb(100 + i * 150, 100, 50, 100);
    }
  }
  if (key == '4') {
        toggles[GRAVITY] = false;
    toggles[SPRINGS] = false;
    toggles[DRAGF] = false;
    toggles[MULTIPLE] = false;
    toggles[VECTOR_FIELD] = !toggles[VECTOR_FIELD];
    for (int i = 0; i < fieldOrbs.length; i++) {
      fieldOrbs[i] = new Orb();
    }
  }
  if (key == '5') {
        toggles[GRAVITY] = false;
    toggles[SPRINGS] = false;
    toggles[DRAGF] = false;
    toggles[VECTOR_FIELD] = false;
    toggles[MULTIPLE] = !toggles[MULTIPLE];
  }
}//keyPressed


void displayMode() {
  textAlign(LEFT, TOP);
  textSize(20);
  noStroke();
  int spacing = 85;
  int x = 0;

  for (int m=0; m<toggles.length; m++) {
    //set box color
    if (toggles[m]) {
      fill(0, 255, 0);
    } else {
      fill(255, 0, 0);
    }

    float w = textWidth(modes[m]);
    rect(x, 0, w+5, 20);
    fill(0);
    text(modes[m], x+2, 2);
    x+= w+5;
  }
}//display
