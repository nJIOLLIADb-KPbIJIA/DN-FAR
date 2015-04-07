public class track
{
 public float a; 
 public float p;
 public float i;
 public float Om;
 //public dot d;
 
 public dot create(float theta)
 {
   float e = sqrt(1-p/a);
   dot d = new dot();
   
    d.x = cos(i)*cos(Om)*cos(theta)*a*(1-e*e)/(1+e*cos(theta)) - sin(theta)*sin(Om)*a*(1-e*e)/(1+e*cos(theta));
    
    d.y = cos(i)*sin(Om)*cos(theta)*a*(1-e*e)/(1+e*cos(theta)) + sin(theta)*cos(Om)*a*(1-e*e)/(1+e*cos(theta));
    
    d.z = sin(i)*a*(1-e*e)/(1+e*cos(theta));
    
    return d;
 }
}
