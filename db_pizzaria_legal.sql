drop database db_pizzaria_legal;
create database db_pizzaria_legal;
use  db_pizzaria_legal;

create table tb_categorias(
id bigint auto_increment,
categoria varchar(255) not null,
descricao varchar (255) not null,
primary key(id)
);
create table tb_pizzas(
id bigint auto_increment,
tamanho varchar(50),
preco decimal,
disponibilidade decimal,
ingredientes varchar(255) not null,
categoria_id bigint,
primary key(id),
foreign key(categoria_id)references tb_categorias(id)
);

select * from tb_categorias;
Insert INTO tb_categorias (categoria,descricao) values ("Margherita","Pizza clássica italiana com molho de tomate, queijo mussarela e manjericão.");
Insert INTO tb_categorias (categoria,descricao) values ("Pepperoni","Pizza com molho de tomate, queijo mussarela e pepperoni picante.");
Insert INTO tb_categorias (categoria,descricao) values ("Vegetariana","Pizza com uma variedade de vegetais, como pimentão, cogumelos, azeitonas, etc.");
Insert INTO tb_categorias (categoria,descricao) values ("Havaiana","Pizza com molho de tomate, queijo, presunto e abacaxi.");
Insert INTO tb_categorias (categoria,descricao) values ("Quatro Queijos","Pizza com quatro tipos diferentes de queijo, como mussarela, parmesão, gorgonzola e provolone.");

select * from tb_pizzas;
Insert INTO tb_pizzas (tamanho,preco,disponibilidade,ingredientes,categoria_id) values ("Grande",40.00,35,"Queijo,tomate e manjericão",1);
Insert INTO tb_pizzas (tamanho,preco,disponibilidade,ingredientes,categoria_id) values ("Broto",24.00,10,"Queijo,tomate e manjericão",1);
Insert INTO tb_pizzas (tamanho,preco,disponibilidade,ingredientes,categoria_id) values ("Media",32.00,50,"Queijo,tomate e manjericão",1);
Insert INTO tb_pizzas (tamanho,preco,disponibilidade,ingredientes,categoria_id) values ("Grande",46.00,35,"Peperone,tomate e queijo",2);
Insert INTO tb_pizzas (tamanho,preco,disponibilidade,ingredientes,categoria_id) values ("Media",32.00,80,"Vegetais,cogumelos e azeitonas",3);
Insert INTO tb_pizzas (tamanho,preco,disponibilidade,ingredientes,categoria_id) values ("Grande",100.00,100,"Queijo,presunto e abacaxi",4);
Insert INTO tb_pizzas (tamanho,preco,disponibilidade,ingredientes,categoria_id) values ("Grande",58.00,60,"4 tipo de queijo diferentes",5);
Insert INTO tb_pizzas (tamanho,preco,disponibilidade,ingredientes,categoria_id) values ("Media",42.00,30,"4 tipo de queijo diferentes",5);

SELECT * FROM tb_pizzas where preco>45;
SELECT * FROM tb_pizzas where preco between 50.00 and 100.00;
SELECT * FROM tb_pizzas WHERE categoria LIKE"M%";
SELECT tamanho,preco,disponibilidade,ingredientes from tb_pizzas inner join tb_categorias on tb_categorias.id = tb_pizzas.categoria_id;

SELECT tb_pizzas.*, tb_categorias.categoria AS categoria, tb_categorias.descricao
FROM tb_pizzas INNER JOIN tb_categorias ON tb_pizzas.categoria_id = tb_categorias.id WHERE tb_categorias.categoria = 'Quatro Queijos';



