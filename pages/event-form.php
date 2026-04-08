<?php include 'partials/header.php'; ?>

<h2><?php echo $event ? 'Edit Event' : 'Add Event'; ?></h2>


<form action="index.php?page=save-event" method="POST">
    <input type="hidden" name="id" value="<?php echo $event['id'] ?? ''; ?>">

    <div class="mb-3">
        <label for="title">Title</label>
        <input type="text" name="title" class="form-control" value="<?php echo $event['title'] ?? ''; ?>" required>
    </div>

    <div class="mb-3">
        <label>Date</label>
        <input type="datetime-local" name="event_date" class="form-control"
            value="<?php echo isset($event['event_date']) ? date('Y-m-d\TH:i', strtotime($event['event_date'])) : ''; ?>" required>
    </div>

    <div class="mb-3">
        <label for="location">Location</label>
        <input type="text" name="location" class="form-control" value="<?php echo $event['location'] ?? ''; ?>" required>
    </div>

    <div class="mb-3">
        <label for="capacity">Capacity</label>
        <input type="number" name="capacity" class="form-control" value="<?php echo $event['capacity'] ?? ''; ?>" required>
    </div>

    <button class="btn btn-primary">Save</button>
    <a href="index.php?page=events" class="btn btn-secondary">Cancle</a>
</form>

<?php include 'partials/footer.php'; ?>