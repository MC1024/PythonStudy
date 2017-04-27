# coding=UTF-8
import os
import sys

reload(sys)
sys.setdefaultencoding('utf-8')


os.chdir("/home/yupwei/Downloads/study")



def find_comment(comment_file_name,result_file_name,obj_dir):
    comment_file = open(comment_file_name, 'r')
    result_file = open(result_file_name, 'a')
    for line in comment_file.readlines():
        word_list = []
        for root, dirs, files in os.walk(obj_dir):
            for name in files:
                filename = os.path.join(root, name).decode('UTF-8')
                file_1 = open(filename, 'r')
                for read_line in file_1.readlines():
                    if read_line.strip() in line:
                        name_new = name.split('.')[0]
                        if name_new not in word_list:
                            word_list.append(name_new)

                file_1.close()
        for words in word_list:
            result_file.write(words + "\t")

        result_file.write("\n")
    result_file.close()
    comment_file.close()



comment_file_name="太空旅客.txt"
result_file_name="测试结果.txt"
obj_dir="词典"

find_comment(comment_file_name,result_file_name,obj_dir)