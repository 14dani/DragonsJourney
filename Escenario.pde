class Escenario{

  PImage fondo, imgn;
  PVector pos;
  
  public Escenario(PImage bkgrd){
    
    fondo = bkgrd;
  
  }
  
  public Escenario(PImage imagen, PVector posicion){
    
    pos = posicion;
    imgn = imagen;
  
  }
  
  
  void display(){
    background(fondo);
  
  }

}
