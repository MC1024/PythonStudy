SHOW databases;#先显示有哪些数据库
USE test;#使用其中一个数据库
show tables;#显示其中有多少table
CREATE TABLE `test`.`department` (
#先创建department表，设置三个属性budget为int外其他都为varchar，其中dept_name为主键
  `dept_name` VARCHAR(45) NOT NULL,
  `building` VARCHAR(45) NULL,
  `budget` INT NULL,
  PRIMARY KEY (`dept_name`));
CREATE TABLE `test`.`student` (
#之后再创建student表，设置一下属性，其中id和age用int类型
#将id设为主键，以递增排列，设置外键将dept_name和department表中的dept_name关联起来，更新时跟随改变，删除时设为null
  `ID` INT NOT NULL,
  `name` VARCHAR(45) NULL,
  `sex` VARCHAR(10) NULL,
  `age` INT NULL,
  `emotion_state` VARCHAR(45) NULL,
  `studentcol` VARCHAR(45) NULL,
  `dept_name` VARCHAR(45) NULL,
  PRIMARY KEY (`ID`),
  INDEX `dept_name_idx` (`dept_name` ASC),
  CONSTRAINT `dept_name`
    FOREIGN KEY (`dept_name`)
    REFERENCES `test`.`department` (`dept_name`)
    ON DELETE SET NULL
	ON UPDATE CASCADE);
CREATE TABLE `test`.`exam` (
#最后创建exam表，设置两个主键之后设置外键将student_ID和student表中的ID关联起来，更新时跟随，删除时不采取措施
#因为student_ID是主键，不可设置为null，而且也有删除student表中的学生也是可能的操作，经过这些考虑决定使用no action
  `student_ID` INT NOT NULL,
  `exam_name` VARCHAR(45) NOT NULL,
  `grade` INT NULL,
  PRIMARY KEY (`student_ID`, `exam_name`),
  CONSTRAINT `student_ID_fk`
    FOREIGN KEY (`student_ID`)
    REFERENCES `test`.`student` (`ID`)
    ON DELETE NO ACTION
    ON UPDATE CASCADE);
