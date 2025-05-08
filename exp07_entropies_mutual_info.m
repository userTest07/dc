clc;
close all;
clear all;
%To find Entropy HX of input  from the given input probabilities PX
PX=input('Enter the probability of input system P(X):')
n= rows(PX);
o=columns(PX);
HX=0;
for i=1:o
HX=HX+(-sum(PX(i).*log2(PX(i))));
i=i+1;
end
fprintf('\n Entropy of input X is HX: %.2f Bits/Message\n', HX);
%To find Joint probabilities from the conditional probabilities PYbyX
PYbyX=input('Enter the probability of noise  P(Y/X):')
l=rows(PYbyX);
m=columns(PYbyX);
%disp( 'The joint probability PXY:');
j=1;
for i=1:o,
PX(i);
for k=1:m;
PXY(j,k)=PYbyX(j,k).*PX(i);
end
j=j+1;
end
disp(PXY);
%To find Output probabilities from the joint probabilities PXY
disp('The probability of output system P(y):')
m=columns(PXY);
j=1;
for k=1:m,
PY(k)=sum(PXY(j,k)+PXY(j+1,k));
k=k+1;
end
disp(PY);
%To find Entropy HY of input  from the given input probabilities PY
m=columns(PY);
HY=0;
for K=1:m,
HY=HY+(-sum(PY(K).*log2(PY(K))));
K=K+1;
end
fprintf('\n Entropy of output Y is HY: %.2f Bits/Message', HY);
%To find Entropy HXY
HXY=0;
for j=1:l,
for k=1:m,
HXY=HXY+(-(sum(PXY(j,k).*log2(PXY(j,k)))));
end
end
fprintf('\n Entropy of system is HXY: %.2f Bits/Message \n', HXY);
%To find the conditional entropy
HXbyY=HXY-HY;
fprintf('\n Entropy of system is HXbyY: %.2f Bits/Message \n', HXbyY);
%To find Mutual Information
IXY=HX-HXbyY;
fprintf('\n Mutual Information of system is IXY: %.4f Bits/Message \n', IXY);
