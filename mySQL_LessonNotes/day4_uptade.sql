use sys;
/* ============================== UPDATE SET ===================================    
    
    
==============================================================================*/  
   -- primary-foreign bağlantisi son 2 soruda işe yarayacak
   CREATE TABLE tedarikciler -- parent
    (
        vergi_no int PRIMARY KEY,
        firma_ismi VARCHAR(50),
        irtibat_ismi VARCHAR(50)
       ); 
    
    INSERT INTO tedarikciler VALUES (101, 'IBM', 'Kim Yon');
    INSERT INTO tedarikciler VALUES (102, 'Huawei', 'Çin Li');
    INSERT INTO tedarikciler VALUES (103, 'Erikson', 'Maki Tammamen');
    INSERT INTO tedarikciler VALUES (104, 'Apple', 'Adam Eve');
    
    CREATE TABLE urunler -- child 
    (
        ted_vergino int, 
        urun_id int, 
        urun_isim VARCHAR(50), 
        musteri_isim VARCHAR(50),
        CONSTRAINT fk_urunler FOREIGN KEY(ted_vergino) REFERENCES tedarikciler(vergi_no)
        on delete cascade
    );    
    
    INSERT INTO urunler VALUES(101, 1001,'Laptop', 'Ayşe Can');
    INSERT INTO urunler VALUES(102, 1002,'Phone', 'Fatma Aka');
    INSERT INTO urunler VALUES(102, 1003,'TV', 'Ramazan Öz');
    INSERT INTO urunler VALUES(102, 1004,'Laptop', 'Veli Han');
    INSERT INTO urunler VALUES(103, 1005,'Phone', 'Canan Ak');
    INSERT INTO urunler VALUES(104, 1006,'TV', 'Ali Bak');
    INSERT INTO urunler VALUES(104, 1007,'Phone', 'Aslan Yılmaz');
    
    select * from tedarikciler , urunler where tedarikciler.vergi_no = urunler.ted_vergino;
    
    SELECT * FROM tedarikciler;
    SELECT * FROM urunler;
    
    -- SYNTAX
    -- --------
    -- UPDATE tablo_adı
    -- SET sutun1 = yeni_deger1, sutun2 = yeni_deger2,...  
    -- WHERE koşul;
      
/* -----------------------------------------------------------------------------
  ORNEK1: vergi_no’su 102 olan tedarikcinin (firma) ismini 'Vestel' olarak güncelleyeniz. 
 -----------------------------------------------------------------------------*/ 
 UPDATE tedarikciler
 set firma_ismi='VESTEL'
 where vergi_no=102;
 SELECT * FROM tedarikciler;
   
/* -----------------------------------------------------------------------------
  ORNEK2: Tedarikciler tablosundaki tüm firma isimlerini 'CASPER' olarak 
  güncelleyeniz. 
 -----------------------------------------------------------------------------*/ 
 
 UPDATE tedarikciler
 set firma_ismi='CASPER';
 SELECT * FROM tedarikciler;

    
/* -----------------------------------------------------------------------------
  ORNEK3: vergi_no’su 101 olan tedarikcinin ismini 'casper' ve irtibat_ismi’ni 
  'Ali Veli' olarak güncelleyiniz. 
 -----------------------------------------------------------------------------*/ 
 UPDATE tedarikciler
 set firma_ismi='casper' , irtibat_ismi='Ali Veli'
 where vergi_no=101;
  SELECT * FROM tedarikciler;
   
    
/* -----------------------------------------------------------------------------
  ORNEK4: firma_ismi  olan tedarikcinin irtibat_ismini 'İpek Bilgin' 
  olarak güncelleyiniz.
 -----------------------------------------------------------------------------*/ 
   
   UPDATE tedarikciler
   set irtibat_ismi='İpek Bilgin'
   where firma_ismi='casper';
   SELECT * FROM tedarikciler;

   
/* -----------------------------------------------------------------------------
  ORNEK5: urunler tablosundaki 'Phone' değerlerini Telefon olarak güncelleyiniz.
 -----------------------------------------------------------------------------*/
   update urunler
   set urun_isim='Telefon'
   where urun_isim='Phone'; 
   SELECT * FROM urunler;
/* -----------------------------------------------------------------------------
  ORNEK6: urunler tablosundaki urun_id değeri 1004'ten büyük olanların urun_id
  değerlerini bir arttırınız
 -----------------------------------------------------------------------------*/ 
   update urunler
   set urun_id=urun_id+1
   where urun_id > 1004;
   SELECT * FROM urunler;
  
 /* ----------------------------------------------------------------------------
  ORNEK7: urunler tablosundaki tüm ürünlerin urun_id değerini ted_vergino 
  sutun değerleri ile toplayarak güncelleyiniz.
 -----------------------------------------------------------------------------*/  
   update urunler
   set urun_id = urun_id + ted_vergino;
   SELECT * FROM urunler;
    
/*-----------------------------------------------------------------------------
 ORNEK8: urunler tablosundan Ali Bak’in aldigi urunun ismini, tedarikci 
 tablosunda irtibat_ismi 'Adam Eve' olan firmanın ismi (firma_ismi) ile 
 degistiriniz.
 -----------------------------------------------------------------------------*/
   DELETE FROM tedarikciler; -- tedarikcilerin insert lerini tekrar yapiyoruz
   UPDATE urunler
   set urun_isim= (select firma_ismi from tedarikciler where irtibat_ismi='Adam Eve')
   where musteri_isim='Ali Bak';
   SELECT * FROM urunler;
   SELECT * FROM tedarikciler;
  
/*------------------------------------------------------------------------------
 ORNEK9: Laptop satin alan musterilerin ismini, Apple’in irtibat_isim'i ile 
 degistirin
 -----------------------------------------------------------------------------*/
 update urunler
 set musteri_isim = (select irtibat_ismi from tedarikciler where firma_ismi='Apple')
 where urun_isim='Laptop';
 SELECT * FROM urunler;
 SELECT * FROM tedarikciler;
 