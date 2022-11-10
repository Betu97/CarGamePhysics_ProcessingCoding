class Superficie {
  ArrayList<Vec2> superficie;

  //s'inicialita la superficie amb els diferents vertex que tindra per la part de la recta
  Superficie() {

    superficie = new ArrayList<Vec2>();
    superficie.add(new Vec2(0, height));
    superficie.add(new Vec2(0, height/2-120));
    superficie.add(new Vec2(width/2 -205, height/2 + 12));
    
    //per fer la part sinusoidal es crea un bucle i s'incrementa el numero d'iteracions per cada numero de la variable per fer que tingui mes punt i es vegi una corba
    for(float i = width/2 - 205; i < width; i = i+0.1){
      superficie.add(new Vec2(i,map(sin(i/35), -1, 1, height/2 - 20, height/2 + 20)));
    }
    superficie.add(new Vec2(width, height));

    ChainShape chain = new ChainShape();
    Vec2[] vertices = new Vec2[superficie.size()];
    
    //s'afegeixen els dos vertexs de la recta i la part sinusoidal la mateixa array de vertexs
    for (int i = 0; i < vertices.length; i++) {
      vertices[i] = box2d.coordPixelsToWorld(superficie.get(i));
    }

    chain.createChain(vertices, vertices.length);

    BodyDef bd = new BodyDef();
    Body body = box2d.world.createBody(bd);
    body.createFixture(chain, 1);
  }
  
  //es printen els vertexs de l'array per fer la forma de la superficie
  void display() {
    strokeWeight(1);
    stroke(150);
    fill(150);
    beginShape();
    for (Vec2 v: superficie) {
      vertex(v.x,v.y);
    }
    endShape();
  }
}