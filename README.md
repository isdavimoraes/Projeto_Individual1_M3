<h1>Sistema ResiliaData</h1>
> Status: Completo ✅

# Conteúdo dos arquivos:
* Arquivo SQL
* Fotos e arquivos dos diagramas
* readme e diagramas em arquivo txt

# Caso Ficticio:

### Você foi contratado para desenvolver um banco de dados que irá armazenar dados importantes que será utilizado pelo sistema RESILIADATA. <br/>➔ O sistema irá auxiliar na avaliação de quais são as tecnologias que as empresas parceiras estão utilizando e quais ajustes são necessários nas stacks dos cursos. <br/>➔ Vamos ter um cadastro de empresa parceira, um cadastro de tecnologias com a opção de selecionar a área (webdev, dados, marketing, etc.) e uma tabela para registrar quais tecnologias as empresas estão utilizando. 

# Questionamentos:

## Existem outras entidades além dessas?<br/>
#### Não existe outras entidades, mas para um melhorias deveria possuir mais entidades.<br/>
### Sugestão de melhorias:<br/>
#### Para uma melhoria acredito que deveríamos criar novas entidades para o banco de dados onde irá armazenar informações que podem ser importantes para nossa pesquisa. Irei dar um exemplo abaixo de como ficaria, mas antes disso gostaria de pontuar que, com essa melhoria seremos capazes de saber quais curso estão tendo mais demandas no momento e quais tecnologias estão sendo utilizada e também com isso podemos até chegar a quantas pessoas estão sendo formadas por ano naquela área.<br/>
#### 1 - Uma nova entidade chamada FUNCIONARIO, onde o mesmo terá um relacionamento de nome ‘’PRODUZIR’’ com uma nova entidade CURSO, será um relacionamento N para N.<br/>Seu relacionamento será promovido a uma entidade chamada Funcionário_Curso.<br/>Ficara armazenado nessa entidade o ID_Curso_tecno(Chave Primaria), ID_Funcionario(Chave estrangeira) e ID_Curso(Chave estrangeira).<br/>
#### 2- A entendida CURSO irá ter uma relação com a entidade TECNOLOGIA de nome ‘’UTILIZAR’’ e como será uma relação N para N iremos promover essa relação para uma entidade.<br/> O nome dessa entidade será Curso_Tecnologia.<br/>Teremos as chaves de nome  ID_Curso_tecno(Chave Primaria), ID_tecnologia(Chave estrangeira) e ID_Curso(Chave estrangeira).
#### 3 – Como último passo agora iremos precisar criar mais uma nova entidade de nome ALUNO que irá se relacionar com a entidade CURSO e o relacionamento de nome ‘’CURSAR’’ será de N para N e logo será promovido a entidade.<br/> O nome dessa entidade se chamara Curso_Aluno.<br/>Teremos as chaves de nome ID_Curso_Aluno(Chave Primaria), ID_Curso(Chave estrangeira) e ID_Aluno(Chave estrangeira).



## Quais são os principais campos e tipos?<br/>
#### Na entidade Tecnologia o principal campo (chave primária) é o ID_Tecnologia onde ele é INT.<br/>
#### Na entidade Empresa o principal campo (chave primária) é o ID_Empresa onde ele é INT.<br/>
#### No relacionamento que foi promovido a uma entidade Empresa_Tecnologia, o principal campo (chave primária) é ID_Utiliza_EMP_TEC onde é INT e FK_ID_Empresa e FK_ID_Tecnologia como chaves estrangeiras.<br/>
## Como essas entidades estão relacionadas?<br/>
#### Uma empresa pode utilizar várias tecnologias ao mesmo tempo e uma mesma tecnologia pode ser utilizada por diversas empresas, ou seja, é uma relação de N para N
