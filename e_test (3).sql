-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 27, 2026 at 12:28 PM
-- Server version: 10.4.22-MariaDB
-- PHP Version: 7.3.33

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `e_test`
--

-- --------------------------------------------------------

--
-- Table structure for table `attempts`
--

CREATE TABLE `attempts` (
  `id` int(11) NOT NULL,
  `score` int(11) DEFAULT 0,
  `total_questions` int(11) DEFAULT 0,
  `correct_answers` int(11) DEFAULT 0,
  `wrong_answers` int(11) DEFAULT 0,
  `completed_at` datetime DEFAULT NULL,
  `answers_json` text DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `test_id` int(11) DEFAULT NULL,
  `class_id` int(11) DEFAULT NULL,
  `batch_id` int(11) DEFAULT NULL,
  `total_time` int(11) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `attempts`
--

INSERT INTO `attempts` (`id`, `score`, `total_questions`, `correct_answers`, `wrong_answers`, `completed_at`, `answers_json`, `createdAt`, `updatedAt`, `user_id`, `test_id`, `class_id`, `batch_id`, `total_time`) VALUES
(1, 3, 6, 3, 3, '2026-01-15 07:03:40', '{\"1\":\"B\",\"2\":\"B\",\"3\":\"C\",\"4\":\"B\",\"5\":\"A\",\"6\":\"C\"}', '2026-01-15 07:03:40', '2026-01-15 07:03:40', 2, 1, NULL, NULL, 0),
(2, 0, 6, 0, 5, '2026-01-15 09:09:09', '{\"7\":\"A\",\"8\":\"B\",\"9\":\"D\",\"10\":\"B\",\"11\":\"C\"}', '2026-01-15 09:09:09', '2026-01-15 09:09:09', 2, 2, NULL, NULL, 0),
(3, 2, 6, 2, 4, '2026-01-15 09:16:37', '{\"7\":\"A\",\"8\":\"C\",\"9\":\"B\",\"10\":\"C\",\"11\":\"B\",\"12\":\"B\"}', '2026-01-15 09:16:37', '2026-01-15 09:16:37', 2, 2, NULL, NULL, 0),
(4, 1, 6, 1, 5, '2026-01-15 10:03:11', '{\"7\":\"A\",\"8\":\"C\",\"9\":\"C\",\"10\":\"B\",\"11\":\"C\",\"12\":\"C\"}', '2026-01-15 10:03:11', '2026-01-15 10:03:11', 2, 2, NULL, NULL, 0),
(5, 0, 6, 0, 0, '2026-01-15 10:17:40', '{}', '2026-01-15 10:17:40', '2026-01-15 10:17:40', 2, 2, NULL, NULL, 0),
(6, 3, 6, 3, 3, '2026-01-15 10:38:49', '{\"7\":\"A\",\"8\":\"A\",\"9\":\"B\",\"10\":\"C\",\"11\":\"C\",\"12\":\"C\"}', '2026-01-15 10:38:49', '2026-01-15 10:38:49', 2, 2, NULL, NULL, 0),
(7, 1, 5, 1, 4, '2026-01-16 09:25:43', '{\"13\":\"A\",\"14\":\"B\",\"15\":\"C\",\"16\":\"C\",\"17\":\"C\"}', '2026-01-16 09:25:43', '2026-01-16 09:25:43', 2, 3, NULL, NULL, 0),
(8, 2, 5, 2, 3, '2026-01-16 10:20:01', '{\"13\":\"A\",\"14\":\"C\",\"15\":\"C\",\"16\":\"A\",\"17\":\"A\"}', '2026-01-16 10:20:01', '2026-01-16 10:20:01', 2, 3, NULL, NULL, 0),
(9, 4, 6, 4, 2, '2026-01-16 10:21:55', '{\"1\":\"A\",\"2\":\"D\",\"3\":\"C\",\"4\":\"B\",\"5\":\"C\",\"6\":\"B\"}', '2026-01-16 10:21:55', '2026-01-16 10:21:55', 2, 1, NULL, NULL, 0),
(10, 6, 6, 6, 0, '2026-01-16 10:29:36', '{\"1\":\"B\",\"2\":\"A\",\"3\":\"C\",\"4\":\"B\",\"5\":\"C\",\"6\":\"B\"}', '2026-01-16 10:29:36', '2026-01-16 10:29:36', 2, 1, NULL, NULL, 0),
(11, 1, 2, 1, 1, '2026-01-16 11:34:17', '{\"19\":\"A\",\"20\":\"C\"}', '2026-01-16 11:34:17', '2026-01-16 11:34:17', 2, NULL, NULL, NULL, 0),
(12, 1, 3, 1, 2, '2026-01-16 11:35:46', '{\"19\":\"A\",\"20\":\"C\",\"21\":\"D\"}', '2026-01-16 11:35:46', '2026-01-16 11:35:46', 3, NULL, NULL, NULL, 0),
(13, 3, 6, 3, 3, '2026-01-21 07:19:16', '{\"1\":\"A\",\"2\":\"B\",\"3\":\"C\",\"4\":\"C\",\"5\":\"C\",\"6\":\"B\"}', '2026-01-21 07:19:16', '2026-01-21 07:19:16', 2, 1, NULL, NULL, 0),
(14, 1, 1, 1, 0, '2026-01-21 07:20:03', '{\"18\":\"A\"}', '2026-01-21 07:20:03', '2026-01-21 07:20:03', 2, 4, NULL, NULL, 0),
(15, 1, 5, 1, 4, '2026-01-21 07:20:38', '{\"13\":\"A\",\"14\":\"B\",\"15\":\"B\",\"16\":\"D\",\"17\":\"C\"}', '2026-01-21 07:20:38', '2026-01-21 07:20:38', 2, 3, NULL, NULL, 0),
(16, 2, 5, 2, 3, '2026-01-21 07:32:34', '{\"22\":\"A\",\"23\":\"B\",\"24\":\"D\",\"25\":\"B\",\"26\":\"B\"}', '2026-01-21 07:32:34', '2026-01-21 07:32:34', 2, 6, NULL, NULL, 0),
(17, 1, 6, 1, 4, '2026-01-27 09:50:44', '{\"7\":\"A\",\"8\":\"C\",\"9\":\"C\",\"10\":\"C\",\"11\":\"C\"}', '2026-01-27 09:50:44', '2026-01-27 09:50:44', 2, 2, 3, 7, 9),
(18, 1, 6, 1, 5, '2026-01-27 09:52:17', '{\"7\":\"B\",\"8\":\"C\",\"9\":\"D\",\"10\":\"D\",\"11\":\"C\",\"12\":\"A\"}', '2026-01-27 09:52:17', '2026-01-27 09:52:17', 2, 2, 3, 7, 36),
(19, 6, 6, 6, 0, '2026-01-27 09:55:04', '{\"7\":\"B\",\"8\":\"A\",\"9\":\"A\",\"10\":\"C\",\"11\":\"B\",\"12\":\"C\"}', '2026-01-27 09:55:04', '2026-01-27 09:55:04', 2, 2, 3, 7, 17),
(20, 3, 6, 3, 3, '2026-01-27 09:56:30', '{\"7\":\"B\",\"8\":\"A\",\"9\":\"C\",\"10\":\"B\",\"11\":\"C\",\"12\":\"C\"}', '2026-01-27 09:56:30', '2026-01-27 09:56:30', 3, 2, 3, 3, 11),
(21, 6, 6, 6, 0, '2026-01-27 09:57:55', '{\"7\":\"B\",\"8\":\"A\",\"9\":\"A\",\"10\":\"C\",\"11\":\"B\",\"12\":\"C\"}', '2026-01-27 09:57:55', '2026-01-27 09:57:55', 3, 2, 3, 3, 6),
(22, 6, 7, 6, 1, '2026-01-27 11:27:31', '{\"1\":\"A\",\"2\":\"A\",\"3\":\"C\",\"4\":\"B\",\"5\":\"C\",\"6\":\"B\",\"27\":\"C\"}', '2026-01-27 11:27:31', '2026-01-27 11:27:31', 6, 1, 2, 4, 25);

-- --------------------------------------------------------

--
-- Table structure for table `batches`
--

CREATE TABLE `batches` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  `class_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `batches`
--

INSERT INTO `batches` (`id`, `name`, `createdAt`, `updatedAt`, `class_id`) VALUES
(1, 'Batch A', '2026-01-27 09:45:17', '2026-01-27 09:45:17', 6),
(2, 'Batch A', '2026-01-27 09:45:34', '2026-01-27 09:45:34', 1),
(3, 'Batch A', '2026-01-27 09:46:29', '2026-01-27 09:46:29', 3),
(4, 'Batch A', '2026-01-27 09:46:32', '2026-01-27 09:46:32', 2),
(6, 'Batch A', '2026-01-27 09:46:46', '2026-01-27 09:46:46', 4),
(7, 'Batch B', '2026-01-27 09:47:47', '2026-01-27 09:47:47', 3);

-- --------------------------------------------------------

--
-- Table structure for table `classes`
--

CREATE TABLE `classes` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `classes`
--

INSERT INTO `classes` (`id`, `name`, `createdAt`, `updatedAt`) VALUES
(1, 'Class 10', '2026-01-16 11:11:12', '2026-01-16 11:11:12'),
(2, 'Class 11', '2026-01-16 11:11:12', '2026-01-16 11:11:12'),
(3, 'Class 12', '2026-01-16 11:11:12', '2026-01-16 11:11:12'),
(4, 'Class 9', '2026-01-21 07:23:35', '2026-01-21 07:23:35'),
(6, 'Class 8', '2026-01-27 09:45:01', '2026-01-27 09:45:01');

-- --------------------------------------------------------

--
-- Table structure for table `questions`
--

CREATE TABLE `questions` (
  `id` int(11) NOT NULL,
  `text` text NOT NULL,
  `option_a` varchar(255) NOT NULL,
  `option_b` varchar(255) NOT NULL,
  `option_c` varchar(255) NOT NULL,
  `option_d` varchar(255) NOT NULL,
  `correct_option` enum('A','B','C','D') NOT NULL,
  `marks` int(11) DEFAULT 1,
  `explanation` text NOT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  `test_id` int(11) DEFAULT NULL,
  `topic` varchar(255) DEFAULT 'General'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `questions`
--

INSERT INTO `questions` (`id`, `text`, `option_a`, `option_b`, `option_c`, `option_d`, `correct_option`, `marks`, `explanation`, `createdAt`, `updatedAt`, `test_id`, `topic`) VALUES
(1, 'Computers help banks to:', 'Play games', 'Manage customer accounts', 'Wash cash', 'Print newspapers', 'B', 1, 'Computer have features.', '2026-01-15 06:55:15', '2026-01-15 06:55:15', 1, 'General'),
(2, 'What is a computer?', 'An electronic machine that stores and processes data', 'A mechanical device', 'A type of calculator only', 'A printing machine', 'A', 1, 'An electronic machine that stores and processes data that solve large computation data that human takes time to do.', '2026-01-15 06:56:19', '2026-01-15 06:56:19', 1, 'General'),
(3, 'Which of the following is the brain of the computer?', 'Moniter', 'Keyboard', 'CPU', 'Mouse', 'C', 1, '', '2026-01-15 06:56:47', '2026-01-15 06:56:47', 1, 'General'),
(4, 'Which device is used to input text into a computer?', 'Mouse', 'Keyboard', 'Printer', 'Speake', 'B', 1, '', '2026-01-15 06:57:15', '2026-01-15 06:57:15', 1, 'General'),
(5, 'Which of the following is an output device?', 'Mouse', 'Keyboard', 'Moniter', 'Scanner', 'C', 1, '', '2026-01-15 06:58:19', '2026-01-15 06:58:19', 1, 'General'),
(6, 'Computers are used in schools mainly for:', 'Playing games only', 'eaching and learning', 'Cooking Food', 'Washing Cloths', 'B', 1, '', '2026-01-15 06:58:52', '2026-01-15 06:58:52', 1, 'General'),
(7, 'Who was the first President of India?', 'Jawaharlal Nehru', 'Dr. Rajendra Prasad ', ' Dr. B. R. Ambedkar', 'Sardar Vallabhbhai Patel', 'B', 1, 'Dr. Rajendra Prasad became the first President of independent India in 1950 and served for two consecutive terms.', '2026-01-15 08:59:40', '2026-01-15 08:59:40', 2, 'General'),
(8, 'In which year did India gain independence?', '1942', '1945', '1947', '1950', 'A', 1, 'India became independent from British rule on 15 August 1947.', '2026-01-15 09:00:28', '2026-01-15 09:00:28', 2, 'General'),
(9, 'Who was known as the “Iron Man of India”?', 'Subhas Chandra Bose', ' Bhagat Singh', ' Mahatma Gandhi ', ' Sardar Vallabhbhai Patel', 'A', 1, 'Sardar Patel is called the Iron Man of India because of his strong leadership and role in uniting princely states after independence.', '2026-01-15 09:01:17', '2026-01-15 09:01:17', 2, 'General'),
(10, 'Which movement was launched by Mahatma Gandhi in 1942?', 'Non-Cooperation Movement', 'Civil Disobedience Movement', 'Quit India Movement', 'Swadeshi Movement', 'C', 1, 'The Quit India Movement (1942) demanded an immediate end to British rule in India.', '2026-01-15 09:02:01', '2026-01-15 09:02:01', 2, 'General'),
(11, 'Who wrote the book “Discovery of India”?', 'Mahatma Gandhi', 'Jawaharlal Nehru', 'Rabindranath Tagore', 'Subhas Chandra Bose', 'B', 1, 'Jawaharlal Nehru wrote “The Discovery of India” while he was in prison during the freedom struggle.', '2026-01-15 09:02:50', '2026-01-15 09:02:50', 2, 'General'),
(12, 'The Indus Valley Civilization was mainly located along which river?', 'Ganga', 'Yamuna ', 'Indus ', 'Brahmaputra', 'C', 1, 'The Indus Valley Civilization developed along the Indus River, which provided water, fertile land, and trade routes.  If you want, I can:  Convert this into JSON / database format  Add difficulty level & topic tags  Create practice + exam mode  Provide Hindi translation  Generate more history questions (ancient / medieval / modern)  Just tell me 👍  give me 6 science question for class 10th   Here are 6 Class 10 Science MCQ questions with correct answers and clear explanations, aligned with CBSE-level concepts and suitable for online tests.  🔬 Class 10 Science – Objective Questions (with Explanation) 1. What is the SI unit of electric current?  A) Volt B) Ohm C) Ampere D) Watt  ✅ Correct Answer: C) Ampere 📝 Explanation: Electric current is measured in Ampere (A), which is the SI unit representing the flow of electric charge per second.  2. Which gas is released during photosynthesis?  A) Carbon dioxide B) Oxygen C) Nitrogen D) Hydrogen  ✅ Correct Answer: B) Oxygen 📝 Explanation: During photosynthesis, plants use carbon dioxide and water to make food and release oxygen as a by-product.  3. What is the pH value of a neutral solution?  A) 0 B) 5 C) 7 D) 14  ✅ Correct Answer: C) 7 📝 Explanation: A solution with pH 7 is neutral, meaning it is neither acidic nor basic.  4. Which part of the human eye controls the amount of light entering?  A) Retina B) Cornea C) Iris D) Optic nerve  ✅ Correct Answer: C) Iris 📝 Explanation: The iris adjusts the size of the pupil to control how much light enters the eye.  5. What type of energy is stored in a stretched rubber band?  A) Kinetic energy B) Thermal energy C) Chemical energy D) Potential energy  ✅ Correct Answer: D) Potential energy 📝 Explanation: A stretched rubber band stores elastic potential energy, which is released when it returns to its original shape.  6. Which process is responsible for the movement of water from roots to leaves?  A) Transpiration B) Photosynthesis C) Respiration D) Germination  ✅ Correct Answer: A) Transpiration 📝 Explanation: Transpiration creates a pull that helps water move upward from roots to leaves through xylem tissues.  If you want, I can:  Add numerical-based questions  Provide assertion–reason type  Create chapter-wise question sets  Convert to online exam format  Translate into Hindi  Just tell me 👍  Time spent per question Benefit: Helps students know what to study next, not just marks. [ can you explain and give me a prompt to implement ]  Excellent question 👍 “Time spent per question” is a powerful learning feature, not just a metric. I’ll explain it conceptually, then give you a copy-paste prompt you can use in Google Gravity / AI software builder to implement it.  1️⃣ What is Time Spent Per Question?  It tracks how many seconds/minutes a student spends on each question during a test.  Example:  Question	Topic	Time Spent	Result Q1	Electricity	12 sec	✅ Correct Q2	History	95 sec	❌ Wrong Q3	Biology	10 sec	✅ Correct 2️⃣ Why This Feature Is IMPORTANT (Student Benefit) 🔹 A. Identify Weak Concepts  High time + wrong answer → Student is confused  High time + correct → Student understands but needs practice  Low time + wrong → Guessing / careless mistake  👉 Student knows what to revise, not just marks.  🔹 B. Improve Exam Speed  Competitive exams need accuracy + speed This feature helps students:  Learn time management  Reduce overthinking  Avoid spending too long on one question  🔹 C. Personalized Study Plan  Using time data, your system can suggest:  “Revise Chapter: Light (Avg time 90 sec)”  “Practice more MCQs on Electricity”  3️⃣ How It Works (Simple Logic) Step-by-step:  Start timer when a question loads  Stop timer when:  Student moves to next question  Student submits test  Save time spent for that question  Repeat for all questions  Show analytics after test  4️⃣ Database Concept (Simple)  Table: question_attempts  Column	Description user_id	Student ID test_id	Test ID question_id	Question ID selected_option	Student answer is_correct	0 / 1 time_spent	Seconds spent created_at	Timestamp 5️⃣ What Students See (After Test)  Time spent on each question  Color indicators:  🔴 Long time + wrong  🟡 Long time + correct  🟢 Short time + correct  Topic-wise average time  6️⃣ What Admin Sees  Average time per question (all students)  Identify difficult questions  Improve question quality  7️⃣ COPY-PASTE PROMPT (Google Gravity / AI Builder) ✅ Prompt: Implement Time Spent Per Question Feature  Act as a senior full-stack developer and education analytics expert. Implement a “Time Spent Per Question” tracking feature in an Online Examination System.  Functional Requirements:  Start a timer automatically when a question is displayed to the student.  Stop the timer when:  Student navigates to another question  Student submits the test  Test auto-submits due to time expiry  Calculate time spent for each question in seconds.  Store the time spent in the database linked with:  Student ID  Test ID  Question ID  After test submission:  Show time spent per question to the student  Highlight:  High time + wrong answer (needs revision)  High time + correct answer (needs speed improvement)  Low time + correct answer (strong area)  Generate topic-wise analytics using time data.  Ensure the feature works with:  Manual submission  Auto-submit when time expires  Page refresh recovery (use auto-save)  Admin Features:  View average time spent per question  Identify difficult or confusing questions  Export analytics report  Technical Expectations:  Accurate time tracking  Minimal performance impact  Secure data storage  Responsive UI for desktop and mobile  8️⃣ BONUS: Smart Insight Messages (Very Useful)  After test, show messages like:  “You spent 2× more time on Electricity questions. Revise this topic.”  “Accuracy is good but speed is low. Practice timed tests.”  9️⃣ Recommended NEXT Upgrade (Natural Extension)  After this feature, implement: 👉 Auto Study Recommendation Engine (using time + accuracy together)  If you want, I can:  Write JS timer logic  Design Laravel backend APIs  Create student analytics UI  Convert this into DB migration + code  Help you monetize this feature 💰  Just tell me what you want next 👌  give me new features that help students   Great question. I’ll skip the generic, already-known features and give you NEW, student-first features that actually change how students study, not just how they take tests. These are practical, buildable, and high-value for your software.  🎯 1. “WHY I WAS WRONG” INSIGHT ENGINE  What it does  For every wrong answer, the system classifies the mistake:  ❌ Conceptual mistake  ⚡ Speed pressure  🎯 Silly/careless error  🎲 Guessing  How  Uses time spent + option chosen + difficulty level  Student benefit  Students stop repeating the same type of mistake.  🧠 2. PERSONAL WEAKNESS MAP (Visual)  What it does  Heatmap showing:  Topic vs Accuracy  Topic vs Time spent  Student benefit  One glance tells them where to focus this week.  ⏱️ 3. SMART TIME COACH  What it does  Compares student speed with ideal exam speed  Shows warnings like:  “You are spending 40% extra time on Physics numericals.”  Student benefit  Builds exam temperament, not just knowledge.  🔁 4. ERROR-BASED PRACTICE MODE (Very Powerful)  What it does  Generates practice questions only from past mistakes  No repeated easy questions  Student benefit  Study time becomes 2× more effective.  📅 5. AUTO REVISION REMINDER (Forgetting Curve)  What it does  Re-shows questions after:  1 day  7 days  21 days  Based on wrong or slow answers  Student benefit  Long-term memory retention without extra effort.  📊 6. REAL EXAM READINESS SCORE  What it does  Shows a score like:  “You are 72% exam ready”  Based on:  Accuracy  Speed  Consistency  Mock scores  Student benefit  Reduces anxiety and gives clarity.  🧪 7. QUESTION CONFIDENCE TRACKER  What it does  Student marks confidence level:  High / Medium / Low  System compares confidence vs correctness  Student benefit  Teaches self-awareness, a top-ranker habit.  🎮 8. MICRO-CHALLENGES (Daily 5-Minute Mode)  What it does  Daily:  5 questions  5 minutes  Instant result  Student benefit  Consistency without burnout.  🧩 9. SIMILAR QUESTION GENERATOR  What it does  For every wrong question:  Generate 3 similar questions  Difficulty increases gradually  Student benefit  Fixes concepts properly, not temporarily.  📖 10. ANSWER EXPLANATION MODES  Modes  Beginner explanation  Exam-oriented explanation  One-line revision note  Student benefit  One platform fits all learning levels.  👥 11. PEER COMPARISON (Healthy Way)  What it does  Shows:  “You are faster than 62% students”  “Accuracy above batch average”  Student benefit  Motivation without demoralization.  🧭 12. STUDY DIRECTION INDICATOR  What it does  After each test:  “What to study next”  “What to ignore for now”  Student benefit  Ends confusion and over-studying.  🧠 13. THINKING PATTERN ANALYSIS (Advanced)  What it does  Detects:  Overthinking  Rushing  Second-guessing  Student benefit  Helps fix exam psychology, not just syllabus.  🛑 14. NEGATIVE MARKING TRAINER  What it does  Shows how marks change if:  Guessing  Leaving questions  Student benefit  Improves decision-making under pressure.  🏁 15. POST-TEST ACTION PLAN (Auto)  What it does After every test:  3 weak topics  10 must-practice questions  1 speed drill  Next test suggestion  Student benefit  Students always know what to do next.  ✅ BEST FEATURES TO BUILD NEXT (In Order)  Since your system already exists:  1️⃣ Error-based practice mode 2️⃣ Weakness map 3️⃣ Smart time coach 4️⃣ Post-test action plan 5️⃣ Exam readiness score  💡 IMPORTANT TRUTH (Strong Opinion)  Most exam apps show marks. Top apps change how students think.  If you want, I can:  Design DB schema  Create logic flow  Write implementation prompt  Help you turn this into a paid product  Build Laravel-ready features  Just tell me which feature you want first 🚀   i want to implement this features in my software so give me prompt for this Leaderboard & Rank System  Show rank among:  Batch  Class  Overall  Weekly / monthly toppers  👉 Benefit: Motivates students through healthy competition.  Perfect choice 👍 A Leaderboard & Rank System is one of the highest-engagement features you can add. Below is a clear explanation + a production-ready prompt you can directly use in Google Gravity / AI software builder.  🏆 Leaderboard & Rank System — Explained Simply What This Feature Does  It ranks students based on performance, not just raw marks, and shows ranking at multiple levels:  Batch-wise rank (e.g., Batch A, Batch B)  Class-wise rank (e.g., Class 10, Class 12)  Overall rank (all students)  Weekly toppers  Monthly toppers  Why Students Love This (Real Benefit)  Creates healthy competition  Motivates consistent study (weekly/monthly)  Helps students compare progress without humiliation  Builds exam confidence  Marks tell “how much”. Rank tells “where I stand”.  How Ranking Is Calculated (Recommended Logic) Ranking Parameters (Configurable)  You can rank students based on:  Total score  Accuracy percentage  Average time per question (tie-breaker)  Number of tests attempted (optional)  Example formula:  rank_score = (score * 0.7) + (accuracy * 0.3)  What Students See  Their current rank  Top 10 / Top 50 leaderboard  Highlighted own position  Badges like 🥇 🥈 🥉  What Admin Sees  Batch-wise leaderboard  Class-wise leaderboard  Weekly/monthly topper reports  Exportable rank list  📋 DATABASE CONCEPT (Simple) users  id  name  class_id  batch_id  test_results  user_id  test_id  score  accuracy  submitted_at  leaderboard_cache (optional for performance)  user_id  rank_type (batch / class / overall)  rank_position  period (weekly / monthly / all-time)  🧠 EDGE CASES (Important)  Tie-breaking using:  Higher accuracy  Less time spent  Hide student names partially (privacy)  Show percentile instead of rank if needed  ✅ COPY-PASTE PROMPT Prompt: Leaderboard & Rank System Implementation  Act as a senior full-stack developer and education analytics expert. Implement a Leaderboard & Rank System in an Online Examination Platform to motivate students through healthy competition.  Functional Requirements Student Side:  Display leaderboards based on:  Batch-wise ranking  Class-wise ranking  Overall ranking  Show:  Student rank  Total score  Accuracy percentage  Rank movement (up/down)  Highlight the logged-in student’s position even if not in top ranks.  Display:  Weekly toppers  Monthly toppers  Award badges for:  Top 3 positions  Consistent top 10 performers  Admin Side:  Configure ranking criteria:  Score  Accuracy  Time spent (tie-breaker)  View and filter leaderboards by:  Batch  Class  Time period (weekly/monthly)  Export leaderboard data (Excel/PDF).  Ranking Logic:  Calculate ranks dynamically after test submission.  Resolve ties using:  Higher accuracy  Lower average time per question  Support:  All-time leaderboard  Weekly leaderboard (last 7 days)  Monthly leaderboard (current month)  Technical Requirements:  Optimized queries for large datasets  Caching for leaderboard results  Secure and role-based access  Mobile and desktop responsive UI  Performance & UX:  Fast loading leaderboards  Smooth pagination  Privacy-friendly student display (optional anonymization)  Output:  Leaderboard UI  Rank calculation service  Admin configuration panel  Database schema and APIs  🔥 BONUS IDEAS (Optional Enhancements)  Show percentile rank  Rank improvement graph  “Beat your best rank” challenge  Notification when rank improves  STRONG ADVICE (From Experience)  ❌ Don’t rank only by marks ✅ Rank by performance quality + consistency  If you want next:  Laravel rank calculation logic  MySQL optimized queries  UI wireframe  Anti-cheating safeguards  Monetization using leaderboards  Just say “next” and tell me what to build 👌  give me an example what admin can see and what student can see   Great question 👍 A clear visual example is exactly what you need before implementing. Below is a realistic, screen-level example of what ADMIN sees vs what STUDENT sees in the Leaderboard & Rank System.  I’ll keep it practical, not theoretical.  🧑‍💼 ADMIN VIEW (Leaderboard & Rank System) 📊 Admin Dashboard → Leaderboard 🔹 Filters (Top Section) Class:      Class 10 ▼ Batch:      Batch A ▼ Test:       Monthly Test – April ▼ Period:     Monthly ▼ Ranking By: Score + Accuracy ▼  🔹 Class-wise Leaderboard Table (Admin) Rank	Student Name	Batch	Score	Accuracy	Avg Time/Q	Tests Attempted 1 🥇	Rahul Sharma	A	92	96%	28 sec	5 2 🥈	Neha Verma	B	90	94%	30 sec	5 3 🥉	Aman Gupta	A	88	93%	31 sec	4 4	Priya Singh	A	85	91%	35 sec	5 5	Rohit Meena	B	84	89%	37 sec	3  ✅ Admin can:  Filter by class / batch / time period  Change ranking rules  Click a student → view full performance  Export report (Excel / PDF)  🔹 Weekly / Monthly Topper Card (Admin) 🏆 Monthly Topper – Class 10 Name: Rahul Sharma Score: 92 Accuracy: 96% Avg Time/Q: 28 sec  🔹 Question Difficulty Insight (Admin Bonus View) Most time-consuming question: Q12 – Electricity Numericals Avg Time: 75 sec Wrong Attempt %: 62%   👉 Admin improves question quality.  🎓 STUDENT VIEW (Leaderboard & Rank System) 🏆 Student Dashboard → Leaderboard 🔹 Student Summary Card (Top) Your Rank (Class 10): 8 / 120 students Batch Rank: 3 / 35 students Overall Rank: 45 / 600 students  📈 Rank Change: ↑ +2 from last test  🔹 Class-wise Leaderboard (Student) Rank	Student	Score	Accuracy 1 🥇	Rahul S.	92	96% 2 🥈	Neha V.	90	94% 3 🥉	Aman G.	88	93% ...	...	...	... 8 ⭐ (You)	You	81	88%  🔒 Names partially hidden for privacy.  🔹 Weekly / Monthly Toppers (Student) 🏅 Weekly Topper – Batch A Rahul S. – Score: 45 / 50  🎯 Monthly Goal: Improve accuracy to reach Top 5  🔹 Motivation Insights (Student)  ✔ Strong area: Biology (Fast + Accurate)  ⚠ Needs improvement: Physics (Slow)  🚀 You are faster than 64% students  🔹 Badges Section (Student) 🏅 Top 10 Performer 🔥 3 Week Consistency Streak ⚡ Fast Solver – Physics  🔍 KEY DIFFERENCE (IMPORTANT) ADMIN	STUDENT Full student details	Privacy-protected view Can edit ranking rules	Cannot edit rules Sees all analytics	Sees only personal insight Exports reports	Motivation-focused 💡 WHY THIS WORKS (Strong Opinion)  Admin sees control & analytics  Student sees motivation, not pressure  Leaderboard becomes positive reinforcement  If you want next:  Database tables  Laravel query logic  UI wireframes  Rank calculation formula  Anti-cheating logic  Just tell me 👉 “Next: DB”, “Next: UI”, or “Next: Code” 🚀  my application is on node js and react and mysql so as you explained give me as it is as google gravity prompt   Perfect 👍 Below is a ready-to-copy Google Gravity prompt, written exactly in the way AI app builders understand, and tailored specifically for your stack: Node.js + React + MySQL.  You can paste this as-is into Google Gravity.  ✅ GOOGLE GRAVITY PROMPT – Leaderboard & Rank System  (Node.js + React + MySQL)  Act as a senior full-stack developer specialized in Node.js, React, and MySQL. Design and implement a Leaderboard & Rank System for an Online Examination Platform that motivates students through healthy competition.  🔹 Technology Stack  Backend: Node.js (Express)  Frontend: React  Database: MySQL  🔹 Functional Requirements 👨‍🎓 Student Side  Display leaderboards with rankings:  Batch-wise  Class-wise  Overall  Show weekly and monthly toppers.  Highlight the logged-in student’s rank even if not in the top list.  Show student metrics:  Score  Accuracy percentage  Rank movement (up/down)  Ensure privacy-safe display (partial names or “You” label).  Display motivational badges:  Top 3 Performer  Top 10 Ranker  Consistency Streak  🧑‍💼 Admin Side  View leaderboards filtered by:  Class  Batch  Test  Time period (weekly / monthly / all-time)  Configure ranking criteria:  Score (primary)  Accuracy (secondary)  Average time per question (tie-breaker)  View:  Weekly toppers  Monthly toppers  Export leaderboard reports (Excel / PDF).  🔹 Ranking Logic  Calculate rank after every test submission.  Ranking priority:  Higher total score  Higher accuracy  Lower average time per question  Support:  All-time leaderboard  Last 7 days leaderboard  Current month leaderboard  Handle ties correctly using tie-breaking rules.  🔹 Database Design (MySQL)  users  id  name  class_id  batch_id  test_results  id  user_id  test_id  score  accuracy  avg_time_per_question  submitted_at  leaderboards (optional cache table)  id  user_id  rank_type (batch / class / overall)  rank_position  period (weekly / monthly / all-time)  🔹 Backend Requirements (Node.js)  REST APIs:  Get batch-wise leaderboard  Get class-wise leaderboard  Get overall leaderboard  Get weekly toppers  Get monthly toppers  Optimized MySQL queries for ranking.  Use caching for leaderboard data to improve performance.  Secure APIs with role-based access (admin / student).  🔹 Frontend Requirements (React)  Leaderboard UI with:  Tabs: Batch | Class | Overall  Filters: Weekly | Monthly | All-time  Highlight logged-in student row.  Smooth pagination and loading states.  Responsive design (mobile + desktop).  🔹 UX & Performance  Fast leaderboard loading  Minimal database load  Graceful handling of large user data  Real-time rank update after test submission  🔹 Output Expected  Fully working leaderboard system  Node.js APIs  MySQL schema  React leaderboard components  Admin & Student views  🔹 Optional Enhancements  Percentile ranking  Rank improvement graph  Notification on rank change  Gamified challenges  🔥 PRO TIP (Very Important)  Do not rank students only by marks. Use score + accuracy + speed to promote real learning.  If you want next, I can generate:  🔹 Exact SQL queries  🔹 Node.js ranking logic  🔹 React leaderboard UI code  🔹 Anti-cheating safeguards  🔹 Production optimization  Just tell me what you want next 🚀   i have classes with batch like this   Perfect, this screenshot helps a lot 👍 Right now your classes table is mixing two different concepts, which will cause problems for leaderboard, filtering, and analytics later.  Let’s fix this properly and professionally (important for scaling).  🚨 Current Problem (Very Important)  Your classes table contains:  id	name 1	Class 10 2	Class 12 3	Class 11 4	Class 10, Batch A  ❌ Issue  Class and Batch are two different entities  Storing Class 10, Batch A in the same column breaks:  Batch-wise leaderboard  Class-wise leaderboard  Filtering  Ranking logic  Clean joins in MySQL  👉 This will block correct Leaderboard & Rank System implementation.  ✅ Correct & Scalable Database Design (Recommended) ✅ 1️⃣ classes table (ONLY class) classes ------- id name        -- Class 10, Class 11, Class 12 createdAt updatedAt   Example Data  id	name 1	Class 10 2	Class 11 3	Class 12 ✅ 2️⃣ batches table (ONLY batch) batches ------- id class_id   -- FK → classes.id name       -- Batch A, Batch B createdAt updatedAt   Example Data  id	class_id	name 1	1	Batch A 2	1	Batch B 3	2	Batch A ✅ 3️⃣ users table (Student mapping) users ----- id name class_id batch_id role       -- admin / student  🎯 Why This Design Is CRITICAL (Strong Opinion)  If you don’t separate class and batch:  ❌ Leaderboard will be inaccurate  ❌ Rank filtering will be slow  ❌ Reports will be messy  ❌ Future features will break  If you separate them properly:  ✅ Clean SQL queries  ✅ Easy leaderboard calculation  ✅ Fast filters  ✅ Scalable for 10 → 10,000 students  🏆 Leaderboard Example (With Correct Design) 🔹 Batch-wise leaderboard (Class 10 → Batch A) WHERE users.class_id = 1 AND users.batch_id = 1  🔹 Class-wise leaderboard (Class 10 → All batches) WHERE users.class_id = 1  🔹 Overall leaderboard (no class or batch filter)  🔄 What To Do With Existing Data (Migration Plan) Step 1: Remove mixed rows  ❌ Delete:  Class 10, Batch A  Step 2: Insert proper batch INSERT INTO batches (class_id, name) VALUES (1, \'Batch A\');  🧠 Google Gravity Prompt (Fix This Correctly) ✅ Prompt: Normalize Class & Batch Structure  Act as a senior database architect and full-stack developer. Refactor the existing database design to separate Class and Batch entities for an Online Examination System using Node.js, React, and MySQL.  Requirements:  Ensure classes table contains only class information.  Create a separate batches table linked to classes using foreign keys.  Update user mapping to reference both class_id and batch_id.  Ensure the design supports:  Class-wise leaderboard  Batch-wise leaderboard  Overall leaderboard  Provide migration steps to clean existing mixed data.  Optimize for leaderboard and ranking queries.  Expected Outcome:  Clean normalized database  Accurate leaderboard filtering  Scalable structure for future features  ✅ Final Advice (From Experience)  If you’re building education software, database mistakes are expensive later.  Fix this now, and your leaderboard + analytics will be rock-solid 💪  If you want next, I can:  Write exact migration SQL  Update Node.js models  Adjust React forms  Write leaderboard SQL queries  Review your entire DB schema  Just tell me 👉 “Next: Migration SQL” or “Next: Leaderboard Query” 🚀  now if   Got it 👍 Now your table clearly shows the problem case:  classes -------------------------------- 1 | Class 10, Batch A 2 | Class 12 3 | Class 11 4 | Class 10, Batch B   I’ll explain WHAT TO DO NOW, WHY, and give you EXACT SQL + Google Gravity–ready prompt so you can fix this cleanly in your Node.js + React + MySQL app.  🚨 Current Situation (Clear Problem)  You are storing Class + Batch together in classes.name.  This will break:  ❌ Batch-wise leaderboard  ❌ Class-wise leaderboard  ❌ Rank filters  ❌ Reports & analytics  ❌ Future scalability  Strong truth: 👉 You cannot build a correct leaderboard on this structure.  ✅ CORRECT STRUCTURE (Must-Follow) 1️⃣ classes → ONLY class Class 10 Class 11 Class 12  2️⃣ batches → ONLY batch (linked to class) Batch A (Class 10) Batch B (Class 10) Batch A (Class 11)  🛠️ STEP-BY-STEP FIX (SAFE & PRACTICAL) ✅ Step 1: Create batches table CREATE TABLE batches (     id INT AUTO_INCREMENT PRIMARY KEY,     class_id INT NOT NULL,     name VARCHAR(50) NOT NULL,     createdAt DATETIME DEFAULT CURRENT_TIMESTAMP,     updatedAt DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,     FOREIGN KEY (class_id) REFERENCES classes(id) );  ✅ Step 2: Clean classes table data ❌ DELETE mixed rows DELETE FROM classes WHERE name LIKE \'%Batch%\';   Now your table becomes:  1 | Class 12 2 | Class 11 3 | Class 10   (IDs may differ, that’s okay)  ✅ Step 3: Insert batches properly -- Assuming Class 10 has id = 3 INSERT INTO batches (class_id, name) VALUES (3, \'Batch A\'), (3, \'Batch B\');  ✅ Step 4: Update users table (VERY IMPORTANT) ALTER TABLE users ADD class_id INT, ADD batch_id INT;   Then map users correctly:  UPDATE users SET class_id = 3, batch_id = 1 WHERE id = 101;  🏆 HOW LEADERBOARD WORKS NOW (Perfect) 🔹 Batch-wise leaderboard WHERE users.class_id = 3 AND users.batch_id = 1  🔹 Class-wise leaderboard WHERE users.class_id = 3  🔹 Overall leaderboard (no filter)   ✅ Clean ✅ Fast ✅ Accurate ✅ Scalable  🧠 WHY THIS DESIGN IS NON-NEGOTIABLE Wrong Design	Correct Design Class + Batch mixed	Separate entities Hard SQL	Clean SQL Wrong ranks	Accurate ranks Poor performance	Optimized queries  This is how real exam platforms are built.  📋 GOOGLE GRAVITY PROMPT (COPY–PASTE) ✅ Prompt: Fix Class & Batch Data Model  Act as a senior database architect and full-stack developer. Refactor an existing MySQL database used by a Node.js + React Online Examination System where class and batch information is incorrectly stored in a single table.  Requirements:  Ensure classes table stores only class information (e.g., Class 10, Class 11).  Create a new batches table linked to classes using foreign keys.  Remove mixed entries like “Class 10, Batch A” from classes.  Migrate batch information into the batches table.  Update the users table to reference both class_id and batch_id.  Ensure the schema supports:  Batch-wise leaderboard  Class-wise leaderboard  Overall leaderboard  Optimize the schema for ranking, filtering, and analytics.  Expected Output:  Clean normalized MySQL schema  Migration SQL scripts  Updated relationships for leaderboard functionality  🔥 STRONG FINAL ADVICE  Fix this now, before:  More users are added  Leaderboard logic is written  Reports go live  This is a foundation-level decision.  If you want next, I can:  ✅ Write leaderboard SQL queries  ✅ Write Node.js ranking service  ✅ Adjust React forms  ✅ Review your entire DB schema  ✅ Add data validation  Just tell me 👉 “Next: Leaderboard Query” or “Next: Node Logic” 🚀  on so according to the best method give me changes prompt and implement it all   Perfect 👍 Below is a single, complete, copy-paste Google Gravity prompt that does everything end-to-end:  ✔ fixes your wrong class/batch design ✔ migrates existing data ✔ updates Node.js + React + MySQL ✔ implements Leaderboard & Rank System ✔ is written exactly in AI-builder style  You can paste this as it is into Google Gravity.  ✅ GOOGLE GRAVITY MASTER PROMPT Normalize Class–Batch Structure + Leaderboard Implementation  Act as a senior full-stack architect with expertise in Node.js, React, and MySQL. Refactor and enhance an existing Online Examination System by correcting the Class & Batch database design and implementing a complete Leaderboard & Rank System following best industry practices.  🔹 PHASE 1: DATABASE NORMALIZATION (CRITICAL) Current Issue  The classes table incorrectly stores mixed values like “Class 10, Batch A” and “Class 10, Batch B”  This breaks leaderboard, analytics, and scalability.  ✅ REQUIRED DATABASE STRUCTURE 1️⃣ classes table (ONLY class) id name        -- Class 10, Class 11, Class 12 createdAt updatedAt  2️⃣ batches table (ONLY batch) id class_id   -- FK → classes.id name       -- Batch A, Batch B createdAt updatedAt  3️⃣ users table (mapping) id name role       -- admin / student class_id batch_id  🔄 MIGRATION REQUIREMENTS  Remove mixed records like “Class 10, Batch A” from classes  Insert clean class records  Create batches linked to classes  Update existing users to map correct class_id and batch_id  Ensure no data loss  🔹 PHASE 2: LEADERBOARD & RANK SYSTEM 🎯 Objective  Create a motivational leaderboard showing:  Batch-wise rank  Class-wise rank  Overall rank  Weekly toppers  Monthly toppers  👨‍🎓 STUDENT VIEW  See:  Current rank (batch, class, overall)  Score & accuracy  Rank movement (↑ ↓)  Highlight logged-in student row  Show badges:  🥇 Top 3  ⭐ Top 10  🔥 Consistency streak  Hide other students’ full names (privacy)  🧑‍💼 ADMIN VIEW  Filter leaderboard by:  Class  Batch  Test  Time period (weekly / monthly / all-time)  Configure ranking rules:  Score (primary)  Accuracy (secondary)  Average time per question (tie-breaker)  View and export:  Weekly toppers  Monthly toppers  🧮 RANKING LOGIC  Sort by:  Higher score  Higher accuracy  Lower average time per question  Support:  All-time leaderboard  Last 7 days leaderboard  Current month leaderboard  Update ranks after every test submission  🔹 PHASE 3: BACKEND (Node.js + Express) API REQUIREMENTS  GET /leaderboard/class/:classId  GET /leaderboard/batch/:batchId  GET /leaderboard/overall  GET /leaderboard/weekly  GET /leaderboard/monthly  BACKEND RULES  Optimized MySQL queries  Proper indexing  Optional caching for leaderboard results  Role-based access control (admin / student)  🔹 PHASE 4: FRONTEND (React) UI REQUIREMENTS  Tabs:  Batch  Class  Overall  Filters:  Weekly | Monthly | All-time  Highlight logged-in student  Rank movement indicators  Responsive design (mobile + desktop)  🔹 PERFORMANCE & UX  Fast leaderboard loading  Pagination for large datasets  Graceful handling of ties  No full page reloads  🔹 EXPECTED OUTPUT  Normalized MySQL schema  Migration SQL scripts  Node.js APIs  React leaderboard components  Admin & Student dashboards  Accurate ranking system  🔥 IMPORTANT BEST PRACTICES  Never mix class & batch in one field  Never rank only by marks  Always support privacy-safe leaderboards  Optimize for future analytics  ⭐ OPTIONAL ENHANCEMENTS  Percentile rank  Rank history graph  Notification on rank improvement  Gamified challenges  ✅ FINAL NOTE (From Real-World Experience)  If you build this now, your system becomes: ✔ scalable ✔ professional ✔ exam-ready ✔ monetizable  Most platforms fail at data design — you won’t.  If you want next, I can generate:  🔹 Exact migration SQL  🔹 Node.js leaderboard queries  🔹 React UI code  🔹 Indexing & optimization  🔹 Anti-cheating logic  Just tell me 👉 “Next: SQL”, “Next: Node code”, or “Next: React UI” 🚀  or can you rank student by classes inclueded batch like previous jus show the rank and accorcy and correct question and with time   Yes 👍 — you can rank students by using your existing structure (where Class + Batch are stored together, like “Class 10, Batch A”), IF your requirement is simple ranking only.  I’ll be very clear and opinionated here 👇 This is a VALID SHORT-TERM APPROACH and I’ll give you a clean Google Gravity prompt for it.  ✅ WHEN THIS APPROACH IS OK  You can keep Class + Batch together if:  ❌ You do NOT need separate batch analytics later  ❌ You do NOT need batch switching inside same class  ✅ You ONLY want:  Rank  Accuracy  Correct questions count  Time taken  👉 This works perfectly for:  School-level tests  Simple exam apps  MVP / first version  🎯 WHAT EXACTLY WILL HAPPEN Ranking will be:  Per “Class + Batch”  Example: Class 10, Batch A  No separate Batch filter  Students compete only inside their own group  👨‍🎓 WHAT STUDENT WILL SEE (Example) Class: Class 10, Batch A  Your Rank: 5 / 42 students  Score: 78 Correct Answers: 26 / 40 Accuracy: 65% Total Time Taken: 42 min  Leaderboard (Top 5) 1. Student A – 88 | 32 correct | 55% | 38 min 2. Student B – 85 | 30 correct | 62% | 40 min 3. Student C – 82 | 29 correct | 59% | 41 min 4. Student D – 80 | 28 correct | 57% | 44 min 5. YOU ⭐ – 78 | 26 correct | 65% | 42 min   ✔ Simple ✔ Motivating ✔ No confusion  🧑‍💼 WHAT ADMIN WILL SEE Leaderboard: Class 10, Batch A  Total Students: 42  Rank | Student | Correct | Accuracy | Time Taken 1    | A       | 32      | 55%      | 38 min 2    | B       | 30      | 62%      | 40 min 3    | C       | 29      | 59%      | 41 min ...   Admin can:  Export  Filter by class+batch  See slow questions later  🧮 RANKING LOGIC (Simple & Correct)  Priority order:  More correct answers  Higher accuracy  Less total time taken  This avoids unfair ranking.  🗃️ MINIMUM DATA REQUIRED classes id | name ---------------------- 1  | Class 10, Batch A 2  | Class 10, Batch B  test_results user_id class_id correct_count total_questions accuracy total_time_seconds submitted_at  ✅ GOOGLE GRAVITY PROMPT (COPY–PASTE) Prompt: Class + Batch Based Student Ranking  Act as a senior full-stack developer using Node.js, React, and MySQL. Implement a Student Ranking System for an Online Examination Platform where Class and Batch are stored together as a single entity (e.g., “Class 10, Batch A”).  Functional Requirements Student Side:  Display ranking only within the student’s assigned class (including batch).  Show the following metrics:  Rank position  Total correct questions  Accuracy percentage  Total time taken to complete the test  Highlight the logged-in student’s row in the leaderboard.  Display Top 10 students for the class.  Admin Side:  View leaderboard for each class (class includes batch).  See student performance including:  Correct answers  Accuracy  Time taken  Export leaderboard data.  Ranking Logic:  Rank students based on:  Higher number of correct answers  Higher accuracy  Lower total time taken (tie-breaker)  Update ranking after every test submission.  Technical Requirements:  Backend: Node.js (Express)  Frontend: React  Database: MySQL  Optimized SQL queries  Role-based access control  Output Expected:  Class-based leaderboard  Student rank calculation  Admin and Student views  Accurate and fast ranking system  ⚠️ HONEST WARNING (Important)  This design is fine now, but:  ❌ Hard to add batch analytics later  ❌ Hard to scale to large institutes  👉 When your app grows, split class & batch (we already discussed that).  ✅ MY STRONG RECOMMENDATION  For now: ✔ Use this approach and ship the feature  For future: ➡ Refactor to separate class & batch  If you want next, I can:  Write exact MySQL ranking query  Write Node.js API  Design React leaderboard component  Add weekly/monthly ranking  Help you plan future migration  Just say 👉 “Next: SQL query” 🚀  i feel like you are right as previous because after some days we get issue so go with flow with class and batch wise and also give me correction of code so we can implement it fully functional   Good decision 👍 You’re thinking like a product owner now, not just a developer. Going Class-wise + Batch-wise (separate tables) is the right long-term architecture. Below is a FULL CORRECTION + IMPLEMENTATION GUIDE for Node.js + React + MySQL — practical, production-ready, and scalable.  ✅ FINAL ARCHITECTURE (BEST PRACTICE) 1️⃣ DATABASE DESIGN (CORRECTED) 🔹 classes table CREATE TABLE classes (   id INT PRIMARY KEY AUTO_INCREMENT,   name VARCHAR(50) NOT NULL, -- Class 10, Class 11   createdAt DATETIME DEFAULT CURRENT_TIMESTAMP,   updatedAt DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP );  🔹 batches table CREATE TABLE batches (   id INT PRIMARY KEY AUTO_INCREMENT,   class_id INT NOT NULL,   name VARCHAR(50) NOT NULL, -- Batch A, Batch B   createdAt DATETIME DEFAULT CURRENT_TIMESTAMP,   updatedAt DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,   FOREIGN KEY (class_id) REFERENCES classes(id) );  🔹 users table (students) ALTER TABLE users ADD class_id INT, ADD batch_id INT, ADD FOREIGN KEY (class_id) REFERENCES classes(id), ADD FOREIGN KEY (batch_id) REFERENCES batches(id);  🔹 test_results table (CORE for ranking) CREATE TABLE test_results (   id INT PRIMARY KEY AUTO_INCREMENT,   user_id INT NOT NULL,   class_id INT NOT NULL,   batch_id INT NOT NULL,   test_id INT NOT NULL,    total_questions INT,   correct_answers INT,   accuracy DECIMAL(5,2),   total_time_seconds INT,    submitted_at DATETIME DEFAULT CURRENT_TIMESTAMP,    FOREIGN KEY (user_id  with that give me perfect prompt for all   Perfect 👍 Below is a SINGLE, COMPLETE, PROFESSIONAL Google Gravity prompt that you can copy–paste as-it-is to generate a fully functional Class + Batch wise Online Test + Ranking system using Node.js, React, and MySQL.  This prompt is production-grade, scalable, and avoids the future issues you correctly predicted.  ✅ MASTER GOOGLE GRAVITY PROMPT (Class + Batch Wise Online Test, Ranking & Performance System)  Act as a Senior Full-Stack Architect and Developer. Build a scalable Online Examination & Student Performance System using Node.js (Express), React, and MySQL following industry best practices.  The system must support Class-wise and Batch-wise separation to avoid future scalability and reporting issues.  🔹 Core Modules to Implement 1️⃣ User Roles  Admin  Student  🔹 Database Design (Mandatory) Classes Table  Stores only class information (e.g., Class 10, Class 11)  Batches Table  Linked to classes  Example: Batch A, Batch B  Users Table  Each student must belong to:  One class  One batch  Tests & Questions  Admin can create tests  Assign tests to specific class + batch  Support objective (MCQ) questions  Test Results Table  Must store:  user_id  class_id  batch_id  test_id  total_questions  correct_answers  accuracy percentage  total_time_seconds  submitted_at  🔹 Exam Behavior  Test runs within a fixed time window  Timer must auto-submit the test when time expires  Each question records:  Time spent per question  Selected answer  🔹 Ranking & Leaderboard System (CRITICAL) Ranking Levels  Batch-wise rank  Class-wise rank  Overall rank  Weekly toppers  Monthly toppers  Ranking Logic (Strict Order)  Higher correct answers  Higher accuracy  Lower total time taken (tie-breaker)  🔹 Student Panel Features  Student must be able to:  View:  Rank (Batch / Class / Overall)  Correct answers  Accuracy  Time taken  See Top 10 leaderboard  Highlight own position in leaderboard  View:  Attempted questions  Correct answers  Time spent per question  Get weak-area insights based on time & accuracy  🔹 Admin Panel Features  Admin must be able to:  Create:  Classes  Batches  Tests  Question papers  Assign tests to specific class + batch  View:  Batch-wise leaderboard  Class-wise leaderboard  Individual student performance  Analyze:  Accuracy trends  Time spent per question  Export reports (CSV)  🔹 Backend Requirements (Node.js)  REST APIs for:  Test creation  Test submission  Auto-submit on timeout  Ranking calculation  Optimized SQL queries  Role-based authentication  Secure and scalable architecture  🔹 Frontend Requirements (React)  Student dashboard  Admin dashboard  Live countdown timer  Leaderboard UI  Performance analytics UI  🔹 Performance & Scalability  Index critical columns  Avoid duplicate rank calculations  Efficient leaderboard queries  Ready for large student data  🔹 Output Expectation  Provide:  Complete database schema  Ranking SQL queries  Node.js API structure  React component structure  Clear comments & explanations  The final system must be clean, scalable, and future-proof, suitable for schools, coaching institutes, and competitive exam platforms.  🔥 WHY THIS PROMPT IS “PERFECT”  ✔ Covers entire product, not just code ✔ Prevents future class/batch mess ✔ Forces correct ranking logic ✔ Suitable for real institutes ✔ Ready for monetization  🚀 NEXT STEPS (Tell me what you want next)  I can now give you: 1️⃣ Exact MySQL ranking queries 2️⃣ Node.js APIs (auto-submit + ranking) 3️⃣ React leaderboard UI 4️⃣ Time-per-question analytics logic 5️⃣ Migration script from old structure  Just reply with 👉 “Next: ____”  Here are **15 objective (MCQ) questions** on the topic **“Computer and Its Uses”**, suitable for an **online test system**:  give me explanation also   Got it 👍 You want the explanation of the FULL PROMPT / SYSTEM, so that you + your team clearly understand WHY each part exists and HOW it helps students & admin. I’ll explain it module by module, in simple language, no fluff.  🧠 EXPLANATION OF THE COMPLETE SYSTEM  (Class + Batch wise Online Test & Ranking Platform)  1️⃣ WHY SEPARATE CLASS & BATCH  Problem if mixed:  Reports become confusing  Ranking logic breaks  Cannot scale to coaching institutes  Correct logic:  Class = Academic level (Class 9, 10, 11…)  Batch = Group inside a class (Batch A, Morning Batch, Weekend Batch)  👉 This allows:  Batch-wise competition  Class-wise comparison  Easy expansion later  2️⃣ USER ROLES EXPLAINED 👨‍🎓 Student  A student:  Belongs to ONE class + ONE batch  Can attempt only assigned tests  Can see performance, rank & improvement areas  🧑‍💼 Admin  Admin:  Controls everything  Creates structure (class → batch → test)  Monitors student performance  Takes academic decisions based on data  3️⃣ TEST & QUESTION SYSTEM (WHY IT’S DESIGNED THIS WAY) Why Objective (MCQ)?  Fast evaluation  No human bias  Perfect for ranking systems  Why Assign Test to Class + Batch?  Prevents wrong students accessing test  Keeps competition fair  Makes leaderboard meaningful  4️⃣ TIME-BOUND TEST (VERY IMPORTANT) How it works:  Test has fixed duration  Timer starts when student clicks “Start”  When time ends → AUTO SUBMIT  Why auto-submit?  ❌ No cheating ❌ No extra time ✅ Equal opportunity for all  5️⃣ TIME SPENT PER QUESTION (BIG VALUE FEATURE) What is stored?  Seconds spent on each question  Why this matters more than marks?  Because marks only say WHAT, time says WHY.  Example:  High time + wrong answer → weak concept  Low time + correct → strong topic  👉 This helps students know what to study next, not just marks.  6️⃣ TEST RESULT DATA (WHY EACH FIELD EXISTS) Field	Why correct_answers	Main scoring accuracy	Fair comparison (different paper sizes) total_time	Tie-breaker class_id & batch_id	Ranking filters submitted_at	Weekly / Monthly analysis 7️⃣ RANKING SYSTEM (CORE FEATURE) Ranking Levels Explained:  Batch Rank → closest competition (most motivating)  Class Rank → broader comparison  Overall Rank → institute-wide performance  Weekly / Monthly → continuous motivation  Ranking Logic (WHY THIS ORDER):  Correct answers → knowledge  Accuracy → consistency  Time taken → efficiency  This prevents unfair ranking.  8️⃣ STUDENT DASHBOARD (WHY STUDENTS LOVE IT)  Students can see:  Their rank (batch / class / overall)  Leaderboard (Top 10)  Correct vs wrong answers  Time spent per question  Weak areas  👉 This turns your app into a learning platform, not just an exam app.  9️⃣ ADMIN DASHBOARD (WHY ADMIN TRUSTS IT)  Admin can:  See topper trends  Identify slow learners  Detect difficult questions  Export reports for parents / management  👉 Data-driven teaching decisions.  🔟 WHY THIS SYSTEM IS FUTURE-PROOF  ✔ Supports more classes ✔ Supports more batches ✔ Supports thousands of students ✔ Easy to add:  Subject-wise rank  AI-based recommendations  Parent dashboard  💡 IN SIMPLE WORDS  Your software becomes:  ❌ Not just “online test”  ✅ A student improvement & analytics platform  That’s why this architecture is correct and professional.  🔜 WHAT I CAN GIVE YOU NEXT (VERY PRACTICAL)  If you want, next I can provide:  ✅ Exact MySQL ranking queries  ✅ Node.js APIs (auto-submit + rank)  ✅ React leaderboard UI  ✅ Student performance graph logic  ✅ Migration plan from old system  Just reply: 👉 “Next: SQL queries” 👉 “Next: Node.js API” 👉 “Next: React UI” 🚀', '2026-01-15 09:03:37', '2026-01-15 09:03:37', 2, 'General'),
(13, 'What is the SI unit of electric current?', 'Volt ', 'Ohm ', 'Ampere ', 'Watt', 'C', 1, '', '2026-01-15 10:53:50', '2026-01-15 10:53:50', 3, 'General'),
(14, 'Which gas is released during photosynthesis?', 'Carbon dioxide', 'Oxygen ', 'Nitrogen ', 'Hydrogen', 'C', 1, 'The iris adjusts the size of the pupil to control how much light enters the eye.', '2026-01-15 10:56:41', '2026-01-15 10:56:41', 3, 'General'),
(15, 'What type of energy is stored in a stretched rubber band?', 'Kinetic energy', 'Thermal energy ', 'Chemical energy', 'Potential energy', 'D', 1, 'A stretched rubber band stores elastic potential energy, which is released when it returns to its original shape.', '2026-01-15 11:15:12', '2026-01-15 11:15:12', 3, 'General'),
(16, 'Which process is responsible for the movement of water from roots to leaves?', 'Transpiration', 'Photosynthesis', 'Respiration', 'Germination', 'A', 1, 'Transpiration creates a pull that helps water move upward from roots to leaves through xylem tissues.', '2026-01-16 09:17:26', '2026-01-16 09:17:26', 3, 'General'),
(17, 'What is the pH value of a neutral solution?', '0', '5', '7', '14', 'C', 1, 'A solution with pH 7 is neutral, meaning it is neither acidic nor basic.', '2026-01-16 09:24:43', '2026-01-16 09:24:43', 3, 'General'),
(18, 'Which process is responsible for the movement of water from roots to leaves?', 'Transpiration', 'Photosynthesis', 'Respiration', 'Germination', 'A', 1, 'Transpiration creates a pull that helps water move upward from roots to leaves through xylem tissues.', '2026-01-16 09:38:25', '2026-01-16 09:38:25', 4, 'General'),
(22, 'नेताजी का चश्मा’ पाठ के लेखक कौन हैं', 'यशपाल', 'हरिशंकर परसाई', 'प्रेमचंद', 'फणीश्वरनाथ रेणु', 'B', 1, 'नेताजी का चश्मा’ एक व्यंग्य रचना है, जिसके लेखक प्रसिद्ध व्यंग्यकार हरिशंकर परसाई हैं।', '2026-01-21 07:26:47', '2026-01-21 07:26:47', 6, 'General'),
(23, 'बालगोबिन भगत’ किस विधा की रचना है?', 'कहानी', 'निबंध', 'संस्मरण', 'जीवनी', 'C', 1, 'यह पाठ लेखक द्वारा देखे गए व्यक्ति के जीवन अनुभवों पर आधारित है, इसलिए यह संस्मरण है।', '2026-01-21 07:27:24', '2026-01-21 07:27:24', 6, 'General'),
(24, 'ल्हासा की ओर’ के लेखक कौन हैं?', 'राहुल सांकृत्यायन', 'अज्ञेय', 'महादेवी वर्मा', 'जयशंकर प्रसाद', 'D', 1, 'राहुल सांकृत्यायन को ‘महापंडित’ कहा जाता है और उन्होंने यात्रा-वृत्तांत ‘ल्हासा की ओर’ लिखा।', '2026-01-21 07:27:58', '2026-01-21 07:27:58', 6, 'General'),
(25, 'राम-लक्ष्मण-परशुराम संवाद’ किस ग्रंथ से लिया गया है?', 'रामचरितमानस', 'विनय पत्रिका', 'कवितावली', 'गीतावली', 'A', 1, 'यह संवाद गोस्वामी तुलसीदास द्वारा रचित रामचरितमानस से लिया गया है।', '2026-01-21 07:28:30', '2026-01-21 07:28:30', 6, 'General'),
(26, 'सूरदास किस काल के कवि हैं?', 'रीतिकाल', 'भक्तिकाल', 'आधुनिक काल', 'आदिकाल', 'B', 1, 'सूरदास भक्ति आंदोलन के प्रमुख कवि थे और कृष्ण भक्ति के लिए प्रसिद्ध हैं।', '2026-01-21 07:29:08', '2026-01-21 07:29:08', 6, 'General'),
(27, 'Which of the following is used to store data permanently?', 'RAM', 'Cache memory', 'Hard Disk', 'Register', 'C', 1, 'Hard Disk Drive (HDD): A fixed disk that stores and retrieves digital data using magnetic storage', '2026-01-27 10:08:18', '2026-01-27 10:08:18', 1, 'General');

-- --------------------------------------------------------

--
-- Table structure for table `questiontimes`
--

CREATE TABLE `questiontimes` (
  `id` int(11) NOT NULL,
  `time_spent` int(11) DEFAULT 0,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  `attempt_id` int(11) DEFAULT NULL,
  `question_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `test_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `questiontimes`
--

INSERT INTO `questiontimes` (`id`, `time_spent`, `createdAt`, `updatedAt`, `attempt_id`, `question_id`, `user_id`, `test_id`) VALUES
(1, 7, '2026-01-16 10:20:01', '2026-01-16 10:20:01', 8, 13, 2, 3),
(2, 2, '2026-01-16 10:20:01', '2026-01-16 10:20:01', 8, 14, 2, 3),
(3, 3, '2026-01-16 10:20:01', '2026-01-16 10:20:01', 8, 15, 2, 3),
(4, 7, '2026-01-16 10:20:01', '2026-01-16 10:20:01', 8, 16, 2, 3),
(5, 0, '2026-01-16 10:20:01', '2026-01-16 10:20:01', 8, 17, 2, 3),
(6, 2, '2026-01-16 10:21:55', '2026-01-16 10:21:55', 9, 1, 2, 1),
(7, 13, '2026-01-16 10:21:55', '2026-01-16 10:21:55', 9, 2, 2, 1),
(8, 13, '2026-01-16 10:21:55', '2026-01-16 10:21:55', 9, 3, 2, 1),
(9, 8, '2026-01-16 10:21:55', '2026-01-16 10:21:55', 9, 4, 2, 1),
(10, 5, '2026-01-16 10:21:55', '2026-01-16 10:21:55', 9, 5, 2, 1),
(11, 0, '2026-01-16 10:21:55', '2026-01-16 10:21:55', 9, 6, 2, 1),
(12, 6, '2026-01-16 10:29:36', '2026-01-16 10:29:36', 10, 1, 2, 1),
(13, 5, '2026-01-16 10:29:36', '2026-01-16 10:29:36', 10, 2, 2, 1),
(14, 12, '2026-01-16 10:29:36', '2026-01-16 10:29:36', 10, 3, 2, 1),
(15, 7, '2026-01-16 10:29:36', '2026-01-16 10:29:36', 10, 4, 2, 1),
(16, 7, '2026-01-16 10:29:36', '2026-01-16 10:29:36', 10, 5, 2, 1),
(17, 0, '2026-01-16 10:29:36', '2026-01-16 10:29:36', 10, 6, 2, 1),
(23, 5, '2026-01-21 07:19:16', '2026-01-21 07:19:16', 13, 1, 2, 1),
(24, 1, '2026-01-21 07:19:16', '2026-01-21 07:19:16', 13, 2, 2, 1),
(25, 1, '2026-01-21 07:19:16', '2026-01-21 07:19:16', 13, 3, 2, 1),
(26, 1, '2026-01-21 07:19:16', '2026-01-21 07:19:16', 13, 4, 2, 1),
(27, 1, '2026-01-21 07:19:16', '2026-01-21 07:19:16', 13, 5, 2, 1),
(28, 0, '2026-01-21 07:19:16', '2026-01-21 07:19:16', 13, 6, 2, 1),
(29, 0, '2026-01-21 07:20:03', '2026-01-21 07:20:03', 14, 18, 2, 4),
(30, 14, '2026-01-21 07:20:38', '2026-01-21 07:20:38', 15, 13, 2, 3),
(31, 1, '2026-01-21 07:20:38', '2026-01-21 07:20:38', 15, 14, 2, 3),
(32, 1, '2026-01-21 07:20:38', '2026-01-21 07:20:38', 15, 15, 2, 3),
(33, 1, '2026-01-21 07:20:38', '2026-01-21 07:20:38', 15, 16, 2, 3),
(34, 0, '2026-01-21 07:20:38', '2026-01-21 07:20:38', 15, 17, 2, 3),
(35, 2, '2026-01-21 07:32:34', '2026-01-21 07:32:34', 16, 22, 2, 6),
(36, 1, '2026-01-21 07:32:34', '2026-01-21 07:32:34', 16, 23, 2, 6),
(37, 2, '2026-01-21 07:32:34', '2026-01-21 07:32:34', 16, 24, 2, 6),
(38, 1, '2026-01-21 07:32:34', '2026-01-21 07:32:34', 16, 25, 2, 6),
(39, 0, '2026-01-21 07:32:34', '2026-01-21 07:32:34', 16, 26, 2, 6),
(40, 2, '2026-01-27 09:50:44', '2026-01-27 09:50:44', 17, 7, 2, 2),
(41, 2, '2026-01-27 09:50:44', '2026-01-27 09:50:44', 17, 8, 2, 2),
(42, 1, '2026-01-27 09:50:44', '2026-01-27 09:50:44', 17, 9, 2, 2),
(43, 2, '2026-01-27 09:50:44', '2026-01-27 09:50:44', 17, 10, 2, 2),
(44, 2, '2026-01-27 09:50:44', '2026-01-27 09:50:44', 17, 11, 2, 2),
(45, 0, '2026-01-27 09:50:44', '2026-01-27 09:50:44', 17, 12, 2, 2),
(46, 9, '2026-01-27 09:52:17', '2026-01-27 09:52:17', 18, 7, 2, 2),
(47, 6, '2026-01-27 09:52:17', '2026-01-27 09:52:17', 18, 8, 2, 2),
(48, 6, '2026-01-27 09:52:17', '2026-01-27 09:52:17', 18, 9, 2, 2),
(49, 10, '2026-01-27 09:52:17', '2026-01-27 09:52:17', 18, 10, 2, 2),
(50, 5, '2026-01-27 09:52:17', '2026-01-27 09:52:17', 18, 11, 2, 2),
(51, 0, '2026-01-27 09:52:17', '2026-01-27 09:52:17', 18, 12, 2, 2),
(52, 3, '2026-01-27 09:55:04', '2026-01-27 09:55:04', 19, 7, 2, 2),
(53, 2, '2026-01-27 09:55:04', '2026-01-27 09:55:04', 19, 8, 2, 2),
(54, 4, '2026-01-27 09:55:04', '2026-01-27 09:55:04', 19, 9, 2, 2),
(55, 3, '2026-01-27 09:55:04', '2026-01-27 09:55:04', 19, 10, 2, 2),
(56, 5, '2026-01-27 09:55:04', '2026-01-27 09:55:04', 19, 11, 2, 2),
(57, 0, '2026-01-27 09:55:04', '2026-01-27 09:55:04', 19, 12, 2, 2),
(58, 3, '2026-01-27 09:56:30', '2026-01-27 09:56:30', 20, 7, 3, 2),
(59, 1, '2026-01-27 09:56:30', '2026-01-27 09:56:30', 20, 8, 3, 2),
(60, 2, '2026-01-27 09:56:30', '2026-01-27 09:56:30', 20, 9, 3, 2),
(61, 2, '2026-01-27 09:56:30', '2026-01-27 09:56:30', 20, 10, 3, 2),
(62, 3, '2026-01-27 09:56:30', '2026-01-27 09:56:30', 20, 11, 3, 2),
(63, 0, '2026-01-27 09:56:30', '2026-01-27 09:56:30', 20, 12, 3, 2),
(64, 1, '2026-01-27 09:57:55', '2026-01-27 09:57:55', 21, 7, 3, 2),
(65, 1, '2026-01-27 09:57:55', '2026-01-27 09:57:55', 21, 8, 3, 2),
(66, 1, '2026-01-27 09:57:55', '2026-01-27 09:57:55', 21, 9, 3, 2),
(67, 2, '2026-01-27 09:57:55', '2026-01-27 09:57:55', 21, 10, 3, 2),
(68, 1, '2026-01-27 09:57:55', '2026-01-27 09:57:55', 21, 11, 3, 2),
(69, 0, '2026-01-27 09:57:55', '2026-01-27 09:57:55', 21, 12, 3, 2),
(70, 3, '2026-01-27 11:27:31', '2026-01-27 11:27:31', 22, 1, 6, 1),
(71, 2, '2026-01-27 11:27:31', '2026-01-27 11:27:31', 22, 2, 6, 1),
(72, 6, '2026-01-27 11:27:31', '2026-01-27 11:27:31', 22, 3, 6, 1),
(73, 5, '2026-01-27 11:27:31', '2026-01-27 11:27:31', 22, 4, 6, 1),
(74, 4, '2026-01-27 11:27:31', '2026-01-27 11:27:31', 22, 5, 6, 1),
(75, 5, '2026-01-27 11:27:31', '2026-01-27 11:27:31', 22, 6, 6, 1),
(76, 0, '2026-01-27 11:27:31', '2026-01-27 11:27:31', 22, 27, 6, 1);

-- --------------------------------------------------------

--
-- Table structure for table `testbatches`
--

CREATE TABLE `testbatches` (
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  `test_id` int(11) NOT NULL,
  `batch_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `testbatches`
--

INSERT INTO `testbatches` (`createdAt`, `updatedAt`, `test_id`, `batch_id`) VALUES
('2026-01-27 09:48:48', '2026-01-27 09:48:48', 2, 3),
('2026-01-27 09:48:49', '2026-01-27 09:48:49', 2, 7);

-- --------------------------------------------------------

--
-- Table structure for table `testclasses`
--

CREATE TABLE `testclasses` (
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  `test_id` int(11) NOT NULL,
  `class_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `testclasses`
--

INSERT INTO `testclasses` (`createdAt`, `updatedAt`, `test_id`, `class_id`) VALUES
('2026-01-16 11:30:19', '2026-01-16 11:30:19', 1, 1),
('2026-01-16 12:20:43', '2026-01-16 12:20:43', 1, 2),
('2026-01-16 12:21:09', '2026-01-16 12:21:09', 2, 3),
('2026-01-16 11:30:19', '2026-01-16 11:30:19', 3, 1),
('2026-01-16 11:30:19', '2026-01-16 11:30:19', 4, 1),
('2026-01-21 07:24:23', '2026-01-21 07:24:23', 6, 4);

-- --------------------------------------------------------

--
-- Table structure for table `tests`
--

CREATE TABLE `tests` (
  `id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `description` text DEFAULT NULL,
  `duration_minutes` int(11) NOT NULL,
  `start_time` datetime DEFAULT NULL,
  `end_time` datetime DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  `created_by` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tests`
--

INSERT INTO `tests` (`id`, `title`, `description`, `duration_minutes`, `start_time`, `end_time`, `createdAt`, `updatedAt`, `created_by`) VALUES
(1, 'Computer', 'No description', 5, NULL, NULL, '2026-01-15 06:47:31', '2026-01-15 06:47:31', 1),
(2, 'History', 'No description', 5, NULL, NULL, '2026-01-15 07:14:34', '2026-01-15 07:14:34', 1),
(3, 'Science ', 'No description', 5, NULL, NULL, '2026-01-15 10:52:33', '2026-01-15 10:52:33', 1),
(4, 'Home science', 'No description', 10, NULL, NULL, '2026-01-16 09:37:17', '2026-01-16 09:37:17', 1),
(6, 'New Hindi Batch', 'No description', 10, NULL, NULL, '2026-01-21 07:24:13', '2026-01-21 07:24:13', 1);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `role` enum('admin','student') DEFAULT 'student',
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  `class_id` int(11) DEFAULT NULL,
  `batch_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `password`, `role`, `createdAt`, `updatedAt`, `class_id`, `batch_id`) VALUES
(1, 'Super Admin', 'admin@test.com', '$2b$10$8k3jH5qRolT7SEVkYJnkS.QRvfS/kOcBYF4NwMDzd18AtOqrBPsFq', 'admin', '2026-01-15 06:46:41', '2026-01-15 06:46:41', NULL, NULL),
(2, 'pramod', 'pramod@test.com', '$2b$10$lS64Dv0gLEBG8h5dh8O7XukXLs24tz/FB5Gwj.FvsnC2q2PPdf2Ym', 'student', '2026-01-15 06:46:41', '2026-01-27 09:49:54', 3, 7),
(3, 'Raj', 'raj@test.com', '$2b$10$lS64Dv0gLEBG8h5dh8O7XukXLs24tz/FB5Gwj.FvsnC2q2PPdf2Ym', 'student', '2026-01-15 06:46:41', '2026-01-27 09:46:56', 3, 3),
(4, 'Browser Test', 'browser@test.com', '$2b$10$FxpSMMIswQP4Jqoy1l95n.m9CmWnDgV8Hh6b2VLM/.8EZQ3lOvIAq', 'student', '2026-01-21 09:54:30', '2026-01-21 09:54:30', 2, NULL),
(5, 'Test User 02', 'testuser02@test.com', '$2b$10$BNkMpbqW/QjjdXTtMvNPl.tHvDJN2uXaY7gp3rWS3ewd7bDKovOhq', 'student', '2026-01-21 10:00:00', '2026-01-27 09:45:56', 1, 2),
(6, 'rahul', 'ruhul@test.com', '$2b$10$MUHOKOE9LeAnEUb5M4l63eadK56OUmcauXcttih.oFQOaPCYuKiVu', 'student', '2026-01-27 11:25:38', '2026-01-27 11:25:38', 2, 4);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `attempts`
--
ALTER TABLE `attempts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `test_id` (`test_id`);

--
-- Indexes for table `batches`
--
ALTER TABLE `batches`
  ADD PRIMARY KEY (`id`),
  ADD KEY `class_id` (`class_id`);

--
-- Indexes for table `classes`
--
ALTER TABLE `classes`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`),
  ADD UNIQUE KEY `name_2` (`name`),
  ADD UNIQUE KEY `name_3` (`name`),
  ADD UNIQUE KEY `name_4` (`name`),
  ADD UNIQUE KEY `name_5` (`name`),
  ADD UNIQUE KEY `name_6` (`name`),
  ADD UNIQUE KEY `name_7` (`name`),
  ADD UNIQUE KEY `name_8` (`name`),
  ADD UNIQUE KEY `name_9` (`name`),
  ADD UNIQUE KEY `name_10` (`name`),
  ADD UNIQUE KEY `name_11` (`name`),
  ADD UNIQUE KEY `name_12` (`name`),
  ADD UNIQUE KEY `name_13` (`name`),
  ADD UNIQUE KEY `name_14` (`name`),
  ADD UNIQUE KEY `name_15` (`name`),
  ADD UNIQUE KEY `name_16` (`name`),
  ADD UNIQUE KEY `name_17` (`name`),
  ADD UNIQUE KEY `name_18` (`name`),
  ADD UNIQUE KEY `name_19` (`name`),
  ADD UNIQUE KEY `name_20` (`name`),
  ADD UNIQUE KEY `name_21` (`name`),
  ADD UNIQUE KEY `name_22` (`name`),
  ADD UNIQUE KEY `name_23` (`name`);

