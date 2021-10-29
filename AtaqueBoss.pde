class AtaqueBoss{
  
  PImage img;
  PVector pos;
  PVector vel;
  boolean isAlive;
  float r;
  
  public AtaqueBoss(int tipo, float x, float y, float vx, float vy){
    
    pos = new PVector (x, y);
    vel = new PVector (vx, vy);
    isAlive = true;
    
    if(tipo == 1)
    img = loadImage("HR.png");
    else if(tipo == 2)
    img = loadImage("HM.png");
    else if(tipo == 3)
    img = loadImage("HC.png");
    
    r=0;
  
  }
  
//Rotar ataque
  void dibujar() {
     pushMatrix();
     translate(pos.x, pos.y);
     rotate(radians(r));
     imageMode(CENTER);
     image(img, 0, 0);
     popMatrix();
     r+=7;
  }
  
  
  void mover() {
    
    pos.add(vel);  //x += vx; //y += vy;
    //if (pos.x <= 0 || pos.x >= width) {
    //  vel.x *= -1;
    //}
    
    if (pos.y <= 0 || pos.y >= height) {
      vel.y *= -1;
    }
    
  }
  
  boolean isPlaying() {
    return isAlive;
  }
  
  void quitar() {
    isAlive = false;
  }
  
  PVector getPos() {
    return pos;
  }
  




}
