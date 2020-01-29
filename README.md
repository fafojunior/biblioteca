# Instituto Federal da Paraiba - João Pessoa
## Sistemas para Internet - Banco de Dados.
## Projeto: Biblioteca

### Grupo:
- Francisco de Assis Ferreira de Oliveira Junior - 20191370024
- Lucas de Sousa Moreira Gusmão - 20191370007

### introdução:

Sistema bibliotecário em que o usuário é cadastrado com seus dados pessoais (nome, CPF, sexo, e-mail, telefone, endereço, estado civil) podendo assim ter acesso aos serviços da biblioteca. Na biblioteca há uma sala de estudos com acesso virtual em computadores que são disponibilizados aos usuários cadastrados.

Também sendo possível alugar itens do acervo da biblioteca por mediação de um dos funcionários.

Os itens alugados ficam em sessões especificas separadas por nome e numeração, juntamente com o prazo de devolução.

No acervo há duas opções para se alugar: livros e Discos, cada um com seu título e artista, ambos contendo seus códigos individuais.

Os funcionários também são cadastrados no sistema, juntamente de seus dependentes para que os familiares do funcionário também possam participar de algum dos planos disponibilizados pela empresa.

Caso um item do acervo esteja indisponível no estoque, o usuário tem também a opção de fazer a reserva para quando o item retornar ficar separado para o próprio.


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
municipio|varchar(45)|não|municipio do usuario||||
estado|varchar(45)|não|estado do usuario||||
idmatrimonio|smallint|sim|codigo matrimonio||||
casado|varchar(1)|não|usuario casado ou não|S-sim N-não|||
nome_matrimonio|varchar(45)|sim|nome do cônjuge||||

#### Constraints Usuario:

Coluna | Tipo | Expressão
--------|------|-----------
idusuario| PK | PRIMARY KEY (idusuario)
sexo|Validação do domínio. Caracteres permitidos: F, M| CHECK ( sexo IN (‘M’,’F’ ))
cpf|AK|UNIQUE (cpf)
idmatrimonio|FK| FOREIGN KEY (idmatrimonio) REFERENCES usuario
idmatrimonio|AK| UNIQUE (idmatrimonio)
casado|Validação do domínio. Caracteres permitidos: S, N| CHECK (casado IN ('S', 'N'))

#### Usa:

Atributos | Tipo | Nulo | Descrição | Domínio | PRI | EST | CAN
-----------|------|-------|------------|-----------|-----|-----|------
idusuario | smallint| não | codigo usuário | ||X| 
idcomputador | smallint| não | codigo computador |||X| 
hora_ent | time | não | hora de entrada do usuario no computador | | | | 
hora_sai | time | não | hora de saída do usuario no computador | | | | 

#### Constraints Usa:

Coluna | Tipo | Expressão
--------|------|-----------
idusuario| FK| FOREIGN KEY (idusuario) REFERENCES usuario
idcomputador| FK| FOREIGN KEY (idcomputador) REFERENCES computador
idusuario, idcomputador | PK | PRIMARY KEY (idusuario, idcomputador)

#### Computador:

Atributos | Tipo | Nulo | Descrição | Domínio | PRI | EST | CAN
-----------|------|-------|------------|-----------|-----|-----|------
idcomputador | smallint| não | codigo computador | |X|| 
cod_pc | int| não | codigo tipo de computador | |||X 

#### Constraints Computador:

Coluna | Tipo | Expressão
--------|------|-----------
idcomputador| PK | PRIMARY KEY (idcomputador)
cod_pc| AK | UNIQUE (idcomputador)

#### Fone:

Atributos | Tipo | Nulo | Descrição | Domínio | PRI | EST | CAN
-----------|------|-------|------------|-----------|-----|-----|------
idusuario | smallint| sim | codigo usuário | ||X| 
numero | int | sim |numero de telefone| ||| 
ddd | int | sim |ddd de telefone| ||| 

#### Constraints Fone:

Coluna | Tipo | Expressão
--------|------|-----------
idusuario| FK | FOREIGN KEY (idusuario) REFERENCES usuario
idusuario| PK| PRIMARY KEY (idusuario)

#### Aluga:

Atributos | Tipo | Nulo | Descrição | Domínio | PRI | EST | CAN
-----------|------|-------|------------|-----------|-----|-----|------
idusuario | smallint| não | codigo usuário | ||X| 
iditem | smallint| não | codigo item | ||X| 
idfuncionario | smallint| não | codigo funcionario | ||X| 
data_entrega | date| não | data que alugou ||||
data_devolucao | date| não | data que deve devolver ||||

#### Constraints Aluga:

Coluna | Tipo | Expressão
--------|------|-----------
idusuario| FK | FOREIGN KEY (idusuario) REFERENCES usuario
idfuncionario| FK| FOREIGN KEY (idfuncionario) REFERENCES funcionario
iditem| FK| FOREIGN KEY (iditem) REFERENCES item
idusuario, iditem| PK | PRIMARY KEY (idusuario, iditem)

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
municipio|varchar(45)|não|municipio do funcionario||||
estado|varchar(45)|não|estado do funcionario||||

#### Constraints Funcionario:

Coluna | Tipo | Expressão
--------|------|-----------
idfuncionario| PK | PRIMARY KEY (idfuncionario)
sexo|Validação do domínio. Caracteres permitidos: F, M| CHECK ( sexo IN (‘M’,’F’ ))
cpf|AK|UNIQUE (cpf)

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
iditem | smallint| não | codigo item |     |  | X| 
idacervo | smallint| não | codigo acervo |     |  |X | 
idsessão | smallint| não | codigo acervo |     |  |X| 

#### Constraints Contem:

Coluna | Tipo | Expressão
--------|------|-----------
iditem| FK | FOREIGN KEY (iditem) REFERENCES item
idacervo| FK| FOREIGN KEY (idacervo) REFERENCES acervo
idsessao| FK | FOREIGN KEY (idsessao) REFERENCES sessao
iditem, idsessao, idacervo| PK | PRIMARY KEY(iditem, idsessao, idacervo)

#### Sessão:

Atributos | Tipo | Nulo | Descrição | Domínio | PRI | EST | CAN
-----------|------|-------|------------|-----------|-----|-----|------
idsessao| smallint| não | codigo sessao |     | X | | 
genero| varchar(45)| não | genero sessao |  |  | | 
codigo| varchar(45)| não | codigo sessao |  |  | | X

#### Constraints Sessao:

Coluna | Tipo | Expressão
--------|------|-----------
idsessao| PK | PRIMARY KEY (idsessao)
codigo| AK | UNIQUE (codigo)

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
idacervo| PK | PRIMARY KEY (idacervo)

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
idacervo| PK | PRIMARY KEY (idacervo)

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
idacervo, idusuario| PK | PRIMARY KEY (idacervo, idusuario)
