class Ball {
  
  final static int MOVING = 0;
  final static int GROWING = 1;
  final static int SHRINKING = 2;
  final static int DEAD = 3;
      
  //other constants necessary?
  
  float x;
  float y;
  float rad;
  color c;
  float dx;
  float dy;
  int state;

  
  Ball() {
    float r = random(256);
    float g = random(256);
    float b = random(256);
    c = color( r, g, b );
    
    rad = 10;
    
    x = random( (width - r) + r/2 );
    y = random( (height - r) + r/2 );

    dx = random(10) - 5;
    dy = random(10) - 5;
    
    state = MOVING;
  }
  
  void bounce(){
    if (x+rad == 0 || x+rad == 600) dx = -dx;
    if (y+rad == 0 || y+rad == 600) dy = -dy;
  }

  void move() {
    x = x + dx;
    y = y + dy;
    bounce();
  }
 
  void grow(){
    rad+=0.1;
  }
  
  void shrink(){
    rad-=0.1;
  }
  
  void die(){
    rad=0;
  }
 
 boolean isTouching( Ball other ) {
    if (Math.sqrt(Math.pow(x-other.x,2)+Math.(y-other.y,2)) <= rad + other.rad) return true;
    return false;
 }
 
  
}//end class Ball
