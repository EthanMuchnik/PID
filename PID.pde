//PID and Speeed Values
double kP = 0.1;
double kI = 0.0001;
double kD = 0.010;

double xPos = 0;
double yPos = 0;

double xSpeed = 0;
double xSpeed_prev = 0;

double ySpeed = 0;
double ySpeed_prev = 0;

double integralY = 0;
double derivativeY = 0;

double integralX = 0;
double derivativeX = 0;

double errorY = 0;
double error_prevY = 0;

double errorX = 0;
double error_prevX = 0;

double framerate = 60;
void setup(){
  size(500,500);
  frameRate((float)framerate);
}
void draw(){
int millis = millis();
double xTarget = mouseX;
double yTarget = mouseY;
background(#000000);
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

xPos = xPos + xSpeed;
yPos = yPos + ySpeed;
error_prevY = errorY;
error_prevX = errorX;
xSpeed_prev = xSpeed;
ySpeed_prev = ySpeed;
//timer
  if (errorY <=0.1 && errorY >= -0.1 && errorX >= -0.1 && errorX <= 0.1 && xSpeed <=0.1 && xSpeed >= -0.1 && ySpeed <=0.1 && ySpeed >= -0.1){
    System.out.println(millis);
   }

}
