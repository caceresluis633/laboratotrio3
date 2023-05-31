drop database if exists petshop;
create database petshop;
use petshop;
show tables;
describe alimentos;
describe clientes;
describe facturas;
select*from facturas;
select*from clientes;
select*from alimentos;

create table alimentos(
codigo int auto_increment primary key,
marca varchar(20),
precio double
);
create table clientes (
	codigo int auto_increment primary key,
	nombre varchar(20) not null,
	apellido varchar(20) not null,
	cuit 		char(13), 
	direccion 	varchar(50), 
	comentarios varchar(255)
);

create table facturas(
letra char(1),
numero int,
fecha date,
monto double,
codigoalimento integer not null,
codigocliente integer not null,
constraint FK_facturas_codcli
foreign key (codigocliente)
references clientes(codigo)
on delete cascade,
primary key (letra,numero)
);
-- 	Clientes =====================
insert into clientes (codigo,nombre,apellido,cuit,direccion,comentarios) values
	(1,'Nadia','Herrera','1233456','Medrano 123','');
insert into clientes (codigo,nombre,apellido,cuit,direccion,comentarios) values
	(2,'Mariana','Garcia','233333','Lima 222','');
insert into clientes (codigo,nombre,apellido,cuit,direccion,comentarios) values
	(3,'Jose','Mendoza','636363','Peru 650','');
insert into clientes (codigo,nombre,apellido,cuit,direccion,comentarios) values
	(4,'Matias','Moreno','993939','Viel 234','');
insert into clientes (codigo,nombre,apellido,cuit,direccion,comentarios) values
	(5,'Andrea','Moretti','555555','Maipu 345','');
-- Facturas==========================
insert into facturas (letra,numero,fecha,monto,codigoalimento,codigocliente)
 values ('a',10,curdate(),5000,4,1);
insert into facturas (letra,numero,fecha,monto,codigoalimento,codigocliente)
 values ('a',11,curdate(),3000,3,2);
insert into facturas (letra,numero,fecha,monto,codigoalimento,codigocliente)
 values ('a',12,curdate(),7500,2,1);
insert into facturas (letra,numero,fecha,monto,codigoalimento,codigocliente)
 values ('a',13,curdate(),5000,1,1);
insert into facturas (letra,numero,fecha,monto,codigoalimento,codigocliente)
 values ('a',14,curdate(),5000,5,1);
-- Alimentos==========================
insert into alimentos (codigo,marca,precio)
values (1,'royalcanin',1000);
insert into alimentos (codigo,marca,precio)
values (2,'proplan',2000);
insert into alimentos (codigo,marca,precio)
values (3,'dogchow',3000);
insert into alimentos (codigo,marca,precio)
values (4,'catchow',1000);
insert into alimentos (codigo,marca,precio)
values (5,'whiskas',2000);


