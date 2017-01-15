%% 
clearvars; close all;

%% Images                           

folder = 'C:\Users\Jens Joergensen\Broadway33';
im = double(imread('89.jpg'))/255;

%% Convert to black and white 
im = rgb2gray(im);
window = [200 200];
%% Padding 
padsize = 200;
imPad = padarray(im,padsize);
center = size(imPad)/2;

%% Entropy computation 
numAngles = 20;
angles = linspace(-10,10,numAngles)/180*pi;
entropy = zeros([size(im) numAngles]);

iCount =1;

%%
figure
   imshow(imPad)

%%
for angle = angles
   imRot = imrotate(imPad,angle,center);
   %imshow(imRot)
   imRotEnt = projectionEntropy(imRot,window);
   %imshow(imRotEnt,[])
   imRotEntRot =  imrotate(imRotEnt,angle,center);
   %imshow(imRotEntRot)
   imEntCrop = crop(imRotEntRot,padsize);
   %imshow(imEntCrop)
   entropy(:,:,iCount) = imEntCrop;
   iCount = iCount +1;
end

%% entropy
figure
  imshow(im); hold on 

p=round(ginput(1));
plot(p(1),p(2),'+','Color','red')
entLine = reshape(entropy(p(2),p(1),:),[],1);
figure
  plot(entLine)

%%
figure 
   imshow(im) 
   
% Select region of image
points = round(ginput(2));
a = points(1,:);
b = points(2,:);

a = [1002 1860];
b = [1338 2038]; 
window = b-a;

figure
   imshow(im); hold on 
   plot(a(1),a(2),'+','Color','red')
   plot(b(1),b(2),'+','Color','red')

%% Sanity check 
imCrop = im(a(2):b(2),a(1):b(1));
figure
   imshow(imCrop); 
 
%% Sanity check projection computation
angle = 0;
center = (a + b)/2;
imRotEnt = projectionEntropy(im,window);

% %%
% imEnt =  imrotate(imRotEnt,angle,center);
% 
% compEntropy = imEnt(center(2),center(1)); 
% 
% display([trueEntropy compEntropy])
% % figure
% %    histogram(imCrop)
% 
% 
% %% Rotate image 
% numAngles = 10;
% plogp = zeros(2*numAngles+1,1);
% 
% imBest = imCrop;
% minEntropy = inf;
% for i =- numAngles: numAngles
%   angle = i/180*pi;
%   [plogp(i+numAngles+1),imTemp] = projectionEntropyObsolete(im,angle,a,b);
%   if(plogp(i+numAngles+1)<minEntropy)
%       minEntropy = plogp(i+numAngles+1);
%       imBest = imTemp;
%   end
% end
% 
% %%
% center = round((a+b)/2);
% plogpNew = -reshape(entropy(center(2),center(1),:),[],1);
% 
% %% Plot entropy
% figure
%    plot(plogp); hold on
%    %plot(plogpNew)
%    
% figure
%    imshow(imBest)