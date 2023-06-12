drop database if exists petshop;
create database petshop;
use petshop;

create table clientes (
codigo int auto_increment primary key,
nombre varchar(20) not null,
apellido varchar(20) not null,
cuit int(11),
direccion varchar(20) not null
);


create table alimentos(
codigo int auto_increment primary key,
marca varchar(20),
precio double,
codigocliente int not null,
constraint FK_clientes_codcli
foreign key (codigocliente)
references clientes(codigo)
on delete cascade
);

create table facturas(
letra char(1),
numero int auto_increment primary key,
monto double,
fecha date,
codigocliente int not null,
codigoalimento int not null,
constraint FK_facturas_codcli
foreign key (codigocliente)
references clientes(codigo)
on delete cascade,
constraint FK_alimentos_codalim
foreign key (codigoalimento)
references alimentos(codigo)
on delete cascade
);
