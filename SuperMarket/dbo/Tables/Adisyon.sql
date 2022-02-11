CREATE TABLE [dbo].[Adisyon] (
    [id]            INT          NOT NULL,
    [Personel]      VARCHAR (11) NULL,
    [AcilisTarihi]  DATETIME     CONSTRAINT [DF_Adisyon_AcilisTarihi] DEFAULT (getdate()) NULL,
    [KapanisTarihi] DATETIME     NULL,
    [Masaid]        INT          NULL,
    CONSTRAINT [PK_Adisyon] PRIMARY KEY CLUSTERED ([id] ASC),
    CONSTRAINT [FK_Adisyon_Masalar] FOREIGN KEY ([Masaid]) REFERENCES [dbo].[Masalar] ([Id]),
    CONSTRAINT [FK_Adisyon_Users] FOREIGN KEY ([Personel]) REFERENCES [dbo].[Users] ([Tcno])
);

