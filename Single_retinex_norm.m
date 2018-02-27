function [new]=Single_retinex_norm(img);
[p,q,n] = size(img); 
NewMin=0;
NewMax=255;

img=double(img);
for l=1:n
    oldmin = min(min(img(:,:,l)));
    oldmax = max(max(img(:,:,l)));
for i=1:p
    for j=1:q
        oldvalue = img(i,j,l);
        newvalue = (((oldvalue - oldmin)*(NewMax-NewMin))/(oldmax - oldmin))+NewMin;
        new(i,j,l) = newvalue;
    end
end
end


