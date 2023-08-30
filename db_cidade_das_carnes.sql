drop database  db_cidade_das_carnes;
CREATE DATABASE db_cidade_das_carnes;

USE db_cidade_das_carnes;
CREATE TABLE tb_categoria (
  id bigint auto_increment,
  classes varchar(50),
  descricao varchar(50),
  primary key(id)
);

CREATE TABLE tb_produtos (
  id bigint auto_increment,
  nome varchar(50) not null,
  preco decimal(10,2),
  dosagem decimal(10,2),
  indicacao enum("todos"),
  categoria_id bigint,
  primary key(id),
  foreign key (categoria_id) references tb_categoria(id)
);


INSERT INTO tb_categoria (classes, descricao) VALUES ("Carnes Bovinas", "Produtos de carne derivados do gado bovino.");

INSERT INTO tb_categoria (classes, descricao) VALUES ("Carnes Suínas", "Produtos de carne derivados de porcos.");

INSERT INTO tb_categoria (classes, descricao) VALUES ("Embutidos", "Produtos de carne processada");

INSERT INTO tb_categoria (classes, descricao) VALUES ("Aves", "Carne derivada de aves, como frango e peru.");

INSERT INTO tb_produtos (nome, preco, dosagem, indicacao, categoria_id) VALUES ("Fraldinha de Angus", 45.50, 300, "todos", 1);
INSERT INTO tb_produtos (nome, preco, dosagem, indicacao, categoria_id) VALUES ("Lombo de Porco", 10.99, 500, "todos", 2);
INSERT INTO tb_produtos (nome, preco, dosagem, indicacao, categoria_id) VALUES ("Salame Italiano", 25.50, 200, "todos", 3);
INSERT INTO tb_produtos (nome, preco, dosagem, indicacao, categoria_id) VALUES ("Peito de Frango Orgânico", 19.99, 400, 'todos', 4);
INSERT INTO tb_produtos (nome, preco, dosagem, indicacao, categoria_id) VALUES ("Maminha de Angus", 60.00, 600, "todos", 1);
INSERT INTO tb_produtos (nome, preco, dosagem, indicacao, categoria_id) VALUES ("Costelinha de Porco", 14.99, 300, "todos", 2);
INSERT INTO tb_produtos (nome, preco, dosagem, indicacao, categoria_id) VALUES ("Salchichón Espanhol", 19.50, 120, "todos", 3);
INSERT INTO tb_produtos (nome, preco, dosagem, indicacao, categoria_id) VALUES ("Coxa de Frango à Passarinho", 12.75, 200, "todos", 4);

SELECT * FROM tb_produtos;

SELECT * FROM tb_produtos WHERE preco > 50.00;

SELECT * FROM tb_produtos WHERE preco BETWEEN 50.00 AND 150.00;

SELECT * FROM tb_produtos WHERE nome LIKE "%C%";

SELECT nome, preco, dosagem, indicacao 
FROM tb_produtos
INNER JOIN tb_categoria ON tb_categoria.id = tb_produtos.categoria_id;

SELECT tb_produtos.*, tb_categoria.classes AS categoria, tb_categoria.descricao
FROM tb_produtos
INNER JOIN tb_categoria ON tb_produtos.categoria_id = tb_categoria.id
WHERE tb_categoria.classes = "Embutidos";