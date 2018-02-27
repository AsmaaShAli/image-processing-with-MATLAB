function new_img= reverse (newW,newH,img)
img = double(img);

[p,q,n]= size(img);

wr= p / newW;
hr = q / newH;

for l=1:n
    for i=1:newW
        for j=1:newH
            
            x = round (i*wr);
            y = round (j*hr);
            
            x1 = round(x);
            x2 = x1+1;
            
            y1= round(y);
            y2 = y1+1;
            
            if (x1 < 1)
                x1 = 1;
            end
            
            if (x1 > p )
                x1 = p;
            end
            
            if (x2 < 1 )
                x2 = 1;
            end
            
            if (x2 > p)
                x2 = p;
            end
            
            if (y1 < 1)
                y1 = 1;
            end
            
            if (y1 > q)
                y1 = q;
            end
            
            if (y2 < 1)
                y2 = 1;
            end
            
            if (y2 > q )
                y2 = q;
            end
            
            p1 = img(x1,y1,l);
            p2 = img(x2,y1,l);
            p3 = img(x1,y2,l);
            p4 = img(x2,y2,l);
            
            xF = x - x1;
            yF = y - y1;
            
            z1 = p1*(1-xF)+p2*xF;
            z2 = p3*(1-xF)+p4*xF;
            
            newP = z1*(1-yF)+z2*yF;
            new_img(i,j,l) = newP;
                 
        end
    end
end

new_img = uint8(new_img);
end
