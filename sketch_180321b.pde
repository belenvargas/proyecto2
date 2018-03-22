PImage sp;
PImage su;
PImage au;
PImage wi;

PImage bskt;

PImage fl;

import shiffman.box2d.*;
import org.jbox2d.collision.shapes.*;
import org.jbox2d.common.*;
import org.jbox2d.dynamics.*;

Box2DProcessing box2d;

ArrayList<Boundary> boundaries;
ArrayList<Box> boxes;

int screen = 1;

float point = 1;  //CAMBIAR POR CONTADOR: ATRAPADAS
String trap="Atrapadas: ";

float miss = 1;  //CAMBIAR POR CONTADOR: CAIDAS
String fall="Caídas: ";


int delayTime;
int creationTime;
int currentIndex;

Title box1;
Win1 box2;
Win2 box3;
Win3 box4;
Lose box5;
Final box6;

void setup()
{
  size(600, 600, P2D);
  
  sp = loadImage("sp.png");
  su = loadImage("su.png");
  au = loadImage("au.png");
  wi = loadImage("wi.png");
  
  bskt= loadImage("bskt.png");
  
  fl = loadImage("fl.png");
  
  box2d = new Box2DProcessing(this);
  box2d.createWorld();
  box2d.setGravity(0, -15);
  
  boxes = new ArrayList<Box>();
  boundaries = new ArrayList<Boundary>();
  
  box1 = new Title( "LAS CUATRO ESTACIONES", 20, 20, 100);
  box2 = new Win1("¡GANASTE! AHORA LLEGA EL VERANO", 20, 20, 100);
  box3 = new Win2("¡GANASTE! YA COMIENZAN A CAER LAS HOJAS", 20, 20, 100);
  box4 = new Win3("¡GANASTE! ¡MIRA LA NIEVE!", 20, 20, 100);
  box5 = new Lose("Has perdido", 20,20,100);
  box6 = new Final("HAS GANADO EL JUEGO DE LAS CUATRO ESTACIONES", 20, 20, 100);
  
  boundaries.add(new Boundary(0,0,5,1500));
  boundaries.add(new Boundary(width,0,5,1500));
  
}

void draw()
{
  
  if(screen == 1) //TITULO
  {
    background(0);
    box1.draw();
    pressSpace();
  }
  
   if(screen == 2) //PRIMAVERA
  {
    background(sp);
    image(bskt,mouseX,height-50);
    
    box2d.step();

    if (random(5) < 0.015) 
    {
      Box p = new Box(width/2,30);
      boxes.add(p);
    }

    for (Boundary wall: boundaries) 
    {
      wall.display();
    }

    for (Box b: boxes) 
    {
      b.display();
      
    }
  
    for (int i = boxes.size()-1; i >= 0; i--) 
    {
      Box b = boxes.get(i);
      
      if (b.done()) 
      {
        boxes.remove(i);
      }
    }
    
    
     
    if(point>=5)
    {
      screen=screen+1;
    }
    
    if(miss>=5)
    {
      screen=screen+5;
    } 
  }
  
  if(screen == 3) //CARGA
  {
    background(0);
    box2.draw();
    point=0;
    miss=0;
  }
  
  if(screen == 4) //VERANO
  {
    background(su);
    image(bskt,mouseX,height-50);
    
    box2d.step();
    
    fill(255,165,0);
    boundaries.add(new Boundary(width/4+100,150,35,10));
    boundaries.add(new Boundary(3*width/4-75,300,45,10));

    if (random(4.5) < 0.015) 
    {
      Box p = new Box(width/2,30);
      boxes.add(p);
    }

    for (Boundary wall: boundaries) 
    {
      wall.display();
    }

    for (Box b: boxes) 
    {
      b.display();
    }
  
    for (int i = boxes.size()-1; i >= 0; i--) 
    {
      Box b = boxes.get(i);
      
      if (b.done()) 
      {
        boxes.remove(i);
      }
    }
    
    if(point>=5)
    {
      screen=screen+1;
    }
    
    if(miss>=5)
    {
      screen=screen+5;
    }
  }
  
  if(screen == 5) //CARGA
  {
    background(0);
    box3.draw();
    point=0;
    miss=0;
  }
  
  if(screen == 6) //OTOÑO
  {
    background(au);
    image(bskt,mouseX,height-50);

    box2d.step();
    
    fill(222,184,135);
    boundaries.add(new Boundary(width/4,height-300,60,10));
    boundaries.add(new Boundary(3*width/4,height-200,100,10));
    boundaries.add(new Boundary(width/3,height/6,35,10));

    if (random(4) < 0.015) 
    {
      Box p = new Box(width/2,30);
      boxes.add(p);
    }

    for (Boundary wall: boundaries) 
    {
      wall.display();
    }

    for (Box b: boxes) 
    {
      b.display();
    }
  
    for (int i = boxes.size()-1; i >= 0; i--) 
    {
      Box b = boxes.get(i);
      
      if (b.done()) 
      {
        boxes.remove(i);
      }
    }
    
    if(point>=5)
    {
      screen=screen+1;
    }
    
    if(miss>=5)
    {
      screen=screen+5;
    }
  }
  
  if(screen == 7) //CARGA
  {
    background(0);
    box4.draw();
    point=0;
    miss=0;
  }
  
  if(screen == 8) //INVIERNO
  {
    background(wi);
    image(bskt,mouseX,height-50);

    box2d.step();
    
    fill(0,191,255);
    boundaries.add(new Boundary(width/4,height-300,60,10));
    boundaries.add(new Boundary(3*width/4,height-200,100,10));
    boundaries.add(new Boundary(width/3,height/6,35,10));
    boundaries.add(new Boundary(width/2,height-150,60,10));

    if (random(3) < 0.015) 
    {
      Box p = new Box(width/2,30);
      boxes.add(p);
    }

    for (Boundary wall: boundaries) 
    {
      wall.display();
    }

    for (Box b: boxes) 
    {
      b.display();
    }
  
    for (int i = boxes.size()-1; i >= 0; i--) 
    {
      Box b = boxes.get(i);
      
      if (b.done()) 
      {
        boxes.remove(i);
      }
    }
    
    
    
    if(point>=5)
    {
      screen=screen+1;
    }
    
    if(miss>=5)
    {
      screen=screen+5;
    }
  }
  
  if(screen == 9) //GANAR JUEGO
  {
    background(0);
    box6.draw();
  }
  
  if (screen == 10)
  exit();
  
  if(screen == 11) 
  {
    background(0);
    box6.draw();
    loseAgainst();
  }
}


void pressSpace(){
  fill(255);
  text("Press SPACE to play", width/4+71, height/2+25);
}



void finalBattle(){
  fill(255);
  text("¡HAS LLEGADO A LA ÚLTIMA ESTACIÓN", width/4+52, height/2+25);
}

void loseAgainst(){
  fill(255);
  text("PERDISTE EL JUEGO, PRESIONA 'R' PARA JUGAR OTRA VEZ", width/4+27, height/2+25);
  if(key == 'r') {
    screen = 1;
    }
   point=0;
   miss=0;
}

void keyPressed( ) 
{
  screen = min(screen + 1, 11);
} 
