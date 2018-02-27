function newx=Gray(image)
image = double(image);

[p,q,n]=size(image);
R = image(:,:,1);
G = image(:,:,2);
B = image(:,:,3);

for i=1:p
    for j=1:q
        newx(i,j) = round((R(i,j)+G(i,j)+B(i,j))/3);
    end
end
newx=uint8(newx);
end
