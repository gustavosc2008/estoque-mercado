-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 13/08/2025 às 19:35
-- Versão do servidor: 10.4.32-MariaDB
-- Versão do PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `sistema`
--

-- --------------------------------------------------------

--
-- Estrutura para tabela `carrinho`
--

CREATE TABLE `carrinho` (
  `id` int(11) NOT NULL,
  `id_produto` int(11) NOT NULL,
  `nome_produto` varchar(255) DEFAULT NULL,
  `preco` decimal(10,2) DEFAULT NULL,
  `quantidade` int(11) NOT NULL,
  `imagem` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `produtos`
--

CREATE TABLE `produtos` (
  `id` int(11) NOT NULL,
  `nome_produto` varchar(50) NOT NULL,
  `preco` decimal(10,0) NOT NULL,
  `quantidade` int(50) NOT NULL,
  `descricao` varchar(50) NOT NULL,
  `data_validade` date NOT NULL,
  `fornecedor` varchar(20) NOT NULL,
  `imagem` varchar(255) DEFAULT NULL,
  `categoria` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `produtos`
--

INSERT INTO `produtos` (`id`, `nome_produto`, `preco`, `quantidade`, `descricao`, `data_validade`, `fornecedor`, `imagem`, `categoria`) VALUES
(25, 'Café Premium', 26, 91, 'Café torrado e moído de alta qualidade', '2025-12-31', 'Café do Brasil', '/imagem/cafe_premium.jpg', 'mercearia'),
(26, 'Arroz Integral', 11, 148, 'Arroz integral orgânico', '2026-03-22', 'Grãos Naturais', '/imagem/arroz_integral.jpg', 'mercearia'),
(27, 'Óleo de Soja', 8, 166, 'Óleo de soja 100% puro', '2026-08-25', 'Alimentos Puro', '/imagem/oleo_soja.jpg', 'mercearia'),
(28, 'Farinha de Trigo', 4, 109, 'Farinha de trigo refinada', '2024-11-10', 'Moinho Fortaleza', '/imagem/farinha_trigo.jpg', 'mercearia'),
(29, 'Açúcar Cristal', 6, 88, 'Açúcar cristal de cana', '2026-05-01', 'Açúcares Delícia', '/imagem/acucar_cristal.jpg', 'mercearia'),
(30, 'Leite Integral', 5, 146, 'Leite integral pasteurizado', '2025-10-20', 'Laticínios Puro Leit', '/imagem/leite_integral.jpg', 'frios'),
(31, 'Queijo Mussarela', 16, 59, 'Queijo mussarela fresco', '2025-12-15', 'Queijos Ouro', '/imagem/queijo_mussarela.jpg', 'frios'),
(32, 'Frango Congelado', 20, 70, 'Frango congelado cortado', '2025-02-18', 'Aviários São Jorge', '/imagem/frango_congelado.jpg', 'açougue'),
(33, 'Carne Bovina', 35, 50, 'Carne bovina de primeira', '2025-04-09', 'Carne Premium', '/imagem/carne_bovina.jpg', 'açougue'),
(34, 'Tomate', 5, 200, 'Tomate fresco e selecionado', '2026-07-30', 'Hortifrúti Verde', '/imagem/tomate.jpg', 'hortifruti'),
(35, 'Cebola', 3, 300, 'Cebola roxa e branca', '2026-01-25', 'Cebolinhas do Campo', '/imagem/cebola.jpg', 'hortifruti'),
(36, 'Batata Doce', 4, 148, 'Batata doce orgânica', '2025-09-10', 'Raízes da Terra', '/imagem/batata_doce.jpg', 'hortifruti'),
(37, 'Pão de Forma', 8, 118, 'Pão de forma fresco', '2025-07-17', 'Pães da Vovó', '/imagem/pao_de_forma.jpg', 'padaria'),
(38, 'Suco de Laranja', 6, 89, 'Suco de laranja natural', '2026-06-22', 'Sucos Frescos', '/imagem/suco_laranja.jpg', 'bebidas'),
(39, 'Chocolate ao Leite', 9, 47, 'Chocolate ao leite cremoso', '2026-09-13', 'Delícias Chocolate', '/imagem/chocolate_ao_leite.jpg', 'mercearia'),
(40, 'Biscoito Recheado', 4, 179, 'Biscoito recheado de chocolate', '2025-12-01', 'Biscoitos São João', '/imagem/biscoito_recheado.jpg', 'mercearia'),
(41, 'Refrigerante Cola', 5, 187, 'Refrigerante de cola 350ml', '2025-11-20', 'Refrigerantes ABC', '/imagem/refrigerante_cola.jpg', 'bebidas'),
(43, 'Cerveja Pilsen', 10, 100, 'Cerveja pilsen gelada', '2025-08-05', 'Cervejas do Sul', '/imagem/cerveja_pilsen.jpg', 'bebidas'),
(44, 'Feijão Preto', 7, 134, 'O feijão preto é perfeito para receitas tradiciona', '2025-12-31', 'Caldao', '/imagem/feijao.jpg', 'mercearia'),
(158, 'Sabão em Pó', 13, 100, 'Sabão em pó para limpeza pesada', '2027-01-01', 'Limpex', '/imagem/sabao_po.jpg', 'limpeza'),
(159, 'Detergente Líquido Concentrado 1L', 4, 150, 'Detergente líquido para louças', '2026-12-31', 'Limpex', '/imagem/detergente_liquido.jpg', 'limpeza'),
(160, 'Desinfetante Multiuso', 5, 130, 'Desinfetante multiuso para superfícies', '2026-11-30', 'CleanAll', '/imagem/desinfetante_multiuso.jpg', 'limpeza'),
(161, 'Água Sanitária Clorada 1L', 4, 200, 'Água sanitária com cloro', '2027-02-01', 'LimpezaMax', '/imagem/agua_sanitaria.jpg', 'limpeza'),
(162, 'Amaciante Concentrado 1L', 7, 150, 'Amaciante para roupas', '2026-12-30', 'PerfumeLar', '/imagem/amaciante.jpg', 'limpeza'),
(163, 'Limpador de Vidros 500ml', 6, 70, 'Spray para limpeza de vidros', '2026-10-10', 'VidroClear', '/imagem/limpador_vidros.jpg', 'limpeza'),
(164, 'Esponja de Aço 8 unid', 2, 200, 'Esponja de aço para limpeza pesada', '2027-01-01', 'Inox Clean', '/imagem/esponja_aco.jpg', 'limpeza'),
(166, 'Lustra Móveis 500ml', 7, 70, 'Lustra móveis para madeira', '2026-08-10', 'BrilhoLar', '/imagem/lustra_moveis.jpg', 'limpeza'),
(170, 'Álcool em Gel 500ml', 6, 140, 'Gel desinfetante para as mãos', '2026-10-10', 'HigiBem', '/imagem/alcool_gel.jpg', 'limpeza'),
(171, 'Esponja Dupla Face 3 unid', 2, 180, 'Esponjas duplas para limpeza', '2026-12-01', 'Casa Limpa', '/imagem/esponja_dupla.jpg', 'limpeza'),
(175, 'Saco de Lixo 50L (10 unid)', 9, 150, 'Sacos de lixo resistentes', '2027-04-01', 'EcoPlast', '/imagem/saco_lixo.jpg', 'limpeza'),
(176, 'Queijo Parmesão', 18, 40, 'Queijo parmesão em pedaços', '2025-06-01', 'Queijaria Real', '/imagem/queijo_parmesao.jpg', 'frios'),
(177, 'Coxa de Frango Congelada 1kg', 14, 60, 'Coxas de frango congeladas', '2025-07-20', 'Avícola Brasil', '/imagem/coxa_frango.jpg', 'açougue'),
(179, 'Brócolis Ninja', 6, 55, 'Brócolis ninja fresco, unidade', '2025-04-30', 'Hortifruti Natural', '/imagem/brocolis.jpg', 'hortifruti'),
(180, 'Cenoura 1kg', 4, 80, 'Cenoura fresca, pacote 1kg', '2025-05-10', 'Hortifruti Natural', '/imagem/cenoura.jpg', 'hortifruti'),
(181, 'Batata Inglesa 1kg', 4, 100, 'Batata inglesa branca', '2025-04-22', 'Hortifruti Total', '/imagem/batata_inglesa.jpg', 'hortifruti'),
(182, 'Pão Integral Fatiado 500g', 8, 60, 'Pão integral', '2025-05-01', 'Padaria Sabor', '/imagem/pao.jpg', 'padaria'),
(183, 'Suco de Maçã 1L', 6, 90, 'Suco de maçã integral', '2025-09-01', 'FrutBrasil', '/imagem/suco_maca.jpg', 'bebidas'),
(184, 'Chocolate Amargo 70%', 7, 80, 'Tablete de chocolate amargo', '2026-03-01', 'CacauFino', '/imagem/chocolate_amargo.jpg', 'mercearia'),
(185, 'Biscoito Maisena 200g', 3, 120, 'Biscoito tipo maisena', '2025-11-01', 'Biscoitos Real', '/imagem/biscoito_maisena.jpg', 'mercearia'),
(186, 'Refrigerante Guaraná 2L', 7, 100, 'Refrigerante de guaraná', '2026-01-15', 'RefriSabor', '/imagem/refri_guarana.jpg', 'bebidas'),
(187, 'Vinho Tinto Seco 750ml', 20, 40, 'Vinho de mesa tinto seco', '2028-01-01', 'Vinícola Nova', '/imagem/vinho.jpg', 'bebidas'),
(188, 'Cerveja Lager 350ml', 3, 100, 'Cerveja clara tipo lager', '2025-12-10', 'BrewHouse', '/imagem/cerveja.jpg', 'bebidas'),
(189, 'Cerveja IPA 350ml', 4, 80, 'Cerveja tipo IPA lata', '2025-11-15', 'BrewHouse', '/imagem/cerveja_ipa.jpg', 'bebidas'),
(190, 'Feijão Fradinho 1kg', 8, 60, 'Feijão fradinho', '2026-08-30', 'Legumex', '/imagem/fraldinho.jpg', 'mercearia'),
(191, 'Requeijão Cremoso 200g', 6, 58, 'Requeijão tradicional', '2025-07-01', 'Laticínios Centro', '/imagem/requeijao.jpg', 'frios'),
(192, 'Sardinha em Lata 125g', 5, 70, 'Sardinha em óleo', '2026-11-25', 'Pescados do Mar', '/imagem/sardinha_lata.jpg', 'mercearia'),
(193, 'Atum em Lata 170g', 7, 60, 'Atum sólido em água', '2026-07-10', 'Pescados do Mar', '/imagem/atum_lata.jpg', 'mercearia'),
(194, 'Leite Desnatado 1L', 5, 90, 'Leite UHT desnatado', '2025-11-15', 'Laticínios Vida', '/imagem/leite_desnatado.jpg', 'frios'),
(195, 'Manteiga com Sal 200g', 8, 60, 'Manteiga tradicional', '2025-06-20', 'Laticínios Vida', '/imagem/manteiga.jpg', 'frios'),
(196, 'Iogurte Natural 170g', 4, 70, 'Iogurte integral sem açúcar', '2025-05-25', 'Laticínios Vida', '/imagem/iogurte_natural.jpg', 'frios'),
(197, 'Mortadela Fatiada 200g', 5, 50, 'Mortadela suína fatiada', '2025-05-30', 'Frigorífico Master', '/imagem/mortadela.jpg', 'frios'),
(198, 'Presunto Cozido 200g', 7, 55, 'Presunto cozido e fatiado', '2025-05-30', 'Frigorífico Master', '/imagem/presunto.jpg', 'frios'),
(199, 'Mussarela Ralada 150g', 6, 70, 'Queijo mussarela ralado', '2025-07-15', 'Laticínios Real', '/imagem/mussarela_ralada.jpg', 'frios'),
(200, 'Hambúrguer Bovino 500g', 15, 60, '4 unidades de hambúrguer de carne', '2025-08-10', 'FrigoSul', '/imagem/hamburguer.jpg', 'açougue'),
(201, 'Peito de Peru 200g', 10, 50, 'Peito de peru defumado fatiado', '2025-07-25', 'AviDelícia', '/imagem/peitod_peru.jpg', 'frios'),
(202, 'Peixe Merluza Congelado 1kg', 19, 40, 'Filés de merluza congelados', '2025-09-01', 'Pescados do Mar', '/imagem/merluza.jpg', 'açougue'),
(203, 'Peixe Salmão em Postas 1kg', 50, 20, 'Postas de salmão congeladas', '2025-08-01', 'Pescados do Mar', '/imagem/salmao.jpg', 'açougue'),
(204, 'Camarão Congelado 400g', 30, 35, 'Camarão descascado', '2025-07-01', 'Pescados do Mar', '/imagem/camarao.jpg', 'açougue'),
(205, 'Caranguejo Desfiado 200g', 16, 25, 'Carne de caranguejo congelada', '2025-09-10', 'Pescados do Mar', '/imagem/caranguejo.jpg', 'açougue'),
(206, 'Feijão Branco 1kg', 11, 80, 'Feijão branco tipo 1', '2026-02-15', 'Legumex', '/imagem/feijao_branco.jpg', 'mercearia'),
(207, 'Feijão Vermelho 1kg', 9, 70, 'Feijão vermelho tipo 1', '2026-01-25', 'Legumex', '/imagem/feijao_vermelho.jpg', 'mercearia'),
(208, 'Lentilha 500g', 8, 90, 'Lentilha seca', '2026-04-01', 'Grãos & Cia', '/imagem/lentilha.jpg', 'mercearia'),
(209, 'Grão-de-Bico 500g', 11, 65, 'Grão-de-bico cru', '2026-05-01', 'Grãos & Cia', '/imagem/grao_bico.jpg', 'mercearia'),
(210, 'Ervilha Seca 500g', 7, 75, 'Ervilha seca', '2026-06-15', 'Grãos & Cia', '/imagem/ervilha_seca.jpg', 'mercearia'),
(211, 'Azeite de Oliva 500ml', 20, 80, 'Azeite extra virgem', '2027-01-01', 'OliveImport', '/imagem/azeite_oliva.jpg', 'mercearia'),
(212, 'Vinagre de Maçã 500ml', 6, 70, 'Vinagre de maçã orgânico', '2027-01-01', 'Acidez Brasil', '/imagem/vinagre_maca.jpg', 'mercearia'),
(213, 'Molho Shoyu 150ml', 4, 90, 'Molho shoyu tradicional', '2027-02-01', 'OrientalFood', '/imagem/shoyu.jpg', 'mercearia'),
(214, 'Molho Inglês 150ml', 5, 60, 'Molho inglês clássico', '2027-02-01', 'MolhosUnião', '/imagem/molho_ingles.jpg', 'mercearia'),
(215, 'Molho Pesto 200g', 10, 50, 'Molho pesto manjericão', '2026-10-10', 'MolhosUnião', '/imagem/pesto.jpg', 'mercearia'),
(216, 'Molho Barbecue 320g', 8, 50, 'Molho barbecue defumado', '2026-10-10', 'MolhosUnião', '/imagem/barbecue.jpg', 'mercearia'),
(217, 'Ketchup Picante 350g', 5, 60, 'Ketchup com pimenta', '2026-08-15', 'CondimentosBR', '/imagem/ketchup_picant.jpg', 'mercearia'),
(218, 'Mostarda Escura 350g', 5, 60, 'Mostarda tipo dijon', '2026-08-15', 'CondimentosBR', '/imagem/mostarda_escura.jpg', 'mercearia'),
(219, 'Farofa Pronta 300g', 5, 70, 'Farofa temperada', '2026-12-01', 'Sabores do Sertão', '/imagem/farofa_pronta.jpg', 'mercearia'),
(220, 'Macarrão Fusilli 500g', 4, 80, 'Massa tipo fusilli', '2026-07-10', 'MassaMania', '/imagem/fusili.jpg', 'mercearia'),
(221, 'Macarrão Penne 500g', 4, 70, 'Massa tipo penne', '2026-07-10', 'MassaMania', '/imagem/penne.jpg', 'mercearia'),
(222, 'Papinha Bebê 120g', 4, 50, 'Papinha sabor legumes', '2025-07-10', 'Bebê Saudável', '/imagem/papinha.jpg', 'mercearia'),
(223, 'Creme de Leite 200g', 4, 90, 'Lata de creme de leite', '2026-10-10', 'DoceLar', '/imagem/creme_leite.jpg', 'mercearia'),
(224, 'Leite Condensado 395g', 5, 100, 'Lata de leite condensado', '2026-10-10', 'DoceLar', '/imagem/leite_condensado.jpg', 'mercearia'),
(225, 'Leite em Pó Integral 400g', 8, 80, 'Leite em pó instantâneo', '2027-01-01', 'Laticínios Vida', '/imagem/leite_po.jpg', 'mercearia'),
(226, 'Chá Verde 10 sachês', 4, 60, 'Chá verde em sachê', '2026-09-01', 'Chás da Serra', '/imagem/cha_verde.jpg', 'bebidas'),
(227, 'Chá de Camomila 10 sachês', 4, 60, 'Chá de camomila em sachê', '2026-09-01', 'Chás da Serra', '/imagem/cha_camomila.jpg', 'bebidas'),
(228, 'Café Solúvel 200g', 11, 49, 'Café instantâneo', '2026-12-01', 'CaféInstant', '/imagem/cafe_soluvel.jpg', 'mercearia'),
(229, 'Cacau em Pó 200g', 8, 40, 'Cacau 100% em pó', '2026-12-01', 'CacauFino', '/imagem/cacau_po.jpg', 'mercearia'),
(230, 'Fermento Biológico 10g', 2, 60, 'Fermento para pão', '2026-08-01', 'Fermentare', '/imagem/ferm_bio.jpg', 'mercearia'),
(231, 'Fermento Químico 100g', 4, 70, 'Fermento para bolos', '2026-11-01', 'Fermentare', '/imagem/ferm_quimico.jpg', 'mercearia'),
(232, 'Gelatina de Uva 30g', 2, 80, 'Gelatina sabor uva', '2027-05-01', 'Doce Sabor', '/imagem/gelatina_uva.jpg', 'mercearia'),
(233, 'Amido de Milho 200g', 4, 90, 'Amido de milho refinado', '2027-05-01', 'CozinhaFina', '/imagem/amido.jpg', 'mercearia'),
(234, 'Levedo de Cerveja 100g', 6, 50, 'Suplemento alimentar', '2027-02-01', 'NaturalFit', '/imagem/levedo.jpg', 'mercearia'),
(235, 'Aveia em Flocos 250g', 4, 70, 'Aveia em flocos finos', '2026-11-01', 'NaturalFit', '/imagem/aveia.jpg', 'mercearia'),
(236, 'Granola Tradicional 200g', 7, 60, 'Granola com castanhas', '2026-10-01', 'NaturalFit', '/imagem/granola.jpg', 'mercearia'),
(237, 'Barra de Cereal 25g', 2, 90, 'Barra de cereal sabor banana', '2025-10-10', 'VivaBem', '/imagem/barra_cereal.jpg', 'mercearia'),
(238, 'Massa para Pizza 500g', 6, 40, 'Disco de pizza pré-assado', '2025-11-01', 'Padaria Sabor', '/imagem/massa_pizza.jpg', 'padaria'),
(239, 'Pão de Queijo Congelado 400g', 9, 50, 'Mini pães de queijo', '2025-09-01', 'Mineirinho', '/imagem/pao_queijo.jpg', 'padaria'),
(240, 'Sorvete de Chocolate 1L', 12, 30, 'Sorvete cremoso chocolate', '2026-12-01', 'Gelateria Real', '/imagem/sorvete_choc.jpg', 'congelados'),
(241, 'Sorvete de Creme 1L', 12, 30, 'Sorvete sabor creme', '2026-12-01', 'Gelateria Real', '/imagem/sorvete_creme.jpg', 'congelados'),
(242, 'Biscoito Integral 200g', 4, 80, 'Biscoito integral sabor natural', '2025-10-01', 'Biscoitos Real', '/imagem/bisc_integral.jpg', 'mercearia'),
(243, 'Cookie de Chocolate 100g', 4, 70, 'Cookie crocante', '2025-09-01', 'Doces & Cia', '/imagem/cookie_choc.jpg', 'mercearia'),
(244, 'Torrada Light 160g', 4, 60, 'Torrada integral', '2025-12-01', 'Padaria Sabor', '/imagem/torrada_light.jpg', 'padaria'),
(245, 'Geleia de Morango 230g', 7, 50, 'Geleia artesanal', '2026-05-01', 'Doces do Campo', '/imagem/geleia_morango.jpg', 'mercearia'),
(246, 'Geleia de Uva 230g', 7, 50, 'Geleia artesanal', '2026-05-01', 'Doces do Campo', '/imagem/geleia_uva.jpg', 'mercearia'),
(247, 'Doce de Leite 400g', 7, 40, 'Doce de leite cremoso', '2026-02-01', 'Doces do Campo', '/imagem/doce_leite.jpg', 'mercearia'),
(248, 'Marmelada 300g', 6, 35, 'Doce de marmelo', '2026-03-01', 'Doces do Campo', '/imagem/marmelada.jpg', 'mercearia'),
(249, 'Tapioca 500g', 5, 50, 'Goma de tapioca pronta', '2026-12-01', 'SertãoPuro', '/imagem/tapioca.jpg', 'mercearia'),
(250, 'Polvilho Azedo 500g', 3, 60, 'Para pão de queijo e biscoitos', '2026-11-01', 'SertãoPuro', '/imagem/polvilho_azedo.jpg', 'mercearia'),
(251, 'Polvilho Doce 500g', 3, 60, 'Para preparo de receitas doces', '2026-11-01', 'SertãoPuro', '/imagem/polvilho_doce.jpg', 'mercearia'),
(252, 'Batata Palha 120g', 4, 70, 'Batata palha crocante', '2025-09-01', 'Delícia Salgada', '/imagem/batata_palha.jpg', 'mercearia'),
(253, 'Alho Triturado 200g', 6, 50, 'Alho já triturado', '2026-08-01', 'TemperoBom', '/imagem/alho_triturado.jpg', 'mercearia'),
(254, 'Cebola em Flocos 80g', 4, 40, 'Cebola desidratada em flocos', '2026-10-01', 'TemperoBom', '/imagem/cebola_flocos.jpg', 'mercearia'),
(255, 'Farinha de Rosca 300g', 3, 70, 'Para empanados', '2026-09-01', 'MoinhoReal', '/imagem/farinha_rosca.jpg', 'mercearia'),
(256, 'Castanha de Caju 200g', 15, 40, 'Castanha de caju torrada', '2025-12-01', 'NatureMix', '/imagem/castanha_caju.jpg', 'mercearia'),
(257, 'Castanha do Pará 200g', 16, 40, 'Castanha do pará fresca', '2025-12-01', 'NatureMix', '/imagem/castanhad_para.jpg', 'mercearia'),
(258, 'Amendoim Torrado 200g', 4, 60, 'Amendoim sem pele', '2025-11-01', 'NatureMix', '/imagem/amendoim.jpg', 'mercearia'),
(259, 'Nozes Chilenas 150g', 17, 30, 'Nozes importadas', '2026-04-01', 'NatureMix', '/imagem/nozes_chile.jpg', 'mercearia'),
(260, 'Uva Passa Branca 100g', 4, 60, 'Uva passa clara', '2026-10-01', 'Frutas Secas BR', '/imagem/uva_branca.jpg', 'mercearia'),
(261, 'Uva Passa Preta 100g', 4, 60, 'Uva passa escura', '2026-10-01', 'Frutas Secas BR', '/imagem/uva_preta.jpg', 'mercearia'),
(262, 'Banana Chips 100g', 4, 50, 'Banana desidratada crocante', '2026-07-01', 'Frutas Secas BR', '/imagem/banana_chips.jpg', 'mercearia'),
(263, 'Maçã Desidratada 80g', 5, 40, 'Maçã seca em fatias', '2026-07-01', 'Frutas Secas BR', '/imagem/maca_desidratada.jpg', 'mercearia'),
(264, 'Suco Detox Verde 1L', 10, 30, 'Suco detox com couve e maçã', '2025-09-10', 'FrutBrasil', '/imagem/suco_detox.jpg', 'bebidas'),
(265, 'Suco de Abacaxi 1L', 7, 40, 'Suco 100% abacaxi', '2025-09-10', 'FrutBrasil', '/imagem/suco_abacaxi.jpg', 'bebidas'),
(266, 'Água de Coco 1L', 8, 60, 'Bebida de água de coco', '2025-11-01', 'CocoMar', '/imagem/agua_coco.jpg', 'bebidas'),
(267, 'Guaraná Zero 2L', 7, 55, 'Refrigerante guaraná zero', '2025-12-01', 'RefriSabor', '/imagem/guarana_zero.jpg', 'bebidas'),
(268, 'Caldo de Galinha 57g', 2, 90, 'Tabletes de caldo de galinha', '2026-08-01', 'SaborCaseiro', '/imagem/caldo_galinha.jpg', 'mercearia'),
(269, 'Caldo de Carne 57g', 2, 90, 'Tabletes de caldo de carne', '2026-08-01', 'SaborCaseiro', '/imagem/caldo_carne.jpg', 'mercearia'),
(270, 'Sabonete Líquido 250ml', 6, 90, 'Sabonete líquido para limpeza diária', '2026-12-01', 'HigiBem', '/imagem/sabonete_liquid.jpg', 'limpeza');

-- --------------------------------------------------------

--
-- Estrutura para tabela `usuarios`
--

CREATE TABLE `usuarios` (
  `id` int(11) NOT NULL,
  `usuario` varchar(50) NOT NULL,
  `senha` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `usuarios`
--

INSERT INTO `usuarios` (`id`, `usuario`, `senha`) VALUES
(25, '1234', '$2y$10$gJtvwKUTdE2DCE/TFCyB5.FmjgujvdKT7LGb/6uH9o7y9sAoU/GCW'),
(26, '1234', '$2y$10$Y4PAlpnLNJIHiYq5YOdbU.ok3hyYr9WJWT5E6.xGjBQoQq6EbVNAK'),
(27, '1234', '$2y$10$qV7EfCwTXdF8BVyBPHqRx.brUiJIh1P/hITLyGGdUamjBtk1h7gI2'),
(28, '1234', '$2y$10$DGA86ysDl/.jj9lAQQR7/.ZYhTAXG/IGlN0eA2JPklMkXOgq6J4Lq'),
(29, '1234', '$2y$10$TwCTkObgSBF.H9Crt8oPkeU5/K5qlIWg65bfRWEGGOY.2/OyK7Td2'),
(30, '1234', '$2y$10$ASJoKPTfgd1gEhauA5IvEOq7w92EgNebzsmUyKQmXPtwBouwtyfte'),
(31, '1234', '$2y$10$IXvYXb5.BMB7QDNMaNb5L.KkWJ7ai5GUVgSBWe8irbC55UlT8Ulge'),
(32, 'oi', '$2y$10$RxcUpJU4wUx6WFMfp558Bu0P/FyxxAAyRrmxrqr7oit03RHTDIksS'),
(33, '1234', '$2y$10$bnfIiBdz5M7koxH7noTka.S9NZNvgO9U2P9igVMB.3101mP1S2KrS'),
(34, '1234', '$2y$10$.rvkvX1D6HSoRdTKlXzq9eU8FAVjZMokJKr4S1IVQf.Ir/KKlzhxW'),
(35, '1234', '$2y$10$MGEbiASiHjLrk3DH2Lnzq.UZtg5cEQfkBrISE1lA/pllm7MjVcFzC'),
(36, '1234', '$2y$10$WhmvVQQjLIICw6XHqrASteSu1oq8Dgt6up5APF/RqYxg24M6lwhaq'),
(37, '1234', '$2y$10$N21vuw3uDUvsW/HNgwdp3e8pE4F3u/P3pRmrepfvVU39eCwEHL5Nu'),
(38, '1234', '$2y$10$OGGr9LPCB6pd9AZy9SJZa.9Gust3u7h4lAwxeC/WfJQ.P.qP8WABe'),
(39, '1234', '$2y$10$sFTMwBCNkIliwQHSEeZuUOv5iyAvcQrsClH.QAocECz6Kn/EINixC'),
(40, 'Noah11', '$2y$10$fuj0qc3fzfUmmmEA62c7t.J1aa74m6m04OLDdwK0YRTrb7GlaWY3K'),
(41, '1234', '$2y$10$YR.cRRnebZl6XtY1DqKzruiE3qdozQGnJwdYrCmPfeLwpmbm2bnJq'),
(42, 'teste11', '$2y$10$0WoRJ3qDo97IzXRnL6lk4elzTZxtSFE3wOGz96zeOtxkgN9TYVSMu'),
(43, 'noah', '123');

--
-- Índices para tabelas despejadas
--

--
-- Índices de tabela `carrinho`
--
ALTER TABLE `carrinho`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_produto` (`id_produto`);

--
-- Índices de tabela `produtos`
--
ALTER TABLE `produtos`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `imagem_unica` (`imagem`);

--
-- Índices de tabela `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT para tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `carrinho`
--
ALTER TABLE `carrinho`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `produtos`
--
ALTER TABLE `produtos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=271;

--
-- AUTO_INCREMENT de tabela `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=44;

--
-- Restrições para tabelas despejadas
--

--
-- Restrições para tabelas `carrinho`
--
ALTER TABLE `carrinho`
  ADD CONSTRAINT `carrinho_ibfk_1` FOREIGN KEY (`id_produto`) REFERENCES `produtos` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
