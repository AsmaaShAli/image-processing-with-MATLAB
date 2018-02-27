function ft2=L_Ideal(d,img)
f=fft2(img);
f1=fftshift(f);
R=real(f1);
I=imag(f1);

filter=ideal_filter(d,img);

[newR,newI] = multiplication (filter,I,R);

 
ft=ifftshift(newR +i*newI);
ft2=ifft2(ft);
ft2=uint8(ft2);