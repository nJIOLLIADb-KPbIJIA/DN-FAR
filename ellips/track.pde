public class track
{
 public float a; 
 public float p;
 public float i;
 public float Om;
 
 public dot create(float theta)
 {
   float e = sqrt(1-p/a);
   dot d = new dot();
   
    d.x = cos(i)*cos(Om)*cos(theta)*a*(1-e*e)/(1+e*cos(theta)) - sin(theta)*sin(Om)*a*(1-e*e)/(1+e*cos(theta));
    
    d.y = cos(i)*sin(Om)*cos(theta)*a*(1-e*e)/(1+e*cos(theta)) + sin(theta)*cos(Om)*a*(1-e*e)/(1+e*cos(theta));
    
    d.z = sin(i)*cos(theta)*a*(1-e*e)/(1+e*cos(theta));
    
    return d;
 }
 
 public dot now(float t)
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
