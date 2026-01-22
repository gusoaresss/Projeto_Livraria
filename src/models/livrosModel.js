var database = require("../database/config");

function listar() {

    var instrucaoSql = `
        select 
livro.id,
livro.titulo,
livro.precoCompra,
livro.precoVenda,
livro.qtdEstoque,
autor.nome as nomeAutor,
genero.nome as nomeGenero
 from livro join autor on autor.id = livro.fkAutor join genero on genero.id = livro.fkGenero;
 
    `;
    console.log("Executando a instrução SQL: \n" + instrucaoSql);
    return database.executar(instrucaoSql);
}



function cadastrar(titulo, fkAutor, fkGenero, precoCompra, precoVenda, qtdEstoque) {

    var instrucaoSql = `
        INSERT INTO livro (titulo, fkAutor, fkGenero, precoCompra, precoVenda, qtdEstoque) VALUES ('${titulo}', '${fkAutor}', '${fkGenero}', '${precoCompra}', '${precoVenda}','${qtdEstoque}');
    `;
    console.log("Executando a instrução SQL: \n" + instrucaoSql);
    return database.executar(instrucaoSql);
}

function editar(novoPrecoCompra, novoPrecoVenda, id) {

    var instrucaoSql = `
        UPDATE livro 
        SET precoCompra = '${novoPrecoCompra}', 
            precoVenda = '${novoPrecoVenda}'
        WHERE id = ${id};
    `;
    console.log("Executando a instrução SQL: \n" + instrucaoSql);
    return database.executar(instrucaoSql);
}

/*função abaixo é para listar o grafico de quantidade de livros cadastrados por categoria*/

function graficoQtdLivrosCategoria(){
     var instrucaoSql = `
     SELECT genero.nome, SUM(livro.qtdEstoque)
        FROM livro JOIN genero ON genero.id = livro.fkGenero
        GROUP BY genero.nome ;`;
      
    console.log("Executando a instrução SQL: \n" + instrucaoSql);
    return database.executar(instrucaoSql);
}

function generoComMaiorQuantidade(){
    var instrucaoSql = `
     SELECT genero.nome, SUM(livro.qtdEstoque)
        FROM livro JOIN genero ON genero.id = livro.fkGenero
        GROUP BY genero.nome 
        ORDER BY SUM(livro.qtdEstoque) DESC LIMIT 1;
`;
      
    console.log("Executando a instrução SQL: \n" + instrucaoSql);
    return database.executar(instrucaoSql);
}


module.exports = {
    listar,
    cadastrar,
    editar,
    graficoQtdLivrosCategoria,
    generoComMaiorQuantidade
}
