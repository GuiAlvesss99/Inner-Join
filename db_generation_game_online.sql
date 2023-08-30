drop database db_generation_game_online;
CREATE DATABASE db_generation_game_online;

USE db_generation_game_online;

CREATE TABLE tb_classes (
    id BIGINT AUTO_INCREMENT,
    tipopersonagem VARCHAR(255) NOT NULL,
    descricaopersonagem VARCHAR(255) NOT NULL,
    PRIMARY KEY (id)
);

CREATE TABLE tb_personagens (
    id BIGINT AUTO_INCREMENT,
    nomedopers VARCHAR(255) NOT NULL,
    niveldopers DECIMAL,
    poderdeataque DECIMAL,
    poderdedefesa DECIMAL,
    classeid BIGINT,
    PRIMARY KEY (id),
    FOREIGN KEY (classeid) REFERENCES tb_classes (id)
);

SELECT * FROM tb_classes;

INSERT INTO tb_classes (tipopersonagem, descricaopersonagem) VALUES
    ("Atirador", "Função de atacar inimigos de longa distância"),
    ("Suporte", "Ajudar o atirador e criar jogadas"),
    ("Meio", "Função mais importante, nela você consegue rotacionar para outras rotas"),
    ("Jungler", "Função fazer os monstros da selva para melhor experiência"),
    ("Top", "Responsável por controlar a rota superior e ajudar em lutas e objetivos");

SELECT * FROM tb_personagens;

INSERT INTO tb_personagens (nomedopers, niveldopers, poderdeataque, poderdedefesa, classeid) VALUES
    ("Draven", 10, 10000, 1000, 1),
    ("Camille", 10, 8000, 5000, 5),
    ("Arzir", 6, 7000, 6000, 3),
    ("Malphite", 5, 4000, 10000, 5),
    ("Janna", 6, 500, 2000, 2),
    ("Cho'ga", 3, 8000, 10000, 5),
    ("Ashe", 2, 8000, 1000, 1),
    ("Samira", 10, 10000, 1000, 1);

SELECT * FROM tb_personagens WHERE poderdeataque > 2000;
SELECT * FROM tb_personagens WHERE poderdedefesa BETWEEN 1000 AND 2000;
SELECT * FROM tb_personagens WHERE nomedopers LIKE 'C%';

SELECT tb_personagens.nomedopers, tb_personagens.niveldopers, tb_personagens.poderdeataque, tb_personagens.poderdedefesa, tb_classes.tipopersonagem
FROM tb_personagens
INNER JOIN tb_classes ON tb_classes.id = tb_personagens.classeid;

SELECT tb_personagens.nomedopers, tb_classes.tipopersonagem
FROM tb_personagens
INNER JOIN tb_classes ON tb_classes.id = tb_personagens.classeid
WHERE tb_classes.tipopersonagem = 'Atirador';