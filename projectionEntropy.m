function entropy = projectionEntropy(im,window)

dimX = window(1)/2;
dimY = window(2)/2;

%% Test 
%clearvars;
m = size(im,1);
n = size(im,2);
%dimY = 2;
im = rand([m n]);

%Sanity check 
a = [1002 1860];
b = [1338 2038];
center1 = (a(1)+b(1))/2;
center2 = (a(2)+b(2))/2;

imCum = cumsum(im,2);
imCumShiftLeft = circshift(imCum,-dimY,2);
imCumShiftRight = circshift(imCum,dimY,2);

p = imCumShiftLeft - imCumShiftRight;
compP = p(center1-dimX+1:center1+dimX,center2);
imCrop = im(center1-dimX+1:center1+dimX,center2-dimY+1:center2+dimY);
trueP = sum(imCrop,2);
display([compP trueP])
%%
plogp = p.*real(log(p));

%% Handle p =< 0 case 
plogp(p<=0) = deal(0);

plogpCum = cumsum(plogp,1); 
plogpCumShiftUp = circshift(plogpCum,-dimY,1);
plogpCumShiftDown = circshift(plogpCum,dimY,1);
plogpSum = plogpCumShiftUp - plogpCumShiftDown;
pCum = cumsum(p,1);
pCumShiftUp = shift(pCum,-dimY,1);
pCumShiftDown = shift(pCum,dimY,1);

pSum = pCumShiftUp-pCumShiftDown;
entropy = -plogpSum./pSum+real(log(pSum));

compEntropy=entropy(center1(2),center1(1));
compP = p(a(2):b(2),center1(1));

%True entropy
imCrop = im(a(2):b(2),a(1):b(1));
s = sum(imCrop(:));
trueP = sum(imCrop,2);
trueEntropy = -sum(log(trueP).*trueP)/s + log(s);

display([compP trueP]);

%display([compEntropy trueEntropy]);

end