CREATE DATABASE Resilia;

USE Resilia;

CREATE TABLE Curso (
    Id_Curso INT PRIMARY KEY AUTO_INCREMENT,
    Nome VARCHAR(100),
    Carga_horaria INT,
    Data_Inicio DATE,
    Data_termino DATE
);

-- Inserções para a tabela Curso
INSERT INTO Curso (Nome, Carga_horaria, Data_Inicio, Data_termino) VALUES 
('Curso 1', 100, '2023-01-01', '2023-01-31'),
('Curso 2', 200, '2023-02-01', '2023-02-28'),
('Curso 3', 150, '2023-03-01', '2023-03-31'),
('Curso 4', 120, '2023-04-01', '2023-04-30'),
('Curso 5', 180, '2023-05-01', '2023-05-31'),
('Curso 6', 210, '2023-06-01', '2023-06-30'),
('Curso 7', 160, '2023-07-01', '2023-07-31'),
('Curso 8', 170, '2023-08-01', '2023-08-31'),
('Curso 9', 220, '2023-09-01', '2023-09-30'),
('Curso 10', 230, '2023-10-01', '2023-10-31'),
('Curso 11', 240, '2023-11-01', '2023-11-30'),
('Curso 12', 250, '2023-12-01', '2023-12-31'),
('Curso 13', 260, '2024-01-01', '2024-01-31'),
('Curso 14', 270, '2024-02-01', '2024-02-29'),
('Curso 15', 280, '2024-03-01', '2024-03-31'),
('Curso 16', 290, '2024-04-01', '2024-04-30'),
('Curso 17', 300, '2024-05-01', '2024-05-31'),
('Curso 18', 310, '2024-06-01', '2024-06-30'),
('Curso 19', 320, '2024-07-01', '2024-07-31'),
('Curso 20', 330, '2024-08-01', '2024-08-31');

CREATE TABLE Turma (
    Id_Turma INT PRIMARY KEY AUTO_INCREMENT,
    Nome_Turma VARCHAR(100),
    Id_Curso INT,
    FOREIGN KEY (Id_Curso) REFERENCES Curso(Id_Curso)
);

-- Inserções para a tabela Turma
INSERT INTO Turma (Nome_Turma, Id_Curso) VALUES
('Turma 1', 1),
('Turma 2', 2),
('Turma 3', 3),
('Turma 4', 4),
('Turma 5', 5),
('Turma 6', 6),
('Turma 7', 7),
('Turma 8', 8),
('Turma 9', 9),
('Turma 10', 10),
('Turma 11', 11),
('Turma 12', 12),
('Turma 13', 13),
('Turma 14', 14),
('Turma 15', 15),
('Turma 16', 16),
('Turma 17', 17),
('Turma 18', 18),
('Turma 19', 19),
('Turma 20', 20);


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

-- Inserções para a tabela Aluno
INSERT INTO Aluno (Nome, Status, Id_Turma, Id_Curso, Frequencia) VALUES
('Aluno 1', 'Ativo', 1, 1, 0.9),
('Aluno 2', 'Ativo', 2, 2, 0.8),
('Aluno 3', 'Inativo', 3, 3, 0.7),
('Aluno 4', 'Ativo', 4, 4, 0.95),
('Aluno 5', 'Ativo', 5, 5, 0.88),
('Aluno 6', 'Ativo', 6, 6, 0.91),
('Aluno 7', 'Inativo', 7, 7, 0.6),
('Aluno 8', 'Ativo', 8, 8, 0.92),
('Aluno 9', 'Ativo', 9, 9, 0.89),
('Aluno 10', 'Ativo', 10, 10, 0.85),
('Aluno 11', 'Ativo', 11, 11, 0.86),
('Aluno 12', 'Ativo', 12, 12, 0.96),
('Aluno 13', 'Ativo', 13, 13, 0.78),
('Aluno 14', 'Ativo', 14, 14, 0.93),
('Aluno 15', 'Ativo', 15, 15, 0.87),
('Aluno 16', 'Ativo', 16, 16, 0.94),
('Aluno 17', 'Ativo', 17, 17, 0.84),
('Aluno 18', 'Ativo', 18, 18, 0.97),
('Aluno 19', 'Inativo', 19, 19, 0.6),
('Aluno 20', 'Inativo', 20, 20, 0.7);



CREATE TABLE Módulo (
    Id_Módulo INT PRIMARY KEY AUTO_INCREMENT,
    Nome VARCHAR(100),
    Id_Curso INT,
    FOREIGN KEY (Id_Curso) REFERENCES Curso(Id_Curso)
);

