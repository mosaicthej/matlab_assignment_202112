
% % % % % % % % % % % % % % % % % % 
%              第三题             %
% % % % % % % % % % % % % % % % % % 

nextScore = true; 
% 先用字符串类接受输入，再检查输入是否为数字，以此避免输入不是数字时候的出错。
inp = input("该段代码使用switch-case实现" + ...
    "请输入一个0-100间的百分制成绩\n请仅输入0-100的数字\n输入-1退出\n",'s');
while nextScore
	score = str2double(inp);

	% 此循环用于处理用户输入不正确的情况，持续询问直到输入合理的数字或者-1
	badNumber = true; % 初始化 badNumber (= false，由此进入循环中)，
    while badNumber % 若输入的数字不在 0-100的区间, badNumber 为 true
		badNumber = false; % 默认输入了一个0-100的数字
		switch true
			case (100 >= score) && (score >= 90)
				grade = "A";
			case (90 > score) && (score >= 80)
				grade = "B";
			case (80 > score) && (score >= 70)
				grade = "C";
			case (70 > score) && (score >= 60)
				grade = "D";
			case (60 > score) && (score >= 0)
				grade = "E";
            case (score == -1)
				nextScore = false; 
                grade = "终止程序";
			otherwise
			    badNumber = true; % 数字错误，从新走一遍循环。
			    grade = "输入错误！";
                inp = input("请仅输入0-100的数字，\n",'s');
                score = str2double(inp);
                
		end
        fprintf(append(grade,"\n\n"));
		
    end
    if nextScore
    % 输入新的要查询的成绩，或者输入-1终止程序。
	    inp = input("请输入一个0-100间的百分制成绩\n请仅输入0-100的数字\n输入-1退出\n",'s');
    end
end





% % % 用 if 实现% % %

nextScore = true; 
% 先用字符串类接受输入，再检查输入是否为数字，以此避免输入不是数字时候的出错。
inp = input("该段代码使用ｉｆ实现" + ...
    "请输入一个0-100间的百分制成绩\n请仅输入0-100的数字\n输入-1退出\n",'s');
while nextScore
	score = str2double(inp);

    % 此循环用于处理用户输入不是0-100间的数字的情况
	badNumber = true; % 初始化 badNumber (= false，由此进入循环中)，
    while badNumber % 若输入的数字不在 0-100的区间，返回 badInput 为 true
		badNumber = false; % 默认输入了一个0-100的数字

		if (100 >= score) && (score >= 90)
			    grade = "A";
            elseif (90 > score) && (score >= 80)
			    grade = "B";
            elseif (80 > score) && (score >= 70)
			    grade = "C";
            elseif (70 > score) && (score >= 60)
			    grade = "D";
            elseif (60 > score) && (score >= 0)
			    grade = "E";
            elseif (score == -1)
			    nextScore = false; 
                grade = "终止程序";
            else
			    badNumber = true; % 数字错误，从新走一遍循环。
			    grade = "输入错误！";
                inp = input("请仅输入0-100的数字，\n",'s');
                score = str2double(inp);
                
        end
        fprintf(append(grade,"\n\n"));
		
    end
    if nextScore
    % 输入新的要查询的成绩，或者输入-1终止程序。
	    inp = input("请输入一个0-100间的百分制成绩\n请仅输入0-100的数字\n输入-1退出\n",'s');
    end
end