function matShift = shift(mat,j,dim)

% m = 5;
% n = 8;
% j = 1;
% dim = 3;
% mat = reshape(1:m*n,[m n]);
matShift = circshift(mat,j,dim);

if(dim == 1)
   if(j>0)
      matShift(1:min(j,size(mat,dim)),:)=deal(0);
   elseif(j<0)
      matShift(max(1,end+1+j):end,:) = deal(0);
   end
elseif(dim == 2)
   if(j>0)
      matShift(:,1:min(j,size(mat,dim)))=deal(0);
   elseif(j<0)
      matShift(:,max(1,end+1+j):end) = deal(0);
   end
else
    error('Only implemented for dimension 1 and 2')
end

%matShift
end

