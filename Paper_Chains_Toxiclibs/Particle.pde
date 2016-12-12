

class Particle extends VerletParticle2D {
  public Particle(float x, float y){
    super(x,y);
  }
  
  public void display(){
    noFill();
    stroke(255);
    ellipse(x, y, 10, 10);
  }
}