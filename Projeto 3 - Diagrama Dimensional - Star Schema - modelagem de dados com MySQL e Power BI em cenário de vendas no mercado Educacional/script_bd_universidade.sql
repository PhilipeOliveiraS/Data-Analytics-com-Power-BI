CREATE TABLE departamento (
  idDepartamento INT PRIMARY KEY,
  Nome VARCHAR(45),
  Campus VARCHAR(45),
  idProfessor_coordenador INT
);

CREATE TABLE professor (
  idProfessor INT PRIMARY KEY,
  Departamento_idDepartamento INT,
  FOREIGN KEY (Departamento_idDepartamento) REFERENCES departamento(idDepartamento)
);

CREATE TABLE curso (
  idCurso INT PRIMARY KEY,
  Departamento_idDepartamento INT,
  FOREIGN KEY (Departamento_idDepartamento) REFERENCES departamento(idDepartamento)
);

CREATE TABLE disciplina (
  idDisciplina INT PRIMARY KEY,
  Professor_idProfessor INT,
  FOREIGN KEY (Professor_idProfessor) REFERENCES professor(idProfessor)
);

CREATE TABLE Disciplina_Curso (
  Disciplina_idDisciplina INT,
  Curso_idCurso INT,
  PRIMARY KEY (Disciplina_idDisciplina, Curso_idCurso),
  FOREIGN KEY (Disciplina_idDisciplina) REFERENCES disciplina(idDisciplina),
  FOREIGN KEY (Curso_idCurso) REFERENCES curso(idCurso)
);

CREATE TABLE Pre_requisitos (
  idPre_requisitos INT PRIMARY KEY
);

CREATE TABLE Pre_requisitos_disciplinas (
  Disciplina_idDisciplina INT,
  Pre_requisitos_idPre_requisitos INT,
  PRIMARY KEY (Disciplina_idDisciplina, Pre_requisitos_idPre_requisitos),
  FOREIGN KEY (Disciplina_idDisciplina) REFERENCES disciplina(idDisciplina),
  FOREIGN KEY (Pre_requisitos_idPre_requisitos) REFERENCES Pre_requisitos(idPre_requisitos)
);

CREATE TABLE aluno (
  idAluno INT PRIMARY KEY
);

CREATE TABLE matriculado (
  Aluno_idAluno INT,
  Disciplina_idDisciplina INT,
  PRIMARY KEY (Aluno_idAluno, Disciplina_idDisciplina),
  FOREIGN KEY (Aluno_idAluno) REFERENCES aluno(idAluno),
  FOREIGN KEY (Disciplina_idDisciplina) REFERENCES disciplina(idDisciplina)
);

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
-- Inserindo dados de 2023 até 2025
INSERT INTO dim_datas (data, ano, mes, trimestre)
SELECT 
  DATE_FORMAT(date_add('2023-01-01', INTERVAL n.n DAY), '%Y-%m-%d') AS data,
  YEAR(date_add('2023-01-01', INTERVAL n.n DAY)) AS ano,
  MONTH(date_add('2023-01-01', INTERVAL n.n DAY)) AS mes,
  QUARTER(date_add('2023-01-01', INTERVAL n.n DAY)) AS trimestre
FROM (
  SELECT a.a + (10 * b.a) + (100 * c.a) AS n
  FROM (SELECT 0 AS a UNION ALL SELECT 1 UNION ALL SELECT 2 UNION ALL SELECT 3 UNION ALL SELECT 4 UNION ALL SELECT 5 UNION ALL SELECT 6 UNION ALL SELECT 7 UNION ALL SELECT 8 UNION ALL SELECT 9) a,
       (SELECT 0 AS a UNION ALL SELECT 1 UNION ALL SELECT 2 UNION ALL SELECT 3 UNION ALL SELECT 4 UNION ALL SELECT 5 UNION ALL SELECT 6 UNION ALL SELECT 7 UNION ALL SELECT 8 UNION ALL SELECT 9) b,
       (SELECT 0 AS a UNION ALL SELECT 1 UNION ALL SELECT 2 UNION ALL SELECT 3 UNION ALL SELECT 4 UNION ALL SELECT 5 UNION ALL SELECT 6 UNION ALL SELECT 7 UNION ALL SELECT 8 UNION ALL SELECT 9) c
  WHERE (a.a + (10 * b.a) + (100 * c.a)) <= (DATEDIFF('2025-12-31', '2023-01-01'))
) AS n;

CREATE TABLE ofertas_disciplinas (
    id INT PRIMARY KEY AUTO_INCREMENT,
    disciplina_id INT,
    professor_id INT,
    data_inicio DATE,
    data_fim DATE,
    data_id INT,
    FOREIGN KEY (data_id) REFERENCES dim_datas(data_id)
);
