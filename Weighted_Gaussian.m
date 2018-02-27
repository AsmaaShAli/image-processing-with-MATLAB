function [mask]= Weighted_Gaussian(sag)
N = round(3.7* sag - 0.5);
masksize= (2*N) +1 ;
x= floor( masksize/2);
y= floor( masksize/2);


for i=-x:x
    for j=-y:y 
      
             mask(i+x+1,j+y+1)=((1/(2*pi*sag*sag))*(exp(-(i*i+j*j)/(2*sag*sag))));
             
      
    end
     
end

        
            
