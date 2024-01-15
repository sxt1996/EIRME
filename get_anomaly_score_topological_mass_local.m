function  anomaly_score = get_anomaly_score_topological_mass_local( x_code_list,target_code_list,background_code_list,x_target_Mass_list,x_background_Mass_list)
% to get the anomaly score for the testing pixel
% Input:
% x_code_list£ºencoding results of the testing pixel on multiple trees
% target_code_list:encoding results of the the given target on multiple trees
% background_code_list:encoding results of the the local background mean vector on multiple trees
% x_target_Mass_list: masses of the shared nodes of the testing pixel and the given tartget on multiple trees
% x_background_Mass_list: masses of the shared nodes of the testing pixel and the local background mean vector on multiple trees
% Output:
% anomaly_score: anomaly score of the testing pixel

 
tree_num  = length(x_code_list);  

diff_sum = 0;

for i =1:tree_num    
    x_code = x_code_list{i};          
    target_code = target_code_list{i};  
    background_code = background_code_list{i};  
    x_target_distance = get_distance_on_tree(x_code,target_code);
    x_background_distance = get_distance_on_tree(x_code,background_code);
    x_target_distance = x_target_distance * x_target_Mass_list(i);
    x_background_distance = x_background_distance * x_background_Mass_list(i);
    
    if x_target_distance==0
        diff_score = x_background_distance;
    else
        diff_score = x_background_distance/x_target_distance;
    end
    diff_sum = diff_sum + diff_score;
    

end

diff_average = diff_sum/tree_num;   

anomaly_score = diff_average;


end



