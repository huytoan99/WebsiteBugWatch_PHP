-- phpMyAdmin SQL Dump
-- version 4.9.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 29, 2020 at 03:02 PM
-- Server version: 10.4.10-MariaDB
-- PHP Version: 7.3.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_sport`
--

-- --------------------------------------------------------

--
-- Table structure for table `tbl_admin`
--

CREATE TABLE `tbl_admin` (
  `admin_User` varchar(255) NOT NULL,
  `admin_Name` varchar(255) NOT NULL,
  `admin_Email` varchar(255) NOT NULL,
  `admin_Pass` varchar(255) NOT NULL,
  `level` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tbl_admin`
--

INSERT INTO `tbl_admin` (`admin_User`, `admin_Name`, `admin_Email`, `admin_Pass`, `level`) VALUES
('admin', 'Hồ Công Toàn', 'admin@admin.com', 'admin', 0),
('bonghoanho', 'Hoàng Anh Thư', 'starcard@gmail.com', '1', 1),
('thubiz', 'Lê Thị Thu', 'thule2406@gmail.com', '1', 1);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_brand`
--

CREATE TABLE `tbl_brand` (
  `brandId` int(11) NOT NULL,
  `brandName` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tbl_brand`
--

INSERT INTO `tbl_brand` (`brandId`, `brandName`) VALUES
(4, 'Casio'),
(5, 'Hublot'),
(7, 'Gucci'),
(16, 'Chanel'),
(34, 'Rolex'),
(35, 'Versace'),
(40, 'Omega'),
(44, 'Luis Vuitton');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_cart`
--

CREATE TABLE `tbl_cart` (
  `cartId` int(11) NOT NULL,
  `productName` varchar(255) NOT NULL,
  `ssId` varchar(255) NOT NULL,
  `price` int(11) NOT NULL,
  `size` varchar(20) NOT NULL,
  `quantity` int(11) NOT NULL,
  `image` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tbl_cart`
--

