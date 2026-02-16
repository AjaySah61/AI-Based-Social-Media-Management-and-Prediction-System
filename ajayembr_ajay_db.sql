-- phpMyAdmin SQL Dump
-- version 5.2.2
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Apr 14, 2025 at 08:53 AM
-- Server version: 10.6.21-MariaDB-cll-lve-log
-- PHP Version: 8.3.19

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `ajayembr_ajay_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `adm_id` int(2) NOT NULL,
  `fullname` varchar(30) NOT NULL,
  `username` varchar(20) NOT NULL,
  `password` varchar(200) NOT NULL,
  `register_date` varchar(20) NOT NULL,
  `phone` varchar(15) NOT NULL,
  `phone_verified` tinyint(1) NOT NULL DEFAULT 0,
  `phone_token` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`adm_id`, `fullname`, `username`, `password`, `register_date`, `phone`, `phone_verified`, `phone_token`) VALUES
(7, 'Ajay sah', 'Ajaysah61', 'ed0c1e076827a651c7ab876dec1ca556', '15:21 Mar 13, 2025', '8969594358', 1, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `blocked_users`
--

CREATE TABLE `blocked_users` (
  `id` int(11) NOT NULL,
  `blocker` varchar(50) NOT NULL,
  `blocked` varchar(50) NOT NULL,
  `blocked_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `comments`
--

