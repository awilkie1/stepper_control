 Point p;
  Point p2;

int time = 6000;
int currentTime = 0;
int startTime = 0;
boolean start = false;
float scale = 0.25;
int distance = 200;
float DISTANCETOP = 454.0;
float SHIFTTOP = 0;
//String MOTORA = "10.0.2.59";
//String MOTORB = "10.0.2.60";
//String MOTORC = "10.0.2.65";//
//String MOTORD = "10.0.2.70";

//String MOTORA = "10.0.2.59";
//String MOTORB = "10.0.2.60";
//String MOTORC = "10.0.2.61";
//String MOTORD = "10.0.2.62";
//String MOTORA = "10.0.2.63";
//String MOTORB = "10.0.2.64";
//String MOTORC = "10.0.2.65";//FAULTY
////String MOTORD = "10.0.2.66";//not working
////String MOTORA = "10.0.2.67";
////String MOTORB = "10.0.2.68";
////String MOTORC = "10.0.2.69";
////String MOTORD = "10.0.2.70";

//String MOTORA = "10.0.2.74";
//String MOTORB = "10.0.2.72";
////String MOTORC = "10.0.2.73";
//String MOTORD = "10.0.2.74";

//1
//String MOTORA = "10.0.2.46";
//String MOTORB = "10.0.2.43";
//String MOTORC = "10.0.2.45";
//String MOTORD = "10.0.2.56";
//2
//String MOTORA = "10.0.2.44";//57
//String MOTORB = "10.0.2.57";
//String MOTORC = "10.0.2.49";
//String MOTORD = "10.0.2.79";
//3
//String MOTORA = "10.0.2.48";
//String MOTORB = "10.0.2.53";
//String MOTORC = "10.0.2.54";
//String MOTORD = "10.0.2.58";
//4
String MOTORA = "10.0.2.62";
String MOTORB = "10.0.2.52";
String MOTORC = "10.0.2.55";
String MOTORD = "10.0.2.47";

//59,60,61,62,63,64,65,66,67,68,69,70,71,72,73
int count = 0;

int MICROSTEPPING = 4;

void setup() {
  size(1200,900);
  //oscSetup();
  //tcpSetup();
  udpSetup();
  guiSetup();
  //SHIFTTOP = (width/2 - ((DISTANCETOP*scale)/2));
  SHIFTTOP = 0;
  p = new Point(0, new PVector(0,0), new PVector(DISTANCETOP,0),new PVector(width/2,300));
  p2 = new Point(1, new PVector(0,0), new PVector(DISTANCETOP,0),new PVector(width/2,300));

  println(SHIFTTOP);

}

void draw() {
  background(0);
  p.display();
  p2.display();
  guiDraw();
  currentTime = millis();
  if (start){
    if ((currentTime - startTime) >= 45000){

      if (count % 2 == 1){
        //p.updateStrand(0, p.getMaxA(), 100);
        //p.updateStrand(1, p.getMinB(), 100);
//       udpBroadcast("stepperMove " + -60000 + " " + 10000 + " " + 10000);
        udpBroadcast("stepperTranslate " + 0 + " " + 1000 + " " + 1000);
        

      } else {
        udpBroadcast("stepperTranslate " + 1700 + " " + 1000 + " " + 1000);
        // p.updateStrand(0, p.getMinA(), 100);
         //p.updateStrand(1, p.getMaxB(), 100);
      }
       startTime = millis();
       count++;

    }
  }

}

void mousePressed(){
  if (mouseX/scale < DISTANCETOP){
    p.clicked(mouseX/scale,mouseY/scale);
  }
}