-- Inserções para a tabela Módulo
INSERT INTO Módulo (Nome, Id_Curso) VALUES
('Módulo 1', 1),
('Módulo 2', 2),
('Módulo 3', 3),
('Módulo 4', 4),
('Módulo 5', 5),
('Módulo 6', 6),
('Módulo 7', 7),
('Módulo 8', 8),
('Módulo 9', 9),
('Módulo 10', 10),
('Módulo 11', 11),
('Módulo 12', 12),
('Módulo 13', 13),
('Módulo 14', 14),
('Módulo 15', 15),
('Módulo 16', 16),
('Módulo 17', 17),
('Módulo 18', 18),
('Módulo 19', 19),
('Módulo 20', 20);


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

-- Inserções para a tabela Disciplina
INSERT INTO Disciplina (Nome, Carga_Horaria, Dias, Data_inic, Data_term, Id_Curso, Id_Módulo) VALUES
('Disciplina 1', 100, 5, '2023-01-01', '2023-06-01', 1, 1),
('Disciplina 2', 200, 4, '2023-02-01', '2023-07-01', 2, 2),
('Disciplina 3', 150, 3, '2023-03-01', '2023-08-01', 3, 3),
('Disciplina 4', 180, 4, '2023-04-01', '2023-09-01', 4, 4),
('Disciplina 5', 120, 5, '2023-05-01', '2023-10-01', 5, 5),
('Disciplina 6', 100, 4, '2023-06-01', '2023-11-01', 6, 6),
('Disciplina 7', 200, 3, '2023-07-01', '2023-12-01', 7, 7),
('Disciplina 8', 150, 5, '2023-08-01', '2024-01-01', 8, 8),
('Disciplina 9', 180, 4, '2023-09-01', '2024-02-01', 9, 9),
('Disciplina 10', 120, 3, '2023-10-01', '2024-03-01', 10, 10),
('Disciplina 11', 100, 4, '2023-11-01', '2024-04-01', 11, 11),
('Disciplina 12', 200, 5, '2023-12-01', '2024-05-01', 12, 12),
('Disciplina 13', 150, 3, '2024-01-01', '2024-06-01', 13, 13),
('Disciplina 14', 180, 4, '2024-02-01', '2024-07-01', 14, 14),
('Disciplina 15', 120, 5, '2024-03-01', '2024-08-01', 15, 15),
('Disciplina 16', 100, 4, '2024-04-01', '2024-09-01', 16, 16),
('Disciplina 17', 200, 3, '2024-05-01', '2024-10-01', 17, 17),
('Disciplina 18', 150, 5, '2024-06-01', '2024-11-01', 18, 18),
('Disciplina 19', 180, 4, '2024-07-01', '2024-12-01', 19, 19),
('Disciplina 20', 120, 3, '2024-08-01', '2025-01-01', 20, 20);


CREATE TABLE Disciplina_Curso (
    Id_Disciplina INT,
    Id_Curso INT,
    FOREIGN KEY (Id_Disciplina) REFERENCES Disciplina(Id_Disciplina),
    FOREIGN KEY (Id_Curso) REFERENCES Curso(Id_Curso)
);

-- Inserções para a tabela Disciplina_Curso
INSERT INTO Disciplina_Curso (Id_Disciplina, Id_Curso) VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5),
(6, 6),
(7, 7),
(8, 8),
(9, 9),
(10, 10),
(11, 11),
(12, 12),
(13, 13),
(14, 14),
(15, 15),
(16, 16),
(17, 17),
(18, 18),
(19, 19),
(20, 20);


CREATE TABLE Turno (
    Id_Turno INT PRIMARY KEY AUTO_INCREMENT,
    Horario TIME,
    Id_Turma INT,
    FOREIGN KEY (Id_Turma) REFERENCES Turma(Id_Turma)
);

-- Inserções para a tabela Disciplina_Curso
INSERT INTO Turno (Horario, Id_Turma) VALUES 
('08:00:00', 1),
('09:00:00', 2),
('10:00:00', 3),
('11:00:00', 4),
('12:00:00', 5),
('13:00:00', 6),
('14:00:00', 7),
('15:00:00', 8),
('16:00:00', 9),
('17:00:00', 10),
('18:00:00', 11),
('19:00:00', 12),
('20:00:00', 13),
('21:00:00', 14),
('22:00:00', 15),
('23:00:00', 16),
('00:00:00', 17),
('01:00:00', 18),
('02:00:00', 19),
('03:00:00', 20);

CREATE TABLE Facilitador (
    Id_Facilitador INT PRIMARY KEY AUTO_INCREMENT,
    Nome VARCHAR(100),
    Id_Disciplina INT,
    FOREIGN KEY (Id_Disciplina) REFERENCES Disciplina(Id_Disciplina)
);

