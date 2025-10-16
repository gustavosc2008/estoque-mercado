<?php
session_start();

// Verifica se o usuário está logado
if (!isset($_SESSION['id'])) {
    header("Location: index.php");
    exit;
}

// Inclui a conexão com o banco de dados
include('conexao.php');

// Busca todos os produtos no banco de dados
$sql_code = "SELECT * FROM produtos";
$sql_query = $mysqli->query($sql_code) or die("Erro ao buscar produtos: " . $mysqli->error);

$produtos = [];
if ($sql_query->num_rows > 0) {
    while ($row = $sql_query->fetch_assoc()) {
        $produtos[] = $row;
    }
}
?>
<!DOCTYPE html>
<html lang="pt-BR">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Painel de Produtos</title>
    <style>
        body {
            background-image: url('assets/mercad.jpg');
            background-size: cover;
            background-repeat: no-repeat;
            background-attachment: fixed;
            margin: 0;
            font-family: Arial, Helvetica, sans-serif;
        }
        .barra-topo {
            display: flex;
            justify-content: space-between;
            align-items: center;
            background-color: white;
            color: #343a40;
            border-bottom: 1px solid #ccc;
            padding: 10px 20px;
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
        }
        .barra-topo h1 {
            margin: 0;
            font-size: 24px;
        }
        .barra-topo .links {
            display: flex;
            gap: 15px;
        }
        .barra-topo a {
            text-decoration: none;
            color: white;
            font-size: 16px;
            padding: 10px 15px;
            border-radius: 5px;
        }
        .suporte {
            background-color: white;
            margin-right: 30px;
        }
        .sair {
            background-color: #dc3545;
        }
        .carrinho {
            background-color: white;
            padding: 10px 15px;
            border-radius: 5px;
            display: flex;
            align-items: center;
        }
        .carrinho span {
            margin-left: 2px;
            font-size: 18px;
        }
        .container {
            display: flex;
            flex-wrap: wrap;
            gap: 20px;
            padding: 20px;
            justify-content: center;
        }
        .box {
            border: 1px solid #ccc;
            padding: 15px;
            width: 250px;
            text-align: center;
            border-radius: 10px;
            box-shadow: 2px 2px 10px rgba(0, 0, 0, 0.1);
            background-color: white;
        }
        .imagem-produto {
            height: 150px;
            background-color: white;
            margin-bottom: 10px;
            display: flex;
            align-items: center;
            justify-content: center;
        }
        .imagem-produto img {
            max-width: 100%;
            max-height: 100%;
            object-fit: contain;
        }
        .comprar {
            background-color: #28a745;
            color: white;
            border: none;
            padding: 10px;
            cursor: pointer;
            border-radius: 5px;
            text-decoration: none;
            display: inline-block;
        }
        .comprar:hover {
            background-color: #218838;
        }
        .rodape {
            background-color: #343a40;
            color: white;
            text-align: center;
            padding: 15px;
            position: relative;
            bottom: 0;
            width: 100%;
        }
    </style>
</head>
<body>
    <div class="barra-topo">
        <h1>Bem-vindo ao Painel</h1>
        <div class="links">
            <a href="carrinho.php" class="carrinho">
                <img src="assets/lolo.jpg" alt="Carrinho" style="width: 34px; height: 34px;">
                <span>
                    <?php 
                        $cart_count = 0;
                        if (isset($_SESSION['cart'])) {
                            foreach ($_SESSION['cart'] as $product) {
                                $cart_count += $product['quantity'];
                            }
                        }
                        echo $cart_count;
                    ?>
                </span>
            </a>
            <a href="#rodape" class="suporte">
                <img src="assets/sup.jpg" alt="suporte" style="width: 34px; height: 34px;">
            </a>
            <a href="logout.php" class="sair">Sair</a>
        </div>
    </div>

    <div class="container">
        <?php
        if (!empty($produtos)) {
            foreach ($produtos as $produto) {
                echo "<div class='box'>";
                echo "<div class='imagem-produto'>";
                echo "<img src='{$produto['imagem']}' alt='Imagem do Produto'>";
                echo "</div>";
                echo "<h3>{$produto['nome_produto']}</h3>";
                echo "<p><strong>Preço:</strong> R$ {$produto['preco']}</p>";
                echo "<p><strong>Estoque:</strong> {$produto['quantidade']}</p>";
                echo "<p>{$produto['descricao']}</p>";
                echo "<a href='carrinho.php?add_to_cart={$produto['id']}' class='comprar'>Adicionar ao Carrinho</a>";
                echo "</div>";
            }
        } else {
            echo "<div class='mensagem'>Nenhum produto disponível no momento.</div>";
        }
        ?>
    </div>

    <div class="rodape" id="rodape">
        <p>CNPJ: 00.000.000/0001-00</p>
        <p>Suporte: <a href="mailto:naturalvillesuporte@gmail.com" style="color: white;">naturalvillesuporte@gmail.com</a> | Telefone: (11) 99999-9999</p>
    </div>
</body>
</html>
