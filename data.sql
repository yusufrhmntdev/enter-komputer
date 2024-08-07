-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               8.3.0 - MySQL Community Server - GPL
-- Server OS:                    Win64
-- HeidiSQL Version:             12.7.0.6850
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

-- Dumping data for table enterkomp.categories: 3 rows
/*!40000 ALTER TABLE `categories` DISABLE KEYS */;
INSERT INTO `categories` (`id`, `name`) VALUES
	(1, 'Minuman'),
	(2, 'Makanan'),
	(3, 'Promo');
/*!40000 ALTER TABLE `categories` ENABLE KEYS */;

-- Dumping data for table enterkomp.orders: 4 rows
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
INSERT INTO `orders` (`id`, `table_id`, `total_price`, `created_at`) VALUES
	(1, 1, 87000.00, '2024-08-06 14:20:53'),
	(2, 1, 87000.00, '2024-08-06 14:33:02'),
	(3, 1, 87000.00, '2024-08-06 14:34:53'),
	(4, 2, 87000.00, '2024-08-06 14:38:55');
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;

-- Dumping data for table enterkomp.order_details: 20 rows
/*!40000 ALTER TABLE `order_details` DISABLE KEYS */;
INSERT INTO `order_details` (`id`, `order_id`, `product_id`, `quantity`, `price`) VALUES
	(1, 1, 1, 1, 12000.00),
	(2, 1, 6, 1, 6000.00),
	(3, 1, 11, 2, 23000.00),
	(4, 1, 3, 1, 8000.00),
	(5, 1, 8, 1, 15000.00),
	(6, 2, 1, 1, 12000.00),
	(7, 2, 6, 1, 6000.00),
	(8, 2, 11, 2, 23000.00),
	(9, 2, 3, 1, 8000.00),
	(10, 2, 8, 1, 15000.00),
	(11, 3, 1, 1, 12000.00),
	(12, 3, 6, 1, 6000.00),
	(13, 3, 11, 2, 23000.00),
	(14, 3, 3, 1, 8000.00),
	(15, 3, 8, 1, 15000.00),
	(16, 4, 1, 1, 12000.00),
	(17, 4, 6, 1, 6000.00),
	(18, 4, 11, 2, 23000.00),
	(19, 4, 3, 1, 8000.00),
	(20, 4, 8, 1, 15000.00);
/*!40000 ALTER TABLE `order_details` ENABLE KEYS */;

-- Dumping data for table enterkomp.printers: 3 rows
/*!40000 ALTER TABLE `printers` DISABLE KEYS */;
INSERT INTO `printers` (`id`, `station`, `name`, `category_id`) VALUES
	(1, 'A', 'Printer Kasir', 3),
	(2, 'B', 'Printer Dapur', 2),
	(3, 'C', 'Printer Bar', 1);
/*!40000 ALTER TABLE `printers` ENABLE KEYS */;

-- Dumping data for table enterkomp.products: 11 rows
/*!40000 ALTER TABLE `products` DISABLE KEYS */;
INSERT INTO `products` (`id`, `category_id`, `name`, `variant`, `price`) VALUES
	(1, 1, 'Jeruk', 'DINGIN', 12000.00),
	(2, 1, 'Jeruk', 'PANAS', 10000.00),
	(3, 1, 'Teh', 'MANIS', 8000.00),
	(4, 1, 'Teh', 'TAWAR', 5000.00),
	(5, 1, 'Kopi', 'DINGIN', 8000.00),
	(6, 1, 'Kopi', 'PANAS', 6000.00),
	(7, 1, 'Extra Es Batu', NULL, 2000.00),
	(8, 2, 'Mie', 'GORENG', 15000.00),
	(9, 2, 'Mie', 'KUAH', 15000.00),
	(10, 2, 'Nasi Goreng', NULL, 15000.00),
	(11, 3, 'Promo Nasi Goreng + Jeruk Dingin', NULL, 23000.00);
/*!40000 ALTER TABLE `products` ENABLE KEYS */;

-- Dumping data for table enterkomp.tables: 3 rows
/*!40000 ALTER TABLE `tables` DISABLE KEYS */;
INSERT INTO `tables` (`id`, `name`) VALUES
	(1, 'MEJA NO 1'),
	(2, 'MEJA NO 2'),
	(3, 'MEJA NO 3');
/*!40000 ALTER TABLE `tables` ENABLE KEYS */;

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
