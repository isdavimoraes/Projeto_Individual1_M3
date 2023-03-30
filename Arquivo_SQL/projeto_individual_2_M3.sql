--Criação do DataBaseCREATE DATABASE ResiliaData;USE ResiliaData;--Criação tabelas--Criação da tabela empresaCREATE TABLE tb_empresa(id_empresa INT not null,nome_empresa VARCHAR (50),Endereco VARCHAR (50),CNPJ INT,CONSTRAINT pk_id_empresa PRIMARY KEY (id_empresa),);--Criação da tabela tecnologia CREATE TABLE tb_tecnologia( id_tecnologia int not null, nome_tecnologia varchar (50), area varchar (50), constraint pk_id_tecnologia primary key (id_tecnologia));--Criação da tabela relatorioCREATE TABLE tb_relatorio(id_relatorio INT not null,data_relatorio date,id_empresa int,id_relatorio_tecnologia int,CONSTRAINT pk_id_relatorio PRIMARY KEY (id_relatorio),);-- Criação da tabelo do relacionamento Relatorio e EmpresaCREATE TABLE tb_relatorio_tecnologia(id_relatorio INT not null,id_tecnologia int not null,PRIMARY KEY(id_relatorio,id_tecnologia),foreign key (id_relatorio) References tb_relatorio(id_relatorio),foreign key (id_tecnologia) References tb_tecnologia(id_tecnologia),);--Inserindo dados na tabela empresainsert INTO tb_empresa VALUES(1,'Resilia','Rio de Janeiro','123456789'),(2,'Senac_Cursos','Nova Iguaçu','123456779'),(3,'Descomplica','Rio de Janeiro','123456775'),(4,'Uva','Nilopolis','123456777');--Inserindo dados na tabela tecnologiainsert into tb_tecnologia VALUES(1,'python','dados'),(2,'sql','dados'),(3,'Java','Front end'),(4,'Java','Back End');--Inserindo dados na tabela relatorioinsert into tb_relatorio VALUES(1,'2022-01-15',1,1),(2,'2022-07-25',2,2);-- Inserindo dados na tabela relatorio_tecnologiainsert into tb_relatorio_tecnologia values(1,1),(2,2);--Visualização das tabelasselect * from tb_tecnologiaselect * from tb_empresaselect * from tb_relatorioselect * from tb_relatorio_tecnologiadrop table --SELECT e.nome_empresa, COUNT(DISTINCT rt.id_tecnologia) AS num_tecnologias, MONTH(r.data_relatorio) AS mes
FROM tb_empresa e
JOIN tb_relatorio r ON e.id_empresa = r.id_empresa
JOIN tb_relatorio_tecnologia rt ON r.id_relatorio = rt.id_relatorio
JOIN tb_tecnologia t ON rt.id_tecnologia = t.id_tecnologia
GROUP BY e.nome_empresa, MONTH(r.data_relatorio)

--1

SELECT nome_empresa, SUM(num_tecnologias) AS total_tecnologias
FROM (
  SELECT e.nome_empresa, COUNT(DISTINCT rt.id_tecnologia) AS num_tecnologias, MONTH(r.data_relatorio) AS mes
  FROM tb_empresa e
  JOIN tb_relatorio r ON e.id_empresa = r.id_empresa
  JOIN tb_relatorio_tecnologia rt ON r.id_relatorio = rt.id_relatorio
  JOIN tb_tecnologia t ON rt.id_tecnologia = t.id_tecnologia
  WHERE MONTH(r.data_relatorio) <= 6
  GROUP BY e.nome_empresa, MONTH(r.data_relatorio)
) t
GROUP BY nome_empresa
ORDER BY total_tecnologias DESC

--2
SELECT nome_empresa, SUM(num_tecnologias) AS total_tecnologias
FROM (
  SELECT e.nome_empresa, COUNT(DISTINCT rt.id_tecnologia) AS num_tecnologias, MONTH(r.data_relatorio) AS mes
  FROM tb_empresa e
  JOIN tb_relatorio r ON e.id_empresa = r.id_empresa
  JOIN tb_relatorio_tecnologia rt ON r.id_relatorio = rt.id_relatorio
  JOIN tb_tecnologia t ON rt.id_tecnologia = t.id_tecnologia
  WHERE MONTH(r.data_relatorio) >= 6
  GROUP BY e.nome_empresa, MONTH(r.data_relatorio)
) t
GROUP BY nome_empresa
ORDER BY total_tecnologias DESC

--2
SELECT nome_empresa, SUM(num_tecnologias) AS total_tecnologias
FROM (
  SELECT e.nome_empresa, COUNT(DISTINCT rt.id_tecnologia) AS num_tecnologias, MONTH(r.data_relatorio) AS mes
  FROM tb_empresa e
  JOIN tb_relatorio r ON e.id_empresa = r.id_empresa
  JOIN tb_relatorio_tecnologia rt ON r.id_relatorio = rt.id_relatorio
  JOIN tb_tecnologia t ON rt.id_tecnologia = t.id_tecnologia
  WHERE MONTH(r.data_relatorio) > 6
  GROUP BY e.nome_empresa, MONTH(r.data_relatorio)
) t
GROUP BY nome_empresa
ORDER BY total_tecnologias DESC
LIMIT 1

--3
SELECT COUNT(DISTINCT id_empresa) AS num_empresas
FROM tb_relatorio r
JOIN tb_relatorio_tecnologia rt ON r.id_relatorio = rt.id_relatorio
JOIN tb_tecnologia t ON rt.id_tecnologia = t.id_tecnologia
WHERE t.area = 'dados'
