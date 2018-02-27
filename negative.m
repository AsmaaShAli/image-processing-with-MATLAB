function new=negative(image)
[p,q,n]=size(image);
for(l=1:n)
for(i=1:p)
    for(j=1:q)
        new(i,j,l)=255-image(i,j,l);
    end
end
end
new=uint8(new);
end
