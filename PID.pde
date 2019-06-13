//PID, Speed, Error and FrameRate Values
import java.lang.Math;
double kP = 0.1;
double kI = 0.0001;
double kD = 0.01;

double xPos = 0;
double yPos = 0;

double xSpeed = 0;
double ySpeed = 0;

double integralX = 0;
double integralY = 0;

double derivativeX = 0;
double derivativeY = 0;

double errorX = 0;
double errorY = 0;

double error_prevX = 0;
double error_prevY = 0;

double framerate = 60;

double xTarget;
double yTarget;

    //Comment for mouse version
double y = 0;
double x = 0;

void setup(){
  //Sets up Size and Framerate
  size(1920,1080);
  frameRate((float)framerate);
}

void draw(){
      //Comment for mouse version
  double xTarget = x;
  double yTarget = y;
  y = 500 * Math.sin(xPos / 50) + 520;
  x += 3;
  
      //Comment for function Version
  //xTarget = mouseX;
  //yTarget = mouseY;
  
  //Updates background and Creates Square
  background(#000000); //Comment to Graph
  line (0,mouseY,width,mouseY);
  line (mouseX,0,mouseX,height);
  stroke (#ffffff);
  square((float)xPos, (float)yPos, 15);
  
  //PID bit
  double dt = 1/(framerate);
  
  //Y axis
  errorY = yTarget - yPos-7.5;
  integralY += (errorY * dt);
  derivativeY = (errorY - error_prevY)/(dt);
  
  ySpeed += (errorY * kP) + (integralY * kI) + (derivativeY * kD);
  
  //X axis
  errorX = xTarget - xPos-7.5;
  integralX += (errorX * dt);
  derivativeX = (errorX - error_prevX)/(dt);
  
  xSpeed += (errorX * kP) + (integralX * kI) + (derivativeX * kD);
  
  //Update Position of Square
  xPos = xPos + xSpeed;
  yPos = yPos + ySpeed;
  
  //Sets Previous Error to Current Error
  error_prevY = errorY;
  error_prevX = errorX;
}
