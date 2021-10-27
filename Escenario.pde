class Escenario{

  PImage fondo, imgn;
  PVector pos1, pos, vel;
  
  public Escenario(){
    pos =  new PVector(width/2, height/2);
    vel = new PVector(-10,10);
  
  }
  void selEsc(int _sel) {
    if(_sel == 1) {
      imgn = loadImage("Escenario 6.png");

    }
    else if(_sel == 2) {
      imgn = loadImage("Escenario 7.png");

    }
     else if(_sel == 3) {
      imgn = loadImage("Escenario 8.png");

     }
    
    
  }
  
  public Escenario(PImage bkgrd)
    //  if(_sel == 1) {
    //  fondo = loadImage("Saphira.png");
    //}
    //else if(_sel == 2) {
    //  fondo = loadImage("Eldest.png");

    //}
    // else if(_sel == 3) {
    //  fondo = loadImage("Vervada.png");
    // }
    {   
    fondo = bkgrd;
    fondo.resize(width,height);
  }
  
  //Constructor para elementos
  public Escenario(PImage imagen, PVector posicion){
    
    pos1 = posicion;
    imgn = imagen;
  
  }
  
  //Función para fondo
  void display(){
    background(fondo);
  }
  
  
  //Escenario Estrellas___________________
  void dibujarEstrella(float tam){
    fill(255);
    noStroke();
    ellipse(pos.x, pos.y, tam, tam);
  
  }
  
  void moverEstrella() {
    pos.add(vel);
    if (pos.x < 0 || pos.x > width || pos.y < 0 || pos.y > height) {
      
      pos.set(random((width/2)-3,(width/2)+3),random((height/2)-3,(height/2)+3));
      vel.set(random(-4,4), random(-4,4));
      
    }
  }
  
  void setPos(PVector posicion){
    pos = posicion;
  }
  
  PVector getPos() {
    return pos;
  }
  
  //_______________________________________________
  

}
