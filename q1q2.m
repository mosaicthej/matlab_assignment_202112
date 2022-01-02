
filename = "示例输出文件名";
% （避免系统错误，文件名不可以包含空格）

% 第一题：

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

% 头部组成文件为"1.xlsx"
headerCell = readcell("1.xlsx");

% 头部第一部分（"海拔"），存储为字符串
h1 = string(headerCell{1});
% 头部第二部分（"sos"），存储为字符串
h2 = string(headerCell{2});


% 将头部写入新文件第一行
writecell({h1,h2}, newfile);

% 初始化"海拔"数组 和 "sos”数组，均为全部是0的两个数组
altiVec=zeros(30,1); sosVec=zeros(30,1);

% 循环 i 从 2 到 31 （之后写入区域在2行至31行）
for i = 2:31

    % name 是用 i+后缀 形成读取的文件名（"2.xlsx" - "31.xlsx"）
    name = append(string(i),".xlsx");
    % row 为文件内容（一行）
    row = readtable(name);

    % row 的（1, 1）位置为当前文件的 “海拔” 数据
    alti = row{1,1};

    % row 的（1, 2）位置为当前文件的 “SOS” 数据
    sos = row{1,2};

    % 讲读取的当前文件的海拔和SOS分别写入 "海拔" 数组 和 "SOS" 数组
    altiVec(i-1) = alti;
    sosVec(i-1) = sos;

    % 讲读取的内容海拔和SOS分别写入 新文件 的行中
    writecell({alti, sos}, newfile, 'WriteMode','Append');
end


% 第二题：
% 包含31（31 = "海拔” 数组的数量）个渐变色的数据值（摘抄自matlab官网的scatter教程）
colors = linspace(1,10,length(altiVec));

% 新建散点图，x、y值，大小=20，颜色为渐变色
scatter(altiVec,sosVec,20,colors);
% 不关闭图，继续编辑
hold on

% 连接散点
line(altiVec, sosVec)

% 用polyfit得到海拔和sos的线性关系(拟合曲线)数据（斜率和交点）
coefs = polyfit(altiVec, sosVec, 1);

% 用取得的画出拟合曲线
h = refline(coefs(1), coefs(2));

% 图片编辑完毕
hold off


% 将 R 和 P 值通过corrcoef计算
[R,P] = corrcoef(altiVec, sosVec);
% 注意，corrcoef输出两个对角矩阵
% R =
%   1.0000    0.9180
%   0.9180    1.0000
% 以及
%
% P = 
%   1.0000    0.0000
%   0.0000    1.0000
%
% 其中，实际我们用的数值为第二个数字


% 提取至 R 和 P 变量中
R = R(2); P = P(2);

% 取小数点后两位
R = round(R,2); P = round(P,2);


% 拟合曲线的描述字符串，%f 为小数占位符，（相对于逗号后面的每个数据）
refInfo = sprintf("y = %f x + %f\nr = %f, P = %f", coefs(1), coefs(2), R, P);
% 生成文字，放在坐标 (200, 140)
text(200,140,refInfo);

% 得到最大、最小、平均、方差的整数值
maxSos = round(max(sosVec)); minSos = round(min(sosVec));
avg = round(mean(sosVec)); sd = round(std(sosVec));

% 描述字符串， %d 为整数占位符，\n 为换行
sosStats = sprintf("最小值 = %d day\n最大值 = %d day\n平均值 = %d day\n标准差 = %d day", maxSos, minSos, avg, sd);
% 生成文字，放在坐标 (2000, 100)
text(2000,100,sosStats);

% 标题、xy轴标签
titleString = "班级：【班级】, 学号：【学号】， 姓名：【姓名】";
title(titleString);
xlabel("海拔(m)");
ylabel("SOS(day)");

