class Explosion {
  
  SpriteSheet ani;
  PVector loc;
  boolean active;
  
  public Explosion(PVector _loc) {
    ani = new SpriteSheet("EM_", 7, "png");
    loc = _loc;
    active = true;
    ani.noLoop();
    ani.play();
  }
  
  void dibujar() {
    imageMode(CENTER);
    ani.display(loc.x, loc.y);
    if (ani.isFinished())
      active = false;
  }
  
  boolean isActive() {
    return active;
  }
}
