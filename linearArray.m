clear all;
%current angle of DN in degrees (from -maxAlphaDeg to maxAlphaDeg)
alphaPDeg = 35; 
%max angle of DN in degrees
maxAlphaDeg = 90; 
N = 50; % number of elements
d = 2;% between elements
lambda = 1/d; % length of wave
%omega = 2*pi*299792458/lambda;
A = 1; % amplitude
stepByAlpha = 0.5;

alphaP = alphaPDeg/180*pi;
i = 0;
for alphaDeg = -maxAlphaDeg : stepByAlpha : maxAlphaDeg
    %alphaDeg
    i = i + 1;
    Y(i) = 0;
    alpha = alphaDeg/180*pi;
    for n = -N/2 : N/2 - 1
        Y(i) = Y(i) + A*exp(j*2*pi*n*d*(sin(alphaP)-sin(alpha)));
    end
end
plot([-maxAlphaDeg:stepByAlpha:maxAlphaDeg], real(Y))
grid on