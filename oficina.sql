create database oficina;

use oficina;

-- Criando banco de dados
create table cliente(
clienteid int auto_increment primary key,
primeironome varchar(14) not null,
ultimonome varchar(14) not null,
cpf varchar(11) not null unique
);

create table veiculo(
veiculoid int auto_increment primary key,
clienteid int not null,
modelo varchar(11),
marca varchar(11),
ano int,
foreign key (clienteid) references cliente (clienteid)
);

create table funcionario(
funcionarioid int auto_increment primary key,
primeironome varchar(11) not null,
ultimonome varchar(11) not null,
cpf varchar(11) not null unique,
superiorcpf varchar(11)
);

create table cliente_pagamento(
cliente_pagamentoid int auto_increment primary key,
clienteid int,
pagamento enum ("Pix", "Boleto", "Cartao"),
foreign key (clienteid) references cliente (clienteid)
);

create table pagamento(
pagamentoid int auto_increment primary key,
valor decimal(10,2) not null,
cliente_pagamentoid int not null,
pago date,
condicao enum ("Pago", "Nao pago"),
foreign key (cliente_pagamentoid) references cliente_pagamento (cliente_pagamentoid)
);

create table peca(
pecaid int auto_increment primary key,
marca varchar(14),
tipo varchar(30)
);

create table servico(
servicoid int auto_increment primary key,
veiculoid int not null,
pagamentoid int not null,
comeco date not null,
fim date not null,
foreign key (veiculoid) references veiculo (veiculoid),
foreign key (pagamentoid) references pagamento (pagamentoid)
);

create table servico_funcionario(
servico_funcionarioid int auto_increment primary key,
servicoid int not null,
funcionarioid int not null,
foreign key (servicoid) references servico (servicoid),
foreign key (funcionarioid) references funcionario (funcionarioid)
);

create table servico_peca(
servico_pecaid int auto_increment primary key,
servicoid int not null,
pecaid int not null,
foreign key (servicoid) references servico (servicoid),
foreign key (pecaid) references peca (pecaid)
);

-- Populando o banco de dados
insert into cliente (primeironome, ultimonome, cpf) values
('Carlos','Silva','11111111111'),
('Ana','Souza','22222222222'),
('Bruno','Oliveira','33333333333'),
('Mariana','Lima','44444444444'),
('Pedro','Costa','55555555555'),
('Fernanda','Rocha','66666666666'),
('Lucas','Barbosa','77777777777'),
('Paula','Ribeiro','88888888888'),
('Rafael','Teixeira','99999999999'),
('Juliana','Araujo','10101010101'),
('Diego','Pacheco','12121212121'),
('Camila','Nogueira','13131313131');

insert into veiculo (clienteid, modelo, marca, ano) values
(1,'Civic','Honda',2018),
(1,'Fit','Honda',2016),
(2,'Corolla','Toyota',2020),
(2,'Yaris','Toyota',2019),
(3,'Onix','Chevrolet',2019),
(3,'Tracker','Chevrolet',2021),
(4,'Gol','Volkswagen',2015),
(5,'HB20','Hyundai',2021),
(6,'Ka','Ford',2017),
(6,'EcoSport','Ford',2019),
(7,'Sandero','Renault',2016),
(8,'Cruze','Chevrolet',2018),
(9,'Jetta','Volkswagen',2020),
(9,'Polo','Volkswagen',2019),
(10,'Argo','Fiat',2021),
(11,'Toro','Fiat',2022),
(12,'Compass','Jeep',2020),
(12,'Renegade','Jeep',2019);

insert into funcionario (primeironome, ultimonome, cpf, superiorcpf) values
('Joao','Mendes','90000000001',null),
('Lucas','Ramos','90000000002','90000000001'),
('Rafael','Pereira','90000000003','90000000001'),
('Diego','Alves','90000000004','90000000001'),
('Marcos','Tavares','90000000005','90000000001'),
('Felipe','Nunes','90000000006','90000000001'),
('Andre','Farias','90000000007',null),
('Bruno','Lopes','90000000008','90000000007');

