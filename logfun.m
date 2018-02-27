function new=logfun(image)
image=imread('1.jpg');
[p,q,n]=size(image);

for l=1:n
    for i=1:p
        for j=1:q
            value=image(i,j,l)+1;
            value=double(value);
            new(i,j,l)=log(value)*image(i,j,l);
        end
    end
end
new=uint8(new);
