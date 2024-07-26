<?php

include 'functions.php';

$pdo = connectDb();

// Handle form submission
if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    // Validate input
    $id = intval($_POST['id']);
    $name = trim($_POST['name']);
    $amount = floatval($_POST['amount']);
    $date = $_POST['date'];
    $category = empty($_POST['category']) ? null : intval($_POST['category']);

    if (empty($name) || empty($amount) || empty($date)) {
        $error = "Veuillez remplir tous les champs.";
    } else {
        // Update transaction in database
        $sql = "UPDATE `transaction` SET name = :name, amount = :amount, date_transaction = :date, id_category = :category WHERE id_transaction = :id";
    $stmt = $pdo->prepare($sql);
    $stmt->execute([
        'name' => $name,
        'amount' => $amount,
        'date' => $date,
        'category' => $category,
        'id' => $id,
    ]);

        // Redirect back to index page
        header('Location: index.php');
        exit;
    }
}


$id = intval($_GET['id']);
$sql = "SELECT * FROM `transaction` WHERE id_transaction = :id";
$stmt = $pdo->prepare($sql);
$stmt->execute(['id' => $id]);
$transaction = $stmt->fetch();

?>

<!DOCTYPE html>
<html lang="fr">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Modifier une opération - Mes Comptes</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">
</head>

<body>

    <div class="container-fluid">
        <header class="row flex-wrap justify-content-between align-items-center p-3 mb-4 border-bottom">
            <a href="index.php" class="col-1">
                <i class="bi bi-piggy-bank-fill text-primary fs-1"></i>
            </a>
            <nav class="col-11 col-md-7">
                <ul class="nav">
                    <li class="nav-item">
                        <a href="index.php" class="nav-link link-secondary" aria-current="page">Opérations</a>
                    </li>
                    <li class="nav-item">
                        <a href="summary.php" class="nav-link link-body-emphasis">Synthèses</a>
                    </li>
                    <li class="nav-item">
                        <a href="categories.php" class="nav-link link-body-emphasis">Catégories</a>
                    </li>
                    <li class="nav-item">
                        <a href="import.php" class="nav-link link-body-emphasis">Importer</a>
                    </li>
                </ul>
            </nav>
            <form action="" class="col-12 col-md-4" role="search">
                <div class="input-group">
                    <input type="text" class="form-control" placeholder="Rechercher..." aria-describedby="button-search">
                    <button class="btn btn-primary" type="submit" id="button-search">
                        <i class="bi bi-search"></i>
                    </button>
                </div>
            </form>
        </header>
    </div>

    <div class="container">
        <section class="card mb-4 rounded-3 shadow-sm">
            <div class="card-header py-3">
                <h1 class="my-0 fw-normal fs-4">Modifier une opération</h1>
            </div>
            <div class="card-body">
                <?php if (isset($error)): ?>
                    <div class="alert alert-danger"><?php echo $error; ?></div>
                <?php endif; ?>

                <form method="post">
                    <input type="hidden" name="id" value="<?php echo $transaction['id_transaction']; ?>">
                    <div class="mb-3">
                        <label for="name" class="form-label">Nom de l'opération *</label>
                        <input type="text" class="form-control" name="name" id="name" value="<?php echo $transaction['name']; ?>" required>
                    </div>
                    <div class="mb-3">
                        <label for="date" class="form-label">Date *</label>
                        <input type="date" class="form-control" name="date" id="date" value="<?php echo $transaction['date_transaction']; ?>" required>
                    </div>
                    <div class="mb-3">
                        <label for="amount" class="form-label">Montant *</label>
                        <div class="input-group">
                            <input type="text" class="form-control" name="amount" id="amount" value="<?php echo $transaction['amount']; ?>" required>
                            <span class="input-group-text">€</span>
                        </div>
                    </div>

                    <div class="mb-3">
                        <label for="category" class="form-label">Catégorie</label>
                        <select class="form-select" name="category" id="category">
                            <option value="" <?php if (empty($transaction['id_category'])) echo 'selected'; ?>>Aucune catégorie</option>
                            <option value="1" <?php if ($transaction['id_category'] == 1) echo 'selected'; ?>>Nourriture</option>
                            <option value="2" <?php if ($transaction['id_category'] == 2) echo 'selected'; ?>>Loisir</option>
                            <option value="3" <?php if ($transaction['id_category'] == 3) echo 'selected'; ?>>Travail</option>
                            <option value="4" <?php if ($transaction['id_category'] == 4) echo 'selected'; ?>>Voyage</option>
                            <option value="5" <?php if ($transaction['id_category'] == 5) echo 'selected'; ?>>Sport</option>
                            <option value="6" <?php if ($transaction['id_category'] == 6) echo 'selected'; ?>>Habitat</option>
                            <option value="7" <?php if ($transaction['id_category'] == 7) echo 'selected'; ?>>Cadeaux</option>
                        </select>
                    </div>
                    <div class="text-center">
                        <button type="submit" class="btn btn-primary btn-lg">Enregistrer</button>
                    </div>
                </form>
            </div>
        </section>
    </div>

    <div class="position-fixed bottom-0 end-0 m-3">
        <a href="add.php" class="btn btn-primary btn-lg rounded-circle">
            <i class="bi bi-plus fs-1"></i>
        </a>
    </div>

    <footer class="py-3 mt-4 border-top">
        <p class="text-center text-body-secondary">© 2023 Mes comptes</p>
    </footer>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>

</html>
