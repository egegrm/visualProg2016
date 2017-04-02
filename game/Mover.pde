class Mover {
  float ray=12;
  float gravityConst=5;
  float normalForce=1;
  float mu=2;
  float frictionNorm=normalForce*mu;
  float bounce=0.95;
  static final color SPHERE_COLOR = #00ED70;

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
    PVector normalForce= new PVector(0,0,0);
    PVector pos=new PVector(location.x,0,location.z);
     for(int ind=0; ind<cyl.size();ind++){
     PVector v=cyl.get(ind);
     PVector u=new PVector(v.x -displayWidth/2.0, 0, v.y-displayHeight/2.0);
     float dist=u.dist(pos);
<<<<<<< HEAD
     if(dist < Cylinder.cylinderBaseSize + ray){
       lastScore = totalScore;
       totalScore += velocity.mag();
       PVector normal = new PVector(pos.x - u.x, 0, pos.z - u.z).normalize(); 
       location = u.copy().add(normal.copy().mult(Cylinder.cylinderBaseSize+ray));
=======
     if(dist < cylinderBaseSize + ray*2){
       lpw=velocity.mag();
       score += lpw;
       PVector normal = new PVector(pos.x - u.x, 0, pos.z - u.z).normalize(); 
       location = u.copy().add(normal.copy().mult(cylinderBaseSize+ray*2+ray/10));
>>>>>>> 364fce692ee3c6db48ce9471a1f01c4d9fd5fdca
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
    sphere(ray);
    popMatrix();
  }
  void display() {
    pushMatrix();
    ambientLight(30, 102, 34);
    translate(location.x, location.y, location.z);
    stroke(0);
    strokeWeight(2);
    fill(SPHERE_COLOR);
    sphere(ray);
    popMatrix();
  }


  void checkEdges() {
<<<<<<< HEAD
    if (location.x > board.boardWidth/2) {
      location.x = board.boardWidth/2;
      velocity.x=-velocity.x*bounce;
      lastScore = totalScore;
      totalScore -= velocity.mag();
      
    } else if (location.x < -(board.boardWidth/2)) {
      location.x = -(board.boardWidth/2);
=======
    boolean touched=false;
    if (location.x > boxX/2) {
      touched=true;
      location.x = boxX/2;
      velocity.x=-velocity.x*bounce;
    } else if (location.x < -(boxX/2)) {
      touched=true;
      location.x = -(boxX/2);
>>>>>>> 364fce692ee3c6db48ce9471a1f01c4d9fd5fdca
      velocity.x=-velocity.x*bounce;
      
      lastScore = totalScore;
      totalScore -= velocity.mag();
    }

    if (location.y>-(board.boardHeight/2)-ray) {
      velocity.y=-velocity.y*bounce;
      location.y = -board.boardHeight/2-ray;
    }

<<<<<<< HEAD
    if (location.z<-(board.boardDepth/2)) {
      velocity.z=-velocity.z*bounce;
      location.z=-(board.boardDepth/2);
      lastScore = totalScore;
      totalScore -= velocity.mag();
    } else if (location.z>board.boardDepth/2) {
=======
    if (location.z<-(boxZ/2)) {
      touched=true;
      velocity.z=-velocity.z*bounce;
      location.z=-(boxZ/2);
    } else if (location.z>boxZ/2) {
      touched=true;
>>>>>>> 364fce692ee3c6db48ce9471a1f01c4d9fd5fdca
      velocity.z=-velocity.z*bounce;
      location.z=(board.boardDepth/2);
      lastScore = totalScore;
      totalScore -= velocity.mag();
    }
    
    if(touched){
      lpw=-m.velocity.mag();
      score +=lpw;
      score=max(score,0);
    }
  }
}