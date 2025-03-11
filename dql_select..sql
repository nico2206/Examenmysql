use sakila;

-- Lista los clientes que no han realizado ningún alquiler en el último año.

SELECT C.nombre 
from cliente C
join alquiler A on C.id_cliente = A.id_cliente
where A.id_cliente = NULL ;

-- Encuentra el cliente que ha realizado el alquiler más caro en el último año.
select C.nombre
from cliente C
join alquiler A on C.id_cliente = A.id_cliente
join pago P on A.id_alquiler = P.id_alquiler
order by P.total DESC 
limit 1;

