function [FileName,pathname]= OpenImage

 [FileName,pathname]=uigetfile('*.*','Open Image');

 imshow(FileName);

end