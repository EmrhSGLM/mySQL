use sys;
create table firin(
id varchar(50), 
urunAdi varchar(100),
gram double,
urunFiyat double

);
INSERT INTO firin VALUES('1','Koy Ekmegi',620,7);
INSERT INTO firin VALUES('2','Corek Ekmek',650,8);
INSERT INTO firin VALUES('3','Tam Bugday Ekmek',680,9);
INSERT INTO firin VALUES('4','Misir Ekmek',700,15);
INSERT INTO firin VALUES('5','Hashasli',750,20);
INSERT INTO firin VALUES('6','Hamursuz',800,25);
INSERT INTO firin VALUES('7','Tost Ekmegi',850,30);
INSERT INTO firin VALUES('8','Bayat Ekmek',900,35);
INSERT INTO firin VALUES('9','Tava Ekmek',950,40);
INSERT INTO firin VALUES('10','Tava Ekmek',600,82);
INSERT INTO firin VALUES('3','Tam Bugday ',685,15);

drop table firin;

select * from firin;
/* ========================================================= 
             PARCALİ    VERİ GİRİSİ 
===========================================================*/

insert into firin(urunAdi,gram,urunFiyat) values ('Baston',390,4);
select * from firin;

/* --------------------------------------------------------------------------
  ORNEK1:Grami 850 den fazla olan urunu getiriniz
 -----------------------------------------------------------------------------*/
select * from firin
where gram > 850;

  /* -----------------------------------------------------------------------------
  ORNEK2: grami 600 ile 800 arasinda olan urunleri getiriniz? and  or kullanilacaksa 
  between kulllan
 -----------------------------------------------------------------------------*/ 
-- 1 . Yol
select * from firin
where gram >= 600  && gram <= 800 ;
-- 2 . Yol
select * from firin
where gram between  600 AND 800;

/* -----------------------------------------------------------------------------
  ORNEK3: fiyati sadece 20  ile 35 arasinda olan urunleri getiriniz? and  or kullanilacaksa 
  between kullan
 -----------------------------------------------------------------------------*/ 
-- 1. Yol
Select * from firin
where urunFiyat >= 20 && urunFiyat <= 35;
-- 2.Yol
Select * from firin
where urunFiyat between 20 and 35;

/* -----------------------------------------------------------------------------
  ORNEK4: Fiyati sadece 20 30 40  ekmek bilgilerini listele
-----------------------------------------------------------------------------*/
-- 1.Yol
Select * from firin
where urunFiyat=20 or urunFiyat=30 or urunFiyat=40;
-- 2.Yol 
Select * from firin
where urunFiyat in(20,30,40); -- or kullanmak yerine 
							  -- Variable ismi in(istenen degerler arasinda virgul olacak sekilde yazilir)

/* -----------------------------------------------------------------------------
  ORNEK5: ismi H ile baslayan  ekmek bilgilerini listele
-----------------------------------------------------------------------------*/
Select * from firin
where urunAdi like 'H%';

/* -----------------------------------------------------------------------------
  ORNEK6: son harfi k olan  ekmek bilgilerini listele
-----------------------------------------------------------------------------*/
Select * from firin
where urunAdi like '%k';

/* -----------------------------------------------------------------------------
  ORNEK7: 3. harfi m olan bilgilerini listele
-----------------------------------------------------------------------------*/
Select * from firin
where urunAdi like '%m%';

/* -----------------------------------------------------------------------------
  ORNEK8: 3. harfi m olan  ve diger harflerinde m olan ekmek bilgilerini listele
-----------------------------------------------------------------------------*/
Select * from firin
where urunAdi like '__m%m%';

/* -----------------------------------------------------------------------------
  ORNEK9: 1. harfi a olan  ve 5. harfi k olan ekmek bilgilerini listele
-----------------------------------------------------------------------------*/
Select * from firin
where urunAdi like '%E___k';