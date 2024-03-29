PImage img;
int xCap = 100; 
int yCap = 100;
void setup() {
  size(600,600);
  background(0);
  img = loadImage("Captain.jpg");
  
}

void draw() {
  image(img, xCap, yCap, 300, 300);

   fill(156, 157, 152);
   circle(300, 1000, 1200); //moon
   fill(211, 211, 207);
   circle(500, 600, 100);  // light grey circle
   circle(200, 600, 40);   // light grey circle
   circle(150, 500, 60);    // light grey circle
   fill(113, 113, 110);
   circle(300, 550, 140); //dark grey circles
   circle(100, 600, 75);   //dark grey circles
   circle(450, 500, 50);   //dark grey circles
   
   

 }
 void mousePressed(){
   while(mouseX-150 > xCap){
     background(0);
     xCap+=1;
   }while(mouseX-150 < xCap){
     background(0);
     xCap-=1;
   }
   while(yCap > 0 ){
     background(0);
     yCap-=1;
   }while(yCap < 100){
     background(0);
     yCap+=1;
   }
 }
