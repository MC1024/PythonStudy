#coding=utf-8

import os
import MySQLdb
import sys
import types
reload(sys)
sys.setdefaultencoding("UTF-8")
address="/home/yupwei/Downloads/study/MySQL上课文件/作业/university"#定义好当前目录
os.chdir(address)
#连接数据库
conn=MySQLdb.connect('localhost','yupwei','123','test')
cur=conn.cursor()

with open('department.txt','r') as dept_file:
    #打开对应文件，以读取方式读取其中所以内容并以行分开
    for dept_info in dept_file.readlines():
        #对每一行内容先用split()函数分割成列表，按照表属性的类别进行转换
        dept_info=dept_info.split()
        dept_name=dept_info[0]
        building=dept_info[1]
        budget=int(dept_info[2])


        cur.execute('INSERT INTO department VALUES("%s","%s","%d")'%(dept_name,building,budget))
        conn.commit()
        #插入数据

with open('student.txt','r') as student_file:
    # 打开对应文件，以读取方式读取其中所以内容并以行分开
    for student_info in student_file.readlines():
        # 对每一行内容先用split()函数分割成列表，按照表属性的类别进行转换
        student_info=student_info.split()
        ID=int(student_info[0])
        name=student_info[1]
        sex=student_info[2]
        age=int(student_info[3])
        emotion_state=student_info[4]
        dept_name=student_info[5]
        cur.execute("INSERT INTO student VALUES('%d','%s','%s','%d','%s','%s')"%(ID,name,sex,age,emotion_state,dept_name))
        conn.commit()
with open('exam.txt','r') as exam_file:
    # 打开对应文件，以读取方式读取其中所以内容并以行分开
    for exam_info in exam_file.readlines():
        # 对每一行内容先用split()函数分割成列表，按照表属性的类别进行转换
        exam_info=exam_info.split()
        student_ID=int(exam_info[0])
        exam_name=exam_info[1]
        grade=int(exam_info[2])
        print student_ID


        cur.execute("INSERT INTO exam VALUES('%d','%s','%d')"%(student_ID,exam_name,grade))
        conn.commit()

