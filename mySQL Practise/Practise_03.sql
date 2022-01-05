use sys;
Create table koyluler
(
	id int,
	name VARCHAR(10),
	surname VARCHAR(20),
	tarlaPafta int
);	
select*from koyluler;

/*========================================================
					VERI GIRISI
============================================================*/
INSERT INTO koyluler VALUES(1,'Suleyman','Civelek',2521);
INSERT INTO koyluler VALUES(2,'Osman','Saglam',2563);
INSERT INTO koyluler VALUES(3,'Hakkı','Begender',7852);
INSERT INTO koyluler VALUES(4,'Veli','Kermez',2236);
INSERT INTO koyluler VALUES(5,'Huseyin','Altın',5632);

/*========================================================
					PARCALI VERI GIRISI
============================================================*/
INSERT INTO koyluler(İD,NAME,SURNAME,tarlaPafta) VALUES(8,'Kazım','Gulec',8965);



