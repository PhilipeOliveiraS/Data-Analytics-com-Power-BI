# Projeto Diagrama Dimensional - Star Schema - modelagem de dados com MySQL e Power BI em cenário de vendas no mercado Educacional

![Badge](https://img.shields.io/badge/MySQL-Database-blue?style=for-the-badge)
![Badge](https://img.shields.io/badge/Power%20BI-Visualization-yellow?style=for-the-badge)
![Badge](https://img.shields.io/badge/GitHub-Repository-black?style=for-the-badge)
![Badge](https://img.shields.io/badge/Status-Completed-green?style=for-the-badge)

## 📚 Descrição

Este projeto envolve a criação de um banco de dados para uma instituição de ensino utilizando MySQL Workbench. O foco é na análise dos dados dos professores através de um esquema dimensional em estrela, facilitando a criação de relatórios e dashboards no Power BI.

## 📈 Funcionalidades

- **Estruturação de Dados**: Criação de tabelas para armazenar informações sobre departamentos, professores, cursos, disciplinas, alunos, matrículas e datas.
- **Modelagem Dimensional**: Implementação de um esquema em estrela para otimização de consultas analíticas.
- **Análise de Dados**: Preparação dos dados para visualizações detalhadas sobre a performance dos professores.
---
## 📌 Tecnologias Utilizadas
* **MySQL Workbench:** Ferramenta utilizada para criar e gerenciar o banco de dados.
* **Power BI:** Ferramenta de business intelligence utilizada para visualizar e analisar os dados.
* **SQL:** Linguagem de consulta utilizada para criar e manipular os dados.
---

🎯![Diagrama Dimensional - Universidade](https://github.com/PhilipeOliveiraS/Data-Analytics-com-Power-BI/blob/main/Projeto%203%20-%20Diagrama%20Dimensional%20-%20Star%20Schema%20-%20modelagem%20de%20dados%20com%20MySQL%20e%20Power%20BI%20em%20cen%C3%A1rio%20de%20vendas%20no%20mercado%20Educacional/der_universidade.png)
---

### ⚙️ Análise do Código SQL

O código a seguir foi usado para a criação de um banco de dados chamado "Universidade" no MySQL Workbench. Este código define várias tabelas para armazenar informações sobre departamentos, professores, cursos, disciplinas, alunos, matrículas e datas, implementando um esquema dimensional em estrela para análise de dados dos professores.

#### 🛠️ Descrição e Funcionalidades de Cada Tabela:

#### Departamento

```sql
CREATE TABLE departamento (
  idDepartamento INT PRIMARY KEY,
  Nome VARCHAR(45),
  Campus VARCHAR(45),
  idProfessor_coordenador INT
);
```
- **idDepartamento**: Identificador único do departamento.
- **Nome**: Nome do departamento.
- **Campus**: Campus onde o departamento está localizado.
- **idProfessor_coordenador**: Identificador do professor coordenador.

#### Professor

```sql
CREATE TABLE professor (
  idProfessor INT PRIMARY KEY,
  Departamento_idDepartamento INT,
  FOREIGN KEY (Departamento_idDepartamento) REFERENCES departamento(idDepartamento)
);
```
- **idProfessor**: Identificador único do professor.
- **Departamento_idDepartamento**: Referência ao departamento.

#### Curso

```sql
CREATE TABLE curso (
  idCurso INT PRIMARY KEY,
  Departamento_idDepartamento INT,
  FOREIGN KEY (Departamento_idDepartamento) REFERENCES departamento(idDepartamento)
);
```
- **idCurso**: Identificador único do curso.
- **Departamento_idDepartamento**: Referência ao departamento.

#### Disciplina

```sql
CREATE TABLE disciplina (
  idDisciplina INT PRIMARY KEY,
  Professor_idProfessor INT,
  FOREIGN KEY (Professor_idProfessor) REFERENCES professor(idProfessor)
);
```
- **idDisciplina**: Identificador único da disciplina.
- **Professor_idProfessor**: Referência ao professor.

#### Disciplina_Curso

```sql
CREATE TABLE Disciplina_Curso (
  Disciplina_idDisciplina INT,
  Curso_idCurso INT,
  PRIMARY KEY (Disciplina_idDisciplina, Curso_idCurso),
  FOREIGN KEY (Disciplina_idDisciplina) REFERENCES disciplina(idDisciplina),
  FOREIGN KEY (Curso_idCurso) REFERENCES curso(idCurso)
);
```
- **Disciplina_idDisciplina**: Referência à disciplina.
- **Curso_idCurso**: Referência ao curso.

#### Pre_requisitos

```sql
CREATE TABLE Pre_requisitos (
  idPre_requisitos INT PRIMARY KEY
);
```
- **idPre_requisitos**: Identificador único do pré-requisito.

#### Pre_requisitos_disciplinas

```sql
CREATE TABLE Pre_requisitos_disciplinas (
  Disciplina_idDisciplina INT,
  Pre_requisitos_idPre_requisitos INT,
  PRIMARY KEY (Disciplina_idDisciplina, Pre_requisitos_idPre_requisitos),
  FOREIGN KEY (Disciplina_idDisciplina) REFERENCES disciplina(idDisciplina),
  FOREIGN KEY (Pre_requisitos_idPre_requisitos) REFERENCES Pre_requisitos(idPre_requisitos)
);
```
- **Disciplina_idDisciplina**: Referência à disciplina.
- **Pre_requisitos_idPre_requisitos**: Referência ao pré-requisito.

#### Aluno

```sql
CREATE TABLE aluno (
  idAluno INT PRIMARY KEY
);
```
- **idAluno**: Identificador único do aluno.

#### Matriculado

```sql
CREATE TABLE matriculado (
  Aluno_idAluno INT,
  Disciplina_idDisciplina INT,
  PRIMARY KEY (Aluno_idAluno, Disciplina_idDisciplina),
  FOREIGN KEY (Aluno_idAluno) REFERENCES aluno(idAluno),
  FOREIGN KEY (Disciplina_idDisciplina) REFERENCES disciplina(idDisciplina)
);
```
- **Aluno_idAluno**: Referência ao aluno.
- **Disciplina_idDisciplina**: Referência à disciplina.

#### Dim_datas

```sql
CREATE TABLE dim_datas (
    data_id INT PRIMARY KEY AUTO_INCREMENT,
    data DATE,
    ano INT,
    mes INT,
    trimestre INT,
    semestre INT,
    dia_semana INT,
    dia_mes INT,
    nome_mes VARCHAR(20),
    nome_dia_semana VARCHAR(20),
    feriado BOOLEAN,
    fim_de_semana BOOLEAN
);
```
- **data_id**: Identificador único da data.
- **data**: Data no formato AAAA-MM-DD.
- **ano**: Ano da data.
- **mes**: Mês da data.
- **trimestre**: Trimestre da data.
- **semestre**: Semestre da data.
- **dia_semana**: Dia da semana da data.
- **dia_mes**: Dia do mês da data.
- **nome_mes**: Nome do mês da data.
- **nome_dia_semana**: Nome do dia da semana da data.
- **feriado**: Flag indicando
---

### Vantagens e Desempenho

1. **Modelagem Dimensional**:
   - Simplifica a estrutura de dados para análises.
   - Otimiza a consulta de dados para relatórios e dashboards.

2. **Integridade Referencial**:
   - Uso de chaves estrangeiras garante a consistência dos dados.

3. **Flexibilidade nas Consultas**:
   - Estrutura permite consultas complexas e detalhadas sobre a performance e dados dos professores.
---

### Fundamentos de SQL e Modelagem de Dados

1. **Criação de Tabelas**: Utiliza a instrução `CREATE TABLE` para definir as tabelas com seus respectivos campos e tipos de dados.
2. **Chaves Primárias**: Definem identificadores únicos para cada tabela, garantindo a unicidade de registros.
3. **Chaves Estrangeiras**: Estabelecem relações entre as tabelas, mantendo a integridade referencial.
4. **Inserção de Dados**: Utiliza a instrução `INSERT INTO` para popular a tabela `dim_datas`.

---

## 🚀 Conclusão

Este projeto demonstrou como aplicar a modelagem dimensional com o uso de um esquema em estrela (Star Schema) para realizar uma análise detalhada de dados de vendas no mercado educacional. Utilizando MySQL para a criação e gerenciamento do banco de dados e Power BI para visualização e análise dos dados, foi possível construir um sistema robusto e eficiente para suportar a tomada de decisões informadas.

A modelagem dimensional, através do esquema em estrela, permitiu a estruturação dos dados de maneira intuitiva e otimizada para consultas analíticas, facilitando a extração de insights valiosos. As tabelas de dimensão e fatos foram projetadas para oferecer uma visão abrangente e detalhada sobre o desempenho dos professores, cursos ministrados e o departamento ao qual pertencem, além de incorporar uma tabela de datas que possibilita a análise temporal dos dados.

A integração entre MySQL e Power BI destacou-se pela capacidade de manipular grandes volumes de dados e transformá-los em visualizações claras e significativas, proporcionando uma poderosa ferramenta de Business Intelligence para o setor educacional. A flexibilidade e o desempenho das soluções implementadas garantem que a análise de vendas possa ser ampliada e adaptada conforme necessário, suportando uma vasta gama de requisitos e objetivos comerciais.

Em suma, este projeto não só exemplifica as melhores práticas em modelagem de dados e análise de negócios, mas também reforça a importância de uma abordagem meticulosa e estratégica na gestão de dados. O uso de tecnologias avançadas como MySQL e Power BI, aliado a uma modelagem dimensional bem estruturada, proporciona uma base sólida para a construção de soluções de Business Intelligence que agregam valor significativo às operações e estratégias empresariais.

Obrigado por acompanhar este projeto. Espero que a metodologia e as técnicas apresentadas inspirem e orientem futuros projetos de análise de dados e Business Intelligence no setor educacional e além.

## 🤝 Contribuições

Contribuições são bem-vindas! Sinta-se à vontade para abrir uma issue ou enviar um pull request.

## 📜 Licença

Este projeto está licenciado sob a Licença MIT - veja o arquivo [LICENSE](LICENSE) para mais detalhes.

## 📬 Contato


- **LinkedIn**: [Philipe Oliveira](https://www.linkedin.com/in/philipe-oliveira-b0052a21)

---

![GitHub repo size](https://img.shields.io/github/repo-size/PhilipeOliveiraS/Data-Analytics-com-Power-BI)
![GitHub contributors](https://img.shields.io/github/contributors/PhilipeOliveiraS/Data-Analytics-com-Power-BI)
![GitHub stars](https://img.shields.io/github/stars/PhilipeOliveiraS/Data-Analytics-com-Power-BI?style=social)
![GitHub forks](https://img.shields.io/github/forks/PhilipeOliveiraS/Data-Analytics-com-Power-BI?style=social)
![GitHub issues](https://img.shields.io/github/issues/PhilipeOliveiraS/Data-Analytics-com-Power-BI)
![GitHub license](https://img.shields.io/github/license/PhilipeOliveiraS/Data-Analytics-com-Power-BI)

