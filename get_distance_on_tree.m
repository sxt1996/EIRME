function  distance_on_tree = get_distance_on_tree( x_code,y_code)
%UNTITLED8 �˴���ʾ�йش˺�����ժҪ
%  ���������Ϊ�˵õ���������Ҷ�ӽڵ�ľ����
%����:x_code ��y_code�Ǿ����������õ�����������
% 
%����� ����Ҷ�ӽڵ������������Ҫ��������֦��Ŀ
    x_code_length = length(x_code);
    y_code_length = length(y_code);

    length_diff = abs(x_code_length - y_code_length);  %���ĳ���
    if x_code_length >= y_code_length    %Ŀ����볤�Ƚ϶�
        x_code_use = x_code(1:y_code_length);
        cal_use = xor(x_code_use,y_code);
        zero_position = find(cal_use == 1);
        if length(zero_position)~=0     %˵���������в�ͬ��
            first_nonzero_position = zero_position(1);
            repeat_path = 2*(y_code_length - (first_nonzero_position -1));
        else       %˵��������ȫһ��
            repeat_path = 0;
        end
        
%         y_code = [y_code,zeros(1,length_diff)];
        
    else   %�����������볤�Ƚ϶�
%         x_code = [x_code,zeros(1,length_diff)];
        y_code_use = y_code(1:x_code_length);
        cal_use = xor(x_code,y_code_use);
        zero_position = find(cal_use==1);
        first_nonzero_position = zero_position(1);
        repeat_path = 2*(x_code_length - (first_nonzero_position -1));

    end
    distance_on_tree = repeat_path + length_diff;


 


end



