-- *********************************************
-- * Standard SQL generation                   
-- *--------------------------------------------
-- * DB-MAIN version: 11.0.2              
-- * Generator date: Sep 14 2021              
-- * Generation date: Mon Apr  3 15:10:39 2023 
-- * LUN file: C:\Users\Seb\Downloads\pa-bey.lun 
-- * Schema: db groupe3/SQL 
-- ********************************************* 


-- Database Section
-- ________________ 

create database db groupe3;


-- DBSpace Section
-- _______________


-- Tables Section
-- _____________ 

create table CADRE (
     ID_CAD -- Sequence attribute not implemented -- not null,
     ID_PER numeric(10) not null,
     Type char(1),
     Section char(1) not null,
     constraint ID_ID primary key (ID_CAD),
     constraint FKPER_CAD_ID unique (ID_PER));

create table CLIENT (
     Id_Client char(1) not null,
     Nom char(1) not null,
     Prenom char(1) not null,
     Permission char(1) not null,
     Adr_Ville -- Compound attribute --,
     Adr_Pays char(1) not null,
     Adr_Rue char(1) not null,
     Adr_Numero char(1) not null,
     Adr_Code_Postal char(1),
     constraint ID_CLIENT_ID primary key (Id_Client));

create table Comprend (
     Num_Pan char(1) not null,
     Id_Client char(1) not null,
     License_Key numeric(1) not null,
     constraint ID_Comprend_ID primary key (License_Key, Num_Pan, Id_Client));

create table Crer (
     Num_Pan char(1) not null,
     Id_Client char(1) not null,
     Date char(1) not null,
     C_C_Id_Client char(1) not null,
     constraint FKCre_PAN_ID primary key (Num_Pan, Id_Client));

create table Develope (
     ID_DEV numeric(10) not null,
     License_Key numeric(1) not null,
     constraint ID_Develope_ID primary key (License_Key, ID_DEV));

create table DEVELOPEUR (
     ID_DEV -- Sequence attribute not implemented -- not null,
     ID_PER numeric(10) not null,
     Branche char(1) not null,
     constraint ID_ID primary key (ID_DEV),
     constraint FKPER_DEV_ID unique (ID_PER));

create table ENTITE (
     Danger_Passif char(1) not null,
     Code_entite char(1) not null,
     Vie char(1) not null,
     Nom char(1) not null,
     constraint ID_ENTITE_ID primary key (Code_entite));

create table Entites (
     Code_entite char(1) not null,
     Id_World -- Compound attribute -- not null,
     constraint ID_Entites_ID primary key (Code_entite, Id_World -- Compound attribute --));

create table EXTRA (
     License_Key numeric(1) not null,
     Type_Bonus char(1) not null,
     constraint FKPRO_EXT_ID primary key (License_Key));

create table FACTURE (
     Id_Facture char(1) not null,
     Pos_Num_Pan char(1) not null,
     Pos_Id_Client char(1) not null,
     Date char(1) not null,
     Montant char(1) not null,
     Id_Client char(1) not null,
     constraint ID_FACTURE_ID primary key (Id_Facture),
     constraint FKPossede_ID unique (Pos_Num_Pan, Pos_Id_Client));

create table INVENTAIRE (
     Id_Client char(1) not null,
     Sold char(1) not null,
     constraint FKA_ID primary key (Id_Client));

create table JEUX (
     License_Key numeric(1) not null,
     Version char(1) not null,
     Nom char(1) not null,
     constraint FKPRO_JEU_ID primary key (License_Key));

create table Materiel (
     ID_DEV numeric(10) not null,
     Materiel char(1) not null,
     constraint ID_Materiel_ID primary key (ID_DEV, Materiel));

create table PANIER (
     Num_Pan char(1) not null,
     Id_Client char(1) not null,
     constraint ID_PANIER_ID primary key (Num_Pan, Id_Client));

create table PERSONNEL (
     ID_PER -- Sequence attribute not implemented -- not null,
     Id_Pers char(1) not null,
     Permission char(1) not null,
     Nom char(1) not null,
     Prenom char(1) not null,
     TESTEUR numeric(10),
     DEVELOPEUR numeric(10),
     CADRE numeric(10),
     ID_CAD numeric(10),
     constraint ID_ID primary key (ID_PER));

create table PLAYER (
     Id_Player numeric(1) not null,
     License numeric(1) not null,
     Allowed char not null,
     Id_Client char(1) not null,
     constraint ID_PLAYER_ID primary key (Id_Player));

create table PRODUIT (
     License_Key numeric(1) not null,
     Date date not null,
     Prix char(1) not null,
     Platfrom char(1) not null,
     JEUX numeric(1),
     EXTRA numeric(1),
     Id_Client char(1) not null,
     constraint ID_PRODUIT_ID primary key (License_Key));

create table Test (
     ID_TES numeric(10) not null,
     License_Key numeric(1) not null,
     constraint ID_Test_ID primary key (License_Key, ID_TES));

