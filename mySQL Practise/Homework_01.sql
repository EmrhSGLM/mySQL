use sys;
Create table hastaneler
(
	ID  VARCHAR(10) PRIMARY KEY,
	ISIM VARCHAR(30),
	SEHIR VARCHAR(20),
	OZEL CHAR
);
SELECT *  FROM HASTANELER;
INSERT INTO hastaneler VALUES('H101','ACI BADEM HASTANESI','ISTANBUL','Y');
INSERT INTO hastaneler VALUES('H102','HASSEKI HASTANESI','ISTANBUL','N');
INSERT INTO hastaneler VALUES('H103','MEDIKOL HASTANESI','IZMIR','Y');
INSERT INTO hastaneler VALUES('H104','MEMORYIL HASTANESI','ANKARA','Y');

Create taBLE hastalar
(
	KIMLIK_NO  varchar(15) PRIMARY KEY,
	ISIM VARCHAR(30),
	TESHIS VARCHAR(20)
	
);
SELECT *  FROM hastalar;
INSERT INTO hastalar VALUES(12346678901,'Ali Can','Gizli Seker');
INSERT INTO hastalar VALUES(45678901121,'Ayse Yilmaz','Hipertansiyon');
INSERT INTO hastalar VALUES(78901123451,'Steve Job','Pankreatit');
INSERT INTO hastalar VALUES(12344321251,'Tom Hanks','COVID 19');

Create table bolumler
(
BOLUM_ID vARCHAR(5) PRIMARY KEY,
BOLUM_ADI VARCHAR(20)
);
SELECT *  FROM bolumler;
INSERT INTO bolumler VALUES('DHL','Dahiliye');
INSERT INTO bolumler VALUES('KBB','Kulak-Burun-Bogaz');
INSERT INTO bolumler VALUES('NRJ','Noroloji');
INSERT INTO bolumler VALUES('GAST','Gastroloji');
INSERT INTO bolumler VALUES('KARD','Kardiyoloji');
INSERT INTO bolumler VALUES('PSK','Psikiyatri');
INSERT INTO bolumler VALUES('GOZ','Goz Hastaliklari');

CREATE TABLE hasta_kayitlari
(
KIMLIK_NO VARCHAR(20) PRIMARY KEY,
HASTA_ISIM VARCHAR(20),
HASTANE_ADI VARCHAR(30),
BOLUM_ADI VARCHAR(30),
TESHIS VARCHAR(15)
);
SELECT * FROM HASTA_KAYİTLARİ;
INSERT INTO hasta_kayitlari(KIMLIK_NO,HASTA_ISIM) VALUES(1111,'NONAME');
INSERT INTO hasta_kayitlari(KIMLIK_NO,HASTA_ISIM) VALUES(2222,'NONAME');
INSERT INTO hasta_kayitlari(KIMLIK_NO,HASTA_ISIM) VALUES(3333,'NONAME');

/*=============================================================================
1-) hasta_kayıtlar tablosundaki ‘3333’ kimlik nolu kaydı aşağıdaki gibi güncelleyiniz.
hasta_isim : ‘Salvadore Dali’ / hastane_adi: ‘John Hopins’ / bolum_adi: ‘Noroloji’ /
teshis: ‘Parkinson’ / kimlik_no: ‘99991111222’
=================================================================================*/
update HASTA_KAYİTLARİ
set hasta_isim='Salvadore Dali', hastane_adi='John Hopins', bolum_adi='Noroloji', teshis='Parkinson', kimlik_no='99991111222'
where kimlik_no='3333';
SELECT * FROM HASTA_KAYİTLARİ;

/*=============================================================================
2-) hasta_kayıtlar tablosundaki ‘1111’ kimlik nolu kaydı aşağıdaki gibi güncelleyiniz.
hasta_isim : hastalar tablosundaki ‘Ali Can’ ismi ile
hastane_adi: hastaneler tablosundaki 'H104' bolum_id kodlu hastanenin ismi ile
bolum_adi: bolumler tablosundaki 'DHL' bolum_id kodlu bolum_adi ile
teshis: hastalar tablosundaki 'Ali Can' isimli hastanın teshis bilgisi ile
kimlik_no: hastalar tablosundaki 'Ali Can' isimli hastanın kimlik_no kodu ile
=================================================================================*/
update HASTA_KAYİTLARİ
set hasta_isim=(select isim from hastalar where isim='Ali Can'), 
	HASTANE_ADI=(select ISIM from hastaneler where ID='H104'),
    bolum_adi=(select BOLUM_ADI from bolumler where BOLUM_ID='DHL'),
    teshis=(select TESHIS from hastalar where isim='Ali Can'),
    kimlik_no=(select KIMLIK_NO from hastalar where isim='Ali Can')
where kimlik_no='1111';

SELECT * FROM HASTA_KAYİTLARİ;

/*=============================================================================
3-) hasta_kayıtlar tablosundaki ‘2222’ kimlik nolu kaydı aşağıdaki gibi güncelleyiniz.
hasta_isim : hastalar tablosundaki ‘Ayşe Yılmaz’ ismi ile
hastane_adi: hastaneler tablosundaki 'H103' bolum_id kodlu hastanenin ismi ile
bolum_adi: bolumler tablosundaki ‘KBB’ bolum_id kodlu bolum_adi ile
teshis: hastalar tablosundaki ‘Tom Hanks' isimli hastanın teshis bilgisi ile
kimlik_no: hastalar tablosundaki 'Stevev Job' isimli hastanın kimlik_no kodu ile
=================================================================================*/
update hasta_kayitlari
set hasta_isim=(select ISIM from hastalar where ISIM='Ayse Yilmaz'),
	hastane_adi=(select ISIM from hastaneler where ID='H103'),
    bolum_adi=(select BOLUM_ADI from bolumler where BOLUM_ID='KBB'),
    teshis=(select TESHIS from hastalar where isim='Tom Hanks'),
    kimlik_no=(select KIMLIK_NO from hastalar where isim='Steve Job')
where kimlik_no='2222';

SELECT * FROM HASTA_KAYİTLARİ;
    
    
    