void keyPressed(){
 if (key=='r') { udpBroadcast("reset");}
 //if (key=='1') { time = 1000;}
 //if (key=='2') { time = 5000;}
 //if (key=='3') { time = 10000;}
 //if (key=='1') { udpBroadcast("speed 1000");}
 //if (key=='2') { udpBroadcast("speed 2000");}
 //if (key=='3') { udpBroadcast("speed 2500");}
 //if (key=='4') { udpBroadcast("speed 3000");}
 //if (key=='5') { udpBroadcast("speed 3200");}
 //if (key=='6') { udpBroadcast("speed 7000");}
 //if (key=='7') { udpBroadcast("speed 8000");}
 //if (key=='8') { udpBroadcast("speed 9000");}
if (key=='1'){String command = "stepperSine " + 1000 + " " + (200 * MICROSTEPPING) +  " " + (200 * MICROSTEPPING + " 7 200");
udpBroadcast(command);}

   if (key=='2'){udpBroadcast("stepperWave 0 0 0 1 1 1500 3000 100");}

if (key=='3'){udpBroadcast("stepperWave 500 0 1500 1 1 10 3000 100");}
 //if (key=='1') { udpBroadcastDirect("stepperMin", MOTORA);}
 //if (key=='2') { udpBroadcastDirect("stepperMax", MOTORA);}
 //if (key=='9') { udpBroadcastDirect("stepperMin", MOTORB);}
 //if (key=='0') { udpBroadcastDirect("stepperMax", MOTORB);}
 //if (key=='1') { udpBroadcast("transitSpeed 1");}
 //if (key=='2') { udpBroadcast("transitSpeed 2");}
 if (key=='0') { udpBroadcast("transitSpeed 2");}
 //if (key=='4') { udpBroadcast("transitSpeed 4");}
 //if (key=='5') { udpBroadcast("transitSpeed 5");}
 //if (key=='6') { udpBroadcast("transitSpeed 6");}
 //if (key=='7') { udpBroadcast("transitSpeed 7");}
 //if (key=='8') { udpBroadcast("transitSpeed 8");}
 if (key=='7') { udpBroadcastDirect("partnerMin " + p.getMaxA(), MOTORB);udpBroadcastDirect("partnerMin " + p.getMaxB(), MOTORA);}
 if (key=='8') { udpBroadcast("setDistance " + int(distance));}
 if (key=='9') {
   udpBroadcastDirect("setPosition " + p.getMaxA(), MOTORA);
   udpBroadcastDirect("setPosition " + p.getMaxB(), MOTORB);
   udpBroadcastDirect("setPosition " + p2.getMaxA(), MOTORC);
   udpBroadcastDirect("setPosition " + p2.getMaxB(), MOTORD);
 }

 //if (key=='1') {
 //  p.updateStrand(0, p.getMaxA(), 100);
 //  p.updateStrand(1, p.getMinB(), 100);
 //}
 //if (key=='2') {
 //  p.updateStrand(0, p.getMinA(), 100);
 //  p.updateStrand(1, p.getMaxB(), 100);
 //}
 //if (key=='3') {
 //  p.updateStrand(0, p.getMinA(), 100);
 //  p.updateStrand(1, p.getMinB(), 100);
 //}
 //if (key=='4') {
 //  p.updateStrand(0, p.getMaxA(), 100);
 //  p.updateStrand(1, p.getMaxB(), 100);
 //}
 if (key=='h') { udpBroadcast("home -100000 3000 10000");}
 if (key=='g') { udpBroadcastDirect("home -100000 3000 10000", MOTORA);}
 if (key=='j') { udpBroadcastDirect("home -100000 3000 10000", MOTORB);}

 if (key=='c') { udpBroadcastDirect("home -100000 3000 10000", CURRENTMOTOR);}
// if (key=='s') { udpBroadcast("stop");}

 //if (key=='0') { p.clicked(20,20);}
 //if (key=='-') { p.clicked(width/2,150);}
 //if (key=='=') { p.clicked(680,20);}

 if (key=='q') { udpBroadcastDirect("stepperMove " + -(distance* MICROSTEPPING) + " " + (1500 * MICROSTEPPING) + " " + (1500* MICROSTEPPING),CURRENTMOTOR );}
 if (key=='w') { udpBroadcastDirect("stepperMove " + (distance* MICROSTEPPING) + " " + (1500 * MICROSTEPPING) + " " + (1500* MICROSTEPPING), CURRENTMOTOR);}

 if (key=='d') { udpBroadcastDirect("home", MOTORA);}
 if (key=='f') { udpBroadcastDirect("home", MOTORB);}
 //if (key=='a') { udpBroadcastDirect("stepperShiftP" + (distance), MOTORA);}
 //if (key=='s') { udpBroadcastDirect("stepperShiftN" + (distance), MOTORA);}
 //if (key=='d') { udpBroadcastDirect("stepperShiftP" + (distance), MOTORB);}
 //if (key=='f') { udpBroadcastDirect("stepperShiftN" + (distance), MOTORB);}

 //if (key=='h') { tcpBroadcastDirect("moveMin -10", CURRENTMOTOR);}
 //if (key=='j') { udpBroadcastDirect("moveMin 10", CURRENTMOTOR);}
 //if (key=='k') { udpBroadcastDirect("moveMax -10", CURRENTMOTOR);}
 //if (key=='l') { udpBroadcastDirect("moveMax 10", CURRENTMOTOR);}

 //if (key=='v') { udpBroadcastDirect("moveMin -10", MOTORB);}
 //if (key=='b') { udpBroadcastDirect("moveMin 10", MOTORB);}
 //if (key=='n') { udpBroadcastDirect("moveMax -10", MOTORB);}
 //if (key=='m') { udpBroadcastDirect("moveMax 10", MOTORB);}

if (key==';') {
   if (start) start = false;
   if (start==false) start = true;

}
if (key=='i') {
String commandLocation = "set_location 200, 0, 700";
    //tcpBroadcastDirect(commandLocation, DEVICE_IP);
    udpBroadcastDirect(commandLocation, CURRENTMOTOR);    
    String commandNumber = "setNumber 26";
    //tcpBroadcastDirect(commandNumber, DEVICE_IP);
    udpBroadcastDirect(commandNumber, CURRENTMOTOR);
}
 if (key==' ') {
   //if (start) start = false;
   //if (start==false) start = true;
   udpBroadcast("update");
 }
 if(key == ' '){
    if (gui.isVisible()){gui.hide();}
    else { gui.show();}
  }
 if (key=='`') {udpBroadcast("print");}
 if (key=='/') {udpBroadcast("udpPole");}

 if (key=='a') { udpBroadcast("motorON");}
 if (key=='s') { udpBroadcast("stop");}
 if (key=='o') { udpBroadcast("ota");}
 if (key== CODED) {
    if (keyCode== LEFT){
      udpBroadcast("stepperMove " + -(distance * MICROSTEPPING) + " " + (1500 * MICROSTEPPING) + " " + (1500* MICROSTEPPING));
      //udpBroadcastDirect("stepperMove " + -(distance * MICROSTEPPING) + " " + (1500 * MICROSTEPPING) + " " + (1500* MICROSTEPPING),CURRENTMOTOR );
  }
    if (keyCode== RIGHT){
      udpBroadcast("stepperMove " + (distance* MICROSTEPPING) + " " + (1500 * MICROSTEPPING) + " " + (1500* MICROSTEPPING));
       //udpBroadcastDirect("stepperMove " +(distance * MICROSTEPPING) + " " + (1500 * MICROSTEPPING) + " " + (1500* MICROSTEPPING),CURRENTMOTOR );

  }
     if (keyCode== UP){
      distance = distance*2;
    }
    if (keyCode== DOWN){
      distance = distance/2;
    }
  }
  if (key=='§') {
    eventCall10("wheel", 5000, 50000, 5000, 2, 100, 500, 0, 0 , 0);
    udpBroadcast("audio 0 HRB.ogg");
    eventCall10("windchime", 0, 16000, 300, 60000, 0, 0, 100, 2 , 0);
   }
   if (key=='[') {
    eventCall10("wheel", 5000, 50000, 5000, 2, 100, 500, 0, 0 , 0);
    udpBroadcast("audio 0 HRB.ogg");
    eventCall10("windchime", 0, 16000, 100, 60000, 0, 0, 100, 3 , 0);
   }
   if (key==']') {
    eventCall10("wheel", 5000, 50000, 5000, 2, 100, 500, 0, 0 , 0);
    udpBroadcast("audio 0 HRB.ogg");
    eventCall10("windchime", 0, 6000, 200, 60000, 0, 0, 100, 4 , 0);
   }
}
