close all;
clear all;
clc;
n=input("Enter no of codes bits: ");
k=input("Enter no of messages bits: ");
lp=n-k;
p=input("Enter parity matrix: ");
%Identity Matrix
ik=eye(k);
% Encoding
disp('Linear Block Codes: Encoding');
disp('Generator Matrix:');
%Concatenate arrays along specified dimension
g=cat(2,ik,p);
disp(g);
d=input('Enter message to be coded: ');
%Matrix Multiplication
c1=mtimes(d,g);
%Modulus after division
disp("The codeword is:");
c=mod(c1,2);
disp(c);
% Decoding
disp('Linear Block Codes: Decoding');
r=input('Enter Received bit: ');
disp("Transpose of parity matrix:");
pt=p.';
disp(pt);
ilp=eye(lp);
disp('Parity check matrix:');
h=cat(2,pt,ilp);
disp(h);
disp("Transpose parity check matrix:");
ht=h.';
disp(ht);
s1=mtimes(r,ht);
disp('Syndrome matrix:');
s = mod(s1,2);
disp(s);
if (s==0)
    disp("The received code is correct.");
else
    for i = 1:n
        m = xor(s,ht(i,:));
        if (m==0)
            row = i;
            break;
        end
    end
    r(1, row) = ~r(1,row);
    disp('Correct codeword is:');
    disp('c=');
    disp(r);
end
