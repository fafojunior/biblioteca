create table Funcionario(
idfuncionario smallint	NOT NULL,
nome varchar(45) NOT NULL,
cpf varchar(12) NOT NULL,
sexo varchar(1) NOT NULL,
email varchar(45) NULL,
rua varchar(45) NOT NULL,
bairro varchar(45) NOT NULL,
cidade varchar(45) NOT NULL
CONSTRAINT PK_funcionario PRIMARY KEY (idfuncionario),
CONSTRAINT AK_funcionarioo_nome UNIQUE (nome), 
CONSTRAINT CK_funcionario_sexo CHECK ( sexo IN ('M','F' )) ,
CONSTRAINT AK_funcionario_cpf UNIQUE (cpf),
)
