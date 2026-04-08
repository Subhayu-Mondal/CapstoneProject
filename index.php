<?php
session_start();
require_once 'config/db.php';

$page = $_GET['page'] ?? 'login';

$public_pages = ['login'];

if (!in_array($page, $public_pages) && !isset($_SESSION['user_id'])) {
    header("Location: index.php?page=login");
    exit;
}

switch ($page) {
    case 'login':
    case 'login':

        if ($_SERVER['REQUEST_METHOD'] === 'POST') {

            $email = $_POST['email'];
            $password = $_POST['password'];

            $stmt = $pdo->prepare("SELECT * FROM users WHERE email = ?");
            $stmt->execute([$email]);
            $user = $stmt->fetch();

            if ($user && password_verify($password, $user['password'])) {
                session_regenerate_id(true);
                $_SESSION['user_id'] = $user['id'];
                $_SESSION['user_name'] = $user['name'];

                header("Location: index.php?page=dashboard");
                exit;
            } else {
                echo "Invalid credentials";
            }
        }

        include 'pages/login.php';
        break;
    case 'register':

        if ($_SERVER['REQUEST_METHOD'] === 'POST') {

            $user_id = $_SESSION['user_id'];
            $event_id = $_POST['event_id'];

            $check = $pdo->prepare("SELECT * FROM registrations WHERE user_id=? AND event_id=?");
            $check->execute([$user_id, $event_id]);

            if ($check->rowCount() > 0) {
                $_SESSION['msg'] = "Already registered!";
            } else {
                $stmt = $pdo->prepare("INSERT INTO registrations (user_id, event_id) VALUES (?, ?)");
                $stmt->execute([$user_id, $event_id]);

                $_SESSION['msg'] = "Registered successfully!";
            }
        }

        header("Location: index.php?page=events");
        exit;
    case 'feedback':

        $event_id = $_GET['event_id'];

        $stmt = $pdo->prepare("SELECT * FROM events WHERE id=?");
        $stmt->execute([$event_id]);
        $event = $stmt->fetch();

        if (!$event || strtotime($event['event_date']) > time()) {
            echo "Feedback not allowed yet!";
            exit;
        }

        if ($_SERVER['REQUEST_METHOD'] === 'POST') {

            $rating = $_POST['rating'];
            $comment = $_POST['comment'];
            $user_id = $_SESSION['user_id'];

            $stmt = $pdo->prepare("INSERT INTO feedback (user_id, event_id, rating, comment) VALUES (?, ?, ?, ?)");
            $stmt->execute([$user_id, $event_id, $rating, $comment]);

            $_SESSION['msg'] = "Feedback submitted!";
            header("Location: index.php?page=events");
            exit;
        }

        include 'pages/feedback.php';
        break;

    case 'event-form':

        $event = null;

        if (isset($_GET['id'])) {
            $stmt = $pdo->prepare("SELECT * FROM events WHERE id=?");
            $stmt->execute([$_GET['id']]);
            $event = $stmt->fetch();
        }

        include 'pages/event-form.php';
        break;

    case 'save-event':

        if ($_SERVER['REQUEST_METHOD'] == 'POST') {
            $title = $_POST['title'];
            $date = $_POST['event_date'];
            $location = $_POST['location'];
            $capacity = $_POST['capacity'];

            if (!empty($_POST['id'])) {
                $stmt = $pdo->prepare("UPDATE events SET title=?, event_date=?, location=?, capacity=? WHERE id=?");
                $stmt->execute([$title, $date, $location, $capacity, $_POST['id']]);

                $_SESSION['msg'] = "Event Updates!";
            } else {
                $stmt = $pdo->prepare("INSERT INTO events (title, event_date, location, capacity) VALUES (?, ?, ?, ?)");
                $stmt->execute([$title, $date, $location, $capacity]);

                $_SESSION['msg'] = "Event added!";
            }
        }

        header("Location: index.php?page=events");
        exit;

    case 'delete-event':

        if (isset($_GET['id'])) {
            $stmt = $pdo->prepare("DELETE FROM events WHERE id=?");
            $stmt->execute([$_GET['id']]);
        }

        header("Location: index.php?page=events");
        exit;

    case 'dashboard':
        include 'pages/dashboard.php';
        break;
    case 'events':
        include 'pages/events.php';
        break;
    case 'logout':
        include 'actions/logout.php';
        break;
    default:
        echo "$)$ Not Found";
}