-- Inserções para a tabela Facilitador
INSERT INTO Facilitador (Nome, Id_Disciplina) VALUES
('Facilitador 1', 1),
('Facilitador 2', 2),
('Facilitador 2', 3),
('Facilitador 2', 4),
('Facilitador 3', 5),
('Facilitador 1', 6),
('Facilitador 4', 7),
('Facilitador 1', 8),
('Facilitador 1', 9),
('Facilitador 3', 10),
('Facilitador 3', 11),
('Facilitador 3', 12),
('Facilitador 2', 13),
('Facilitador 4', 14),
('Facilitador 4', 15),
('Facilitador 1', 16),
('Facilitador 2', 17),
('Facilitador 1', 18),
('Facilitador 3', 19),
('Facilitador 1', 20);

CREATE TABLE Facilitador_Turma (
    Id_Facilitador INT,
    Id_Turma INT,
    FOREIGN KEY (Id_Facilitador) REFERENCES Facilitador(Id_Facilitador),
    FOREIGN KEY (Id_Turma) REFERENCES Turma(Id_Turma)
);

-- Inserções para a tabela Facilitador_Turma
INSERT INTO Facilitador_Turma (Id_Facilitador, Id_Turma) VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5),
(6, 6),
(7, 7),
(8, 8),
(9, 9),
(10, 10),
(11, 11),
(12, 12),
(13, 13),
(14, 14),
(15, 15),
(16, 16),
(17, 17),
(18, 18),
(19, 19),
(20, 20);


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

-- Inserções para a tabela Boletim
INSERT INTO Boletim (Id_Curso, Id_Disciplina, Id_Aluno, Notas_Aluno, Frequência, Situação) VALUES
(1, 1, 1, 8.5, 0.9, 'Aprovado'),
(2, 2, 2, 7.5, 0.8, 'Aprovado'),
(3, 3, 3, 6.8, 0.7, 'Reprovado'),
(4, 4, 4, 9.2, 0.95, 'Aprovado'),
(5, 5, 5, 7.9, 0.88, 'Aprovado'),
(6, 6, 6, 8.1, 0.91, 'Aprovado'),
(7, 7, 7, 7.5, 0.6, 'Reprovado'),
(8, 8, 8, 9.0, 0.92, 'Aprovado'),
(9, 9, 9, 8.7, 0.89, 'Aprovado'),
(10, 10, 10, 7.4, 0.85, 'Aprovado'),
(11, 11, 11, 8.3, 0.86, 'Aprovado'),
(12, 12, 12, 9.5, 0.96, 'Aprovado'),
(13, 13, 13, 8.7, 0.78, 'Aprovado'),
(14, 14, 14, 8.9, 0.93, 'Aprovado'),
(15, 15, 15, 7.8, 0.87, 'Aprovado'),
(16, 16, 16, 9.3, 0.94, 'Aprovado'),
(17, 17, 17, 8.2, 0.84, 'Aprovado'),
(18, 18, 18, 8.6, 0.97, 'Aprovado'),
(19, 19, 19, 6.9, 0.6, 'Reprovado'),
(20, 20, 20, 6.5, 0.7, 'Reprovado');	


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

-- Inserções para a tabela LogStatus
INSERT INTO LogStatus (Id_Aluno, Status_Antigo, Status_Novo, Data_Mudanca) VALUES
(1, 'Ativo', 'Ativo', NOW()),
(2, 'Ativo', 'Ativo', NOW()),
(3, 'Ativo', 'Inativo', NOW()),
(4, 'Ativo', 'Ativo', NOW()),
(5, 'Ativo', 'Ativo', NOW()),
(6, 'Ativo', 'Ativo', NOW()),
(7, 'Ativo', 'Inativo', NOW()),
(8, 'Ativo', 'Ativo', NOW()),
(9, 'Ativo', 'Ativo', NOW()),
(10, 'Ativo', 'Ativo', NOW()),
(11, 'Ativo', 'Ativo', NOW()),
(12, 'Ativo', 'Ativo', NOW()),
(13, 'Ativo', 'Inativo', NOW()),
(14, 'Ativo', 'Ativo', NOW()),
(15, 'Ativo', 'Ativo', NOW()),
(16, 'Ativo', 'Ativo', NOW()),
(17, 'Ativo', 'Ativo', NOW()),
(18, 'Ativo', 'Ativo', NOW()),
(19, 'Ativo', 'Inativo', NOW()),
(20, 'Ativo', 'Inativo', NOW());


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
