import ddf.minim.*;

Minim minim;
AudioPlayer playI;
AudioPlayer playJ;
AudioPlayer playE;
AudioSample playPauseB;
//--------------------------------variables

int intervaloDisparo;
long instanteDisparo;

int intervaloDificultad;
long instanteDificultad;

float velocidadEnemigo;
int level;

int escenario;
Escenario escPortada;
Escenario escIntro;
Escenario escSeleccion;
Escenario escGameOver;
Escenario escJuego;
long instant;
int interval;
int sel;

//--------------------------Balas 
ArrayList<Escenario> estrellas;
ArrayList<Fuego> FuegoDragon;



Heroe heroe;
float angulo;

Villano vlln, vlln1;



void setup() {
  
  //size(1920,1080);
  fullScreen();
  
  minim = new Minim(this);
  
  playI = minim.loadFile("Arab Ambient (Full).mp3");
  playJ = minim.loadFile("Oriental Arabian Oud.mp3");
  playE = minim.loadFile("Dark Arabic Oriental (Full).mp3");
  escenario = 1;
  interval = 25000;
  
  
  //______________________________________________________________________pantalla
 
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
  
  heroe = new Heroe(3);
  
  
  
  vlln = new Villano(int(random(0,4)), 0, -4);
  vlln1 = new Villano(int(random(0,4)));
  
  escSeleccion = new Escenario(loadImage("Screenshot (384).png"));
  
  escGameOver = new Escenario(loadImage("Screenshot (385).png"));
}




void escPortada (){
  escPortada.display();
  playE.pause();
  playJ.pause();
  
  playI.play();


}

void escIntro (){
  //botones de seguir
}

void escSeleccion (){
  // investigar lo de la selección de personaje 
  sel = 0;

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
    
    //_______________________________________________________Estrellas
    for (int i = 0; i < estrellas.size(); i++){
      Escenario tmp = estrellas.get(i);
      PVector aux = tmp.getPos();
      float d = dist(width/2, height/2, aux.x, aux.y);
      float maxDist = dist(0, 0, width/2, height/2);
      float tam = map(d,0, maxDist, 5, 40);
      
      tmp.dibujarEstrella(tam);
      tmp.moverEstrella();
      //_______________________________________________________
    }
  
    heroe.moverYdibujo(mouseY, mouseX);
    heroe.getPosDragon();
    heroe.getVida();
    text("vidas : " + heroe.getVida(), width/7, 30);
    
    vlln.mover();
    
    //vlln1.movimientoSemicircular();
    //------------------- funciones que se relacionana con mago x dragon
    //If vida de mago es == 0 
    //float ganarHechizo() 
    //-------------------------- función para restar vida si el poder del mago le pega al dragon
    //if (aux.getPosBalaMago().dist(heroe.getPosDragon()) <= 20) {
    //      if (aux.getValidaMago()) {
    //        heroe.restarVida();
    //        aux.quitarBala();
    //      //  playerDeath.trigger();
    //      }
    //    } 
    
  

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
  if (escenario == 3) {
    if (key == 's' || key == 'S') {
      sel = 1;
    }
    if (key == 'E' || key == 'e'){
      sel = 2;
    }
    if (key == 'V' || key == 'v'){
      sel = 3;
     }
  }
  if (key == ' ')  {
    if (escenario == 4 ||escenario == 5 || escenario == 6) {
      if (millis() - instanteDisparo > intervaloDisparo) {
        instanteDisparo = millis();
        Fuego nuevo = new Fuego(1);
        FuegoDragon.add(nuevo);
        //disparo.trigger();
      }
    } 
  }
  
  
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
