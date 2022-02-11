CREATE TABLE [dbo].[FaturaDetay] (
    [FaturaId] INT   NOT NULL,
    [UrunId]   INT   NOT NULL,
    [Adet]     INT   NULL,
    [Fiyat]    MONEY NULL,
    CONSTRAINT [PK_Table] PRIMARY KEY CLUSTERED ([FaturaId] ASC, [UrunId] ASC)
);


GO
-- SQL server tablolara gelen yeni insert kayitlarini
	-- sanal bir tabloda tutar. Bu tablonun adi insert tablosudur
	-- silme isleminde ise silinen kayitlari deleted sanal tablosunda tutar
	-- Update islemde verinin onceki hali deleted tablosunda tutulurken
	-- Verinin yeni hali ise inserted tablosunda tutulur
CREATE TRIGGER [UpdateUrunler]
	ON [dbo].[FaturaDetay]
	FOR INSERT
	AS
	BEGIN
	-- inserted tablosundaki gelen degerleri karsılamak icin gerekli degiskenler
    Declare @faturaId int, @UrunId int,@Adet int, @Fiyat money,@FaturaTipi tinyint

	Select  @faturaId=i.FaturaId,
            @UrunId=i.UrunId,
			@Adet=i.Adet,
			@Fiyat=i.Fiyat
	from inserted i

	-- FaturaMaster tablosundaki Faturatipi alıs yada satıs faturası oldugunu belirler
	--1-alis faturasidir 2-satis faturasidir

	-- ilgili kaydın fatura tipine ulasıyoruz
	select @FaturaTipi=fm.FaturaTipi
	from FaturaMaster fm
	where fm.Id=@faturaId

	if(@FaturaTipi=1)
	Begin
	  
	  Update urunler set StokAdedi = StokAdedi + @Adet where Id = @UrunId
	
	End
	else
	Begin

	  Declare @StokAdedi float
	  Select @StokAdedi = Urunler.StokAdedi from Urunler where Id = @UrunId

	  if(@adet < @StokAdedi)
	  Update urunler set StokAdedi = StokAdedi - @Adet where Id = @UrunId

    End

END