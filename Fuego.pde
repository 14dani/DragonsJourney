class Fuego {
  
  PImage imgFuego;
  PVector loc,vel, velS, velE, velV;
  boolean Valido;
  float dif, dmg;
  int _clase;
  boolean isAlive;
  
  float r;
 
  
  
  public Fuego(char var, float x, float y) {
    loc = new PVector (x+120, y-46);
    r=0;
    isAlive = true;
    
    
    if (var == 's'){
      imgFuego = loadImage("Hechizo-Saphira.png");
      imgFuego.resize(57, 57);
      vel = new PVector (1, 0);
      dmg = 1;
    }
    else if(var == 'e'){
      imgFuego = loadImage("Hechizo-Eldest.png");
      imgFuego.resize(57, 57);
      vel = new PVector (.75, 0);
      dmg= 1.5;
    }
    else if(var == 'v'){
      imgFuego = loadImage("Hechizo-Vervada.png");
      imgFuego.resize(57, 57);
      vel = new PVector (1.5, 0);
      dmg = .75;
    }
    
    
  }
  
  
  //void selFuegos(int _sel) {
  //  if(_sel == 1) {
  //    imgFuego = loadImage("Hechizo-Saphira.png");
  //    vel = velS;
  //    dmg = 1;
  //  }
  //  else if(_sel == 2) {
  //    imgFuego = loadImage("Hechizo-Eldest.png");
  //    vel = velE;
  //    dmg= 1.5;
  //  }
  //   else if(_sel == 3) {
  //    imgFuego = loadImage("Hechizo-Vervada.png");
  //    vel = velV;
  //    dmg = .75;
  //   }
  // }
  
  
  
  void dibujar () {
    //float escala = map(radio, dif, 0, 1, 0);
    //noStroke();
    //fill(#5b5b5b);
    //pushMatrix();
    //translate(loc.x, loc.y);
    //scale(escala);
    //circle(0,0,5);
    //popMatrix();
  
  pushMatrix();
  translate(loc.x, loc.y);
  rotate(radians(r));
  imageMode(CENTER);
  image(imgFuego, 0, 0);
  popMatrix();
  r+=7;
  
  
  }
  
  
  void mover() {
    loc.add(vel);
    if (dist(loc.x, loc.y, width/2, height/2) < 20)
      Valido = false;
    
    if (dist(loc.x, loc.y, width/2, height/2) < 20)
      Valido = false;
    }
    
  boolean isPlaying() {
    return isAlive;
  }
  
  void quitar() {
    isAlive = false;
  } 
    
  
  PVector getPosFuego() {
   return loc;
  }
  
  
  
  
  
  
  
  
}
