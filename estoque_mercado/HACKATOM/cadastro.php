<?php
include('conexao.php'); // Inclui a conexão com o banco de dados

if (isset($_POST['usuario']) && isset($_POST['senha'])) {
    $usuario = trim($mysqli->real_escape_string($_POST['usuario']));
    $senha = trim($_POST['senha']);

    if (strlen($usuario) == 0) {
        echo "<script>alert('Usuário não informado.');</script>";
    } elseif (strlen($senha) == 0) {
        echo "<script>alert('Preencha sua senha.');</script>";
    } else {
        // Insere diretamente a senha no banco (texto puro)
        $sql_code = "INSERT INTO usuarios (usuario, senha) VALUES ('$usuario', '$senha')";

        if ($mysqli->query($sql_code)) {
            echo "<script>alert('Usuário cadastrado com sucesso!');</script>";
            echo "<script>window.location.href = 'index.php';</script>"; // Redireciona para a página de login
        } else {
            echo "Erro ao cadastrar usuário: " . $mysqli->error;
        }
    }
}
?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Cadastro</title>
    <style>
        body {
            font-family: Arial, Helvetica, sans-serif;
            background-image: linear-gradient(45deg, black, silver); /* Fundo preto e prata */
            margin: 0;
            padding: 0;
            height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center; /* Centraliza o conteúdo verticalmente */
            color: whitesmoke;
        }
        .tela-cadastro {
            background-color: rgba(0, 0, 0, 0.8); /* Fundo preto semi-transparente */
            padding: 60px;
            border-radius: 20px;
            box-shadow: 0 5px 15px rgba(0, 0, 0, 0.5); /* Sombra */
            text-align: center;
        }
        .tela-cadastro h1 {
            font-size: 24px;
            margin-bottom: 20px;
        }
        input, button {
            width: 100%;
            padding: 15px;
            margin-bottom: 15px;
            border-radius: 5px;
            border: none;
        }
        input::placeholder {
            color: #ccc; /* Cor do placeholder */
        }
        input {
            font-size: 16px;
            border: 1px solid #ccc; /* Borda dos inputs */
        }
        button {
            background-color: dodgerblue;
            color: white;
            font-size: 18px;
            font-weight: bold;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }
        button:hover {
            background-color: deepskyblue; /* Cor ao passar o mouse */
        }
        .rodape {
            margin-top: 20px;
            font-size: 14px;
        }
        .rodape a {
            color: dodgerblue;
            text-decoration: none;
        }
        .rodape a:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>
    <div class="tela-cadastro">
        <h1>Cadastro</h1>
        <form action="" method="POST">
            <input type="text" name="usuario" placeholder="Usuário" required>
            <input type="password" name="senha" placeholder="Senha" required>
            <button type="submit">Cadastrar</button>
        </form>
        <div class="rodape">
            <p>Já tem uma conta? <a href="index.php">Faça login</a></p>
        </div>
    </div>
</body>
</html>
