function [new]=Box_filter(image,masksize)
image=double(image);
m=round(masksize/2);
pad= padarray(image,[m m],'replicate');

[p,q,n]=size(pad);

for l=1:n
    for i=1:p
        for j=1:q
            value=0;
            if(p >= i+ masksize & q  >= j+ masksize )
            for x=i:i+masksize-1
                for y=j:j+masksize-1
                    value=value+pad(x,y,l);
                end
            end
           
            value=value/(masksize*masksize);
            new(i,j,l)=value;
            end
        end
    end
end

new = uint8(new);

