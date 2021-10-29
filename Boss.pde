class Boss{

  PImage imagenBoss;
  PVector pos;
  PVector vel;
  int tipoMago, hechizos;
  float vida, ang, angulo, cx, cy;
  SpriteSheet ani;
  boolean active;
  long instanteAnimacion;
  int period;
  
  
  
  public Boss(){
    
    pos = new PVector (random(width*0.75, width), random(0, height));
    vel = new PVector(-2, -2);
    
    period = 1000;
    
    
    //fuegos = new ArrayList<Fuego>();
    
    vida = 300;
    hechizos = 0;
    imagenBoss = loadImage("boss.png");

  
  }
  
  void dibujar() {
    
    imageMode(CENTER);
    image(imagenBoss, pos.x, pos.y);
    textSize(15);
    fill(255);
    textAlign(RIGHT);
    text("HP: "+vida+"%", width-20,20);
    
  }
  
  
  //___________________Movimiento Aleatoria(x,y) y De Arriba a Abajo(0, y)
  void mover() {
    pos.add(vel);  //x += vx; //y += vy;
    
    if (pos.x <= width*0.75 || pos.x >= width) {
      vel.x *= -1;
    }
    
    if (pos.y <= 0 || pos.y >= height) {
      vel.y *= -1;
    }
    
   
    
    
    
  }
  
  // ___________ funciones 
  
  PVector getPos() {
    return pos;
  }
  
  float getVida() {
   return vida; 
  }
  
  void restarVida() {
   vida-=15; 
  }
  
  
  void resetBoss() {
    vida = 300;
    instanteDisparo = millis();
    intervaloDisparo = 1000;
  }
  

}
