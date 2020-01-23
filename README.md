# Instituto Federal da Paraiba - João Pessoa
## Sistemas para Internet - Banco de Dados.
## Projeto: Biblioteca

### Grupo:
- Francisco de Assis Ferreira de Oliveira Junior - 20191370024
- Lucas de Sousa Moreira Gusmão - 20191370007

### introdução:

Sistema bibliotecário em que o usuário é cadastrado com seus dados pessoais (nome, CPF, sexo, telefone e endereço) e assim pode ter acesso a algumas possibilidades. Na biblioteca há uma sala de estudos com acesso virtual em computadores que são disponíveis aos usuários cadastrados, constando o tempo de uso.

Também é possível alugar alguns conteúdos do acervo da biblioteca atráves
 de um funcionário, que pode ser o destaque do mês ou não.

Os itens alugados estão contidos em sessões especificas separadas por gêneros e numerações, e seu aluguel tem o prazo de devolução.

No acervo há duas opções para se alugar: livros e Discos, cada qual com seu título e artista, sendo ambos contendo seu código individual e quantidade em estoque.

Os funcionários também são cadastrados com seus dados pessoais e, além disso, também possuem seu próprio código. Em seu cadastro pedem-se seus dependentes para que possam participar de algum plano disponibilizado pela empresa.

Além de alugar, caso uma peça do acervo esteja indisponível no estoque, o usuário tem também a opção de fazer a reserva para quando o item retornar ficar separado para o próprio.


### Esquema Conceitual:

