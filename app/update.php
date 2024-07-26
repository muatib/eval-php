
<?php
include 'functions.php';

ini_set('display_errors', 1);
ini_set('display_startup_errors', 1);
error_reporting(E_ALL);

$pdo = connectDb();

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $id = intval($_POST['id']);
    $field = $_POST['field'];
    $value = $_POST['value'];

    if ($field === 'name') {
        $sql = "UPDATE `transaction` SET name = :value WHERE id_transaction = :id";
    } elseif ($field === 'amount') {
        $sql = "UPDATE `transaction` SET amount = :value WHERE id_transaction = :id";
    } else {
        echo json_encode(['success' => false]);
        exit;
    }

    $stmt = $pdo->prepare($sql);
    $stmt->execute(['value' => $value, 'id' => $id]);

    echo json_encode(['success' => true]);
}
