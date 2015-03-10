%{
clear all;
% configure angles
EpsilonDeg = 10; % terrain angle (from 0 to maxEnsilonDeg)
ThetaDeg = 10; % azimuth angle (from -maxTheta Deg to +maxThetaDeg)
%configure array
d = 2; %between elements
maxEpsilonDeg = 60; % 35 deg from 5H79
maxThetaDeg = 60; % 55 deg from 5H79 (110/2)
lambda = 1/d;
omega = 2*pi*299792458/lambda;
A = 1; %amplitude of signal
% configure number of array
Nx = 10;
Ny = 10;


% translates angles to radians
Epsilon = EpsilonDeg / 180 * pi;
Theta = ThetaDeg / 180 *pi;

Y = zeros(Ny, Nx);
%{
for m = 1:Ny
    for n = 1 : Nx
        psiX = 2*pi*(n*d-1)*d*sin(Epsilon)*cos(Theta)/lambda; %delay by X
        psiY = 2*pi*(m*d-1)*d*sin(Epsilon)*sin(Theta)/lambda; %delay by Y
        Y(m, n) = sin(omega*t + psiX + psiY); % (2.1.1) p. 13
        
    end
end
%}

stepByEpsilon = 1;
stepByTheta = 1;
Y = zeros(maxEpsilonDeg/stepByEpsilon + 1, maxThetaDeg/stepByTheta + 1);
%iterate by angles
for epsDeg = -maxEpsilonDeg : stepByEpsilon : maxEpsilonDeg
    indexY = epsDeg + maxEpsilonDeg + 1;
    for thetDeg = -maxThetaDeg : stepByTheta : maxThetaDeg
        indexX = thetDeg + maxThetaDeg + 1;
        %iterate by elements
        for ny = 1 : Ny
            for nx = 1 : Nx
                psiX = 2*pi*(n*d-1)*d*sin(Epsilon)*cos(Theta)/lambda; %delay by X
                psiY = 2*pi*(n*d-1)*d*sin(Epsilon)*cos(Theta)/lambda; %delay by Y
                Y(indexX, indexY) = A * exp(j*(2*pi*nx*d*(sin(alphaP)-sin(alpha)))) * exp()
                
            end
        end
    end
end
mesh(Y)
%}  


