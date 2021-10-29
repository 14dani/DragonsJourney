class Explosion {
  
  SpriteSheet ani;
  PVector loc;
  boolean active;
  
  public Explosion(int tipo, PVector _loc) {
    
    if(tipo == 1) {
      ani = new SpriteSheet("ER_", 7, "png");
    }
    else if(tipo == 2) {
      ani = new SpriteSheet("EM_", 7, "png");
    }
     else if(tipo == 3) {
      ani = new SpriteSheet("EC_", 7, "png");
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
