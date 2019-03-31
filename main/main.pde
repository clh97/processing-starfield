int STARS_COUNT = 500;

SkyEntity entities[] = new SkyEntity[STARS_COUNT];
int randomIndexes[] = new int[8];

void setup() {
  size(1366, 768);
  for(int i = 0; i < 8; i++) {
    int randomNumber = floor(random(0, STARS_COUNT));
    randomIndexes[i] = randomNumber;
  }
  for(int i = 0; i < entities.length; i++) {
    entities[i] = new SkyEntity(1.0);
  }
  
  for(int j = 0; j < randomIndexes.length; j++) {
      entities[randomIndexes[j]] = new SkyEntity(3.0);
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
