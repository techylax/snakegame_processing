PImage snake;
class food{
  
  //  varibles
  float xpos, ypos;
  
  
  
  //constructor
  food(){
    xpos = random(width/7, width - width/7);
    ypos = random(height/7, height - height/7);
  }
  
  
  // function to display an apple
 void display(){
   fill(190,0,100);
   image(apple,xpos, ypos,17,17);
 }
 
 // To reset the position
 void reset(){
    xpos = random(100, width - width/7);
    ypos = random(100, height - height/7);
    eat.play();
 }   
}
