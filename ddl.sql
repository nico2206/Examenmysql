-- drop database sakila;
create database sakila;
use sakila;

create table pais(
id_pais int primary key,
nombre varchar(50),
ultima_actualizacion timestamp
);
create table ciudad(
id_ciudad int primary key,
nombre varchar(50),
id_pais int,
ultima_actualizacion timestamp,
FOREIGN KEY (id_pais) REFERENCES pais(id_pais)
);

create table direccion (
id_direccion int primary key,
direccion varchar(50),
direccion2 varchar(50),
distrito varchar(20),
id_ciudad int,
codigo_postal varchar(10),
telefono varchar(20),
ultima_actualizacion timestamp,
FOREIGN KEY (id_ciudad) REFERENCES ciudad(id_ciudad)
);

create table idioma(
id_idioma int primary key,
nombre varchar(20),
ultima_actualizacion timestamp
);

create table pelicula(
id_pelicula int primary key,
titulo varchar (50),
descripcion text,
anyo_lanzamiento year,
id_idioma int,
id_idioma_original int,
duracion_alquiler varchar(50),
rental_rate decimal(4,2),
duracion varchar(50),
replacement_cost decimal (5,2),
clasificacion enum("G", "PG", "PG-13", "R", "NC-17"),
caracteristicas_especiales varchar(50),
ultima_actualizacion timestamp,
FOREIGN KEY (id_idioma) REFERENCES idioma(id_idioma),
FOREIGN KEY (id_idioma_original) REFERENCES idioma(id_idioma)
);

create table actor(
id_actor int primary key,
nombre varchar(45),
apellidos varchar(45),
ultima_actualizacion timestamp
);

create table pelicula_actor(
id_actor int,
id_pelicula int,
ultima_actualizacion timestamp,
FOREIGN KEY (id_actor) REFERENCES actor(id_actor),
FOREIGN KEY (id_pelicula) REFERENCES pelicula(id_pelicula)
);
create table categoria(
id_categoria int primary key,
nombre varchar(25),
ultima_actualizacion timestamp
);

create table pelicula_categoria(
id_pelicula int,
id_categoria int,
ultima_actualizacion timestamp,
FOREIGN KEY (id_pelicula) REFERENCES pelicula(id_pelicula),
FOREIGN KEY (id_categoria) REFERENCES categoria(id_categoria)
);

create table almacen(
id_almacen int primary key,
id_empleado_jefe int,
id_direccion int,
ultima_actualizacion timestamp,
FOREIGN KEY (id_direccion) REFERENCES direccion(id_direccion)
);

create table empleado(
id_empleado int primary key,
nombre varchar(50),
apellidos varchar (50),
id_direccion int,
imagen blob,
email varchar(50),
id_almacen int,
activo tinyint(1),
username varchar(16),
password varchar (50),
ultima_actualizacion timestamp,
FOREIGN KEY (id_direccion) REFERENCES direccion(id_direccion),
FOREIGN KEY (id_almacen) REFERENCES almacen(id_almacen)
);

create table inventario (
id_inventario int primary key,
id_pelicula int,
id_almacen int,
ultima_actualizacion timestamp,
FOREIGN KEY (id_pelicula) REFERENCES pelicula(id_pelicula),
FOREIGN KEY (id_almacen) REFERENCES almacen(id_almacen)
);

create table cliente(
id_cliente int primary key,
id_almacen int,
nombre varchar(50),
apellidos varchar(50),
email varchar (50),
id_direccion int,
activo tinyint(1),
fecha_de_creacion datetime,
ultima_actualizacion timestamp,
FOREIGN KEY (id_direccion) REFERENCES direccion(id_direccion),
FOREIGN KEY (id_almacen) REFERENCES almacen(id_almacen)
);
create table alquiler(
id_alquiler int primary key,
fecha_alquiler datetime,
id_inventario int,
id_cliente int,
fecha_devolucion datetime,
id_empleado int,
ultima_actualizacion timestamp,
FOREIGN KEY (id_inventario) REFERENCES inventario(id_inventario),
FOREIGN KEY (id_cliente) REFERENCES cliente(id_cliente),
FOREIGN KEY (id_empleado) REFERENCES empleado(id_empleado)
);

create table pago(
id_pago int primary key,
id_cliente int,
id_empleado int,
id_alquiler int,
total decimal(5,3),
fecha_pago datetime,
ultima_actualizacion timestamp,
FOREIGN KEY (id_alquiler) REFERENCES alquiler(id_alquiler),
FOREIGN KEY (id_cliente) REFERENCES cliente(id_cliente),
FOREIGN KEY (id_empleado) REFERENCES empleado(id_empleado)
);

create table film_text(
film_id int primary key,
title varchar (255),
descripcion text
);



























































