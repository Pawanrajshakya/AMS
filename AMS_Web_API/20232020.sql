IF OBJECT_ID(N'[__EFMigrationsHistory]') IS NULL
BEGIN
    CREATE TABLE [__EFMigrationsHistory] (
        [MigrationId] nvarchar(150) NOT NULL,
        [ProductVersion] nvarchar(32) NOT NULL,
        CONSTRAINT [PK___EFMigrationsHistory] PRIMARY KEY ([MigrationId])
    );
END;

GO

CREATE TABLE [AccountHistories] (
    [Id] int NOT NULL IDENTITY,
    [AccountNo] nvarchar(max) NULL,
    [ClientId] int NOT NULL,
    [Name] nvarchar(max) NULL,
    [Balance] decimal(18,2) NOT NULL,
    [AccountTypeId] int NOT NULL,
    [IsMain] bit NOT NULL,
    [FirstName] nvarchar(255) NULL,
    [MiddleName] nvarchar(50) NULL,
    [LastName] nvarchar(255) NULL,
    [Phone] nvarchar(12) NULL,
    [Email] nvarchar(55) NULL,
    [Address1] nvarchar(255) NULL,
    [Address2] nvarchar(255) NULL,
    [State] nvarchar(2) NULL,
    [ZipCode] nvarchar(20) NULL,
    [RelationshipId] int NOT NULL,
    [SortId] int NOT NULL,
    [CreatedBy] int NOT NULL,
    [CreatedDate] datetime2 NOT NULL,
    [LastModifiedBy] int NOT NULL,
    [LastModifiedDate] datetime2 NOT NULL,
    [IsVisible] bit NOT NULL,
    [IsActive] bit NOT NULL,
    [RowVersion] varbinary(max) NULL,
    CONSTRAINT [PK_AccountHistories] PRIMARY KEY ([Id])
);

GO

CREATE TABLE [Businesses] (
    [Id] int NOT NULL IDENTITY,
    [CreatedBy] int NOT NULL,
    [CreatedDate] datetime2 NOT NULL,
    [LastModifiedBy] int NOT NULL,
    [LastModifiedDate] datetime2 NOT NULL,
    [IsVisible] bit NOT NULL,
    [IsActive] bit NOT NULL,
    [RowVersion] rowversion NULL,
    [Name] nvarchar(255) NULL,
    [Address1] nvarchar(255) NULL,
    [Address2] nvarchar(255) NULL,
    [State] nvarchar(2) NULL,
    [ZipCode] nvarchar(5) NULL,
    [Description] nvarchar(255) NULL,
    CONSTRAINT [PK_Businesses] PRIMARY KEY ([Id])
);

GO

CREATE TABLE [Groups] (
    [Id] int NOT NULL IDENTITY,
    [CreatedBy] int NOT NULL,
    [CreatedDate] datetime2 NOT NULL,
    [LastModifiedBy] int NOT NULL,
    [LastModifiedDate] datetime2 NOT NULL,
    [IsVisible] bit NOT NULL,
    [IsActive] bit NOT NULL,
    [RowVersion] rowversion NULL,
    [Description] nvarchar(max) NOT NULL,
    [SortId] int NOT NULL,
    CONSTRAINT [PK_Groups] PRIMARY KEY ([Id])
);

GO

CREATE TABLE [Menus] (
    [Id] int NOT NULL IDENTITY,
    [CreatedBy] int NOT NULL,
    [CreatedDate] datetime2 NOT NULL,
    [LastModifiedBy] int NOT NULL,
    [LastModifiedDate] datetime2 NOT NULL,
    [IsVisible] bit NOT NULL,
    [IsActive] bit NOT NULL,
    [RowVersion] rowversion NULL,
    [Title] nvarchar(max) NOT NULL,
    [Link] nvarchar(max) NULL,
    [IconName] nvarchar(max) NULL,
    [MainMenuId] int NOT NULL,
    [SortId] int NOT NULL,
    [UserRoles] nvarchar(max) NULL,
    CONSTRAINT [PK_Menus] PRIMARY KEY ([Id])
);

GO

CREATE TABLE [Relationships] (
    [Id] int NOT NULL IDENTITY,
    [CreatedBy] int NOT NULL,
    [CreatedDate] datetime2 NOT NULL,
    [LastModifiedBy] int NOT NULL,
    [LastModifiedDate] datetime2 NOT NULL,
    [IsVisible] bit NOT NULL,
    [IsActive] bit NOT NULL,
    [RowVersion] rowversion NULL,
    [Description] nvarchar(100) NOT NULL,
    CONSTRAINT [PK_Relationships] PRIMARY KEY ([Id])
);

