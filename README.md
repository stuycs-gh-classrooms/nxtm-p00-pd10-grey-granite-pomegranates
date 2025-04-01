[![Review Assignment Due Date](https://classroom.github.com/assets/deadline-readme-button-22041afd0340ce965d47ae6ef1cefeee28c7c493a6346c4f15d667ab976d596c.svg)](https://classroom.github.com/a/gbHItYk9)
## Project 00
### NeXTCS
### Period: 10
## Name0: Princeden Hom
## Name1: Xuan Yao
---

This project will be completed in phases. The first phase will be to work on this document. Use github-flavoured markdown. (For more markdown help [click here](https://github.com/adam-p/markdown-here/wiki/Markdown-Cheatsheet) or [here](https://docs.github.com/en/get-started/writing-on-github/getting-started-with-writing-and-formatting-on-github/basic-writing-and-formatting-syntax) )

All projects will require the following:
- Researching new forces to implement.
- Method for each new force, returning a `PVector`  -- similar to `getGravity` and `getSpring` (using whatever parameters are necessary).
- A distinct demonstration for each individual force (including gravity and the spring force).
- A visual menu at the top providing information about which simulation is currently active and indicating whether movement is on or off.
- The ability to toggle movement on/off
- The ability to toggle bouncing on/off
- The user should be able to switch _between_ simluations using the number keys as follows:
  - `1`: Gravity
  - `2`: Spring Force
  - `3`: Drag
  - `4`: Custom Force
  - `5`: Combination


## Phase 0: Force Selection, Analysis & Plan
---------- 

#### Custom Force: NAME OF YOUR FORCE

### Forumla
What is the formula for your force? Including descriptions/definitions for the symbols. (You may include a picture of the formula if it is not easily typed.)


$$\vec{F} = -y\vec{i} + x\vec{j} $$


### Custom Force
- What information that is already present in the `Orb` or `OrbNode` classes does this force use?
  - the position of the orb

- Does this force require any new constants, if so what are they and what values will you try initially?
  - the coefficients of the vector field equation, and we will initially just use -y and x

- Does this force require any new information to be added to the `Orb` class? If so, what is it and what data type will you use?
  - no

- Does this force interact with other `Orbs`, or is it applied based on the environment?
  - environment

- In order to calculate this force, do you need to perform extra intermediary calculations? If so, what?
  - plug in the position into the equation for vector field force

--- 

### Simulation 1: Gravity
Describe how you will attempt to simulate orbital motion. <br>
One large dense object in the center of the screen and then two orbs that we will calculate the gravitational force of the large orb on the two orbs.

--- 

### Simulation 2: Spring
Describe what your spring simulation will look like. Explain how it will be setup, and how it should behave while running. <br>
Three orbs in the middle with springs attached between each orb and the leftmost fixed. The non fixed balls should oscillate left and right. force

--- 

### Simulation 3: Drag
Describe what your drag simulation will look like. Explain how it will be setup, and how it should behave while running. <br>
Start five balls on the top of the screen and apply a constant downward force. The bottom third of the screen will have very high drag force, and the middle third will have a weak drag force. While running, the balls should slow down as they move down the screen, but more so near the bottom than the middle 

--- 

### Simulation 4: Custom force
Describe what your Custom force simulation will look like. Explain how it will be setup, and how it should behave while running. <br>
5 balls will be scattered across the screen and while running they should follow the field lines.

--- 

### Simulation 5: Combination
Describe what your combination simulation will look like. Explain how it will be setup, and how it should behave while running.
5 balls will be scattered across the screen and while running they should follow the field lines. The right half of the screen will experience a drag force, and there also will be a fixed orb in the center that will cause gravitational attraction to the other orbs. 