![](https://github.com/fafojunior/biblioteca/blob/master/Modelo%20Conceitual/er.png)

### Esquema Lógico:

![](https://github.com/fafojunior/biblioteca/blob/master/Modelo%20L%C3%B3gico/logico.png)

### Dicionário de Dados:
#### Usuario:

Atributos | Tipo | Nulo | Descrição | Domínio | PRI | EST | CAN
-----------|------|-------|------------|-----------|-----|-----|------
idusuario | smallint| não | codigo usuário |     | X | | 
nome | varchar(45) | não | nome do usuário | | | |
cpf | varchar(12) | não | cpf do usuário | | || X 
sexo|varchar(1)|não|sexo do usuario|F-feminino M-masculino|||
email|varchar(45)|sim|email do usuario||||
rua|varchar(45)|não|rua do usuario||||
bairro|varchar(45)|não|bairro do usuario||||
cidade|varchar(45)|não|cidade do usuario||||

#### Constraints Usuario:

Coluna | Tipo | Expressão
--------|------|-----------
idusuario| PK | PRIMARY KEY (idusuario)
sexo|Validação do domínio. Caracteres permitidos: F, M| CHECK ( sexo IN (‘M’,’F’ ))
cpf|AK|UNIQUE (cpf)

#### Usa:

Atributos | Tipo | Nulo | Descrição | Domínio | PRI | EST | CAN
-----------|------|-------|------------|-----------|-----|-----|------
idusuario | smallint| não | codigo usuário | |X|X| 
idcomputador | smallint| não | codigo computador ||X|X| 
hora_ent | time | não | hora de entrada do usuario no computador | | | | 
hora_sai | time | não | hora de saída do usuario no computador | | | | 

#### Constraints Usa:

Coluna | Tipo | Expressão
--------|------|-----------
idusuario| PK FK| PRIMARY KEY (idusuario)
idcomputador| PK FK| PRIMARY KEY (idcomputador)

#### Computador:

Atributos | Tipo | Nulo | Descrição | Domínio | PRI | EST | CAN
-----------|------|-------|------------|-----------|-----|-----|------
idcomputador | smallint| não | codigo computador | |X|| 
cod_pc | int| não | codigo tipo de computador | |X||X 

#### Constraints Computador:

Coluna | Tipo | Expressão
--------|------|-----------
idcomputador| PK | PRIMARY KEY (idcomputador)
cod_pc| AK | UNIQUE (idcomputador)

#### Fone:

Atributos | Tipo | Nulo | Descrição | Domínio | PRI | EST | CAN
-----------|------|-------|------------|-----------|-----|-----|------
idusuario | smallint| sim | codigo usuário | |X|X| 
idfuncionario | smallint| sim | codigo funcionario | |X|X| 
numero | int | sim |numero de telefone| ||| 
ddd | int | sim |ddd de telefone| ||| 

#### Constraints Fone:

Coluna | Tipo | Expressão
--------|------|-----------
idusuario| PK FK | PRIMARY KEY (idusuario)
idfuncionario| PK FK| PRIMARY KEY (idfuncionario)

#### Aluga:

Atributos | Tipo | Nulo | Descrição | Domínio | PRI | EST | CAN
-----------|------|-------|------------|-----------|-----|-----|------
idusuario | smallint| não | codigo usuário | |X|X| 
iditem | smallint| não | codigo item | |X|X| 
idfuncionario | smallint| não | codigo funcionario | |X|X| 
data_entrega | date| não | data que alugou ||||
data_devolucao | date| não | data que deve devolver ||||

#### Constraints Aluga:

Coluna | Tipo | Expressão
--------|------|-----------
idusuario| PK FK | PRIMARY KEY (idusuario)
idfuncionario| PK FK| PRIMARY KEY (idfuncionario)
iditem| PK FK| PRIMARY KEY (iditem)

#### Funcionario:

Atributos | Tipo | Nulo | Descrição | Domínio | PRI | EST | CAN
-----------|------|-------|------------|-----------|-----|-----|------
idfuncionario | smallint| não | codigo funcionario |     | X | | 
nome | varchar(45) | não | nome do funcionario | | | |
cpf | varchar(12) | não | cpf do funcionario | | || X 
sexo|varchar(1)|não|sexo do funcionario|F-feminino M-masculino|||
email|varchar(45)|sim|email do funcionario||||
rua|varchar(45)|não|rua do funcionario||||
bairro|varchar(45)|não|bairro do funcionario||||
cidade|varchar(45)|não|cidade do funcionario||||
iddestaque | smallint| não | codigo FK funcionario |     |  | X | 
datad_in | date| não | data de entrada do funcionario como destaque |     |  |  | 
datad_fin | date| não | data de entrada do funcionario como destaque |     |  |  |

#### Constraints Funcionario:

Coluna | Tipo | Expressão
--------|------|-----------
idfuncionario| PK | PRIMARY KEY (idfuncionario)
sexo|Validação do domínio. Caracteres permitidos: F, M| CHECK ( sexo IN (‘M’,’F’ ))
cpf|AK|UNIQUE (cpf)
iddestaque| FK | FOREIGN KEY (idfuncionario)

#### Dependentes:

Atributos | Tipo | Nulo | Descrição | Domínio | PRI | EST | CAN
-----------|------|-------|------------|-----------|-----|-----|------
iddependentes | smallint| não | codigo dependentes |     | X | | 
grau | varchar(45) | não | grau do dependente do funcionario | | | |
nome | varchar(45) | sim | nome do dependente do funcionario | | | |
grau | varchar(45) | não | grau do dependente do funcionario | | | |
idfuncionario | smallint| não | codigo funcionario | | |X| 

#### Constraints Dependentes:

Coluna | Tipo | Expressão
--------|------|-----------
iddependentes| PK | PRIMARY KEY (iddependentes)
idfuncionario| FK | FOREIGN KEY (idfuncionario)

#### Item:

Atributos | Tipo | Nulo | Descrição | Domínio | PRI | EST | CAN
-----------|------|-------|------------|-----------|-----|-----|------
iditem | smallint| não | codigo item |     | X | | 
quantidade | smallint| não | quantidade item |     |  | | 

#### Constraints Item:

Coluna | Tipo | Expressão
--------|------|-----------
iditem| PK | PRIMARY KEY (iditem)

#### Contem:

Atributos | Tipo | Nulo | Descrição | Domínio | PRI | EST | CAN
-----------|------|-------|------------|-----------|-----|-----|------
iditem | smallint| não | codigo item |     | X | X| 
idacervo | smallint| não | codigo acervo |     | X |X | 
idsessão | smallint| não | codigo acervo |     | X |X| 

#### Constraints Contem:

Coluna | Tipo | Expressão
--------|------|-----------
iditem| PK | PRIMARY KEY (iditem)
idacervo| PK| PRIMARY KEY (idacervo)
idsessao| PK | PRIMARY KEY (idsessao)

#### Sessão:

Atributos | Tipo | Nulo | Descrição | Domínio | PRI | EST | CAN
-----------|------|-------|------------|-----------|-----|-----|------
idsessao| smallint| não | codigo sessao |     | X | | 
genero| varchar(45)| não | genero sessao |  |  | | 
codigo| varchar(45)| não | codigo sessao |  |  | | 

#### Constraints Sessao:

Coluna | Tipo | Expressão
--------|------|-----------
idsessao| PK | PRIMARY KEY (idsessao)

#### Acervo:

Atributos | Tipo | Nulo | Descrição | Domínio | PRI | EST | CAN
-----------|------|-------|------------|-----------|-----|-----|------
idacervo|  smallint| não | codigo acervo |  | X | |
codigo| varchar(20)| não | codigo do conteúdo acervo |  |  | |X
titulo| varchar(45)| não | titulo da obra| |  | |
idreserva|smallint| não | codigo reserva |  |  | X | 

#### Constraints Acervo:

Coluna | Tipo | Expressão
--------|------|-----------
idacervo| PK | PRIMARY KEY (idacervo)
idsessao| FK | FOREIGN KEY (idsessao)
codigo | AK| UNIQUE(codigo)

#### Livro:

Atributos | Tipo | Nulo | Descrição | Domínio | PRI | EST | CAN
-----------|------|-------|------------|-----------|-----|-----|------
idacervo|  smallint| não | codigo acervo |  |  | X |
editora|varchar(45)|não|editora livro||||
autor|varchar(45)|não|autor livro||||

#### Constraints Livro:

Coluna | Tipo | Expressão
--------|------|-----------
idacervo| FK | FOREIGN KEY (idacervo) REFERENCES acervo

#### Disco:

Atributos | Tipo | Nulo | Descrição | Domínio | PRI | EST | CAN
-----------|------|-------|------------|-----------|-----|-----|------
idacervo|  smallint| não | codigo acervo |  |  | X |
artista|varchar(45)| não | artista disco |  |  |  |
estilo|varchar(45)|não|estilo disco||||

#### Constraints Disco:

Coluna | Tipo | Expressão
--------|------|-----------
idacervo| FK | FOREIGN KEY (idacervo) REFERENCES acervo

#### Reserva:

Atributos | Tipo | Nulo | Descrição | Domínio | PRI | EST | CAN
-----------|------|-------|------------|-----------|-----|-----|------
idacervo|  smallint| não | codigo acervo |  |  | X |
idusuario | smallint| não | codigo usuário | ||X| 
data_res|date|não|data de recebimento||||

#### Constraints Reserva:

Coluna | Tipo | Expressão
--------|------|-----------
idacervo| FK | FOREIGN KEY (idacervo) REFERENCES acervo
idusuario|FK| FOREIGN KEY (idusuario) REFERENCES usuario
