function ft2=H_Gaussian(D0,img)
f=fft2(img);
f1=fftshift(f);
R=real(f1);
I=imag(f1);

filter=H_GaussianF(D0,img);

[newR,newI] = multiplication (filter,I,R);

 
ft=ifftshift(newR +i*newI);
ft2=ifft2(ft);
ft2=uint8(ft2);