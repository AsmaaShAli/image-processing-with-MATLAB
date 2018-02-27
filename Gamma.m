function  new =Gamma(img,g)
img=double(img);
new=img.^g;
new = norm(new);
new=uint8(new);