<?php
require 'config/db.php';
include 'partials/header.php';

// count events
$eventCount = $pdo->query("SELECT COUNT(*) FROM events")->fetchColumn();

// count users
$userCount = $pdo->query("SELECT COUNT(*) FROM users")->fetchColumn();
?>

<h2 class="mb-4">Dashboard</h2>

<div class="row">

    <div class="col-md-4">
        <div class="card text-white bg-primary mb-3">
            <div class="card-body">
                <h5>Total Events</h5>
                <h3><?php echo $eventCount; ?></h3>
            </div>
        </div>
    </div>

    <div class="col-md-4">
        <div class="card text-white bg-success mb-3">
            <div class="card-body">
                <h5>Total Users</h5>
                <h3><?php echo $userCount; ?></h3>
            </div>
        </div>
    </div>

</div>

<p>Welcome <strong><?php echo $_SESSION['user_name']; ?></strong></p>

<?php include 'partials/footer.php'; ?>