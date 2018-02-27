function SaveAsImage

[FileName,pathname] = uiputfile('*.jpg','SaveAsImage');
h = imwrite(FileName,pathname);
iptcheckhandle(h,{'axes1','figure1','uipanel1'},project,'h',1);





end