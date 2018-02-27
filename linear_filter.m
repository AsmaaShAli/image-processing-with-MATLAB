function [new]=Box_filter(image,mask)
image=double(image);
[p2,q2,n2]=size(mask);
m=round(p2/2);
pad= padarray(image,[m m],'replicate');
 
[p,q,n]=size(pad);

for l=1:n
    for i=1:p
        for j=1:q
            value=0;
            if(p >= i+ p2 && q  >= j+q2 )
                    a=1;
                    b=1;
            for x=i:i+p2-1
                for y=j:j+q2-1
                    if (a <= p2 && b <= q2 )
                    value=value+pad(x,y,l)*mask(a,b);
                    b = b+1;
                    end     
                end
                b = 1;
                a = a+1;
            end
            new(i,j,l)=value;
            end
        end
    end
end

new = uint8(new);