GO

CREATE TABLE [Roles] (
    [Id] int NOT NULL IDENTITY,
    [CreatedBy] int NOT NULL,
    [CreatedDate] datetime2 NOT NULL,
    [LastModifiedBy] int NOT NULL,
    [LastModifiedDate] datetime2 NOT NULL,
    [IsVisible] bit NOT NULL,
    [IsActive] bit NOT NULL,
    [RowVersion] rowversion NULL,
    [Description] nvarchar(max) NULL,
    CONSTRAINT [PK_Roles] PRIMARY KEY ([Id])
);

GO

CREATE TABLE [UserActivities] (
    [Id] int NOT NULL IDENTITY,
    [UserId] int NOT NULL,
    [DateRequested] datetime2 NOT NULL,
    [ControllerName] nvarchar(max) NULL,
    [ActionName] nvarchar(max) NULL,
    [Comment] nvarchar(max) NULL,
    CONSTRAINT [PK_UserActivities] PRIMARY KEY ([Id])
);

GO

CREATE TABLE [UserHistories] (
    [Id] int NOT NULL IDENTITY,
    [Username] nvarchar(max) NULL,
    [PasswordHash] varbinary(max) NULL,
    [PasswordSalt] varbinary(max) NULL,
    [Name] nvarchar(max) NULL,
    [Phone] nvarchar(max) NULL,
    [Email] nvarchar(max) NULL,
    [UserRole] nvarchar(max) NULL,
    [CreatedBy] int NOT NULL,
    [CreatedDate] datetime2 NOT NULL,
    [LastModifiedBy] int NOT NULL,
    [LastModifiedDate] datetime2 NOT NULL,
    [IsVisible] bit NOT NULL,
    [IsActive] bit NOT NULL,
    [RowVersion] varbinary(max) NULL,
    [PasswordChangedCount] int NOT NULL,
    [LastPasswordChangedOn] datetime2 NOT NULL,
    CONSTRAINT [PK_UserHistories] PRIMARY KEY ([Id])
);

GO

CREATE TABLE [Users] (
    [Id] int NOT NULL IDENTITY,
    [CreatedBy] int NOT NULL,
    [CreatedDate] datetime2 NOT NULL,
    [LastModifiedBy] int NOT NULL,
    [LastModifiedDate] datetime2 NOT NULL,
    [IsVisible] bit NOT NULL,
    [IsActive] bit NOT NULL,
    [RowVersion] rowversion NULL,
    [UserName] nvarchar(max) NULL,
    [PasswordHash] varbinary(max) NULL,
    [PasswordSalt] varbinary(max) NULL,
    [Name] nvarchar(max) NULL,
    [Email] nvarchar(max) NULL,
    [Phone] nvarchar(max) NULL,
    [PasswordChangedCount] int NOT NULL,
    [LastPasswordChangedOn] datetime2 NOT NULL,
    CONSTRAINT [PK_Users] PRIMARY KEY ([Id])
);

GO

CREATE TABLE [Clients] (
    [Id] int NOT NULL IDENTITY,
    [CreatedBy] int NOT NULL,
    [CreatedDate] datetime2 NOT NULL,
    [LastModifiedBy] int NOT NULL,
    [LastModifiedDate] datetime2 NOT NULL,
    [IsVisible] bit NOT NULL,
    [IsActive] bit NOT NULL,
    [RowVersion] rowversion NULL,
    [Name] nvarchar(max) NULL,
    [BusinessId] int NOT NULL,
    CONSTRAINT [PK_Clients] PRIMARY KEY ([Id]),
    CONSTRAINT [FK_Clients_Businesses_BusinessId] FOREIGN KEY ([BusinessId]) REFERENCES [Businesses] ([Id])
);

GO

CREATE TABLE [AccountTypes] (
    [Id] int NOT NULL IDENTITY,
    [CreatedBy] int NOT NULL,
    [CreatedDate] datetime2 NOT NULL,
    [LastModifiedBy] int NOT NULL,
    [LastModifiedDate] datetime2 NOT NULL,
    [IsVisible] bit NOT NULL,
    [IsActive] bit NOT NULL,
    [RowVersion] rowversion NULL,
    [Description] nvarchar(max) NULL,
    [SortId] int NOT NULL,
    [GroupId] int NOT NULL,
    CONSTRAINT [PK_AccountTypes] PRIMARY KEY ([Id]),
    CONSTRAINT [FK_AccountTypes_Groups_GroupId] FOREIGN KEY ([GroupId]) REFERENCES [Groups] ([Id])
);

