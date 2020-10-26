-- MySQL dump 10.13  Distrib 8.0.18, for Win64 (x86_64)
--
-- Host: localhost    Database: bookstore_nmcnpm
-- ------------------------------------------------------
-- Server version	8.0.18

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `address`
--

DROP TABLE IF EXISTS `address`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `address` (
  `id` int(5) NOT NULL AUTO_INCREMENT,
  `user_id` int(5) DEFAULT NULL,
  `is_default` int(11) DEFAULT '0',
  `full_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(12) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `detail` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `address_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `address`
--

LOCK TABLES `address` WRITE;
/*!40000 ALTER TABLE `address` DISABLE KEYS */;
INSERT INTO `address` VALUES (4,10,0,'ÁDASDAS','DÂSDDSAD','DSDAS'),(5,NULL,0,'ÁDASDAS','0987631542','sadasd'),(6,NULL,0,'ÁDASDAS','0987631542','sadasd'),(7,10,0,'Nguyễn Sỹ Thanh','03821032980','Số 5, Ngõ Đại Đồng'),(8,NULL,0,'nguyenson','123145678','số 1 Đại Cồ Việt');
/*!40000 ALTER TABLE `address` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `book`
--

DROP TABLE IF EXISTS `book`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `book` (
  `id` int(55) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `author` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `publisher_id` int(5) DEFAULT NULL,
  `category_id` int(5) DEFAULT NULL,
  `image` varchar(300) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `total` int(3) DEFAULT NULL,
  `price` int(11) DEFAULT NULL,
  `year` int(4) DEFAULT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `num_purchase` int(11) DEFAULT '0',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `rating` int(11) DEFAULT '5',
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNQ_book_name` (`name`,`author`),
  KEY `publisher_id` (`publisher_id`),
  KEY `category_id` (`category_id`),
  FULLTEXT KEY `FullText` (`name`),
  CONSTRAINT `book_ibfk_1` FOREIGN KEY (`publisher_id`) REFERENCES `publisher` (`id`) ON DELETE SET NULL,
  CONSTRAINT `book_ibfk_2` FOREIGN KEY (`category_id`) REFERENCES `category` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `book`
--

LOCK TABLES `book` WRITE;
/*!40000 ALTER TABLE `book` DISABLE KEYS */;
INSERT INTO `book` VALUES (1,'Tuổi trẻ đáng giá bao nhiêu','Andrew Matthews',5,3,'/img/books/tuoitredanggiabaonhieu.jpg',9994,38000,2016,'Quyển sách này nói về việc tại sao có những người dường như lúc nào cũng ở đúng nơi và đúng lúc - và làm thế nào bạn cũng được như họ; tại sao hóa đơn tính tiền luôn luôn tới ngay tức khắc; tại sao đèn giao thông cứ ở màu đỏ hoài cả nửa ngày trong khi bạn đang trễ một cuộc hẹn làm ăn; tại sao đi du lịch Tây Ban Nha mà bạn cũng gặp người láng giềng sát bên nhà; tại sao bạn chạy chiếc xe cà tàng suốt 15 năm ròng rã mà chưa bao giờ va quẹt... thế rồi chiếc xe mới mua mới chạy có hai ngày đã đụng móp mui!  Quyển sách này nói về: hiểu được bản thân, biết khôi hài về bản thân, trở nên suôn sẻ thuận lợi, biết tha thứ cho bản thân. Sách cũng bàn về việc nhận thức được các quy luật tự nhiên để chúng ta có thể điều chỉnh bản tính chúng ta tốt hơn. Đây là quyển sách nói về làm thế nào để được hạnh phúc.  Một người đàn ông đang thất vọng cùng cực nói với một học giả: \"Thế là hết! Tôi xong đời rồi! Tất cả tiền đã hết! Tôi đã mất tất cả!\". Nhà học giả hỏi: \"Thế anh vẫn còn nhìn thấy, nghe thấy, đi lại... được đấy chứ?\". Một người đàn ông đáp \"Vâng!?\". Nhà học giả nói: \"Vậy thì tôi cho là cái gì anh cũng còn, chỉ có tiền là mất!\".  Một câu chuyện thật hay, phải không bạn?  Chỉ với một cách nhìn nhận khác hẳn mà cuộc đời một người thay đổi: từ chỗ bi quan, tưởng chừng mọi thứ đã kết thúc, sang chỗ lạc quan, có thể sẵn sàng bắt tay vào làm lại từ đầu...  Sự việc thì vẫn thế, chỉ cách nhìn của chúng ta thay đổi, và thế là cuộc đời cũng thay đổi...  Trong cuốn sách này bạn sẽ học cách để nhìn nhận cuộc đời và chấp nhận cuộc đời!  Kiên nhẫn là chỗ dựa của thành công. Tài năng chỉ là chất xúc tác. Trên đời này có nhiều người có tài nhưng không thành công là chuyện thường tình. Kiên nhẫn và kiên quyết luôn là bài giải của những vấn đề thuộc về con người.  Mục tiêu là cỗ xe chuyên chở chúng ta qua những đoạn đường thử thách mà từ đó ta lớn lên. Chúng ta luôn cần mục tiêu, không phải vì chúng đem lại cho ta mà vì cái chúng làm cho ta.  Mọi cái đều bắt đầu từ những giấc mơ. Hãy đứng bên giấc mơ của mình. Như một bài hát đã nói, \"Nếu bạn chưa bao giờ mơ thì không có giấc mơ nào sẽ thành sự thật\".  Một thái độ biết ơn sẽ đảm bảo cho chúng ta chú ý đến cái mình muốn. Khi chúng ta cho là mình đang sống vui vẻ và đầy đủ thì chúng ta hài lòng với những cái mình đã có và thu hút tất cả những gì tốt đẹp về phía mình.',2,'2018-12-14 08:04:49',2),(2,'Ngôn Ngữ Nhiệt Độ C','Andrew Matthews',2,1,'/img/books/ndnn.jpg',97,38000,2016,'Quyển sách này nói về việc tại sao có những người dường như lúc nào cũng ở đúng nơi và đúng lúc - và làm thế nào bạn cũng được như họ; tại sao hóa đơn tính tiền luôn luôn tới ngay tức khắc; tại sao đèn giao thông cứ ở màu đỏ hoài cả nửa ngày trong khi bạn đang trễ một cuộc hẹn làm ăn; tại sao đi du lịch Tây Ban Nha mà bạn cũng gặp người láng giềng sát bên nhà; tại sao bạn chạy chiếc xe cà tàng suốt 15 năm ròng rã mà chưa bao giờ va quẹt... thế rồi chiếc xe mới mua mới chạy có hai ngày đã đụng móp mui!  Quyển sách này nói về: hiểu được bản thân, biết khôi hài về bản thân, trở nên suôn sẻ thuận lợi, biết tha thứ cho bản thân. Sách cũng bàn về việc nhận thức được các quy luật tự nhiên để chúng ta có thể điều chỉnh bản tính chúng ta tốt hơn. Đây là quyển sách nói về làm thế nào để được hạnh phúc.  Một người đàn ông đang thất vọng cùng cực nói với một học giả: \"Thế là hết! Tôi xong đời rồi! Tất cả tiền đã hết! Tôi đã mất tất cả!\". Nhà học giả hỏi: \"Thế anh vẫn còn nhìn thấy, nghe thấy, đi lại... được đấy chứ?\". Một người đàn ông đáp \"Vâng!?\". Nhà học giả nói: \"Vậy thì tôi cho là cái gì anh cũng còn, chỉ có tiền là mất!\".  Một câu chuyện thật hay, phải không bạn?  Chỉ với một cách nhìn nhận khác hẳn mà cuộc đời một người thay đổi: từ chỗ bi quan, tưởng chừng mọi thứ đã kết thúc, sang chỗ lạc quan, có thể sẵn sàng bắt tay vào làm lại từ đầu...  Sự việc thì vẫn thế, chỉ cách nhìn của chúng ta thay đổi, và thế là cuộc đời cũng thay đổi...  Trong cuốn sách này bạn sẽ học cách để nhìn nhận cuộc đời và chấp nhận cuộc đời!  Kiên nhẫn là chỗ dựa của thành công. Tài năng chỉ là chất xúc tác. Trên đời này có nhiều người có tài nhưng không thành công là chuyện thường tình. Kiên nhẫn và kiên quyết luôn là bài giải của những vấn đề thuộc về con người.  Mục tiêu là cỗ xe chuyên chở chúng ta qua những đoạn đường thử thách mà từ đó ta lớn lên. Chúng ta luôn cần mục tiêu, không phải vì chúng đem lại cho ta mà vì cái chúng làm cho ta.  Mọi cái đều bắt đầu từ những giấc mơ. Hãy đứng bên giấc mơ của mình. Như một bài hát đã nói, \"Nếu bạn chưa bao giờ mơ thì không có giấc mơ nào sẽ thành sự thật\".  Một thái độ biết ơn sẽ đảm bảo cho chúng ta chú ý đến cái mình muốn. Khi chúng ta cho là mình đang sống vui vẻ và đầy đủ thì chúng ta hài lòng với những cái mình đã có và thu hút tất cả những gì tốt đẹp về phía mình.',0,'2018-12-14 08:04:49',5),(3,'Đời Thay Đổi Khi Chúng Ta Thay Đổi','Andrew Matthews',2,1,'/img/books/doithaydoikhichungtathaydoi.jpg',94,38000,2016,'Quyển sách này nói về việc tại sao có những người dường như lúc nào cũng ở đúng nơi và đúng lúc - và làm thế nào bạn cũng được như họ; tại sao hóa đơn tính tiền luôn luôn tới ngay tức khắc; tại sao đèn giao thông cứ ở màu đỏ hoài cả nửa ngày trong khi bạn đang trễ một cuộc hẹn làm ăn; tại sao đi du lịch Tây Ban Nha mà bạn cũng gặp người láng giềng sát bên nhà; tại sao bạn chạy chiếc xe cà tàng suốt 15 năm ròng rã mà chưa bao giờ va quẹt... thế rồi chiếc xe mới mua mới chạy có hai ngày đã đụng móp mui!  Quyển sách này nói về: hiểu được bản thân, biết khôi hài về bản thân, trở nên suôn sẻ thuận lợi, biết tha thứ cho bản thân. Sách cũng bàn về việc nhận thức được các quy luật tự nhiên để chúng ta có thể điều chỉnh bản tính chúng ta tốt hơn. Đây là quyển sách nói về làm thế nào để được hạnh phúc.  Một người đàn ông đang thất vọng cùng cực nói với một học giả: \"Thế là hết! Tôi xong đời rồi! Tất cả tiền đã hết! Tôi đã mất tất cả!\". Nhà học giả hỏi: \"Thế anh vẫn còn nhìn thấy, nghe thấy, đi lại... được đấy chứ?\". Một người đàn ông đáp \"Vâng!?\". Nhà học giả nói: \"Vậy thì tôi cho là cái gì anh cũng còn, chỉ có tiền là mất!\".  Một câu chuyện thật hay, phải không bạn?  Chỉ với một cách nhìn nhận khác hẳn mà cuộc đời một người thay đổi: từ chỗ bi quan, tưởng chừng mọi thứ đã kết thúc, sang chỗ lạc quan, có thể sẵn sàng bắt tay vào làm lại từ đầu...  Sự việc thì vẫn thế, chỉ cách nhìn của chúng ta thay đổi, và thế là cuộc đời cũng thay đổi...  Trong cuốn sách này bạn sẽ học cách để nhìn nhận cuộc đời và chấp nhận cuộc đời!  Kiên nhẫn là chỗ dựa của thành công. Tài năng chỉ là chất xúc tác. Trên đời này có nhiều người có tài nhưng không thành công là chuyện thường tình. Kiên nhẫn và kiên quyết luôn là bài giải của những vấn đề thuộc về con người.  Mục tiêu là cỗ xe chuyên chở chúng ta qua những đoạn đường thử thách mà từ đó ta lớn lên. Chúng ta luôn cần mục tiêu, không phải vì chúng đem lại cho ta mà vì cái chúng làm cho ta.  Mọi cái đều bắt đầu từ những giấc mơ. Hãy đứng bên giấc mơ của mình. Như một bài hát đã nói, \"Nếu bạn chưa bao giờ mơ thì không có giấc mơ nào sẽ thành sự thật\".  Một thái độ biết ơn sẽ đảm bảo cho chúng ta chú ý đến cái mình muốn. Khi chúng ta cho là mình đang sống vui vẻ và đầy đủ thì chúng ta hài lòng với những cái mình đã có và thu hút tất cả những gì tốt đẹp về phía mình.',1,'2018-12-14 08:04:49',5),(4,'Nhà Giả Kim','Paulo Coelho',4,2,'/img/books/ngk.jpg',100,41000,2016,'Tất cả những trải nghiệm trong chuyến phiêu du theo đuổi vận mệnh của mình đã giúp Santiago thấu hiểu được ý nghĩa sâu xa nhất của hạnh phúc, hòa hợp với vũ trụ và con người.  Tiểu thuyết Nhà giả kim của Paulo Coelho như một câu chuyện cổ tích giản dị, nhân ái, giàu chất thơ, thấm đẫm những minh triết huyền bí của phương Đông. Trong lần xuất bản đầu tiên tại Brazil vào năm 1988, sách chỉ bán được 900 bản. Nhưng, với số phận đặc biệt của cuốn sách dành cho toàn nhân loại, vượt ra ngoài biên giới quốc gia, Nhà giả kim đã làm rung động hàng triệu tâm hồn, trở thành một trong những cuốn sách bán chạy nhất mọi thời đại, và có thể làm thay đổi cuộc đời người đọc.  “Nhưng nhà luyện kim đan không quan tâm mấy đến những điều ấy. Ông đã từng thấy nhiều người đến rồi đi, trong khi ốc đảo và sa mạc vẫn là ốc đảo và sa mạc. Ông đã thấy vua chúa và kẻ ăn xin đi qua biển cát này, cái biển cát thường xuyên thay hình đổi dạng vì gió thổi nhưng vẫn mãi mãi là biển cát mà ông đã biết từ thuở nhỏ. Tuy vậy, tự đáy lòng mình, ông không thể không cảm thấy vui trước hạnh phúc của mỗi người lữ khách, sau bao ngày chỉ có cát vàng với trời xanh nay được thấy chà là xanh tươi hiện ra trước mắt. ‘Có thể Thượng đế tạo ra sa mạc chỉ để cho con người biết quý trọng cây chà là,’ ông nghĩ.”  - Trích Nhà giả kim',0,'2018-12-14 09:03:59',5),(5,'Những Đòn Tâm Lý Trong Thuyết Phục','Robert B. Cialdini',5,3,'/img/books/ndtltp.jpg',9,103000,2016,'Tại sao một số người lại có sức thuyết phục đến mê hoặc và luôn là người làm chủ Trò chơi Thuyết phục? Đâu là những động lực vô hình đằng sau thứ sức mạnh thôi thúc chúng ta đồng thuận với người khác? Những thủ thuật được các bậc thầy thuyết phục sử dụng tài tình là gì, làm thế nào đánh bại các thủ thuật đó - đồng thời biến chúng thành \"vũ khí bí mật\" của chính bạn  Với Những đòn tâm lý trong thuyết phục, bạn sẽ có lời giải đáp cho tất cả những câu hỏi ấy. Trong cuốn sách tuyệt vời này, nhà tâm lý học nổi tiếng Robert B. Cialdini tiết lộ 6 \"vũ khí\" gây ảnh hưởng đầy uy lực: cam kết và  nhất quán, khan hiếm, đáp trả, bằng chứng xã hội, uy quyền và thiện cảm. Mỗi loại lại bị chi phối bởi một nguyên tắc tâm lý cơ bản điều khiển hành vi con người và nhờ đó mà tạo nên sức mạnh cho mỗi thủ thuật. Đặc biệt khi được kết  hợp với nhau, chúng sẽ tạo ra ảnh hưởng vô cùng lớn.  Hãy sở hữu kho vũ khí đó và trở thành người làm chủ Trò chơi Thuyết phục. Bạn sẽ không bao giờ nói \"đồng ý\" nếu thật sự bạn muốn nói \"không\", và bạn sẽ không ngừng ngạc nhiên với khả năng gây ảnh hưởng lớn lên trong bạn từng ngày.',0,'2018-12-14 09:22:29',3),(6,'Mặt Trời Không Lặn Về Tây','Kim Bính',3,2,'/img/books/mtklvt.jpg',73,120000,2018,'Tác phẩm “Mặt trời không lặn về tây” của Kim Bính được lấy ý tưởng từ những kí ức đã xảy ra khi còn nhỏ của tác giả. Không chỉ đơn thuần là chuyện tình giữa cô gái Tử Tốn xinh đẹp và chàng trai Hạ Xuyên, tác phẩm còn đan xen trong đó là một câu chuyện điều tra ly kỳ gay cấn về một vụ án liên quan đến môi trường.Quê hương của Hạ Xuyên đang bị ảnh hưởng bởi môi trường bị ô nhiễm, ban đêm các xí nghiệp lén lút xả khí thải dẫn đến việc nước không thể uống, tình hình ô nhiễm trầm trọng đã bao trùm lên cả một vùng. Những vụ việc được bưng bít không để lộ bất cứ thông tin nào ra ngoài và rồi Hạ Xuyên, Tử Tốn cùng biết bao nhiêu người khác đã làm những gì để đẩy lùi vấn nạn này?Cuốn sách “Mặt trời không lặn về Tây” là một câu chuyện chứa đầy cảm xúc về những con người trẻ luôn sống nhiệt huyết và hết lòng với cuộc sống.',0,'2018-12-20 06:05:54',3),(7,'Bốn Chàng Trai Cùng Nhau Đi Du Lịch','Yuriko Mamiya',6,2,'/img/books/bctcnddl.jpg',48,89000,2018,'Mashima – một anh chàng thật thà và thụ động.Shigeta – một nhà nghiên cứu thường thường bậc trung, đã có một đời vợ.Nakasugi – một anh chàng luôn bị cô bạn gái kiểm soát, có ưu điểm là dễ gây thiện cảm cho người đối diện.Và Saiki – Một anh chàng cực kì đẹp trai nhưng tính khí lạ đời.Không phải bạn bè cũng chẳng đặc biệt thân thích, vậy mà bốn con người ấy lại đồng hành cùng nhau trên những chuyến đi. Qua mỗi chuyến đi họ trở nên thân thiết hơn nhưng vẫn luôn cố gắng giữ một khoảng cách, không can thiệp quá sâu vào sự riêng tư của những người bạn đồng hành nhưng vẫn luôn sẵn sàng đưa tay giúp đỡ, an ủi lẫn nhau. Cuốn sách để lại cho người đọc một cảm giác vô cùng dễ chịu.',0,'2018-12-20 06:10:05',4),(8,'Kỹ Năng Giao Tiếp Trong Kinh Doanh','Trịnh Quốc Trung',5,3,'/img/books/kngttkd.jpg',53,88500,2018,'Giao tiếp là một hoạt động và nhu cầu không thể thiếu được ở con người. Để thành công trong cuộc sống nói chung và kinh doanh nói riêng, mọi người điều cần kỹ năng giao tiếp tốt. Đặc biệt đối với các tổ chức kinh doanh trong lĩnh vực dịch vụ, hoạt động giao tiếp càng cần thiết hơn bao giờ hết nhằm thu hút và duy trì được khách hàng quyết định sự thành công của các tổ chức kinh doanh trong điều kiện hiện đại. Trong thực tế., kỹ năng giao tiếp sẽ đóng vai trò quan trọng trong việc thiết lập, duy trì mối quan hệ hợp tác lâu dài và đem lại sự hài lòng cho khách hàng của các tổ chức.  Với tầm quan trọng đó, giới thiệu đến bạn đọc cuốn sách “ Kỹ năng giao tiếp trong kinh doanh” của Tiến sĩ Trịnh Quốc Trung và các tác giả tham gia biên soạn. Cuốn sách giúp chúng ta có kỹ năng giao tiếp ứng xử khéo léo , hiệu quả và chuyên nghiệp trong kinh doanh. Ngoài ra, sách còn phần trắc nghiệm tâm lý giúp độc giả có thể tìm hiểu năng lực bản thân và những quy tắc ứng xử phù hợp ',0,'2018-12-20 06:11:59',5),(9,'Khởi Nghiệp Tinh Gọn','Eric Ries',7,3,'/img/books/kntg.jpg',110,94000,2011,'Cuốn sách &quot;Khởi nghiệp Tinh gọn” (The Lean Startup) trình bày một mô hình khởi nghiệp vang danh toàn cầu, giúp thay đổi toàn bộ cách thức xây dựng công ty và tung ra sản phẩm mới trên thị trường.“Khởi nghiệp” - hai tiếng đơn giản đó có sức hút mạnh mẽ với bất kỳ ai, không chỉ đối với những người đang ấp ủ một dự án kinh doanh, mà ngay cả những ông chủ đang muốn tìm kiếm một sản phẩm hay một ý tưởng mới để “tái khởi nghiệp”, nói cách khác là tái tạo lại mô hình kinh doanh của mình. Tuy nhiên, từ ý tưởng đến thành công là điều không dễ!Nhiều dự án khởi nghiệp thất bại không phải vì ý tưởng không tốt, chiến lược kém hay tầm nhìn sai, mà cốt lõi của mọi vấn đề nằm ở chỗ chúng ta không có được một mô hình và phương pháp để khởi nghiệp thành công. Vì khởi nghiệp không giống với thành lập và điều hành một công ty theo dạng truyền thống, nên nó cần một mô hình và phương pháp quản trị riêng.',0,'2018-12-20 06:14:01',5);
/*!40000 ALTER TABLE `book` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cart`
--

DROP TABLE IF EXISTS `cart`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cart` (
  `id` int(5) NOT NULL AUTO_INCREMENT,
  `user_id` int(5) NOT NULL,
  `total_price` int(11) DEFAULT '0',
  `enable` int(11) DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `cart_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cart`
--

LOCK TABLES `cart` WRITE;
/*!40000 ALTER TABLE `cart` DISABLE KEYS */;
INSERT INTO `cart` VALUES (19,10,38000,0),(20,10,569000,0),(24,13,0,1),(26,10,88500,0),(27,10,89000,0),(28,10,3468000,0),(29,15,0,1),(30,16,0,1),(32,10,265500,1),(37,21,0,1);
/*!40000 ALTER TABLE `cart` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cart_item`
--

DROP TABLE IF EXISTS `cart_item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cart_item` (
  `id` int(5) NOT NULL AUTO_INCREMENT,
  `cart_id` int(5) NOT NULL,
  `book_id` int(5) NOT NULL,
  `quantity` int(5) NOT NULL,
  `total_price` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `cart_id` (`cart_id`),
  KEY `book_id` (`book_id`),
  CONSTRAINT `cart_item_ibfk_1` FOREIGN KEY (`cart_id`) REFERENCES `cart` (`id`) ON DELETE CASCADE,
  CONSTRAINT `cart_item_ibfk_2` FOREIGN KEY (`book_id`) REFERENCES `book` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cart_item`
--

LOCK TABLES `cart_item` WRITE;
/*!40000 ALTER TABLE `cart_item` DISABLE KEYS */;
INSERT INTO `cart_item` VALUES (23,19,1,1,38000),(24,20,8,6,531000),(27,20,3,1,38000),(28,26,8,1,88500),(29,27,7,1,89000),(31,28,1,6,228000),(32,28,6,27,3240000),(35,32,8,3,265500);
/*!40000 ALTER TABLE `cart_item` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `category`
--

DROP TABLE IF EXISTS `category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `category` (
  `id` int(5) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  FULLTEXT KEY `FullText` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `category`
--

LOCK TABLES `category` WRITE;
/*!40000 ALTER TABLE `category` DISABLE KEYS */;
INSERT INTO `category` VALUES (1,'Kỹ năng - Sống đẹp'),(2,'Văn học'),(3,'Kinh tế'),(4,'Không xác định');
/*!40000 ALTER TABLE `category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `feedback`
--

DROP TABLE IF EXISTS `feedback`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `feedback` (
  `id` int(5) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `subject` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `message` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `feedback`
--

LOCK TABLES `feedback` WRITE;
/*!40000 ALTER TABLE `feedback` DISABLE KEYS */;
INSERT INTO `feedback` VALUES (1,'Lê Văn Hoàng','lehoang279@gmail.com','Dịch page','Page dịch chưa hết','2018-12-15 14:57:20'),(2,'Lê Văn Hoàng ','lehoang279@gmail.com','Test','Chỉ là test ','2018-12-15 14:57:20'),(3,'AquaSyaoran','nguyensyduc.621999@gmail.com','zsdcs','ádasd','2019-11-05 02:44:06'),(4,'ádas','nguyensyduc.621999@gmail.com','sdqwdwqd','đâsdasdasdas','2019-11-19 02:28:37'),(5,'Nguyễn Sỹ Đức','nguyensyduc.621999@gmail.com','Sách bán chạy','Tốt','2019-11-22 06:41:18'),(6,'Nguyễn Sỹ Đưc','nguyensyduc.621999@gmail.com','Sách bán chạy','fmgewgknerg','2019-12-09 15:04:54'),(7,'nguyenson','son12345678@gmail.com','sách','Sách hay quá ','2019-12-10 00:46:30');
/*!40000 ALTER TABLE `feedback` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order`
--

DROP TABLE IF EXISTS `order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `order` (
  `id` int(5) NOT NULL AUTO_INCREMENT,
  `user_id` int(5) NOT NULL,
  `address_id` int(5) NOT NULL,
  `order_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `total_price` int(11) NOT NULL,
  `cart_id` int(11) NOT NULL,
  `delivered` tinyint(4) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  KEY `order_ibfk_2` (`address_id`),
  CONSTRAINT `order_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE,
  CONSTRAINT `order_ibfk_2` FOREIGN KEY (`address_id`) REFERENCES `address` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order`
--

LOCK TABLES `order` WRITE;
/*!40000 ALTER TABLE `order` DISABLE KEYS */;
INSERT INTO `order` VALUES (14,10,4,'2019-11-04 07:24:16',53000,19,0),(16,10,7,'2019-11-12 02:15:48',584000,20,1),(17,10,7,'2019-11-15 08:15:11',103500,26,0),(18,10,4,'2019-11-22 06:40:41',104000,27,0),(19,10,7,'2019-12-09 15:03:05',3483000,28,0);
/*!40000 ALTER TABLE `order` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `publisher`
--

DROP TABLE IF EXISTS `publisher`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `publisher` (
  `id` int(5) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNQ_publisher_name` (`name`),
  FULLTEXT KEY `FullText` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `publisher`
--

LOCK TABLES `publisher` WRITE;
/*!40000 ALTER TABLE `publisher` DISABLE KEYS */;
INSERT INTO `publisher` VALUES (1,' Kim Đồng','0987631542','52, hưng đạo'),(2,' Trẻ','0987631542','Số 5, Ngõ Đại Đồng'),(3,' Hà Nội',NULL,NULL),(4,' Văn Học',NULL,NULL),(5,' Lao động','',''),(6,' Văn Hóa Văn Nghệ','',''),(7,' Tổng hợp TPHCM','','');
/*!40000 ALTER TABLE `publisher` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `review`
--

DROP TABLE IF EXISTS `review`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `review` (
  `id` int(5) NOT NULL AUTO_INCREMENT,
  `user_id` int(5) NOT NULL,
  `book_id` int(5) NOT NULL,
  `content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `rating` int(11) DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  KEY `book_id` (`book_id`),
  CONSTRAINT `review_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE,
  CONSTRAINT `review_ibfk_2` FOREIGN KEY (`book_id`) REFERENCES `book` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `review`
--

LOCK TABLES `review` WRITE;
/*!40000 ALTER TABLE `review` DISABLE KEYS */;
INSERT INTO `review` VALUES (19,10,8,'hay','2019-11-04 08:51:07',5),(20,10,8,'sdadasdasdasdsad','2019-11-04 09:15:28',5),(21,10,8,'sách như cứt','2019-11-15 08:14:48',3),(22,10,6,'quá đắt','2019-12-09 15:01:23',3),(24,10,7,'sách rất hay','2019-12-13 07:08:56',4),(25,10,8,'Hay','2019-12-30 04:54:46',5);
/*!40000 ALTER TABLE `review` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `first_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone_number` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `enabled` tinyint(1) NOT NULL DEFAULT '1',
  `image` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`),
  UNIQUE KEY `UNQ_user_mail` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (10,'AquaSyaoran','$2a$10$bHZHhneasAP5K9kU/E0Kq.xijbV4dObiJIvA3vYbV8fU7qRxBsIPy','nguyensyduc.621999@gmail.com','Nguyen Sy','Đức','0916467328',1,NULL),(13,'AkaiAkai','$2a$10$zyzT6K6ogy7Qy.W3sC1UFe4.9.mOgM0vepUNC2oZoUFn.0v5Ahacq','ducthebest6@yahoo.com.vn','Nguyen Sy','Duc','0916467328',1,NULL),(15,'BinBeanâs','$2a$10$nS2zTlLytohfqt5QRfanGOP0TMYBBuHkzb32PXe79sLorIpv0jGSG','ducthebes324324@yahoo.com.vn','Nguyễn Sỹ','Đức','0987631542',1,NULL),(16,'SyDuc','$2a$10$9UdG50xFtRLLF4qdqhs7veIUGyTflrpn1BXCwE9w0/dy6Xfpg1EXS','ducthebest100@yahoo.com.vn','Nguyễn Sỹ','Đức','0987631542',1,NULL),(21,'MelMel','$2a$10$faK2rv72tjqYb3W.bU/RF.kLIBo/zA/8JYR6xPKuksud7MEDvW0y2','tuanit2304@gmail.com','Mel','Mel','0398942304',1,NULL);
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_role`
--

DROP TABLE IF EXISTS `user_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_role` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `role` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`,`role`),
  KEY `user_id_2` (`user_id`),
  CONSTRAINT `user_role_user_id_fk` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_role`
--

LOCK TABLES `user_role` WRITE;
/*!40000 ALTER TABLE `user_role` DISABLE KEYS */;
INSERT INTO `user_role` VALUES (14,NULL,'ROLE_MEMBER'),(15,NULL,'ROLE_MEMBER'),(17,NULL,'ROLE_MEMBER'),(20,NULL,'ROLE_MEMBER'),(21,NULL,'ROLE_MEMBER'),(22,NULL,'ROLE_MEMBER'),(23,NULL,'ROLE_MEMBER'),(13,10,'ROLE_ADMIN'),(16,13,'ROLE_MEMBER'),(18,15,'ROLE_MEMBER'),(19,16,'ROLE_MEMBER'),(24,21,'ROLE_MEMBER');
/*!40000 ALTER TABLE `user_role` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-12-30 12:03:09
