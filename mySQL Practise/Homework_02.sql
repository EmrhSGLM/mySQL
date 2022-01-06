use sys;
CREATE TABLE calisanlar
(
id CHAR(4),
isim VARCHAR(50),
maas int,
CONSTRAINT id_pk PRIMARY KEY (id)
);

INSERT INTO calisanlar VALUES('1001', 'Ahmet Aslan', 7000);
INSERT INTO calisanlar VALUES( '1002', 'Mehmet Yılmaz' ,12000);
INSERT INTO calisanlar VALUES('1003', 'Meryem ', 7215);
INSERT INTO calisanlar VALUES('1004', 'Veli Han', 5000);

CREATE TABLE aileler
(
id CHAR(4),
cocuk_sayisi VARCHAR(50),
ek_gelir int,
CONSTRAINT id_fk FOREIGN KEY (id) REFERENCES calisanlar(id)
);

INSERT INTO aileler VALUES('1001', 4, 2000);
INSERT INTO aileler VALUES('1002', 2, 1500);
INSERT INTO aileler VALUES('1003', 1, 2200);
INSERT INTO aileler VALUES('1004', 3, 2400);

/*=============================================================================
1-) Veli Han'ın maaşına %20 zam yapacak update komutunu yazınız.
Güncellemeden sonra calisanlar tablosu aşağıda görüldüğü gibi olmalıdır.
=================================================================================*/
update calisanlar
set maas=maas*1.2
where isim='Veli Han';

select * from calisanlar;

/*=============================================================================
2-) Maaşı ortalamanın altında olan çalışanların maaşına %20 zam yapınız.
=================================================================================*/
select AVG(maas) ort_maas from calisanlar ;

update calisanlar
set maas=maas*1.2
where  calisanlar.maas < (select AVG(maas) from (select maas from calisanlar) as ort_maas)  ;

/*=============================================================================
3-) Çalışanların isim ve cocuk_sayisi'ni listeleyen bir sorgu yazınız. Komut
sonrası görünüm aşağıdaki gibidir.
=================================================================================*/

select isim, (select cocuk_sayisi from aileler 
				where calisanlar.id=aileler.id) as cocuk_sayisi
from calisanlar;

/*=============================================================================
4-) calisanlar' ın id, isim ve toplam_gelir'lerini gösteren bir sorgu yazınız.
=================================================================================*/
select id, isim, calisanlar.maas + (select ek_gelir from aileler 
								where calisanlar.id=aileler.id) as toplam_gelir 
from calisanlar;

/*=============================================================================
5-) Eğer bir ailenin kişi başı geliri 2000 TL den daha az ise o çalışanın
-- maaşına ek %10 aile yardım zammı yapınız.
-- kisi_basi_gelir = toplam_gelir / cocuk_sayisi + 2 (anne ve baba)
=================================================================================*/
update calisanlar
set maas=maas*1.1
where (calisanlar.maas + 
(select ek_gelir from aileler where calisanlar.id=aileler.id))/
((select cocuk_sayisi from aileler where calisanlar.id=aileler.id)+2) < 2000;

select * from calisanlar;
