drop database studenti;
create database if not exists studenti;
use studenti;

 

create table if not exists studente(
matricolaStudente int primary key,
corsoLaurea varchar(50) not null,
nome varchar(30) not null,
cognome varchar(30) not null,
dataNascita date,
codiceFiscale varchar(20) unique,
foto blob default null
);

 

create table if not exists docente(
matricola int primary key,
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
CFU int not null
);

 

create table if not exists esame(
matricolaStudente int references studente(matricolaStudente),
codiceModulo varchar(10) references modulo(codice),
matricolaDocente int references docente(matricolaDocente),
dataEsame date,
voto int,
note varchar(80),
primary key(matricolaStudente,codiceModulo)
);

 

create table if not exists corsoLaurea(
codiceCorso varchar(10) primary key,
nomeCorsoLaurea varchar(30) not null,
descrizione varchar(80)
);

 

create table if not exists dipartimento(
codiceDipartimento varchar(10) primary key,
nomeDipartimento varchar(30) unique
);

 

create table if not exists sede(
codiceSede varchar(10) primary key,
indirizzo varchar(40),
citta varchar(20)
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
values('63453','ICD','Angelo','Marchino','1996-05-02','MNRANG96G02F784K','NULL');

insert into docente(matricola,dipartimento,nome,cognome,dataNascita,codiceFiscale,foto)
values('23456','uniba','riko','softair','1976-06-02','RSNPRF98GFBN76FN','NULL');
insert into docente(matricola,dipartimento,nome,cognome,dataNascita,codiceFiscale,foto)
values('74935','uniba','rana','rigolo','1977-11-23','FGTKJF89HDUJDN8F','NULL');

insert into modulo(codice,nome,descrizione,CFU)
values('54434','BDD','basi di dati','12');
insert into modulo(codice,nome,descrizione,CFU)
values('54366','CN','calcolo numerico','9');

insert into esame(matricolaStudente,codiceModulo,matricolaDocente,dataEsame,voto,note)
values('45343','44323','21323','2020-05-22','19',NULL);
insert into esame(matricolaStudente,codiceModulo,matricolaDocente,dataEsame,voto,note)
values('43366','22323','43232','2020-07-09','23',NULL);

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
values('13434','98765','NULL');
insert into sedeDipartimento(codiceSede,codiceDipartimento,note)
values('15643','45875','NULL');

/* FOREIGN KEY (attributi_locali...) = REFERENCES altra_tabella (attributi_nellaltra_tabella...)*/ 