create table TESTEUR (
     ID_TES -- Sequence attribute not implemented -- not null,
     ID_PER numeric(10) not null,
     Date_Debut char(1),
     Date_Fin char(1),
     Critique char(1) not null,
     constraint ID_ID primary key (ID_TES),
     constraint FKPER_TES_ID unique (ID_PER));

create table TEXTURE (
     ID_TEX -- Sequence attribute not implemented -- not null,
     Code_txt char(1) not null,
     Nom char(1) not null,
     Tipe char(1) not null,
     constraint ID_ID primary key (ID_TEX));

create table Textures (
     ID_TEX numeric(10) not null,
     Id_World -- Compound attribute -- not null,
     constraint ID_Textures_ID primary key (ID_TEX, Id_World -- Compound attribute --));

create table VUE_RECETTE (
     Total_recette_/_Jeux_Vendu numeric(1) not null);

create table With (
     Id_Player numeric(1) not null,
     Date_Crer char(1) not null,
     Id_World -- Compound attribute -- not null,
     License_Key numeric(1) not null,
     constraint FKWit_PLA_ID primary key (Id_Player));

create table WORLD (
     Id_World -- Compound attribute -- not null,
     constraint ID_WORLD_ID primary key (Id_World -- Compound attribute --));


-- Constraints Section
-- ___________________ 

alter table CADRE add constraint ID_CHK
     check(exists(select * from PERSONNEL
                  where PERSONNEL.ID_CAD = ID_CAD)); 

alter table CADRE add constraint FKPER_CAD_FK
     foreign key (ID_PER)
     references PERSONNEL;

alter table CLIENT add constraint ID_CLIENT_CHK
     check(exists(select * from INVENTAIRE
                  where INVENTAIRE.Id_Client = Id_Client)); 

alter table CLIENT add constraint ID_CLIENT_CHK
     check(exists(select * from Crer
                  where Crer.C_C_Id_Client = Id_Client)); 

alter table CLIENT add constraint LSTONE_CLIENT
     check(Adr_Ville is not null or Adr_Code_Postal is not null); 

alter table Comprend add constraint FKCom_PRO
     foreign key (License_Key)
     references PRODUIT;

alter table Comprend add constraint FKCom_PAN_FK
     foreign key (Num_Pan, Id_Client)
     references PANIER;

alter table Crer add constraint FKCre_PAN_FK
     foreign key (Num_Pan, Id_Client)
     references PANIER;

alter table Crer add constraint FKCre_CLI_FK
     foreign key (C_C_Id_Client)
     references CLIENT;

alter table Develope add constraint FKDev_PRO
     foreign key (License_Key)
     references PRODUIT;

alter table Develope add constraint FKDev_DEV_FK
     foreign key (ID_DEV)
     references DEVELOPEUR;

alter table DEVELOPEUR add constraint ID_CHK
     check(exists(select * from Develope
                  where Develope.ID_DEV = ID_DEV)); 

alter table DEVELOPEUR add constraint FKPER_DEV_FK
     foreign key (ID_PER)
     references PERSONNEL;

alter table Entites add constraint FKEnt_WOR_FK
     foreign key (Id_World -- Compound attribute --)
     references WORLD;

alter table Entites add constraint FKEnt_ENT
     foreign key (Code_entite)
     references ENTITE;

alter table EXTRA add constraint FKPRO_EXT_FK
     foreign key (License_Key)
     references PRODUIT;

alter table FACTURE add constraint FKRecoit_FK
     foreign key (Id_Client)
     references CLIENT;

alter table FACTURE add constraint FKPossede_FK
     foreign key (Pos_Num_Pan, Pos_Id_Client)
     references PANIER;

alter table INVENTAIRE add constraint FKA_FK
     foreign key (Id_Client)
     references CLIENT;

alter table JEUX add constraint FKPRO_JEU_CHK
     check(exists(select * from Test
                  where Test.License_Key = License_Key)); 

alter table JEUX add constraint FKPRO_JEU_FK
     foreign key (License_Key)
     references PRODUIT;

alter table Materiel add constraint FKDEV_Mat
     foreign key (ID_DEV)
     references DEVELOPEUR;

alter table PANIER add constraint ID_PANIER_CHK
     check(exists(select * from Crer
                  where Crer.Num_Pan = Num_Pan and Crer.Id_Client = Id_Client)); 

alter table PANIER add constraint ID_PANIER_CHK
     check(exists(select * from FACTURE
                  where FACTURE.Pos_Num_Pan = Num_Pan and FACTURE.Pos_Id_Client = Id_Client)); 

alter table PERSONNEL add constraint LSTONE_PERSONNEL
     check(TESTEUR is not null or DEVELOPEUR is not null or CADRE is not null); 

alter table PERSONNEL add constraint FKDirige_FK
     foreign key (ID_CAD)
     references CADRE;

alter table PLAYER add constraint ID_PLAYER_CHK
     check(exists(select * from With
                  where With.Id_Player = Id_Player)); 

