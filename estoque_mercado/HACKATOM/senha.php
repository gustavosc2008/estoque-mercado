<?php
include('conexao.php');

$msg = "";

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    // Obtém os dados enviados pelo formulário
    $nome_usuario = $_POST['nome_usuario'];
    $nova_senha = $_POST['nova_senha'];
    $confirma_senha = $_POST['confirma_senha'];

    // Validações asas
    if (empty($nome_usuario)) {
        $msg = "Por favor, insira seu nome de usuário.";
    } elseif (strlen($nova_senha) < 6) {
        $msg = "A senha deve ter pelo menos 6 caracteres.";
    } elseif ($nova_senha !== $confirma_senha) {
        $msg = "As senhas não correspondem.";
    } else {
        // Verifica se o nome do usuário existe no banco
        $sql_verifica = "SELECT id FROM usuarios WHERE usuario = ?";
        $stmt_verifica = $mysqli->prepare($sql_verifica);
        $stmt_verifica->bind_param("s", $nome_usuario);
        $stmt_verifica->execute();
        $resultado = $stmt_verifica->get_result();

        if ($resultado->num_rows > 0) {
            // O usuário existe - atualiza a senha
            $sql = "UPDATE usuarios SET senha = ? WHERE usuario = ?";
            $stmt = $mysqli->prepare($sql);
            $stmt->bind_param("ss", $nova_senha, $nome_usuario);

            if ($stmt->execute()) {
                $msg = "Senha alterada com sucesso! Você pode agora <a href='http://localhost:8080/exemplos/index.php'>fazer login</a>.";
            } else {
                $msg = "Erro ao salvar a senha: " . $mysqli->error;
            }

            $stmt->close();
        } else {
            $msg = "Erro: Nome de usuário não encontrado.";
        }

        $stmt_verifica->close();
    }

    $mysqli->close();
}
?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Nova Senha</title>
    <style>
        body {
            font-family: Arial, Helvetica, sans-serif;
            background-image: linear-gradient(45deg, black, silver);
            color: white;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
        }
        .form-container {
            background-color: rgba(0, 0, 0, 0.8);
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.5);
            text-align: center;
        }
        input {
            width: 100%;
            padding: 10px;
            margin: 10px 0;
            border: none;
            border-radius: 5px;
        }
        button {
            padding: 10px;
            width: 100%;
            background-color: dodgerblue;
            border: none;
            color: white;
            border-radius: 5px;
            font-size: 16px;
            cursor: pointer;
        }
        button:hover {
            background-color: deepskyblue;
        }
    </style>
</head>
<body>
<div class="form-container">
    <h2>Definir Nova Senha</h2>
    <form method="POST" action="">
        <input type="text" name="nome_usuario" placeholder="Digite seu nome de usuário" required>
        <input type="password" name="nova_senha" placeholder="Digite sua nova senha" required>
        <input type="password" name="confirma_senha" placeholder="Confirme sua nova senha" required>
        <button type="submit">Salvar Senha</button>
    </form>
    <!-- Área para exibir a mensagem -->
    <div style="margin-top: 20px; color: lightgreen;">
        <?php if (!empty($msg)) echo $msg; ?>
    </div>
</div>
    
    
        

</body>
</html>