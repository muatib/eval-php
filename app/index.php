<?php
session_start(); 
include 'functions.php';


$pdo = connectDb();


$month = isset($_GET['month']) ? intval($_GET['month']) : date('n'); 
$year = isset($_GET['year']) ? intval($_GET['year']) : date('Y'); 


$prevMonth = $month - 1;
$prevYear = $year;
if ($prevMonth < 1) {
    $prevMonth = 12;
    $prevYear--;
}

$nextMonth = $month + 1;
$nextYear = $year;
if ($nextMonth > 12) {
    $nextMonth = 1;
    $nextYear++;
}
$sql = "SELECT t.*, c.category_name, c.icon_class 
        FROM `transaction` t 
        LEFT JOIN `category` c ON t.id_category = c.id_category 
        WHERE MONTH(t.date_transaction) = $month 
        AND YEAR(t.date_transaction) = $year 
        ORDER BY t.date_transaction DESC";

$stmt = $pdo->query($sql);
$transactions = $stmt->fetchAll();

$balance = 0;
foreach ($transactions as $transaction) {
    $balance += $transaction['amount'];
}
?>

<?php 
include 'header.php';
$pageTitle = "Mes comptes"
?>
    </div>

    <div class="container">


        <section class="card mb-4 rounded-3 shadow-sm">
            <div class="card-header py-3">
                <h2 class="my-0 fw-normal fs-4">Solde actuel</h2>
            </div>
            <div class="card-body">
                <p class="card-title pricing-card-title text-center fs-1"><?php echo number_format($balance, 2); ?> €</p>
            </div>
        </section>

        <section class="card mb-4 rounded-3 shadow-sm">
            <div class="card-header py-3">
                <h1 class="my-0 fw-normal fs-4">Opérations de Juillet 2023</h1>
            </div>
            <div class="card-body">
                <table class="table table-striped table-hover align-middle">
                    <thead>
                        <tr>
                            <th scope="col" colspan="2">Opération</th>
                            <th scope="col" class="text-end">Montant</th>
                            <th scope="col" class="text-end">Actions</th>
                        </tr>
                    </thead>
                    <tbody>
                        <?php foreach ($transactions as $transaction) : ?>
                            <tr>
                                <td width="50" class="ps-3">
                                    <?php if (!empty($transaction['icon_class'])) : ?>
                                        <i class="<?php echo $transaction['icon_class']; ?> fs-3"></i>
                                    <?php endif; ?>
                                </td>
                                <td>
                                    <time datetime="<?php echo $transaction['date_transaction']; ?>" class="d-block fst-italic fw-light"><?php echo date('d/m/Y', strtotime($transaction['date_transaction'])); ?></time>
                                    <?php echo $transaction['name']; ?>
                                </td>
                                <td class="text-end">
                                    <span class="rounded-pill text-nowrap <?php echo ($transaction['amount'] >= 0) ? 'bg-success-subtle' : 'bg-warning-subtle'; ?> px-2">
                                        <?php echo number_format($transaction['amount'], 2); ?> €
                                    </span>
                                </td>
                                <td class="text-end text-nowrap">
                                    <a href="edit.php?id=<?php echo $transaction['id_transaction']; ?>" class="btn btn-outline-primary btn-sm rounded-circle">
                                        <i class="bi bi-pencil"></i>
                                    </a>
                                    <a href="#" onclick="confirmDelete(<?php echo $transaction['id_transaction']; ?>, '<?php echo generateCSRFToken(); ?>')" class="btn btn-outline-danger btn-sm rounded-circle">
                                        <i class="bi bi-trash"></i>
                                    </a>
                                </td>
                            </tr>
                        <?php endforeach; ?>
                    </tbody>
                </table>
            </div>
            <div class="card-footer">
    <nav class="text-center">
        <ul class="pagination d-flex justify-content-center m-2">
            <li class="page-item">
                <a class="page-link" href="?month=<?php echo $prevMonth; ?>&year=<?php echo $prevYear; ?>">Mois précédent</a>
            </li>
            <li class="page-item active" aria-current="page">
                <span class="page-link"><?php echo date('F Y', mktime(0, 0, 0, $month, 1, $year)); ?></span>
            </li>
            <li class="page-item">
                <a class="page-link" href="?month=<?php echo $nextMonth; ?>&year=<?php echo $nextYear; ?>">Mois suivant</a>
            </li>
        </ul>
    </nav>
</div>
        </section>
    </div>

    <div class="position-fixed bottom-0 end-0 m-3">
        <a href="add.php" class="btn btn-primary btn-lg rounded-circle">
            <i class="bi bi-plus fs-1"></i>
        </a>
    </div>

    <footer class="py-3 mt-4 border-top">
        <p class="text-center 
 text-body-secondary">© 2023 Mes comptes</p>
    <?php
    include 'footer.php';
    ?> 