class snake {
  int len;
  int headSize;
  float sidelen;
  String dir; 
  int add;
  ArrayList <Float> xpos, ypos;

  // constructor
  snake() {
    headSize =25;
    len = 1;
    add =13;
    apple  = loadImage("apple.png");
    sidelen = 17;
    dir = "right";
    xpos = new ArrayList();
    ypos = new ArrayList();
    xpos.add( random(200, width-300) );
    ypos.add( random(200, height-300) );
  }


// Move function to make the movement of the snake
  void move() {
    for (int i = len - 1; i > 0; i = i -1 ) {
      xpos.set(i, xpos.get(i - 1));  // set the x position of the snake.
      ypos.set(i, ypos.get(i - 1)); // set the y position of the snake.
    } 
    if (dir == "left") // check the string and set position of snake left if the string is left
    {
      xpos.set(0, xpos.get(0) - add);
      if ( dist(food1.xpos, food1.ypos, test.xpos.get(0), test.ypos.get(0)) < 40 ) {
        image(line, xpos.get(0)-30, ypos.get(0)-5, 30, 10);   // Image tag to render a tounge of snake
      }
    }
    if (dir == "right")  // check the string and set position of snake to right if the string is right
    {
      xpos.set(0, xpos.get(0) + add);

// Calculate the distance from food to the snake and draw the tongue if distance is less than 40.
      if ( dist(food1.xpos, food1.ypos, test.xpos.get(0), test.ypos.get(0)) < 40 ) 
      {
        image(line, xpos.get(0)+10, ypos.get(0)-5, 20, 10);
      }
    }
    
    // check the string and set position of snake to up if the string is up

    if (dir == "up") {
      ypos.set(0, ypos.get(0) - add);
      
      // Calculate the distance from food to the snake and draw the tongue if distance is less than 40.


      if ( dist(food1.xpos, food1.ypos, test.xpos.get(0), test.ypos.get(0)) < 40 ) {
        image(line, xpos.get(0)-4, ypos.get(0)-25, 10, 30);
      }
    }

    // check the string and set position of snake to down if the string is down


    if (dir == "down") {
      ypos.set(0, ypos.get(0) + add);
      if ( dist(food1.xpos, food1.ypos, test.xpos.get(0), test.ypos.get(0)) < 40 ) {
        image(line, xpos.get(0)-5, ypos.get(0)+8, 10, 20);
      }
    }

    // check if hit itself and if so cut off the tail
    if ( checkHit() == true) {
      gameover.play();
      state = GAMEOVER_STATE;
    }
  }
// Function to test if the snake hits and go to gameover State or not
  void gameOver()
  {
    if (state== PLAY_STATE)
    {
      if (xpos.get(0)<20 || ypos.get(0) <20 || xpos.get(0)>=width-18 || ypos.get(0)>= height-18)
      {
        gameover.play();
        state= GAMEOVER_STATE;
      }

      for (int i=1; i<xpos.size(); i++)
      {
        if (xpos.get(0)==xpos.get(i) && ypos.get(0) == ypos.get(i))
        { 
          gameover.play();
          state= GAMEOVER_STATE;
        }
      }
    }
  }

//  function to display the body parts of snake
  void display() {
    for (int i = 0; i <len; i++) {
      fill(0, 255, 0);
      noStroke();
      ellipse(xpos.get(i), ypos.get(i), sidelen, sidelen);

      //Head of the snake
      ellipse(xpos.get(0), ypos.get(0), headSize, headSize);
      if (dir =="right")
      {
        ellipse(xpos.get(0)-10, ypos.get(0), 20, 15);
      }

      if (dir =="left")
      {
        ellipse(xpos.get(0)+10, ypos.get(0), 20, 15);
      }

      if (dir =="up")
      {
        ellipse(xpos.get(0), ypos.get(0)+10, 15, 16);
      }

      if (dir =="down")
      {
        ellipse(xpos.get(0), ypos.get(0)-10, 15, 16);
      }
      // Condition to draw an eye when dir is either up or down

      if (dir=="up" || dir =="down")
      {
        fill(0);
        ellipse(xpos.get(0)+7, ypos.get(0), 7, 7);
        ellipse(xpos.get(0)-7, ypos.get(0), 7, 7);
      }


      //Eyes of the snake

      if (dir=="left" || dir =="right")
      {
        fill(0);
        ellipse(xpos.get(0), ypos.get(0)+7, 7, 7);
        ellipse(xpos.get(0), ypos.get(0)-7, 7, 7);
      }
    }
  }

// Function to add the tail when snake eats an apple

  void addTail() {
    xpos.add( xpos.get(len-1) + sidelen+2);
    ypos.add( ypos.get(len-1) + sidelen+2);
    len++;
  }

// boolean function to check the condition if snake hit itself
  boolean checkHit() {
    for (int i = 1; i < len; i++) {
      if ( dist(xpos.get(0), ypos.get(0), xpos.get(i), ypos.get(i)) < sidelen-5) {
        return true;
      }
    } 
    return false;
  }
}
