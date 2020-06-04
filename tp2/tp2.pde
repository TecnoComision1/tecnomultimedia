PImage capa, afiche;
PFont texto;
int py;
float px1, px2;
float opaco;
int tapa;
int aficheX, ubicTitulo;
int valorCapa = 255;
int castX;
int ancho = 200;
int alto = 100;
void setup() {
  size(400, 600);
  surface.setTitle("MEMENTO");
  capa = loadImage("capa.png");
  afiche = loadImage("Afiche.jpg");
  aficheX = width/2;
  ubicTitulo = width/2;
  texto = loadFont("GillSans.vlw");
  textFont(texto, 30);
  imageMode(CENTER);

  opaco = 254;
  noLoop();
  mouseX = width/2;
  mouseY = height/2;
  noCursor();
  //cursor(HAND);
  // cursor(CROSS);
  background(0);
}
void draw() {
  background(0);
  musica();
  cast();
  direccion();
  tint(200, 160, 80);
  image(afiche, aficheX, height/2, width, height);

  opaco = opaco % 255;
  opaco ++;
  fill(0, opaco);
  noStroke();
  ellipse(mouseX, mouseY-50, ancho, alto);
  tint(255, valorCapa);
  image(capa, mouseX, mouseY);
  py ++;
  castX -= 0.5;

  println(castX);

  textSize(120);
  float opaco = map(frameCount, 0, 240, 0, 200);
  fill(170, 67, 27, opaco);
  textAlign(CENTER);
  text("memento", ubicTitulo, 100);
}
void mousePressed() {
  loop();
}

void keyPressed() {
  background(0);
  aficheX = - width;
  ubicTitulo = - 200;
  valorCapa = 0;
  castX = 500;
  py = - 600;
  ancho = 0;
  alto = 0;
  px1 = 38500;
  px2 = 38000;
}

void direccion() {
  fill(250, 160, 20);
  textSize(60);
  textAlign(LEFT);
  text("Dirección ", px1+50, height/2-60);
  text("Christopher Nolan ", px2+50, height/2);
  px1 = px1/1.004;
  px1-= 0.1;
  px2 = px2/1.003;
  px2-= 0.1;
}

void musica() {
  float opaco = map(py, -50, height, 0, 250);
  fill(250, 160, 20, opaco);
  textSize(60);
  textAlign(LEFT);
  text("Música ", 50, py);
  text("David Julyan ", 50, py+60);
}

void cast() {
  float tono = map(castX, 500, -40, 250, 0);
  textSize(60);
  fill(250, 160, 20, tono);
  text(" Guy Pearce \n Carrie-Anne Moss \n Joe Pantoliano  ", castX, 220);
}
