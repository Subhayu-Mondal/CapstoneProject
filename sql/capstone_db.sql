-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 08, 2026 at 03:21 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `event_system`
--

-- --------------------------------------------------------

--
-- Table structure for table `events`
--

CREATE TABLE `events` (
  `id` int(11) NOT NULL,
  `title` varchar(200) NOT NULL,
  `description` text DEFAULT NULL,
  `event_date` datetime NOT NULL,
  `location` varchar(150) DEFAULT NULL,
  `capacity` int(11) NOT NULL,
  `status` enum('active','completed') DEFAULT 'active',
  `created_at` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `events`
--

INSERT INTO `events` (`id`, `title`, `description`, `event_date`, `location`, `capacity`, `status`, `created_at`) VALUES
(1, 'Web Dev Workshop', 'Learn HTML CSS JS', '2026-05-01 10:00:00', 'Room A', 30, 'active', '2026-04-06 11:37:59'),
(2, 'AI Seminar', 'Intro to AI', '2026-05-05 14:00:00', 'Room B', 25, 'active', '2026-04-06 11:37:59'),
(3, 'Hackathon', '24 hour coding', '2026-05-10 09:00:00', 'Hall 1', 50, 'active', '2026-04-06 11:37:59'),
(4, 'Career Talk', 'Industry insights', '2026-04-01 12:00:00', 'Room C', 20, 'completed', '2026-04-06 11:37:59'),
(5, 'Design Meetup', 'UI UX basics', '2026-04-15 15:00:00', 'Room D', 16, 'completed', '2026-04-06 11:37:59');

-- --------------------------------------------------------

--
-- Table structure for table `feedback`
--

CREATE TABLE `feedback` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `event_id` int(11) NOT NULL,
  `rating` int(11) DEFAULT NULL CHECK (`rating` between 1 and 5),
  `comment` text DEFAULT NULL,
  `created_at` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `feedback`
--

INSERT INTO `feedback` (`id`, `user_id`, `event_id`, `rating`, `comment`, `created_at`) VALUES
(1, 2, 4, 5, 'Great event', '2026-04-06 11:39:15'),
(2, 3, 4, 4, 'Very useful', '2026-04-06 11:39:15'),
(3, 4, 4, 5, 'Loved it', '2026-04-06 11:39:15'),
(4, 5, 4, 3, 'Good', '2026-04-06 11:39:15'),
(5, 2, 5, 4, 'Nice session', '2026-04-06 11:39:15'),
(6, 3, 5, 5, 'Excellent', '2026-04-06 11:39:15'),
(7, 4, 5, 4, 'Helpful', '2026-04-06 11:39:15'),
(8, 5, 5, 5, 'Amazing', '2026-04-06 11:39:15'),
(9, 1, 4, 5, 'Very good', '2026-04-06 14:49:10');

-- --------------------------------------------------------

--
-- Table structure for table `registrations`
--

CREATE TABLE `registrations` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `event_id` int(11) NOT NULL,
  `registered_at` datetime DEFAULT current_timestamp(),
  `status` enum('registered','attended') DEFAULT 'registered'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `registrations`
--

INSERT INTO `registrations` (`id`, `user_id`, `event_id`, `registered_at`, `status`) VALUES
(33, 2, 1, '2026-04-06 11:39:01', 'registered'),
(34, 3, 1, '2026-04-06 11:39:01', 'registered'),
(35, 4, 1, '2026-04-06 11:39:01', 'registered'),
(36, 5, 1, '2026-04-06 11:39:01', 'registered'),
(37, 2, 2, '2026-04-06 11:39:01', 'registered'),
(38, 3, 2, '2026-04-06 11:39:01', 'registered'),
(39, 4, 2, '2026-04-06 11:39:01', 'registered'),
(40, 5, 2, '2026-04-06 11:39:01', 'registered'),
(41, 2, 3, '2026-04-06 11:39:01', 'registered'),
(42, 3, 3, '2026-04-06 11:39:01', 'registered'),
(43, 4, 3, '2026-04-06 11:39:01', 'registered'),
(44, 5, 3, '2026-04-06 11:39:01', 'registered'),
(45, 2, 4, '2026-04-06 11:39:01', 'registered'),
(46, 3, 4, '2026-04-06 11:39:01', 'registered'),
(47, 4, 4, '2026-04-06 11:39:01', 'registered'),
(48, 5, 4, '2026-04-06 11:39:01', 'registered'),
(49, 2, 5, '2026-04-06 11:39:01', 'registered'),
(50, 3, 5, '2026-04-06 11:39:01', 'registered'),
(51, 4, 5, '2026-04-06 11:39:01', 'registered'),
(52, 5, 5, '2026-04-06 11:39:01', 'registered'),
(80, 1, 1, '2026-04-06 14:39:09', 'registered'),
(81, 1, 5, '2026-04-06 14:39:18', 'registered'),
(82, 1, 4, '2026-04-06 14:42:25', 'registered'),
(83, 1, 3, '2026-04-06 14:42:26', 'registered'),
(84, 1, 2, '2026-04-06 14:42:27', 'registered');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `email` varchar(150) NOT NULL,
  `password` varchar(255) NOT NULL,
  `role` enum('admin','attendee') DEFAULT 'attendee',
  `created_at` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `password`, `role`, `created_at`) VALUES
(1, 'Admin User', 'admin@test.com', '$2y$10$1u7xT2JgXkgKo73qNh5uzueyZa/.UFChQEZSYNLKF9okHwonRFNhq', 'admin', '2026-04-06 11:37:37'),
(2, 'John Doe', 'john@test.com', '$2y$10$abc123hashed', 'attendee', '2026-04-06 11:37:37'),
(3, 'Jane Smith', 'jane@test.com', '$2y$10$abc123hashed', 'attendee', '2026-04-06 11:37:37'),
(4, 'Mike Ross', 'mike@test.com', '$2y$10$abc123hashed', 'attendee', '2026-04-06 11:37:37'),
(5, 'Rachel Zane', 'rachel@test.com', '$2y$10$abc123hashed', 'attendee', '2026-04-06 11:37:37');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `events`
--
ALTER TABLE `events`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `feedback`
--
ALTER TABLE `feedback`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `event_id` (`event_id`);

--
-- Indexes for table `registrations`
--
ALTER TABLE `registrations`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `unique_registration` (`user_id`,`event_id`),
  ADD KEY `event_id` (`event_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `events`
--
ALTER TABLE `events`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `feedback`
--
ALTER TABLE `feedback`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `registrations`
--
ALTER TABLE `registrations`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=85;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `feedback`
--
ALTER TABLE `feedback`
  ADD CONSTRAINT `feedback_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `feedback_ibfk_2` FOREIGN KEY (`event_id`) REFERENCES `events` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `registrations`
--
ALTER TABLE `registrations`
  ADD CONSTRAINT `registrations_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `registrations_ibfk_2` FOREIGN KEY (`event_id`) REFERENCES `events` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
