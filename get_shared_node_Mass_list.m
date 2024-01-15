function  Mass_list = get_shared_node_Mass_list( x,target,multiple_trees)
% get masses of the shared nodes of the testing pixel and the given target on multiple trees
% Input:
% x: testing pixel; target: a priori target spectrum; multiple_trees:multiple constructed trees 
% Output:
% Mass_list: masses of the shared nodes of the testing pixel and the given tartget on multiple trees


tree_use = multiple_trees{1};

band_num = length(x);   
tree_num  = length(multiple_trees);  

Mass_list = zeros(1,tree_num);

for i =1:tree_num    
    tree = multiple_trees{i};
    while isfield(tree,'seg_value')    
                
        seg_value = tree.seg_value;
        dimension_use = tree.dimension;
        x_use = x(dimension_use);
        target_use = target(dimension_use);
        parent_num = tree.original_seg_remain;

        if target_use <= seg_value
            tree = tree.left_node;   
            if x_use > seg_value   
                shared_node_num = parent_num;
            end
                      
        else      
            tree = tree.right_node;
            if x_use <= seg_value   
                shared_node_num = parent_num;
            end        
        end  
       
    end
   

    leaf_mass = tree.original_seg_remain;    

    if exist('shared_node_num')   
        Mass_list(i) = shared_node_num; 
    else   
        Mass_list(i) = 1;
    end
    

end


end



