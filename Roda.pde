class Roda {

  Body body;
  float r;
  
  //s'inicialitza les rodes amb el radi que s'especifica en els parametres i es creen les fisiques de la roda
  Roda(float x, float y, float r_, float angle) {
    r = r_;
    makeBody(x,y,r, angle);
  }

  //es printa la roda i se l'hi aplica la rotacio que va rebent mentre es mou
  void display() {
    Vec2 pos = box2d.getBodyPixelCoord(body);
    float a = body.getAngle();
    pushMatrix();
    translate(pos.x,pos.y);
    rotate(-a);
    fill(175);
    stroke(0);
    strokeWeight(1);
    ellipse(0,0,r*2,r*2);
    line(0,0,r,0);
    popMatrix();
  }

  //es creen les fisiques de la roda i se l'hi aplica la densitat i la friccio que tindra
  void makeBody(float x, float y, float r, float angle) {
    BodyDef bd = new BodyDef();
    bd.position = box2d.coordPixelsToWorld(x,y);
    bd.type = BodyType.DYNAMIC;
    body = box2d.world.createBody(bd);

    CircleShape cs = new CircleShape();
    cs.m_radius = box2d.scalarPixelsToWorld(r);
    
    FixtureDef fd = new FixtureDef();
    fd.shape = cs;
    fd.density = 1;
    fd.friction = 0.3;
    fd.restitution = 0.1;
    
    body.createFixture(fd);

    body.setLinearVelocity(new Vec2(random(-10f,10f),random(5f,10f)));
    body.setAngularVelocity(random(-10,10));
    body.setTransform(body.getPosition(),angle);
  }

}