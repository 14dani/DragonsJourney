class Escenario{

  PImage fondo, img;
  PVector pos1, pos, vel;
  
  public Escenario(){
    pos =  new PVector(width/2, height/2);
    vel = new PVector(-10,10);
  
  }
  
  public Escenario(PImage bkgrd){
    //  if(_sel == 1) {
    //  fondo = loadImage("Saphira.png");
    //}
    //else if(_sel == 2) {
    //  fondo = loadImage("Eldest.png");

    //}
    // else if(_sel == 3) {
    //  fondo = loadImage("Vervada.png");
    // }
       
    fondo = bkgrd;
    fondo.resize(width,height);
  }
  
  //public Escenario(int sel){
  //  //if(sel == 1) {
  //  //  img = loadImage("Escenario- 8.png");
  //  //  img.resize(width,height);
      

  //  //}
  //  //else if(sel == 2) {
  //  //  img = loadImage("escenario--6.png");
  //  //  img.resize(width,height);
      

  //  //}
  //  // else if(sel == 3) {
  //  //  img = loadImage("Escenario- 7.png");
  //  //  img.resize(width,height);
      

  //  // }
       
  
  //}
  
  //Constructor para elementos
  public Escenario(PImage imagen, PVector posicion){ 
    pos1 = posicion;
    img = imagen;
  }
  
  
  void selEsc(int _sel) {
    if(_sel == 1) {
      img = loadImage("Escenario- 8.png");
      img.resize(width,height);
      

    }
    else if(_sel == 2) {
      img = loadImage("escenario--6.png");
      img.resize(width,height);
      

    }
     else if(_sel == 3) {
      img = loadImage("Escenario- 7.png");
      img.resize(width,height);
      

     }
    fondo = img;
    fondo.resize(width,height);
    
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
