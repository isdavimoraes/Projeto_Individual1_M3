--Cria��o do DataBase
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