# 文件名：
为避免运行出错，代码文件名均改为英文字母+数字的格式（ascii）

第一题和第二题在```q1q2.m```中
第三、四、五题分别在```q3.m```, ```q4.m```, ```q5.m```中
如只能提交一份文件，把后面三个文件的代码直接复制然后粘贴到```q1q2.m```后面即可

分开存储的原因是测试方便，_（如果都存储到一起，比如只需要测试第4题的代码，但是必须还要把1-5题都运行一遍）_

# 输出：
应要求，输出文件存储在```C:\1```目录中，如果出现```没有写入权限```的错误，请参考下方的处理方法。
```示例输出文件名.xlsx```是第一二题的表格
```示例_q4_工资单.xlsx```是第四题工资单的表格

# WARNING:
### 第一二、四题可能会出现的没有权限的错误

请确认在此之前有```C:/1```文件夹的读写权限：
权限设置方法：
在 ```C:\WINDOWS\system32``` 找到 ```cmd.exe```，右击，选择"用管理员打开<br>（快捷键A）

输入 
```mkdir C:\1```
  *(- 创建  c:\1\ 的文件夹)*
```icacls c:\1 /grant Everyone:F```
  (给 *『所有人』* 文件夹 ```C:\1``` 的 <u>*[所有权限]*</u>)

