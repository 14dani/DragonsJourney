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
Escenario escJuego1;
long instant;
int interval;
int sel;

//--------------------------Balas 
ArrayList<Escenario> estrellas;
ArrayList<Fuego> FuegoDragon;
ArrayList<Nube> nubesEsc3;


//__________________________Heroe
Heroe heroe;
float angulo;
char heroeSeleccionado;
Fuego FuegoDragonD;


//___________________________Villano
int tipoVillano;
Villano vlln;

//___________________________Ataques
ArrayList<Ataque> ataques;
long instanteAtaque;
int intervaloAtaque;

//___________________________Explosiones
ArrayList<Explosion> explosiones;
ArrayList<FuegoAnimacion> fuegos;


Nube[] clouds = new Nube[5];




void setup() {
  
  //size(1920,1080);
  fullScreen();
  frameRate(12);
  
  minim = new Minim(this);
  
  playI = minim.loadFile("Arab Ambient (Full).mp3");
  playJ = minim.loadFile("Oriental Arabian Oud.mp3");
  playE = minim.loadFile("Dark Arabic Oriental (Full).mp3");
  escenario = 1;
  interval = 25000;
  instant = millis();
  
  
  //______________________________________________________________________pantalla
  
  escJuego1 = new Escenario(sel);
  escPortada = new Escenario(loadImage("Screenshot (386).png"));
  escIntro = new Escenario(loadImage("Screenshot (382).png"));
  

  
  
  //Fondo de nubes escenario 3____________
  
  for (int index=0; index < clouds.length; index++) {
    println(index);
    clouds[index] = new Nube();
    clouds[index].Nube = loadImage("Nube.png");
  }
  //___________________________________
  
  escSeleccion = new Escenario(loadImage("Escenario-3.png"));
  
  escGameOver = new Escenario(loadImage("Screenshot (385).png"));
  
  
  
  
  //___________________________________Heroe
  heroe = new Heroe();
  heroe.selDragon(1);
  heroeSeleccionado = 'S';
  
  
  //___________________________________Villano
  tipoVillano = 1;
  
  vlln = new Villano(tipoVillano, random(-1, -5), random(-5,0));
  
  ataques = new ArrayList<Ataque>();
  explosiones = new ArrayList<Explosion>();
  fuegos = new ArrayList<FuegoAnimacion>();
  FuegoDragon = new ArrayList<Fuego>();
  
  
}




