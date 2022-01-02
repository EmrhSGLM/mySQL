 /* ====================== SELECT - REGEXP_LIKE ================================
    Daha karmaşık pattern ile sorgulama işlemi için REGEXP_LIKE kullanılabilir.  
     -- 'c' => case-sensitive demektir 
     -- 'i' => incase-sentisitive demektir ve default incase-sensitive aktiftir..
    Syntax:
    --------
    REGEXP_LIKE(sutun_adı, ‘pattern[] ‘, ‘c’ ] ) 
            
/* ========================================================================== */
    drop table cumleler;
    
    use sys;    
    CREATE TABLE cumleler
    (
        id int UNIQUE,
        kelime VARCHAR(50) NOT NULL,
        harf_sayisi int
    );
    
    INSERT INTO cumleler VALUES (1001, 'hot', 3);
    INSERT INTO cumleler VALUES (1002, 'hat', 3);
    INSERT INTO cumleler VALUES (1003, 'hit', 3);
    INSERT INTO cumleler VALUES (1004, 'hbt', 3);
    INSERT INTO cumleler VALUES (1005, 'hct', 3);
    INSERT INTO cumleler VALUES (1006, 'adem', 4);
    INSERT INTO cumleler VALUES (1007, 'selim', 5);
    INSERT INTO cumleler VALUES (1008, 'yusuf', 5);
    INSERT INTO cumleler VALUES (1009, 'hip', 3);
    INSERT INTO cumleler VALUES (1010, 'HOT', 3);
    INSERT INTO cumleler VALUES (1011, 'hOt', 3);
    INSERT INTO cumleler VALUES (1012, 'h9t', 3);
    INSERT INTO cumleler VALUES (1013, 'hoot', 4);
    INSERT INTO cumleler VALUES (1014, 'haaat', 5);    
    INSERT INTO cumleler VALUES (1015,'hooooot',5);
    INSERT INTO cumleler VALUES (1016,'hoaoeot',5);
    INSERT INTO cumleler VALUES (1017, 'hato', 4);
    
        select * from cumleler;
    
/* -----------------------------------------------------------------------------
  ORNEK22: İçerisinde 'ot' veya 'at' bulunan cumleleri buyuk kucuk harfe dikkat
  ederek listeleyiniz 
 -----------------------------------------------------------------------------*/ 
  Select * from cumleler
  where REGEXP_LIKE(kelime,'at|ot', 'c');
 
 
 /* -----------------------------------------------------------------------------
  ORNEK24: 'ho' veya 'hi' ile başlayan kelimeleri büyük-küçük harfe dikkat
  etmeksizin listeleyeniz
 -----------------------------------------------------------------------------*/ 
 Select * from cumleler
 where REGEXP_LIKE(kelime,'^ho|^hi'); 
 
 /* -----------------------------------------------------------------------------
  ORNEK25: Sonu 't' veya 'm' ile bitenleri büyük-küçük harfe dikkat
  etmeksizin listeleyeniz. (i yazmaya gerek yok)
 -----------------------------------------------------------------------------*/   
     -- Bitişi göstermek için $ karakteri kullanılır.
    
    Select * from cumleler
    where REGEXP_LIKE(kelime,'t$|m$');
     
     /* -----------------------------------------------------------------------------
  ORNEK26: h ile başlayıp t ile biten 3 harfli kelimeleri (h ile t küçük harfli 
  olanlari) listeleyeniz
 -----------------------------------------------------------------------------*/ 
 Select * from cumleler
 where REGEXP_LIKE(kelime,'^h[a-zA-Z0-9]t$','c');
 
 /* -----------------------------------------------------------------------------
  ORNEK27: İlk harfi h, son harfi t olup 2.harfi a veya i olan 3 harfli 
  kelimelerin tüm bilgilerini sorgulayalım.
 -----------------------------------------------------------------------------*/ 
 Select * from cumleler
 where REGEXP_LIKE(kelime,'^h[ai]t$' );
 /* -----------------------------------------------------------------------------
  ORNEK28: İçinde m veya i veya e olan kelimelerin tüm bilgilerini listeleyiniz.
 -----------------------------------------------------------------------------*/  
 Select * from cumleler
 where REGEXP_LIKE(kelime, '[mie]');
 /* -----------------------------------------------------------------------------
  ORNEK29: a veya s ile başlayan kelimelerin tüm bilgilerini listeleyiniz.
-----------------------------------------------------------------------------*/ 
Select * from cumleler
where REGEXP_LIKE(kelime,'^[as]');
/* -----------------------------------------------------------------------------
  ORNEK30: içerisinde en az 2 adet oo barındıran kelimelerin tüm bilgilerini 
  listeleyiniz.
-----------------------------------------------------------------------------*/ 
-- 1.Yol
Select * from cumleler
where REGEXP_LIKE(KELİME,'[O]{2}');
-- 2.Yol
Select * from cumleler
where regexp_like(kelime, 'oo' );
-- 3.Yol
Select * from cumleler
where regexp_like(kelime, '[o][o]' );
/* -----------------------------------------------------------------------------
  ORNEK31: Ilk harfi h, son harfi t olup, 2. harfi a veya i olan 3 harfli 
  kelimeleri tum bilgilerini sorgulayin
-----------------------------------------------------------------------------*/
Select * from cumleler
where regexp_like(kelime, '^h[ai]t$' );



