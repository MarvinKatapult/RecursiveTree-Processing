float a;
float lengthReduction = 0.75;
int startLength = 150;
boolean rainbow = true;
float angleIncrement = 0;


void setup() {

  size(1000, 700);

}

void draw() {

  background(33);
  
  textSize(18); 
  text("Press 'r' for Rainbow\nPress Up and Down for angle\nPress a for automatic angle change", 50, 50);
  
  translate(width/2, height - 50);
  makeBranch(startLength);
  a += angleIncrement;

}

void makeBranch(float len) {

  if (len < 3) {
    return;
  }
  line(0, 0, 0, -len);
  translate(0, -len);

  if (rainbow == true) {
    colorMode(HSB, 255);

    var colorValue = map(len, 3, startLength, 0, 255);
    var c = color(colorValue, 255, 255);
    stroke(c);

  }
  else {
    colorMode(RGB, 255);
    stroke(255);
  }
  
  // Branch1
  push();
    rotate(a);
    makeBranch(len * lengthReduction);
  pop();

  // Branch2
  push();
    rotate(-a);
    makeBranch(len * lengthReduction);
  pop();
  
}

void keyPressed() {
  // rainbow on / off
  if (key == 'r') {
    if (rainbow == true) { 
      rainbow = false;
    }
    else {
        rainbow = true;
    }
  }
  
  // automatic angle on / off
  if (key == 'a') {
    if (angleIncrement == 0) {  
      angleIncrement = 0.01;
    }  
    else {
       angleIncrement = 0; 
    }
  }
  
  // manual angle change
  if (keyCode == UP) {
     a += 0.01; 
  }
  if (keyCode == DOWN) {
    a -= 0.01;
  }
}