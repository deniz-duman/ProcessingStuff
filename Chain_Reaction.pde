Ball[] balls;

boolean reactionStarted;


void setup() {
  size(600, 600);
  reactionStarted = false;
  balls = new Ball[25];
  for (int i=0; i < balls.length; i++ )
    balls[i] = new Ball();
  balls[0].state = Ball.DEAD;
}


void draw() {
  background(0);
  if (reactionStarted){
    while (balls[0].state != DEAD){
      if (rad < 60)){
        balls[0].state = GROWING;
      }
      else if (rad > 0){
        balls[0].state = SHRINKING;
      }
      else {
        balls[0].state = DEAD;
      }
      balls[0].draw();
      for (int i=1; i < balls.length; i++ ) {
        if (balls[0].isTouching(balls[i])){
          balls[i].draw();
        }
      }
    }
  }
  for (int i=0; i < balls.length; i++ ) {
    balls[i].process();
  }
}


void mouseClicked() {
  if ( !reactionStarted ) {
    balls[0].x = mouseX;
    balls[0].y = mouseY;
    balls[0].rad = 0.1;
    balls[0].state = Ball.GROWING;
    reactionStarted = true;
    }
}
