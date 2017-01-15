function [entropy,im] = projectionEntropyObsolete(im,angle,a,b)

center = (a + b)/2;
im = imrotate(im,angle,center);

%% Cropped image 
im = im(a(2):b(2),a(1):b(1));

%% Mask
siz = size(im);

%%
s = sum(im(:));
p = sum(im,2)

%%
% figure
%    imshow(im)
%    title(num2str(angle))

%% Entropy
entropy = -sum(log(p).*p)/s + log(s);

end