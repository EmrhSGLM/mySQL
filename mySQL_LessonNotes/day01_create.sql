CREATE TABLE student 
(   
    id VARCHAR(4)  ,
    name VARCHAR(20),
    age int
);
use sys;
/* ========================================================= 
                     VERİ GİRİSİ 
===========================================================*/

INSERT INTO student VALUES('1001','MEHMET ALİ', 25);
INSERT INTO student VALUES('1002', 'AYSE YILMAZ', 34);
INSERT INTO student VALUES('1003', 'JOHN STAR', 56);
INSERT INTO student VALUES('1004', 'MARY BROWN', 17);

/* ========================================================= 
                    PARCALI VERİ GİRİSİ 
===========================================================*/

insert into student(name,age) VALUES('samet ay',24);

/* ========================================================= 
            TABLODAN VERİ SORGULAMA
===========================================================*/

select * from student;
