clc;
clear;

N = 60;
D = 1;
b = 0;
B = ones(1,46);
A = load('CNT-5,5-Distances.txt');
for s = 0.1:0.02:1
b = b+1;
f = 2.310*exp(-20.844/4*(s^2))+1.020*exp(-10.208/4*(s^2))+1.589*exp(-0.569/4*(s^2))+0.865*exp(-51.651/4*(s^2))+0.216;
f2 = f*f;
sum = 0;
for i = 1:1:N*(N-1)/2
        sum = sum+sin(2*pi*s*A(i,1))/(2*pi*s*A(i,1));
end

B(1,b) = f2*(N+D*sum);
end
s = 0.1:0.02:1;
plot(s,B,'r.');
xlim([0,1]);
ylim([0,14000]);
xlabel('Scattering Parameter');
ylabel('Normalised Intensity');


