Particle [] sky;

void setup()
{
  size(500,500);
  background(0);
  sky = new Particle[1000];
  for(int i = 0; i < sky.length; i++)
  {
    sky[i] = new Particle();
    sky[0] = new OddballParticle();
  }
}
void draw()
{
  background(0);
  for(int i = 0; i < sky.length; i++)
  {
    sky[i].show();
    sky[i].move();
  }
}

void mousePressed()
{
  for(int i = 0; i < sky.length; i++)
  {
    sky[0].bob();
    sky[i].show();
    sky[i].move();
    sky[i].reset();
  }
}

class Particle
{
  double myX,myY,mySpeed,myAngle;
  int myColor;
  Particle()
  {
    myX = myY = 250;
    myAngle = Math.random() * 2 * Math.PI;
    mySpeed = Math.random() * 5;
    myColor = color((int)(Math.random() * 256),(int)(Math.random() * 256),(int)(Math.random() * 256));
  }
  void move()
  {
    myX += Math.cos(myAngle) * mySpeed;
    myY += Math.sin(myAngle) * mySpeed;
  }
  void show()
  {
    fill(myColor);
    ellipse((float)myX,(float)myY,5,5);
  }
  void reset()
  {
    myX = myY = 250;
  } 
  void bob()
  {
    myX = 0;
    myY = 250;
  }
}

class OddballParticle extends Particle
{
  OddballParticle()
  {
    myX = 0;
    myY = 250;
    myAngle = 2 * Math.PI;
    mySpeed = Math.random() * 7;
    myColor = color(255);
  }
  void move()
  {
    myX += Math.cos(myAngle) * mySpeed;
    myY += Math.sin(myAngle) * mySpeed;
  }
  void show()
  {
    fill(myColor);
    ellipse((float)myX,(float)myY-5, 16, 20);
    fill(0,255,0); 
    ellipse((float)myX,(float)myY, 30, 12); 
    fill(myColor); 
    ellipse((float)myX,(float)myY-4.6, 16,3);
  }
}
