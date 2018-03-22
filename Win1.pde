//Class Win1
class Win1 
{
  int xpos;
  int ypos;
  String myText;
  int delayTime;
  int creationTime;
  int currentIndex;
  Win1( String _myText, int _xpos, int _ypos, int _delayTime ) 
  {
    myText = _myText;
    xpos = width/3-12;
    ypos = height/2-10;
    delayTime = _delayTime;
    creationTime = millis();
    currentIndex = 0;
  }

void draw() 
{
  while(millis() - creationTime > delayTime)
  {
    creationTime += delayTime;
    currentIndex+=1;
  }
  
  PFont dasFont = createFont( "Helvetica", 12);
  textFont( dasFont );
  fill(0,100,100);
  stroke(255);
  rect(xpos, ypos, width - 304, 15 );
  fill(255);
  noStroke();
  currentIndex = constrain( currentIndex, 0, myText.length());
  text( myText.substring(0,currentIndex), xpos+3, ypos+12 );
  }
}