INSERT INTO `tbl_cart` (`cartId`, `productName`, `ssId`, `price`, `size`, `quantity`, `image`) VALUES
(225, 'Đồng Hồ Casio MTP-V005D-7B', 'cv9n0l7t6o7vo9htgqcdi8r6dn', 12000000, '', 2, 'Casio2.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_category`
--

CREATE TABLE `tbl_category` (
  `catId` int(11) NOT NULL,
  `catName` varchar(255) NOT NULL,
  `catSize` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tbl_category`
--

INSERT INTO `tbl_category` (`catId`, `catName`, `catSize`) VALUES
(21, 'Đồng Hồ', 'S'),
(22, 'Đồng Hồ', 'M'),
(23, 'Đồng Hồ', 'L');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_customer`
--

CREATE TABLE `tbl_customer` (
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `nameCus` varchar(255) NOT NULL,
  `emailCus` varchar(255) NOT NULL,
  `address` varchar(255) NOT NULL,
  `phone` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tbl_customer`
--

INSERT INTO `tbl_customer` (`username`, `password`, `nameCus`, `emailCus`, `address`, `phone`) VALUES
('huytoan', '1', 'Hồ Công Toàn', 'yeulaitudau269@gmail.com', 'Gia Xuyên - Gia Lộc - Hải Dương', 378605703),
('letrang', '1', 'Lê Thị Trang', 'Soibeti@gmail.com', 'Hải Dương', 19008198),
('manhtuan', '1', 'Hứa Mạnh Tuấn', 'Manhtuan@gmail.com', 'Kim Thành - Hải Dương', 123456789),
('truongmuong', '1', 'Đào Văn Trường', 'truongmuong@gmail.com', 'Yên Mỹ - Hưng Yên', 19009119);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_discount`
--

CREATE TABLE `tbl_discount` (
  `id_discount` int(11) NOT NULL,
  `code` varchar(255) NOT NULL,
  `discount` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tbl_discount`
--

INSERT INTO `tbl_discount` (`id_discount`, `code`, `discount`) VALUES
(1, 'donghodangcap', 10),
(2, 'dongho2020', 20),
(7, 'bugwatch2020', 30);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_order`
--

CREATE TABLE `tbl_order` (
  `order_Id` int(11) NOT NULL,
  `date` timestamp NOT NULL DEFAULT current_timestamp(),
  `buyer` varchar(255) NOT NULL,
  `receiver` varchar(255) NOT NULL,
  `phone` int(11) NOT NULL,
  `email` varchar(255) NOT NULL,
  `address` varchar(255) NOT NULL,
  `totalprice` bigint(20) NOT NULL,
  `status` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tbl_order`
--

INSERT INTO `tbl_order` (`order_Id`, `date`, `buyer`, `receiver`, `phone`, `email`, `address`, `totalprice`, `status`) VALUES
(114, '2020-11-27 04:26:59', 'manhtuan', 'Hứa Mạnh Tuấn', 123456789, 'Manhtuan@gmail.com', 'Kim Thành - Hải Dương', 15000000, '1'),
(115, '2020-11-27 04:28:47', 'letrang', 'Lê Thị Trang', 19008198, 'Soibeti@gmail.com', 'Hải Dương', 63000000, '2'),
(116, '2020-11-27 13:09:35', 'manhtuan', 'Hứa Mạnh Tuấn', 123456789, 'Manhtuan@gmail.com', 'Kim Thành - Hải Dương', 25000000, '2'),
(118, '2020-11-28 03:36:50', 'manhtuan', 'Hứa Mạnh Tuấn', 123456789, 'Manhtuan@gmail.com', 'Kim Thành - Hải Dương', 12000000, '2'),
(120, '2020-11-28 04:03:31', 'letrang', 'Lê Thị Trang', 19008198, 'Soibeti@gmail.com', 'Hải Dương', 36000000, '2'),
(121, '2020-11-28 04:14:40', 'letrang', 'Lê Thị Trang', 19008198, 'Soibeti@gmail.com', 'Hải Dương', 17700000, '1'),
(122, '2020-12-02 15:17:36', 'manhtuan', 'Hứa Mạnh Tuấn', 123456789, 'Manhtuan@gmail.com', 'Kim Thành - Hải Dương', 24000000, '1'),
(123, '2020-12-02 15:41:03', 'manhtuan', 'Hứa Mạnh Tuấn', 123456789, 'Manhtuan@gmail.com', 'Kim Thành - Hải Dương', 43500000, '1'),
(124, '2020-12-10 06:56:48', 'manhtuan', 'Phạm Thanh Toàn', 123456789, 'ThanhToan96@gmail.com', 'Thành Phố Hải Dương - Hải Dương', 40600000, '2'),
(127, '2020-12-10 08:02:54', 'manhtuan', 'Hứa Mạnh Tuấn', 123456789, 'Manhtuan@gmail.com', 'Kim Thành - Hải Dương', 74000000, '2'),
(130, '2020-12-10 15:48:16', 'manhtuan', 'Hứa Mạnh Tuấn', 123456789, 'Manhtuan@gmail.com', 'Kim Thành - Hải Dương', 99000000, '1'),
(131, '2020-12-14 16:27:52', 'manhtuan', 'Hứa Mạnh Tuấn', 123456789, 'Manhtuan@gmail.com', 'Kim Thành - Hải Dương', 495000000, '1'),
(134, '2020-12-15 03:10:26', 'manhtuan', 'Hứa Mạnh Tuấn', 1234567891, 'Manhtuan@gmail.com', 'Kim Thành - Hải Dương', 111000000, '2'),
(135, '2020-12-15 04:12:25', 'manhtuan', 'Hứa Mạnh Tuấn', 123456789, 'Manhtuan@gmail.com', 'Kim Thành - Hải Dương', 148000000, '2'),
(136, '2020-12-15 04:25:38', 'letrang', 'Lê Thị Trang', 19008198, 'Soibeti@gmail.com', 'Gia Lôc - Hải Dương', 495000000, '1'),
(137, '2020-12-15 04:32:56', 'letrang', 'Lê Thị Trang', 19008198, 'Soibeti@gmail.com', 'Gia Lộc - Hải Dương', 207000000, '1');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_orderdetails`
--

CREATE TABLE `tbl_orderdetails` (
  `id` int(11) NOT NULL,
  `id_order` int(11) NOT NULL,
  `productName` varchar(255) NOT NULL,
  `size` varchar(20) NOT NULL,
  `quantity` int(11) NOT NULL,
  `image` varchar(255) NOT NULL,
  `price` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tbl_orderdetails`
--

INSERT INTO `tbl_orderdetails` (`id`, `id_order`, `productName`, `size`, `quantity`, `image`, `price`) VALUES
(89, 115, 'Đồng Hồ Vercase 04', '', 1, 'Versace3.jpg', 63000000),
(93, 118, 'Đồng Hồ Casio MTP-V005D-7B', '', 1, 'Casio2.jpg', 12000000),
(94, 120, 'Đồng Hồ Casio WR-100M', '', 1, 'Casio.png', 36000000),
(95, 121, 'Đồng Hồ Casio MTP-V005GL-7B', '', 1, 'Casio3.jpg', 17700000),
(96, 122, 'Đồng Hồ Casio MTP-V005D-7B', '', 2, 'Casio2.jpg', 12000000),
(97, 123, 'Đồng Hồ Versace V-RACE DATE GMT', '', 1, 'Versace2.jpg', 43500000),
(98, 124, 'Đồng Hồ Versace Medusa', '', 1, 'Versace.jpg', 40600000),
(100, 127, 'Đồng Hồ Versace V-Metal', '', 2, 'versace-z.png', 37000000),
(103, 130, 'Đồng Hồ Chanel J12 H3099 Mens Automatic', '', 1, 'Channel2.jpg', 99000000),
(104, 131, 'Đồng Hồ Chanel J12 H3099 Mens Automatic', '', 5, 'Channel2.jpg', 99000000),
(107, 134, 'Đồng Hồ Versace V-Metal', '', 3, 'versace-z.png', 37000000),
(108, 135, 'Đồng Hồ Versace V-Metal', '', 4, 'versace-z.png', 37000000),
(109, 136, 'Đồng Hồ Chanel J12 H3099 Mens Automatic', '', 5, 'Channel2.jpg', 99000000),
(110, 137, 'Đồng Hồ Chanel Mademoiselle PRIVÉ H3567', '', 3, 'Channel.jpg', 69000000);

--
-- Triggers `tbl_orderdetails`
--
DELIMITER $$
CREATE TRIGGER `trg_delete` AFTER DELETE ON `tbl_orderdetails` FOR EACH ROW UPDATE tbl_product SET tbl_product.quantity = tbl_product.quantity + old.quantity
WHERE tbl_product.productName = old.productName AND tbl_product.size = old.size
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `trg_update` BEFORE INSERT ON `tbl_orderdetails` FOR EACH ROW UPDATE tbl_product SET tbl_product.quantity = tbl_product.quantity - new.quantity
WHERE tbl_product.productName = new.productName AND tbl_product.size = new.size
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_product`
--

CREATE TABLE `tbl_product` (
  `productId` int(11) NOT NULL,
  `productName` varchar(255) NOT NULL,
  `catId` int(11) NOT NULL,
  `brandId` int(11) NOT NULL,
  `size` varchar(20) NOT NULL,
  `price` bigint(255) NOT NULL,
  `quantity` int(11) NOT NULL,
  `image` varchar(255) NOT NULL,
  `type` int(11) NOT NULL,
  `description` longtext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tbl_product`
--

INSERT INTO `tbl_product` (`productId`, `productName`, `catId`, `brandId`, `size`, `price`, `quantity`, `image`, `type`, `description`) VALUES
(98, 'Đồng Hồ Casio WR-50M', 21, 4, 'Nhỏ', 16000000, 50, 'Casio.jpg', 0, 'Bộ sản phẩm chính hãng gồm:\r\nFullbox đồng hồ, hộp đựng\r\nThẻ bảo hành chính hãng Casio xem chính sách bảo hành\r\nTem chống hãng giả CASIO sau nắp lưng đồng hồ.\r\nSách hướng dẫn sử dụng.\r\nQuà tặng: Thẻ MRG thay pin miễn phí trọn đời cho sản phẩm trị giá 500.000đ'),
(99, 'Đồng Hồ Casio WR-100M', 21, 4, 'L', 36000000, 50, 'Casio.png', 1, 'Bộ sản phẩm chính hãng gồm:\r\nFullbox đồng hồ, hộp đựng\r\nThẻ bảo hành chính hãng Casio xem chính sách bảo hành\r\nTem chống hãng giả CASIO sau nắp lưng đồng hồ.\r\nSách hướng dẫn sử dụng.\r\nQuà tặng: Thẻ MRG thay pin miễn phí trọn đời cho sản phẩm trị giá 500.000đ'),
(100, 'Đồng Hồ Casio MTP-V005D-7B', 21, 4, 'Nhỏ', 12000000, 49, 'Casio2.jpg', 1, 'Bộ sản phẩm chính hãng gồm:\r\nFullbox đồng hồ, hộp đựng\r\nThẻ bảo hành chính hãng Casio xem chính sách bảo hành\r\nTem chống hãng giả CASIO sau nắp lưng đồng hồ.\r\nSách hướng dẫn sử dụng.\r\nQuà tặng: Thẻ MRG thay pin miễn phí trọn đời cho sản phẩm trị giá 500.000đ'),
(105, 'Đồng Hồ Casio MTP-V005GL-7B', 21, 4, 'Bình Thường', 17700000, 19, 'Casio3.jpg', 0, 'Bộ sản phẩm chính hãng gồm:\r\nFullbox đồng hồ, hộp đựng\r\nThẻ bảo hành chính hãng Casio xem chính sách bảo hành\r\nTem chống hãng giả CASIO sau nắp lưng đồng hồ.\r\nSách hướng dẫn sử dụng.\r\nQuà tặng: Thẻ MRG thay pin miễn phí trọn đời cho sản phẩm trị giá 500.000đ'),
(108, 'Đồng Hồ Versace Medusa', 21, 35, 'S', 40600000, 30, 'Versace.jpg', 1, 'Táo bạo và hiện đại, lớp vỏ tông màu vàng của đồng hồ Medusa Frame được bao bọc bởi bốn đinh tán Medusa tinh tế. Mặt đồng hồ màu đen có các vạch chỉ số La Mã được viền bằng hoa văn Greca. Chiếc đồng hồ nổi bật có thể được tạo kiểu với một chiếc vòng đeo tay bằng da màu xanh nước biển đương đại hoặc với một tấm kim sa tự hào với bản in Jungle mang tính biểu tượng.'),
(109, 'Đồng Hồ Versace Daphnis', 21, 35, 'S', 85000000, 30, 'Versace1.jpg', 0, 'Kể từ những năm 70, Versace đã theo đuổi một tầm nhìn về thời trang không có gì xa hoa và suy đồi. Đồng hồ Divine cũng không khác. Phù hợp với tông màu vàng xanh yêu thích của thương hiệu, nó có vỏ bằng thép không gỉ mạ vàng trên mặt số màu xanh lam và dây đeo màu xanh lam. Được tạo điểm nhấn xuyên suốt với thiết kế chìa khóa Hy Lạp cổ điển, nó vừa táo bạo vừa tinh tế. Mặc nó như một phần nhân dịp.'),
(110, 'Đồng Hồ Versace V-RACE DATE GMT', 21, 35, 'S', 43500000, 30, 'Versace2.jpg', 1, 'Mẫu đồng hồ mốt năm 2018, loại vật liệu cửa sổ quay số Tinh thể sapphire Điều trị chống phản xạ. Loại hiển thị Analog, bướm Clasp, đường kính vỏ 46 mm. Độ dày vỏ 11,95 mm, chiều rộng dải 14,9 mm, màu bạc, màu quay số Màu xanh lam.Phong trào Quartz 3 tay. Độ sâu chống nước 100 Mét'),
(111, 'Đồng Hồ Vercase Vanity Diamon', 21, 35, 'S', 63000000, 19, 'Versace3.jpg', 1, 'Đồng hồ Thụy Sĩ Versace Vanity Diamond 35mm. Ronda 762.3 - Bộ chuyển động 2 kim thạch anh Thụy Sĩ\r\nVỏ thép không gỉ IP màu vàng hồng; Nhẫn bên trong với 53 viên kim cương (0,269 ct)\r\nSwiss-quartz Movement\r\nĐường kính vỏ: 35mm\r\nChống nước đến 99 feet\r\nHình dạng mục\r\nLoại vật liệu cửa sổ quay số Sapphire chống phản chiếu\r\nLoại hiển thị Analog'),
(112, 'Đồng Hồ Rolex Datejust', 21, 34, 'L', 81000000, 200, 'Rolex.png', 0, 'Sau thành công vang dội từ bộ sưu tập Datejust sau khi được nâng cấp lên model 2018, năm nay hãng đồng hồ Rolex tiếp tục giới thiệu tới người chơi đồng hồ trên Thế Giới thêm những sự lựa chọn mới. Sự lựa chọn của những mẫu đồng hồ thép. Và Rolex Datejust chính là một trong những chiếc đồng hồ chúng tôi muốn giới thiệu đến các bạn.'),
(134, 'Đồng Hồ Rolex Datejust Mặt Số Xanh Cọc Dạ Quang', 21, 34, 'S', 56000000, 500, 'Rolex1.png', 1, 'Đồng hồ Oyster Perpetual Datejust 31 bằng Rolesor vàng đi kèm mặt số màu xanh olive, nạm kim cương và dây đeo Jubilee.\r\nMặt số đi kèm Bộ VI lớn nạm kim cương. Phản xạ ánh sáng trên các vành và vấu làm nổi bật cấu trúc thanh lịch của vỏ Oyster 31 mm , rất phù hợp với đai kính Rãnh. Về phương diện thẩm mỹ, phiên bản Datejust đã tồn tại qua nhiều thời đại, trong khi giữ lại những quy tắc cấu thành sản phẩm, đặc biệt với các phiên bản truyền thống, một trong những yếu tố biểu tượng và dễ nhận diện của đồng hồ.'),
(135, 'Đồng Hồ Rolex Datejust Mặt Số Hồng Cọc Số La Mã', 21, 34, 'S', 52000000, 500, 'Rolex3.png', 0, 'Rolex sử dụng chất liệu thép Oystersteel cho các vỏ đồng hồ bằng thép. Oystersteel do thương hiệu Rolex đặc biệt phát triển và thuộc dòng thép 904L, loại hợp kim được sử dụng phổ biến nhất trong ngành công nghệ cao, hàng không và hóa chất, những ngành mà độ kháng mòn cực đại là điều thiết yếu. Oystersteel có sức bền ưu việt và có độ sáng bóng tuyệt vời một khi được đánh bóng, đồng thời lưu giữ được vẻ đẹp thậm chí trong những môi trường khắc nghiệt nhất.'),
(136, 'Đồng Hồ Hublot Spirit Of Big Bang', 21, 5, 'M', 82000000, 50, 'Hublot-z.jpg', 1, 'Tham chiếu 641.Om.0183.Lr\r\nKích thước vỏ 42 mm\r\nVỏ bằng vàng 18k King được hoàn thiện và đánh bóng bằng satin\r\nBezel Gốm đen hoàn thiện, đánh bóng và thổi vi tinh\r\nVới 6 vít titan hình chữ H\r\nVỏ bên trong\r\nSapphire pha lê với xử lý chống phản xạ\r\nQuay số Sapphire\r\nDây đeo cao su đen và dây đeo cá sấu\r\nClasp 18k King Gold và Black-Plated Titanium Deployant Buckle Clasp\r\nHoạt động bên trong\r\nHub chuyển động4700\r\nBộ chuyển động Chronograph Skeleton Tự lên dây cót\r\nDự trữ năng lượng 50 giờ\r\nChống nước 100m'),
(137, 'Đồng Hồ Hublot Classic Fusion', 21, 5, 'L', 10000000, 49, 'Hublot1.jpg', 0, 'Vỏ titan được đánh bóng với các liên kết trung tâm trên và dưới được chải hoàn thiện giữa các vấu.\r\nGờ bằng titan với mặt trên được chải bóng và cạnh vát hoàn thiện được đánh bóng, được bảo vệ bằng 6 vít titan kiểu chữ \"H\" được đánh bóng.\r\nVương miện titan đánh bóng khắc logo Hublot.\r\n\"Vấu gờ\" bằng nhựa composite màu đen kẹp giữa gờ và vỏ.\r\nMặt số hoàn thiện màu xám sunray satin.\r\nĐã áp dụng điểm đánh dấu giờ chỉ mục.\r\nTay mạ rhodium đánh bóng.\r\nCửa sổ ngày nằm ở vị trí 3 giờ.\r\nHublot Quartz / HUB2912 cỡ nòng chạy bằng pin, được cấu tạo từ 38 bộ phận.'),
(138, 'Đồng Hồ Hublot Classion', 21, 5, 'XXL', 15000000, 19, 'Hublot2.jpg', 1, 'Đặc điểm kỹ thuật Vỏ ngoài\r\nTham chiếu 510.No.1180.No\r\nKích thước vỏ 45 mm\r\nVỏ bằng titan hoàn thiện và đánh bóng bằng satin\r\nBezel\r\nVàng 18k King được hoàn thiện và đánh bóng bằng satin\r\n6 vít Titan hình chữ H\r\nVỏ bên trong\r\nSapphire pha lê với xử lý chống phản xạ\r\nQuay số màu đen mờ\r\nDây đeo bằng chất liệu Satin hoàn thiện bằng vàng 18k King và Titanium đánh bóng\r\nClasp\r\nKhóa móc khóa Titan\r\nHoạt động bên trong\r\nTrung tâm chuyển động1112\r\nChuyển động tự quanh co\r\nDự trữ năng lượng 42 giờ\r\nKhả năng chống nước 50m hoặc 5 atm'),
(139, 'Đồng Hồ Hublot Classic DRX', 21, 5, 'S', 78000000, 60, 'Hublot3.png', 1, 'Tham chiếu 525.Nx.0123.Vr.Nyg16\r\nKích thước vỏ 45 mm\r\nVỏ bằng titan hoàn thiện và đánh bóng bằng satin\r\nBezel\r\nTitanium hoàn thiện và đánh bóng bằng satin\r\nMô tả Bezel Lug\r\nNhựa tổng hợp màu xanh\r\nVỏ bên trong\r\nSapphire pha lê với xử lý chống phản xạ\r\nQuay số Đính sơn màu xanh lam\r\nBàn tay màu xanh da trời Lacquered Hands; Kim giây sơn màu xanh và đỏ\r\nDây đeo cao su xanh và bắp chân xanh với đường khâu màu xanh\r\nChốt khóa bằng thép không gỉ\r\nHoạt động bên trong\r\nChuyển động\r\nCalibre Hublot Hub1155\r\nChronograph Skeleton Tự Lên Dây\r\nDự trữ năng lượng 42 giờ\r\nChống nước 5 Atm (50m)'),
(140, 'Đồng Hồ Gucci Le Marché Des Merveilles', 21, 7, 'S', 28200000, 20, 'Gc.jpg', 1, 'Vỏ và gờ bằng PVD màu vàng vàng đánh bóng 38mm có đinh tán hình chóp Mặt đồng hồ bằng đá tổng hợp màu xanh lam ngọc lam với chỉ số con ong ở mức 12 giờ Đồng hồ, mặt sau bằng thép không gỉ có khắc hình con ong Dây đeo cá sấu đen với khóa PVD vàng vàng Bộ chuyển động thạch anh ETA.'),
(141, 'Đồng Hồ Chanel  J12 H4189 Unisex Ceramic ', 21, 16, 'To', 51000000, 50, 'Channel3.jpg', 1, 'Vỏ gốm đen được đánh bóng cao.\r\nBộ vòng bezel bằng thép với hàng 53 viên kim cương trắng Wesselton chất lượng VS Quality Top (0,96 carat).\r\nDây đeo cá sấu đen với các vòng thép được đính 9 viên kim cương.\r\nBộ khóa bằng thép với 17 viên kim cương (0,27 carat).\r\nBộ mặt số sơn mài màu đen với 8 vạch giờ kim cương và các chữ số Ả Rập bằng thép áp dụng cho 12, 3, 6 và 9.\r\nKim và vành thép đánh bóng xung quanh vạch giây.\r\nCác chỉ số theo dõi phút màu trắng được sơn.'),
(142, 'Đồng Hồ Chanel Mademoiselle', 21, 16, 'a', 83415000, 50, 'Channel1.jpg', 1, 'Vỏ bằng vàng trắng 18K, được đính 60 viên kim cương cắt rực rỡ (~ 1 carat).\r\nMặt số mã não được trang trí bằng một bông hoa trà trong bộ khảm xà cừ với 7 chỉ số kim cương cắt sáng chói.\r\nBộ chuyển động thạch anh chính xác cao.\r\nVương miện onyx cabochon.\r\nDây đeo sa tanh đen với khóa ardillon bằng vàng trắng 18K với 80 viên kim cương cắt rực rỡ (~ 0,49 carat).\r\nKhả năng chống nước: 30 mét.\r\nĐường kính: 37,5 mm.'),
(144, 'Đồng Hồ Omega De Ville', 21, 40, 'S', 84000000, 20, 'Omega.jpg', 0, 'Đồng hồ có vỏ bằng thép không gỉ 39,5 mm và mặt số màu xanh lam được đánh bóng và sơn mài với họa tiết gấu bông OMEGA tinh tế. Logo gấu bông trên ốp lưng chải dọc cũng được thiết kế đặc biệt dành riêng cho bộ sưu tập này.\r\nMặt số có các chữ số La Mã hình vòm được đánh bóng cũng như kim giây trung tâm màu xanh lam. Có một cửa sổ ngày ở vị trí 3 giờ và đồng hồ được trình bày trên dây da màu xanh lam. Bên trong, nó được trang bị bộ máy Co-Axial Calibre 2500 của OMEGA.\r\nTinh thể sapphire CrystalDomed, chống xước với xử lý chống phản chiếu bên trong.'),
(145, 'Đồng Hồ Omega Deville Prestige', 21, 40, 'To', 72000000, 50, 'Omega1.jpg', 0, 'OMEGA De Ville Prestige là một chiếc đồng hồ mang vẻ đẹp đích thực dựa trên sự mê hoặc và thẩm mỹ của thiên nhiên.\r\nMẫu đồng hồ này có mặt số được đặt bằng kim cương màu sâm panh với họa tiết hình con bướm độc đáo đạt được bằng kỹ thuật ramolayage hay còn gọi là \"vật trang trí được dập\". Vòng bezel vàng 18K được đính kim cương được gắn trên thân vỏ bằng thép không gỉ 32,7 mm và được thể hiện trên dây đeo bằng thép vàng hai tông màu vàng. Trung tâm của chiếc De Ville Prestige \"Butterfly\" này là bộ máy thạch anh OMEGA 4061.'),
(146, 'Đồng Hồ Hublot Automatic Classic', 21, 5, 'S', 26900000, 20, 'Hublot-5.jpg', 1, 'Vỏ bằng titan được đánh bóng với các liên kết trung tâm trên và dưới được chải hoàn thiện giữa các vấu. Bộ gờ bằng titan với 36 diamon (khoảng 1,20 carat) được bảo vệ bằng 6 ốc titan kiểu chữ \"H\" được đánh bóng. Vương miện bằng titan đánh bóng khắc logo Hublot. Vòng đeo tay bằng titan với các liên kết bên ngoài được đánh bóng và các liên kết trung tâm hoàn thiện được chải. Mặt số màu xanh dương nhạt. Đã áp dụng điểm đánh dấu giờ chỉ mục. Tay mạ rhodium đánh bóng.'),
(147, 'Đồng Hồ Gucci G-Timeless Watch 38MM', 21, 7, 'S', 21880000, 20, 'Gucci.jpg', 0, 'Các yếu tố đến từ thế giới động vật tiếp tục truyền cảm hứng cho Ngôi nhà và được giới thiệu theo những cách mới mỗi mùa. Đối với Cruise 2018, mô tả những chú chó sục Boston của Giám đốc Sáng tạo xuất hiện xuyên suốt bộ sưu tập. Hình ảnh của Orso, một trong hai người bạn đồng hành thân yêu của anh, được làm nổi bật ở trung tâm của mặt số được đặt dựa trên mô-típ GG.\r\nVỏ PVD màu vàng nhạt màu vàng nhạt với mặt số bằng vải GG cao cấp với chi tiết Orso của giống chó sục Boston, dây đeo bằng vải cao cấp.'),
(148, 'Đồng Hồ Gucci G-TIMELESS Automatic Leather', 21, 7, 'S', 43800000, 20, 'Gucci1.jpg', 1, 'Đương đại và phong cách, bộ sưu tập đồng hồ G-Timeless của Gucci mang đến những thiết kế hoàn toàn hiện đại.\r\nDây da đen\r\nVỏ thép không gỉ tròn, 40mm\r\nMặt số được chải mặt trời tông màu bạc với hoa văn diamante, chỉ số thanh, hai kim, mặt số phụ, cửa sổ ngày và logo\r\nChuyển động tự động Thụy Sĩ\r\nChống nước ở độ sâu 50 mét'),
(149, 'Đồng Hồ Gucci G-Timeless Lilac', 21, 7, 'S', 49600000, 30, 'Gucci2.jpg', 0, 'Dòng Gucci, G-Timeless có vỏ 38mm bằng thép không gỉ, với gờ cố định, mặt số màu hoa cà và mặt kính sapphire chống xước.\r\nDây da được trang bị một móc khóa.\r\nĐồng hồ đeo tay tuyệt đẹp này, chạy bằng bộ máy thạch anh Thụy Sĩ hỗ trợ: các chức năng giờ, phút.\r\nĐồng hồ này có khả năng chống nước lên đến 165 feet / 50 mét, thích hợp cho các hoạt động bơi lội giải trí trong thời gian ngắn, nhưng không phải lặn hoặc lặn với ống thở.\r\nChiếc đồng hồ phong cách được sản xuất tại Thụy Sĩ này chắc chắn sẽ hoàn thành bộ sưu tập của bất kỳ phụ nữ nào.'),
(150, 'Đồng Hồ Gucci G-TIMELESS LILAC', 21, 7, 'S', 24000000, 20, 'Gucci3.jpg', 0, 'Được thiết kế với vỏ thép và vòng đeo tay được hoàn thiện với mặt số mạ bạc màu bạc để có vẻ ngoài sang trọng, một phần bổ sung mới cho bộ sưu tập G-Timeless được giới thiệu cho Pre-Fall 2019. Ở trung tâm là con ong Gucci, được bao quanh bởi các mã khác của Nhà được hiển thị dưới dạng chỉ số của đồng hồ, bao gồm ngôi sao và G lồng vào nhau.'),
(151, 'Đồng Hồ Gucci GUCCI G - TIMELESS WATCH 36MM S', 21, 7, 'S', 22000000, 20, 'Gucci5.jpg', 0, 'Thương hiệu Gucci\r\nTương tự / Tương tự kỹ thuật số\r\nĐộ sâu trường hợp xấp xỉ. 8.00mm\r\nVật liệu chính thép không gỉ\r\nTrường hợp hình tròn\r\nChiều rộng thùng máy xấp xỉ. 36,00mm\r\nMặt số Màu đen xà cừ\r\nGiới tính Nữ\r\nKính Sapphire\r\nBộ sưu tập mô hình G-Timeless Slim\r\nNguồn phong trào Thụy Sĩ\r\nPhong trào: Quartz\r\nLoại đá kim cương\r\nMàu dây đeo Đen\r\nLoại dây đeo Dây da\r\nChống nước 50 mét'),
(152, 'Đồng Hồ Hublot Luxury GG', 21, 5, 'S', 114200000, 10, 'Hublot-6.jpg', 1, 'Tham chiếu 465.Oe.9010.Rw.1604\r\nKích thước vỏ 39 MM\r\nVàng 18k đánh bóng\r\nĐặt với 118 viên kim cương cho 0,84ct\r\nVàng 18k đánh bóng\r\nĐặt với 42 viên kim cương cho 1,00ct\r\nVới 6 vít titan hình chữ H\r\nVỏ bên trong pha lê\r\nSapphire với điều trị chống phản xạ\r\nQuay số: Bộ quay số với 307 viên kim cương cho 1,75 lần\r\nDây đeo cao su có cấu trúc màu trắng\r\nClasp 18k King Gold và Gold-Plated Titanium Deployant Buckle Clasp'),
(153, 'Đồng Hồ Omega Specialities', 21, 40, 'S', 36300000, 20, 'Omegaa.jpg', 1, 'Ngay từ cái nhìn đầu tiên, chiếc Đồng hồ bấm giờ Co-Axial Limited Edition này mang đến cho bạn cảm giác thể thao xuất sắc và chiến thắng ngay lập tức. Chỉ với 188 chiếc có sẵn, đây là sự kỷ niệm hoàn hảo về vai trò lịch sử của OMEGA với tư cách là Máy chấm công Olympic chính thức.'),
(154, 'Đồng Hồ Hublot Spirit Of Big Bang', 21, 5, 'M', 82000000, 50, 'Hublot-z.jpg', 1, 'Tham chiếu 641.Om.0183.Lr\r\nKích thước vỏ 42 mm\r\nVỏ bằng vàng 18k King được hoàn thiện và đánh bóng bằng satin\r\nBezel Gốm đen hoàn thiện, đánh bóng và thổi vi tinh\r\nVới 6 vít titan hình chữ H\r\nVỏ bên trong\r\nSapphire pha lê với xử lý chống phản xạ\r\nQuay số Sapphire\r\nStrap & Clasp\r\nDây đeo cao su đen và dây đeo cá sấu\r\nClasp 18k King Gold và Black-Plated Titanium Deployant Buckle Clasp\r\nHoạt động bên trong\r\nHub chuyển động4700\r\nBộ chuyển động Chronograph Skeleton Tự lên dây cót\r\nDự trữ năng lượng 50 giờ\r\nChống nước 100m'),
(155, 'Đồng Hồ Chanel Mademoiselle PRIVÉ H3567', 21, 16, 'S', 69000000, 20, 'Channel.jpg', 1, 'Vỏ bằng vàng 18 carat với vòng tay sa tanh đen. Vòng bezel đặt kim cương cố định. Sơn mài đen với mặt số màu vàng camellias vàng với kim đồng hồ tông vàng. Loại quay số: Analog. Chuyển động tự động với khoảng 42 giờ dự trữ năng lượng. Kéo / đẩy vương miện. Kích thước vỏ: 37,5 mm. Hình dạng hộp tròn. Chống nước ở 30 mét / 100 feet. Chức năng: giờ, phút. Thông tin bổ sung: bộ vương miện với một cabochon mã não, bộ vỏ với 60 viên kim cương cắt rực rỡ (~ 1 carat), bộ khóa với 80 viên kim cương cắt rực rỡ (~ 0,49 carat). Kiểu dáng đồng hồ sang trọng. Nhãn đồng hồ: Swiss Made. Đồng hồ nữ tự động Chanel Mademoiselle Prive Camelia'),
(156, 'Đồng Hồ Rolex Cellini', 21, 34, 'S', 29400000, 20, 'Rolex-12.jpg', 1, 'Là một cây đại thụ trong ngành chế tác đồng hồ cao cấp thế giới, Rolex luôn mang đến công chúng những cỗ máy thời gian trang nhã, thanh lịch mà không kém phần phức tạp với bộ máy tân tiến với nhiều tính năng hữu ích. Nhắc đến Rolex, người ta không chỉ nhắc đến những bộ sưu tập huyền thoại mà còn ấn tượng với khả năng sáng tạo không ngừng của thương hiệu. Trong bài viết lần này, BUG Watch muốn giới thiệu đến quý khách hàng một model của bộ sưu tập đồng hồ Rolex mới ra mắt, chiếc Rolex Cellini Time 50505 sở hữu thiết kế cổ điển, sang trọng và quý phái.'),
(157, 'Đồng Hồ Omega Constellation', 21, 16, 'a', 101000000, 20, 'Omega5.jpg', 1, 'Thiết kế ấn tượng và độ bền của OMEGA Constellation được đặc trưng bởi hình bán nguyệt nổi tiếng, “móng tay” trên vỏ và vòng đeo tay.\r\n \r\nĐồng hồ mẫu bằng vàng và thép không màu 18K Sedna ™ 29 mm này có gờ được các chữ La Mã, mặt số màu trắng bạc pha lê với vạch kim cương và cửa sổ ngày ở vị trí 6 giờ. Kim đồng hồ, logo OMEGA, ngôi sao Constellation và các giá đỡ kim cương cũng bằng vàng Sedna ™ 18K.\r\nTrung tâm của đồng hồ này là máy OMEGA Co-Axial Master Chronometer Calibre 8700, có thể nhìn thấy qua mặt kính sapphire chống mờ.'),
(158, 'Đồng Hồ Chanel Premiere H2434 Ladies', 21, 16, 'S', 18500000, 20, 'Channel-0.jpg', 1, 'Vỏ hình bát giác bằng thép không gỉ với dây đeo cao su màu đen. Bộ gờ được đính kim cương. Mặt số sơn mài đen với bốn vạch giờ kim cương và kim bằng thép. '),
(159, 'Đồng Hồ Chanel J12 H3099 Mens Automatic', 21, 16, 'S', 99000000, 20, 'Channel2.jpg', 1, 'Đồng hồ dòng J12 Chromatic được chế tạo từ vật liệu chống xước cao với độ cứng gần bằng sapphire. Màu sắc và độ lấp lánh độc đáo của nó có được bằng cách thêm titan vào gốm và sau đó đánh bóng bằng bột kim cương.\r\nVỏ và vòng đeo tay bằng gốm sứ và titaninum được đánh bóng cao.\r\nGờ bằng thép và gờ bằng gốm đen với các chỉ số 24 giờ cho chức năng GMT.\r\nMặt số màu xám than với lớp hoàn thiện bằng sa tanh dọc ở trung tâm và kết cấu guilloche tròn đồng tâm trên phần còn lại của mặt số.\r\nKim phát quang và các vạch giờ bằng chữ số Ả Rập được áp dụng ..\r\nCác chỉ mục theo dõi giây được sơn màu trắng.\r\nCửa sổ ngày nằm giữa vị trí 4 và 5 giờ.'),
(160, 'Đồng Hồ Versace V-Metal', 21, 35, 'S', 37000000, 20, 'versace-z.png', 1, 'Năng lượng của Đồng hồ Versace được khẳng định bằng Biểu tượng kim loại V mới. Khác thường và hấp dẫn, nó lấy cảm hứng từ một chiếc khóa dây đeo cổ điển, được xem xét lại theo một cách giải thích sáng tạo.'),
(165, 'Đồng Hồ Gucci G-Timeless Men\'s', 21, 7, 'S', 21350000, 10, 'a037bfdf6b.jpg', 1, 'Rất xịn'),
(168, 'Đồng Hồ Gucci G-Timeless Men\'s', 21, 40, 'M', 21350000, 10, '0810ab2453.jpg', 0, 'Rất xịn'),
(170, 'Đồng Hồ  LV Galaxy', 21, 44, 'M', 50000000, 10, '3f6b191cc9.png', 1, ' Chiếc đồng hồ này được thiết kế với cảm giác truyền thống, được đặt cạnh các mã lấy cảm hứng từ thẩm mỹ mới của Gucci. Thiết kế mặt số đặc biệt là duy nhất của Gucci: nó hiển thị các họa tiết của nhà, bao gồm con ong, ngôi sao và trái tim, cũng như các yếu tố điển hình thường thấy trên vỏ sau.');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tbl_admin`
--
ALTER TABLE `tbl_admin`
  ADD PRIMARY KEY (`admin_User`) USING BTREE;

--
-- Indexes for table `tbl_brand`
--
ALTER TABLE `tbl_brand`
  ADD PRIMARY KEY (`brandId`);

--
-- Indexes for table `tbl_cart`
--
ALTER TABLE `tbl_cart`
  ADD PRIMARY KEY (`cartId`);

--
-- Indexes for table `tbl_category`
--
ALTER TABLE `tbl_category`
  ADD PRIMARY KEY (`catId`);

--
-- Indexes for table `tbl_customer`
--
ALTER TABLE `tbl_customer`
  ADD PRIMARY KEY (`username`);

--
-- Indexes for table `tbl_discount`
--
ALTER TABLE `tbl_discount`
  ADD PRIMARY KEY (`id_discount`);

--
-- Indexes for table `tbl_order`
--
ALTER TABLE `tbl_order`
  ADD PRIMARY KEY (`order_Id`);

--
-- Indexes for table `tbl_orderdetails`
--
ALTER TABLE `tbl_orderdetails`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_order` (`id_order`);

--
-- Indexes for table `tbl_product`
--
ALTER TABLE `tbl_product`
  ADD PRIMARY KEY (`productId`),
  ADD KEY `catId` (`catId`),
  ADD KEY `brandId` (`brandId`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `tbl_brand`
--
ALTER TABLE `tbl_brand`
  MODIFY `brandId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=45;

--
-- AUTO_INCREMENT for table `tbl_cart`
--
ALTER TABLE `tbl_cart`
  MODIFY `cartId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=245;

--
-- AUTO_INCREMENT for table `tbl_category`
--
ALTER TABLE `tbl_category`
  MODIFY `catId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=58;

--
-- AUTO_INCREMENT for table `tbl_discount`
--
ALTER TABLE `tbl_discount`
  MODIFY `id_discount` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `tbl_order`
--
ALTER TABLE `tbl_order`
  MODIFY `order_Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=138;

--
-- AUTO_INCREMENT for table `tbl_orderdetails`
--
ALTER TABLE `tbl_orderdetails`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=111;

--
-- AUTO_INCREMENT for table `tbl_product`
--
ALTER TABLE `tbl_product`
  MODIFY `productId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=171;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `tbl_orderdetails`
--
ALTER TABLE `tbl_orderdetails`
  ADD CONSTRAINT `tbl_orderdetails_ibfk_1` FOREIGN KEY (`id_order`) REFERENCES `tbl_order` (`order_Id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `tbl_product`
--
ALTER TABLE `tbl_product`
  ADD CONSTRAINT `tbl_product_ibfk_1` FOREIGN KEY (`catId`) REFERENCES `tbl_category` (`catId`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `tbl_product_ibfk_2` FOREIGN KEY (`brandId`) REFERENCES `tbl_brand` (`brandId`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
