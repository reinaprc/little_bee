-- MySQL dump 10.13  Distrib 8.0.20, for Win64 (x86_64)
--
-- Host: localhost    Database: littlebee
-- ------------------------------------------------------
-- Server version	8.0.20

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `basket`
--

DROP TABLE IF EXISTS `basket`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `basket` (
  `basketno` int NOT NULL AUTO_INCREMENT,
  `prodname` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '상품명',
  `thumbnail` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '썸네일이미지',
  `optname` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '옵션이름',
  `prodqty` int NOT NULL COMMENT '상품수량',
  `prodprice` int NOT NULL COMMENT '상품금액(수량*금액)',
  `member_usernum` int NOT NULL COMMENT '사용자번호',
  `prodnum` int NOT NULL COMMENT '상품번호',
  `productoption_optnum` int NOT NULL COMMENT '상품옵션',
  PRIMARY KEY (`basketno`),
  KEY `fk_basket_member1_idx` (`member_usernum`),
  KEY `fk_basket_productoption1_idx` (`productoption_optnum`),
  CONSTRAINT `fk_basket_member1` FOREIGN KEY (`member_usernum`) REFERENCES `member` (`usernum`),
  CONSTRAINT `fk_basket_productoption1` FOREIGN KEY (`productoption_optnum`) REFERENCES `productoption` (`optnum`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='장바구니 데이터';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `basket`
--

LOCK TABLES `basket` WRITE;
/*!40000 ALTER TABLE `basket` DISABLE KEYS */;
/*!40000 ALTER TABLE `basket` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `maincategory`
--

DROP TABLE IF EXISTS `maincategory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `maincategory` (
  `maincategorynum` int NOT NULL AUTO_INCREMENT COMMENT '카테고리 번호(대분류)',
  `maincategoryname` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '카테고리 이름(대분류)',
  PRIMARY KEY (`maincategorynum`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8 COMMENT='상품 카테고리(대분류)';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `maincategory`
--

LOCK TABLES `maincategory` WRITE;
/*!40000 ALTER TABLE `maincategory` DISABLE KEYS */;
INSERT INTO `maincategory` VALUES (10,'신생아침구/섬유류'),(11,'수유/이유식용품'),(12,'스킨케어');
/*!40000 ALTER TABLE `maincategory` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `member`
--

DROP TABLE IF EXISTS `member`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `member` (
  `usernum` int NOT NULL AUTO_INCREMENT COMMENT '사용자번호',
  `username` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '이름',
  `userid` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '아이디',
  `userpw` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '비밀번호',
  `useradress` varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '주소',
  `userphone` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '전화번호',
  `useremail` varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '이메일',
  `gender` enum('M','F') CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '성별',
  `birthdate` datetime DEFAULT NULL COMMENT '생년월일',
  `secession` enum('T','F') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '탈퇴여부',
  `signuptime` datetime NOT NULL COMMENT '가입일시',
  PRIMARY KEY (`usernum`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='사용자';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `member`
--

LOCK TABLES `member` WRITE;
/*!40000 ALTER TABLE `member` DISABLE KEYS */;
INSERT INTO `member` VALUES (1,'레이나','reina','123qwe','서울','010-1234-5678','reina@gmail.com','F','1995-06-11 00:00:00','F','2022-01-01 00:00:00'),(2,'테스트용','test1234','test1234','서울','010-1423-5867','test@gmail.com','F','2022-01-29 00:00:00','F','2022-01-29 00:00:00');
/*!40000 ALTER TABLE `member` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `notice`
--

DROP TABLE IF EXISTS `notice`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `notice` (
  `noticenum` int NOT NULL AUTO_INCREMENT COMMENT '공지글 번호',
  `noticetitle` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '공지 제목',
  `noticecontent` varchar(1000) DEFAULT NULL COMMENT '공지 내용',
  `noticeimg` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '공지 이미지',
  `noticedate` datetime NOT NULL COMMENT '공지 작성 날짜',
  `noticecategory` enum('이벤트','당첨자발표','공지사항') NOT NULL COMMENT '공지 카테고리',
  PRIMARY KEY (`noticenum`)
) ENGINE=InnoDB AUTO_INCREMENT=221219002 DEFAULT CHARSET=utf8 COMMENT='공지사항 내용을 저장하는 테이블';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notice`
--

LOCK TABLES `notice` WRITE;
/*!40000 ALTER TABLE `notice` DISABLE KEYS */;
INSERT INTO `notice` VALUES (220301001,'3월 SNS 이벤트',NULL,'/upload/noticeimg/220301001_01.jpg','2022-03-01 12:00:00','이벤트'),(220301002,'2월 이벤트 당첨자','2월 SNS 공유 이벤트 당첨자 목록입니다.\\n\\n<이벤트 당첨자 목록>\\n\\nbdfnf32 님, yyadie512 님, cdatrq34 님 축하드립니다.\\n\\n\\n<상품 지급일>\\n\\n회원 정보에 기입된 메일을 통해 발송된 개인정보 수집 및 활용 동의서를 3월 15일까지 작성 부탁드립니다.\\n개인정보 수집이 완료 된 경우 3월 20일부터 순차적으로 경품이 발송됩니다.\\n개인정보 수집 및 활용 동의서 미작성 시 당첨이 취소될 수 있습니다.\\n발송 전 이벤트 참여 아이디를 삭제하시거나 이벤트 참여글을 삭제하셨을 경우 당첨이 취소될 수 있습니다.\\n수집된 개인 정보는 상품 발송 목적으로만 사용되며 이후 파기됩니다.','/upload/noticeimg/220301002_01.jpg','2022-03-01 13:00:00','당첨자발표'),(220321001,'쿠폰번호 등록 방법',NULL,'/upload/noticeimg/220321001_01.jpg','2022-03-21 14:31:22','공지사항'),(220401001,'4월 SNS 이벤트',NULL,'/upload/noticeimg/220401001_01.jpg','2022-04-01 12:00:00','이벤트'),(220401002,'3월 이벤트 당첨자','3월 SNS 공유 이벤트 당첨자 목록입니다.\n\n<이벤트 당첨자 목록>\n\nwrq123 님, gfth3526 님, kjte938 님 축하드립니다.\n\n\n<상품 지급일>\n\n회원 정보에 기입된 메일을 통해 발송된 개인정보 수집 및 활용 동의서를 4월 15일까지 작성 부탁드립니다.\n개인정보 수집이 완료 된 경우 4월 20일부터 순차적으로 경품이 발송됩니다.\n개인정보 수집 및 활용 동의서 미작성 시 당첨이 취소될 수 있습니다.\n발송 전 이벤트 참여 아이디를 삭제하시거나 이벤트 참여글을 삭제하셨을 경우 당첨이 취소될 수 있습니다.\n수집된 개인 정보는 상품 발송 목적으로만 사용되며 이후 파기됩니다.','/upload/noticeimg/220401002_01.jpg','2022-04-01 13:00:00','당첨자발표'),(220502001,'5월 SNS 이벤트',NULL,'/upload/noticeimg/220502001_01.jpg','2022-05-02 12:00:00','이벤트'),(220502002,'4월 이벤트 당첨자','4월 SNS 공유 이벤트 당첨자 목록입니다.\n\n<이벤트 당첨자 목록>\n\nberggtw 님, jeii331 님, irnnefaf2 님 축하드립니다.\n\n\n<상품 지급일>\n\n회원 정보에 기입된 메일을 통해 발송된 개인정보 수집 및 활용 동의서를 5월 15일까지 작성 부탁드립니다.\n개인정보 수집이 완료 된 경우 5월 20일부터 순차적으로 경품이 발송됩니다.\n개인정보 수집 및 활용 동의서 미작성 시 당첨이 취소될 수 있습니다.\n발송 전 이벤트 참여 아이디를 삭제하시거나 이벤트 참여글을 삭제하셨을 경우 당첨이 취소될 수 있습니다.\n수집된 개인 정보는 상품 발송 목적으로만 사용되며 이후 파기됩니다.','/upload/noticeimg/220502002_01.jpg','2022-05-02 13:00:00','당첨자발표'),(220601001,'6월 SNS 이벤트',NULL,'/upload/noticeimg/220601001_01.jpg','2022-06-01 12:00:00','이벤트'),(220601002,'5월 이벤트 당첨자','5월 SNS 공유 이벤트 당첨자 목록입니다.\n\n<이벤트 당첨자 목록>\n\nbjjjw32 님, jeqooo13 님, magij13 님 축하드립니다.\n\n\n<상품 지급일>\n\n회원 정보에 기입된 메일을 통해 발송된 개인정보 수집 및 활용 동의서를 6월 15일까지 작성 부탁드립니다.\n개인정보 수집이 완료 된 경우 6월 20일부터 순차적으로 경품이 발송됩니다.\n개인정보 수집 및 활용 동의서 미작성 시 당첨이 취소될 수 있습니다.\n발송 전 이벤트 참여 아이디를 삭제하시거나 이벤트 참여글을 삭제하셨을 경우 당첨이 취소될 수 있습니다.\n수집된 개인 정보는 상품 발송 목적으로만 사용되며 이후 파기됩니다.','/upload/noticeimg/220601002_01.jpg','2022-06-01 13:00:00','당첨자발표'),(220701001,'7월 SNS 이벤트',NULL,'/upload/noticeimg/220701001_01.jpg','2022-07-01 12:00:00','이벤트'),(220701002,'6월 이벤트 당첨자','6월 SNS 공유 이벤트 당첨자 목록입니다.\n\n<이벤트 당첨자 목록>\n\nreoqr9831 님, heuhbq251 님, dfku88213 님 축하드립니다.\n\n\n<상품 지급일>\n\n회원 정보에 기입된 메일을 통해 발송된 개인정보 수집 및 활용 동의서를 7월 15일까지 작성 부탁드립니다.\n개인정보 수집이 완료 된 경우 7월 20일부터 순차적으로 경품이 발송됩니다.\n개인정보 수집 및 활용 동의서 미작성 시 당첨이 취소될 수 있습니다.\n발송 전 이벤트 참여 아이디를 삭제하시거나 이벤트 참여글을 삭제하셨을 경우 당첨이 취소될 수 있습니다.\n수집된 개인 정보는 상품 발송 목적으로만 사용되며 이후 파기됩니다.','/upload/noticeimg/220701002_01.jpg','2022-07-01 13:00:00','당첨자발표'),(220725001,'배송 지연 공지','현재 택배사 사정으로 배송이 지연되고 있으니 양해 부탁드립니다.',NULL,'2022-07-25 14:39:53','공지사항'),(220801001,'8월 SNS 이벤트',NULL,'/upload/noticeimg/220801001_01.jpg','2022-08-01 12:00:00','이벤트'),(220801002,'7월 이벤트 당첨자','7월 SNS 공유 이벤트 당첨자 목록입니다.\n\n<이벤트 당첨자 목록>\n\nbvwui2815 님, ugasoq51 님, gippw9283 님 축하드립니다.\n\n\n<상품 지급일>\n\n회원 정보에 기입된 메일을 통해 발송된 개인정보 수집 및 활용 동의서를 8월 15일까지 작성 부탁드립니다.\n개인정보 수집이 완료 된 경우 8월 20일부터 순차적으로 경품이 발송됩니다.\n개인정보 수집 및 활용 동의서 미작성 시 당첨이 취소될 수 있습니다.\n발송 전 이벤트 참여 아이디를 삭제하시거나 이벤트 참여글을 삭제하셨을 경우 당첨이 취소될 수 있습니다.\n수집된 개인 정보는 상품 발송 목적으로만 사용되며 이후 파기됩니다.','/upload/noticeimg/220801002_01.jpg','2022-08-01 13:00:00','당첨자발표'),(220901001,'9월 SNS 이벤트',NULL,'/upload/noticeimg/220901001_01.jpg','2022-09-01 12:00:00','이벤트'),(220901002,'8월 이벤트 당첨자','8월 SNS 공유 이벤트 당첨자 목록입니다.\n\n<이벤트 당첨자 목록>\n\nkgppr9923 님, dgf21 님, cbwor2416 님 축하드립니다.\n\n\n<상품 지급일>\n\n회원 정보에 기입된 메일을 통해 발송된 개인정보 수집 및 활용 동의서를 9월 15일까지 작성 부탁드립니다.\n개인정보 수집이 완료 된 경우 9월 20일부터 순차적으로 경품이 발송됩니다.\n개인정보 수집 및 활용 동의서 미작성 시 당첨이 취소될 수 있습니다.\n발송 전 이벤트 참여 아이디를 삭제하시거나 이벤트 참여글을 삭제하셨을 경우 당첨이 취소될 수 있습니다.\n수집된 개인 정보는 상품 발송 목적으로만 사용되며 이후 파기됩니다.','/upload/noticeimg/220901002_01.jpg','2022-09-01 13:00:00','당첨자발표'),(220914001,'[아가방앤컴퍼니] 개인정보처리방침 변경 안내',NULL,'/upload/noticeimg/220914001_01.jpg','2022-09-14 15:02:11','공지사항'),(221003001,'10월 SNS 이벤트',NULL,'/upload/noticeimg/221003001_01.jpg','2022-10-03 12:00:00','이벤트'),(221003002,'9월 이벤트 당첨자','9월 SNS 공유 이벤트 당첨자 목록입니다.\n\n<이벤트 당첨자 목록>\n\niefjhqpwr 님, uhgbe241 님, fdfne3483 님 축하드립니다.\n\n\n<상품 지급일>\n\n회원 정보에 기입된 메일을 통해 발송된 개인정보 수집 및 활용 동의서를 10월 15일까지 작성 부탁드립니다.\n개인정보 수집이 완료 된 경우 10월 20일부터 순차적으로 경품이 발송됩니다.\n개인정보 수집 및 활용 동의서 미작성 시 당첨이 취소될 수 있습니다.\n발송 전 이벤트 참여 아이디를 삭제하시거나 이벤트 참여글을 삭제하셨을 경우 당첨이 취소될 수 있습니다.\n수집된 개인 정보는 상품 발송 목적으로만 사용되며 이후 파기됩니다.','/upload/noticeimg/221003002_01.jpg','2022-10-03 13:00:00','당첨자발표'),(221101001,'11월 SNS 이벤트',NULL,'/upload/noticeimg/221101001_01.jpg','2022-11-01 12:00:00','이벤트'),(221101002,'10월 이벤트 당첨자','10월 SNS 공유 이벤트 당첨자 목록입니다.\n\n<이벤트 당첨자 목록>\n\npnnwo431 님, gxgqj56 님, xteewrk324 님 축하드립니다.\n\n\n<상품 지급일>\n\n회원 정보에 기입된 메일을 통해 발송된 개인정보 수집 및 활용 동의서를 11월 15일까지 작성 부탁드립니다.\n개인정보 수집이 완료 된 경우 11월 20일부터 순차적으로 경품이 발송됩니다.\n개인정보 수집 및 활용 동의서 미작성 시 당첨이 취소될 수 있습니다.\n발송 전 이벤트 참여 아이디를 삭제하시거나 이벤트 참여글을 삭제하셨을 경우 당첨이 취소될 수 있습니다.\n수집된 개인 정보는 상품 발송 목적으로만 사용되며 이후 파기됩니다.','/upload/noticeimg/221101002_01.jpg','2022-11-01 13:00:00','당첨자발표'),(221116001,'[아가방앤컴퍼니] 포인트 환전 서비스 종료 안내',NULL,'/upload/noticeimg/221116001_01.jpg','2022-11-16 14:22:32','공지사항'),(221201001,'12월 SNS 이벤트',NULL,'/upload/noticeimg/221201001_01.jpg','2022-12-01 12:00:00','이벤트'),(221201002,'11월 이벤트 당첨자','11월 SNS 공유 이벤트 당첨자 목록입니다.\n\n<이벤트 당첨자 목록>\n\nnvbire93 님, iuwhrnq2 님, hrhhhj93 님 축하드립니다.\n\n\n<상품 지급일>\n\n회원 정보에 기입된 메일을 통해 발송된 개인정보 수집 및 활용 동의서를 12월 15일까지 작성 부탁드립니다.\n개인정보 수집이 완료 된 경우 12월 20일부터 순차적으로 경품이 발송됩니다.\n개인정보 수집 및 활용 동의서 미작성 시 당첨이 취소될 수 있습니다.\n발송 전 이벤트 참여 아이디를 삭제하시거나 이벤트 참여글을 삭제하셨을 경우 당첨이 취소될 수 있습니다.\n수집된 개인 정보는 상품 발송 목적으로만 사용되며 이후 파기됩니다.','/upload/noticeimg/221201002_01.jpg','2022-12-01 13:00:00','당첨자발표'),(221219001,'[아가방앤컴퍼니] 이용약관 개정 안내',NULL,'/upload/noticeimg/221219001_01.jpg','2022-12-19 15:26:48','공지사항');
/*!40000 ALTER TABLE `notice` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orderinfor`
--

DROP TABLE IF EXISTS `orderinfor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orderinfor` (
  `consuphone` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '주문자 휴대폰번호',
  `consutel` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '주문자 전화번호',
  `consuemail` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '주문자 이메일',
  `recipient` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '수령인',
  `delivtel` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '수령인 연락처',
  `destination` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '배송주소지\n',
  `delivreq` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '배송요청사항',
  `prodprice` int NOT NULL COMMENT '결제금액(배송비미포함)',
  `methodpay` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '결제수단',
  `cashreceipt` enum('y','n') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '현금영수증 신청 여부',
  `paystate` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '결제상태',
  `delivfee` enum('y','n') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '배송비 여부',
  `totalprice` int NOT NULL COMMENT '총 결제금액(배송비포함)',
  `ordernum` int NOT NULL AUTO_INCREMENT COMMENT '주문번호',
  `orderdate` datetime NOT NULL COMMENT '주문일자',
  `ordername` varchar(45) NOT NULL COMMENT '주문명',
  `orderstate` varchar(45) NOT NULL COMMENT '주문상태',
  `usernum` int NOT NULL COMMENT '사용자번호',
  PRIMARY KEY (`ordernum`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='주문정보 및 결제정보';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orderinfor`
--

LOCK TABLES `orderinfor` WRITE;
/*!40000 ALTER TABLE `orderinfor` DISABLE KEYS */;
/*!40000 ALTER TABLE `orderinfor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orderlist`
--

DROP TABLE IF EXISTS `orderlist`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orderlist` (
  `orderprodnum` int NOT NULL AUTO_INCREMENT,
  `detailstate` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '상품별 상태',
  `order information_ordernum` int NOT NULL COMMENT '주문번호',
  `product_prodnum` int NOT NULL COMMENT '상품번호',
  `productoption_optnum` int NOT NULL COMMENT '상품옵션',
  PRIMARY KEY (`orderprodnum`),
  KEY `fk_orderlist_order information1_idx` (`order information_ordernum`),
  KEY `fk_orderlist_product1_idx` (`product_prodnum`),
  KEY `fk_orderlist_productoption1_idx` (`productoption_optnum`),
  CONSTRAINT `fk_orderlist_order information1` FOREIGN KEY (`order information_ordernum`) REFERENCES `orderinfor` (`ordernum`),
  CONSTRAINT `fk_orderlist_product1` FOREIGN KEY (`product_prodnum`) REFERENCES `product` (`prodnum`),
  CONSTRAINT `fk_orderlist_productoption1` FOREIGN KEY (`productoption_optnum`) REFERENCES `productoption` (`optnum`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='주문 상품 리스트';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orderlist`
--

LOCK TABLES `orderlist` WRITE;
/*!40000 ALTER TABLE `orderlist` DISABLE KEYS */;
/*!40000 ALTER TABLE `orderlist` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `prodinquery`
--

DROP TABLE IF EXISTS `prodinquery`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `prodinquery` (
  `InqueryNum` int NOT NULL AUTO_INCREMENT COMMENT '문의 번호',
  `title` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '문의 제목',
  `content` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '문의 내용',
  `writer` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '작성자',
  `datecreated` datetime NOT NULL COMMENT '작성일',
  `product_prodnum` int NOT NULL COMMENT '상품번호',
  PRIMARY KEY (`InqueryNum`),
  KEY `fk_prodinquery_product_idx` (`product_prodnum`),
  CONSTRAINT `fk_prodinquery_product` FOREIGN KEY (`product_prodnum`) REFERENCES `product` (`prodnum`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='상세 페이지 안의 상품 문의';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `prodinquery`
--

LOCK TABLES `prodinquery` WRITE;
/*!40000 ALTER TABLE `prodinquery` DISABLE KEYS */;
/*!40000 ALTER TABLE `prodinquery` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product`
--

DROP TABLE IF EXISTS `product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product` (
  `prodnum` int NOT NULL AUTO_INCREMENT COMMENT '상품 번호',
  `prodname` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '상품명',
  `prodprice` int NOT NULL COMMENT '상품금액',
  `thumbnail` varchar(100) NOT NULL COMMENT '썸네일이미지',
  `registdate` datetime NOT NULL COMMENT '상품 등록날짜',
  `prodinfo` varchar(45) NOT NULL COMMENT '상품 상세 내용 이미지',
  `customerguide` varchar(100) NOT NULL COMMENT '상세페이지 안의 안내문(배송, 반품등 관련)',
  `maincategory_maincategorynum` int NOT NULL COMMENT '대분류',
  `subcategory_subcategorynum` int NOT NULL COMMENT '소분류',
  PRIMARY KEY (`prodnum`),
  KEY `fk_product_maincategory1_idx` (`maincategory_maincategorynum`),
  KEY `fk_product_subcategory1_idx` (`subcategory_subcategorynum`),
  CONSTRAINT `fk_product_maincategory1` FOREIGN KEY (`maincategory_maincategorynum`) REFERENCES `maincategory` (`maincategorynum`),
  CONSTRAINT `fk_product_subcategory1` FOREIGN KEY (`subcategory_subcategorynum`) REFERENCES `subcategory` (`subcategorynum`)
) ENGINE=InnoDB AUTO_INCREMENT=121 DEFAULT CHARSET=utf8 COMMENT='상품';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product`
--

LOCK TABLES `product` WRITE;
/*!40000 ALTER TABLE `product` DISABLE KEYS */;
INSERT INTO `product` VALUES (101,'플랭배내가운',45000,'/upload/B_Cthumbnail/C_B2.jpeg','2023-01-06 00:00:00','C_B02_03.jpg','f',10,20),(102,'BT21 미니니 손목딸랑이(쿠키_PINK)',17600,'/upload/B_Cthumbnail/C_B01_01.jpg','2023-01-06 00:00:00','C_B01_03.jpg','aa',10,21),(103,'마이페이보릿띵스 실리콘 이유식',47500,'/upload/Foodthumbnail/F_D01_01.jpg','2023-01-07 00:00:00','F_D01_01.jpg','aa',11,34),(104,'에뜨와 오가닉 크림',41600,'/upload/Skinthumbnail/S_01.jpg','2023-01-07 00:00:00','C_B01_03.jpg','aa',12,40),(105,'듀벳배내수트모자SET',69000,'/upload/B_Cthumbnail/C_B03_01.jpg','2023-01-06 00:00:00','C_B01_04.jpg','aa',10,20),(106,'센티코배내수트',49000,'/upload/B_Cthumbnail/C_B04_01.jpg','2023-01-06 00:00:00','C_B01_05.jpg','aa',10,20),(107,'뿌잉징코저고리',8800,'/upload/B_Cthumbnail/C_B08_01.jpg','2023-01-06 00:00:00','C_B01_06.jpg','aa',10,20),(108,'스켈배내가운',32000,'/upload/B_Cthumbnail/C_B12_01.jpg','2023-01-06 00:00:00','C_B01_07.jpg','aa',10,20),(109,'타미배내저고리',29000,'/upload/B_Cthumbnail/C_B14_01.jpg','2023-01-06 00:00:00','C_B01_08.jpg','aa',10,20),(110,'블라썸배내가운',49000,'/upload/B_Cthumbnail/C_B15_01.jpg','2023-01-06 00:00:00','C_B01_09.jpg','aa',10,20),(111,'무드배내가운',49000,'/upload/B_Cthumbnail/C_B16_01.jpg','2023-01-06 00:00:00','C_B01_10.jpg','aa',10,20),(112,'메테오배내저고리',35000,'/upload/B_Cthumbnail/C_B17_01.jpg','2023-01-06 00:00:00','C_B01_11.jpg','aa',10,20),(113,'래빗배내저고리',35000,'/upload/B_Cthumbnail/C_B18_01.jpg','2023-01-06 00:00:00','C_B01_12.jpg','aa',10,20),(114,'블라썸배내가운',39000,'/upload/B_Cthumbnail/C_B19_01.jpg','2023-01-06 00:00:00','C_B01_13.jpg','aa',10,20),(115,'안달루시안방수요패트',69000,'/upload/B_Cthumbnail/C_B05_01.jpg','2023-01-06 00:00:00','C_B01_14.jpg','aa',10,21),(116,'디노삑삑이인형',45000,'/upload/B_Cthumbnail/C_B06_01.jpg','2023-01-06 00:00:00','C_B01_15.jpg','aa',10,21),(117,'미뇽겉싸개',219000,'/upload/B_Cthumbnail/C_B07_01.jpg','2023-01-06 00:00:00','C_B01_16.jpg','aa',10,21),(118,'래빗신생모',27000,'/upload/B_Cthumbnail/C_B10_01.jpg','2023-01-06 00:00:00','C_B01_17.jpg','aa',10,20),(119,'산타핏신생모',25000,'/upload/B_Cthumbnail/C_B11_01.jpg','2023-01-06 00:00:00','C_B01_18.jpg','aa',10,20),(120,'앤래빗징코손싸개',7900,'/upload/B_Cthumbnail/C_B13_01.jpg','2023-01-06 00:00:00','C_B01_19.jpg','aa',10,20);
/*!40000 ALTER TABLE `product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `productoption`
--

DROP TABLE IF EXISTS `productoption`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `productoption` (
  `optnum` int NOT NULL AUTO_INCREMENT COMMENT '옵션 번호',
  `optname` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '옵션 이름',
  `extraamount` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '추가 금액',
  `outofstock` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '품절 여부',
  `product_prodnum` int NOT NULL COMMENT '상품번호',
  PRIMARY KEY (`optnum`),
  KEY `fk_Product Option_product1_idx` (`product_prodnum`),
  CONSTRAINT `fk_Product Option_product1` FOREIGN KEY (`product_prodnum`) REFERENCES `product` (`prodnum`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='상품 옵션';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `productoption`
--

LOCK TABLES `productoption` WRITE;
/*!40000 ALTER TABLE `productoption` DISABLE KEYS */;
/*!40000 ALTER TABLE `productoption` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `qna`
--

DROP TABLE IF EXISTS `qna`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `qna` (
  `qnanum` int NOT NULL AUTO_INCREMENT COMMENT 'Q&A 글 번호',
  `qnatitle` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'Q&A 제목',
  `qnacontent` blob NOT NULL COMMENT 'Q&A 내용',
  `qnaimg` blob COMMENT 'Q&A 이미지',
  `qnadate` datetime NOT NULL COMMENT 'Q&A 작성 날짜',
  `qna category_qnacatenum` enum('A','B') NOT NULL COMMENT 'Q&A 카테고리',
  `member_usernum` int NOT NULL COMMENT '유저 번호',
  PRIMARY KEY (`qnanum`),
  KEY `fk_qna_member1_idx` (`member_usernum`),
  CONSTRAINT `fk_qna_member1` FOREIGN KEY (`member_usernum`) REFERENCES `member` (`usernum`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='qna 내용을 저장하는 테이블';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `qna`
--

LOCK TABLES `qna` WRITE;
/*!40000 ALTER TABLE `qna` DISABLE KEYS */;
/*!40000 ALTER TABLE `qna` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `review`
--

DROP TABLE IF EXISTS `review`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `review` (
  `reviewnum` int NOT NULL AUTO_INCREMENT COMMENT '글 번호',
  `reviewtitle` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '리뷰 제목',
  `reviewcontent` blob NOT NULL COMMENT '리뷰 내용',
  `reviewdate` datetime NOT NULL COMMENT '리뷰 작성 날짜',
  `reviewimg` blob COMMENT '리뷰 이미지',
  `member_usernum` int NOT NULL COMMENT '유저 번호',
  `product_prodnum` int NOT NULL COMMENT '상품 번호',
  PRIMARY KEY (`reviewnum`),
  KEY `fk_review_member1_idx` (`member_usernum`),
  KEY `fk_review_product1_idx` (`product_prodnum`),
  CONSTRAINT `fk_review_member1` FOREIGN KEY (`member_usernum`) REFERENCES `member` (`usernum`),
  CONSTRAINT `fk_review_product1` FOREIGN KEY (`product_prodnum`) REFERENCES `product` (`prodnum`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='상품에 대한 리뷰를 저장하는 테이블';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `review`
--

LOCK TABLES `review` WRITE;
/*!40000 ALTER TABLE `review` DISABLE KEYS */;
/*!40000 ALTER TABLE `review` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sessions`
--

DROP TABLE IF EXISTS `sessions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sessions` (
  `session_id` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `expires` int unsigned NOT NULL,
  `data` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin,
  PRIMARY KEY (`session_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sessions`
--

LOCK TABLES `sessions` WRITE;
/*!40000 ALTER TABLE `sessions` DISABLE KEYS */;
/*!40000 ALTER TABLE `sessions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `subcategory`
--

DROP TABLE IF EXISTS `subcategory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `subcategory` (
  `subcategorynum` int NOT NULL AUTO_INCREMENT COMMENT '카테고리 번호(소분류)',
  `subcategoryname` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '카테고리 이름(소분류)',
  `maincategory_maincategorynum` int NOT NULL COMMENT '대분류',
  PRIMARY KEY (`subcategorynum`),
  KEY `fk_subcategory_maincategory1_idx` (`maincategory_maincategorynum`),
  CONSTRAINT `fk_subcategory_maincategory1` FOREIGN KEY (`maincategory_maincategorynum`) REFERENCES `maincategory` (`maincategorynum`)
) ENGINE=InnoDB AUTO_INCREMENT=44 DEFAULT CHARSET=utf8 COMMENT='상품 카테고리(소분류)';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `subcategory`
--

LOCK TABLES `subcategory` WRITE;
/*!40000 ALTER TABLE `subcategory` DISABLE KEYS */;
INSERT INTO `subcategory` VALUES (20,'신생아의류',10),(21,'이불/요/베개',10),(22,'손수건',10),(23,'목욕타월/가운',10),(24,'턱받이',10),(30,'젖병',11),(31,'치발기',11),(32,'분유케이스/저장팩',11),(33,'소독기/건조대',11),(34,'빨대컵/보온병',11),(40,'로션/선크림',12),(41,'삼푸/바스',12),(42,'파우더',12),(43,'선크림/선케어',12);
/*!40000 ALTER TABLE `subcategory` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-01-29 11:18:23
