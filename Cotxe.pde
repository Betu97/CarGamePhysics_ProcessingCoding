class Cotxe {
  Xassis xassis;
  Roda roda1;
  Roda roda2;

  //s'inicialitza el cotxe a la posicio que s'especifica en els parametres
  Cotxe(float x, float y) {
    xassis = new Xassis(x, y, 105, 32);
    roda1 = new Roda(x-28, y+16, 12, 0);
    roda2 = new Roda(x+28, y+16, 12, 150);
    
    RevoluteJointDef rjd1 = new RevoluteJointDef();
    rjd1.initialize(xassis.body, roda1.body, roda1.body.getWorldCenter());
    rjd1.motorSpeed = -PI*3;
    rjd1.maxMotorTorque = 300.0;
    rjd1.enableMotor = true;
    box2d.world.createJoint(rjd1);

    RevoluteJointDef rjd2 = new RevoluteJointDef();
    rjd2.initialize(xassis.body, roda2.body, roda2.body.getWorldCenter());
    rjd2.motorSpeed = -PI*3;
    rjd2.maxMotorTorque = 300.0;
    rjd2.enableMotor = true;
    box2d.world.createJoint(rjd2);
  }
  
  //es printen el xassis del cotxe i les dues rodes
  void display() {
    xassis.display();
    roda1.display();
    roda2.display();
  }
}