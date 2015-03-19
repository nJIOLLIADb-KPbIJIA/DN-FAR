clear;
clc;
%r = [-Ny/2:-1]; % I , IV
%r = [0:Ny/2-1]; % III , II
%S = [-Nx/2:-1]; % II , I
%S = [0:Nx/2-1]; % III , IV
%alphaP = acos(r.*lam./Ny./d)*180/pi;
%bettaP = acos(S.*lam./Nx./d)*180/pi;
Nx = 16;
Ny = 16;
d = 0.5;
lam = 2*d;
X = eye(Ny,Nx);
%alpha =120
%betta = 60
r1 = [-Ny/2:-1]; % I , IV
r2 = [0:Ny/2-1]; % III , II
S1 = [-1:-1:-Nx/2]; % II , I
S2 = [Nx/2-1:-1:0]; % III , IV

salp(1:Ny/2) = acos(r1.*lam./Ny./d)*180/pi;
salp(Ny/2+1:Ny) = acos(r2.*lam./Ny./d)*180/pi;
sbet(1:Nx/2) = acos(S2.*lam./Ny./d)*180/pi;
sbet(Nx/2+1:Nx) = acos(S1.*lam./Ny./d)*180/pi;

for betta = sbet
    for alpha = salp

for m = 1:Ny
    for n = 1:Nx
        phase1 = 2*pi*n*d*cos(alpha*pi/180)/lam ;
        phase2 =  2*pi*m*d*cos(betta*pi/180)/lam;
        X(m,n) =5*sin(phase1+phase2);
    end
end

Sp = fft2(X,Nx,Ny);

figure(1)
r = [1:Ny/2]; % III , II
S = [1:Nx/2]; % III , IV
alphaP = acos(r.*lam./Ny./d)*180/pi;
bettaP = acos(S.*lam./Nx./d)*180/pi;
subplot 223
if alpha <= 90 && betta <=90 
    contourf(alphaP,bettaP,abs(Sp(1:Nx/2,1:Ny/2)));
end
grid on
xlabel('alpha');
colormap summer
hold on

r = [1-Ny/2:0]; % I , IV
S = [1:Nx/2]; % III , IV
alphaP = acos(r.*lam./Ny./d)*180/pi;
bettaP = acos(S.*lam./Nx./d)*180/pi;
subplot 224
if alpha > 90 && betta <= 90
    contourf(alphaP,bettaP,abs(Sp(1:Nx/2,Ny/2+1:Ny)));
end
grid on
hold on
set(gca,'YTick',[]);

r = [1-Ny/2:0]; % I , IV
S = [1-Nx/2:0]; % II , I
alphaP = acos(r.*lam./Ny./d)*180/pi;
bettaP = acos(S.*lam./Nx./d)*180/pi;
subplot 222   
if alpha > 90 && betta > 90
    contourf(alphaP,bettaP,abs(Sp(Nx/2+1:Nx,Ny/2+1:Ny)));
end
grid on
colormap summer
hold on
set(gca,'XTick',[]); 
set(gca,'YTick',[]);
    
r = [1:Ny/2]; % III , II
S = [1-Nx/2:0]; % II , I
alphaP = acos(r.*lam./Ny./d)*180/pi;
bettaP = acos(S.*lam./Nx./d)*180/pi;
subplot 221    
if alpha <= 90 && betta > 90
    contourf(alphaP,bettaP,abs(Sp(Nx/2+1:Nx,1:Ny/2)));
end
grid on
ylabel('betta');
colormap summer
hold on
set(gca,'XTick',[]);
%figure(4)
%contourf(abs(Sp))
%figure
%mesh(r,S,abs(Sp(1:Nx/2,Ny/2+1:Ny)))
%mesh(salp,sbet,abs(S(1:Nx/2,1:Ny/2)))
%grid on
%pause(0.1);
  end
end