class SkyEntity {
 float x;
 float y;
 float z;
 
 float pz;
 
 float entSize = 0;
 
 SkyEntity(float entitySize) {
   x = random(-width, width);
   y = random(-height, height);
   z = random(width);
   
   pz = z;
   entSize = entitySize;
 }
 
   void update() {
     z = z - 1.5;
     if(z < 0) {
       z = width;
       x = random(-width, width);
       y = random(-height, height);
       pz = z;
     }
    }

  void show() {
    fill(255);
    noStroke();
    float sx = map(x / z, 0, 1, 0, width);
    float sy = map(y / z, 0, 1, 0, height);
    ellipse(sx, sy, entSize, entSize);
  }
}
