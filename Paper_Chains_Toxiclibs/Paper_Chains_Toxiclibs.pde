import toxi.geom.*;
import toxi.physics2d.*;
import toxi.physics2d.behaviors.*;

//see https://www.youtube.com/watch?v=jrk_lOg_pVA

ArrayList<Spring> springs = new ArrayList<Spring>();
ArrayList<Particle> particles = new ArrayList<Particle>();
int numOfParticles = 80;
VerletPhysics2D physics = new VerletPhysics2D();
Vec2D gravity = new Vec2D(0, 30);
GravityBehavior2D gb2d = new GravityBehavior2D(gravity);
void setup() {
  size(1000,500);
  background(51);
  generateParticles(numOfParticles);
  physics.addBehavior(gb2d);
  for(int i = 0; i < particles.size(); i++){
    physics.addParticle(particles.get(i));
  }
  connectAllParticlesWithSprings();
  lockStartAndEnd();
  lockBasedOnIterator(80/4);
}

void draw(){
  background(51);
  displayAllParticles();
  physics.update();
}

void generateParticles(int num){
  int startX = width / 20;
  int startY = height - 480;
  for(int i = 0; i < num; i++){
    particles.add(new Particle(startX + (i * 10), startY));
  }
}

void displayAllParticles(){
  for(Particle p : particles){
    p.display();
  }
}

void connectAllParticlesWithSprings(){
  float str = 0.25;
  float len = 1.0;
  for(int i = 0; i < particles.size(); i++){
    Particle a = particles.get(i);
    try{
    Particle b = particles.get(i+1);
    Spring spring = new Spring(a, b, len, str);
    springs.add(spring);
    physics.addSpring(spring);
    } catch (Exception nex){
      
    }
  }
}

void lockStartAndEnd(){
  particles.get(0).lock();
  particles.get(particles.size() - 1).lock();
}

void lockBasedOnIterator(int offset){
  for(int i = 0; i < particles.size(); i++){
    if(i % offset == 0){
      println("locking i = " + i);
      particles.get(i).lock();
    }
  }
}