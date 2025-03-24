/*===========================
 OrbList (ALL WORK GOES HERE)
 
 Class to represent a Linked List of OrbNodes.
 
 Instance Variables:
 OrbNode front:
 The first element of the list.
 Initially, this will be null.
 
 Methods to work on:
 0. addFront
 1. populate
 2. display
 3. applySprings
 4. applyGravity
 5. run
 6. removeFront
 7. getSelected
 8. removeNode
 
 When working on these methods, make sure to
 account for null values appropraitely. When the program
 is run, no NullPointerExceptions should occur.
 =========================*/

class OrbList {

  OrbNode front;

  /*===========================
   Contructor
   Does very little.
   You do not need to modify this method.
   =========================*/
  OrbList() {
    front = null;
  }//constructor

  /*===========================
   addFront(OrbNode o)
   
   Insert o to the beginning of the list.
   =========================*/
  void addFront(OrbNode o) {
    if (front == null) {
      front = o;
      front.next = null;
      front.previous = null;
    } else {
      front.next = o;
      o.previous = front;
      front = o;
      o.next = null;
    }
  }//addFront


  /*===========================
   populate(int n, boolean ordered)
   
   Clear the list.
   Add n randomly generated  orbs to the list,
   using addFront.
   If ordered is true, the orbs should all
   have the same y coordinate and be spaced
   SPRING_LEGNTH apart horizontally.
   =========================*/
  void populate(int n, boolean ordered) {
    front = null;
    for (int i = 0; i < n; i++) {
      if (ordered) {
        if (i == 0) {
          addFront(new OrbNode(0, width / 2, 30, 30));
        } else {
          addFront(new OrbNode(front.center.x + SPRING_LENGTH, width / 2, 30, 30));
        }
      } else {
        addFront(new OrbNode());
      }
    }
  }//populate

  /*===========================
   display(int springLength)
   
   Display all the nodes in the list using
   the display method defined in the OrbNode class.
   =========================*/
  void display() {
    OrbNode currOrb = front;
    while (currOrb != null) {
      currOrb.display();
      currOrb = currOrb.previous;
    }
  }//display

  /*===========================
   applySprings(int springLength, float springK)
   
   Use the applySprings method in OrbNode on each
   element in the list.
   =========================*/
  void applySprings(int springLength, float springK) {
    OrbNode currOrb = front;
    while (currOrb != null) {
      currOrb.applySprings(springLength, springK);
      currOrb = currOrb.previous;
    }
  }//applySprings

  /*===========================
   applyGravity(Orb other, float gConstant)
   
   Use the getGravity and applyForce methods
   to apply gravity crrectly.
   =========================*/
  void applyGravity(Orb other, float gConstant) {
    OrbNode currOrb = front;
    while (currOrb != null) {
      PVector g = currOrb.getGravity(other, gConstant);
      currOrb.applyForce(g);
      currOrb = currOrb.previous;
    }
  }//applySprings

  /*===========================
   run(boolean bounce)
   
   Call run on each node in the list.
   =========================*/
  void run(boolean bounce) {
    OrbNode currOrb = front;
    while (currOrb != null) {
      currOrb.move(bounce);
      currOrb = currOrb.previous;
    }
  }//applySprings

  /*===========================
   removeFront()
   
   Remove the element at the front of the list, i.e.
   after this method is run, the former second element
   should now be the first (and so on).
   =========================*/
  void removeFront() {
    front.previous.next = null;
    front = front.previous;
  }//removeFront


  /*===========================
   getSelected(float x, float y)
   
   If there is a node at (x, y), return
   a reference to that node.
   Otherwise, return null.
   
   See isSlected(float x, float y) in
   the Orb class (line 115).
   =========================*/
  OrbNode getSelected(int x, int y) {
    OrbNode currOrb = front;
    while (currOrb != null) {
      Boolean found = currOrb.isSelected(x, y);
      if (found) {
        return currOrb;
      }
      currOrb = currOrb.previous;
    }
    return null;
  }//getSelected

  /*===========================
   removeNode(OrbNode o)
   
   Removes o from the list. You can
   assume o is an OrbNode in the list.
   You cannot assume anything about the
   position of o in the list.
   =========================*/
  void removeNode(OrbNode o) {
    OrbNode currOrb = front;
    while (currOrb != null ) {
      if (currOrb == o) {
        if (o.next != null && o.previous != null) {
          o.previous.next = o.next;
          o.next.previous = o.previous;
        } else if (o.next != null && o.previous == null) {
          o.next.previous = null;
        } else if (o.previous != null && o.next == null) {
          o.previous.next = null;
          front = o.previous;
        }
        else {
          front = null;
        }
        o = null;
        break;
      }
      currOrb = currOrb.previous;
    }
  }
}//OrbList
