class Mover {
  float ray=5;
  float gravityConst=3;
  float normalForce=1;
  float mu=2;
  float frictionNorm=normalForce*mu;
  float bounce=0.90;

  PVector location;
  PVector gravity;
  PVector velocity;
  PVector friction;


  Mover() {
    location=new PVector(0, -100, 0);
    velocity=new PVector(0, 0, 0);
    gravity=new PVector(0, gravityConst, 0);
    friction=velocity.get();
  }
  
  float dist(PVector a, PVector b) {
    return sqrt( pow(a.x-b.x, 2)+pow(a.z-b.z, 2));
  }
  
  void collisions(){
    PVector normalForce=new PVector(0,0,0);
    PVector pos=new PVector(location.x,0,location.z);
     for(int ind=0; ind<cyl.size();ind++){
     PVector v=cyl.get(ind);
     PVector u=new PVector(v.x -width/2.0, 0, v.y-height/2.0);
     float dist=u.dist(pos);
     if(dist < cylinderBaseSize + ray*2){
       PVector normal = new PVector(pos.x - u.x, 0, pos.z - u.z).normalize(); 
       location = u.copy().add(normal.copy().mult(cylinderBaseSize+ray*2));
       velocity.sub(normal.mult(2*velocity.dot(normal)));
     }
   }
  }
  
  void update() {
    gravity.x=sin(rotZ)*gravityConst;
    gravity.z=-sin(rotX)*gravityConst;
    velocity.add(gravity);
    collisions();
    friction=velocity.get();
    friction.mult(-1).normalize().mult(frictionNorm);
    velocity.add(friction);
    location.add(velocity);
  }

  void display2D() {
    ambientLight(30, 102, 34);
    pushMatrix();
    translate(location.x, location.z, 0);
    stroke(0);
    strokeWeight(2);
    fill(145);
    sphere(ray*2);
    popMatrix();
  }
  void display() {
    pushMatrix();
    ambientLight(30, 102, 34);
    translate(location.x, location.y, location.z);
    stroke(0);
    strokeWeight(2);
    fill(145);
    sphere(ray*2);
    popMatrix();
  }


  void checkEdges() {
    if (location.x > boxX/2) {
      location.x = boxX/2;
      velocity.x=-velocity.x*bounce;
    } else if (location.x < -(boxX/2)) {
      location.x = -(boxX/2);
      velocity.x=-velocity.x*bounce;
    }

    if (location.y>-(boxY/2)-ray*2) {
      velocity.y=-velocity.y*bounce;
      location.y = -boxY/2-ray*2;
    }

    if (location.z<-(boxZ/2)) {
      velocity.z=-velocity.z*bounce;
      location.z=-(boxZ/2);
    } else if (location.z>boxZ/2) {
      velocity.z=-velocity.z*bounce;
      location.z=(boxZ/2);
    }
  }
}