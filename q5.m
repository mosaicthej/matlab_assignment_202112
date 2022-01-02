

% % % % % % % % % % % % % % % % % % 
%              第五题             %
% % % % % % % % % % % % % % % % % % 

range = [2,50];
count = 0; sum = 0;
for i = 2:49
    j = i+1;
    % i, j 为连续数字
    k = i*j-1; % k 是乘积-1
    if isprime(k) % 若k为素数
        count = count + 1; % 增加对数
        sum = sum + k; % 增加和
        fprintf("%d和%d是亲密数对\n",i,j);
    end
end

fprintf("一共有%d组亲密数对,\n所有的亲密素数之和为%d\n",count,sum);

