class Villano{

  PImage imagenMago;
  PVector pos;
  PVector vel;
  int tipoMago, hechizos;
  float vida, ang, angulo, cx, cy;
  ArrayList<Fuego> fuegos;
  
  
  
  public Villano (int tipo, float velx, float vely){
    
    pos = new PVector (random(width*0.75, width), random(0, height));
    vel = new PVector(velx, vely);
    
    //fuegos = new ArrayList<Fuego>();
    
    vida = 100;
    hechizos = 0;
    
    
    if(tipo == 1) {
      imagenMago = loadImage("MagoRojo.png");
      
    }
    else if(tipo == 2) {
      imagenMago = loadImage("MagoMorado.png");
      
    }
     else if(tipo == 3) {
      imagenMago = loadImage("MagoCyan.png");
      
     }
  
  }
  
  public Villano (int tipo){
    
    pos = new PVector (width*0.75, height/2);
    //vel = new PVector(1.8, 1.8);
    
    //fuegos = new ArrayList<Fuego>();
    
    vida = 100;
    hechizos = 0;
    
    
    if(tipo == 1) {
      imagenMago = loadImage("MagoRojo.png");
      
    }
    else if(tipo == 2) {
      imagenMago = loadImage("MagoMorado.png");
      
    }
     else if(tipo == 3) {
      imagenMago = loadImage("MagoCyan.png");
      
     }
  
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
    
    imageMode(CENTER);
    image(imagenMago, pos.x, pos.y);
  }
  
  
  //_____________________________________________________Movimiento SemiCircular
  //void movimientoSemicircular(){
    
    
  //  ang = 180;
  //  if(ang >= 180){
  //    angulo = ang +=4;
  //  }
  //  else if(ang >= 270){
  //    angulo = ang -=4;
  //  }
    
  //  cx = pos.x + cos(radians(angulo)) * 250;
  //  cy = pos.y + sin(radians(angulo)) * 250;
  //  imageMode(CENTER);
  //  image(imagenMago, cx, cy);
  
  //}
  


}