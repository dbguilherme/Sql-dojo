import psycopg2
import random

import csv


def loadcsv():
    csv_file_path = "ibge-fem-10000.csv"

    # Lists to store data
    data_to_insert = []

    # Read data from CSV
    with open(csv_file_path, "r") as csv_file:
        csv_reader = csv.reader(csv_file)
        next(csv_reader)  # Skip header row

        for row in csv_reader:
            data_to_insert.append(row[0].lower())
    #print(data_to_insert)
    return data_to_insert


def create_conection():
    # Connect to the PostgreSQL database
    conn = psycopg2.connect(
        host="localhost",
        database="dojo",
        user="postgres",
        password=""
    )
    # Create a cursor
    cur = conn.cursor()
    cur.execute("truncate table empregados;")
    cur.execute("truncate table departamentos;")

    return conn,cur



# Generate and insert 1000 rows of synthetic data
nomes=loadcsv()
conn,cur=create_conection()
random_values = list(range(1000, 10000, 100))

# Shuffle the list to randomize the order
random.shuffle(random_values)

#number of tuples
N=100000

#populate empregados table
for emp_id in range(1, N):
    dep_id = random.randint(1, 5)  # Assuming 5 departments
    supervisor_id = random.randint(1, 10) if emp_id > 1 else 0
    nome = f"{nomes[random.randint(0, len(nomes)-1)]}"
    salario =(random_values[random.randint(1, len(random_values)-1)])
    #salario=salario*(supervisor_id/10 if supervisor_id>0 and salario>  else 1);
    #print({emp_id}, {dep_id}, {supervisor_id}, nome, {salario})
    insert_query = f"INSERT INTO empregados (emp_id, dep_id, supervisor_id, nome, salario) VALUES ({emp_id}, {dep_id}, {supervisor_id}, '{nome}', {salario});"
    cur.execute(insert_query)


dep_names=["Administrativo", "Atacado", "Atendimento ao cliente", "Auditoria", "Comercial", "Comunicação", "Contabilidade", "Controladoria", "Credit", "Desenvolvimento de negócios", "Estratégia", "Exports", "Financeiro", "Garantia de Qualidade", "Imports", "Inteligência de Mercado", "Legal", "Logística", "Manutenção", "Marketing", "Operações", "Pesquisa e Desenvolvimento", "Planejamento", "Planejamento Financeiro", "Processos", "Produção", "Projetos", "Recursos Humanos", "Seguros", "Tesouraria", "TI Tecnologia da Informação", "Treinamento e Desenvolvimento", "Tributário, Fiscal", "Varejo", "Vendas"]

#populate departamentos table
for dep in range(1,50):
    dep_id=dep
    nome=f"{dep_names[random.randint(0, len(dep_names)-1)]}"
    print(nome)
    insert_query = f"INSERT INTO departamentos VALUES ({dep_id}, '{nome}');"
    cur.execute(insert_query)

# Commit the changes and close the connection
conn.commit()
cur.close()
conn.close()