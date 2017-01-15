function imPad = padarray(im, padSize)

imPad = zeros(size(im)+2*padSize);
imPad(padSize+1:end-padSize,padSize+1:end-padSize)=im;
end