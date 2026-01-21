-- Arquivo de apoio, caso você queira criar tabelas como as aqui criadas para a API funcionar.
-- Você precisa executar os comandos no banco de dados para criar as tabelas,
-- ter este arquivo aqui não significa que a tabela em seu BD estará como abaixo!

CREATE DATABASE livrariaRecuperacao20261;

USE livrariaRecuperacao20261;

CREATE TABLE autor (
	id INT PRIMARY KEY AUTO_INCREMENT,
	nome VARCHAR(50)
);

CREATE TABLE genero (
	id INT PRIMARY KEY AUTO_INCREMENT,
	nome VARCHAR(50)
);

CREATE TABLE livro (
	id INT PRIMARY KEY AUTO_INCREMENT,
	titulo VARCHAR(50),
    fkAutor INT,
    fkGenero INT,
    precoCompra DOUBLE,
    precoVenda DOUBLE,
    CONSTRAINT fk_livro_autor FOREIGN KEY (fkAutor) REFERENCES autor(id),
    CONSTRAINT fk_livro_genero FOREIGN KEY (fkGenero) REFERENCES genero(id),
    qtdEstoque INT
);


SELECT * FROM livro;

INSERT INTO genero(nome) VALUES
('Horror'),
('Romance'),
('Fantasia'),
('Poesia');


SELECT * FROM genero;

INSERT INTO autor(nome) VALUES
('Gustavo');


SELECT * FROM autor;
 
