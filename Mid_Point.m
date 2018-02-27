function [new]=Mid_Point(image,maskSize)
image=double(image);
p2=maskSize;
q2=maskSize;
m=round(p2/2);
pad= padarray(image,[m m],'replicate');
 
[p,q,n]=size(pad);

for l=1:n
    for i=1:p
        for j=1:q
            
            if(p >= i+ p2 && q  >= j+q2 )
                a=1;
                b=1;
            for x=i:i+p2-1
                for y=j:j+q2-1
                    
                    if (a <= p2 && b <= q2 )
                    mask(a,b)=pad(x,y,l);
                    
                    b = b+1;
                    end
                end
                b=1;
                a=a+1;
            end
            %min
                minvalue=min(min(mask));
                
            %max
                maxvalue=max(max(mask));
                new(i,j,l)=(minvalue+maxvalue)/2;
          
            end
        end
    end
end

new=uint8(new);

