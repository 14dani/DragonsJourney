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
