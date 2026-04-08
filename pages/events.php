<?php
require 'config/db.php';
include 'partials/header.php';

$search = $_GET['search'] ?? '';
$page = $_GET['p'] ?? 1;
$limit = 5;
$offset = ($page - 1) * $limit;

// Count
$countStmt = $pdo->prepare("SELECT COUNT(*) FROM events WHERE title LIKE ?");
$countStmt->execute(["%$search%"]);
$total = $countStmt->fetchColumn();

$totalPages = ceil($total / $limit);

// Fetch
$stmt = $pdo->prepare("SELECT * FROM events WHERE title LIKE ? LIMIT $limit OFFSET $offset");
$stmt->execute(["%$search%"]);
$events = $stmt->fetchAll();
?>

<?php
if (isset($_SESSION['msg'])) {
    echo '<div class="alert alert-success">' . $_SESSION['msg'] . '</div>';
    unset($_SESSION['msg']);
}
?>

<!-- Search Bar? -->
<form method="GET" class="mb-3">
    <input type="hidden" name="page" value="events">

    <div class="input-group">
        <input type="text" name="search" class="form-control"
            placeholder="Search events..." value="<?php echo htmlspecialchars($search); ?>">
        <button class="btn btn-primary">Search</button>
    </div>
</form>

<h2 class="mb-4">Events</h2>
<a href="index.php?page=event-form" class="btn btn-success mb-3">Add Event</a>

<!-- Main table -->
<table class="table table-striped table-hover">
    <thead class="table-dark">
        <tr>
            <th>Title</th>
            <th>Date</th>
            <th>Location</th>
            <th>Status</th>
            <th>Register</th>
            <th>Action</th>
            <th>Feedback</th>
        </tr>
    </thead>

    <tbody>
        <?php foreach ($events as $event): ?>
            <tr>
                <td><?php echo htmlspecialchars($event['title']); ?></td>
                <td><?php echo $event['event_date']; ?></td>
                <td><?php echo $event['location']; ?></td>

                <td>
                    <span class="badge bg-<?php echo $event['status'] == 'active' ? 'success' : 'secondary'; ?>">
                        <?php echo $event['status']; ?>
                    </span>
                </td>

                <!-- REGISTER -->
                <td>
                    <form method="POST" action="index.php?page=register">
                        <input type="hidden" name="event_id" value="<?php echo $event['id']; ?>">
                        <button class="btn btn-sm btn-primary">Register</button>
                    </form>
                </td>

                <!-- CRUD Dahi :) -->
                <td>
                    <a href="index.php?page=event-form&id=<?php echo $event['id']; ?>"
                        class="btn btn-sm btn-warning">Edit</a>

                    <a href="index.php?page=delete-event&id=<?php echo $event['id']; ?>"
                        class="btn btn-sm btn-danger"
                        onclick="return confirm('Delete this event?')">Delete</a>
                </td>

                <!-- Feedbackkkkkk -->
                <td>
                    <a href="index.php?page=feedback&event_id=<?php echo $event['id']; ?>"
                        class="btn btn-sm btn-success">Feedback</a>
                </td>
            </tr>
        <?php endforeach; ?>
    </tbody>
</table>

<!-- Page count -->
<nav>
    <ul class="pagination">

        <?php for ($i = 1; $i <= $totalPages; $i++): ?>
            <li class="page-item <?php echo ($i == $page) ? 'active' : ''; ?>">
                <a class="page-link"
                    href="index.php?page=events&search=<?php echo urlencode($search); ?>&p=<?php echo $i; ?>">
                    <?php echo $i; ?>
                </a>
            </li>
        <?php endfor; ?>

    </ul>
</nav>

<?php if (count($events) == 0): ?>
    <div class="alert alert-warning">No events found</div>
<?php endif; ?>

<?php include 'partials/footer.php'; ?>