insert into cliente_pagamento (clienteid, pagamento) values
(1,'Pix'),
(1,'Cartao'),
(2,'Cartao'),
(2,'Pix'),
(3,'Boleto'),
(3,'Cartao'),
(4,'Pix'),
(5,'Cartao'),
(5,'Boleto'),
(6,'Pix'),
(6,'Cartao'),
(7,'Pix'),
(8,'Cartao'),
(9,'Boleto'),
(9,'Pix'),
(10,'Cartao'),
(11,'Pix'),
(12,'Cartao');

insert into pagamento (valor, cliente_pagamentoid, pago, condicao) values
(250.00,1,'2026-02-01','Pago'),
(480.00,2,'2026-02-03','Pago'),
(1200.00,3,'2026-02-04','Pago'),
(300.00,4,'2026-02-05','Pago'),
(560.00,5,null,'Nao pago'),
(890.00,6,'2026-02-02','Pago'),
(150.00,7,'2026-02-01','Pago'),
(720.00,8,null,'Nao pago'),
(430.00,9,'2026-02-03','Pago'),
(980.00,10,'2026-02-04','Pago'),
(610.00,11,null,'Nao pago'),
(275.00,12,'2026-02-02','Pago'),
(845.00,13,'2026-02-03','Pago'),
(1320.00,14,null,'Nao pago'),
(390.00,15,'2026-02-04','Pago'),
(560.00,16,'2026-02-05','Pago'),
(210.00,17,'2026-02-02','Pago'),
(970.00,18,null,'Nao pago'),
(450.00,1,'2026-02-06','Pago'),
(780.00,2,null,'Nao pago'),
(660.00,3,'2026-02-06','Pago'),
(510.00,4,'2026-02-07','Pago'),
(340.00,5,'2026-02-06','Pago'),
(910.00,6,null,'Nao pago'),
(275.00,7,'2026-02-07','Pago'),
(640.00,8,'2026-02-06','Pago'),
(1200.00,9,null,'Nao pago'),
(530.00,10,'2026-02-07','Pago'),
(880.00,11,'2026-02-06','Pago'),
(760.00,12,null,'Nao pago');

insert into peca (marca, tipo) values
('Bosch','Filtro de oleo'),
('Fram','Filtro de ar'),
('NGK','Vela de ignicao'),
('TRW','Pastilha de freio'),
('Cofap','Amortecedor'),
('Valeo','Embreagem'),
('SKF','Rolamento'),
('Magneti','Correia dentada'),
('Delphi','Bico injetor'),
('Monroe','Mola suspensao'),
('Continental','Pneu'),
('ACDelco','Bateria'),
('Hella','Lampada farol'),
('Mahle','Radiador'),
('Sachs','Disco de freio'),
('Dayco','Correia alternador'),
('Bosch','Sensor ABS'),
('Pierburg','Bomba de combustivel'),
('ZF','Caixa direcao'),
('Mobensani','Bucha suspensao');

insert into servico (veiculoid, pagamentoid, comeco, fim) values
(1,1,'2026-02-01','2026-02-02'),
(2,2,'2026-02-02','2026-02-03'),
(3,3,'2026-02-03','2026-02-04'),
(4,4,'2026-02-03','2026-02-05'),
(5,5,'2026-02-04','2026-02-05'),
(6,6,'2026-02-05','2026-02-06'),
(7,7,'2026-02-05','2026-02-06'),
(8,8,'2026-02-06','2026-02-07'),
(9,9,'2026-02-06','2026-02-08'),
(10,10,'2026-02-07','2026-02-08'),
(11,11,'2026-02-07','2026-02-09'),
(12,12,'2026-02-08','2026-02-09'),
(13,13,'2026-02-08','2026-02-10'),
(14,14,'2026-02-09','2026-02-10'),
(15,15,'2026-02-09','2026-02-11'),
(16,16,'2026-02-10','2026-02-11'),
(17,17,'2026-02-10','2026-02-12'),
(18,18,'2026-02-11','2026-02-12'),
(3,19,'2026-02-11','2026-02-13'),
(6,20,'2026-02-12','2026-02-13');

