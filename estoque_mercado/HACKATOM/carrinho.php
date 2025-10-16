<?php
session_start();

include('conexao.php'); // Conecta ao banco de dados

// Função para adicionar um produto ao carrinho
if (isset($_GET['add_to_cart'])) {
    $product_id = $_GET['add_to_cart'];
    
    $sql = "SELECT nome_produto, preco, imagem, quantidade FROM produtos WHERE id = '$product_id'";
    $result = $mysqli->query($sql) or die("Erro ao buscar produto: " . $mysqli->error);
    
    if ($result->num_rows > 0) {
        $product = $result->fetch_assoc();

        if ($product['quantidade'] > 0) { // Verifica se há estoque disponível
            $_SESSION['cart'][$product_id] = [
                'id' => $product_id,
                'name' => $product['nome_produto'],
                'price' => $product['preco'],
                'quantity' => isset($_SESSION['cart'][$product_id]) ? $_SESSION['cart'][$product_id]['quantity'] + 1 : 1,
                'image' => $product['imagem']
            ];
        } else {
            echo "Produto sem estoque!";
        }
    }
}

// Função para remover um produto do carrinho
if (isset($_GET['remove_from_cart'])) {
    $product_id = $_GET['remove_from_cart'];
    unset($_SESSION['cart'][$product_id]);
}

// Função para atualizar a quantidade de um produto no carrinho
if (isset($_GET['update_quantity']) && isset($_GET['quantity'])) {
    $product_id = $_GET['update_quantity'];
    $new_quantity = $_GET['quantity'];

    if ($new_quantity > 0) {
        $_SESSION['cart'][$product_id]['quantity'] = $new_quantity;
    } else {
        unset($_SESSION['cart'][$product_id]);
    }
}

// Função para finalizar a compra
if (isset($_GET['finalizar_compra'])) {
    foreach ($_SESSION['cart'] as $product_id => $product) {
        $quantity = $product['quantity'];

        // Verifica o estoque atual
        $sql_check_stock = "SELECT quantidade FROM produtos WHERE id = '$product_id'";
        $result_stock = $mysqli->query($sql_check_stock);
        $product_stock = $result_stock->fetch_assoc();

        if ($product_stock['quantidade'] >= $quantity) {
            // Atualiza o estoque caso haja disponibilidade
            $sql_update = "UPDATE produtos SET quantidade = quantidade - '$quantity' WHERE id = '$product_id'";
            $mysqli->query($sql_update) or die("Erro ao atualizar estoque: " . $mysqli->error);
        } else {
            echo "Estoque insuficiente para o produto: " . $product['name'] . "<br>";
        }
    }

// Limpa o carrinho após finalizar a compra
$_SESSION['cart'] = [];
?>
<div id="sucesso-compra" class="mensagem-sucesso">
    Compra finalizada com sucesso!
</div>
<script>
    setTimeout(() => {
        document.getElementById('sucesso-compra').style.display = 'none';
    }, 5000); // Oculta a mensagem após 5 segundos
</script>
<?php

}

