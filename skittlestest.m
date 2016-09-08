%% Ece 2409-001 Project 9/12/2015 Kevin Hames, Jordan Harris, Katherine Gresko

%% Load Image
clear

m=imread('skittles.jpeg');
%%load skit
imshow(m)

%% find radius and total
rblue=m(:,:,3);

level=.4;
bw2=im2bw(rblue,level);
bwi = imcomplement(bw2);
figure;
imshow(bwi);

s = regionprops(bwi,'EquivDiameter');
di=[s.EquivDiameter];
points = find(di<5);
di(points) = [];
r=mean(di)/2;
total = size(di);

Rmax = int8(1.2*r);
Rmin = int8(.7*r);


%% Counts the Greens
a = (12*m(:,:,1) > m(:,:,2)) ==1;
b = (1.5*m(:,:,1) < m(:,:,2)) ==1;
c = (m(:,:,1) > 0*m(:,:,3)) ==1;
d = (m(:,:,1) < 100*m(:,:,3)) ==1;
green = a & b & c & d;

[centers, radii] = imfindcircles(green,[Rmin Rmax],'ObjectPolarity','bright', 'Sensitivity', .95);

figure(2)
imshow(green)
viscircles(centers,radii,'EdgeColor', 'g');

if isempty(radii) 
gskittles = 0;
else
gskittles = find(radii);
end
fprintf('There are %1.0f green skittles \n', gskittles(end))

%% Counts the Orange
a1 = (m(:,:,1) > 2.0*m(:,:,2)) ==1;
b1 = (m(:,:,1) < 4.0*m(:,:,2)) ==1;
c1 = (m(:,:,1) > 4*m(:,:,3)) ==1;
d1 = (m(:,:,1) < 100*m(:,:,3)) ==1;
orange = a1 & b1 & c1 & d1;

[ocenters, oradii] = imfindcircles(orange,[Rmin Rmax],'ObjectPolarity','bright', 'Sensitivity', .95);

figure(3)
imshow(orange)
viscircles(ocenters,oradii,'EdgeColor', [1 .5 0]); 

if isempty(oradii) 
oskittles = 0;
else
oskittles = find(oradii);
end
fprintf('There are %1.0f orange skittles \n', oskittles(end))

%% Counts the Yellow
a2 = (m(:,:,1) > 1*m(:,:,2)) ==1;
b2 = (m(:,:,1) < 1.5*m(:,:,2)) ==1;
c2 = (m(:,:,1) > 5*m(:,:,3)) ==1;
d2 = (m(:,:,1) < 50*m(:,:,3)) ==1;
yellow = a2 & b2 & c2 & d2;

[ycenters, yradii] = imfindcircles(yellow,[Rmin Rmax],'ObjectPolarity','bright', 'Sensitivity', .95);

figure(4)
imshow(yellow)
viscircles(ycenters,yradii,'EdgeColor', 'y'); 

if isempty(yradii) 
yskittles = 0;
else
yskittles = find(yradii);
end
fprintf('There are %1.0f yellow skittles \n', yskittles(end))

%% Counts the Red
a4 = (m(:,:,1) > 3*m(:,:,2)) ==1;
b4 = (m(:,:,1) < 12*m(:,:,2)) ==1;
c4 = (m(:,:,1) > 2*m(:,:,3)) ==1;
d4 = (m(:,:,1) < 6*m(:,:,3)) ==1;
red = a4 & b4 & c4 & d4;

[rcenters, rradii] = imfindcircles(red,[Rmin Rmax],'ObjectPolarity','bright', 'Sensitivity', .95);

figure(6)
imshow(red)
viscircles(rcenters,rradii,'EdgeColor', 'r'); 

if isempty(rradii) 
rskittles = 0;
else
rskittles = find(rradii);
end
fprintf('There are %1.0f red skittles \n', rskittles(end))

%% Counts the purple
pskittles = total(end) - rskittles(end) - yskittles(end) - gskittles(end) - oskittles(end);
fprintf('There are %1.0f purple skittles \n', pskittles(end))

%% Text boxes & final picture
figure(7)
msized = imresize(m,[500 500]);
position = [10 10; 10 30; 10 50; 10 70; 10 90];
val = [gskittles(end) oskittles(end) yskittles(end) rskittles(end) pskittles(end)];
bcolor = {'g', 'w', 'y', 'r', 'm'};
text = cell(5,1);
text{1} = ['Green: ' num2str(val(1),'%1.0f')];
text{2} = ['Orange: ' num2str(val(2),'%1.0f')];
text{3} = ['Yellow: ' num2str(val(3),'%1.0f')];
text{4} = ['Red: ' num2str(val(4),'%1.0f')];
text{5} = ['Purple: ' num2str(val(5),'%1.0f')];
RGB = insertText(msized,position,text,'BoxColor',bcolor);
imshow(RGB)

