function mask = circleMask(siz)

%% Find center 
center = siz/2;
radius = siz/2;

%% Pixel centers 
[Y,X]=meshgrid(1:siz(1),1:siz(2));

XCenter = X-center(2);
YCenter = Y-center(1);

a = radius(1);
b = radius(2);

mask = (XCenter/a).^2 + (YCenter/b).^2 <=1; 

% figure
%    imshow(mask)
end