-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema university
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `university` DEFAULT CHARACTER SET utf8 ;

USE `university` ;

-- -----------------------------------------------------
-- Table `university`.`college`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `university`.`college` ;

CREATE TABLE IF NOT EXISTS `university`.`college` (
  `college_id` INT NOT NULL AUTO_INCREMENT,
  `college_name` VARCHAR(50) NOT NULL,
  PRIMARY KEY (`college_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `university`.`department`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `university`.`department` ;

CREATE TABLE IF NOT EXISTS `university`.`department` (
  `department_id` VARCHAR(5) NOT NULL,
  `department_name` VARCHAR(60) NOT NULL,
  `college_id` INT NOT NULL,
  PRIMARY KEY (`department_id`),
  INDEX `fk_department_college_idx` (`college_id` ASC) VISIBLE,
  CONSTRAINT `fk_department_college`
    FOREIGN KEY (`college_id`)
    REFERENCES `university`.`college` (`college_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `university`.`term`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `university`.`term` ;

CREATE TABLE IF NOT EXISTS `university`.`term` (
  `term_id` INT NOT NULL AUTO_INCREMENT,
  `term` VARCHAR(10) NOT NULL,
  `year` YEAR NOT NULL,
  PRIMARY KEY (`term_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `university`.`course`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `university`.`course` ;

CREATE TABLE IF NOT EXISTS `university`.`course` (
  `course_num` VARCHAR(8) NOT NULL,
  `course_title` VARCHAR(45) NOT NULL,
  `credits` INT NOT NULL,
  `department_id` VARCHAR(5) NOT NULL,
  PRIMARY KEY (`course_num`),
  INDEX `fk_course_department1_idx` (`department_id` ASC) VISIBLE,
  CONSTRAINT `fk_course_department1`
    FOREIGN KEY (`department_id`)
    REFERENCES `university`.`department` (`department_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `university`.`faculty`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `university`.`faculty` ;

CREATE TABLE IF NOT EXISTS `university`.`faculty` (
  `faculty_id` INT NOT NULL AUTO_INCREMENT,
  `faculty_fname` VARCHAR(20) NOT NULL,
  `faculty_lname` VARCHAR(30) NOT NULL,
  PRIMARY KEY (`faculty_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `university`.`student`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `university`.`student` ;

CREATE TABLE IF NOT EXISTS `university`.`student` (
  `student_id` INT NOT NULL AUTO_INCREMENT,
  `student_fname` VARCHAR(20) NOT NULL,
  `student_lname` VARCHAR(30) NOT NULL,
  `gender` VARCHAR(2) NOT NULL,
  `city` VARCHAR(15) NOT NULL,
  `state` VARCHAR(30) NOT NULL,
  `birthdate` DATE NOT NULL,
  PRIMARY KEY (`student_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `university`.`section`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `university`.`section` ;

CREATE TABLE IF NOT EXISTS `university`.`section` (
  `section_id` INT NOT NULL AUTO_INCREMENT,
  `section` INT NOT NULL,
  `capacity` INT NOT NULL,
  `term_id` INT NOT NULL,
  `course_num` VARCHAR(8) NOT NULL,
  `faculty_id` INT NOT NULL,
  PRIMARY KEY (`section_id`),
  INDEX `fk_section_term1_idx` (`term_id` ASC) VISIBLE,
  INDEX `fk_section_course1_idx` (`course_num` ASC) VISIBLE,
  INDEX `fk_section_faculty1_idx` (`faculty_id` ASC) VISIBLE,
  CONSTRAINT `fk_section_term1`
    FOREIGN KEY (`term_id`)
    REFERENCES `university`.`term` (`term_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_section_course1`
    FOREIGN KEY (`course_num`)
    REFERENCES `university`.`course` (`course_num`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_section_faculty1`
    FOREIGN KEY (`faculty_id`)
    REFERENCES `university`.`faculty` (`faculty_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `university`.`enrollment`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `university`.`enrollment` ;

CREATE TABLE IF NOT EXISTS `university`.`enrollment` (
  `student_id` INT NOT NULL,
  `section_id` INT NOT NULL,
  PRIMARY KEY (`student_id`, `section_id`),
  INDEX `fk_student_has_section_section1_idx` (`section_id` ASC) VISIBLE,
  INDEX `fk_student_has_section_student1_idx` (`student_id` ASC) VISIBLE,
  CONSTRAINT `fk_student_has_section_student1`
    FOREIGN KEY (`student_id`)
    REFERENCES `university`.`student` (`student_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_student_has_section_section1`
    FOREIGN KEY (`section_id`)
    REFERENCES `university`.`section` (`section_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

-- Insert Statements
USE university;

INSERT INTO college(college_name) VALUES
	("College of Physical Science and Engineering"),
    ("College of Business and Communication"),
    ("College of Language and Letters");
    
INSERT INTO department(department_id, department_name, college_id) VALUES
	("CIT", "Computer Information Technology", 1),
    ("ECON", "Economics", 2),
    ("HUM", "Humanities and Philosophy", 3);
    
INSERT INTO term(term, year) VALUES
	("Fall", 2019),
    ("Winter", 2018);
    
INSERT INTO course(course_num, course_title, credits, department_id) VALUES
	("111", "Intro to Databases", 3, "CIT"),
    ("388", "Econometrics", 4, "ECON"),
    ("150", "Micro Economics", 3, "ECON"),
    ("376", "Classical Heritage", 2, "HUM");
    
INSERT INTO faculty(faculty_fname, faculty_lname) VALUES
	("Marty", "Morring"),
    ("Nate", "Nathan"),
    ("Ben", "Barrus"),
    ("John", "Jensen"),
    ("Bill", "Barney");
    
INSERT INTO student(student_fname, student_lname, gender, city, state, birthdate) VALUES
	("Paul", "Miller", "M", "Dallas", "TX", "1996-02-22"),
    ("Katie", "Smith", "F", "Provo", "UT", "1995-07-22"),
    ("Kelly", "Jones", "F", "Provo", "UT", "1998-06-22"),
    ("Devon", "Merrill", "M", "Mesa", "AZ", "2000-07-22"),
    ("Mandy", "Murdock", "F", "Topeka", "KS", "1996-11-22"),
    ("Alece", "Adams", "F", "Rigby", "ID", "1997-05-22"),
    ("Bryce", "Carlson", "M", "Bozeman", "MT", "1997-11-22"),
    ("Preston", "Larsen", "M", "Decatur", "TN", "1996-09-22"),
    ("Julia", "Madsen", "F", "Rexburg", "ID", "1998-09-22"),
    ("Susan", "Sorensen", "F", "Mesa", "AZ", "1998-08-09");
    
INSERT INTO section(section_id, section, capacity, term_id, course_num, faculty_id) VALUES
	(1, 1, 30, 1, "111", 1), -- CIT 111 Fall 2019 S-1 
    (2, 1, 50, 1, "150", 2), -- ECON 150 Fall 2019 S-1
    (3, 2, 50, 1, "150", 2), -- ECON 150 Fall 2019 S-2
    (4, 1, 35, 1, "388", 3), -- ECON 388 Fall 2019 S-1
    (5, 1, 30, 1, "376", 4), -- HUM 376 Fall 2019 S-1
    (6, 2, 30, 2, "111", 1), -- CIT 111 Winter 2018 S-2
    (7, 3, 35, 2, "111", 5), -- CIT 111 Winter 2018 S-3
    (8, 1, 50, 2, "150", 2), -- ECON 150 Winter 2018 S-1
    (9, 2, 50, 2, "150", 2), -- ECON 150 Winter 2018 S-2
    (10, 1, 30, 2, "376", 4); -- HUM 376 Winter 2018 S-1
    
INSERT INTO enrollment(student_id, section_id) VALUES 
	(6, 7),
    (7, 6),
    (7, 8),
    (7, 10),
    (4, 5),
    (9, 9),
    (2, 4), 
    (3, 4),
    (5, 4),
    (5, 5),
    (1, 1),
    (1, 3),
    (8, 9), 
    (10, 6);
    
-- 	QUERY STATEMENTS

-- Query 01
SELECT student_fname AS fname, student_lname AS lname, DATE_FORMAT(birthdate, "%M %d, %Y") AS "Sept Birthdays"
FROM student
WHERE birthdate LIKE "%-09-%"
ORDER BY student_lname;

-- Query 02
SELECT student_lname AS lname, student_fname AS fname, FLOOR(DATEDIFF("2017-01-05", birthdate) / 365) AS Years,
DATEDIFF("2017-01-05", birthdate) % 365 AS Days,
CONCAT(FLOOR(DATEDIFF("2017-01-05", birthdate) / 365), " - Yrs, ", DATEDIFF("2017-01-05", birthdate) % 365, " - days") AS "Years and Days"
FROM student
ORDER BY Years DESC, Days DESC;

-- Query 03
SELECT student_fname, student_lname
FROM student st
	JOIN enrollment e
		ON st.student_id = e.student_id
	JOIN section s
		ON e.section_id = s.section_id
	JOIN faculty f
		ON s.faculty_id = f.faculty_id
WHERE faculty_fname = "John" AND faculty_lname = "Jensen"
ORDER BY student_lname;

-- Query 04
SELECT faculty_fname, faculty_lname
FROM faculty f
	JOIN section s
		ON f.faculty_id = s.faculty_id
	JOIN enrollment e
		ON s.section_id = e.section_id
	JOIN student st
		ON e.student_id = st.student_id
WHERE student_fname ="Bryce"
ORDER BY faculty_lname;

-- Query 05
SELECT student_fname, student_lname
FROM student st
	JOIN enrollment e
		ON st.student_id = e.student_id
	JOIN section s
		ON e.section_id = s.section_id
	JOIN course c
		ON s.course_num = c.course_num
	JOIN term t
		ON s.term_id = t.term_id
WHERE course_title = "Econometrics" AND term = "Fall" AND year = 2019
ORDER BY student_lname;

-- Query 06
SELECT department_id, c.course_num, course_title name
FROM student st
	JOIN enrollment e
		ON st.student_id = e.student_id
	JOIN section s
		ON e.section_id = s.section_id
	JOIN course c
		ON s.course_num = c.course_num
WHERE student_fname = "Bryce" AND student_lname = "Carlson"
ORDER BY name;

-- Query 07
SELECT term, year, COUNT(e.student_id) Enrollment
FROM student st
	JOIN enrollment e
		ON st.student_id = e.student_id
	JOIN section s
		ON e.section_id = s.section_id
	JOIN course c
		ON s.course_num = c.course_num
	JOIN term t
		ON s.term_id = t.term_id
GROUP BY term, year
HAVING term = "Fall" AND year = 2019;

-- Query 08
SELECT college_name Colleges, COUNT(c.course_num) Courses
FROM college cl
	JOIN department d
		ON cl.college_id = d.college_id
	JOIN course c
		ON d.department_id = c.department_id
GROUP BY college_name
ORDER BY Colleges;

-- Query 09
SELECT faculty_fname, faculty_lname, SUM(capacity) TeachingCapacity
FROM faculty f
	JOIN section s
		USING(faculty_id)
	JOIN term t
		ON s.term_id = t.term_id
WHERE term = "Winter" AND year = 2018
GROUP BY faculty_fname, faculty_lname
ORDER BY TeachingCapacity;

-- Query 10
SELECT student_lname, student_fname, SUM(credits) Credits
FROM student st
	JOIN enrollment e
		ON st.student_id = e.student_id
	JOIN section s
		ON e.section_id = s.section_id
	JOIN course c
		ON s.course_num = c.course_num
	JOIN term t
		ON s.term_id = t.term_id
WHERE term = "Fall" AND year = 2019
GROUP BY student_lname, student_fname
HAVING SUM(credits) > 3
ORDER BY Credits DESC;
	
