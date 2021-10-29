class HeroeAnimacion {
  
  SpriteSheet ani;
  PVector loc;
  boolean active;
  
  public HeroeAnimacion(char tipo, PVector _loc) {
    
    if(tipo == 's') {
      ani = new SpriteSheet("FS_", 10, "png");
    }
    else if(tipo == 'e') {
      ani = new SpriteSheet("HE_", 10, "png");
      
    }
     else if(tipo == 'v') {
      ani = new SpriteSheet("HV_", 10, "png");
    }
  
    loc = _loc;
    active = true;
    ani.noLoop();
    ani.play();
  }
  
  void dibujar() {
    pushMatrix();
    imageMode(CENTER);
    ani.display(loc.x, loc.y);
    if (ani.isFinished())
      active = false;
    popMatrix();
  }
  
  boolean isActive() {
    return active;
  }
}
