class Nube {
 PVector loc;
 PVector vel;
 PImage Nube;
 

  
 public Nube() {
   loc = new PVector( random(5, width-5),random(5, height/2-5));
   vel= new PVector(random(2,5),random(2,5));
   Nube = loadImage("Nube.png");
 }


  

 void dibujar() {
   imageMode(CENTER);
   image(Nube,loc.x, loc.y);
   
   loc.x+=vel.x;
   
   if (loc.x >= width) {
     loc.x=0;
}
 }
}