GO

CREATE TABLE [UserRole] (
    [RoleId] int NOT NULL,
    [UserId] int NOT NULL,
    CONSTRAINT [PK_UserRole] PRIMARY KEY ([UserId], [RoleId]),
    CONSTRAINT [FK_UserRole_Roles_RoleId] FOREIGN KEY ([RoleId]) REFERENCES [Roles] ([Id]),
    CONSTRAINT [FK_UserRole_Users_UserId] FOREIGN KEY ([UserId]) REFERENCES [Users] ([Id])
);

GO

CREATE TABLE [Account] (
    [Id] int NOT NULL IDENTITY,
    [CreatedBy] int NOT NULL,
    [CreatedDate] datetime2 NOT NULL,
    [LastModifiedBy] int NOT NULL,
    [LastModifiedDate] datetime2 NOT NULL,
    [IsVisible] bit NOT NULL,
    [IsActive] bit NOT NULL,
    [RowVersion] rowversion NULL,
    [AccountNo] nvarchar(max) NULL,
    [ClientId] int NOT NULL,
    [Name] nvarchar(max) NULL,
    [Balance] decimal(18,2) NOT NULL,
    [AccountTypeId] int NOT NULL,
    [IsMain] bit NOT NULL,
    [FirstName] nvarchar(255) NULL,
    [MiddleName] nvarchar(50) NULL,
    [LastName] nvarchar(255) NULL,
    [Phone] nvarchar(12) NULL,
    [Email] nvarchar(55) NULL,
    [Address1] nvarchar(255) NULL,
    [Address2] nvarchar(255) NULL,
    [State] nvarchar(2) NULL,
    [ZipCode] nvarchar(20) NULL,
    [RelationshipId] int NOT NULL,
    [SortId] int NOT NULL,
    CONSTRAINT [PK_Account] PRIMARY KEY ([Id]),
    CONSTRAINT [FK_Account_AccountTypes_AccountTypeId] FOREIGN KEY ([AccountTypeId]) REFERENCES [AccountTypes] ([Id]),
    CONSTRAINT [FK_Account_Clients_ClientId] FOREIGN KEY ([ClientId]) REFERENCES [Clients] ([Id]),
    CONSTRAINT [FK_Account_Relationships_RelationshipId] FOREIGN KEY ([RelationshipId]) REFERENCES [Relationships] ([Id])
);

GO

CREATE TABLE [TransactionTypes] (
    [Id] int NOT NULL IDENTITY,
    [CreatedBy] int NOT NULL,
    [CreatedDate] datetime2 NOT NULL,
    [LastModifiedBy] int NOT NULL,
    [LastModifiedDate] datetime2 NOT NULL,
    [IsVisible] bit NOT NULL,
    [IsActive] bit NOT NULL,
    [RowVersion] rowversion NULL,
    [Description] nvarchar(max) NULL,
    [AccountId] int NOT NULL,
    CONSTRAINT [PK_TransactionTypes] PRIMARY KEY ([Id]),
    CONSTRAINT [FK_TransactionTypes_Account_AccountId] FOREIGN KEY ([AccountId]) REFERENCES [Account] ([Id])
);

GO

CREATE TABLE [Transactions] (
    [Id] int NOT NULL IDENTITY,
    [CreatedBy] int NOT NULL,
    [CreatedDate] datetime2 NOT NULL,
    [LastModifiedBy] int NOT NULL,
    [LastModifiedDate] datetime2 NOT NULL,
    [IsVisible] bit NOT NULL,
    [IsActive] bit NOT NULL,
    [RowVersion] rowversion NULL,
    [TransactionDate] datetime2 NOT NULL,
    [Amount] decimal(18,2) NOT NULL,
    [Description1] nvarchar(255) NULL,
    [Description2] nvarchar(255) NULL,
    [TransactionTypeId] int NOT NULL,
    [AccountId] int NOT NULL,
    CONSTRAINT [PK_Transactions] PRIMARY KEY ([Id]),
    CONSTRAINT [FK_Transactions_Account_AccountId] FOREIGN KEY ([AccountId]) REFERENCES [Account] ([Id]),
    CONSTRAINT [FK_Transactions_TransactionTypes_TransactionTypeId] FOREIGN KEY ([TransactionTypeId]) REFERENCES [TransactionTypes] ([Id])
);

GO

