function  Multiple_Trees  = get_multiple_trees_EIRME(X, tree_size, tree_num, stop_seg_num)
% to construct multiple trees 
% Input:
% X£ºan HSI being processed;
% tree_size: subsampling size ratio; tree_num: subsampling times; 
% stop_seg_num: the number of pixels in the indivisible subset
% Output:
% results: constructed multiple trees


[band_num,pixel_num]=size(X);
Multiple_Trees = cell(tree_num,1);

for i = 1:tree_num      
    subset_index = randperm(pixel_num,tree_size);   
    X_subset = X(:,subset_index);   
    height_limit = band_num; 
    height_current = 0;   
    dimension_may_use = randperm(band_num, band_num); 
    Multiple_Trees(i,1) = {get_one_tree_EIRME(X_subset, height_limit, height_current, dimension_may_use, X, stop_seg_num)};    
    
end

end

