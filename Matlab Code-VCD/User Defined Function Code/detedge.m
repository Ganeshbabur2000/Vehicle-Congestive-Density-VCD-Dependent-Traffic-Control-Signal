function NVI1=detedge(IG1)
Nx1=10;
Sigmax1=1;
Nx2=10;
Sigmax2=1;
Theta1=pi/2;
% Y-axis direction filter:
Ny1=10;
Sigmay1=1;
Ny2=10;
Sigmay2=1;
Theta2=0;
% 2. The thresholding parameter alfa:
alfa=0.1;
% X-axis direction edge detection
filterx=d2dgauss(Nx1,Sigmax1,Nx2,Sigmax2,Theta1);
Ix= conv2(IG1,filterx,'same');
%imagesc(Ix);
%title('Ix');
% Y-axis direction edge detection
%subplot(2,2,1);
filtery=d2dgauss(Ny1,Sigmay1,Ny2,Sigmay2,Theta2);
Iy=conv2(IG1,filtery,'same');
% Norm of the gradient (Combining the X and Y directional derivatives)
%subplot(2,2,2);
NVI1=sqrt(Ix.*Ix+Iy.*Iy);   
