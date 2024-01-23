function  distance_on_tree = get_distance_on_tree( x_code,y_code)
%UNTITLED8 此处显示有关此函数的摘要
%  这个函数是为了得到树上两个叶子节点的距离的
%输入:x_code 和y_code是经过二叉树得到的两串编码
% 
%输出： 两个叶子节点在树上相会需要经过的树枝数目
    x_code_length = length(x_code);
    y_code_length = length(y_code);

    length_diff = abs(x_code_length - y_code_length);  %相差的长度
    if x_code_length >= y_code_length    %目标编码长度较短
        x_code_use = x_code(1:y_code_length);
        cal_use = xor(x_code_use,y_code);
        zero_position = find(cal_use == 1);
        if length(zero_position)~=0     %说明编码项有不同的
            first_nonzero_position = zero_position(1);
            repeat_path = 2*(y_code_length - (first_nonzero_position -1));
        else       %说明编码项全一样
            repeat_path = 0;
        end
        
%         y_code = [y_code,zeros(1,length_diff)];
        
    else   %待测样本编码长度较短
%         x_code = [x_code,zeros(1,length_diff)];
        y_code_use = y_code(1:x_code_length);
        cal_use = xor(x_code,y_code_use);
        zero_position = find(cal_use==1);
        first_nonzero_position = zero_position(1);
        repeat_path = 2*(x_code_length - (first_nonzero_position -1));

    end
    distance_on_tree = repeat_path + length_diff;


 


end