IF EXISTS (SELECT * FROM [sys].[identity_columns] WHERE [name] IN (N'Id', N'Address1', N'Address2', N'CreatedBy', N'CreatedDate', N'Description', N'IsActive', N'IsVisible', N'LastModifiedBy', N'LastModifiedDate', N'Name', N'State', N'ZipCode') AND [object_id] = OBJECT_ID(N'[Businesses]'))
    SET IDENTITY_INSERT [Businesses] ON;
INSERT INTO [Businesses] ([Id], [Address1], [Address2], [CreatedBy], [CreatedDate], [Description], [IsActive], [IsVisible], [LastModifiedBy], [LastModifiedDate], [Name], [State], [ZipCode])
VALUES (1, N'Address 1', N'Address 2', 0, '2020-07-23T10:42:23.9059519-04:00', NULL, CAST(1 AS bit), CAST(1 AS bit), 0, '2020-07-23T10:42:23.9059542-04:00', N'Business Name', N'zz', N'zzzzz');
IF EXISTS (SELECT * FROM [sys].[identity_columns] WHERE [name] IN (N'Id', N'Address1', N'Address2', N'CreatedBy', N'CreatedDate', N'Description', N'IsActive', N'IsVisible', N'LastModifiedBy', N'LastModifiedDate', N'Name', N'State', N'ZipCode') AND [object_id] = OBJECT_ID(N'[Businesses]'))
    SET IDENTITY_INSERT [Businesses] OFF;

GO

IF EXISTS (SELECT * FROM [sys].[identity_columns] WHERE [name] IN (N'Id', N'CreatedBy', N'CreatedDate', N'Description', N'IsActive', N'IsVisible', N'LastModifiedBy', N'LastModifiedDate', N'SortId') AND [object_id] = OBJECT_ID(N'[Groups]'))
    SET IDENTITY_INSERT [Groups] ON;
INSERT INTO [Groups] ([Id], [CreatedBy], [CreatedDate], [Description], [IsActive], [IsVisible], [LastModifiedBy], [LastModifiedDate], [SortId])
VALUES (1, 0, '2020-07-23T10:42:23.9061644-04:00', N'New Group', CAST(1 AS bit), CAST(1 AS bit), 0, '2020-07-23T10:42:23.9061663-04:00', 0);
IF EXISTS (SELECT * FROM [sys].[identity_columns] WHERE [name] IN (N'Id', N'CreatedBy', N'CreatedDate', N'Description', N'IsActive', N'IsVisible', N'LastModifiedBy', N'LastModifiedDate', N'SortId') AND [object_id] = OBJECT_ID(N'[Groups]'))
    SET IDENTITY_INSERT [Groups] OFF;

GO

IF EXISTS (SELECT * FROM [sys].[identity_columns] WHERE [name] IN (N'Id', N'CreatedBy', N'CreatedDate', N'IconName', N'IsActive', N'IsVisible', N'LastModifiedBy', N'LastModifiedDate', N'Link', N'MainMenuId', N'SortId', N'Title', N'UserRoles') AND [object_id] = OBJECT_ID(N'[Menus]'))
    SET IDENTITY_INSERT [Menus] ON;
