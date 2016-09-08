clear

%%m=imread('skittles.jpeg');
load skit
imshow(m)
size = size(m);
if size(1) > 2000
Rmin = 50;
Rmax = 100;
else if size(1) > 1000
Rmin = 40;
Rmax = 60;        
else 
Rmin = 20;
Rmax = 30;
    end
end

%% Counts the Greens
a = (m(:,:,1)<90)==1;
b = (m(:,:,3)<90)==1;
c = (m(:,:,2)>100)==1;
d = (m(:,:,2)<160)==1;
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
a1 = (m(:,:,1)>190)==1;
b1 = (m(:,:,1)<220)==1;
c1 = (m(:,:,2)>60)==1;
d1 = (m(:,:,2)<90)==1;
e1 = (m(:,:,3)>20)==1;
f1 = (m(:,:,3)<40)==1;
orange = a1 & b1 & c1 & d1 & e1 & f1;

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
a2 = (m(:,:,1)>190)==1;
b2 = (m(:,:,1)<220)==1;
c2 = (m(:,:,2)>155)==1;
d2 = (m(:,:,2)<200)==1;
e2 = (m(:,:,3)<35)==1;
yellow = a2 & b2 & c2 & d2 & e2;

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

%% Purple
a3 = (m(:,:,1)>10)==1;
b3 = (m(:,:,1)<70)==1;
c3 = (m(:,:,2)>10)==1;
d3 = (m(:,:,2)<60)==1;
e3 = (m(:,:,3)<40)==1;
purple = a3 & b3 & c3 & d3 & e3;

[pcenters, pradii] = imfindcircles(purple,[Rmin Rmax],'ObjectPolarity','bright', 'Sensitivity', .92);

figure(5)
imshow(purple)
viscircles(pcenters,pradii,'EdgeColor', [0.5 0 0.5]); 

if isempty(pradii) 
pskittles = 0;
else
pskittles = find(pradii);
end
fprintf('There are %1.0f purple skittles \n', pskittles(end))

%% Red
a4 = (m(:,:,1)>80)==1;
b4 = (m(:,:,1)<120)==1;
c4 = (m(:,:,2)>10)==1;
d4 = (m(:,:,2)<60)==1;
e4 = (m(:,:,3)>10)==1;
f4 = (m(:,:,3)<50)==1;
red = a4 & b4 & c4 & d4 & e4 & f4;

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

