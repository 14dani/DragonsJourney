class Heroe{
  
  SpriteSheet ani;
  PImage img;
  PVector loc;
  float vel, ang, vida;
  float mover = 0;
  ArrayList<Fuego> fuegos;
  ArrayList<HeroeAnimacion> dragon;
  int _Clase, hechizos;
  boolean active;
  
  
  public Heroe(){
    //_Clase = 2;
    //reset();
    fuegos = new ArrayList<Fuego>();
    dragon = new ArrayList<HeroeAnimacion>();
    loc = new PVector();
    vida = 100;
    hechizos = 0;
    vel = 0;
  }
  
  void selDragon(int _sel) {
    if(_sel == 1) {
      ani = new SpriteSheet("HS_", 10, "png");
      //ani.resize(250,0);
      vel=1; 
    }
    else if(_sel == 2) {
      ani = new SpriteSheet("HE_", 10, "png");
      vel=.75;
    }
     else if(_sel == 3) {
      ani = new SpriteSheet("HV_", 10, "png");
      vel=1.25;
     }
    
    active = true;
    ani.loop();
    ani.play();
   }
  
  
  void moverYdibujo( float _pMouseY, float _pMouseX){
    loc.y = _pMouseY;
    loc.x = _pMouseX;
    pushMatrix();
    imageMode(CENTER);
    ani.display(loc.x, loc.y);
    if (ani.isFinished())
      active = false;
    popMatrix();
    
    //for (int x=0; x<fuegos.size(); x++) {
    //  Fuego aux = fuegos.get(x);
    //  aux.mover();
    //  aux.dibujar();
    //  if (!aux.esValido())
    //    fuegos.remove(x);
    //  }
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
  
  void restarVida() {
   vida-=20; 
  }
  
  
  void resetDrag() {
    vida = 100;
    instanteDisparo = millis();
    intervaloDisparo = 5000;
  }

}
