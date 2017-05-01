# PythonStudy
该程序的文件路径是定位于太空旅客.txt的同一级父目录
通过os.chdir("/home/yupwei/Downloads/study")来指定
find_comment是主要的函数
comment_file是指太空旅客的评论文件
result_file 是指匹配后结果存放的文件
word_list表示每一行评论匹配到的关注点的列表
obj_dir:目的目录，指词典目录
file_name:词典目录for循环到尾部得到的文件名
file_1:包含词典内容的文件

该实验主要是先一次读取整个评论文件，将内容拆分为行的列表，在针对每一行，for循环都打开词典中每一个文件，之后再把读取的文件内容以行分隔开
，然后如果该文件行内容存在于评论文件行内容中，则先检查word_list是否已经存在这个关注点，如果没有的话就加进word_list中，当每一行的评论关注点
找全后，以追加的形式添加进result_file中关注点之间用'\t'分割，之后用'\n'分割每一行

测试结果图片在branch img中可以找到

![测试结果](https://github.com/yupwei/PythonStudy/edit/img/测试结果.png)