CREATE TABLE `comments` (
  `id` int(11) NOT NULL,
  `post_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `comment` text NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `complain`
--

CREATE TABLE `complain` (
  `complain_id` int(11) NOT NULL,
  `post_id` int(11) NOT NULL,
  `username` varchar(20) NOT NULL,
  `category` varchar(20) NOT NULL,
  `reason` varchar(150) NOT NULL,
  `complain_date` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `complain`
--

INSERT INTO `complain` (`complain_id`, `post_id`, `username`, `category`, `reason`, `complain_date`) VALUES
(8, 59, 'ajaysah61', 'Personal Reasons', 'Hdhg', '19:04 Mar 09, 2025'),
(9, 0, 'Ajaysah8969', 'Other Reasons', 'Testing ', '07:16 Mar 26, 2025');

-- --------------------------------------------------------

--
-- Table structure for table `followers`
--

CREATE TABLE `followers` (
  `id` int(11) NOT NULL,
  `follower_id` int(11) NOT NULL,
  `following_id` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `followers`
--

INSERT INTO `followers` (`id`, `follower_id`, `following_id`) VALUES
(14, 110, 113),
(9, 113, 110),
(16, 110, 111),
(11, 110, 112),
(12, 110, 114),
(17, 113, 122);

-- --------------------------------------------------------

--
-- Table structure for table `likes`
--

CREATE TABLE `likes` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `post_id` int(11) NOT NULL,
  `liked` int(11) DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `likes`
--

INSERT INTO `likes` (`id`, `user_id`, `post_id`, `liked`, `created_at`, `updated_at`) VALUES
(49, 110, 80, 1, '2025-03-24 06:36:49', '2025-03-24 06:36:49'),
(50, 110, 82, 1, '2025-03-24 06:54:20', '2025-03-24 06:54:20'),
(53, 110, 72, 1, '2025-03-25 16:24:53', '2025-03-25 16:24:53'),
(54, 110, 83, 1, '2025-03-26 15:36:56', '2025-03-26 15:36:56'),
(55, 113, 72, 1, '2025-03-28 11:19:47', '2025-03-28 11:19:47'),
(56, 113, 82, 1, '2025-03-28 11:22:17', '2025-03-28 11:22:17'),
(57, 113, 80, 1, '2025-03-29 04:19:19', '2025-03-29 04:19:19'),
(58, 113, 83, 1, '2025-03-29 04:19:23', '2025-03-29 04:19:23'),
(59, 110, 87, 1, '2025-04-02 15:52:44', '2025-04-02 15:52:44'),
(61, 110, 88, 1, '2025-04-02 18:35:50', '2025-04-02 18:35:50'),
(62, 113, 87, 1, '2025-04-07 09:24:31', '2025-04-07 09:24:31');

-- --------------------------------------------------------

--
-- Table structure for table `messages`
--

CREATE TABLE `messages` (
  `id` int(11) NOT NULL,
  `sender` varchar(50) NOT NULL,
  `receiver` varchar(50) NOT NULL,
  `message` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `seen` tinyint(1) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `messages`
--

INSERT INTO `messages` (`id`, `sender`, `receiver`, `message`, `created_at`, `seen`) VALUES
(99, 'Ajaysah8969', 'Anjuuu143', 'Hlo', '2025-04-03 11:37:20', 1),
(100, 'Anjuuu143', 'Ajaysah8969', 'Hii', '2025-04-03 11:38:33', 1),
(101, 'Anjuuu143', 'Ajaysah8969', 'Kkrho', '2025-04-03 11:40:05', 1),
(102, 'Ajaysah8969', 'Anjuuu143', 'Kuch nhi', '2025-04-03 11:40:51', 1),
(103, 'Anjuuu143', 'Ajaysah8969', 'Love uuhh buggu ðŸ˜š', '2025-04-08 10:17:34', 1),
(104, 'Ajaysah8969', 'Anjuuu143', 'Love u meri jaan ðŸ«€', '2025-04-08 10:56:29', 0),
(105, 'Ajaysah8969', 'Anjuuu143', 'Kkrho', '2025-04-09 06:12:17', 0);

-- --------------------------------------------------------

--
-- Table structure for table `notifications`
--

CREATE TABLE `notifications` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `type` enum('post','pdf','zip','video','follow') NOT NULL,
  `from_user_id` int(11) DEFAULT NULL,
  `post_id` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `notifications`
--

INSERT INTO `notifications` (`id`, `user_id`, `type`, `from_user_id`, `post_id`, `created_at`) VALUES
(21, 110, 'post', NULL, 83, '2025-03-24 07:10:43'),
(20, 110, 'post', NULL, 82, '2025-03-24 06:54:07'),
(10, 110, 'post', NULL, 72, '2025-03-23 13:50:54'),
(18, 110, 'post', NULL, 80, '2025-03-24 05:57:16'),
(31, 111, 'follow', 110, NULL, '2025-03-26 09:08:43'),
(32, 122, 'follow', 113, NULL, '2025-03-28 11:20:44'),
(35, 110, 'post', NULL, 87, '2025-04-02 15:51:59'),
(36, 110, 'zip', NULL, 9, '2025-04-02 17:36:25'),
(37, 110, 'post', NULL, 88, '2025-04-02 18:35:18');

-- --------------------------------------------------------

--
-- Table structure for table `pdf_posts`
--

CREATE TABLE `pdf_posts` (
  `file_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `username` varchar(255) NOT NULL,
  `title` varchar(255) NOT NULL,
  `category` varchar(100) NOT NULL,
  `description` text DEFAULT NULL,
  `file_url` varchar(500) DEFAULT NULL,
  `file_type` varchar(10) NOT NULL,
  `downloads` int(11) DEFAULT 0,
  `post_date` varchar(20) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `pdf_posts`
--

INSERT INTO `pdf_posts` (`file_id`, `user_id`, `username`, `title`, `category`, `description`, `file_url`, `file_type`, `downloads`, `post_date`) VALUES
(9, 110, 'Ajaysah8969', 'Couple Game Zip', 'Entertainment', 'Play couple Game with your partner.', 'https://ajaysah.in/ajay/post/uploaded-files/Couple Cards - Naughty_2.0_APKPure.zip', 'zip', 1, '23:06 Apr 02, 2025');

-- --------------------------------------------------------

--
-- Table structure for table `posts`
--

CREATE TABLE `posts` (
  `post_id` int(11) NOT NULL,
  `username` varchar(20) NOT NULL,
  `title` varchar(20) NOT NULL,
  `category` varchar(30) NOT NULL,
  `post_date` varchar(20) NOT NULL,
  `description` text NOT NULL,
  `post_img` varchar(500) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  `video_url` varchar(500) DEFAULT NULL,
  `link` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `posts`
--

INSERT INTO `posts` (`post_id`, `username`, `title`, `category`, `post_date`, `description`, `post_img`, `user_id`, `video_url`, `link`) VALUES
(72, 'Ajaysah8969', 'Visiting Card ', 'Business', '13:52 Mar 25, 2025', 'Visiting Card is important to show your short details for business. We will help you to Design a Visiting Card. Tab on the link and chat with me on WhatsApp ðŸ˜Š. I shall help you.', 'https://ajaysah.in/ajay/post/uploaded-image/1742890966_IMG_20250321_190402.jpg', 110, '', 'https://wa.me/918969594358?text=Hello '),
(80, 'Ajaysah8969', 'IGNOU Results ', 'Education', '11:27 Mar 24, 2025', 'Latest IGNOU Results of All Programs. Link is below ðŸ‘‡ðŸ», tap and see your result.', 'https://ajaysah.in/ajay/post/uploaded-image/Picsart_25-03-24_10-53-25-794.jpg', 110, NULL, 'https://www.ignou.ac.in/pages/60'),
(82, 'Ajaysah8969', 'C Programming', 'Education', '12:24 Mar 24, 2025', 'Full C programming course for beginners. Best video to watch and learn basics of coding. Link is below ðŸ‘‡ðŸ» tap and watch. Keep learning ðŸ˜Š.', 'https://ajaysah.in/ajay/post/uploaded-image/Picsart_25-03-24_12-20-57-138.jpg', 110, NULL, 'https://youtu.be/irqbmMNs2Bo?si=eMW_2Yth_JEiU2zU'),
(83, 'Ajaysah8969', 'Pokemon XYZ Series ', 'Entertainment', '12:40 Mar 24, 2025', 'Watch Pokemon XYZ series in Hindi. Enjoy the journey with Ash and Pikachu. Link is below ðŸ‘‡ðŸ» tap and enjoy.', 'https://ajaysah.in/ajay/post/uploaded-image/Picsart_25-03-24_12-37-11-268.jpg', 110, NULL, 'https://youtube.com/playlist?list=PLxjFnCWdSoEUR0iBvTDaTrCVeAn7_fi1E&si=IMrKGaVtrhVi3ix7'),
(87, 'Ajaysah8969', 'Html, Css & JavaScri', 'Education', '21:21 Apr 02, 2025', 'Html, Css & JavaScript full playlist in hindi with project. Link is below ðŸ‘‡ðŸ» tap and keep learning ðŸ˜Š.', 'https://ajaysah.in/ajay/post/uploaded-image/Picsart_25-04-02_21-19-10-551.jpg', 110, NULL, 'https://youtube.com/playlist?list=PLfqMhTWNBTe0PY9xunOzsP5kmYIz2Hu7i&si=7elRl4XQ-x5Dyxrv'),
(88, 'Ajaysah8969', 'Couple Game ðŸ«¦', 'Entertainment', '00:50 Apr 03, 2025', 'Couple Game ðŸ«¦ for couples who want some different tasks to complete after enjoy ðŸ« . Link is below ðŸ‘‡ðŸ» tap and enjoy ðŸ¥µ. Zip ko extract Krna hoga and extract krne time password enter Krna hoga. Mujhe follow krke msg kro mai password de dunga ðŸ˜‰.', 'https://ajaysah.in/ajay/post/uploaded-image/Picsart_25-04-02_23-01-59-147.jpg', 110, '', 'https://ajaysah.in/ajay/home/pdf-detail.php?id=9');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `user_id` int(11) NOT NULL,
  `fullname` varchar(30) NOT NULL,
  `username` varchar(25) NOT NULL,
  `phone` varchar(15) NOT NULL,
  `phone_verified` tinyint(1) DEFAULT 0,
  `password` varchar(300) NOT NULL,
  `register_date` varchar(20) NOT NULL,
  `profile_image` varchar(500) NOT NULL,
  `bio` varchar(99) NOT NULL,
  `phone_token` varchar(255) DEFAULT NULL,
  `login_token` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`user_id`, `fullname`, `username`, `phone`, `phone_verified`, `password`, `register_date`, `profile_image`, `bio`, `phone_token`, `login_token`) VALUES
(110, 'Ajay sah', 'Ajaysah8969', '8969594358', 1, '6e878166ab584e272d09a41dd1824057', '22:35 Mar 10, 2025', 'https://ajaysah.in/ajay/post/profile-image/1741626526_Snapchat-1815748022.jpg', 'Awesome ðŸ˜Ž........ Anything u wish â˜ºï¸', NULL, '733a7f95ecf734877bcf6c5ec4661e35d8ecd3253529a90ccf1c6e55abb270c3'),
(111, 'Suraj jaiswal ', 'Surajaj582002', '8969455889', 1, 'f2c5b1f06bfe59954cb2a56858c2ed98', '20:07 Mar 11, 2025', 'https://ajaysah.in/ajay/post/profile-image/1741703825_Screenshot_2024_0320_000258.jpg', '', NULL, NULL),
(112, 'Ujjwalsarkar', 'Ujjwal@67', '9142711279', 1, '5fe5afe95f4d5fb611666659181cb1c1', '20:46 Mar 11, 2025', 'https://ajaysah.in/ajay/post/profile-image/1741706184_IMG_3399.png', '', NULL, NULL),
(113, 'Anjuuu', 'Anjuuu143', '9835918589', 1, '7a93ed85da3f80cf2086bd283f8ed98d', '14:38 Mar 12, 2025', 'https://ajaysah.in/ajay/post/profile-image/1742194109_1000045773.jpg', '', NULL, NULL),
(114, 'Anurag yadav ', 'Anurag ', '7070422719', 1, 'acf8e5521287f6bd964433414a97cdc4', '11:40 Mar 16, 2025', 'https://ajaysah.in/ajay/post/profile-image/1742105425_1000042162.webp', '', NULL, NULL),
(122, 'Neha kumari', 'Neha_28', '8797758128', 0, '960d0eb499123646ae2b2675d2e75ee3', '14:33 Mar 27, 2025', 'https://ajaysah.in/ajay/post/profile-image/1743066209_1000005955.jpg', '', '74f18a5302b6d37f10a62198d586793d', NULL),
(123, 'jd', 'sdsd', '7827270482', 0, 'a3078842a26413b86ee9c929860bca3e', '17:10 Apr 02, 2025', 'https://ajaysah.in/ajay/post/profile-image/1743594019_Screenshot 2025-01-19 092614.png', '', 'e46fcb57f589e437114cdcd592827565', NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`adm_id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Indexes for table `blocked_users`
--
ALTER TABLE `blocked_users`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `comments`
--
ALTER TABLE `comments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `post_id` (`post_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `complain`
--
ALTER TABLE `complain`
  ADD PRIMARY KEY (`complain_id`);

--
-- Indexes for table `followers`
--
ALTER TABLE `followers`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `unique_follow` (`follower_id`,`following_id`),
  ADD KEY `following_id` (`following_id`);

--
-- Indexes for table `likes`
--
ALTER TABLE `likes`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `user_id` (`user_id`,`post_id`);

--
-- Indexes for table `messages`
--
ALTER TABLE `messages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `notifications`
--
ALTER TABLE `notifications`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pdf_posts`
--
ALTER TABLE `pdf_posts`
  ADD PRIMARY KEY (`file_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `posts`
--
ALTER TABLE `posts`
  ADD PRIMARY KEY (`post_id`),
  ADD KEY `idx_username` (`username`),
  ADD KEY `idx_title` (`title`);
ALTER TABLE `posts` ADD FULLTEXT KEY `idx_description` (`description`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`user_id`),
  ADD UNIQUE KEY `username` (`username`),
  ADD KEY `idx_username` (`username`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE `admin`
  MODIFY `adm_id` int(2) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `blocked_users`
--
ALTER TABLE `blocked_users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `comments`
--
ALTER TABLE `comments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `complain`
--
ALTER TABLE `complain`
  MODIFY `complain_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `followers`
--
ALTER TABLE `followers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `likes`
--
ALTER TABLE `likes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=63;

--
-- AUTO_INCREMENT for table `messages`
--
ALTER TABLE `messages`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=106;

--
-- AUTO_INCREMENT for table `notifications`
--
ALTER TABLE `notifications`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=39;

--
-- AUTO_INCREMENT for table `pdf_posts`
--
ALTER TABLE `pdf_posts`
  MODIFY `file_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `posts`
--
ALTER TABLE `posts`
  MODIFY `post_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=89;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=124;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `comments`
--
ALTER TABLE `comments`
  ADD CONSTRAINT `comments_ibfk_1` FOREIGN KEY (`post_id`) REFERENCES `posts` (`post_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `comments_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
