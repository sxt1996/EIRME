function  code_list = get_code_list( x,multiple_trees)
%  to get encoding results of one pixel on multiple trees 
% Input:
% x:testing pixel; multiple_trees: multiple constructed trees 
% Output:
% code_list:encoding results of one pixel on multiple trees


tree_num  = length(multiple_trees);  
code_list = cell(tree_num,1);   

for i =1:tree_num    
    tree = multiple_trees{i};
    code = [];
    while isfield(tree,'seg_value')    
                
        seg_value = tree.seg_value;
        dimension_use = tree.dimension;
        x_use = x(dimension_use);
       
        if x_use <= seg_value
            tree = tree.left_node;   
            code = [code,1];
        else      
            tree = tree.right_node; 
            code = [code,0];
        end  
       
    end
code_list(i,1) = {code};
    

end


end



