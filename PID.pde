//PID and Speeed Values
import java.lang.Math;
double kP = 0.1;
double kI = 0.0001;
double kD = 0.01;

double xPos = 0;
double xPos_prev = 0;
double yPos = 0;
double yPos_prev = 0;

double xSpeed = 0;
double xSpeed_prev = 0;

double ySpeed = 0;
double ySpeed_prev = 0;

double integralY = 0;
double derivativeY = 0;

double integralX = 0;
double derivativeX = 0;

double functionDerivative;

double errorY = 0;
double error_prevY = 0;

double errorX = 0;
double error_prevX = 0;

double framerate = 30;
double frame = 0;

double squareLength = 200;


int millis; 
double y = 0 ;
double x = 0;
void setup(){
  size(1920,1080);
  frameRate((float)framerate);
  //background(#000000);

}
void draw(){
y = 100 * Math.sin(xPos / 120) + 540;
x += 3;
//double xTarget = mouseX;
//double yTarget = mouseY;

double xTarget = x;
double yTarget = y;

marsSetup();
double dt = 1/(framerate);
functionDerivative = (yPos - yPos_prev)/(3); 
System.out.println(functionDerivative);
xPos_prev = xPos; 
yPos_prev = yPos; 
 
line (0,mouseY,width,mouseY);
line (mouseX,0,mouseX,height);
stroke (#ffffff);
Rover();



//PID bit


//Y axis
errorY = yTarget - yPos- squareLength/2;
integralY += (errorY * dt);
derivativeY = (errorY - error_prevY)/(dt);

ySpeed += (errorY * kP) + (integralY * kI) + (derivativeY * kD);

//X axis
errorX = xTarget - xPos-squareLength/2;
integralX += (errorX * dt);
derivativeX = (errorX - error_prevX)/(dt);

xSpeed += (errorX * kP) + (integralX * kI) + (derivativeX * kD);

xPos = xPos + xSpeed;
yPos = yPos + ySpeed;
error_prevY = errorY;
error_prevX = errorX;
xSpeed_prev = xSpeed;
ySpeed_prev = ySpeed;


}
 void marsSetup()
{
    background(#E58800);
    int mX = 0;
    int mY = 0;
    int mLength = 30;
    for(mX = 0;mX<width;mX+=200)
    {
      fill(000000);
       for(mY = 0;mY<width;mY+=200)
       {
         fill(#000000);
         square(mX,mY,mLength);
         fill(#D2691E);
         square(mX+50,mY+80,mLength+30);
       }
    }
}
 void Rover()
{
  pushMatrix();
  translate((float) xPos, (float) yPos);
  rotate(atan((float)functionDerivative));
  fill(#666666);
  square((float) -squareLength / 2, (float) -squareLength / 2, (float)squareLength); 
  fill(#A7EE23);
  for(int x = 40 - (int) (squareLength / 2); x<squareLength / 2; x+=60){
     ellipse((float)x,(float) -squareLength / 2,20,-30);
  }
  for(int x = 40 - (int) (squareLength / 2); x<squareLength / 2; x+=60){
     ellipse((float)x,(float)squareLength / 2,20,30);
  }
  popMatrix();
  

}
