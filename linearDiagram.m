function y = linearDiagram(numberOfElements,alpha, alphaP, d)
%#codegen
% @param d: between elements
lambda = 2*d;
y = 0*j;
for n = -numberOfElements/2 : numberOfElements/2 - 1
    %for n = 1 : N
    y = y + exp(j*2*pi*n*d*(sin(alphaP)-sin(alpha))/lambda);
end