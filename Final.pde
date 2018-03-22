//class Final
class Final 
{
  int xpos;
  int ypos;
  String myText;
  int delayTime;
  int creationTime;
  int currentIndex;
  Final( String _myText, int _xpos, int _ypos, int _delayTime ) 
  {
    myText = _myText;
    xpos = 93;
    ypos = 160;
    delayTime = _delayTime;
    creationTime = millis();
    currentIndex = 0;
  }
  
  void draw() 
{
  while(millis() - creationTime > delayTime)
  {
    creationTime += delayTime;
    currentIndex+=10;
  }
  
  PFont dasFont = createFont("Helvetica", 12);
  textFont( dasFont );
  fill(0,100,100);
  stroke(255);
  rect(xpos, ypos, width-183, height-362 );
  fill(255);
  noStroke();
  currentIndex = constrain( currentIndex, 0, myText.length());
  text( myText.substring(0,currentIndex), xpos+3, ypos+12 );
  }
}
