class Fuego {
  
  PImage imgFuego;
  PVector loc,vel, velS, velE, velV;
  boolean Valido;
  float dif, dmg;
  int _clase;
 
  
  
  public Fuego(PImage imagen, float x, float y) {
    loc = new PVector (x, y);
    velS = new PVector (1, 1);
    velE = new PVector (.75, .75);
    velV = new PVector (1.5, 1.5);
    imgFuego = imagen;
    
  }
  void selFuegos(int _sel) {
    if(_sel == 1) {
      imgFuego = loadImage("Hechizo-Saphira.png");
      vel = velS;
      dmg = 1;
    }
    else if(_sel == 2) {
      imgFuego = loadImage("Hechizo-Eldest.png");
      vel = velE;
      dmg= 1.5;
    }
     else if(_sel == 3) {
      imgFuego = loadImage("Hechizo-Vervada.png");
      vel = velV;
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
    loc.add(vel);
    
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
