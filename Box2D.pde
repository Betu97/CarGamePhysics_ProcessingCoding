import shiffman.box2d.*;
import org.jbox2d.common.*;
import org.jbox2d.dynamics.joints.*;
import org.jbox2d.collision.shapes.*;
import org.jbox2d.collision.shapes.Shape;
import org.jbox2d.common.*;
import org.jbox2d.dynamics.*;
import org.jbox2d.dynamics.contacts.*;

Box2DProcessing box2d;

Cotxe cotxe;
Superficie superficie;

//es crea el mon i inicialitzem el cotxe i la superficie
void setup() {
  size(1340,860);
  box2d = new Box2DProcessing(this);
  box2d.createWorld();
  
  cotxe = new Cotxe(100, 290);
  superficie = new Superficie();
}

//es printen el cotxe i la superficie en el mon Box2D
void draw() {
  box2d.step();
  background(255);
  
  superficie.display();
  cotxe.display();
}