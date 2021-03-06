/*
Degisken Tanimlari:
Degisken Tipleri : Sayisal,string,bit,DateTime,Binary
Sayisal Veri Tipleri : 
tinyint    : 0-2555
samllint   : -32.768 ve 32.768
int        : -2 milyar / +2 milyar

Ondalikli Sayilar
float : + byte
money : decimal veri tipinin virgulden sonraki 4 basamakli
decimal : kayan noktali veri tipidir
 
*/

/*
değisken Tanımlama : declare keyword'u ile yapılır
                     Ayrıca degisken isimlerinin basina @ işareti
                     konulmak zorundadir
Aralarinda ',' koyarak da devam edebilirsiniz.
*/

declare @sayi int
-- bir kisinin adini,soyadını,yasını,tcNo sunu
-- ve cebindeki parasini tutan degiskenleri tanimlayiniz

declare @ad varchar(50),@soyad varchar(50),@yas tinyint
declare @tcno varchar(11), @para money

-- Degiskenlerin icerisindeki degerleri gormek icin
-- 1.Yol Select cekmektir
Select @ad ad,@soyad soyad,@yas yas
--2.yol
Print @ad + @soyad

/*
Degiskenlere deger atama 2 sekilde olur.
1.Yontem Select yontemidir
2.yontem set komutu kullanilir

Örnek
*/
--deger atamasında aralarinda virgul konularak istediginiz kadar uzatabilirsiniz
declare @ad varchar(50),@soyad varchar(50),@yas tinyint
Select @ad = 'Ali', @soyad = 'Veli', @yas = '30' 
select @ad ad,@soyad soyad,@yas yas
Print @ad + @soyad

/*

Procedure Tanımlama için Create kullanılır. Creat komutu
genel anlamda sql server icerisinde olusturulabilecek butun objelerden sorumludur.

Creat Procedure <ProcedureAdi> (AldigiParametreler)
as
Begin

End
*/


Alter Procedure DortIslem
(@sayi1 int,@sayi2 int)
as
Begin

Print 'Carpim :'+ Convert(varchar,(@sayi1 * @sayi2))
Print 'Bolme :'+ Convert(varchar,(@sayi1 / @sayi2))
Print 'Toplama :'+ convert(varchar,(@sayi1 + @sayi2))
Print 'Cıkarma :'+ Convert(varchar,(@sayi1 - @sayi2))

End

exec dbo.DortIslem 10 ,5

