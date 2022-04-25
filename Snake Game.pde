/* Snake Game : It is a simple snake game made using procesing where user simply eats the apple and the tail of the snake
increases when the apple is eaten. The aim of the game is to get high score as possible and not to get dead for a long time

Autthor : Laxman Poudel
Email : poudell@lafayette.edu
*/

import processing.sound.*;
SoundFile walk;
SoundFile eat;
SoundFile gameover;
PImage apple;
PImage line;
snake test;
food food1;
int START_STATE =0;
int PLAY_STATE = 1;
int GAMEOVER_STATE =2;
int INSTRUCTION_STATE = 3;
int state;

void setup() {
  state = START_STATE;
  size(700, 700);
  test = new snake();
  food1 = new food();
  rectMode(CENTER);
  textAlign(CENTER, CENTER);
  apple = loadImage("apple.png");
  line  = loadImage("line.jpg");
  walk = new SoundFile(this, "movement.mp3");
  eat = new SoundFile(this, "eat.mp3");
  gameover = new SoundFile(this, "gameover.wav");
}



void draw() {
  background(70, 70, 70);

  if ( state == START_STATE)   // Check the STATE and perform the reuired task
  {

    fill(0, 180, 153, 204);
    textSize(width/28);
    text("Ready to play ? Select the game mode.", width/2, height/2 );
    noFill();
    stroke(255);
    //Bottoms to select paddle size
    rect(width/2-(3*height)/14, ((39*height)/70), width/10, (3*height)/70);
    text("[Easy]", (2*width)/7, (11*height)/20 );

    rect(width/2, height/2+(2*height)/35, width/10, (3*height)/70);
    text("[Hard]", width/2, height/2+height/20 );


    rect(width/2, height/2+(5*height)/28, (9*height)/35, (3*height)/70);
    text("[Instructions]", width/2, height/2+(5*height)/28 );

    rect(width/2+(3*height)/14,(39*height)/70, width/5, (3*height)/70);
    text("[Moderate]", (5*width)/7, (11*width)/20 );
  } else if ( state == PLAY_STATE)

  {
    drawScoreboard();
    test.move();
    test.display();
    food1.display();
    test.gameOver();

// Check the distance between the position of food and snake to reset the food)
    if ( dist(food1.xpos, food1.ypos, test.xpos.get(0), test.ypos.get(0)) < test.headSize )
    {
      //image(apple, test.xpos.get(0)-7, test.ypos.get(0), 17, 17);
      food1.reset();
      test.addTail();
    }
    
  } else if ( state==GAMEOVER_STATE)
  {
    textSize((3*height)/70);
    fill(0, 180, 153, 204);
    text("Game Over", width/2, height/2 );
    text( " Your Score is :"+ (test.len-1), width/2, height/2+(2*height/35));
    text( "Press any Key to restart the game  ", width/2, height/2+(9*height/70));
  } else if ( state==INSTRUCTION_STATE)
  {
    textSize(width/35);
    text("Welcome to Snake game.In the game of Snake,the player uses", width/2, height/2-(9*height/35));
    text("the arrowkeys to move a snakearound the board.As the snake", width/2, height/2-(8*height/35));  
    text("finds food,it eats the food,and thereby grows larger.The", width/2, height/2-height/5);
    text("game ends when the snake either moves off the screen or", width/2, height/2-(6*height/35));
    text("moves into itself.The goal is to make the snake as large as", width/2, height/2-height/7);
    text("possible before that happens.Enjoy the game!", width/2, height/2-(4*height/35));
    textSize(height/28);
    text("Press Any Key to get back to the menu screen.", width/2, height/2-height/35);
  }
}


void keyPressed() {

  if (state==INSTRUCTION_STATE)
  {
    state= START_STATE;
  }

  if (state==GAMEOVER_STATE)
  {
    state= PLAY_STATE;
    setup();
  }
// Key code logic to move in the different location
  if (key == CODED && state == PLAY_STATE) {
    if (keyCode == LEFT) {
      test.dir = "left";
      walk.play();
    }
    if (keyCode == RIGHT) {
      test.dir = "right";
      walk.play();
    }
    if (keyCode == UP) {
      test.dir = "up";
      walk.play();
    }
    if (keyCode == DOWN) {
      test.dir = "down";
      walk.play();
    }
  }
}


void mousePressed()
{    // Check state condition and execute the program
  if ( state== START_STATE)
  {


    if (mouseX>(33*width)/140 && mouseX<(47*height)/140 && mouseY>(15*width)/140 && mouseY<(81*height)/140)
    {
      state= PLAY_STATE;

      frameRate(5); // To set the speed of snake 
    }

    if (mouseX>(131*width)/350 && mouseX<(87*height)/140 && mouseY>(13*width)/20 && mouseY<(124*height)/175)
    {
      state= INSTRUCTION_STATE; 
    }

    if (mouseX>(9*width)/20 && mouseX<(15*height)/28 && mouseY>(15*width)/28 && mouseY<(81*height)/140)
    {
      state= PLAY_STATE;
      frameRate(20);  // Control  the speed of snake
    }
    if (mouseX>(42*width)/70 && mouseX<(57*height)/70 && mouseY>(15*height)/28 && mouseY<(81*height)/140)
    {
      state = PLAY_STATE;
      frameRate(10);// Control the speed of snake
    }
  }
}

// Fuction to determine the score of the game
void drawScoreboard() {
  fill(100, 222, 197);
  textSize(17);
  text( "Score: " + (test.len-1), (3*height)/35, width/14);
}
