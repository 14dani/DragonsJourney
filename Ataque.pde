class Ataque{
  
  PImage img;
  PVector pos;
  PVector vel;
  boolean isAlive;
  

  public Ataque(int tipo, float x, float y){
    
    pos = new PVector (x, y);
    vel = new PVector (random(-4,-1), random(-5,5));
    isAlive = true;
    
    if(tipo == 1)
    img = loadImage("AtaqueRojo.png");
    else if(tipo == 2)
    img = loadImage("AtaqueMorado.png");
    else if(tipo == 3)
    img = loadImage("AtaqueCyan.png");
  
  }
  
  
  //Rotar ataque
  //void dibujar() {
    
  //  imageMode(CENTER);
  //  pushMatrix();
  //  translate(pos.x, pos.y);
    
  //  image(img,0,0);
  //  popMatrix();
  //}
  
  
  void mover() {
    //pos.add(vel);  //x += vx; //y += vy;
    //vel.set(random(-4,-1), random(-5,5));
    pos.add(vel);  //x += vx; //y += vy;
    
    
    
    imageMode(CENTER);
    image(img, pos.x, pos.y);
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
