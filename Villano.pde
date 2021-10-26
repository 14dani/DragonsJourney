class Villano{

  PImage imagenMago;
  PVector pos;
  PVector vel;
  
  public Villano (PImage mago){
    imagenMago = mago;
    pos = new PVector (random(width*0.75, width), random(0, height));
    vel = new PVector(0, 1,9);
  
  }
  
  
  void mover() {
    pos.add(vel);  //x += vx; //y += vy;
    
    if (pos.x <= width*0.75 || pos.x >= width) {
      vel.x *= -1;
    }
    
    if (pos.y <= 0 || pos.y >= height) {
      vel.y *= -1;
    }
    
    imageMode(CENTER);
    image(imagenMago, pos.x, pos.y);
  }


}
