function[new]=AddFun(img1,img2)
[p,q,n]=size(img1);
img=reverse(p,q,img2);

    for l=1:n
    for i=1:p
        for j=1:q
           
            new(i,j,l)=img1(i,j,l)+img(i,j,l);      
        end
    end
    end
end

    