alter table PLAYER add constraint FKA_Compte_FK
     foreign key (Id_Client)
     references CLIENT;

alter table PRODUIT add constraint ID_PRODUIT_CHK
     check(exists(select * from Develope
                  where Develope.License_Key = License_Key)); 

alter table PRODUIT add constraint EXCL_PRODUIT
     check((EXTRA is not null and JEUX is null)
           or (EXTRA is null and JEUX is not null)
           or (EXTRA is null and JEUX is null)); 

alter table PRODUIT add constraint FKListe_FK
     foreign key (Id_Client)
     references INVENTAIRE;

alter table Test add constraint FKTes_JEU
     foreign key (License_Key)
     references JEUX;

alter table Test add constraint FKTes_TES_FK
     foreign key (ID_TES)
     references TESTEUR;

alter table TESTEUR add constraint ID_CHK
     check(exists(select * from Test
                  where Test.ID_TES = ID_TES)); 

alter table TESTEUR add constraint COEX_TESTEUR
     check((Date_Debut is not null and Date_Fin is not null)
           or (Date_Debut is null and Date_Fin is null)); 

alter table TESTEUR add constraint FKPER_TES_FK
     foreign key (ID_PER)
     references PERSONNEL;

alter table Textures add constraint FKTex_WOR_FK
     foreign key (Id_World -- Compound attribute --)
     references WORLD;

alter table Textures add constraint FKTex_TEX
     foreign key (ID_TEX)
     references TEXTURE;

alter table With add constraint FKWit_WOR_FK
     foreign key (Id_World -- Compound attribute --)
     references WORLD;

alter table With add constraint FKWit_PLA_FK
     foreign key (Id_Player)
     references PLAYER;

alter table With add constraint FKWit_JEU_FK
     foreign key (License_Key)
     references JEUX;


-- Index Section
-- _____________ 

create unique index ID_IND
     on CADRE (ID_CAD);

create unique index FKPER_CAD_IND
     on CADRE (ID_PER);

create unique index ID_CLIENT_IND
     on CLIENT (Id_Client);

create unique index ID_Comprend_IND
     on Comprend (License_Key, Num_Pan, Id_Client);

create index FKCom_PAN_IND
     on Comprend (Num_Pan, Id_Client);

create unique index FKCre_PAN_IND
     on Crer (Num_Pan, Id_Client);

create index FKCre_CLI_IND
     on Crer (C_C_Id_Client);

create unique index ID_Develope_IND
     on Develope (License_Key, ID_DEV);

create index FKDev_DEV_IND
     on Develope (ID_DEV);

create unique index ID_IND
     on DEVELOPEUR (ID_DEV);

create unique index FKPER_DEV_IND
     on DEVELOPEUR (ID_PER);

create unique index ID_ENTITE_IND
     on ENTITE (Code_entite);

create unique index ID_Entites_IND
     on Entites (Code_entite, Id_World -- Compound attribute --);

create index FKEnt_WOR_IND
     on Entites (Id_World -- Compound attribute --);

create unique index FKPRO_EXT_IND
     on EXTRA (License_Key);

create unique index ID_FACTURE_IND
     on FACTURE (Id_Facture);

create index FKRecoit_IND
     on FACTURE (Id_Client);

create unique index FKPossede_IND
     on FACTURE (Pos_Num_Pan, Pos_Id_Client);

create unique index FKA_IND
     on INVENTAIRE (Id_Client);

create unique index FKPRO_JEU_IND
     on JEUX (License_Key);

create unique index ID_Materiel_IND
     on Materiel (ID_DEV, Materiel);

create unique index ID_PANIER_IND
     on PANIER (Num_Pan, Id_Client);

create unique index ID_IND
     on PERSONNEL (ID_PER);

create index FKDirige_IND
     on PERSONNEL (ID_CAD);

create unique index ID_PLAYER_IND
     on PLAYER (Id_Player);

create index FKA_Compte_IND
     on PLAYER (Id_Client);

create unique index ID_PRODUIT_IND
     on PRODUIT (License_Key);

create index FKListe_IND
     on PRODUIT (Id_Client);

create unique index ID_Test_IND
     on Test (License_Key, ID_TES);

create index FKTes_TES_IND
     on Test (ID_TES);

create unique index ID_IND
     on TESTEUR (ID_TES);

create unique index FKPER_TES_IND
     on TESTEUR (ID_PER);

create unique index ID_IND
     on TEXTURE (ID_TEX);

create unique index ID_Textures_IND
     on Textures (ID_TEX, Id_World -- Compound attribute --);

create index FKTex_WOR_IND
     on Textures (Id_World -- Compound attribute --);

create index FKWit_WOR_IND
     on With (Id_World -- Compound attribute --);

create unique index FKWit_PLA_IND
     on With (Id_Player);

create index FKWit_JEU_IND
     on With (License_Key);

create unique index ID_WORLD_IND
     on WORLD (Id_World -- Compound attribute --);

