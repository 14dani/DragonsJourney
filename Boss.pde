//class Boss {
  
//  PImage img;
//  PVector pos;
//  int vida;
//  long instanteDisparo;
//  int intervaloDisparo;
//  ArrayList<Ataque> ataquesBoss;

//  public Boss() {
//    img = loadImage("boss.png");
//    ataquesBoss = new ArrayList<Ataque>();
//    reset();
//  }
  
//  void reset() {
//    vida = 30;
//    ataquesBoss.clear();
//    instanteDisparo = millis();
//    intervaloDisparo = 1000;
//  }
  
//  void dibujar() {
//    imageMode(CENTER);
//    image(img, width/2, height/2);
//    //pushMatrix();
//    //translate(width/2, height/2);
//    //rotate(radians(angRotacion));
//    //image(img,0,0);
//    //popMatrix();
    
//    //dibuja las balas
//    for (int x=0; x<ataquesBoss.size(); x++) {
//      BalaBoss aux = ataquesBoss.get(x);
//      aux.mover();
//      aux.dibujar();
      
//      if (!aux.isPlaying())
//        ataquesBoss.remove(x);
//    }
//  }
  
//  void mover() {
//    pos.add(vel);  //x += vx; //y += vy;
    
//    if (pos.x <= width*0.75 || pos.x >= width) {
//      vel.x *= -1;
//    }
    
//    if (pos.y <= 0 || pos.y >= height) {
//      vel.y *= -1;
//    }
//  }
  
//  void disparar() {
//    if (millis() - instanteDisparo > intervaloDisparo) {
//      instanteDisparo = millis();
//      if (vida > 15) {
//        float angTmp = random(0,360);
//        BalaBoss nueva1 = new BalaBoss(angTmp);
//        BalaBoss nueva2 = new BalaBoss(angTmp+180);
//        ataquesBoss.add(nueva1);
//        ataquesBoss.add(nueva2);
//      }
//      else {
//        BalaBoss nueva1 = new BalaBoss(random(0,360));
//        BalaBoss nueva2 = new BalaBoss(random(0,360));
//        ataquesBoss.add(nueva1);
//        ataquesBoss.add(nueva2);
//      }
//    }
//  }
  
//  boolean balaJefe(PVector pos) {
//    for (int x=0; x<ataquesBoss.size(); x++) {
//      BalaBoss aux = ataquesBoss.get(x);
//      if (aux.getPos().dist(pos) < 15) {
//        aux.quitarBala();
//        return true;
//      }
//    }
//    return false;
//  }
  
//  void quitarVida() {
//    vida -= 1;
//    intervaloDisparo -= 70;
//  }
  
//  int getVida() {
//    return vida;
//  }
//}
