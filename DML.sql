select*from clientes;
select*from facturas;
select*from alimentos;

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