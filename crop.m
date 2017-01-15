function imCrop = crop(im,cropSize)
imCrop = im(cropSize+1:end-cropSize,cropSize+1:end-cropSize);
end