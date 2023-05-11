void setup() {
  size(400, 400);
}

PVector p0 = new PVector(100, 300);
PVector p1 = new PVector(100, 100);
PVector p2 = new PVector(300, 100);
PVector p3 = new PVector(300, 300);

PVector A;
PVector B;
PVector C;

PVector a;
PVector b;

PVector point;

float t = 0;

PVector mouse;

void draw() {
  mouse = new PVector(mouseX, mouseY);
  background(125);
  t = 0;
  point = p0;
  PVector oldpos = point;
  for (int i = 0; i<101; i++) {

    A = PVector.lerp(p0, p1, t);
    B = PVector.lerp(p1, p2, t);
    C = PVector.lerp(p2, p3, t);

    a = PVector.lerp(A, B, t);
    b = PVector.lerp(B, C, t);

    point = PVector.lerp(a,b, t);
    PVector newpos = point;
    line(oldpos.x, oldpos.y, newpos.x, newpos.y);
    //circle(newpos.x, newpos.y, 10);
    oldpos = newpos;
    t+=0.01;
  }
  circle(p0.x, p0.y, 20);
  circle(p1.x, p1.y, 20);
  circle(p2.x, p2.y, 20);
  circle(p3.x, p3.y, 20);

  line(p0.x, p0.y, p1.x, p1.y);
  line(p2.x, p2.y, p3.x, p3.y);
}

void mouseDragged() {
  if (mouse.dist(p0)<25) {
    p0 = mouse;
  }
  if (mouse.dist(p1)<25) {
    p1 = mouse;
  }
  if (mouse.dist(p2)<25) {
    p2 = mouse;
  }
  if (mouse.dist(p3)<25) {
    p3 = mouse;
  }

}
