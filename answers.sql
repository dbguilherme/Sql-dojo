-- Questão 1
-- Listar os empregados (nomes) que tem salário maior que seu chefe
SELECT
  emp.nome AS empregado,
  chefe.salario AS emp_sal,
  chefe.nome AS chefe,
  emp.salario AS chef_sal
FROM empregados chefe
JOIN empregados emp
ON chefe.emp_id = emp.supervisor_id
WHERE emp.salario > chefe.salario;

-- Questão 2
-- Listar o maior salario de cada departamento (pode ser usado o group by)
SELECT
  dep_id,
  MAX(salario)
FROM empregados
GROUP BY dep_id
ORDER BY dep_id;

-- Questão 3
-- Listar o nome do funcionario com maior salario dentro de cada departamento (pode ser usado o IN)
SELECT
  emp.dep_id,
  emp.nome,
  emp.salario
FROM empregados emp
JOIN (
  SELECT
    dep_id,
    MAX(salario) AS salario
  FROM empregados
  GROUP BY dep_id
) AS emp_max
ON emp.dep_id = emp_max.dep_id
AND emp.salario = emp_max.salario
ORDER BY emp.dep_id;

-- Questão 4
-- Listar os nomes departamentos que tem menos de 3 empregados;
SELECT
  nome
FROM departamentos
WHERE dep_id NOT IN (
  SELECT
    dep_id
  FROM empregados
  GROUP BY dep_id
  HAVING COUNT(*) >= 3
);

-- Questão 5
-- Listar os departamentos  com o número de colaboradores
SELECT
  dep.nome,
  COUNT(*) AS count
FROM departamentos dep
JOIN empregados emp
ON dep.dep_id = emp.dep_id
GROUP BY dep.nome;

-- TODO
-- Questão 6
-- Listar os empregados que não possuem chefes no mesmo departamento
SELECT
  emp.nome,
  emp.dep_id
FROM empregados emp
LEFT JOIN empregados chefe
ON emp.supervisor_id = chefe.emp_id
WHERE chefe.emp_id IS NULL
OR emp.dep_id <> chefe.dep_id;

-- TODO
-- Questão 7
-- Listar os departamentos com o total de salários pagos

-- TODO
-- Questão 8
-- Listar os colaboradores com salario maior que a média do seu departamento;
SELECT
  emp.nome,
  emp.salario,
  AVG(emp.salario) OVER (PARTITION BY emp.dep_id) AS avg
FROM empregados emp
WHERE emp.salario > AVG(emp.salario) OVER (PARTITION BY emp.dep_id);

-- Questão 9
-- Compare o salario de cada colaborados com média do seu setor. Dica: usar slide windows functions (https://www.postgresqltutorial.com/postgresql-window-function/)
SELECT
  emp.emp_id,
  emp.nome,
  emp.dep_id,
  emp.salario,
  AVG(emp.salario) OVER (PARTITION BY emp.dep_id) AS avg
FROM empregados emp
ORDER BY emp.dep_id;

-- Questão 10
-- Encontre os empregados com salario maior ou igual a média do seu departamento. Deve ser reportado o salario do empregado e a média do departamento (dica: usar window function com subconsulta)
SELECT
  emp.nome,
  emp.salario,
  AVG(emp.salario) OVER (PARTITION BY emp.dep_id) AS media
FROM empregados emp
WHERE emp.salario >= (
  SELECT
    AVG(emp2.salario)
  FROM empregados emp2
  WHERE emp2.dep_id = emp.dep_id
);