void escPortada (){
  escPortada.display();
  playE.pause();
  playJ.pause();
  
  playI.play();
  playI.loop();
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

void escJuego(){
  escJuego1.display();
  playI.pause();
  playJ.play();
  //playJ.loop();
    
    
  //_______________________________________________________Estrellas
  //for (int i = 0; i < estrellas.size(); i++){
  //  Escenario tmp = estrellas.get(i);
  //  PVector aux = tmp.getPos();
  //  float d = dist(width/2, height/2, aux.x, aux.y);
  //  float maxDist = dist(0, 0, width/2, height/2);
  //  float tam = map(d,0, maxDist, 5, 40);
    
  //  tmp.dibujarEstrella(tam);
  //  tmp.moverEstrella();
    
  //}
  //_______________________________________________________
    
    
  
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
  

//Ataques de mago a dragon
  for (int x=0; x < ataques.size(); x++){
    Ataque tmp = ataques.get(x);
    tmp.dibujar();
    tmp.mover();
    
    if (heroe.getPosDragon().dist(tmp.getPos()) < 150 && tmp.isPlaying()){
      explosiones.add(new Explosion(tipoVillano, tmp.getPos()));
      tmp.quitar();
      
      heroe.restarVida();
      if(heroe.getVida()==0){
<<<<<<< HEAD
      escenario = 5;
      //  instant = millis();
        //escGameOver();
      //}
=======
        escenario = 5;
        escGameOver();
      }
>>>>>>> parent of 7670310... Cambios
    }
    
    if(!tmp.isPlaying()){
      ataques.remove(x);
    }
  
  }
  
  for (int x=0; x<explosiones.size(); x++) {
        Explosion tmp = explosiones.get(x);
        if (tmp.isActive()) {
          tmp.dibujar();
        }
        else
        explosiones.remove(x);
      }
    
    if (millis() - instanteAtaque > intervaloAtaque) {
    PVector aux = vlln.getPos();
    Ataque nuevo = new Ataque(tipoVillano, aux.x, aux.y);
    ataques.add(nuevo);
    instanteAtaque = millis();
  }
  
  
  //____________________________________________________Villano
  vlln.dibujar();
  vlln.mover();
  
  
  
 // Obtener la posicion del heroe para lanzar fuego
  for (int x=0; x < FuegoDragon.size(); x++){
    Fuego tmp = FuegoDragon.get(x);
    tmp.dibujar();
    tmp.mover();
    
    if (tmp.getPosFuego().dist(vlln.getPos()) < 120 && tmp.isPlaying()){
      fuegos.add(new FuegoAnimacion(heroeSeleccionado, tmp.getPosFuego()));
      tmp.quitar();
      
<<<<<<< HEAD
      vlln.restarVida();
      if(nivel == 1){
        if(vlln.getVida() == 0 && heroe.getVida() > 0){
          nivel = 2;
        }
      }
        
=======
      //heroe.quitarVida();
>>>>>>> parent of 7670310... Cambios
    }
    
    if(!tmp.isPlaying()){
      FuegoDragon.remove(x);
    }
  
  }
  
  for (int x=0; x<fuegos.size(); x++) {
        FuegoAnimacion tmp = fuegos.get(x);
        if (tmp.isActive()) {
          tmp.dibujar();
        }
        else
        fuegos.remove(x);
      }
    
  
  
  //____________________________________________________Heroe
  heroe.moverYdibujo(mouseY, mouseX);
  heroe.getPosDragon();
  
<<<<<<< HEAD
  
  
  
  
  
  //if (vlln.getVida() == 0 ) {
  //  if (cambioNivel == false) {
  //    nivel++;
  //    cambioNivel = true;
  //    intervaloEnemigo -= 400;
  //  }
  //}
  
  
  
  
  //if (nivel < 4) {
  //  for (int x=0; x < ataques.size(); x++){
  //    Ataque tmp = ataques.get(x);
  //    tmp.dibujar();
  //    tmp.mover();
    
  //    if (heroe.getPosDragon().dist(tmp.getPos()) < 150 && tmp.isPlaying()){
  //      explosiones.add(new Explosion(tipoVillano, tmp.getPos()));
  //      tmp.quitar();
        
  //      heroe.restarVida();
  //    //if(heroe.getVida()==0){
  //    //  escenario = 5;
  //    //  instant = millis();
  //      //escGameOver();
  //    //}
  //  }
    
  //  if(!tmp.isPlaying()){
  //    ataques.remove(x);
  //  }
  
  //}
  
  
  ////Explosiones
  //for (int x=0; x<explosiones.size(); x++) {
  //      Explosion tmp = explosiones.get(x);
  //      if (tmp.isActive()) {
  //        tmp.dibujar();
  //      }
  //      else
  //      explosiones.remove(x);
  //    }
      
      
  //    for (int x=0; x < FuegoDragon.size(); x++){
  //  Fuego tmp = FuegoDragon.get(x);
  //  tmp.dibujar();
  //  tmp.mover();
    
  //  if (tmp.getPosFuego().dist(vlln.getPos()) < 120 && tmp.isPlaying()){
  //    fuegos.add(new FuegoAnimacion(heroeSeleccionado, tmp.getPosFuego()));
  //    tmp.quitar();
      
  //    vlln.restarVida();
  //  }
    
  //  if(!tmp.isPlaying()){
  //    FuegoDragon.remove(x);
  //  }
  
  //}
  
  
  ////AnimacionFuego
  //for (int x=0; x<fuegos.size(); x++) {
  //      FuegoAnimacion tmp = fuegos.get(x);
  //      if (tmp.isActive()) {
  //        tmp.dibujar();
  //      }
  //      else
  //      fuegos.remove(x);
  //    }
    
      
      
      
      
    
    
  //    if (nivel == 1) {
  //      if (ataques.size() < 3) {
  //        tipoVillano = 1;
  //        PVector aux = vlln.getPos();
  //        Ataque nuevo = new Ataque(tipoVillano, aux.x, aux.y);
  //        ataques.add(nuevo);
          
  //      }
  //    }
  //    else if (nivel == 2) {
  //      if (ataques.size() < 5) {
  //        tipoVillano = 2;
  //        PVector aux = vlln.getPos();
  //        Ataque nuevo = new Ataque(tipoVillano, aux.x, aux.y);
  //        ataques.add(nuevo);
          
  //      }
  //    }
  //    else if (nivel == 3) {
  //      if (ataques.size() < 6) {
  //        tipoVillano = 3;
  //        PVector aux = vlln.getPos();
  //        Ataque nuevo = new Ataque(tipoVillano, aux.x, aux.y);
  //        ataques.add(nuevo);
          
  //      }
  //    }
      
  //    //instanteAtaque = millis();
  //  }
  
  
  
  
  
  
  
  
=======
>>>>>>> parent of 7670310... Cambios

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
  }
  else if(escenario == 5){
    escGameOver();
  }
}

