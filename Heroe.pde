class Heroe{
  
  PImage img;
  PVector loc;
  float vel, ang, vida;
  float mover = 0;
  ArrayList<Fuego> fuegos;
  int _Clase, hechizos;
  
  
  public Heroe(){
    //_Clase = 2;
    //reset();
    
    fuegos = new ArrayList<Fuego>();
    loc = new PVector();
    vida = 100;
    hechizos = 0;
    vel = 0;
    
    
  }
  
  void selDragon(int _sel) {
    if(_sel == 1) {
      img = loadImage("Saphira.png");
      vel=1; 
    }
    else if(_sel == 2) {
      img = loadImage("Eldest.png");
      vel=.75;
    }
     else if(_sel == 3) {
      img = loadImage("Vervada.png");
      vel=1.25;
     }
   }
  
  
  void moverYdibujo( float _pMouseY, float _pMouseX){
  
  loc.y = _pMouseY;
  loc.x = _pMouseX;
  
  imageMode(CENTER);
  image(img, loc.x, loc.y);
  
  
  for (int x=0; x<fuegos.size(); x++) {
      Fuego aux = fuegos.get(x);
      aux.mover();
      aux.dibujar();
      
      if (!aux.esValido())
        fuegos.remove(x);
    }
     textSize(15);
    fill(255);
    textAlign(LEFT);
    text("HP: "+vida+"%", 20,20);
    
  
  }
  void disparar() {
    //Fuego nueva = new Fuego(1);
    //fuegos.add(nueva);
  }
  
  
  //-------- falta la pos del villano
  boolean fuegoEnemigo(PVector posEnemigo) {
    for (int x=0; x<fuegos.size(); x++) {
      Fuego aux = fuegos.get(x);
      if (aux.getPosFuego().dist(posEnemigo) < 15) {
        fuegos.remove(x);
        return true;
      }
    }
    return false;
  }
  
  
  void setPos(PVector posicion) {
    loc = posicion;
  }
  PVector getPosDragon() {
    return loc;
  }
  
  float getVida() {
   return vida; 
  }
  
  float restarVida() {
   return vida-20; 
  }
    float ganarHechizo() {
   return hechizos; 
  }
  
  void resetDrag() {
    vida = 100;
    hechizos = 0;
  }

}
