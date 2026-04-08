<?php include 'partials/header.php'; ?>

<h2>Submit Feedback</h2>

<form method="POST">

    <div class="mb-3">
        <label>Rating (1–5)</label>
        <input type="number" name="rating" class="form-control" min="1" max="5" required>
    </div>

    <div class="mb-3">
        <label>Comment</label>
        <textarea name="comment" class="form-control" required></textarea>
    </div>

    <button class="btn btn-success">Submit</button>

</form>

<?php include 'partials/footer.php'; ?>