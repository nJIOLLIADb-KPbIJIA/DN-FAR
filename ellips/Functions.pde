void plot_grid(int x,int y,int dx,int dy)    //Draw grid
{
 fill(255);
 rect(x,y,dx,dy); 
 stroke(0);
 line(x+dx/2,y,x+dx/2,y+dy);
 line(x,y+dy/2,x+dx,y+dy/2);    //Axis
}

//////////////////////////////////
void plot_drawXY(int x,int y,int dx,int dy, dot[] D)    // Draw ellips
{
   for (int i=1;i<=313;i++)
   {
   stroke(#ff2400);
   line(D[i-1].x/scale+x+dx/2,D[i-1].y/scale+y+dy/2,D[i].x/scale+x+dx/2,D[i].y/scale+y+dy/2);
   } 
}

//////////////////////////////////
void plot_drawXZ(int x,int y,int dx,int dy, dot[] D)    // Draw ellips
{
   for (int i=1;i<=313;i++)
   {
   stroke(#ff2400);
   line(D[i-1].x/scale+x+dx/2,D[i-1].z/scale+y+dy/2,D[i].x/scale+x+dx/2,D[i].z/scale+y+dy/2);
   } 
}

//////////////////////////////////
void plot_pointXY(int x,int y,int dx,int dy, dot D)    // point-Draw ellips
{
   stroke(#ff2400);
   line(D.x/scale+x+dx/2,D.y/scale+y+dy/2,D.x/scale+x+dx/2,D.y/scale+y+dy/2);
}

//////////////////////////////////
void plot_pointXZ(int x,int y,int dx,int dy, dot D)    // point-Draw ellips
{
   stroke(#ff2400);
   line(D.x/scale+x+dx/2,D.z/scale+y+dy/2,D.x/scale+x+dx/2,D.z/scale+y+dy/2);
}

//////////////////////////////////
void restart()         //refresh canvas
{
t = 0;  
  
background(0x735184);
plot_grid(250,10,280,280);   //grid XY 1 
plot_grid(250,300,280,280);   //grid XZ 1  

plot_grid(550,10,280,280);   //grid XY 2
plot_grid(550,300,280,280);   //grid XZ 2

plot_grid(850,10,280,280);   //grid XY 3  
plot_grid(850,300,280,280);   //grid XZ 3

dots = create_ellips(realBR);
}

//////////////////////////////////
dot[] create_ellips(track T)    //return array of dots for THE Track
{
 dot[] d = new dot[314];
 
   for (int teta=0;teta<=313;teta++)
   {
   d[teta] = T.create(2*float(teta)/100);
   }
 return d ;
}

//////////////////////////////////