void keyPressed(){
  if (escenario == 3) {
    if (key == 's' || key == 'S') {
      
      //Nivel 1
      heroeSeleccionado = 's';
      heroe.selDragon(1);
      escJuego1.selEsc(1);
      escenario = 4;
      
      if(nivel==1){
      instanteAtaque = millis();
      intervaloAtaque = 5000;
      }
      
      else if(nivel==2){
      instanteAtaque = millis();
      intervaloAtaque = 2000;
      }
      
      else if(nivel==3){
      instanteAtaque = millis();
      intervaloAtaque = 1000;
      }
      
      
      
    }
    
    if (key == 'E' || key == 'e'){
      heroeSeleccionado = 'e';
      escJuego1.selEsc(2);
      heroe.selDragon(2);
      escenario = 4;
      if(nivel==1){
      instanteAtaque = millis();
      intervaloAtaque = 5000;
      }
      
      if(nivel==2){
      instanteAtaque = millis();
      intervaloAtaque = 2000;
      }
      
      if(nivel==3){
      instanteAtaque = millis();
      intervaloAtaque = 1000;
      }
      
      
      
    }
    if (key == 'V' || key == 'v'){
      
      heroeSeleccionado = 'v';
      heroe.selDragon(3);
      escJuego1.selEsc(3);
      escenario = 4;
      instanteAtaque = millis();
      intervaloAtaque = 5000;
      
      //if(nivel==1){
      //instanteAtaque = millis();
      //intervaloAtaque = 5000;
      //}
      
      //if(nivel==2){
      //instanteAtaque = millis();
      //intervaloAtaque = 2000;
      //}
      
      //if(nivel==3){
      //instanteAtaque = millis();
      //intervaloAtaque = 1000;
      //}
      
      
      
     }
  }
  
  
  if (key == ' ')  {
    if (escenario == 4) {
      //heroe.disparar();
      PVector aux = heroe.getPosDragon();
      Fuego nuevo = new Fuego(heroeSeleccionado,aux.x, aux.y);
      FuegoDragon.add(nuevo);
      println(FuegoDragon.size());
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
    //instanteAtaque = millis();
    //intervaloAtaque = 5000;
  }
  else if(key == '5'){
    escenario = 5;
    instant = millis();
  }
  
  
  
  

}
