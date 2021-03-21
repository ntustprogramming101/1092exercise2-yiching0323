final float EGG_W = 35;
final float EGG_H = 45;
final float DROP_RANGE = 290;

final float BASKET_W = 100;
final float BASKET_H = 100;
final float BASKET_Y = 330;
final float OFFSET_X = 10;
final float OFFSET_Y = 60;
final float BROKENEGG_W = 70;
final float BROKENEGG_H = 70;
final float GROUND_Y = 430;

PImage bgImg, basket, egg, brokenEgg, basketFront;

float eggX, eggY, eggSpeed;
float basketX;
float margin;

boolean gameOver;


void setup() {
  size(350, 500);
  bgImg = loadImage("img/bgImg.png");
  basket = loadImage("img/basket.png");
  egg = loadImage("img/egg.png");
  brokenEgg = loadImage("img/breakEgg.png");
  basketFront = loadImage("img/basketFront.png");
  margin = (width - DROP_RANGE)/2;
  eggX = random(margin, width - margin - EGG_W);
  imageMode(CORNER);
  eggSpeed = floor(random(2, 5));
}



void draw() {
  image(bgImg, 0, 0, width, height);

  eggY += eggSpeed;


  if (eggY > BASKET_Y + OFFSET_Y) {
    if (eggX > basketX + OFFSET_X && eggX < basketX+BASKET_W - OFFSET_X) {
      eggY = (0 - EGG_H);
    } else {
      image(brokenEgg, eggX, GROUND_Y, BROKENEGG_W, BROKENEGG_H);
    }
  } else {

    image(egg, eggX, eggY-EGG_H);
  }


  //image(basket, mouseX-50, BASKET_Y);
  basketX = mouseX - 2/BASKET_W;

  if (basketX < 0) {
    basketX = 0;
  }

  if (basketX + BASKET_W > width) {
    basketX = width - BASKET_W;
  }
  image(basket, basketX, BASKET_Y, BASKET_W, BASKET_H);
  
}

  
void mouseClicked() {
}


  
