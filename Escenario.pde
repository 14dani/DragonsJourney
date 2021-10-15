class Escenario{

  PImage fondo, imgn;
  PVector pos1, pos, vel;
  
  public Escenario(){
    pos =  new PVector(width/2, height/2);
    vel = new PVector(-10,10);
  
  }
  
  public Escenario(PImage bkgrd){
    
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
