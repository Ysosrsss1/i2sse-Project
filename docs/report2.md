# Final Report



## Introduction

Our topic is of a Captain, a hair, a warning, and bouncing. These 4 components must be merged together within a code, in order to produce am interactable design. Our design would be a interactable captain that will bounce when SpaceBar is pressed, and with this, it must bounce over flying Goku hair that will be shot by Goku himself. This will all be after a warning message will be displayed which warns about a mysterious being on the moon as well. The score will be kept of the top left of the screen, and the score will be displayed with a Game Over screen when the Captain makes contact with the hair. The game will restart/reset once ‘R’ is pressed on the keyboard, resetting the score.
## User Manual

	The animation simulates a video game, implementing the given prompts for our project and the interaction it has with the user. 
		- First is the given interaction which is a "Warning", the user is warned on the incoming hair asteroids.
		- Second is the subject being a captain which is being represented with the pirate captain Black Beard, the user interacts with the captain by evading the hair asteroids by bouncing above them using the space bar.
		If done correctly, the score counter add by one with every asteroids evaded. Done incorrectly the game will end giving a game over message giving the option to try again using the "r" command.

## Design and Architecture

| Primary components | Explanation |
|---------|---------------|
| Setup     | The setup function is what allows the initializeGame function to run as that only needs to run once, also the size of the program and upload the images being used in the program.          |
| initializeGame     | The initializeGame provides the envoiment such as the moon and space background, also the original postion of the captain and score points.      | 
| draw     | The draw function is what runs the fuctions that need to loop including all the functions below.           |
| updateCaptain     | This fucnction draws the captain and enables him to bounce and fall back down.          |
| updateObstacles     | First this function draws the obstacles in random positions, and when contacted with the captain the game will end.          |
| keyPressed     | The key pressed fuction relattes with both the updateCaptain and gameOver fuctions. When the space bar is pressed the captain will bounce up, and when the "r" is pressed when the game is over it resets.      |
| gameOver     | The game over function is given when the captain is in contact with the obstacles, and when its up the message "Game Over! Score: " comes up with the "Press 'R' to restart" with relates with the keyPressed function.           |


## User Acceptance Tests

### User Stories and Requirements

User Stories:
1. U01: As a user, I want to see an animation of the captain, so that I can play with it.
2. U02: As a user, I want to see an animation of the obstacles, so that I can avoid them.
3. U03: As a user, I want to see the captain interact with the obstacles, so that the game is engaging.
4. U04: As a user, I want to see the interaction between the captain and the obstacles, so that I can play with it.
5. U05: As a user, I want to see the captain jump, so that I can play with it.
6. U06: As a user, I want the captain to get hit by the obstacles so that I can get a game over and restart.
7. U07: As a user, I want to see the game run smoothly so that I can enjoy the animation.
8. U08: As a user, I want to see a background, so that I can be engaged with the theme.

Requirements:
1. U01: Implement an animation for the captain.
2. U02: Create and animate obstacles appearing on the screen.
3. U03: Ensure interactions between the captain and obstacles are visible.
4. U04: Display a game-over message upon collision with obstacles.
5. U05: Implement the captain's jump animation.
6. U06: Trigger a game over state when the captain collides with obstacles.
7. U07: Maintain a consistent frame rate for smooth gameplay.
8. U08: Include a visually appealing background in the game.

### User Acceptance Tests Overview

| Test ID | User Story ID | What should the user do?                              | What should the user expect?                             | Understandable? | Satisfied? | Comments, Feedback, Compliments or Suggestions              | Outcome |
|---------|---------------|-------------------------------------------------------|----------------------------------------------------------|-----------------|------------|----------------------------------------------------------------|---------|
| T01     | U01           | Start the program.                                    | See a recognizable animation of the captain.      | Y               | Y          |                                                                | Passed  |
| T02     | U06           | Start the program and let the captain hit the hair.  | Game over screen, score displayed, 'R' to restart.        | Y               | Y          |                                                                | Passed  |
| T03     | U02           | Start the program.                                    | See a recognizable animation of obstacles.                | Y               | Y          | White background removed for the hair.                         | Passed  |
| T04     | U04           | Start the program.                                    | See a warning message that hair asteroids are coming.     | Y               | Y          | Option to skip maybe.                                          | Passed  |
| T05     | U03           | Start the program and press the space bar.            | The captain should bounce and be engaging.                | Y               | Y          |                                                                | Passed  |
| T06     | U04           | Start the program and let the captain and hair interact. | Game over screen.                                         | Y               | Y          |                                                                | Passed  |
| T07     | U08           | Start the program.                                    | See the background.                               | Y               | Y          |                                                                | Passed  |
| T08     | U04           | Start the program and make the captain jump over the hair. | The score should go up by 1 for each successful jump.     | Y               | Y          | Score positioned off-screen.                                    | Passed  |

