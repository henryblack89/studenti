drop database studenti;
create database if not exists studenti;
use studenti;

 

create table if not exists studente(
matricolaStudente int primary key unique,
corsoLaurea varchar(50) not null,
nome varchar(30) not null,
cognome varchar(30) not null,
dataNascita date not null,
codiceFiscale varchar(20) unique,
foto blob default null
);

 

create table if not exists docente(
matricola int primary key unique,
dipartimento varchar(50) not null,
nome varchar(30) not null,
cognome varchar(30) not null,
dataNascita date,
codiceFiscale varchar(20) unique,
foto blob default null
);

 

create table if not exists modulo(
codice varchar(10) primary key,
nome varchar(30) not null,
descrizione varchar(80),
CFU int not null,check(cfu>0)
);

 

create table if not exists esame(
matricolaStudente int check (matricolaStudente > 0),
codiceModulo varchar(10),
matricolaDocente int check (matricolaDocente > 0),
dataEsame date not null,
voto int check (voto >=18 AND voto <=30) not null,
note varchar(80),
primary key(matricolaStudente,codiceModulo),
foreign key (matricolaStudente) references studente(matricolaStudente),
foreign key (matricolaDocente) references docente(matricola),
foreign key (codiceModulo) references modulo(codice)
);

 

create table if not exists corsoLaurea(
codiceCorso varchar(10) primary key,
nomeCorsoLaurea varchar(30) unique,
descrizione varchar(80)
);

 

create table if not exists dipartimento(
codiceDipartimento varchar(10) primary key,
nomeDipartimento varchar(30) unique
);

 

create table if not exists sede(
codiceSede varchar(10) primary key,
indirizzo varchar(40) not null,
citta varchar(20) not null
);

 

create table if not exists sedeDipartimento(
codiceSede varchar(10) references sede(codiceSede),
codiceDipartimento varchar(10) references dipartimento(codiceDipartimento),
note varchar(80),
primary key(codiceSede,codiceDipartimento)
);


insert into studente(matricolaStudente,corsoLaurea,nome,cognome,dataNascita,codiceFiscale,foto)
values('704202','ICD','Amedeo','Procino','1998-08-09','PRCMDA98M09G712L','NULL');
insert into studente(matricolaStudente,corsoLaurea,nome,cognome,dataNascita,codiceFiscale,foto)
values('634539','ICD','Angelo','Marchino','1996-05-02','MNRANG96G02F784K','NULL');

insert into docente(matricola,dipartimento,nome,cognome,dataNascita,codiceFiscale,foto)
values('23456','uniba','riko','softair','1976-06-02','RSNPRF98GFBN76FN','NULL');
insert into docente(matricola,dipartimento,nome,cognome,dataNascita,codiceFiscale,foto)
values('74935','uniba','rana','rigolo','1977-11-23','FGTKJF89HDUJDN8F','NULL');

insert into modulo(codice,nome,descrizione,CFU)
values('54434','BDD','basi di dati','12');
insert into modulo(codice,nome,descrizione,CFU)
values('54366','CN','calcolo numerico','9');

insert into esame(matricolaStudente,codiceModulo,matricolaDocente,dataEsame,voto,note)
values('704202','54434','23456','2020-05-22','19',NULL);
insert into esame(matricolaStudente,codiceModulo,matricolaDocente,dataEsame,voto,note)
values('634539','54366','74935','2020-07-09','23',NULL);

insert into corsoLaurea(codiceCorso,nomeCorsoLaurea,descrizione)
values ('74366','ICD','informatica');
insert into corsoLaurea(codiceCorso,nomeCorsoLaurea,descrizione)
values ('75243','IIC','ingegneria');

insert into dipartimento(codiceDipartimento,nomeDipartimento)
values ('23333','biologia');
insert into dipartimento(codiceDipartimento,nomeDipartimento)
values ('43443','chimica');

insert into sede(codiceSede,indirizzo,citta)
values('11111','via rinko','Bologna');
insert into sede(codiceSede,indirizzo,citta)
values('12222','via alcide','Bari');

insert into sedeDipartimento(codiceSede,codiceDipartimento,note)
values('11111','23333','NULL');
insert into sedeDipartimento(codiceSede,codiceDipartimento,note)
values('15643','45875','NULL');

/* FOREIGN KEY (attributi_locali...) = REFERENCES altra_tabella (attributi_nellaltra_tabella...)*/ 
