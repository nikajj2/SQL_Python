
DROP TABLE IF EXISTS Grade;
DROP TABLE IF EXISTS Class;
DROP TABLE IF EXISTS Student;
DROP TABLE IF EXISTS Course;



CREATE TABLE Student (
  EMPLID INT NOT NULL,
  FirstName VARCHAR(20) NOT NULL,
  LastName VARCHAR(20) NOT NULL,
  Email VARCHAR(40) NOT NULL,
  PRIMARY KEY (EMPLID)
);
CREATE TABLE Course (
  CourseID INT NOT NULL,
  Department VARCHAR(45) NOT NULL,
  CourseName VARCHAR(45) NOT NULL,
  PRIMARY KEY (CourseID, Department)
);
CREATE INDEX idx_CourseName ON Course (CourseName);
CREATE TABLE Class (
  CourseName VARCHAR(60) NOT NULL,
  SessionNumber INT NOT NULL,
  InstructorName VARCHAR(45) NOT NULL,
  PRIMARY KEY (CourseName, SessionNumber),
  FOREIGN KEY (CourseName) REFERENCES Course (CourseName)
);
CREATE INDEX idx_Session ON Class (  SessionNumber );
CREATE TABLE Grade (
  CourseName VARCHAR(45) NOT NULL,
  EMPLID INT NOT NULL,
  SessionNumber INT NOT NULL,
  Grade VARCHAR(1) NOT NULL,
  PRIMARY KEY (CourseName, SessionNumber,EMPLID ),
  FOREIGN KEY (CourseName) REFERENCES Course (CourseName),
  FOREIGN KEY (EMPLID ) REFERENCES Student (EMPLID ),
  FOREIGN KEY (SessionNumber) REFERENCES Class (SessionNumber)
);
Select * from Class;
Select * from Course;
Select * from Grade;
select* from Student;

CREATE USER 'project'@'localhost' IDENTIFIED BY 'CSC33600Spring';

SELECT `user`, `host` FROM `mysql`.`user`;

SHOW grants;

/*Priviledges on table Student: SELECT,INSERT,DELETE,UPDATE, REFERENCES, ALTER,CREATE,DROP,INDEX */
GRANT SELECT,INSERT,DELETE,UPDATE  ON `sakila`.`Student` TO 'project'@'localhost' ;
GRANT REFERENCES, ALTER,CREATE,DROP,INDEX ON `sakila`.`Student` TO 'project'@'localhost' ;
/*Priviledges on table Course: SELECT,INSERT,DELETE,UPDATE, REFERENCES, ALTER,CREATE,DROP,INDEX */
GRANT SELECT,INSERT,DELETE,UPDATE  ON `sakila`.`Course` TO 'project'@'localhost' ;
GRANT REFERENCES, ALTER,CREATE,DROP,INDEX ON `sakila`.`Course` TO 'project'@'localhost' ;
/*Priviledges on table Grade:SSELECT,INSERT,DELETE,UPDATE, REFERENCES, ALTER,CREATE,DROP,INDEX */
GRANT SELECT,INSERT,DELETE,UPDATE  ON `sakila`.`Class` TO 'project'@'localhost' ;
GRANT REFERENCES, ALTER,CREATE,DROP,INDEX ON `sakila`.`Class` TO 'project'@'localhost' ;

/*Priviledges on table Class:SELECT,INSERT,DELETE,UPDATE, REFERENCES, ALTER,CREATE,DROP,INDEX */
GRANT SELECT,INSERT,DELETE,UPDATE  ON `sakila`.`Grade` TO 'project'@'localhost' ;
GRANT REFERENCES, ALTER,CREATE,DROP,INDEX ON `sakila`.`Grade` TO 'project'@'localhost' ;

SHOW GRANTS FOR 'project'@'localhost' ;
