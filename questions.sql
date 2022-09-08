1  Listar os empregados (nomes) que tem salário maior que seu chefe


--  empregado | chefe | emp sal | chef sal 
-- -----------+-------+---------+----------
--  Maria     | Jose  | 9500    | 8000
--  Luiz      | Pedro | 8000    | 7500


2 Listar o maior salario de cada departamento (pode ser usado o group by)



3 Listar o nome do funcionario com maior salario dentro de cada departamento (pode ser usado o IN)


--  dep_id | nome  | salario 
-- --------+-------+---------
--       3 | Joao  | 6000
--       1 | Maria | 9500
--       4 | Ana   | 12200
--       2 | Luiz  | 8000

4 Listar os nomes departamentos que tem menos de 3 empregados;

--  nome 
-- ------
--  TI



6 Listar os departamentos  com o número de colaboradores

    
--    nome    | count 
-- -----------+-------
--  Marketing |     1
--  RH        |     2
--  TI        |     4
--  Vendas    |     1


7 Listar os empregados que não possuem chefes no mesmo departamento 

--  nome | dep_id 
-- ------+--------
--  Joao |      3
--  Ana  |      4


8 Listar os departamentos com o total de salários pagos 


--  emp_id | dep_id | supervisor_id | nome | salario | emp_id | dep_id | supervisor_id | nome  | salario 
-- --------+--------+---------------+------+---------+--------+--------+---------------+-------+---------
--       2 |      3 |             5 | Joao | 6000    |      5 |      2 |             0 | Pedro | 7500
--       7 |      4 |             1 | Ana  | 12200   |      1 |      1 |             0 | Jose  | 8000


9  Listar os colabordores com salario maior que a média do seu departamento;


10 Faça um questão livre e responda com join e subconsulta; 