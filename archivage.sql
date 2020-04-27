create database archivage;
use archivage;

create user my_user identified by '1234';
create user my_admin identified by '1234';
create user my_login identified by '1234';


grant all
on archivage.*
to my_admin;

 grant  select,insert,delete,update
 on archivage.*
 to my_user;
 
 show grants;
 show grants for my_admin;
  show grants for my_user;
  select * from mysql.user;
 drop user my_login;
 
/* Table: Archive                                               */
/*==============================================================*/
create table Archive (
   Idarchive            int                  not null,
   Idservice            int                  not null,
   IdUtilisateur        int                  not null,
   Idcategorie          int                  not null,
   Idguichet            int                  not null,
   Nom              varchar(254)                   null,
   Datte                 datetime             null,
   Taille               int                  null,
   constraint PK_ARCHIVE primary key  (Idarchive)
);


/*==============================================================*/
/* Table: Categrie                                              */
/*==============================================================*/
create table Categorie (
   Idcategorie          int                  not null,
   Nom                  varchar(254)         null,
   Typpe                 varchar(254)         null,
   constraint PK_CATEGRIE primary key nonclustered (Idcategorie)
);

/*==============================================================*/
/* Table: Guichet                                               */
/*==============================================================*/
create table Guichet (
   Idguichet            int                  not null,
   Nom                  varchar(254)         null,
   constraint PK_GUICHET primary key nonclustered (Idguichet)
);


/*==============================================================*/
/* Table: Service                                               */
/*==============================================================*/
create table Service (
   Idservice            int                  not null,
   Nom                  varchar(254)         null,
   constraint PK_SERVICE primary key nonclustered (Idservice)
);


/*==============================================================*/
/* Table: Utilisateur                                           */
/*==============================================================*/
create table Utilisateur (
   IdUtilisateur        int                  not null,
   Nom                  varchar(254)         null,
   DateNaissance        varchar(254)         null,
   Adresse              varchar(254)         null,
   constraint PK_UTILISATEUR primary key nonclustered (IdUtilisateur)
);


alter table Archive
   add constraint FK_ARCHIVE_ASSOCIATI_CATEGRIE foreign key (Idcategorie)
      references Categorie (Idcategorie);


alter table Archive
   add constraint FK_ARCHIVE_ASSOCIATI_GUICHET foreign key (Idguichet)
      references Guichet (Idguichet);


alter table Archive
   add constraint FK_ARCHIVE_ASSOCIATI_UTILISAT foreign key (IdUtilisateur)
      references Utilisateur (IdUtilisateur);


alter table Archive
   add constraint FK_ARCHIVE_ASSOCIATI_SERVICE foreign key (Idservice)
      references Service (Idservice);

select * from Archive;
select * from  Guichet ;
select * from Service ;
select * from  Utilisateur;
select * from Categorie;

/* Table: Utilisateur  insert/                                         */
INSERT INTO Utilisateur (IdUtilisateur, Nom, DateNaissance, Adresse) VALUES 

(1,'soukaina',  '1994-02-20 15:45:00' , 'safi'),
(2,'sanae','1990-05-26 08:54:00'  , 'casablanca'),
(3,'ilham','1980-11-02 08:54:00'  , 'marrakech');

select * from  Utilisateur;
/* Table: Utilisateur update                                          */
UPDATE Utilisateur 
SET Nom='maryeme' 
WHERE IdUtilisateur=2;

UPDATE Utilisateur 
SET  DateNaissance='1998-01-15 13:45:00' 
WHERE IdUtilisateur=1;
/* Table: Utilisateur   delete                                        */
DELETE FROM Utilisateur 
WHERE IdUtilisateur = 3;

/* Table: service insert                                        */
INSERT INTO Service (Idservice, Nom) VALUES 

(1,'informatique'),
(2,'source humaine'),
(3,'stock');
select * from  Service;

/* Table: service UPDATE    */
UPDATE Service
SET Nom='reséau informatique ' 
WHERE Idservice=2;

UPDATE Service
SET Nom=' commerce' 
WHERE Idservice=1;
/* Table: service DELETE  */
DELETE FROM Service
WHERE Idservice= 3;



/* Table: Guichet insert     */
INSERT INTO Guichet (Idguichet, Nom) VALUES 
(1,'cdm'),
(2,'cih'),
(3,'BP');
select * from Guichet;

/* Table: Guichet Update    */
UPDATE Guichet
SET Nom='bmce' 
WHERE Idguichet=3;

UPDATE Guichet
SET Nom='twf ' 
WHERE Idguichet=2;

/* Table: Guichet Delete    */
DELETE FROM Guichet
WHERE Idguichet= 3;


/* Table: Categorie insert     */
INSERT INTO Categorie (Idcategorie, Nom,Typpe) VALUES 
(1,'categorie A','speciale'),
(2,'categorie B','extra'),
(3,'categorie D','Type D');
select * from Categorie;

/* Table: Categorie Update   */
UPDATE Categorie
SET Nom='categorie C' 
WHERE Idcategorie=2;

UPDATE Categorie
SET  Typpe='normale' 
WHERE Idcategorie=1;


/* Table: Categorie Delete    */
DELETE FROM Categorie
WHERE Idcategorie= 3;


/* Table: Archive insert     */
INSERT INTO Archive (Idarchive, Idservice, IdUtilisateur,Idcategorie,Idguichet,Nom, Datte,Taille) VALUES 

(1, 1, 1, 1, 1,'malade' , '2007-04-24 12:54:00',200),
(2, 2, 2, 2, 2,'personnelle' , '2007-04-24 12:54:00',200);


select * from Archive;
/* Table: Archive update   */
UPDATE Archive
SET Nom='base de donnée', Taille=300 
WHERE Idarchive=1;

UPDATE Archive
SET  Datte='2010-08-20 11:44:00' 
WHERE IdUtilisateur=2;

/* Table: Archive Delete    */
DELETE FROM Archive 
WHERE Idarchive = 1;

DELETE FROM Archive 
WHERE Idservice = 2;





 drop table Archive;
 DROP TABLE Categorie;
 drop table Guichet;
 drop table Service;
 drop table Utilisateur;

