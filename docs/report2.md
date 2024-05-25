# Final Report

Before the deadline, download a PDF version of this report, and submit it on iLearn. We will mark the report uploaded on iLearn.

Use the structure below for your report. Remove lines 3 and 5 of the markdown file.

## Introduction

Provide a description of the topic, including what the program will do and what the users can expect.

## User Manual

Provide a detailed user manual that describes how to interact with your animation.

## Design and Architecture

Please include a graphical representation of the architecture of your program, illustrating how its primary components relate to each other. You may omit certain details to ensure clarity in the diagram. It is meant to give an overview.

Explain, your diagram, and include a key/legend.

## User Acceptance Tests

- List the user stories and requirements that were the source for the user acceptance tests.
- Include a table that gives an overview of the acceptance tests and tells whether they passed or failed.

## System Tests

- Include a table that lists the system tests, that weren’t acceptance tests. These are tests that run the entire program and are executed by the team to test features they added themselves.
- Include in that table the outcome for each system test, including an overview of the test and whether it passed or failed.

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
| Game Over Display  | -            | Game loop stops (`noLoop()`), "Game Over" text with score and restart instruction appears centered on screen. | Passed |
| Score Display      | score = 10   | "Game Over! Score: 10" text displayed. | Passed |
| Restart Prompt     | -            | "Press 'R' to restart" text displayed. | Passed |

### Unit Tests for showWarningMessage()

| Test Case               | Test Inputs  | Expected Output / Outcome | Result |
|-------------------------|--------------|---------------------------|--------|
| Warning Message Display | -            | Warning message "WARNING: Incoming Hair Asteroids" appears centered on screen with red text on black background. | Passed |
| Text Alignment | -            | Text is centered horizontally and vertically | Passed |
| Background Color        | -            | Background is black. | Passed |

### Unit Tests for keyPressed()

| Test Case                | Test Inputs  | Expected Output / Outcome | Result |
|--------------------------|--------------|---------------------------|--------|
| Jump When Spacebar Pressed | key == ' ' and !isJumping and !showWarning | `captainVelocity.y` is set to -15, `isJumping` is set to true. | Passed |
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
| PMD-001    | Avoid using public instance variables              | Game.java               | 15          |
| PMD-002    | Variable 'score' should be declared final          | Game.java               | 18          |
| PMD-003    | Method 'initializeGame' has a high NPath complexity | Game.java               | 30          |
| PMD-004    | Avoid deep nesting                                 | Game.java               | 50          |
| PMD-005    | Use explicit scoping                               | Game.java               | 60          |
| PMD-006    | Class 'Game' has a large number of fields          | Game.java               | 5           |
| PMD-007    | Method 'updateObstacles' is too long               | Game.java               | 100         |

### Issues Fixed Since Week 11

| Warning ID | Description                                        | File                    | Line Number | Fix Description                                | Rationale for Fixing Issue                      |
|------------|----------------------------------------------------|-------------------------|-------------|-----------------------------------------------|------------------------------------------------|
| PMD-001    | Avoid using public instance variables              | Game.java               | 15          | Changed public variables to private and provided getter/setter methods. | To adhere to encapsulation principles and improve data hiding. |
| PMD-002    | Variable 'score' should be declared final          | Game.java               | 18          | Removed final modifier and adjusted logic to allow score updates. | Variable needs to be mutable to reflect changing game state. |
| PMD-006    | Class 'Game' has a large number of fields          | Game.java               | 5           | Refactored code to group related fields into separate classes. | To improve code maintainability and reduce class complexity. |

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

- Describe the roles and responsibilities of the team members that were agreed on before the sprint commenced.
- Describe the review processes that you defined before the sprint to ensure software quality.
- Provide your "Definition of Done."

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
  - **External Reviewers**: The only external input we received was from individuals who reviewed and tested our animation to ensure it passed our unit and system tests.
