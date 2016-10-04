import processing.serial.*;

Serial myPort; // The serial port:
int instring;
PImage img1, img2;
 
 
void setup() {
  myPort = new Serial(this, "/dev/cu.usbmodem1451", 9600);
  myPort.bufferUntil('\n');
  size(1030, 700);
  frameRate(30);
  img1 = loadImage("img1use.png");
  img2 = loadImage("img2use.png");
}
 
 
void draw() {
  while (myPort.available () > 0) {
    instring = myPort.read();
     println(instring);
     background(0);
     if (instring > 48){
       image(img2, 0, 0 , width, height);
     }
     else{
       image(img1,0,0, width, height); 
     }
  }
}