

% % % % % % % % % % % % % % % % % % 
%              第四题             %
% % % % % % % % % % % % % % % % % % 


% 常量
WAGE = 84;
EXCESS_TIME = 120; EXCESS_WAGE = WAGE*(1+0.15);
LOW_TIME = 60; LOW_DUCTION = 700;

filename = "示例_q4_工资单";
% （避免系统错误，文件名不可以包含空格）

% WARNING:
% 请确认在此之前有"C:/1"文件夹的读写权限：
% 权限设置方法：
% % 在 C:\WINDOWS\system32 找到 "cmd.exe"，右击，选择"用管理员打开（快捷键A）"
% % % 输入 
% % % % "mkdir C:\1"
% % % % % (- 创建  c:\1\ 的文件夹)
% % % % "icacls c:\1 /grant Everyone:F"
% % % % % (给 『所有人』 文件夹 "C:\1" 的 [所有权限])

% 设置完整文件路径
newfile = append("c:\\1\\",filename,".xlsx");
% 如果同名文件存在，删除同名文件
if exist(newfile, 'file')==2
  delete(newfile)
end

% 写入表头
writematrix(["工号","工时数","应发工资"], newfile, 'WriteMode','Append');



% 输入应注意以下几点，工号如果是-1，退出程序
% % 工时必须是大于零的正数。
nextWage = true;
while nextWage
    % 取得id
    id = input("请输入员工工号，输入-1退出: ","s");
    % 若id为-1，退出程序
    if strcmp(id,"-1")
        nextWage = false;
        fprintf("终止程序\n");
    else
        fprintf("员工工号为%s\n",id);
        % 若id不是-1，取得工时
        badTime = true;
        % 如果工时输入不正确（输入负数、字符等）
        % % 重新取得工时。
        while badTime
            time = input("请输入该员工工时","s");
            time = str2double(time);
            if time > 0 % 正确的工时将存储于time中
                badTime = false;
                fprintf("员工工时为%f\n",time);
            else
                % 若工时有误，输入错误信息
                fprintf("输入的工时有误\n");
            end
        end

        % 计算工资
        if time > EXCESS_WAGE % 加班情况
            wage = (WAGE * EXCESS_TIME) + (EXCESS_WAGE * (time - EXCESS_TIME));
        elseif time < LOW_TIME % 出勤不足
            wage = WAGE * time - LOW_DUCTION;
        else % 常规
            wage = WAGE * time;
        end
        % 将新数据放在表格最下行
        writecell({id, time, wage}, newfile, 'WriteMode','Append');
    end
end


