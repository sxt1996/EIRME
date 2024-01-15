clear all;  
clc; 
close all

%% read the HSI data being processed
a = dir;
filename_path = a.folder;    
filename_path = strcat(filename_path,'\');
name_HSI = 'cut_1';    
filename = strcat(filename_path,name_HSI,'.mat');

load(filename);
X_cube = data;
clear('data');
[samples,lines,band_num]=size(X_cube);
pixel_num = samples * lines;

gt = map;
clear('map');

mask = squeeze(gt(:));   

window_big = 15; window_small = 5;



%% read the given target spectrum
name_target = 'target.mat';         
filename_target = strcat(filename_path, name_HSI, '_', name_target);    
load(filename_target);

%% set parameters for the construction of multiple trees
 
tree_size_ratio = 0.002;   % subsampling size ratio
tree_size = ceil(pixel_num * tree_size_ratio); % subsampling size
tree_num = 100; % subsampling times

%% perform target detecion with EIRME
r_EIRME = EIRME(X_cube,target, tree_size_ratio, tree_num, window_big, window_small); 
%% illustrate detection results
figure;
subplot(121), imagesc(gt); axis image;   title('Ground Truth')     
subplot(122), imagesc(r_EIRME); axis image;   title('Detection map of EIRME')    

%% evaluate detection results with ROC
r_255 = squeeze(r_EIRME(:));
figure;
AUC = ROC(mask,r_255,'r')       