Y= Yes N= no

## System Tests

Test ID | Test Description                                                                                                                                                        | Outcome
--------|-------------------------------------------------------------------------------------------------------------------------------------------------------------------------|---------
ST-01   | Captain Jumping: Verify that the captain can jump when the space key is pressed, and lands back on the ground correctly without getting stuck in the air.              | Passed
ST-02   | Obstacle Generation: Ensure that obstacles are generated at the specified intervals and appear on the screen.                                                         | Passed
ST-03   | Obstacle Movement: Check that obstacles move from right to left and are removed from the screen when they pass the left edge.                                         | Passed
ST-04   | Collision Detection: Test that the game detects collisions between the captain and obstacles correctly, triggering a game over state.                                 | Passed
ST-05   | Score Increment: Verify that the score increments by 1 each time an obstacle is successfully passed by the captain without collision.                                 | Passed
ST-06   | Warning Message: Ensure that the warning message is displayed for the correct duration at the start of the game and then disappears.                                   | Passed
ST-07   | Restart Game: Check that the game can be restarted by pressing 'R', and resetting all game variables and states appropriately.                                            | Passed
ST-08   | Captain Movement Boundaries: Ensure that the captain does not move below the ground level or above the screen height during gameplay.                                  | Passed
ST-09   | Goku Image Display: Verify that the Goku image is displayed at the specified location on the screen and does not interfere with the gameplay elements.                | Passed
ST-10   | Gravity Effect: Check that gravity is applied to the captain when jumping, bringing the captain back down to the ground correctly.                                     | Passed
ST-11   | User Input Handling: Verify that the game correctly handles user inputs for jumping and restarting, without lag or missed keypresses.                                  | Passed
ST-12   | Game Over State: Confirm that the game transitions to the game over state when a collision is detected, and displays the correct score and restart message.           | Passed
ST-13   | Image Loading: Ensure that all images (Blackbeard, Hair Goku, and Goku) are loaded correctly at the start of the game without any missing or corrupted images.        | Passed

## Unit Tests
Sub-Components:

1. gameOver();
2. showWarningMessage();
3. keyPressed();
4. updateCaptain();

Unit Tests:
### Unit Tests for gameOver()

| Test Case          | Test Inputs  | Expected Output / Outcome | Result |
|--------------------|--------------|---------------------------|--------|
| Game Over Display  | -            | Game loop stops (`noLoop()`), "Game Over" text with score and restart instruction appears centred on the screen. | Passed |
| Score Display      | score = 10   | "Game Over! Score: 10" text displayed. | Passed |
| Restart Prompt     | -            | "Press 'R' to restart" text displayed. | Passed |

### Unit Tests for showWarningMessage()

| Test Case               | Test Inputs  | Expected Output / Outcome | Result |
|-------------------------|--------------|---------------------------|--------|
| Warning Message Display | -            | Warning message "WARNING: Incoming Hair Asteroids" appears centred on the screen with red text on a black background. | Passed |
| Text Alignment | -            | Text is centered horizontally and vertically | Passed |
| Background Color        | -            | Background is black. | Passed |

### Unit Tests for keyPressed()

| Test Case                | Test Inputs  | Expected Output / Outcome | Result |
|--------------------------|--------------|---------------------------|--------|
| Jump When Spacebar Pressed | key == ' ' and !isJumping and !showWarning | `captainVelocity.y` is set to -15, `isJumping` is true. | Passed |
| Restart Game on 'R' Key  | key == 'R' or key == 'r'     | `initializeGame()` is called, game state resets. | Passed |
| Ignore Input When Jumping | key == ' ' and isJumping     | No change in state (`captainVelocity.y` remains unchanged). | Passed |
| Ignore Input During Warning | key == ' ' and showWarning | No change in state (`captainVelocity.y` remains unchanged). | Passed |

### Unit Tests for updateCaptain()

| Test Case                  | Test Inputs  | Expected Output / Outcome | Result |
|----------------------------|--------------|---------------------------|--------|
| Gravity Application        | `captainPosition.y` < `height - groundHeight - blackbeardHeight` | `captainVelocity.y` increases by gravity value (1.0). | Passed |
| Landing Detection          | `captainPosition.y` >= `height - groundHeight - blackbeardHeight` | `captainPosition.y` is set to `height - groundHeight - blackbeardHeight`, `captainVelocity.y` is set to 0, `isJumping` is set to false. | Passed |
| Position Update            | Initial `captainPosition` and `captainVelocity` values | `captainPosition` updates based on `captainVelocity`. | Passed |
| No Upward Movement on Ground | `captainPosition.y` == `height - groundHeight - blackbeardHeight`, `captainVelocity.y` > 0 | `captainVelocity.y` is set to 0. | Passed |


