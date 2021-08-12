%%%%%%%%%%%%function files required to run %%%%%fourline.m%%%%% are
%%%%%gauss,dgauss,d2gauss,pltr,detedge,matchh%%%%%
clc;
%% imread
ref_image='EMPTY.jpeg';
road1_image='FULL1.jpeg';
road2_image='FULL1.jpeg';
road3_image='FULL2.jpeg';
road4_image='FULL3.jpeg';
ref_ima=imread(ref_image);
road1_ima=imread(road1_image);
road2_ima=imread(road2_image);
road3_ima=imread(road3_image);
road4_ima=imread(road4_image);
figure;
subplot(2,2,1), imshow(road1_ima)
title('LANE 1')
subplot(2,2,2), imshow(road2_ima)
title('LANE 2')
subplot(2,2,3), imshow(road3_ima)
title('LANE 3')
subplot(2,2,4), imshow(road4_ima)
title('LANE 4')
%% gray filter and extraction of accuacy
ref_gray=rgb2gray(ref_ima);
road1_gray=rgb2gray(road1_ima);
road2_gray=rgb2gray(road2_ima);
road3_gray=rgb2gray(road3_ima);
road4_gray=rgb2gray(road4_ima);
figure;
subplot(2,2,1), imshow(road1_gray)
title('RGB TO GRAY 1')
subplot(2,2,2), imshow(road2_gray)
title('RGB TO GRAY 2')
subplot(2,2,3), imshow(road3_gray)
title('RGB TO GRAY 3')
subplot(2,2,4), imshow(road4_gray)
title('RGB TO GRAY 4')
%% double precision
ref_d=im2double(ref_gray);
road1_d=im2double(road1_gray);
road2_d=im2double(road2_gray);
road3_d=im2double(road3_gray);
road4_d=im2double(road4_gray);
%% setting the local standard resolution
ref_r = imresize(ref_d, [512 512]);
road1_r = imresize(road1_d,[512 512]);
road2_r = imresize(road2_d,[512 512]);
road3_r = imresize(road3_d,[512 512]);
road4_r = imresize(road4_d,[512 512]);
figure;
subplot(2,2,1), imshow(road1_r)
title('RESIZE IMAGE 1')
subplot(2,2,2), imshow(road2_r)
title('RESIZE IMAGE 2')
subplot(2,2,3), imshow(road3_r)
title('RESIZE IMAGE 3')
subplot(2,2,4), imshow(road4_r)
title('RESIZE IMAGE 4')
%% enhancing the images
ref=pltr(ref_r);
road1=pltr(road1_r);
road2=pltr(road2_r);
road3=pltr(road3_r);
road4=pltr(road4_r);
%% edge detection
ref_ng=detedge(ref);
road1_ng=detedge(road1);
road2_ng=detedge(road2);
road3_ng=detedge(road3);
road4_ng=detedge(road4);
figure;
subplot(2,2,1), imshow(road1_ng)
title('EDGE DETECTION 1')
subplot(2,2,2), imshow(road2_ng)
title('EDGE DETECTION 2')
subplot(2,2,3), imshow(road3_ng)
title('EDGE DETECTION 3')
subplot(2,2,4), imshow(road4_ng)
title('EDGE DETECTION 4')
%% %%%%%%%%%%Image Matching%%%%%%%%%%
BW_r = im2bw(ref_ng);
BW1 = im2bw(road1_ng);
BW2 = im2bw(road2_ng);
BW3 = im2bw(road3_ng);
BW4 = im2bw(road4_ng);
%% match_values
match1=matchh(BW_r,BW1);
match2=matchh(BW_r,BW2);
match3=matchh(BW_r,BW3);
match4=matchh(BW_r,BW4);
figure;
if ((match1>match2)&&(match1>match3)&&(match1>match4))
imshow(road1_image);
elseif((match2>match1)&&(match2>match3)&&(match2>match4))
imshow(road2_image);
elseif((match3>match1)&&(match3>match2)&&(match3>match4))
imshow(road3_image);
else
imshow(road4_image);
title('The road which can be released is')
end
%%%%%%%%%%Output Display%%%%%%%%%%
%road1
disp('road1');
if(match1>=236000 && match1<=240000)
disp('Green signal will be displayed for 60 second');
disp('Red signal will be displayed for 30 seconds');
elseif(match1<236000)
disp('Green signal will be displayed for 40 second');
disp('Red signal will be displayed for 30 seconds');
else
disp('Green signal will be displayed for 15 second');
disp('Red signal will be displayed for 30 seconds');
end
%road2
disp('road2');
if(match2>=236000 && match2<=240000)
disp('Green signal will be displayed for 60 second');
disp('Red signal will be displayed for 30 seconds');
elseif(match2<236000)
disp('Green signal will be displayed for 40 second');
disp('Red signal will be displayed for 30 seconds');
else
disp('Green signal will be displayed for 15 second');
disp('Red signal will be displayed for 30 seconds');
end
%road3
disp('road3');
if(match3>=236000 && match3<=240000)
disp('Green signal will be displayed for 60 second');
disp('Red signal will be displayed for 30 seconds');
elseif(match3<236000)
disp('Green signal will be displayed for 40 second');
disp('Red signal will be displayed for 30 seconds');
else
disp('Green signal will be displayed for 15 second');
disp('Red signal will be displayed for 30 seconds');
end
% road4
disp('road4');
if(match4>=236000 && match4<=240000)
disp('Green signal will be displayed for 60 second');
disp('Red signal will be displayed for 30 seconds');
elseif(match4<236000)
disp('Green signal will be displayed for 40 second');
disp('Red signal will be displayed for 30 seconds');
else
disp('Green signal will be displayed for 15 second');
disp('Red signal will be displayed for 30 seconds');
end