CREATE DATABASE TWEEB;
USE TWEEB;
SHOW TABLES;

CREATE TABLE usuario (
	id_usuario INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(255) NOT NULL,
    email VARCHAR(150) NOT NULL,
    senha VARCHAR(100) NOT NULL,
    cpf CHAR(11) NOT NULL,
    rg CHAR(10) NOT NULL,
    cep CHAR(8) NOT NULL,
    endereco VARCHAR(255) NOT NULL,
    perfil CHAR(30) NOT NULL,
    avatar VARCHAR(255) NOT NULL,
    id_favorito INT,
	FOREIGN KEY (id_favorito) REFERENCES favoritos (id_favorito)
    
);
CREATE TABLE favoritos (
	id_favorito INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    nome_produto VARCHAR(255) NOT NULL
    
);
CREATE TABLE fornecedor (
	id_fornecedor INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
	nome_fornecedor VARCHAR(150) NOT NULL,
	marca_fornecedor VARCHAR(150) NOT NULL,
	cnpj CHAR(14) NOT NULL,
	nome_fantasia VARCHAR(50) NOT NULL,
	endereco_fornecedor VARCHAR(255) NOT NULL
    
);
CREATE TABLE departamento (
	id_departamento INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    nome_departamento VARCHAR(150) NOT NULL

);
CREATE TABLE produto (
	id_produto INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
	nome VARCHAR(100) NOT NULL,
	descricao TEXT NOT NULL,
	quantidade INT NOT NULL,
	preco_unid DECIMAL(10,2) NOT NULL,
	marca VARCHAR(100) NOT NULL,
	classificacao_produto VARCHAR(150) NOT NULL,
	id_departamento INT,
	id_fornecedor INT,
	id_favorito INT ,
	id_compra_personalizada INT,
    FOREIGN KEY (id_departamento) REFERENCES departamento (id_departamento),
    FOREIGN KEY (id_fornecedor) REFERENCES fornecedor (id_fornecedor),
    FOREIGN KEY (id_favorito) REFERENCES favoritos (id_favorito),
    FOREIGN KEY (id_compra_personalizada) REFERENCES compra_personalizada (id_compra_personalizada)

);
CREATE TABLE compra_personalizada (
	id_compra_personalizada INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    classificacao_usuario VARCHAR(45) NOT NULL,
    id_questionario INT,
    id_usuario INT,
    id_favorito INT,
    FOREIGN KEY (id_questionario) REFERENCES questionario (id_questionario),
    FOREIGN KEY (id_usuario) REFERENCES usuario (id_usuario),
    FOREIGN KEY (id_favorito) REFERENCES favoritos (id_favorito)

);
CREATE TABLE questionario (
	id_questionario INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    conhecimento_tecnico VARCHAR(3) NOT NULL,
    tipo_hardware_periferico VARCHAR(15) NOT NULL,
    tipo_compra_pessoal_corporativa VARCHAR(15) NOT NULL,
    id_usuario INT,
    id_favorito INT,
    FOREIGN KEY (id_usuario) REFERENCES usuario (id_usuario),
    FOREIGN KEY (id_favorito) REFERENCES favoritos (id_favorito)

);
CREATE TABLE servico (
	id_servico INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    tipo_produto VARCHAR(255) NOT NULL,
    endereco VARCHAR(255) NOT NULL,
    valor DECIMAL(10,2) NOT NULL,
    prazo DATE NOT NULL,
    tipo_conserto VARCHAR(255) NOT NULL,
    descricao_defeito TEXT,
    email VARCHAR(150) NOT NULL,
    imagem VARCHAR(255) NOT NULL,
    ordem_de_servico VARCHAR(45) NOT NULL,
    status_da_ordem VARCHAR(45) NOT NULL,
    id_usuario INT,
    FOREIGN KEY (id_usuario) REFERENCES usuario (id_usuario)

);
CREATE TABLE compra (
	id_compra INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    valor_compra DECIMAL (10,2) NOT NULL,
    quantidade_compra INT NOT NULL,
    id_produto INT,
    id_servico INT,
    id_usuario INT,
    FOREIGN KEY (id_produto) REFERENCES produto (id_produto),
    FOREIGN KEY (id_servico) REFERENCES servico (id_servico),
    FOREIGN KEY (id_usuario) REFERENCES usuario (id_usuario)

);
CREATE TABLE carrinho (
	id_carrinho INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    valor_total DECIMAL(10,2) NOT NULL,
    quantidade_total VARCHAR(255) NOT NULL,
    id_servico INT,
    id_usuario INT,
    id_compra INT,
    FOREIGN KEY (id_servico) REFERENCES servico(id_servico),
    FOREIGN KEY (id_usuario) REFERENCES  usuario (id_usuario),
    FOREIGN KEY (id_compra) REFERENCES compra (id_compra)

);
CREATE TABLE pagamento (
	id_pagamento INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    valor DECIMAL(10,2) NOT NULL,
    data_p DATETIME NOT NULL,
    id_servico INT,
    id_carrinho INT,
    id_compra INT,
    id_usuario INT,
    FOREIGN KEY (id_servico) REFERENCES servico (id_servico),
    FOREIGN KEY (id_carrinho) REFERENCES carrinho (id_carrinho),
    FOREIGN KEY (id_compra) REFERENCES compra (id_compra),
    FOREIGN KEY (id_usuario) REFERENCES usuario (id_usuario)

);
CREATE TABLE comprovantepagamento (
	id_comprovante INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    descricao_compra VARCHAR(255) NOT NULL,
    pagamento VARCHAR(45) NOT NULL,
    nome VARCHAR(100) NOT NULL,
    endereco VARCHAR(150) NOT NULL,
    telefone VARCHAR(11) NOT NULL,
    email VARCHAR(150) NOT NULL,
    id_pagamento INT,
    id_servico INT,
    id_usuario INT,
    id_carrinho INT,
    id_compra INT,
    FOREIGN KEY (id_pagamento) REFERENCES pagamento (id_pagamento),
    FOREIGN KEY (id_servico) REFERENCES servico (id_servico),
    FOREIGN KEY (id_usuario) REFERENCES usuario (id_usuario),
    FOREIGN KEY (id_carrinho) REFERENCES carrinho (id_carrinho),
    FOREIGN KEY (id_compra) REFERENCES compra (id_compra)
    
);
CREATE TABLE envio (
	id_envio INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    nome_destinatario CHAR(50) NOT NULL,
    cep CHAR(8) NOT NULL,
    data_entrega DATETIME NOT NULL,
    conteudo TEXT NOT NULL,
    id_pagamento INT,
    id_servico INT,
    id_compra INT,
    id_carrinho INT,
    id_usuario INT,
    FOREIGN KEY (id_pagamento) REFERENCES pagamento (id_pagamento),
    FOREIGN KEY (id_servico) REFERENCES servico (id_servico),
    FOREIGN KEY (id_compra) REFERENCES compra (id_compra),
    FOREIGN KEY (id_carrinho) REFERENCES carrinho (id_carrinho),
    FOREIGN KEY (id_usuario) REFERENCES usuario (id_usuario)
    
);




