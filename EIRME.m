function result_2D = EIRME(X_cube,target, tree_size_ratio, tree_num, window_big, window_small)
% paper:¡¶Ensemble-Based Information Retrieval With Mass Estimation for Hyperspectral Target Detection¡·
% Input:
% X£ºan HSI being processed; target:a priori target spectrum;
% tree_size_ratio: subsampling size ratio; tree_num: subsampling times;
% window_big, window_small: window sizes 
% Output:
% results: detection results

[samples,lines,band_num]=size(X_cube);
pixel_num = samples * lines;
X_use = reshape(X_cube,pixel_num,band_num);
X = X_use.'; 



target_size_about = window_small * window_small;
stop_seg_num = ceil(target_size_about * tree_size_ratio);



tree_size = ceil(pixel_num * tree_size_ratio);


multiple_trees = get_multiple_trees_EIRME(X, tree_size, tree_num, stop_seg_num);  


target_code_list = get_code_list(target,multiple_trees);   % get encoding results of the given target on multiple trees  



n2=round((window_big-1)/2);   
n3=round((window_small-1)/2);        
    


%% padding the original data cube
C = zeros(samples+4*n2,lines+4*n2,band_num);
for i=1:band_num
    A=X_cube(:,:,i);
    A=reshape(A,samples,lines);
    B=padarray(A,[2*n2 2*n2],'circular','both');     
    C(:,:,i)=B;         
end
%% perform target detection  
result = zeros(samples,lines);      

for i=2*n2+1:samples+2*n2;
     for j=2*n2+1:lines+2*n2;     
         A1=C(i-n2:i+n2,j-n2:j+n2, :);   
          A1(n2-n3+1:n2+n3+1, n2-n3+1:n2+n3+1, :)=NaN ;            

          M = window_big^2;    
          A2 = reshape(A1, M, band_num);     
          A2=A2';
          pos=find(isnan(A2(1, :))==1);     
          A2(:,pos) = [];       
      
          x = C(i,j,:);          
          x_code_list = get_code_list(x,multiple_trees);
          A2_mean = mean(A2,2);
          background_code_list = get_code_list(A2_mean,multiple_trees);
          
          x_taret_Mass_list = get_shared_node_Mass_list( x,target,multiple_trees);
          x_background_Mass_list = get_shared_node_Mass_list( x,A2_mean,multiple_trees);
            
         result(i-2*n2,j-2*n2) = get_anomaly_score_topological_mass_local(x_code_list,target_code_list,background_code_list,x_taret_Mass_list,x_background_Mass_list);
         
         
     end 
end

result = reshape(result,1,pixel_num);

r_255 = get_255(result);   
result_2D = reshape(r_255, samples, lines);   


end
