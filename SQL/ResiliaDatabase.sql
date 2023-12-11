CREATE DATABASE Resilia;

USE Resilia;

CREATE TABLE Curso (
    Id_Curso INT PRIMARY KEY AUTO_INCREMENT,
    Nome VARCHAR(100),
    Carga_horaria INT,
    Data_Inicio DATE,
    Data_termino DATE
);
CREATE TABLE Turma (
    Id_Turma INT PRIMARY KEY AUTO_INCREMENT,
    Nome_Turma VARCHAR(100),
    Id_Curso INT,
    FOREIGN KEY (Id_Curso) REFERENCES Curso(Id_Curso)
);
CREATE TABLE Aluno (
    Id_Aluno INT PRIMARY KEY AUTO_INCREMENT,
    Nome VARCHAR(100),
    Status VARCHAR(50),
    Id_Turma INT,
    Id_Curso INT,
    Frequencia FLOAT, 
    FOREIGN KEY (Id_Turma) REFERENCES Turma(Id_Turma),
    FOREIGN KEY (Id_Curso) REFERENCES Curso(Id_Curso)
);
CREATE TABLE Módulo (
    Id_Módulo INT PRIMARY KEY AUTO_INCREMENT,
    Nome VARCHAR(100),
    Id_Curso INT,
    FOREIGN KEY (Id_Curso) REFERENCES Curso(Id_Curso)
);

CREATE TABLE Disciplina (
    Id_Disciplina INT PRIMARY KEY AUTO_INCREMENT,
    Nome VARCHAR(100),
    Carga_Horaria INT,
    Dias INT,
    Data_inic DATE,
    Data_term DATE,
    Id_Curso INT,
    Id_Módulo INT,
    FOREIGN KEY (Id_Curso) REFERENCES Curso(Id_Curso),
    FOREIGN KEY (Id_Módulo) REFERENCES Módulo(Id_Módulo)
);
CREATE TABLE Disciplina_Curso (
    Id_Disciplina INT,
    Id_Curso INT,
    FOREIGN KEY (Id_Disciplina) REFERENCES Disciplina(Id_Disciplina),
    FOREIGN KEY (Id_Curso) REFERENCES Curso(Id_Curso)
);
CREATE TABLE Turno (
    Id_Turno INT PRIMARY KEY AUTO_INCREMENT,
    Horario TIME,
    Id_Turma INT,
    FOREIGN KEY (Id_Turma) REFERENCES Turma(Id_Turma)
);

CREATE TABLE Facilitador (
    Id_Facilitador INT PRIMARY KEY AUTO_INCREMENT,
    Nome VARCHAR(100),
    Id_Disciplina INT,
    FOREIGN KEY (Id_Disciplina) REFERENCES Disciplina(Id_Disciplina)
);
CREATE TABLE Facilitador_Turma (
    Id_Facilitador INT,
    Id_Turma INT,
    FOREIGN KEY (Id_Facilitador) REFERENCES Facilitador(Id_Facilitador),
    FOREIGN KEY (Id_Turma) REFERENCES Turma(Id_Turma)
);

CREATE TABLE Boletim (
    Id_Curso INT,
    Id_Disciplina INT,
    Id_Aluno INT,
    Notas_Aluno FLOAT,
    Frequência FLOAT,
    Situação VARCHAR(50),
    FOREIGN KEY (Id_Curso) REFERENCES Curso(Id_Curso),
    FOREIGN KEY (Id_Disciplina) REFERENCES Disciplina(Id_Disciplina),
    FOREIGN KEY (Id_Aluno) REFERENCES Aluno(Id_Aluno)
);
CREATE VIEW EvasaoPorTurma AS
SELECT
    t.Nome_Turma,
    COUNT(CASE WHEN a.Status = 'Evasão' OR a.Frequencia < 0.75 OR b.Notas_Aluno < 7 THEN 1 END) * 100.0 / COUNT(*) AS Percentual_Evasao
FROM
    Turma AS t
JOIN
    Aluno AS a ON t.Id_Turma = a.Id_Turma
LEFT JOIN
    Boletim AS b ON a.Id_Aluno = b.Id_Aluno
GROUP BY
    t.Nome_Turma;

CREATE TABLE LogStatus (
    Id_Log INT PRIMARY KEY AUTO_INCREMENT,
    Id_Aluno INT,
    Status_Antigo VARCHAR(50),
    Status_Novo VARCHAR(50),
    Data_Mudanca DATETIME,
    FOREIGN KEY (Id_Aluno) REFERENCES Aluno(Id_Aluno)
);

DELIMITER //

-- Criação do gatilho
CREATE TRIGGER AtualizacaoStatus AFTER UPDATE ON Aluno 
FOR EACH ROW 
BEGIN    
    INSERT INTO LogStatus (Id_Aluno, Status_Antigo, Status_Novo, Data_Mudanca)    
    VALUES (NEW.Id_Aluno, OLD.Status, NEW.Status, NOW()); 
END;//

-- Restauração do delimitador padrão
DELIMITER ;
