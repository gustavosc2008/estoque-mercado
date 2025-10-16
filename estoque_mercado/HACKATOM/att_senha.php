<?php
include('conexao.php'); // Inclui a conexão com o banco

// Busca os usuários e suas senhas do banco de dados
$sql = "SELECT id, senha FROM usuarios";
$resultado = $mysqli->query($sql);

if ($resultado->num_rows > 0) {
    while ($usuario = $resultado->fetch_assoc()) {
        $id = $usuario['id'];
        $senha_atual = $usuario['senha'];

        // Criptografa a senha atual
        $senha_hash = password_hash($senha_atual, PASSWORD_DEFAULT);

        // Atualiza a senha no banco
        $sql_update = "UPDATE usuarios SET senha = '$senha_hash' WHERE id = $id";
        $mysqli->query($sql_update);
    }
    echo "Todas as senhas foram atualizadas para hashes!";
} else {
    echo "Nenhum usuário encontrado na tabela.";
}
?>
