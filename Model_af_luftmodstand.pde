float initForce = 15; // m/s
float ang = 90; //deg
float mass = 0.14529; //kg
float dragC = 1; //drag coeff
float r = 0.031835; // m
float A = sq(r)*PI; // overflade areal
float airDensity = 1.275; // kg/m^3
float g = 9.81; // N/kg

float stepLen = 0.01;
float time = 0;

float pos_i_x = 0;
float pos_i_y = 0;
float v_i_x = cos(radians(ang))*initForce;
float v_i_y = sin(radians(ang))*initForce;

PVector pos = new PVector(pos_i_x, pos_i_y);
PVector vel = new PVector(v_i_x, v_i_y);
PVector acc = new PVector(0, 0);
void setup() {
  size(800,400);
}
void draw() {
  //for  (int i = 0; i < 100; i++){
  float dragX = -0.5 * airDensity * sq(vel.x) * dragC * A; // calc drag for x 
  float dragY = 0.5 * airDensity * sq(vel.y) * dragC * A; // calc drag for y
  float Fg = mass * g;
  float netY = dragY - Fg;

  acc.x = dragX/mass;
  acc.y = netY/mass;


  time = time + stepLen*100;

  pos.x += vel.x * stepLen + 0.5 * acc.x * sq(stepLen);
  pos.y += vel.y * stepLen + 0.5 * acc.y * sq(stepLen);

  vel.x += acc.x * stepLen; // calc the new vel
  vel.y += acc.y * stepLen;
  println(" ");
  println("vel: "+vel);
  println("pos: "+pos);
  println(time/100);
  pushMatrix();
  translate(10,height/1.5);
  line(0,0,width,0);
  PVector loc = new PVector(pos.x,pos.y);
  ellipse(loc.x*20,loc.y*20*-1,10,10);
  
  popMatrix();
  if (pos.y <= 0) {
    noLoop();
  //}
  }
}
