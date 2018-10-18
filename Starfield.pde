Particle[] stars;
void setup(){
  size(800, 800);
  stars = new Particle[500];
  for(int i = 0; i < stars.length; i++){
    stars[i] = new NormalParticle();
  }
  stars[0] = new OddBall();
  stars[1] = new JumboParticle();
}

void draw(){
  background(0);
  for(int i = 0; i < stars.length; i++){
    stars[i].show();
    stars[i].move();
  }
}

interface Particle{
  public void show();
  public void move();
}

class NormalParticle implements Particle{
  protected double myX, myY, dSpeed, dDirection, mySize;
  NormalParticle(){
    myX = 400 + 50 * Math.cos(Math.random()*2*Math.PI);
    myY = 200 + 50 * Math.cos(Math.random()*2*Math.PI);
    dDirection = Math.random()*2*Math.PI;
    dSpeed = Math.random()*3+1;
    mySize = 10.2;
  }
  public void show(){
    fill(255);
    ellipse((float)myX, (float)myY, (float)mySize, (float)mySize);
  }
  public void move(){
    myX = myX + dSpeed*Math.cos(dDirection);
    myY = myY + dSpeed*Math.sin(dDirection);
    if(myX > 800 || myX < 0){
      if(myY > 800 || myY < 0){
        myY = 200 + 50 * Math.cos(Math.random()*2*Math.PI);
        myX = 400 + 50 * Math.cos(Math.random()*2*Math.PI);
      }
    }
  }
}
class OddBall implements Particle{
  private double myX, myY, dDirection;
  private double mySpeed;
  OddBall(){
    myX = 400 + 50 * Math.cos(Math.random()*2*Math.PI);
    myY = 200 + 50 * Math.cos(Math.random()*2*Math.PI);
    dDirection = Math.random()*2*Math.PI;
  }
  public void show(){
    fill(200, 40, 40);
    ellipse((float)myX, (float)myY, 30, 30);
  }
  public void move(){
    mySpeed = Math.random()*6 - 2;
    myX = myX + mySpeed*Math.cos(dDirection);
    myY = myY + mySpeed*Math.sin(dDirection);
    if(myX > 800 || myX < 0){
      if(myY > 800 || myY < 0){
        myY = 200 + 50 * Math.cos(Math.random()*2*Math.PI);
        myX = 400 + 50 * Math.cos(Math.random()*2*Math.PI);
      }
    }
  }
}
class JumboParticle extends NormalParticle{
  JumboParticle(){
    myX = 400 + 50 * Math.cos(Math.random()*2*Math.PI);
    myY = 200 + 50 * Math.cos(Math.random()*2*Math.PI);
    dDirection = Math.random()*2*Math.PI;
    dSpeed = Math.random()*3+1;
    mySize = 50;
  }
}
