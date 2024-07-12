CREATE SCHEMA `alke_wallet` DEFAULT CHARACTER SET utf8 ;

use alke_wallet;

create table usuarios(
idEmail varchar(45) not null PRIMARY KEY,
clave varchar(45) not null,
nombreApellido varchar(45) not null,
numerocuenta  int not null,
saldo double not null,
fechaRegistro date not null
);

INSERT INTO `usuarios` (`idEmail`, `clave`,`nombreApellido`, `numeroCuenta`, `saldo`,`fechaRegistro`) VALUES
('joseneipan@ias.cl','123456','Jose Neipan',777015158, 0, '2024-06-20 00:00:00'),
('isaiascarvajal@ias.cl','789100','Isaias Carvajal',22883874, 40300,'2024-06-20 00:00:00');


