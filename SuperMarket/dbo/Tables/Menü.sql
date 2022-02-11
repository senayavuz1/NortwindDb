CREATE TABLE [dbo].[Menü] (
    [id]    INT          NOT NULL,
    [Menu]  VARCHAR (50) NULL,
    [Fiyat] MONEY        NULL,
    [Tarih] DATETIME     CONSTRAINT [DF_Menü_Tarih] DEFAULT (getdate()) NULL,
    CONSTRAINT [PK_Menü] PRIMARY KEY CLUSTERED ([id] ASC)
);

