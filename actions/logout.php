<?php
session_start();
session_destroy();
header("Location: /php_practice/capstoneproject-day-28/index.php?page=login");
