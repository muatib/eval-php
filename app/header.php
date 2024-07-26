<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <metaname="viewport" content="width=device-width, initial-scale=1.0"> 

    <title><?php echo isset($pageTitle) ? $pageTitle : ''; ?></title> 
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
    <link rel="stylesheet" 
 href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">
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

                        <a href="index.php" 
 class="nav-link <?php echo (basename($_SERVER['PHP_SELF']) == 'index.php') ? 'link-secondary' : 'link-body-emphasis'; ?>" aria-current="page">Opérations</a>
                    </li>
                    <li class="nav-item">
                        <a href="summary.php" class="nav-link <?php echo (basename($_SERVER['PHP_SELF']) == 'summary.php') ? 'link-secondary' : 'link-body-emphasis'; ?>">Synthèses</a>
                    </li>
                    <li class="nav-item">
                        <a href="categories.php" class="nav-link <?php echo (basename($_SERVER['PHP_SELF']) == 'categories.php') ? 'link-secondary' : 'link-body-emphasis'; ?>">Catégories</a>
                    </li>
                    <li class="nav-item">
                        <a href="import.php" class="nav-link <?php echo (basename($_SERVER['PHP_SELF']) == 'import.php') ? 'link-secondary' : 'link-body-emphasis'; ?>">Importer</a>
                    </li>
                    <li class="nav-item">
    <a href="categories.php" class="nav-link <?php echo (basename($_SERVER['PHP_SELF']) == 'categories.php') ? 'link-secondary' : 'link-body-emphasis'; ?>">Catégories</a>
</li>
                </ul>
            </nav>
            <form action="index.php" method="get" class="col-12 col-md-4" role="search">
    <div class="input-group">
        <input type="text" class="form-control" name="search" placeholder="Rechercher..." 
               value="<?php echo isset($_GET['search']) ? htmlspecialchars($_GET['search']) : ''; ?>">
        <button class="btn btn-primary" type="submit" id="button-search">
            <i class="bi bi-search"></i>
        </button>
    </div>
</form>

        </header>