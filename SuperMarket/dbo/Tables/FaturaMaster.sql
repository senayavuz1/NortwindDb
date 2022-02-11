CREATE TABLE [dbo].[FaturaMaster] (
    [Id]         INT          IDENTITY (1, 1) NOT NULL,
    [Tarih]      DATETIME     NULL,
    [UserID]     VARCHAR (11) NOT NULL,
    [FirmaAdı]   VARCHAR (50) NULL,
    [FaturaTipi] TINYINT      NULL,
    PRIMARY KEY CLUSTERED ([Id] ASC)
);

