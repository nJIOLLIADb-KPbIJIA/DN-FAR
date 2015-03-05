clear all;
%current angle of DN in degrees (from -maxAlphaDeg to maxAlphaDeg)
alphaPDeg = 35; 
%max angle of DN in degrees
maxAlphaDeg = 90; 
N = 50; % number of elements
d = 2;% between elements
lambda = 1/d; % length of wave
omega = 2*pi*299792458/lambda;
A = 1; % amplitude
alphaP = alphaPDeg/180*pi;

for alphaDeg = -maxAlphaDeg : maxAlphaDeg
    index = alphaDeg+maxAlphaDeg+1;
    Y(index) = 0;
    alpha = alphaDeg/180*pi;
    for n = 1 : N
        Y(index) = Y(index) + A*exp(j*(2*pi*n*d*(sin(alphaP)-sin(alpha))));
    end
end
plot([-maxAlphaDeg:maxAlphaDeg], real(Y))
grid on