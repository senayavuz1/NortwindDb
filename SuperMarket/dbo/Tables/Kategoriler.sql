CREATE TABLE [dbo].[Kategoriler] (
    [Id]       INT          NOT NULL,
    [Adi]      VARCHAR (50) NULL,
    [Aciklama] VARCHAR (50) NULL,
    [UstId]    INT          NULL,
    CONSTRAINT [PK_Kategoriler] PRIMARY KEY CLUSTERED ([Id] ASC)
);

