PImage img;
int xCap = 100; 
int yCap = 100;
void setup() {
  size(600,600);
  background(255);
  img = loadImage("captain.jpeg");
}

void draw() {
  image(img, xCap, yCap, width/2, height/2);
  
  
   fill(156, 157, 152);
   circle(width/2, height+height/2, width*2);
   fill(211, 211, 207);
   circle(width - 100, height -100, 100);
   circle(width/3, height - 100, 40);
   circle(150, height - 200, 60);
   fill(113, 113, 110);
   circle(width/2, height - 150, 140);
   circle(100, height - 100, 75);
   circle(width - 150, height -200, 50);
   
 }
 void mousePressed(){
   while(mouseX-150 > xCap){
     background(255);
     xCap+=1;
   }while(mouseX-150 < xCap){
     background(255);
     xCap-=1;
   }
   while(yCap > 0 ){
     background(255);
     yCap-=1;
   }while(yCap < 100){
     background(255);
     yCap+=1;
   }
 }
