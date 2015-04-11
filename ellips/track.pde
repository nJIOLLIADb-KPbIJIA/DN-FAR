public class track
{
 public float a; 
 public float p;
 public float i;
 public float Om;
 
 //////////////////////////////////////////////////////
 public void restore(dot d1, dot d2, float dt)        // Restore parametrs of ellips by 2 dots and d(time)
{
  float mu = 398600;
  
  float dx = d2.x-d1.x;
  float dy = d2.y-d1.y;
  float dz = d2.z-d1.z;
  float r1 = sqrt(d1.x*d1.x+d1.y*d1.y+d1.z*d1.z);
  float r2 = sqrt(d2.x*d2.x+d2.y*d2.y+d2.z*d2.z);
  float vx = dx/dt;
  float vy = dy/dt;
  float vz = dz/dt;
  float v0 = sqrt(vx*vx+vy*vy+vz*vz);
  
  float sx = (vz*(d2.y+d1.y)/2)-(vy*(d2.z+d1.z)/2);
  float sy = (vx*(d2.z+d1.z)/2)-(vz*(d2.x+d1.x)/2);   // Aria cnt
  float sz = (vy*(d2.x+d1.x)/2)-(vx*(d2.y+d1.y)/2);
  
  p = (sx*sx+sy*sy+sz*sz)/mu;
  
  float h = v0*v0- 4*mu/(r1+r2);
  
  a = -mu/h;
  
  float lx = vy*sz-vz*sy-mu*(d1.x+d2.x)/(r1+r2);             // Laplas vector 
  float ly = vz*sx-vx*sz-mu*(d1.y+d2.y)/(r1+r2);
  float lz = vx*sy-vy*sx-mu*(d1.z+d2.z)/(r1+r2);
  
  i = 3.1415/2 - acos(10*lz/(10*sqrt(lx*lx+ly*ly+lz*lz)));
  Om = acos(10*lx/(10*sqrt(lx*lx+ly*ly)));
}

//////////////////////////////////////////////////////
public float timeCH(dot d1, dot d2,float R)                            //return time for time-CH by 2 dot's position
{
  float mu = 398600;
  float e = sqrt(1-p/a);
  float r1 = sqrt(d1.x*d1.x+d1.y*d1.y+d1.z*d1.z);
  float r2 = sqrt(d2.x*d2.x+d2.y*d2.y+d2.z*d2.z);
  
  float teta0 = acos((a*(1-e*e)-(r1+r2)/2)/(e*(r1+r2)/2));    //angle of BR
  float teta4 = acos((a*(1-e*e)-R)/(e*R));                    //angle of cross R
  
  float E0 = 2*atan((sqrt((1-e)/(1+e)))*(tan(teta0/2)));
  float E4 = 2*atan((sqrt((1-e)/(1+e)))*(tan(teta4/2)));
  
  float t41 = (E0-E4-e*(sin(E0)-sin(E4)))*sqrt(a*a*a/mu);
  float t42 = (E4-E0-e*(sin(E4)-sin(E0)))*sqrt(a*a*a/mu);
  
  float t4 = t42;
  return t41;
}

//////////////////////////////////////////////////////
public float radiusNow(float t)
{
 dot d = now(t);
 float r = sqrt(d.x*d.x+d.y*d.y+d.z*d.z);
 
return r; 
}

////////////////////////////////////////////////////// 
 public dot create(float theta)        // Create dot on ellips by parametrs and angle
 {
   float e = sqrt(1-p/a);
   dot d = new dot();
   
    d.x = cos(i)*cos(Om)*cos(theta)*a*(1-e*e)/(1+e*cos(theta)) - sin(theta)*sin(Om)*a*(1-e*e)/(1+e*cos(theta));
    
    d.y = cos(i)*sin(Om)*cos(theta)*a*(1-e*e)/(1+e*cos(theta)) + sin(theta)*cos(Om)*a*(1-e*e)/(1+e*cos(theta));
    
    d.z = sin(i)*cos(theta)*a*(1-e*e)/(1+e*cos(theta));
    
    return d;
 }
 
 //////////////////////////////////////////////////////
 public dot now(float t)              // Create dot on elleps by parametrs and time
 {
  float mu = 398600;
  float theta = 0;
  float e = sqrt(1-p/a);
  float M = t*sqrt(mu/(a*a*a));
  float E = 0;
   dot d = new dot();
  
    for (int n=0;n<=6;n++)
    {
    E=M+e*sin(E);
    }
  
  theta = 2*atan(sqrt((1+e)/(1-e))*tan(E/2));
  
    d.x = cos(i)*cos(Om)*cos(theta)*a*(1-e*e)/(1+e*cos(theta)) - sin(theta)*sin(Om)*a*(1-e*e)/(1+e*cos(theta));
    d.y = cos(i)*sin(Om)*cos(theta)*a*(1-e*e)/(1+e*cos(theta)) + sin(theta)*cos(Om)*a*(1-e*e)/(1+e*cos(theta));
    d.z = sin(i)*cos(theta)*a*(1-e*e)/(1+e*cos(theta));  
    
   return d;
 }
}
