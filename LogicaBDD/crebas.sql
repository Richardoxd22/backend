/*==============================================================*/
/* DBMS name:      Sybase SQL Anywhere 12                       */
/* Created on:     6/12/2022 8:00:31 PM                         */
/*==============================================================*/


if exists(select 1 from sys.sysforeignkey where role='FK_CUENTABP_TIENE_USUARIO') then
    alter table CUENTABP
       delete foreign key FK_CUENTABP_TIENE_USUARIO
end if;

if exists(select 1 from sys.sysforeignkey where role='FK_TRAMITES_GENERA_CUENTABP') then
    alter table TRAMITES
       delete foreign key FK_TRAMITES_GENERA_CUENTABP
end if;

drop index if exists CUENTABP.TIENE_FK;

drop index if exists CUENTABP.CUENTABP_PK;

drop table if exists CUENTABP;

drop index if exists TRAMITES.GENERA_FK;

drop index if exists TRAMITES.TRAMITES_PK;

drop table if exists TRAMITES;

drop index if exists USUARIO.USUARIO_PK;

drop table if exists USUARIO;

/*==============================================================*/
/* Table: CUENTABP                                              */
/*==============================================================*/
create table CUENTABP 
(
   BPCUENTA             char(15)                       not null,
   USUCEDULA            char(10)                       not null,
   BPSALDO              char(10)                       not null,
   constraint PK_CUENTABP primary key (BPCUENTA)
);

/*==============================================================*/
/* Index: CUENTABP_PK                                           */
/*==============================================================*/
create unique index CUENTABP_PK on CUENTABP (
BPCUENTA ASC
);

/*==============================================================*/
/* Index: TIENE_FK                                              */
/*==============================================================*/
create index TIENE_FK on CUENTABP (
USUCEDULA ASC
);

/*==============================================================*/
/* Table: TRAMITES                                              */
/*==============================================================*/
create table TRAMITES 
(
   TRACODIGO            char(20)                       not null,
   BPCUENTA             char(15)                       not null,
   TRARESPALDO          char(20)                       not null,
   constraint PK_TRAMITES primary key (TRACODIGO)
);

/*==============================================================*/
/* Index: TRAMITES_PK                                           */
/*==============================================================*/
create unique index TRAMITES_PK on TRAMITES (
TRACODIGO ASC
);

/*==============================================================*/
/* Index: GENERA_FK                                             */
/*==============================================================*/
create index GENERA_FK on TRAMITES (
BPCUENTA ASC
);

/*==============================================================*/
/* Table: USUARIO                                               */
/*==============================================================*/
create table USUARIO 
(
   USUCEDULA            char(10)                       not null,
   USUNOMBRE            char(30)                       not null,
   USUCELULAR           char(12)                       not null,
   USUCORREO            char(40)                       not null,
   constraint PK_USUARIO primary key (USUCEDULA)
);

/*==============================================================*/
/* Index: USUARIO_PK                                            */
/*==============================================================*/
create unique index USUARIO_PK on USUARIO (
USUCEDULA ASC
);

alter table CUENTABP
   add constraint FK_CUENTABP_TIENE_USUARIO foreign key (USUCEDULA)
      references USUARIO (USUCEDULA)
      on update restrict
      on delete restrict;

alter table TRAMITES
   add constraint FK_TRAMITES_GENERA_CUENTABP foreign key (BPCUENTA)
      references CUENTABP (BPCUENTA)
      on update restrict
      on delete restrict;

