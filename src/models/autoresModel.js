var database = require("../database/config");

function listar() {
    
    var instrucaoSql = `
        SELECT 
            * 
        FROM autor;
    `;
    console.log("Executando a instrução SQL: \n" + instrucaoSql);
    return database.executar(instrucaoSql);
}

function cadastrar(nome) {
    
    var instrucaoSql = `
        INSERT INTO autor (nome) VALUES ('${nome}');
    `;
    console.log("Executando a instrução SQL: \n" + instrucaoSql);
    return database.executar(instrucaoSql);
}


function rankingAutores(){
    var instrucaoSql = `
        SELECT autor.nome, livro.titulo, livro.precoCompra, livro.precoVenda 
            FROM livro
                JOIN autor ON autor.id = livro.fkAutor
                ORDER BY precoCompra DESC LIMIT 3;
    `;
    console.log("Executando a instrução SQL: \n" + instrucaoSql);
    return database.executar(instrucaoSql);
}

module.exports = {
    listar,
    cadastrar,
    rankingAutores
}
