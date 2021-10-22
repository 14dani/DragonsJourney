import ddf.minim.*;

Minim minim;
AudioPlayer playI;
AudioPlayer playJ;
AudioPlayer playE;
AudioSample playPauseB;

int escenario;
Escenario escPortada;
Escenario escIntro;
Escenario escSeleccion;
Escenario escGameOver;
Escenario escJuego;
long instant;
int interval;
int Sel;

ArrayList<Escenario> estrellas;



Heroe heroe;
Heroe heroe1;
float angulo;



void setup() {
  
  //size(1920,1080);
  fullScreen();
  
  minim = new Minim(this);
  
  playI = minim.loadFile("Arab Ambient (Full).mp3");
  playJ = minim.loadFile("Oriental Arabian Oud.mp3");
  playE = minim.loadFile("Dark Arabic Oriental (Full).mp3");
  escenario = 1;
  interval = 25000;
  
  
  //pantalla
 
  escPortada = new Escenario(loadImage("Screenshot (386).png"));
 
  escIntro = new Escenario(loadImage("Screenshot (382).png"));
  
  escJuego = new Escenario(loadImage("escenario--6.png"));
  
  //Fondo de estrellas____________
  estrellas = new ArrayList<Escenario>();
  
  for (int i = 0; i < 10; i++){
    Escenario nuevo =  new Escenario();
    estrellas.add(nuevo);
  }
  //___________________________________
  
  heroe = new Heroe(int _Sel);
  heroe1 = new Heroe(int _Sel);
  
  escSeleccion = new Escenario(loadImage("Screenshot (384).png"));
  
  escGameOver = new Escenario(loadImage("Screenshot (385).png"));
}

void escPortada (){
  escPortada.display();
  playE.pause();
  playJ.pause();
  
  playI.play();
  // poner 2 botones, 
  //uno que lleve a la selección de personaje y luego al juego
  // otro que nos lleve a la historia

}

void escIntro (){
  //botones de seguir
}

void escSeleccion (){
  // investigar lo de la selección de personaje 
}

void escGameOver (){
  escGameOver.display();
  playJ.pause();
  playI.pause();
  playE.play();
  if (millis () - instant > interval) {
    playE.pause();
    escenario = 1;
    
  }
}

void escJuego() {
    escJuego.display();
    playI.pause();
    playJ.play();
    for (int i = 0; i < estrellas.size(); i++){
    
    Escenario tmp = estrellas.get(i);
    PVector aux = tmp.getPos();
    float d = dist(width/2, height/2, aux.x, aux.y);
    float maxDist = dist(0, 0, width/2, height/2);
    float tam = map(d,0, maxDist, 5, 40);
    
    tmp.dibujarEstrella(tam);
    tmp.moverEstrella();
  }
  
    heroe1.mover(angulo);
    
  
}




void draw() {
  
  if(escenario == 1){
    escPortada();
  }
  
  else if(escenario == 2){
    escIntro.display();
  }
  else if(escenario == 3){
    escSeleccion.display();
  }
  else if(escenario == 4){
    escJuego();
    //background(0);

  }
  else if(escenario == 5){
    escGameOver();
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
   else if(key == '4'){
    escenario = 4;
  }
  else if(key == '5'){
    escenario = 5;
    instant = millis();
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