// Processa o método de pagamento e exibe o QR Code
$payment_method = null;
if (isset($_GET['payment_method'])) {
    $payment_method = $_GET['payment_method'];
}
?>
<!DOCTYPE html>
<html lang="pt-BR">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Carrinho de Compras</title>
    <script>
        function updateQuantity(productId, newQuantity) {
            window.location.href = `?update_quantity=${productId}&quantity=${newQuantity}`;
        }
    </script>
    <style>
        body {
            font-family: 'Arial', sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f5f5f5;
            color: #333;
        }

        .barra-topo {
            display: flex;
            justify-content: space-between;
            align-items: center;
            background-color: #007bff;
            color: white;
            padding: 15px 20px;
        }

        .barra-topo a {
            color: white;
            text-decoration: none;
            font-weight: bold;
        }

        .container {
            width: 90%;
            max-width: 1200px;
            margin: 20px auto;
            padding: 20px;
            background-color: #fff;
            box-shadow: 0 2px 8px rgba(0, 0, 0, 0.1);
            border-radius: 8px;
        }

        .carrinho-produto {
            display: flex;
            align-items: center;
            margin-bottom: 20px;
            border-bottom: 1px solid #eee;
            padding-bottom: 20px;
        }

        .carrinho-produto img {
            max-width: 120px;
            border-radius: 8px;
            margin-right: 20px;
        }

        .produto-detalhes {
            flex-grow: 1;
        }

        .produto-detalhes h3 {
            margin: 0;
            font-size: 20px;
        }

        .produto-detalhes p {
            margin: 5px 0;
            font-size: 16px;
        }

        .remover-produto {
            display: inline-block;
            padding: 5px 10px;
            color: white;
            background-color: #dc3545;
            text-decoration: none;
            font-weight: bold;
            border-radius: 4px;
            transition: background-color 0.3s ease;
            margin-top: 10px;
        }

        .remover-produto:hover {
            background-color: #c82333;
        }

        .forma-pagamento {
            margin-top: 20px;
        }

        .forma-pagamento select,
        .forma-pagamento button {
            padding: 10px;
            margin-top: 10px;
        }

        .qr-code {
            text-align: center;
            margin-top: 20px;
        }

        .qr-code img {
            max-width: 150px;
            margin-top: 10px;
        }

        .endereco-container {
            margin-top: 20px;
            padding: 15px;
            background-color: #f9f9f9;
            border: 1px solid #ddd;
            border-radius: 8px;
        }

        .endereco-container h2 {
            font-size: 20px;
            margin-bottom: 10px;
        }

        .endereco-container textarea {
            width: 100%;
            height: 80px;
            resize: none;
            padding: 10px;
            font-size: 16px;
            border: 1px solid #ccc;
            border-radius: 4px;
        }
        .finalizar-compra {
            display: inline-block;
            margin-top: 10px;
            padding: 10px 20px;
            background-color: #28a745;
            color: white;
            text-decoration: none;
            font-weight: bold;
            border-radius: 4px;
            transition: background-color 0.3s ease;
        }

        .finalizar-compra:hover {
            background-color: #218838;
        }
    .mensagem-sucesso {
        position: fixed;
        top: 50%;
        left: 50%;
        transform: translate(-50%, -50%);
        background-color: #28a745;
        color: white;
        padding: 20px 40px;
        border-radius: 8px;
        font-size: 18px;
        font-weight: bold;
        box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
        z-index: 1000;
        text-align: center;
    }

    .qr-code form {
        display: flex;
        flex-direction: column;
        gap: 15px;
        max-width: 400px;
        margin: 20px auto;
    }

    .qr-code label {
        font-weight: bold;
    }

    .qr-code input {
        padding: 10px;
        font-size: 16px;
        border: 1px solid #ccc;
        border-radius: 4px;
        width: 100%;
    }

    .qr-code button {
        padding: 10px;
        font-size: 16px;
        font-weight: bold;
        color: white;
        background-color: #007bff;
        border: none;
        border-radius: 4px;
        cursor: pointer;
    }

    .qr-code button:hover {
        background-color: #0056b3;
    }


    </style>
