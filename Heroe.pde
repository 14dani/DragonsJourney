class Heroe{
  
  PImage dragon;
  float cx,cy, ang;
  float mover = 0;
  
  public Heroe(PImage drag){
    
    dragon = drag;
  }
  
  public Heroe(){
    //fill(#F77555);
    //ang = 180 + mover;
    //cx = width*0.25 + cos(radians(ang)) * 200;
    //cy = height/2 + sin(radians(ang)) * 200;
    //ellipse(cx, cy, 40, 40);
   
  }
  
  void mover(float mov){
  
  mover = mov;
  ang = 180+ mover;
  cx = width*0.25 + cos(radians(ang)) * 200;
  cy = height/2 + sin(radians(ang)) * 200;
  
  imageMode(CENTER);
  image(dragon, cx, cy);
  
  }
  
  

}
