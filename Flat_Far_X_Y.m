clear;
clc;
thet = 45;
phi = 15;
Nx = 50;
Ny = 50;
d = 5;
lam = 1;
Xx = eye(Ny,Nx);
Xy = eye(Ny,Nx);
%H = hann(Ny)*hann(Nx)';
for m = 1:Ny
    for n = 1:Nx
        phase1 = 2*pi*n*d*sin(thet*pi/180)*cos(phi*pi/180)/lam ;
        phase2 =  2*pi*m*d*sin(thet*pi/180)*sin(phi*pi/180)/lam;
        Xx(m,n) = 1*exp(j*phase1);
        Xy(m,n) = 1*exp(j*phase2);
        X = Xx.*Xy;
    end
end
%Xx = Xx.*H;
%Xy = Xy.*H;
%X = X.*H;
for thet_n = 1:80
    for phi_n = 1:60
        Yx(thet_n,phi_n)=0;
        Yy(thet_n,phi_n)=0;
        for ny = 1:Ny
            for nx = 1:Nx
                phase1 = 2*pi*nx*d*sin(thet_n*pi/180)*cos(phi_n*pi/180)/lam; 
                phase2 =  2*pi*ny*d*sin(thet_n*pi/180)*sin(phi_n*pi/180)/lam;
                Yx(thet_n,phi_n)=Yx(thet_n,phi_n)+X(ny,nx)*exp(-j*phase1);
                Yy(thet_n,phi_n)=Yy(thet_n,phi_n)+X(ny,nx)*exp(-j*phase2);
                Y = Yx.*Yy;
            end
        end
        
    end
end

figure
meshc(abs(Yx))
grid on
title('Xrow')
figure
meshc(abs(Yy))
grid on
title('Yrow')
figure
meshc(abs(Y))
grid on
title('XY')