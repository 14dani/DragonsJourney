class Fuego {
  
  PImage imgFuego;
  PVector loc;
  boolean Valido;
  float dif, vel, dmg;
  int _clase;
 
  
  
  public Fuego() {
    loc = new PVector(_clase,((height/10)-height));
    Valido = true;
    
  }
  void selFuego(int _sel) {
    if(_sel == 1) {
      imgFuego = loadImage("Hechizo-Saphira.png");
      vel=1;
      dmg = 1;
    }
    else if(_sel == 2) {
      imgFuego = loadImage("Hechizo-Eldest.png");
      vel=.75;
      dmg= 1.5;
    }
     else if(_sel == 3) {
      imgFuego = loadImage("Hechizo-Vervada.png");
      vel=1.25;
      dmg = .75;
     }
    
    
  }
  
  void dibujar () {
    //float escala = map(radio, dif, 0, 1, 0);
    //noStroke();
    //fill(#5b5b5b);
    //pushMatrix();
    //translate(loc.x, loc.y);
    //scale(escala);
    //circle(0,0,5);
    //popMatrix();
  imageMode(CENTER);
  image(imgFuego, loc.x, loc.y);
  }
   void mover() {
    loc.x += vel;
    loc.y = height/2;
    
    if (dist(loc.x, loc.y, width/2, height/2) < 20)
      Valido = false;
  
   
   if (dist(loc.x, loc.y, width/2, height/2) < 20)
      Valido = false;
    
  }
  PVector getPosFuego() {
   return loc;
  }
  
  void quitarFuego() {
   Valido = false; 
    
  }
  
  boolean esValido(){
   return Valido;
  }
  
  
  
}
