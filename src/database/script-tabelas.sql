
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


/*cada livro tem uma quantidade ou seja, se cadastrei um livro de romance, 
e coloquei que ele tem 4 no estoque, e depois cadastrei outro livro de romance e coloquei 4, 
então ele tem 8 no estoque. preciso pegar todos os livros e somar a quantidade deles em cada categoria*/

SELECT genero.nome, SUM(livro.qtdEstoque)
FROM livro JOIN genero ON genero.id = livro.fkGenero
GROUP BY genero.nome ;


/*top 3 autores mais caros*/
SELECT autor.nome, livro.titulo, livro.precoCompra, livro.precoVenda 
FROM livro
JOIN autor ON autor.id = livro.fkAutor
ORDER BY precoCompra DESC LIMIT 3;



/*Genero com maior quantidade de livros + quantidade */

SELECT genero.nome, SUM(livro.qtdEstoque)
FROM livro JOIN genero ON genero.id = livro.fkGenero
GROUP BY genero.nome 
ORDER BY SUM(livro.qtdEstoque) DESC LIMIT 1;








 
 