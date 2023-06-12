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