\c postgres
drop database dojo;

create database dojo;

\c dojo

CREATE TABLE empregados (
 emp_id int NOT NULL,
 dep_id int DEFAULT NULL,
 supervisor_id int DEFAULT NULL,
 nome varchar(255) DEFAULT NULL,
 salario int DEFAULT NULL,
 PRIMARY KEY (emp_id)
);

CREATE TABLE departamentos (
 dep_id int NOT NULL ,
 nome varchar(255) DEFAULT NULL,
 PRIMARY KEY (dep_id)
);


INSERT INTO empregados (emp_id, dep_id, supervisor_id, nome, salario)
VALUES
 (1,1,0,'Jose','8000'),
	(2,3,5,'Joao','6000'),
	(3,1,1,'Guilherme','5000'),
	(4,1,1,'Maria','9500'),
	(5,2,0,'Pedro','7500'),    
    (6,1,1,'Claudia','10000'),
    (7,4,1,'Ana','12200'),
    (8,2,5,'Luiz','8000');

INSERT INTO departamentos (dep_id, nome)
VALUES
	(1,'TI'),
	(2,'RH'),
	(3,'Vendas'),
	(4,'Marketing');