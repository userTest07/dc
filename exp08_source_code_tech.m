clc;
close all;
clear all;
n=input('Enter the no. of symbols:');
N=[1:n];
P=input('Enter the probability of input system P(X):');
PX=sort(P,'descend');
disp('The sorted probabilities are:');
disp(PX);
% To calculate entropy of source
HX=0;
for i=1:n
HX=HX+(-sum(PX(i).*log2(PX(i))));
i=i+1;
end
fprintf('\n Entropy of input X is HX: %.2f Bits/Message\n', HX);
% To  calulate and display the codes
dict=huffmandict(N,P);
disp('Huffman Dictionary:');
disp(dict);
% To calulate average codeword length
disp('Codeword legths are:');
temp=dict;
for i=1:n
temp{1,i}=length(temp{1,i});
end
disp(temp);
avglen=0;
for i=1:n
avglen=avglen+sum(PX(i)*temp{1,i});
end
fprintf('\n The Average Code wors length is: %.3f Bits/Message\n',avglen );
%To find the efficiency of codes
Eff=(HX/avglen);
PerEff=Eff*100;
fprintf('\n The percentage Efficiency of the code is: %.3f\n',PerEff);
%To find the redundency of codes
Redundancy=1-Eff;
PerRedundancy=Redundancy*100;
fprintf('\n The percentage Redundancy of the code is: %.3f \n',PerRedundancy);