insert into servico_funcionario (servicoid, funcionarioid) values
(1,1),(1,2),
(2,2),
(3,3),
(4,2),(4,4),
(5,3),
(6,4),
(7,5),
(8,6),
(9,2),(9,7),
(10,8),
(11,3),
(12,4),
(13,6),(13,1),
(14,7),
(15,2),(15,5),
(16,3),
(17,4),
(18,6),
(19,1),(19,8),
(20,2);

insert into servico_peca (servicoid, pecaid) values
(1,1),(1,2),(1,3),
(2,4),(2,5),
(3,6),(3,7),
(4,8),(4,9),(4,10),
(5,11),
(6,12),(6,13),
(7,14),
(8,15),(8,16),
(9,17),(9,18),(9,19),
(10,20),
(11,1),(11,4),
(12,2),(12,6),
(13,3),(13,7),(13,11),
(14,5),
(15,8),(15,9),
(16,10),
(17,12),(17,14),
(18,15),(18,16),
(19,17),(19,18),(19,20),
(20,1),(20,3);

-- Veiculos por cliente
select concat(primeironome, " ", ultimonome) as nome, count(veiculoid) as carros from cliente join veiculo on cliente.clienteid = veiculo.clienteid group by nome;

-- Funcionarios e seus superiores
select concat(f.primeironome," ", f.ultimonome) as funcionario, concat(d.primeironome," ", d.ultimonome) as superior 
from funcionario f left outer join funcionario d on d.cpf = f.superiorcpf;

-- Quantos servicos cada funcionario prestou
select concat(primeironome, " " , ultimonome) as nome, count(servicoid) as servicos from funcionario natural join servico_funcionario group by nome;

-- Número de funcionários por serviço
select servicoid, count(funcionarioid) as funcionarios from funcionario natural join servico_funcionario group by servicoid;

-- Gasto na oficina por cada cliente
select concat(primeironome, " " , ultimonome) as nome, sum(valor) as gasto
from cliente c join cliente_pagamento cp on c.clienteid = cp.clienteid join pagamento on cp.cliente_pagamentoid = pagamento.cliente_pagamentoid
where condicao = "Pago" group by nome order by gasto desc;

-- Quantas vezes cada tipo de carro passou por um serviço
select concat(modelo, " ", marca) as carro, count(servicoid) as servicos from veiculo natural join servico group by carro;

-- Número de serviços que cada ferramenta foi usada
select concat(marca, " ", tipo) as ferramenta, count(servicoid) as servicos from servico natural join peca group by ferramenta;

-- Ranking dos clientes que mais devem (valor não pago pelos serviços)
select concat(primeironome, " ", ultimonome) as nome, sum(valor) as divida
from cliente c join cliente_pagamento cp on c.clienteid = cp.clienteid join pagamento on cp.cliente_pagamentoid = pagamento.cliente_pagamentoid
where condicao = "Nao pago" group by nome order by divida desc;

-- Número de funcionários diferentes que atendeu serviço de cada cliente
select distinct concat(c.primeironome, " ", c.ultimonome) as nome_cliente, count(concat(f.primeironome, f.ultimonome)) as quantia
from cliente c join veiculo v on c.clienteid = v.clienteid join servico s on v.veiculoid = s.veiculoid join servico_funcionario sf on s.servicoid = sf.servicoid
join funcionario f on sf.funcionarioid = f.funcionarioid group by nome_cliente;

-- Funcionarios que já trabalharam em um serviço com outra pessoa
select  distinct primeironome, ultimonome from funcionario natural join servico_funcionario where servicoid in
(select servicoid
from funcionario natural join servico_funcionario  group by servicoid having count(funcionarioid) > 1)
;

-- Funcionários que só fizeram serviço sozinhos
select concat(primeironome," ", ultimonome) as nome from funcionario where concat(primeironome," ", ultimonome) not in (
select concat(primeironome," ", ultimonome) as nome from funcionario natural join servico_funcionario where servicoid in (
select servicoid from funcionario natural join servico_funcionario  group by servicoid having count(funcionarioid) > 1
) )
;