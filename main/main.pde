int ENTITY_COUNT = 5120;

SkyEntity entities[] = new SkyEntity[ENTITY_COUNT];
int randomPlanets[] = new int[32];
int randomMicrostars[] = new int[64];

void setup() {
  size(1360, 768, P3D);
  /* random planets gen */
  for(int i = 0; i < randomPlanets.length; i++) {
    int randomNumber = floor(random(0, ENTITY_COUNT));
    randomPlanets[i] = randomNumber;
  }
  /* random microstar gen */
  for(int i = 0; i < randomMicrostars.length; i++) {
    int randomNumber = floor(random(0, ENTITY_COUNT));
    randomMicrostars[i] = randomNumber;
  }
  
  /* MICROSTARS */
  for(int i = 0; i < entities.length; i++) {
    entities[i] = new SkyEntity(1, EntityType.MICROSTAR);
  }
  
  /* STARS */
  for(int j = 0; j < randomMicrostars.length; j++) {
      entities[randomMicrostars[j]] = new SkyEntity(random(1, 2), EntityType.STAR);
  }
  
  /* PLANETS */
  for(int j = 0; j < randomPlanets.length; j++) {
      entities[randomPlanets[j]] = new SkyEntity(random(4, 16), EntityType.PLANET);
  }
}
  
void draw() {
  background(0);
  translate(width / 2, height / 2);
  for(int i = 0; i < entities.length; i++) {
    entities[i].update();
    entities[i].show();  
  }  
}
