function imRot = imrotate(im,angle,center)

%% Find center 
siz = size(im);


%% Pixel centers 
[Y,X]=meshgrid(1:siz(2),1:siz(1));

%% Rotate points 
s = sin(angle);
c = cos(angle);

XCenter = X-center(2);
YCenter = Y-center(1);

%Sanity check 
% XCenter(center(2),center(1))
% YCenter(center(2),center(1))

XPrime = c.*XCenter + s.*YCenter + center(2);
YPrime = -s.*XCenter + c.*YCenter+ center(1);

%%
imRot = interp2(Y,X,im,YPrime,XPrime);

imRot(isnan(imRot)) = deal(0);
%% Sanity check 
% figure 
%   imshow(im); hold on 
%   plot(center(1),center(2),'+','Color','r')
%   
% figure
%   imshow(imRot); hold on 
%   plot(center(1),center(2),'+','Color','r')

end
