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


describe clientes;


insert into clientes (codigo,nombre,apellido,cuit,direccion) values
	(1,'Nadia','Herrera','1233456','Medrano 123');
insert into clientes (codigo,nombre,apellido,cuit,direccion) values
	(2,'Mariana','Garcia','233333','Lima 222');
insert into clientes (codigo,nombre,apellido,cuit,direccion) values
	(3,'Jose','Mendoza','636363','Peru 650');
insert into clientes (codigo,nombre,apellido,cuit,direccion) values
	(4,'Matias','Moreno','993939','Viel 234');
insert into clientes (codigo,nombre,apellido,cuit,direccion) values
	(5,'Andrea','Moretti','555555','Maipu 345');

describe alimentos;

insert into alimentos (codigo,marca,precio,codigocliente)
values (1,'royalcanin',1000,1);
insert into alimentos (codigo,marca,precio,codigocliente)
values (2,'proplan',2000,2);
insert into alimentos (codigo,marca,precio,codigocliente)
values (3,'dogchow',3000,3);
insert into alimentos (codigo,marca,precio,codigocliente)
values (4,'catchow',1000,1);
insert into alimentos (codigo,marca,precio,codigocliente)
values (5,'whiskas',2000,2);

describe facturas;

insert into facturas (letra,numero,fecha,monto,codigocliente,codigoalimento)
 values ('a',10,curdate(),5000,4,1);
insert into facturas (letra,numero,fecha,monto,codigocliente,codigoalimento)
 values ('a',11,curdate(),3000,3,2);
insert into facturas (letra,numero,fecha,monto,codigocliente,codigoalimento)
 values ('a',12,curdate(),7500,2,1);
insert into facturas (letra,numero,fecha,monto,codigocliente,codigoalimento)
 values ('a',13,curdate(),5000,1,1);
insert into facturas (letra,numero,fecha,monto,codigocliente,codigoalimento)
 values ('a',14,curdate(),5000,5,1);



-- A Informar la lista de alimentos vendidos el día de hoy.
select a.codigo, a.marca, a.precio, f.fecha
	from facturas f join alimentos a on f.codigocliente=a.codigo
    join clientes c on c.codigo=a.codigo
    where fecha=curdate();
    
-- B Informar quienes (nombre,apellido) compraron alimentos'proplan'.
select c.nombre, c.apellido, a.marca
	from clientes c join alimentos a on c.codigo=a.codigo
    where a.marca like '%pro%';
    
-- C Informar la lista de alimentos mas vendidos en este mes.
select  f.numero, f.fecha, f.monto, a.marca
	from facturas f join alimentos a on f.codigocliente=a.codigo	
    where month(fecha)=month(curdate())
	and year(fecha)=year(curdate());

-- D Informar que alimentos compro 'Andrea Moretti'.
select c.codigo, c.nombre,c.apellido, a.marca
	from clientes c join facturas f on c.codigo=f.codigoCliente
	join alimentos a on f.codigocliente=a.codigo 
	where c.nombre='andrea' and c.apellido='moretti';
    
-- E Informar la suma de los montos de cada cliente (código,nombre,apellido,total comprado)
select c.codigo, c.nombre, c.apellido, sum(a.precio) total 
	from clientes c join facturas f on c.codigo=f.codigoCliente
    join alimentos a on f.codigocliente=a.codigo group by c.codigo;


