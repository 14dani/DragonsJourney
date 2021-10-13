int escenario;
Escenario escPortada;
Escenario escIntro;
Escenario escFinal;
PImage bkgrd1, bkgrd2, bkgrd3;
float angulo;

Heroe heroe;

//cambio12

void setup() {
  
  //size(1920,1080);
  fullScreen();
  escenario = 1;
  
  //bkgrd1 = loadImage("Screenshot (381).png");
  //escPortada = new Escenario(bkgrd1);
  
  //bkgrd2 = loadImage("Screenshot (382).png");
  //escIntro = new Escenario(bkgrd2);
  
  //bkgrd3 = loadImage("Screenshot (383).png");
  //escFinal = new Escenario(bkgrd3);
  
  //pantalla
 
  escPortada = new Escenario(loadImage("Screenshot (381).png"));
 
  escIntro = new Escenario(loadImage("Screenshot (382).png"));
  
  escFinal = new Escenario(loadImage("Screenshot (382).png"));
  
  heroe = new Heroe();


}

void draw() {
  
   
  
  if(escenario == 1){
    escPortada.display();
  }
  
  else if(escenario == 2){
    escIntro.display();
  }
  
  else if(escenario == 3){
    escFinal.display();
    heroe.mover(angulo);
    
  }


}



void keyPressed(){
  if(key == '1'){
    escenario = 1;
  }
  else if(key == '2'){
    escenario = 2;
  }
  else if(key == '3'){
    escenario = 3;
  }
  
  
  if(key == CODED){
    if(keyCode == LEFT){
      angulo += 4;
    }
    else if(keyCode == RIGHT){
      angulo -= 4;
    
    }
  }
  

}
