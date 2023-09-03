-- criação do banco de dados para o cenário do e-commerce

create database Oficina;

use Oficina;

-- criar tabela cliente
create table cliente(
		idcliente int auto_increment primary key,
        PNome varchar(10),
        NMeio char(1),
        UNome varchar(10),
        CPF char(11) not null,
		Rua varchar (50),
        numero varchar (4),
        bairro varchar (10),
        cidade varchar (10),
        UF char (2),
        CEP char (8),
        constraint unique_cpf_cliente unique (CPF)
        );
        
        alter table cliente auto_increment = 1;
 
 -- criar tabela mecânico
create table mecanico(
		idmecanico int auto_increment primary key,
        PNome varchar(10),
        NMeio char(1),
        UNome varchar(10),
        CPF char(11) not null,
		Rua varchar (50),
        numero varchar (4),
        bairro varchar (10),
        cidade varchar (10),
        UF char (2),
        CEP char (8),
        constraint unique_cpf_cliente unique (CPF)
        );
        
        alter table mecanico auto_increment = 1;


-- criar tabela ordem de serviço

create table OrdemServiço(
		idOS int auto_increment primary key, 
        idOSCliente int,
		StatusOS enum ("Cancelado", "Confirmado", "Aguardadno atendimento", "Atendimento finalizado") default "Aguardadno atendimento",
        DescriçãoOS varchar (200),
        CustoFinal float default 10,
        CustoServiço float default 10,
        pagamentoDinheiro bool default false,
        constraint fk_OS_cliente foreign key (idOSCliente) references cliente(idcliente)
				on update cascade
                on delete set null
        );
        
          alter table OrdemServiço auto_increment = 1;
create table pagamento(
		idCliente int,
        idPagamento int,
        Dinhero float,
        limiteDisponivel float,
        TipoPagamento enum ("Boleto", "Cartão", "Dois Cartões"),
        primary key (idCliente, idPagamento)
        );
-- Estoque
create table EstoquedePecas (
		idestoque int auto_increment primary key, 
        quantidade int DEFAULT 0,
		Localestoque varchar (155)
       );
       
         alter table EstoquedePecas auto_increment = 1;
-- Fornecedor
create table Fornecedor(
        idfornecedor int auto_increment primary key,
        RazaoSocial varchar (200) not null,
        NomeFantasia varchar (200) not null,
        CNPJ char (15) not null,
        Contato char (11),
		constraint unique_fornecedor unique (CNPJ)
        );
        
          alter table Fornecedor auto_increment = 1;
-- Vendedor
create table vendedor(
		idvendedor int auto_increment primary key,
        RazaoSocial varchar (200) not null,
        NomeFantasia varchar (200) not null,
        CNPJ char (15),
        CPF char (9),
        Contato char (11),
        Rua varchar (50),
        numero varchar (4),
        bairro varchar (10),
        cidade varchar (10),
        UF char (2),
        CEP char (8),
		constraint unique_cnpj_vendedor unique (CNPJ),
        constraint unique_cpf_vendedor unique (CPF)
        );
          alter table vendedor auto_increment = 1;
        

        
create table OSMecanico(
		idOSMecanico int,
        ParecerTecnico varchar(250),
        primary key (idOSMecanico),
        constraint fk_OS_Mecanico foreign key (idOSMecanico) references OrdemServiço(idOSCliente)
        );
