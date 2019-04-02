enum EntityType {
 MICROSTAR,
 STAR,
 PLANET
};

class SkyEntity {
 EntityType type;
 float x;
 float y;
 float z;
 
 float pz;
 
 color entColor;
 float entSize = 0;
 
 float arcRotation = 0;
 
 SkyEntity(float entitySize, EntityType entType) {
   type = entType;
   x = random(-width, width);
   y = random(-height, height);
   z = random(width);
   
   pz = z;
   entSize = entitySize;
   entColor = getEntityColor(entType);
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
    fill(entColor);
    noStroke();
    float sx = map(x / z, 0, 1, 0, width);
    float sy = map(y / z, 0, 1, 0, height);
    ellipse(sx, sy, entSize, entSize);
    setEntityProps(type, sx, sy);
  }
  
  color getEntityColor(EntityType entityType) {
    switch(entityType) {
      case MICROSTAR:
        return color(255, 255, 255);
      
      case STAR:
        return color(249, 215, 28);
        
      case PLANET: 
        return color(random(1, 255), 0, 130);
        
      default:
        return color(0, 255, 0);
    }
  }
  
  void setEntityProps(EntityType entityType, float sx, float sy) {
    switch(entityType) {
      case MICROSTAR:
        break;
      
      case STAR:
        fill(entColor);
        triangle(sx - entSize * 3, sy - entSize * 3, sx, sy + (entSize * 1.1), sx + entSize * 3, sy + entSize * 3);    
        break;
        
      case PLANET:
        noFill();
        stroke(entColor - 100);
        ellipse(sx, sy, entSize + 4, entSize + random(1, 2));
        spotLight(255, 0, 0, width/2, height/2, 400, 0, 0, -1, PI/4, 2);
        pushMatrix();
        rotateY(arcRotation);
        rotateZ(PI/8);
        popMatrix();
        arcRotation += 0.01;

        break;
        
      default:
        break;
    }
  }
}
