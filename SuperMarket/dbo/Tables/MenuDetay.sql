CREATE TABLE [dbo].[MenuDetay] (
    [Detayid] INT      NOT NULL,
    [Menuid]  INT      NULL,
    [Urunid]  INT      NULL,
    [Adet]    INT      NULL,
    [Tarih]   DATETIME NULL,
    CONSTRAINT [PK_MenuDetay] PRIMARY KEY CLUSTERED ([Detayid] ASC),
    CONSTRAINT [FK_MenuDetay_Menü] FOREIGN KEY ([Menuid]) REFERENCES [dbo].[Menü] ([id]),
    CONSTRAINT [FK_MenuDetay_Ürünler] FOREIGN KEY ([Urunid]) REFERENCES [dbo].[Ürünler] ([id])
);

