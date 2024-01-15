 function  tree = get_one_tree_EIRME(X_subset,height_limit,height_current,dimension_may_use,X_original_subset, stop_seg_num)
% to get one tree
% Input:
% X_subset£ºthe remaining part of the subset used to construct one tree;
% (for the distribution of the subset used to construct one tree);
% height_limit: the depth limit in the construction of one tree;
% height_current: the current depth of the constructed tree;
% dimension_may_use: the dimention of X being processed for the current depth;
% X_original_subset: the remaining part of the X being processed on the constructed tree;
% (for the distribution of the original X being processed on the constructed tree);
% stop_seg_num: the number of pixels in the indivisible subset
% Output:
% results: constructed one tree


[band_num,X_remain]=size(X_subset);     
[band_num,X_original_remain]=size(X_original_subset);


if ((height_current < height_limit) && (X_remain > stop_seg_num))    

   dimension_now = dimension_may_use(height_current+1); 
   tree.dimension = dimension_now;
   tree.subset_train_remain = X_remain;
   tree.original_seg_remain = X_original_remain;
   seg_value_set =  X_subset(dimension_now,:);   
   X_original_subset_dim = X_original_subset(dimension_now,:);
   
   seg_valud_max = max(seg_value_set(:));

   seg_valud_min = min(seg_value_set(:));

if seg_valud_max == seg_valud_min    
    field1 = 'subset_train_remain';value1 = X_remain;
    field2 = 'original_seg_remain';value2 = X_original_remain;
    tree = struct(field1,value1,field2,value2);
    

else
    range_random = rand(1);
    seg_value = seg_valud_min + (seg_valud_max - seg_valud_min) * range_random;  
   
    while (seg_value == seg_valud_min || seg_value == seg_valud_max)   
        range_random = rand(1);
        seg_value = seg_valud_min + (seg_valud_max - seg_valud_min) * range_random;  
    end


    tree.seg_value = seg_value;  

     
    
    X_left_index = find(seg_value_set <= seg_value);  
    X_right_index = find(seg_value_set > seg_value);   

            
    X_left = X_subset(:,X_left_index);
    X_right = X_subset(:,X_right_index);
    
    
    X_left_original_index = find(X_original_subset_dim <= seg_value);  
    X_right_original_index = find(X_original_subset_dim > seg_value);   

            
    X_original_left = X_original_subset(:,X_left_original_index);
    X_original_right = X_original_subset(:,X_right_original_index);
 
    
    
    
    
    
    
   
    height_current = height_current + 1;    

    

  
    tree.left_node = get_one_tree_EIRME(X_left,height_limit,height_current,dimension_may_use,X_original_left, stop_seg_num);
    
    tree.right_node = get_one_tree_EIRME(X_right,height_limit,height_current,dimension_may_use,X_original_right, stop_seg_num);
end

else    

  

     
     field1 = 'subset_train_remain';value1 = X_remain;
     field2 = 'original_seg_remain';value2 = X_original_remain;
     tree = struct(field1,value1,field2,value2);
end
    
     
end



