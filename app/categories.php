<?php
session_start();
include 'functions.php';


$pdo = connectDb();


$sql = "SELECT * FROM `category`";
$stmt = $pdo->query($sql);
$categories = $stmt->fetchAll();
?>

<!DOCTYPE html>
<html lang="fr">
<head>
    <?php include 'header.php'; ?>
    <title>Catégories - Mes Comptes</title>
</head>
<body>
    <div class="container">
        <section class="card mb-4 rounded-3 shadow-sm">
            <div class="card-header py-3">
                <h1 class="my-0 fw-normal fs-4">Catégories</h1>
            </div>
            <div class="card-body">
                <ul class="list-group list-group-flush">
                    <?php foreach ($categories as $category): ?>
                        <li class="list-group-item d-flex justify-content-between align-items-center">
                            <div>
                                <i class="<?php echo $category['icon_class']; ?> fs-3"></i>
                                &nbsp;
                                <?php echo $category['category_name']; ?>
                                &nbsp;
                                <?php
                                
                                $countSql = "SELECT COUNT(*) FROM `transaction` WHERE id_category = ?";
                                $countStmt = $pdo->prepare($countSql);
                                $countStmt->execute([$category['id_category']]);
                                $operationCount = $countStmt->fetchColumn();
                                ?>
                                <span class="badge bg-secondary"><?php echo $operationCount; ?> opérations</span>
                            </div>
                            <div>
                                <a href="edit_category.php?id=<?php echo $category['id_category']; ?>" class="btn btn-outline-primary btn-sm rounded-circle">
                                    <i class="bi bi-pencil"></i>
                                </a>
                                <a href="delete_category.php?id=<?php echo $category['id_category']; ?>" class="btn btn-outline-danger btn-sm rounded-circle" onclick="return confirm('Êtes-vous sûr de vouloir supprimer cette catégorie ?');">
                                    <i class="bi bi-trash"></i>
                                </a>
                            </div>
                        </li>
                    <?php endforeach; ?>
                </ul>
            </div>
        </section>

        <section class="card mb-4 rounded-3 shadow-sm">
            <div class="card-header py-3">
                <h2 class="my-0 fw-normal fs-4">Ajouter une catégorie</h2>
            </div>
            <div class="card-body">
                <form action="add_category.php" method="post" class="row align-items-end">
                    <div class="col col-md-5">
                        <label for="category_name" class="form-label">Nom *</label>
                        <input type="text" class="form-control" name="category_name" id="category_name" required>
                    </div>
                    <div class="col-md-5">
                        <label for="icon_class" class="form-label">Classe icône Bootstrap *</label>
                        <input type="text" class="form-control" name="icon_class" id="icon_class" required>
                    </div>
                    <div class="col col-md-2 text-center text-md-end mt-3 mt-md-0">
                        <button type="submit" class="btn btn-secondary">Ajouter</button>
                    </div>
                </form>
            </div>
        </section>
    </div>

    <?php include 'footer.php'; ?>
</body>
</html>
