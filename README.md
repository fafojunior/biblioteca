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

![](https://github.com/fafojunior/biblioteca/tree/master/Modelo%20L%C3%B3gico/logico.png)

### Dicionário de Dados:
####Usuario:

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
-|-|-|-|
idusuario| PK | PRIMARY KEY (idfunc)
sexo|Validação do domínio. Caracteres permitidos: F, M| CHECK ( sexo IN (‘M’,’F’ ))
cpf|AK|UNIQUE (cpf)