%% Load new image 
clear

load pic
imshow(m)

%% find radius and total
rblue=m(:,:,3);

level=.4;
bw2=im2bw(rblue,level);
bwi = imcomplement(bw2);
figure;
imshow(bwi);

s = regionprops(bwi,'EquivDiameter');
di=[s.EquivDiameter];
points = find(di<5);
di(points) = [];
r=mean(di)/2;
total = size(di);

Rmax = int8(1.2*r);
Rmin = int8(.7*r);


%% Counts the Greens
a = (12*m(:,:,1) > m(:,:,2)) ==1;
b = (1.5*m(:,:,1) < m(:,:,2)) ==1;
c = (m(:,:,1) > 0*m(:,:,3)) ==1;
d = (m(:,:,1) < 100*m(:,:,3)) ==1;
green = a & b & c & d;

[centers, radii] = imfindcircles(green,[Rmin Rmax],'ObjectPolarity','bright', 'Sensitivity', .95);

figure(2)
imshow(green)
viscircles(centers,radii,'EdgeColor', 'g');

if isempty(radii) 
gskittles = 0;
else
gskittles = find(radii);
end
fprintf('There are %1.0f green skittles \n', gskittles(end))

%% Counts the Orange
a1 = (m(:,:,1) > 2.0*m(:,:,2)) ==1;
b1 = (m(:,:,1) < 4.0*m(:,:,2)) ==1;
c1 = (m(:,:,1) > 4*m(:,:,3)) ==1;
d1 = (m(:,:,1) < 100*m(:,:,3)) ==1;
orange = a1 & b1 & c1 & d1;

[ocenters, oradii] = imfindcircles(orange,[Rmin Rmax],'ObjectPolarity','bright', 'Sensitivity', .95);

figure(3)
imshow(orange)
viscircles(ocenters,oradii,'EdgeColor', [1 .5 0]); 

if isempty(oradii) 
oskittles = 0;
else
oskittles = find(oradii);
end
fprintf('There are %1.0f orange skittles \n', oskittles(end))

%% Counts the Yellow
a2 = (m(:,:,1) > 1*m(:,:,2)) ==1;
b2 = (m(:,:,1) < 1.5*m(:,:,2)) ==1;
c2 = (m(:,:,1) > 5*m(:,:,3)) ==1;
d2 = (m(:,:,1) < 50*m(:,:,3)) ==1;
yellow = a2 & b2 & c2 & d2;

[ycenters, yradii] = imfindcircles(yellow,[Rmin Rmax],'ObjectPolarity','bright', 'Sensitivity', .95);

figure(4)
imshow(yellow)
viscircles(ycenters,yradii,'EdgeColor', 'y'); 

if isempty(yradii) 
yskittles = 0;
else
yskittles = find(yradii);
end
fprintf('There are %1.0f yellow skittles \n', yskittles(end))

%% Counts the Red
a4 = (m(:,:,1) > 3*m(:,:,2)) ==1;
b4 = (m(:,:,1) < 12*m(:,:,2)) ==1;
c4 = (m(:,:,1) > 2*m(:,:,3)) ==1;
d4 = (m(:,:,1) < 6*m(:,:,3)) ==1;
red = a4 & b4 & c4 & d4;

[rcenters, rradii] = imfindcircles(red,[Rmin Rmax],'ObjectPolarity','bright', 'Sensitivity', .95);

figure(6)
imshow(red)
viscircles(rcenters,rradii,'EdgeColor', 'r'); 

if isempty(rradii) 
rskittles = 0;
else
rskittles = find(rradii);
end
fprintf('There are %1.0f red skittles \n', rskittles(end))

%% Counts the purple
pskittles = total(end) - rskittles(end) - yskittles(end) - gskittles(end) - oskittles(end);
fprintf('There are %1.0f purple skittles \n', pskittles(end))

%% Text boxes & Final Image
figure(7)
msized = imresize(m,[500 500]);
position = [10 10; 10 30; 10 50; 10 70; 10 90];
val = [gskittles(end) oskittles(end) yskittles(end) rskittles(end) pskittles(end)];
bcolor = {'g', 'w', 'y', 'r', 'm'};
text = cell(5,1);
text{1} = ['Green: ' num2str(val(1),'%1.0f')];
text{2} = ['Orange: ' num2str(val(2),'%1.0f')];
text{3} = ['Yellow: ' num2str(val(3),'%1.0f')];
text{4} = ['Red: ' num2str(val(4),'%1.0f')];
text{5} = ['Purple: ' num2str(val(5),'%1.0f')];
RGB = insertText(msized,position,text,'BoxColor',bcolor);
imshow(RGB)
