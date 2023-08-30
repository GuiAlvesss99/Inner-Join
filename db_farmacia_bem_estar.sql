create database db_farmacia_bem_estar;
use db_farmacia_bem_estar;
CREATE TABLE  tb_categoria(

id bigint auto_increment,
classes varchar(255),
descricao varchar(255),
primary key(id)
);

CREATE TABLE  tb_produtos(
id bigint auto_increment,
nome varchar(255) not null,
preco decimal(10,2),
dosagem decimal(10,2),
indicacao enum("todos", "criança", "idoso" ),
categoria_id bigint,
primary key(id),
foreign key (categoria_id) references tb_categoria(id)
);

INSERT INTO tb_categoria(classes, descricao) values ("Medicamentos", "Produtos farmacêuticos");
INSERT INTO tb_categoria(classes, descricao) values ("Suplementos", "Produtos adicionais de nutrição");
INSERT INTO tb_categoria(classes, descricao) values ("Higiene Pessoal", "Produtos para higiene.");
INSERT INTO tb_categoria(classes, descricao) values ("Dermocosméticos", "Produtos dermatológicas e cosméticas.");

INSERT INTO tb_produtos (nome, preco, dosagem, indicacao, categoria_id) VALUES ("Predinisolona", 44.99, 500, "todos", 1);
INSERT INTO tb_produtos (nome, preco, dosagem, indicacao, categoria_id) VALUES ("Vitamina C", 15.99, 400, "todos", 2);
INSERT INTO tb_produtos (nome, preco, dosagem, indicacao, categoria_id) VALUES ("Shampoo Neutro", 8.75, 500, "todos", 3);
INSERT INTO tb_produtos (nome, preco, dosagem, indicacao, categoria_id) VALUES ("Hidratante", 20.25, 100, "todos", 4);
INSERT INTO tb_produtos (nome, preco, dosagem, indicacao, categoria_id) VALUES ("Domperidona", 60.00, 250, "todos", 1);
INSERT INTO tb_produtos (nome, preco, dosagem, indicacao, categoria_id) VALUES ("Leite em Pó Infantil", 30.75, 1000, "criança", 2);
INSERT INTO tb_produtos (nome, preco, dosagem, indicacao, categoria_id) VALUES ("Creme Dental", 6.99, 100, "todos", 3);
INSERT INTO tb_produtos (nome, preco, dosagem, indicacao, categoria_id) VALUES ("Creme Antienvelhecimento", 34.99, 100, "idoso", 4);

SELECT * FROM tb_produtos;

SELECT * FROM tb_produtos WHERE preco >50.00;

SELECT * FROM tb_produtos where preco between 5.00 and 60.00;

SELECT * FROM tb_produtos WHERE nome Like "%C%"; 

SELECT nome,preco,dosagem,indicacao from tb_produtos inner join tb_categoria on tb_categoria.id = tb_produtos.categoria_id;

SELECT tb_produtos.*, tb_categoria.classes AS categoria, tb_categoria.descricao
FROM tb_produtos
INNER JOIN tb_categoria ON tb_produtos.categoria_id = tb_categoria.id
WHERE tb_categoria.classes = "Dermocosméticos";