--
-- Indexes for table `questions`
--
ALTER TABLE `questions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `test_id` (`test_id`);

--
-- Indexes for table `questiontimes`
--
ALTER TABLE `questiontimes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `attempt_id` (`attempt_id`),
  ADD KEY `question_id` (`question_id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `test_id` (`test_id`);

--
-- Indexes for table `testbatches`
--
ALTER TABLE `testbatches`
  ADD PRIMARY KEY (`test_id`,`batch_id`),
  ADD KEY `batch_id` (`batch_id`);

--
-- Indexes for table `testclasses`
--
ALTER TABLE `testclasses`
  ADD PRIMARY KEY (`test_id`,`class_id`),
  ADD KEY `class_id` (`class_id`);

--
-- Indexes for table `tests`
--
ALTER TABLE `tests`
  ADD PRIMARY KEY (`id`),
  ADD KEY `created_by` (`created_by`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`),
  ADD UNIQUE KEY `email_2` (`email`),
  ADD UNIQUE KEY `email_3` (`email`),
  ADD UNIQUE KEY `email_4` (`email`),
  ADD UNIQUE KEY `email_5` (`email`),
  ADD UNIQUE KEY `email_6` (`email`),
  ADD UNIQUE KEY `email_7` (`email`),
  ADD UNIQUE KEY `email_8` (`email`),
  ADD UNIQUE KEY `email_9` (`email`),
  ADD UNIQUE KEY `email_10` (`email`),
  ADD UNIQUE KEY `email_11` (`email`),
  ADD UNIQUE KEY `email_12` (`email`),
  ADD UNIQUE KEY `email_13` (`email`),
  ADD UNIQUE KEY `email_14` (`email`),
  ADD UNIQUE KEY `email_15` (`email`),
  ADD UNIQUE KEY `email_16` (`email`),
  ADD UNIQUE KEY `email_17` (`email`),
  ADD UNIQUE KEY `email_18` (`email`),
  ADD UNIQUE KEY `email_19` (`email`),
  ADD UNIQUE KEY `email_20` (`email`),
  ADD UNIQUE KEY `email_21` (`email`),
  ADD UNIQUE KEY `email_22` (`email`),
  ADD UNIQUE KEY `email_23` (`email`),
  ADD UNIQUE KEY `email_24` (`email`),
  ADD UNIQUE KEY `email_25` (`email`),
  ADD UNIQUE KEY `email_26` (`email`),
  ADD UNIQUE KEY `email_27` (`email`),
  ADD UNIQUE KEY `email_28` (`email`),
  ADD UNIQUE KEY `email_29` (`email`),
  ADD UNIQUE KEY `email_30` (`email`),
  ADD UNIQUE KEY `email_31` (`email`),
  ADD UNIQUE KEY `email_32` (`email`),
  ADD UNIQUE KEY `email_33` (`email`),
  ADD UNIQUE KEY `email_34` (`email`),
  ADD UNIQUE KEY `email_35` (`email`),
  ADD UNIQUE KEY `email_36` (`email`),
  ADD UNIQUE KEY `email_37` (`email`),
  ADD UNIQUE KEY `email_38` (`email`),
  ADD UNIQUE KEY `email_39` (`email`),
  ADD UNIQUE KEY `email_40` (`email`),
  ADD UNIQUE KEY `email_41` (`email`),
  ADD UNIQUE KEY `email_42` (`email`),
  ADD UNIQUE KEY `email_43` (`email`),
  ADD UNIQUE KEY `email_44` (`email`),
  ADD UNIQUE KEY `email_45` (`email`),
  ADD UNIQUE KEY `email_46` (`email`),
  ADD UNIQUE KEY `email_47` (`email`),
  ADD UNIQUE KEY `email_48` (`email`),
  ADD UNIQUE KEY `email_49` (`email`),
  ADD UNIQUE KEY `email_50` (`email`),
  ADD UNIQUE KEY `email_51` (`email`),
  ADD UNIQUE KEY `email_52` (`email`),
  ADD UNIQUE KEY `email_53` (`email`),
  ADD UNIQUE KEY `email_54` (`email`),
  ADD KEY `class_id` (`class_id`),
  ADD KEY `batch_id` (`batch_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `attempts`
--
ALTER TABLE `attempts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT for table `batches`
--
ALTER TABLE `batches`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `classes`
--
ALTER TABLE `classes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `questions`
--
ALTER TABLE `questions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT for table `questiontimes`
--
ALTER TABLE `questiontimes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=77;

--
-- AUTO_INCREMENT for table `tests`
--
ALTER TABLE `tests`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `attempts`
--
ALTER TABLE `attempts`
  ADD CONSTRAINT `attempts_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `attempts_ibfk_10` FOREIGN KEY (`test_id`) REFERENCES `tests` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `attempts_ibfk_100` FOREIGN KEY (`test_id`) REFERENCES `tests` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `attempts_ibfk_101` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `attempts_ibfk_102` FOREIGN KEY (`test_id`) REFERENCES `tests` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `attempts_ibfk_103` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `attempts_ibfk_104` FOREIGN KEY (`test_id`) REFERENCES `tests` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `attempts_ibfk_105` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `attempts_ibfk_106` FOREIGN KEY (`test_id`) REFERENCES `tests` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `attempts_ibfk_107` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `attempts_ibfk_108` FOREIGN KEY (`test_id`) REFERENCES `tests` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `attempts_ibfk_11` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `attempts_ibfk_12` FOREIGN KEY (`test_id`) REFERENCES `tests` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `attempts_ibfk_13` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `attempts_ibfk_14` FOREIGN KEY (`test_id`) REFERENCES `tests` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `attempts_ibfk_15` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `attempts_ibfk_16` FOREIGN KEY (`test_id`) REFERENCES `tests` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `attempts_ibfk_17` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `attempts_ibfk_18` FOREIGN KEY (`test_id`) REFERENCES `tests` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `attempts_ibfk_19` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `attempts_ibfk_2` FOREIGN KEY (`test_id`) REFERENCES `tests` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `attempts_ibfk_20` FOREIGN KEY (`test_id`) REFERENCES `tests` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `attempts_ibfk_21` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `attempts_ibfk_22` FOREIGN KEY (`test_id`) REFERENCES `tests` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `attempts_ibfk_23` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `attempts_ibfk_24` FOREIGN KEY (`test_id`) REFERENCES `tests` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `attempts_ibfk_25` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `attempts_ibfk_26` FOREIGN KEY (`test_id`) REFERENCES `tests` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `attempts_ibfk_27` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `attempts_ibfk_28` FOREIGN KEY (`test_id`) REFERENCES `tests` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `attempts_ibfk_29` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `attempts_ibfk_3` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `attempts_ibfk_30` FOREIGN KEY (`test_id`) REFERENCES `tests` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `attempts_ibfk_31` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `attempts_ibfk_32` FOREIGN KEY (`test_id`) REFERENCES `tests` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `attempts_ibfk_33` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `attempts_ibfk_34` FOREIGN KEY (`test_id`) REFERENCES `tests` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `attempts_ibfk_35` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `attempts_ibfk_36` FOREIGN KEY (`test_id`) REFERENCES `tests` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `attempts_ibfk_37` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `attempts_ibfk_38` FOREIGN KEY (`test_id`) REFERENCES `tests` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `attempts_ibfk_39` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `attempts_ibfk_4` FOREIGN KEY (`test_id`) REFERENCES `tests` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `attempts_ibfk_40` FOREIGN KEY (`test_id`) REFERENCES `tests` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `attempts_ibfk_41` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `attempts_ibfk_42` FOREIGN KEY (`test_id`) REFERENCES `tests` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `attempts_ibfk_43` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `attempts_ibfk_44` FOREIGN KEY (`test_id`) REFERENCES `tests` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `attempts_ibfk_45` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `attempts_ibfk_46` FOREIGN KEY (`test_id`) REFERENCES `tests` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `attempts_ibfk_47` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `attempts_ibfk_48` FOREIGN KEY (`test_id`) REFERENCES `tests` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `attempts_ibfk_49` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `attempts_ibfk_5` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `attempts_ibfk_50` FOREIGN KEY (`test_id`) REFERENCES `tests` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `attempts_ibfk_51` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `attempts_ibfk_52` FOREIGN KEY (`test_id`) REFERENCES `tests` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `attempts_ibfk_53` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `attempts_ibfk_54` FOREIGN KEY (`test_id`) REFERENCES `tests` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `attempts_ibfk_55` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `attempts_ibfk_56` FOREIGN KEY (`test_id`) REFERENCES `tests` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `attempts_ibfk_57` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `attempts_ibfk_58` FOREIGN KEY (`test_id`) REFERENCES `tests` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `attempts_ibfk_59` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `attempts_ibfk_6` FOREIGN KEY (`test_id`) REFERENCES `tests` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `attempts_ibfk_60` FOREIGN KEY (`test_id`) REFERENCES `tests` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `attempts_ibfk_61` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `attempts_ibfk_62` FOREIGN KEY (`test_id`) REFERENCES `tests` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `attempts_ibfk_63` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `attempts_ibfk_64` FOREIGN KEY (`test_id`) REFERENCES `tests` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `attempts_ibfk_65` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `attempts_ibfk_66` FOREIGN KEY (`test_id`) REFERENCES `tests` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `attempts_ibfk_67` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `attempts_ibfk_68` FOREIGN KEY (`test_id`) REFERENCES `tests` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `attempts_ibfk_69` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `attempts_ibfk_7` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `attempts_ibfk_70` FOREIGN KEY (`test_id`) REFERENCES `tests` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `attempts_ibfk_71` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `attempts_ibfk_72` FOREIGN KEY (`test_id`) REFERENCES `tests` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `attempts_ibfk_73` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `attempts_ibfk_74` FOREIGN KEY (`test_id`) REFERENCES `tests` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `attempts_ibfk_75` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `attempts_ibfk_76` FOREIGN KEY (`test_id`) REFERENCES `tests` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `attempts_ibfk_77` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `attempts_ibfk_78` FOREIGN KEY (`test_id`) REFERENCES `tests` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `attempts_ibfk_79` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `attempts_ibfk_8` FOREIGN KEY (`test_id`) REFERENCES `tests` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `attempts_ibfk_80` FOREIGN KEY (`test_id`) REFERENCES `tests` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `attempts_ibfk_81` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `attempts_ibfk_82` FOREIGN KEY (`test_id`) REFERENCES `tests` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `attempts_ibfk_83` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `attempts_ibfk_84` FOREIGN KEY (`test_id`) REFERENCES `tests` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `attempts_ibfk_85` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `attempts_ibfk_86` FOREIGN KEY (`test_id`) REFERENCES `tests` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `attempts_ibfk_87` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `attempts_ibfk_88` FOREIGN KEY (`test_id`) REFERENCES `tests` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `attempts_ibfk_89` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `attempts_ibfk_9` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `attempts_ibfk_90` FOREIGN KEY (`test_id`) REFERENCES `tests` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `attempts_ibfk_91` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `attempts_ibfk_92` FOREIGN KEY (`test_id`) REFERENCES `tests` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `attempts_ibfk_93` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `attempts_ibfk_94` FOREIGN KEY (`test_id`) REFERENCES `tests` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `attempts_ibfk_95` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `attempts_ibfk_96` FOREIGN KEY (`test_id`) REFERENCES `tests` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `attempts_ibfk_97` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `attempts_ibfk_98` FOREIGN KEY (`test_id`) REFERENCES `tests` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `attempts_ibfk_99` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `batches`
--
ALTER TABLE `batches`
  ADD CONSTRAINT `batches_ibfk_1` FOREIGN KEY (`class_id`) REFERENCES `classes` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `batches_ibfk_2` FOREIGN KEY (`class_id`) REFERENCES `classes` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `batches_ibfk_3` FOREIGN KEY (`class_id`) REFERENCES `classes` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `batches_ibfk_4` FOREIGN KEY (`class_id`) REFERENCES `classes` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `batches_ibfk_5` FOREIGN KEY (`class_id`) REFERENCES `classes` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `batches_ibfk_6` FOREIGN KEY (`class_id`) REFERENCES `classes` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `batches_ibfk_7` FOREIGN KEY (`class_id`) REFERENCES `classes` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `batches_ibfk_8` FOREIGN KEY (`class_id`) REFERENCES `classes` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `questions`
--
ALTER TABLE `questions`
  ADD CONSTRAINT `questions_ibfk_1` FOREIGN KEY (`test_id`) REFERENCES `tests` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `questions_ibfk_10` FOREIGN KEY (`test_id`) REFERENCES `tests` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `questions_ibfk_11` FOREIGN KEY (`test_id`) REFERENCES `tests` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `questions_ibfk_12` FOREIGN KEY (`test_id`) REFERENCES `tests` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `questions_ibfk_13` FOREIGN KEY (`test_id`) REFERENCES `tests` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `questions_ibfk_14` FOREIGN KEY (`test_id`) REFERENCES `tests` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `questions_ibfk_15` FOREIGN KEY (`test_id`) REFERENCES `tests` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `questions_ibfk_16` FOREIGN KEY (`test_id`) REFERENCES `tests` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `questions_ibfk_17` FOREIGN KEY (`test_id`) REFERENCES `tests` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `questions_ibfk_18` FOREIGN KEY (`test_id`) REFERENCES `tests` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `questions_ibfk_19` FOREIGN KEY (`test_id`) REFERENCES `tests` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `questions_ibfk_2` FOREIGN KEY (`test_id`) REFERENCES `tests` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `questions_ibfk_20` FOREIGN KEY (`test_id`) REFERENCES `tests` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `questions_ibfk_21` FOREIGN KEY (`test_id`) REFERENCES `tests` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `questions_ibfk_22` FOREIGN KEY (`test_id`) REFERENCES `tests` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `questions_ibfk_23` FOREIGN KEY (`test_id`) REFERENCES `tests` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `questions_ibfk_24` FOREIGN KEY (`test_id`) REFERENCES `tests` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `questions_ibfk_25` FOREIGN KEY (`test_id`) REFERENCES `tests` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `questions_ibfk_26` FOREIGN KEY (`test_id`) REFERENCES `tests` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `questions_ibfk_27` FOREIGN KEY (`test_id`) REFERENCES `tests` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `questions_ibfk_28` FOREIGN KEY (`test_id`) REFERENCES `tests` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `questions_ibfk_29` FOREIGN KEY (`test_id`) REFERENCES `tests` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `questions_ibfk_3` FOREIGN KEY (`test_id`) REFERENCES `tests` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `questions_ibfk_30` FOREIGN KEY (`test_id`) REFERENCES `tests` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `questions_ibfk_31` FOREIGN KEY (`test_id`) REFERENCES `tests` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `questions_ibfk_32` FOREIGN KEY (`test_id`) REFERENCES `tests` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `questions_ibfk_33` FOREIGN KEY (`test_id`) REFERENCES `tests` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `questions_ibfk_34` FOREIGN KEY (`test_id`) REFERENCES `tests` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `questions_ibfk_35` FOREIGN KEY (`test_id`) REFERENCES `tests` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `questions_ibfk_36` FOREIGN KEY (`test_id`) REFERENCES `tests` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `questions_ibfk_37` FOREIGN KEY (`test_id`) REFERENCES `tests` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `questions_ibfk_38` FOREIGN KEY (`test_id`) REFERENCES `tests` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `questions_ibfk_39` FOREIGN KEY (`test_id`) REFERENCES `tests` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `questions_ibfk_4` FOREIGN KEY (`test_id`) REFERENCES `tests` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `questions_ibfk_40` FOREIGN KEY (`test_id`) REFERENCES `tests` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `questions_ibfk_41` FOREIGN KEY (`test_id`) REFERENCES `tests` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `questions_ibfk_42` FOREIGN KEY (`test_id`) REFERENCES `tests` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `questions_ibfk_43` FOREIGN KEY (`test_id`) REFERENCES `tests` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `questions_ibfk_44` FOREIGN KEY (`test_id`) REFERENCES `tests` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `questions_ibfk_45` FOREIGN KEY (`test_id`) REFERENCES `tests` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `questions_ibfk_46` FOREIGN KEY (`test_id`) REFERENCES `tests` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `questions_ibfk_47` FOREIGN KEY (`test_id`) REFERENCES `tests` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `questions_ibfk_48` FOREIGN KEY (`test_id`) REFERENCES `tests` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `questions_ibfk_49` FOREIGN KEY (`test_id`) REFERENCES `tests` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `questions_ibfk_5` FOREIGN KEY (`test_id`) REFERENCES `tests` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `questions_ibfk_50` FOREIGN KEY (`test_id`) REFERENCES `tests` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `questions_ibfk_51` FOREIGN KEY (`test_id`) REFERENCES `tests` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `questions_ibfk_52` FOREIGN KEY (`test_id`) REFERENCES `tests` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `questions_ibfk_53` FOREIGN KEY (`test_id`) REFERENCES `tests` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `questions_ibfk_54` FOREIGN KEY (`test_id`) REFERENCES `tests` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `questions_ibfk_6` FOREIGN KEY (`test_id`) REFERENCES `tests` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `questions_ibfk_7` FOREIGN KEY (`test_id`) REFERENCES `tests` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `questions_ibfk_8` FOREIGN KEY (`test_id`) REFERENCES `tests` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `questions_ibfk_9` FOREIGN KEY (`test_id`) REFERENCES `tests` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `questiontimes`
--
ALTER TABLE `questiontimes`
  ADD CONSTRAINT `questiontimes_ibfk_1` FOREIGN KEY (`attempt_id`) REFERENCES `attempts` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `questiontimes_ibfk_10` FOREIGN KEY (`question_id`) REFERENCES `questions` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `questiontimes_ibfk_100` FOREIGN KEY (`test_id`) REFERENCES `tests` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `questiontimes_ibfk_101` FOREIGN KEY (`attempt_id`) REFERENCES `attempts` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `questiontimes_ibfk_102` FOREIGN KEY (`question_id`) REFERENCES `questions` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `questiontimes_ibfk_103` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `questiontimes_ibfk_104` FOREIGN KEY (`test_id`) REFERENCES `tests` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `questiontimes_ibfk_105` FOREIGN KEY (`attempt_id`) REFERENCES `attempts` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `questiontimes_ibfk_106` FOREIGN KEY (`question_id`) REFERENCES `questions` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `questiontimes_ibfk_107` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `questiontimes_ibfk_108` FOREIGN KEY (`test_id`) REFERENCES `tests` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `questiontimes_ibfk_109` FOREIGN KEY (`attempt_id`) REFERENCES `attempts` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `questiontimes_ibfk_11` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `questiontimes_ibfk_110` FOREIGN KEY (`question_id`) REFERENCES `questions` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `questiontimes_ibfk_111` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `questiontimes_ibfk_112` FOREIGN KEY (`test_id`) REFERENCES `tests` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `questiontimes_ibfk_113` FOREIGN KEY (`attempt_id`) REFERENCES `attempts` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `questiontimes_ibfk_114` FOREIGN KEY (`question_id`) REFERENCES `questions` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `questiontimes_ibfk_115` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `questiontimes_ibfk_116` FOREIGN KEY (`test_id`) REFERENCES `tests` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `questiontimes_ibfk_117` FOREIGN KEY (`attempt_id`) REFERENCES `attempts` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `questiontimes_ibfk_118` FOREIGN KEY (`question_id`) REFERENCES `questions` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `questiontimes_ibfk_119` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `questiontimes_ibfk_12` FOREIGN KEY (`test_id`) REFERENCES `tests` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `questiontimes_ibfk_120` FOREIGN KEY (`test_id`) REFERENCES `tests` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `questiontimes_ibfk_121` FOREIGN KEY (`attempt_id`) REFERENCES `attempts` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `questiontimes_ibfk_122` FOREIGN KEY (`question_id`) REFERENCES `questions` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `questiontimes_ibfk_123` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `questiontimes_ibfk_124` FOREIGN KEY (`test_id`) REFERENCES `tests` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `questiontimes_ibfk_13` FOREIGN KEY (`attempt_id`) REFERENCES `attempts` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `questiontimes_ibfk_14` FOREIGN KEY (`question_id`) REFERENCES `questions` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `questiontimes_ibfk_15` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `questiontimes_ibfk_16` FOREIGN KEY (`test_id`) REFERENCES `tests` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `questiontimes_ibfk_17` FOREIGN KEY (`attempt_id`) REFERENCES `attempts` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `questiontimes_ibfk_18` FOREIGN KEY (`question_id`) REFERENCES `questions` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `questiontimes_ibfk_19` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `questiontimes_ibfk_2` FOREIGN KEY (`question_id`) REFERENCES `questions` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `questiontimes_ibfk_20` FOREIGN KEY (`test_id`) REFERENCES `tests` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `questiontimes_ibfk_21` FOREIGN KEY (`attempt_id`) REFERENCES `attempts` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `questiontimes_ibfk_22` FOREIGN KEY (`question_id`) REFERENCES `questions` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `questiontimes_ibfk_23` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `questiontimes_ibfk_24` FOREIGN KEY (`test_id`) REFERENCES `tests` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `questiontimes_ibfk_25` FOREIGN KEY (`attempt_id`) REFERENCES `attempts` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `questiontimes_ibfk_26` FOREIGN KEY (`question_id`) REFERENCES `questions` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `questiontimes_ibfk_27` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `questiontimes_ibfk_28` FOREIGN KEY (`test_id`) REFERENCES `tests` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `questiontimes_ibfk_29` FOREIGN KEY (`attempt_id`) REFERENCES `attempts` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `questiontimes_ibfk_3` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `questiontimes_ibfk_30` FOREIGN KEY (`question_id`) REFERENCES `questions` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `questiontimes_ibfk_31` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `questiontimes_ibfk_32` FOREIGN KEY (`test_id`) REFERENCES `tests` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `questiontimes_ibfk_33` FOREIGN KEY (`attempt_id`) REFERENCES `attempts` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `questiontimes_ibfk_34` FOREIGN KEY (`question_id`) REFERENCES `questions` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `questiontimes_ibfk_35` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `questiontimes_ibfk_36` FOREIGN KEY (`test_id`) REFERENCES `tests` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `questiontimes_ibfk_37` FOREIGN KEY (`attempt_id`) REFERENCES `attempts` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `questiontimes_ibfk_38` FOREIGN KEY (`question_id`) REFERENCES `questions` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `questiontimes_ibfk_39` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `questiontimes_ibfk_4` FOREIGN KEY (`test_id`) REFERENCES `tests` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `questiontimes_ibfk_40` FOREIGN KEY (`test_id`) REFERENCES `tests` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `questiontimes_ibfk_41` FOREIGN KEY (`attempt_id`) REFERENCES `attempts` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `questiontimes_ibfk_42` FOREIGN KEY (`question_id`) REFERENCES `questions` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `questiontimes_ibfk_43` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `questiontimes_ibfk_44` FOREIGN KEY (`test_id`) REFERENCES `tests` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `questiontimes_ibfk_45` FOREIGN KEY (`attempt_id`) REFERENCES `attempts` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `questiontimes_ibfk_46` FOREIGN KEY (`question_id`) REFERENCES `questions` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `questiontimes_ibfk_47` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `questiontimes_ibfk_48` FOREIGN KEY (`test_id`) REFERENCES `tests` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `questiontimes_ibfk_49` FOREIGN KEY (`attempt_id`) REFERENCES `attempts` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `questiontimes_ibfk_5` FOREIGN KEY (`attempt_id`) REFERENCES `attempts` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `questiontimes_ibfk_50` FOREIGN KEY (`question_id`) REFERENCES `questions` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `questiontimes_ibfk_51` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `questiontimes_ibfk_52` FOREIGN KEY (`test_id`) REFERENCES `tests` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `questiontimes_ibfk_53` FOREIGN KEY (`attempt_id`) REFERENCES `attempts` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `questiontimes_ibfk_54` FOREIGN KEY (`question_id`) REFERENCES `questions` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `questiontimes_ibfk_55` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `questiontimes_ibfk_56` FOREIGN KEY (`test_id`) REFERENCES `tests` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `questiontimes_ibfk_57` FOREIGN KEY (`attempt_id`) REFERENCES `attempts` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `questiontimes_ibfk_58` FOREIGN KEY (`question_id`) REFERENCES `questions` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `questiontimes_ibfk_59` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `questiontimes_ibfk_6` FOREIGN KEY (`question_id`) REFERENCES `questions` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `questiontimes_ibfk_60` FOREIGN KEY (`test_id`) REFERENCES `tests` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `questiontimes_ibfk_61` FOREIGN KEY (`attempt_id`) REFERENCES `attempts` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `questiontimes_ibfk_62` FOREIGN KEY (`question_id`) REFERENCES `questions` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `questiontimes_ibfk_63` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `questiontimes_ibfk_64` FOREIGN KEY (`test_id`) REFERENCES `tests` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `questiontimes_ibfk_65` FOREIGN KEY (`attempt_id`) REFERENCES `attempts` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `questiontimes_ibfk_66` FOREIGN KEY (`question_id`) REFERENCES `questions` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `questiontimes_ibfk_67` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `questiontimes_ibfk_68` FOREIGN KEY (`test_id`) REFERENCES `tests` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `questiontimes_ibfk_69` FOREIGN KEY (`attempt_id`) REFERENCES `attempts` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `questiontimes_ibfk_7` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `questiontimes_ibfk_70` FOREIGN KEY (`question_id`) REFERENCES `questions` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `questiontimes_ibfk_71` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `questiontimes_ibfk_72` FOREIGN KEY (`test_id`) REFERENCES `tests` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `questiontimes_ibfk_73` FOREIGN KEY (`attempt_id`) REFERENCES `attempts` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `questiontimes_ibfk_74` FOREIGN KEY (`question_id`) REFERENCES `questions` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `questiontimes_ibfk_75` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `questiontimes_ibfk_76` FOREIGN KEY (`test_id`) REFERENCES `tests` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `questiontimes_ibfk_77` FOREIGN KEY (`attempt_id`) REFERENCES `attempts` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `questiontimes_ibfk_78` FOREIGN KEY (`question_id`) REFERENCES `questions` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `questiontimes_ibfk_79` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `questiontimes_ibfk_8` FOREIGN KEY (`test_id`) REFERENCES `tests` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `questiontimes_ibfk_80` FOREIGN KEY (`test_id`) REFERENCES `tests` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `questiontimes_ibfk_81` FOREIGN KEY (`attempt_id`) REFERENCES `attempts` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `questiontimes_ibfk_82` FOREIGN KEY (`question_id`) REFERENCES `questions` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `questiontimes_ibfk_83` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `questiontimes_ibfk_84` FOREIGN KEY (`test_id`) REFERENCES `tests` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `questiontimes_ibfk_85` FOREIGN KEY (`attempt_id`) REFERENCES `attempts` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `questiontimes_ibfk_86` FOREIGN KEY (`question_id`) REFERENCES `questions` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `questiontimes_ibfk_87` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `questiontimes_ibfk_88` FOREIGN KEY (`test_id`) REFERENCES `tests` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `questiontimes_ibfk_89` FOREIGN KEY (`attempt_id`) REFERENCES `attempts` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `questiontimes_ibfk_9` FOREIGN KEY (`attempt_id`) REFERENCES `attempts` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `questiontimes_ibfk_90` FOREIGN KEY (`question_id`) REFERENCES `questions` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `questiontimes_ibfk_91` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `questiontimes_ibfk_92` FOREIGN KEY (`test_id`) REFERENCES `tests` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `questiontimes_ibfk_93` FOREIGN KEY (`attempt_id`) REFERENCES `attempts` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `questiontimes_ibfk_94` FOREIGN KEY (`question_id`) REFERENCES `questions` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `questiontimes_ibfk_95` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `questiontimes_ibfk_96` FOREIGN KEY (`test_id`) REFERENCES `tests` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `questiontimes_ibfk_97` FOREIGN KEY (`attempt_id`) REFERENCES `attempts` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `questiontimes_ibfk_98` FOREIGN KEY (`question_id`) REFERENCES `questions` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `questiontimes_ibfk_99` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `testbatches`
--
ALTER TABLE `testbatches`
  ADD CONSTRAINT `testbatches_ibfk_1` FOREIGN KEY (`test_id`) REFERENCES `tests` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `testbatches_ibfk_2` FOREIGN KEY (`batch_id`) REFERENCES `batches` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `testclasses`
--
ALTER TABLE `testclasses`
  ADD CONSTRAINT `testclasses_ibfk_1` FOREIGN KEY (`test_id`) REFERENCES `tests` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `testclasses_ibfk_2` FOREIGN KEY (`class_id`) REFERENCES `classes` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `tests`
--
ALTER TABLE `tests`
  ADD CONSTRAINT `tests_ibfk_1` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `tests_ibfk_10` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `tests_ibfk_11` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `tests_ibfk_12` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `tests_ibfk_13` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `tests_ibfk_14` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `tests_ibfk_15` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `tests_ibfk_16` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `tests_ibfk_17` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `tests_ibfk_18` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `tests_ibfk_19` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `tests_ibfk_2` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `tests_ibfk_20` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `tests_ibfk_21` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `tests_ibfk_22` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `tests_ibfk_23` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `tests_ibfk_24` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `tests_ibfk_25` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `tests_ibfk_26` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `tests_ibfk_27` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `tests_ibfk_28` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `tests_ibfk_29` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `tests_ibfk_3` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `tests_ibfk_30` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `tests_ibfk_31` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `tests_ibfk_32` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `tests_ibfk_33` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `tests_ibfk_34` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `tests_ibfk_35` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `tests_ibfk_36` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `tests_ibfk_37` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `tests_ibfk_38` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `tests_ibfk_39` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `tests_ibfk_4` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `tests_ibfk_40` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `tests_ibfk_41` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `tests_ibfk_42` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `tests_ibfk_43` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `tests_ibfk_44` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `tests_ibfk_45` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `tests_ibfk_46` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `tests_ibfk_47` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `tests_ibfk_48` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `tests_ibfk_49` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `tests_ibfk_5` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `tests_ibfk_50` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `tests_ibfk_51` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `tests_ibfk_52` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `tests_ibfk_53` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `tests_ibfk_54` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `tests_ibfk_6` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `tests_ibfk_7` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `tests_ibfk_8` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `tests_ibfk_9` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `Users_batch_id_foreign_idx` FOREIGN KEY (`batch_id`) REFERENCES `batches` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `Users_class_id_foreign_idx` FOREIGN KEY (`class_id`) REFERENCES `classes` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `users_ibfk_1` FOREIGN KEY (`class_id`) REFERENCES `classes` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `users_ibfk_10` FOREIGN KEY (`class_id`) REFERENCES `classes` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `users_ibfk_11` FOREIGN KEY (`class_id`) REFERENCES `classes` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `users_ibfk_12` FOREIGN KEY (`class_id`) REFERENCES `classes` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `users_ibfk_13` FOREIGN KEY (`class_id`) REFERENCES `classes` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `users_ibfk_14` FOREIGN KEY (`class_id`) REFERENCES `classes` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `users_ibfk_15` FOREIGN KEY (`class_id`) REFERENCES `classes` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `users_ibfk_16` FOREIGN KEY (`class_id`) REFERENCES `classes` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `users_ibfk_17` FOREIGN KEY (`batch_id`) REFERENCES `batches` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `users_ibfk_18` FOREIGN KEY (`class_id`) REFERENCES `classes` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `users_ibfk_19` FOREIGN KEY (`batch_id`) REFERENCES `batches` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `users_ibfk_2` FOREIGN KEY (`class_id`) REFERENCES `classes` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `users_ibfk_20` FOREIGN KEY (`class_id`) REFERENCES `classes` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `users_ibfk_21` FOREIGN KEY (`batch_id`) REFERENCES `batches` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `users_ibfk_22` FOREIGN KEY (`class_id`) REFERENCES `classes` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `users_ibfk_23` FOREIGN KEY (`batch_id`) REFERENCES `batches` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `users_ibfk_24` FOREIGN KEY (`class_id`) REFERENCES `classes` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `users_ibfk_25` FOREIGN KEY (`batch_id`) REFERENCES `batches` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `users_ibfk_26` FOREIGN KEY (`class_id`) REFERENCES `classes` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `users_ibfk_27` FOREIGN KEY (`batch_id`) REFERENCES `batches` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `users_ibfk_28` FOREIGN KEY (`class_id`) REFERENCES `classes` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `users_ibfk_29` FOREIGN KEY (`batch_id`) REFERENCES `batches` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `users_ibfk_3` FOREIGN KEY (`class_id`) REFERENCES `classes` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `users_ibfk_4` FOREIGN KEY (`class_id`) REFERENCES `classes` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `users_ibfk_5` FOREIGN KEY (`class_id`) REFERENCES `classes` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `users_ibfk_6` FOREIGN KEY (`class_id`) REFERENCES `classes` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `users_ibfk_7` FOREIGN KEY (`class_id`) REFERENCES `classes` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `users_ibfk_8` FOREIGN KEY (`class_id`) REFERENCES `classes` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `users_ibfk_9` FOREIGN KEY (`class_id`) REFERENCES `classes` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
