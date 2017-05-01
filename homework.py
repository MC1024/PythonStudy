# coding=UTF-8
import os
import sys

reload(sys)
sys.setdefaultencoding('utf-8')#设置编码格式


os.chdir("/home/yupwei/Downloads/study")#更改目录



def find_comment(comment_file_name,result_file_name,obj_dir):
    #find_comment函数功能是匹配评论中的关键词来查找其评论注重的方向，三个参数分别为存放评论的文件，存放结果的文件，存放匹配关键词的文件夹名
    comment_file = open(comment_file_name, 'r')
    result_file = open(result_file_name, 'a')
    #打开评论文件和存放结果的文件
    for line in comment_file.readlines():
        word_list = []
        for root, dirs, files in os.walk(obj_dir):#对评论文件的每一行都执行以下操作
            for name in files:
                filename = os.path.join(root, name).decode('UTF-8')#将文件名和原地址拼接成完整路径
                file_1 = open(filename, 'r')
                for read_line in file_1.readlines():#遍历存放关键词的每一个文件，如果评论中出现该关键词，则判定评论有该关键词对应的评论点，之后查看评论对应的word_list中是否已经存放该评论点，若没有则加进word_list中
                    if read_line.strip() in line:
                        name_new = name.split('.')[0]
                        if name_new not in word_list:
                            word_list.append(name_new)

                file_1.close()
        for words in word_list:#将结果写进存放结果的文件中
            result_file.write(words + "\t")

        result_file.write("\n")
    result_file.close()
    comment_file.close()



comment_file_name="太空旅客.txt"
result_file_name="测试结果.txt"
obj_dir="词典"

find_comment(comment_file_name,result_file_name,obj_dir)
