<?php
include('conexao.php'); // Inclui a conexão com o banco de dados

$mensagemErro = ""; // Inicializa a mensagem de erro vazia

if (isset($_POST['usuario']) && isset($_POST['senha'])) {
    if (strlen($_POST['usuario']) == 0) {
        $mensagemErro = "Usuário não informado";
    } else if (strlen($_POST['senha']) == 0) {
        $mensagemErro = "Preencha sua senha";
    } else {
        $usuario = $mysqli->real_escape_string($_POST['usuario']);
        $senha = $mysqli->real_escape_string($_POST['senha']);

        // Busca o usuário no banco de dados
        $sql_code = "SELECT * FROM usuarios WHERE usuario = '$usuario' AND senha = '$senha'";
        $sql_query = $mysqli->query($sql_code) or die("Falha na execução do código SQL: " . $mysqli->error);

        $quantidade = $sql_query->num_rows;

        if ($quantidade == 1) {
            $usuario = $sql_query->fetch_assoc();

            // Inicia a sessão e redireciona para o painel
            if (!isset($_SESSION)) {
                session_start();
            }
            $_SESSION['id'] = $usuario['id'];
            $_SESSION['nome'] = $usuario['nome'];
            header("Location: painel.php");
            exit;
        } else {
            $mensagemErro = "Falha ao logar! Usuário ou senha incorretos.";
        }
    }
}
?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login</title>
    <style>
        body {
            font-family: Arial, Helvetica, sans-serif;
            background-image: linear-gradient(45deg, black, silver);
            margin: 0;
            padding: 0;
            height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;
        }
        .tela-login {
            background-color: rgba(0, 0, 0, 0.8);
            padding: 60px;
            border-radius: 20px;
            color: whitesmoke;
            box-shadow: 0 5px 15px rgba(0, 0, 0, 0.5);
        }
        input, button {
            width: 100%;
            padding: 15px;
            margin-top: 10px;
            border-radius: 5px;
            border: none;
        }
        input::placeholder {
            color: #ccc;
        }
        button {
            background-color: dodgerblue;
            color: white;
            font-size: 18px;
            cursor: pointer;
        }
        button:hover {
            background-color: deepskyblue;
        }
        .extra-options {
            display: flex;
            flex-direction: column;
            align-items: center;
            margin-top: 20px;
        }
        .extra-options a {
            color: dodgerblue;
            text-decoration: none;
            font-size: 16px;
        }
        .extra-options a:hover {
            text-decoration: underline;
        }
        .mensagem-erro {
            color: red;
            margin-top: 10px;
            font-size: 16px;
            text-align: center;
        }
    </style>
</head>
<body>
    <div class="tela-login">
        <h1 style="text-align: center; margin-bottom: 20px;">Login</h1>
        <form action="" method="POST" style="display: flex; flex-direction: column; align-items: center; width: 100%; max-width: 300px; margin: 0 auto;">
            <input type="text" name="usuario" placeholder="Usuário" style="padding: 10px; width: 100%; margin-bottom: 15px; border-radius: 5px; border: 1px solid #ccc;">
            <input type="password" name="senha" placeholder="Senha" style="padding: 10px; width: 100%; margin-bottom: 15px; border-radius: 5px; border: 1px solid #ccc;">
            <button type="submit" style="padding: 10px; width: 100%; background-color: dodgerblue; color: white; border: none; border-radius: 5px; font-size: 16px; cursor: pointer;">Entrar</button>
        </form>

        <div class="extra-options" style="display: flex; flex-direction: column; align-items: center; margin-top: 20px;">
            <!-- Links para cadastro e redefinição de senha -->
            <a href="cadastro.php" style="color: dodgerblue; text-decoration: none; margin-bottom: 10px; font-size: 16px;">Cadastre-se</a>
            <a href="senha.php" style="color: dodgerblue; text-decoration: none; font-size: 16px;">Esqueceu sua senha?</a>

            <!-- Exibe a mensagem de erro, se houver -->
            <?php if (!empty($mensagemErro)): ?>
                <div class="mensagem-erro"><?= $mensagemErro ?></div>
            <?php endif; ?>
        </div>
    </div>
</body>
</html>