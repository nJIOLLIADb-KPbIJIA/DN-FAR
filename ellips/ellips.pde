float t = 0;                    // Time var
float mu = 398600;            //Gravity cnt
float scale = 100;              //scale for plot
track realBR = new track();   //Class of track
track newBR = new track();
dot[] dots = new dot[314];    //array of dots
dot[] dots_new = new dot[314];

void setup()
{
 size(1150,600); 
 restart();
}

void draw()
{
  fill(#735184);
  rect(5,10,200,30);
  fill(0);
  text("T(minut)= "+2*3.1415*sqrt(realBR.a*realBR.a*realBR.a/mu)/60,10,30);        // Period
  
  if (millis()%100>20)
  {t = t+float(millis()%100)/1000; }
  
  sb1 = textrect(50, 50,80,25,s1,sb1,"a=");    //enter parametrs
  sb2 = textrect(50, 100,80,25,s2,sb2,"p=");
  sb3 = textrect(50, 150,80,25,s3,sb3,"i=");
  sb4 = textrect(50, 200,80,25,s4,sb4,"Om=");
  sb5 = textrect(50, 250,100,25,s5,sb5,"Scale=");
  
  realBR.a=float(s1);
  realBR.p=float(s2);
  realBR.i=float(s3)*3.14/180;
  realBR.Om=float(s4)*3.14/180;
  scale = float(s5);scale = float(s5);
  
//plot_circul(250,10,280,280);
//plot_circul(250,300,280,280);
//plot_circul(550,10,280,280);
//plot_circul(550,300,280,280);
//plot_circul(850,10,280,280);
//plot_circul(850,300,280,280);
  
  plot_drawXY(250,10,280,280,dots);
  plot_drawXZ(250,300,280,280,dots);
  
  plot_pointXY(550,10,280,280,realBR.now(t));
  plot_pointXZ(550,300,280,280,realBR.now(t));
  
  dots_new = create_ellips(newBR);
  plot_drawXY(850,10,280,280,dots_new);
  plot_drawXZ(850,300,280,280,dots_new);


      //test
  fill(#735184);
  rect(5,400,200,90);
  fill(0);
  newBR.restore(realBR.now(t),realBR.now(t-0.01),0.01);
  text("a= "+newBR.a,20,420);
  text("p= "+newBR.p,20,440);
  text("i= "+newBR.i*180/3.1415,20,460);
  text("Om= "+newBR.Om*180/3.1415,20,480);
}


void keyPressed()
{
     if (sb1)                           
   {s1 = entertext(s1); restart();}
     if (sb2)
     {s2 = entertext(s2); restart();}              //block of text input
         if (sb3)
         {s3 = entertext(s3); restart();} 
              if (sb4)
              {s4 = entertext(s4); restart();} 
                  if (sb5)
                  {s5 = entertext(s5); restart();}               
}
