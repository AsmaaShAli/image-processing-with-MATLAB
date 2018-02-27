function [new]=Quant(img,B)
%new=double(new);
[p,q,n]=size(img);
for l=1:n
    for i=1:p
        for j=1:q
            x=img(i,j,l);
            new(i,j,l)=bitand(x,B);
        end
    end
end

new=uint8(new);
end