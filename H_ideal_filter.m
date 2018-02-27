function [filter]=ideal_filter(D0,img)
[m,n,k] = size(img);


    for i=1:m
        for j=1:n
           d= sqrt(( (i-(m/2) )^2) +((j-(n/2))^2) );
            if (d > D0 )
                filter(i,j)= 1;
            else
                filter(i,j) = 0;
            end
        end
    end
end