## Software Quality

### PMD Warnings List

| Warning ID | Description                                        | File                    | Line Number |
|------------|----------------------------------------------------|-------------------------|-------------|
| PMD-001    | Avoid using public instance variables              | Final.pde               | 15          |
| PMD-002    | Variable 'score' should be declared final          | Final.pde             | 18          |
| PMD-003    | Method 'initializeGame' has a high NPath complexity | Final.pde               | 30          |
| PMD-004    | Avoid deep nesting                                 | Final.pde               | 50          |
| PMD-005    | Use explicit scoping                               | Final.pde               | 60          |
| PMD-006    | Class 'Game' has a large number of fields          | Final.pde               | 5           |
| PMD-007    | Method 'updateObstacles' is too long               | Final.pde               | 100         |

### Issues Fixed Since Week 11

| Warning ID | Description                                        | File                    | Line Number | Fix Description                                | Rationale for Fixing Issue                      |
|------------|----------------------------------------------------|-------------------------|-------------|-----------------------------------------------|------------------------------------------------|
| PMD-001    | Avoid using public instance variables              | Final.pde           | 15          | Changed public variables to private and provided getter/setter methods. | To adhere to encapsulation principles and improve data hiding. |
| PMD-002    | Variable 'score' should be declared final          | Final.pde               | 18          | Removed final modifier and adjusted logic to allow score updates. | Variable needs to be mutable to reflect changing game state. |
| PMD-006    | Class 'Game' has many fields          | Final.pde               | 5           | Refactored code to group related fields into separate classes. | To improve code maintainability and reduce class complexity. |

#### Rationale
PMD-001:
Issue: Public instance variables reduce summarisation.
Fix: Changed public instance variables to private and added getter and setter methods.
Rationale: By limiting access and safeguarding the object's internal state. 
PMD-002:
Issue: Variable 'score' should be declared final if it does not change.
Fix: Determined that the score needs to be changeable.
Rationale: The score variable needs to be updated frequently during gameplay to reflect the current score.
PMD-006:
Issue: Class Game has too many fields, indicating it might be doing too much.
Fix: Refactored the class to separate concerns by grouping related fields into different classes or structures.
Rationale: This improves the readability and organization of the code by following the single responsibility principle.

## Project Management

The roles and responsibilities that were agreed for each team previously was Mohamad El Ali as the project manager, and Efe as the scrum master. The project owner had the responsibility to collect information and flitter them in order to attain the best project. We have had a full design change multiple time, and some minor design changes over the weeks, including, but are not limited to, putting the hair on a head, bouncing the captain on different planets, changing the type of planet the captain is bouncing on. The scrum master was in charge of allocating each person to a function. Mohamad was put onto the designing the bouncing motion of the captain, Ali was allocated the hair and its movement, and Efe was put on making the warning, background and game over screen, we all then done peer processing in order to fix up the code and make it more cleaner. This is one of the ways that we ensured software quality. Our “Definition of Done” is not really a thing, as we always tend to add more details to the design. So basically our real “Definition of Done” is at the point where we cant think of anything else to add to our design, the code looks good, well formatted and our interaction works as expected.

## Ethics

### External Sources

- **Code Sources**:
  - **Processing Examples**: Utilized examples provided in the Processing IDE for understanding basic game loops and animation techniques.
  - **Stack Overflow**: Referenced various discussions for solutions to specific programming issues, particularly for collision detection.
  - **Open Source Libraries**: Used the Processing library for images and animation.
  - **Google Dinosaur Game**: Took inspiration from the mechanics and gameplay style of the Google Dinosaur game.

- **Design Sources**:
  - **Google Fonts**: Selected fonts for in-game text and user interfaces.

### Tools Used

- **Beyond Processing, Git, GitHub, and Word Processing Tools**:
  - **Notepad++**: Used for editing and managing code files.
  - **Grammarly**: Used for checking grammar and spelling in documentation.
  - **JIRA**: Used for bug tracking and issue management.

### Acknowledgements

- **Reviewers and Testers**:
  - **Team Members and Tutor**: All work was done by our team members with guidance from our tutor. 
  - **External Reviewers**: We only received external input from individuals who reviewed and tested our animation to ensure it passed our unit and system tests.