</head>
<body>
    <div class="barra-topo">
        <h1>Carrinho de Compras</h1>
        <a href="painel.php">Voltar para Produtos</a>
        <a href="logout.php">Sair</a>
    </div>

    <div class="container">
        <?php if (!empty($_SESSION['cart'])): ?>
            <?php $total = 0; ?>
            <?php foreach ($_SESSION['cart'] as $product): ?>
                <div class="carrinho-produto">
                    <img src="<?= $product['image'] ?>" alt="<?= $product['name'] ?>">
                    <div class="produto-detalhes">
                        <h3><?= $product['name'] ?></h3>
                        <p>Preço: R$ <?= number_format($product['price'], 2, ',', '.') ?></p>
                        <p>
                            Quantidade: 
                            <input type="number" value="<?= $product['quantity'] ?>" min="1" onchange="updateQuantity(<?= $product['id'] ?>, this.value)">
                        </p>
                        <a href="?remove_from_cart=<?= $product['id'] ?>" class="remover-produto">Remover Produto</a>
                    </div>
                </div>
                <?php $total += $product['price'] * $product['quantity']; ?>
            <?php endforeach; ?>

            <div class="total">
                <strong>Total: R$ <?= number_format($total, 2, ',', '.') ?></strong>
            </div>
            <div class="forma-pagamento">
            <h2>Escolha a forma de pagamento:</h2>
    <form method="get">
        <select name="payment_method" required>
            <option value="pix" <?= isset($_GET['payment_method']) && $_GET['payment_method'] === 'pix' ? 'selected' : '' ?>>PIX</option>
            <option value="boleto" <?= isset($_GET['payment_method']) && $_GET['payment_method'] === 'boleto' ? 'selected' : '' ?>>Boleto</option>
            <option value="cartao" <?= isset($_GET['payment_method']) && $_GET['payment_method'] === 'cartao' ? 'selected' : '' ?>>Cartão de Crédito</option>
        </select>
        <button type="submit">Confirmar</button>
    </form>


    <?php if ($payment_method): ?>
        <div class="qr-code">
    <h3>Pagamento via <?= strtoupper($payment_method) ?></h3>
    <?php
    if ($payment_method === 'pix') {
        echo '<img src="assets/qr_code.jpg" alt="QR Code do Pix">';
    } elseif ($payment_method === 'boleto') {
        echo '<img src="assets/boleto.jpg" alt="Imagem do Boleto" style="width:1100px; height:auto;">';
    }
    elseif ($payment_method === 'cartao') {
        // Formulário para informações do cartão de crédito
        echo '
                <form method="post" action="processar_pagamento.php">
            <label for="card_number">Nome do titular:</label>
            <input type="text" id="card_number" name="card_number" placeholder="Digite o nome do titular do cartão:" required>
        <form method="post" action="processar_pagamento.php">
            <label for="card_number">Número do Cartão:</label>
            <input type="text" id="card_number" name="card_number" placeholder="Digite o número do cartão" required>
            
            <label for="card_expiry">Validade (MM/AA):</label>
            <input type="text" id="card_expiry" name="card_expiry" placeholder="MM/AA" required>
            
            <label for="card_cvv">CVV:</label>
            <input type="text" id="card_cvv" name="card_cvv" placeholder="Digite o CVV" required>
            

        </form>';
    } else {
        echo '<p>Método de pagamento não reconhecido!</p>';
    }
    ?>
</div>
    <?php endif; ?>

            <div class="endereco-container">
    <h2>Endereço para entrega</h2>
    <form>
        <div class="form-group">
            <label for="cep">CEP:</label>
            <input type="text" id="cep" name="cep" placeholder="Digite seu CEP" required>
        </div>
        <div class="form-group">
            <label for="rua">Rua:</label>
            <input type="text" id="rua" name="rua" placeholder="Digite sua rua" required>
        </div>
        <div class="form-group">
            <label for="numero">Número:</label>
            <input type="text" id="numero" name="numero" placeholder="Digite o número" required>
        </div>
        <div class="form-group">
            <label for="complemento">Complemento:</label>
            <input type="text" id="complemento" name="complemento" placeholder="Digite o complemento (opcional)">
        </div>
        <div class="form-group">
            <label for="bairro">Bairro:</label>
            <input type="text" id="bairro" name="bairro" placeholder="Digite o bairro" required>
        </div>
        <div class="form-group">
            <label for="cidade">Cidade:</label>
            <input type="text" id="cidade" name="cidade" placeholder="Digite a cidade" required>
        </div>
        <div class="form-group">
            <label for="estado">Estado:</label>
            <input type="text" id="estado" name="estado" placeholder="Digite o estado" required>
        </div>

    </form>
</div>
       <a href="?finalizar_compra=true" class="finalizar-compra">Finalizar Compra</a>
        <?php else: ?>
            <p class="empty-message">Seu carrinho está vazio!</p>
        <?php endif; ?>
    </div>
</body>
</html>
