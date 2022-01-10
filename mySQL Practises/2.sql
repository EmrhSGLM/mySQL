use sys;
-- Create işçi tablosu alanları worker_id,work_name,work_salary şeklindedir.
-- worker_id, worker_id_pk adında primary key sahip olacak
-- İşçiler tablosuna 4 kayıt ekleyin
-- Konsoldaki tabloya bakın
CREATE TABLE worker 
(
    worker_id char(3),
    worker_name VARCHAR(50),
    worker_salary int not null,
     CONSTRAINT worker_id_pk PRIMARY KEY (worker_id)
);
DROP TABLE worker;
INSERT INTO WORKER VALUES ('100','Ali can', 1200);
INSERT INTO WORKER VALUES ('102','Veli Han', 2000);
INSERT INTO WORKER VALUES ('103','Ayse Kan', 7000);
INSERT INTO WORKER VALUES ('104', 'Angie Ocean', 8500);

SELECT * FROM WORKER ;

-- Veli Han'ın maaşına; en yüksek maaşin yüzde 80(%20 oraninda azaltarak) i kadar zam yapin

update worker
set worker_salary=worker_salary+((select max(worker_salary) from (select * from worker) as emrah )*0.8)
where worker_name='Veli Han';


-- Ali Can'ın maaşını , min maas i yuzde 30 artırarak update edin

update worker
set worker_salary=(select min(worker_salary)from (select*from worker) as emrah )*1.3 
where worker_name='Ali Can';


-- Maaş ortalama maaştan düşükse maaşları 1000 Tl artırın

update worker
set worker_salary = worker_salary + 1000
where worker_salary < (select avg(worker_salary) from (select * from worker) as W);



-- Maaşın ortalama maaştan az olması durumunda maaşları ortalama maaşa eşit

update worker
set worker_salary = (select avg(worker_salary) from (select * from worker) as W)
where worker_salary < (select avg(worker_salary) from (select * from worker) as W);

select * from worker;


