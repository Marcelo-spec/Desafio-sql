/**/

CREATE DATABASE "desafio2_marcelo_perez_123";

\c "desafio2_marcelo_perez_123"

CREATE TABLE IF NOT EXISTS INSCRITOS(cantidad INT, fecha DATE, fuente
VARCHAR);
INSERT INTO INSCRITOS(cantidad, fecha, fuente)
VALUES ( 44, '01/01/2021', 'Blog' );
INSERT INTO INSCRITOS(cantidad, fecha, fuente)
VALUES ( 56, '01/01/2021', 'Página' );
INSERT INTO INSCRITOS(cantidad, fecha, fuente)
VALUES ( 39, '01/02/2021', 'Blog' );
INSERT INTO INSCRITOS(cantidad, fecha, fuente)
VALUES ( 81, '01/02/2021', 'Página' );
INSERT INTO INSCRITOS(cantidad, fecha, fuente)
VALUES ( 12, '01/03/2021', 'Blog' );
INSERT INTO INSCRITOS(cantidad, fecha, fuente)
VALUES ( 91, '01/03/2021', 'Página' );
INSERT INTO INSCRITOS(cantidad, fecha, fuente)
VALUES ( 48, '01/04/2021', 'Blog' );
INSERT INTO INSCRITOS(cantidad, fecha, fuente)
VALUES ( 45, '01/04/2021', 'Página' );
INSERT INTO INSCRITOS(cantidad, fecha, fuente)
VALUES ( 55, '01/05/2021', 'Blog' );
INSERT INTO INSCRITOS(cantidad, fecha, fuente)
VALUES ( 33, '01/05/2021', 'Página' );
INSERT INTO INSCRITOS(cantidad, fecha, fuente)
VALUES ( 18, '01/06/2021', 'Blog' );
INSERT INTO INSCRITOS(cantidad, fecha, fuente)
VALUES ( 12, '01/06/2021', 'Página' );
INSERT INTO INSCRITOS(cantidad, fecha, fuente)
VALUES ( 34, '01/07/2021', 'Blog' );
INSERT INTO INSCRITOS(cantidad, fecha, fuente)
VALUES ( 24, '01/07/2021', 'Página' );
INSERT INTO INSCRITOS(cantidad, fecha, fuente)
VALUES ( 83, '01/08/2021', 'Blog' );
INSERT INTO INSCRITOS(cantidad, fecha, fuente)
VALUES ( 99, '01/08/2021', 'Página' );

/* Consultas: */ 

/* ¿Cuántos registros hay? */

SELECT count(fecha) AS registros FROM INSCRITOS;

/* ¿Cuántos inscritos hay? */
SELECT sum(cantidad) AS cantidad_inscritos FROM inscritos;

/*  ¿Cuál o cuáles son los registros de mayor antiguedad?

HINT: ocupar subconsultas */

SELECT * FROM inscritos WHERE fecha=(SELECT min(fecha) FROM inscritos) ORDER BY fecha;

/*  ¿Cuántos inscritos hay por día? (entendiendo un día como una fecha distinta de
ahora en adelante)*/ 

SELECT sum(cantidad) AS cantidad,fecha FROM inscritos GROUP BY fecha ORDER BY fecha;

/*  ¿Cuántos inscritos hay por fuente? */

SELECT sum(cantidad) AS cantidad,fuente FROM inscritosGROUP BY fuente ORDER BY fuente;

/*  ¿Qué día se inscribieron la mayor cantidad de personas y cuántas personas se
inscribieron en ese día? */

  SELECT fecha, sum(cantidad) FROM inscritos GROUP BY fecha ORDER BY  sum(cantidad) DESC LIMIT 1;

/*  ¿Qué días se inscribieron la mayor cantidad de personas utilizando el blog y cuántas
personas fueron?
HINT: si hay más de un registro, tomar el primero */

SELECT  fecha, cantidad, fuente FROM inscritos WHERE cantidad=(SELECT max(cantidad) FROM inscritos WHERE fuente='Blog') ORDER BY fecha;

/*   ¿Cuántas personas en promedio se inscriben en un día? */

SELECT round(avg(cantidad),2) AS promedio_personas, fecha FROM inscritos group by fecha ORDER BY fecha;

/*  ¿Qué días se inscribieron más de 50 personas? */

SELECT fecha, sum(cantidad) FROM inscritos GROUP BY fecha HAVING sum(cantidad)>50 ORDER BY fecha;

/* ¿Cuántas personas se registraron en promedio cada día a partir del tercer día? 
HINT: ingresa manualmente la fecha del tercer día*/

SELECT round(avg(cantidad),2)AS promedio_personas, fecha FROM inscritos  WHERE fecha >='2021-03-01' GROUP BY fecha ORDER BY fecha;