INSERT INTO [Menus] ([Id], [CreatedBy], [CreatedDate], [IconName], [IsActive], [IsVisible], [LastModifiedBy], [LastModifiedDate], [Link], [MainMenuId], [SortId], [Title], [UserRoles])
VALUES (1, 0, '2020-07-23T10:42:23.9062525-04:00', NULL, CAST(1 AS bit), CAST(1 AS bit), 0, '2020-07-23T10:42:23.9062544-04:00', N'home', 0, 1, N'Home', N'1,2,3'),
(2, 0, '2020-07-23T10:42:23.9063879-04:00', NULL, CAST(1 AS bit), CAST(1 AS bit), 0, '2020-07-23T10:42:23.9063895-04:00', N'account', 0, 2, N'Account', N'1,2,3'),
(3, 0, '2020-07-23T10:42:23.9063948-04:00', NULL, CAST(1 AS bit), CAST(1 AS bit), 0, '2020-07-23T10:42:23.9063952-04:00', N'transaction', 0, 3, N'Transaction', N'1,2,3'),
(4, 0, '2020-07-23T10:42:23.9064014-04:00', NULL, CAST(1 AS bit), CAST(1 AS bit), 0, '2020-07-23T10:42:23.9064018-04:00', N'report', 0, 4, N'Reports', N'1,2,3'),
(5, 0, '2020-07-23T10:42:23.9064023-04:00', NULL, CAST(1 AS bit), CAST(1 AS bit), 0, '2020-07-23T10:42:23.9064026-04:00', N'code', 0, 5, N'Code System', N'1,2,3'),
(6, 0, '2020-07-23T10:42:23.9064030-04:00', NULL, CAST(1 AS bit), CAST(1 AS bit), 0, '2020-07-23T10:42:23.9064034-04:00', N'setting', 0, 6, N'Setting', N'1,2,3'),
(7, 0, '2020-07-23T10:42:23.9064038-04:00', NULL, CAST(1 AS bit), CAST(1 AS bit), 0, '2020-07-23T10:42:23.9064041-04:00', N'tool', 0, 7, N'Tools', N'1,2,3'),
(8, 0, '2020-07-23T10:42:23.9064045-04:00', NULL, CAST(1 AS bit), CAST(1 AS bit), 0, '2020-07-23T10:42:23.9064048-04:00', N'menu', 5, 1, N'Menu', N'1,2,3'),
(9, 0, '2020-07-23T10:42:23.9064052-04:00', NULL, CAST(1 AS bit), CAST(1 AS bit), 0, '2020-07-23T10:42:23.9064055-04:00', N'role', 6, 1, N'Role', N'1,2,3'),
(10, 0, '2020-07-23T10:42:23.9064059-04:00', NULL, CAST(1 AS bit), CAST(1 AS bit), 0, '2020-07-23T10:42:23.9064062-04:00', N'yser', 6, 2, N'User', N'1,2,3');
IF EXISTS (SELECT * FROM [sys].[identity_columns] WHERE [name] IN (N'Id', N'CreatedBy', N'CreatedDate', N'IconName', N'IsActive', N'IsVisible', N'LastModifiedBy', N'LastModifiedDate', N'Link', N'MainMenuId', N'SortId', N'Title', N'UserRoles') AND [object_id] = OBJECT_ID(N'[Menus]'))
    SET IDENTITY_INSERT [Menus] OFF;

GO

IF EXISTS (SELECT * FROM [sys].[identity_columns] WHERE [name] IN (N'Id', N'CreatedBy', N'CreatedDate', N'Description', N'IsActive', N'IsVisible', N'LastModifiedBy', N'LastModifiedDate') AND [object_id] = OBJECT_ID(N'[Roles]'))
    SET IDENTITY_INSERT [Roles] ON;
INSERT INTO [Roles] ([Id], [CreatedBy], [CreatedDate], [Description], [IsActive], [IsVisible], [LastModifiedBy], [LastModifiedDate])
VALUES (1, 0, '2020-07-23T10:42:23.9020441-04:00', N'Admin', CAST(1 AS bit), CAST(1 AS bit), 0, '2020-07-23T10:42:23.9045794-04:00'),
(2, 0, '2020-07-23T10:42:23.9048121-04:00', N'User', CAST(1 AS bit), CAST(1 AS bit), 0, '2020-07-23T10:42:23.9048155-04:00'),
(3, 0, '2020-07-23T10:42:23.9048215-04:00', N'Viewer', CAST(1 AS bit), CAST(1 AS bit), 0, '2020-07-23T10:42:23.9048219-04:00');
IF EXISTS (SELECT * FROM [sys].[identity_columns] WHERE [name] IN (N'Id', N'CreatedBy', N'CreatedDate', N'Description', N'IsActive', N'IsVisible', N'LastModifiedBy', N'LastModifiedDate') AND [object_id] = OBJECT_ID(N'[Roles]'))
    SET IDENTITY_INSERT [Roles] OFF;

GO

CREATE INDEX [IX_Account_AccountTypeId] ON [Account] ([AccountTypeId]);

GO

CREATE INDEX [IX_Account_ClientId] ON [Account] ([ClientId]);

GO

CREATE INDEX [IX_Account_RelationshipId] ON [Account] ([RelationshipId]);

GO

CREATE INDEX [IX_AccountTypes_GroupId] ON [AccountTypes] ([GroupId]);

GO

CREATE INDEX [IX_Clients_BusinessId] ON [Clients] ([BusinessId]);

GO

CREATE INDEX [IX_Transactions_AccountId] ON [Transactions] ([AccountId]);

GO

CREATE INDEX [IX_Transactions_TransactionTypeId] ON [Transactions] ([TransactionTypeId]);

GO

CREATE INDEX [IX_TransactionTypes_AccountId] ON [TransactionTypes] ([AccountId]);

GO

CREATE INDEX [IX_UserRole_RoleId] ON [UserRole] ([RoleId]);

GO

INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
VALUES (N'20200723144224_InitalCreateDB_07232020', N'3.1.2');

GO


