class Heroe{
  
  PImage img;
  int vidas;
  PVector loc;
  float vel, ang;
  float mover = 0;
  ArrayList<Fuego> fuegos;
  int _Clase;
  
  
  public Heroe(int _Clase){
    _Clase = 0;
    //reset();
    fuegos = new ArrayList<Fuego>();
    loc = new PVector();
    vel = 0;
    
    if(_Clase == 1) {
      img = loadImage("Saphira.png");
      vel=1; 
    }
    else if(_Clase == 2) {
      img = loadImage("Eldest.png");
      vel=.75;
    }
     else if(_Clase == 3) {
      img = loadImage("Vervada.png");
      vel=1.25;
     }
  }
  
  void mover(float mov){
  
  mover = mov;
  ang = 180+ mover;
  cx = width*0.25 + cos(radians(ang)) * 200;
  cy = height/2 + sin(radians(ang)) * 200;
  
  imageMode(CENTER);
  image(img, cx, cy);
  
  }
  void dibujar () {
    
    
    
  }
  

}
