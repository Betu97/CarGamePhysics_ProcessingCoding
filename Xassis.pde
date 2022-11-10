class Xassis {

  Body body;
  float w;
  float h;

  //s'inicialitza el xassis del cotxe amb una llargada especifica i a un lloc en concret
  Xassis(float x, float y, float w_, float h_) {
    w = w_;
    h = h_;
    
    BodyDef bd = new BodyDef();
    bd.type = BodyType.DYNAMIC;
    bd.position.set(box2d.coordPixelsToWorld(new Vec2(x,y)));
    body = box2d.createBody(bd);

    //es crea la fisica d'un dels rectangles
    PolygonShape sd = new PolygonShape();
    float box2dW = box2d.scalarPixelsToWorld(w/2);
    float box2dH = box2d.scalarPixelsToWorld(h/2);
    sd.setAsBox(box2dW, box2dH);
    //es crea el cos simulat d'un altre rectangle que forma la part de dalt del cotxe i el desplacem respecte el centre del cos
    PolygonShape sd2 = new PolygonShape();
    float box2dW2 = box2d.scalarPixelsToWorld(w/4);
    float box2dH2 = box2d.scalarPixelsToWorld(h/1.5);
    sd2.setAsBox(box2dW2, box2dH2, new Vec2(0,-h/1.5), 0);

    FixtureDef fd = new FixtureDef();
    fd.shape = sd;
    fd.density = 1;
    fd.friction = 0.1;
    fd.restitution = 0.5;
    
    FixtureDef fd2 = new FixtureDef();
    fd2.shape = sd2;
    fd2.density = 0.01;
    fd2.friction = 0;
    fd2.restitution = 0;
    
    body.createFixture(fd);
    body.createFixture(fd2);

    body.setLinearVelocity(new Vec2(0,0));
    body.setAngularVelocity(0);
  }

  //es printen els dos rectangles i fem que els canvis que tingui el xassis tambe es mostrin
  void display() {
    Vec2 pos = box2d.getBodyPixelCoord(body);
    float a = body.getAngle();

    rectMode(PConstants.CENTER);
    pushMatrix();
    translate(pos.x,pos.y);
    rotate(-a);
    fill(255, 0, 0);
    noStroke();
    rect(0, 0, w, h);
    rect(0, -h/1.5, w/2, h);
    popMatrix();
  }
}