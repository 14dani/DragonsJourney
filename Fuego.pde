class Fuego {
  
  PImage img;
  PVector loc;
  float angulo;
  float radio;
  boolean isLit;
  float dif;
  
  
  public Fuego(float _ang, float _rad) {
    angulo = _ang;
    loc = new PVector();
    radio = _rad;
    dif = radio;
    isLit = true;
  }
  
  void dibujar () {
    float escala = map(radio, dif, 0, 1, 0);
    noStroke();
    fill(#5b5b5b);
    pushMatrix();
    translate(loc.x, loc.y);
    scale(escala);
    circle(0,0,5);
    popMatrix();
  }
  
  
  
  
  
  
  
}
