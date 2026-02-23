
-- Need to store, name and code for course
-- Should also store textbooks, title and year published, (will need FK)
-- Course can have multiple textbooks and textbooks can be used for >1 course, so not unique
-- When a textbook is used for a course, need to record Year and Semester Used
-- data types should also be sufficent
-- FK and PK needed

-- How should we create tables?
-- Primary Key can be CSCI-443 assuming unique - assumption we will make
-- FK will refrence a certain textbook
-- Can store the textbooks in sequential IDs that would include title and year published
-- The coures will refrence this table in FKs
-- Course table should be made up of CourseName, code, FK for textbook, year of use, semesester of use

-- Code for course will be primary key... how to specifiy in SQL, is implict?
-- Varchar for CourseName, code, semester of use
-- year can be int, small as possible 2048 can fit in like 11 bits I think
-- so year will be int of 3 bytes if I have to specifcy


CREATE TABLE TextBook (
    Title VARCHAR(80) NOT NULL PRIMARY KEY,
    Year_Published smallint
);

CREATE TABLE courses (
    Code varchar(10) NOT NULL PRIMARY KEY,
    Course_Name varchar(20),
    Year_of_Use SMALLINT,
    Semester_of_use varchar(8),
    Title varchar(80),
    CONSTRAINT FK_PersonOrder FOREIGN KEY (Title)
    REFERENCES TextBook(Title)
);

SELECT * FROM courses;
SELECT * FROM TextBook;


INSERT INTO TextBook VALUES( 'Database Systems: The only Relation you Need', '2004'
);

INSERT INTO courses VALUES (
    'CS443', 'Database Systems',
    '2026', 'Spring', 'Database Systems: The only Relation you Need'
);


UPDATE TextBook
SET Year_Published = '2002'
WHERE title = 'Database Systems: The only Relation you Need';

DELETE FROM TextBook where Year_Published = '2002';

DROP TABLE courses;
DROP TABLE TextBook;