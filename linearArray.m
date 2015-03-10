clear all;
%current angle of DN in degrees (from -maxAlphaDeg to maxAlphaDeg)
%otsos phphphph
alphaPDeg = 35; 
%max angle of DN in degrees
maxAlphaDeg = 90; 
N = 50; % number of elements
d = 0.5; % between elements
lambda = 2*d; % length of wave
%omega = 2*pi*299792458/lambda;
A = 1; % amplitude
stepByAlpha = 1;

alphaP = alphaPDeg/180*pi;
i = 0;
for alphaDeg = -maxAlphaDeg : stepByAlpha : maxAlphaDeg
    i = i + 1;
    Y(i) = 0;
    alpha = alphaDeg/180*pi;
    for n = -N/2 : N/2 - 1
    %for n = 1 : N
        Y(i) = Y(i) + A*exp(j*2*pi*n*d*(sin(alphaP)-sin(alpha))/lambda);
    end
end
subplot(2,1,1);
plot([-maxAlphaDeg:stepByAlpha:maxAlphaDeg], real(Y));
subplot(2,1,2);
polar([-maxAlphaDeg:stepByAlpha:maxAlphaDeg].*(pi/180), real(Y));
grid on
