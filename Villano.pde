class Villano{

  PImage imagenMago;
  PVector pos;
  PVector vel;
  int tipoMago, hechizos;
  float vida, ang, angulo, cx, cy;
  ArrayList<Fuego> fuegos;
  SpriteSheet ani;
  boolean active;
  long instanteAnimacion;
  int period;
  
  
  
  public Villano (int tipo, float velx, float vely){
    
    pos = new PVector (random(width*0.75, width), random(0, height));
    vel = new PVector(velx, vely);
    instanteAnimacion = millis();
    period = 5000;
    
    
    //fuegos = new ArrayList<Fuego>();
    
    vida = 100;
    hechizos = 0;
    
    if(tipo == 1) {
      ani = new SpriteSheet("MR1_", 12, "png");
    }
    else if(tipo == 2) {
      ani = new SpriteSheet("MM1_", 12, "png");
    }
     else if(tipo == 3) {
      ani = new SpriteSheet("MC1_", 12, "png");;
    }
    
    
    //active = true;
    //ani.noLoop();
    //ani.play();
      
    
    
  
  }
  
  void dibujar() {
    active = true;
    
    if (millis() - instanteAnimacion > period) {
      
      ani.noLoop();
      ani.play();
      instanteAnimacion = millis();
    }
    
    pushMatrix();
    imageMode(CENTER);
    ani.display(pos.x, pos.y);
    if (ani.isFinished())
      active = false;
    popMatrix();
  }
  
  
  //_____________________________________________________Movimiento Aleatoria(x,y) y De Arriba a Abajo(0, y)
  void mover() {
    pos.add(vel);  //x += vx; //y += vy;
    
    if (pos.x <= width*0.75 || pos.x >= width) {
      vel.x *= -1;
    }
    
    if (pos.y <= 0 || pos.y >= height) {
      vel.y *= -1;
    }
    
    //imageMode(CENTER);
    //image(imagenMago, pos.x, pos.y);
    
    textSize(15);
      fill(255);
      textAlign(RIGHT);
      text("HP: "+vida+"%", 20,20);
    
  }
  
  // _____________________________ funciones 
  
  PVector getPos() {
    return pos;
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
