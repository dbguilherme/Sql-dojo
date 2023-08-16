<table>
<tr>
<td>
  Dojo para relembrar os comandos SQL básicos através de exercícios. :)

</td>
</tr>
</table>

## Setup
- Clonar o repositorio:
  `git clone `https://github.com/dbguilherme/Sql-dojo.git

- Para a base de dados de teste: Rodar o script: 
 `psql -h localhost -U postgres -d postgres -f script.sql `

- Para a base de dados de produção: rodar o script create_data/data.py
 `python create_data/data.py`
 
- Acessar o terminal
  `sudo -u postgres psql postgres`
  \c dojo

- Fazer as questões do arquivo questions.sql :)

- Para ampliar o número de tupla no banco de dados, acesse o diretório `create_data`e rode:
     pip install psycopg2-binary 
     python data.py

## Colab
 Os exercícios podem ser feitos no Google Colab, neste (link)[https://colab.research.google.com/drive/1oN6QWKMLxbgpIMY6Ww9F3qCXDNZZUcV_?usp=sharing] 

---


## Exemplo de arquivo de entrega no dataset com tamanho N: 

| id 	| query                 	| Tempo 1  	| Tempo 2 	| Tempo 3 	|
|----	|-----------------------	|----------	|---------	|---------	|
| 1  	| select * from dados;  	| 1        	| 1       	| 1       	|
| 2  	| select * from dados;  	| 2        	| 2       	| 2       	|
| 3  	| select * from dados;  	| 3        	| 3       	| 3       	|



## Boa atividade :)

<!-- # Sql-dojo

Dojo para relembrar o conteúdo de SQL básico através de exercícios. Para rodar o script basta: 


- Documentação para relembrar a sintaxe do SQL: 
  (Documentação oficial)[https://www.postgresql.org/docs/current/sql-select.html]
  
  https://www.tutorialspoint.com/postgresql/postgresql_syntax.htm
  
  https://www.postgresqltutorial.com/postgresql-administration/psql-commands/

  https://www.postgresqltutorial.com/postgresql-window-function/

- Boa atividade :) 
 -->

## To-do

- Mais questões
