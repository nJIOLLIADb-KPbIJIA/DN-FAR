String s1 = "1";
boolean sb1 = false;
String s2 = "1";
boolean sb2 = false;
String s3 = "0";            //var parametrs orbit
boolean sb3 = false;
String s4 = "0";
boolean sb4 = false;
String s5 = "100";
boolean sb5 = false;
    

String entertext(String s)        //Function for entering text
{
     if ((key>='0')&&(key<='9')&&(s.length()<4)||(key==46))
    {
    s+=key;
    }
    
     if ((int(key)==8)&&(s.length()>0))
    {
    s = s.substring(0,s.length()-1);
    } 
    return s;
}


boolean textrect(int x, int y, int xh, int yh, String s, boolean sb, String comm)    
{                                              //function for drawing rect-text
  fill(#735184); 
  stroke(255);
  rect(x,y,xh,yh);
  if ((mouseX>=x)&&(mouseX<=x+xh)&&(mouseY>y)&&(mouseY<=y+yh))
  {
  fill(#806b2a);               //Block of rect
  rect(x,y,xh,yh);
  sb = true;
  }
  else
  {sb = false;}
  
  fill(255);
  textSize(15);                         //Block of output text
  text(comm+s, x+5, y+16);
  
  return sb;
}