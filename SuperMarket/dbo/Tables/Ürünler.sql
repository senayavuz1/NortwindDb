CREATE TABLE [dbo].[Ürünler] (
    [id]         INT           IDENTITY (1, 1) NOT NULL,
    [UrunAdi]    VARCHAR (50)  NULL,
    [Açiklama]   VARCHAR (500) NULL,
    [Fiyat]      MONEY         NULL,
    [StokAdedi]  FLOAT (53)    NULL,
    [BirimId]    INT           NULL,
    [KategoriId] INT           NULL,
    [VergiId]    INT           NULL,
    [StokTipi]   SMALLINT      NULL,
    CONSTRAINT [PK_Ürünler] PRIMARY KEY CLUSTERED ([id] ASC),
    CONSTRAINT [FK_Ürünler_Birimler] FOREIGN KEY ([BirimId]) REFERENCES [dbo].[Birimler] ([id]),
    CONSTRAINT [FK_Ürünler_Kategoriler] FOREIGN KEY ([KategoriId]) REFERENCES [dbo].[Kategoriler] ([Id]),
    CONSTRAINT [FK_Ürünler_StokTipi] FOREIGN KEY ([StokTipi]) REFERENCES [dbo].[StokTipi] ([id]),
    CONSTRAINT [FK_Ürünler_Vergi] FOREIGN KEY ([VergiId]) REFERENCES [dbo].[Vergi] ([id])
);

