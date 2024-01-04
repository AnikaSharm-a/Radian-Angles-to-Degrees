// Title: Radian Angles to Degrees
// Purpose: To create a program that converts the input of 5 angles in radians from a file into degrees and draws the angles on screen
// Programmer: Anika Sharma
// Date: Sept 27, 2022



void setup(){
  size(1300,400);
}



// The function that converts the radian angles to degrees
float radtodeg(String rad){
  
  float numerator;
  float denominator;
  
  
  // If the angle is pi
  if (rad.equals("pi")) return 180;
  
  // Finding the numerator using index of pi
  int pi1 = rad.indexOf("pi");
  int pi2 = rad.indexOf("-pi");
  
  if (pi1 == 0) numerator = 1;
  else if (pi2 == 0) numerator = -1;
  else numerator = float(rad.substring(0,pi1));
  
  
  // Finding the denominator using index of /
  int dash = rad.indexOf("/");
  
  if (dash == -1) denominator = 1;
  else denominator = float(rad.substring(dash+1));
 
 
  // Converting the radian angle to degrees and rounding to 2 decimal places
  float degrees = round( ((numerator*PI)/denominator) * (180/PI) * 100) * 0.01;
   
  return degrees;
}



// Inputting and drawing the angles 
void draw(){
  
  // Getting the angles from the file 
  String[] angles = loadStrings("input.txt");
  
  // Setup for drawing
  background(200);
  int x = 60;
  
  // Looping through the list of angles
  for (int i=0; i<angles.length; i++){
        
    // The angles text
    fill(0);
    String angle = angles[i].replace("pi", "\u03C0");
    PFont font = createFont("Segoe UI Italic", 18);
    textFont(font);
    text(angle + " radians = " + radtodeg(angles[i]) + "\u00B0", x, 130);
   
    
    // Drawing the arc
    float stop = radians(radtodeg(angles[i]));
    
    if (stop < 0) {
      fill(200);
      circle(x+85, 250, 100);
      
      fill(0);
      arc(x+85, 250, 100, 100, 0, -1*stop);
    }
    
    else {
      fill(0);
      circle(x+85, 250, 100);
      
      fill(200);
      arc(x+85, 250, 100, 100, 0, 2*PI-stop);
    }
    
    
    x = x + 255;
  }

  noLoop();
}
