-- MySQL dump 10.13  Distrib 8.0.23, for Win64 (x86_64)
--
-- Host: localhost    Database: webdb
-- ------------------------------------------------------
-- Server version	8.0.23

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
-- Table structure for table `blog`
--

DROP TABLE IF EXISTS `blog`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `blog` (
  `user_no` int NOT NULL,
  `title` varchar(45) DEFAULT NULL,
  `LOGO` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`user_no`),
  CONSTRAINT `no` FOREIGN KEY (`user_no`) REFERENCES `user` (`NO`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `blog`
--

LOCK TABLES `blog` WRITE;
/*!40000 ALTER TABLE `blog` DISABLE KEYS */;
INSERT INTO `blog` VALUES (1,'ㅎㅇㅎㅇ','1_logo'),(2,'타이틀을 수정해주세요','logo를 수정해주세요'),(3,'타이틀을 수정해주세요','logo를 수정해주세요'),(4,'타이틀을 수정해주세요','logo를 수정해주세요');
/*!40000 ALTER TABLE `blog` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `board`
--

DROP TABLE IF EXISTS `board`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `board` (
  `no` int unsigned NOT NULL AUTO_INCREMENT COMMENT '번호',
  `title` varchar(100) NOT NULL COMMENT '제목',
  `contents` text NOT NULL COMMENT '내용',
  `write_date` datetime NOT NULL COMMENT '작성일',
  `hit` int NOT NULL COMMENT '조회수',
  `g_no` int NOT NULL COMMENT '글그룹',
  `o_no` int NOT NULL COMMENT '글순서',
  `depth` int NOT NULL COMMENT '글깊이',
  `user_no` int unsigned NOT NULL COMMENT '회원번호',
  `file_name` text COMMENT '파일이름',
  PRIMARY KEY (`no`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='게시판';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `board`
--

LOCK TABLES `board` WRITE;
/*!40000 ALTER TABLE `board` DISABLE KEYS */;
/*!40000 ALTER TABLE `board` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `category`
--

DROP TABLE IF EXISTS `category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `category` (
  `no` int NOT NULL,
  `name` varchar(45) DEFAULT NULL,
  `description` varchar(45) DEFAULT NULL,
  `reg_date` date DEFAULT NULL,
  `user_no` int DEFAULT NULL,
  PRIMARY KEY (`no`),
  KEY `user_no_idx` (`user_no`),
  CONSTRAINT `user_no` FOREIGN KEY (`user_no`) REFERENCES `user` (`NO`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `category`
--

LOCK TABLES `category` WRITE;
/*!40000 ALTER TABLE `category` DISABLE KEYS */;
INSERT INTO `category` VALUES (1,'미분류','미분류','2020-02-05',1),(2,'카테고리','설정','2020-02-05',1),(3,'미분류','미분류','2020-02-05',2),(4,'미분류','미분류','2020-04-03',3),(5,'미분류','미분류','2020-07-23',4);
/*!40000 ALTER TABLE `category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `comment`
--

DROP TABLE IF EXISTS `comment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `comment` (
  `no` int unsigned NOT NULL AUTO_INCREMENT COMMENT '번호',
  `content` varchar(45) DEFAULT NULL,
  `reg_date` varchar(45) DEFAULT NULL,
  `post_no` int DEFAULT NULL,
  `user_no` int DEFAULT NULL,
  PRIMARY KEY (`no`),
  KEY `post_no_idx` (`post_no`),
  KEY `user_no_idx` (`user_no`),
  CONSTRAINT `comment_user_no` FOREIGN KEY (`user_no`) REFERENCES `user` (`NO`),
  CONSTRAINT `FK_User_TO_comment` FOREIGN KEY (`user_no`) REFERENCES `user` (`NO`),
  CONSTRAINT `post_no` FOREIGN KEY (`post_no`) REFERENCES `post` (`no`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comment`
--

LOCK TABLES `comment` WRITE;
/*!40000 ALTER TABLE `comment` DISABLE KEYS */;
INSERT INTO `comment` VALUES (2,'123','2020-02-05 19:50:49',1,1),(3,'123','2020-02-05 19:50:52',1,1),(4,'1','2020-02-05 20:02:02',1,1);
/*!40000 ALTER TABLE `comment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gallery`
--

DROP TABLE IF EXISTS `gallery`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `gallery` (
  `no` int unsigned NOT NULL AUTO_INCREMENT COMMENT '번호',
  `reg_date` datetime DEFAULT NULL,
  `comment` varchar(200) DEFAULT NULL,
  `image_url` varchar(300) DEFAULT NULL,
  `user_no` int DEFAULT NULL,
  PRIMARY KEY (`no`),
  KEY `gallery_user_no_idx` (`user_no`),
  CONSTRAINT `gallery_user_no` FOREIGN KEY (`user_no`) REFERENCES `user` (`NO`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gallery`
--

LOCK TABLES `gallery` WRITE;
/*!40000 ALTER TABLE `gallery` DISABLE KEYS */;
INSERT INTO `gallery` VALUES (1,'2020-02-07 10:00:27','123','/uploads/gallery/1/20201710027280_경비청구방법.PNG',1),(2,'2020-02-07 14:50:09','1232','/uploads/gallery/1/2020172509893_스크린샷 2019-11-18 오후 2.13.21(2).png',1),(3,'2020-02-07 14:55:14','test!!!','/uploads/gallery/1/20201725514920_ip설정.PNG',1),(4,'2020-02-07 15:09:26','예찌니','/uploads/gallery/1/2020173926616_69556022_2415631085389016_7289256392602763652_n.jpg',1);
/*!40000 ALTER TABLE `gallery` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `guestbook`
--

DROP TABLE IF EXISTS `guestbook`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `guestbook` (
  `no` int unsigned NOT NULL AUTO_INCREMENT COMMENT '번호',
  `name` varchar(20) NOT NULL COMMENT '이름',
  `password` varchar(64) NOT NULL COMMENT '비밀번호',
  `message` text NOT NULL COMMENT '글내용',
  `reg_date` datetime NOT NULL COMMENT '작성일',
  PRIMARY KEY (`no`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='방명록';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `guestbook`
--

LOCK TABLES `guestbook` WRITE;
/*!40000 ALTER TABLE `guestbook` DISABLE KEYS */;
/*!40000 ALTER TABLE `guestbook` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `post`
--

DROP TABLE IF EXISTS `post`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `post` (
  `no` int NOT NULL,
  `title` varchar(45) DEFAULT NULL,
  `content` varchar(45) DEFAULT NULL,
  `reg_date` date DEFAULT NULL,
  `category_no` int DEFAULT NULL,
  PRIMARY KEY (`no`),
  KEY `category_no_idx` (`category_no`),
  CONSTRAINT `category_no` FOREIGN KEY (`category_no`) REFERENCES `category` (`no`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `post`
--

LOCK TABLES `post` WRITE;
/*!40000 ALTER TABLE `post` DISABLE KEYS */;
INSERT INTO `post` VALUES (1,'123','123','2020-02-05',1);
/*!40000 ALTER TABLE `post` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sc_chat`
--

DROP TABLE IF EXISTS `sc_chat`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sc_chat` (
  `ip` varchar(45) NOT NULL,
  `session_id` varchar(45) NOT NULL,
  PRIMARY KEY (`session_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sc_chat`
--

LOCK TABLES `sc_chat` WRITE;
/*!40000 ALTER TABLE `sc_chat` DISABLE KEYS */;
/*!40000 ALTER TABLE `sc_chat` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sc_chat_history`
--

DROP TABLE IF EXISTS `sc_chat_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sc_chat_history` (
  `no` int NOT NULL,
  `author` varchar(45) DEFAULT NULL,
  `author_id` varchar(45) DEFAULT NULL,
  `message` varchar(300) DEFAULT NULL,
  `timestamp` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`no`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sc_chat_history`
--

LOCK TABLES `sc_chat_history` WRITE;
/*!40000 ALTER TABLE `sc_chat_history` DISABLE KEYS */;
INSERT INTO `sc_chat_history` VALUES (1,'minnow-regressive','10.51.15.31','ㅋㅋ?','1612940290011'),(2,'safeguard-rusty','10.51.115.88','ㅋㅋㅋ????','1612941641848'),(3,'deerskin-vindictive','10.51.15.31','zzz','1612941641248'),(4,'deerskin-vindictive','10.51.15.31','비밀스런 대화의방임','1612941643818'),(5,'집가고싶어요','10.51.115.88','ㅋㅋㅋㅋㅋㅋㅋㅋ 다시 오픈했군여','1612941660729'),(6,'집가고싶어요','10.51.115.88','일정은 계속 남아있네여','1612941664572'),(7,'deerskin-vindictive','10.51.15.31','그 뭐냐','1612941672691'),(8,'deerskin-vindictive','10.51.15.31','혹시나 무례하지 않다면 ㅎㅎ 너희 개발소스를 사악 뜯어보고 싶은데','1612941691417'),(9,'deerskin-vindictive','10.51.15.31','방법이 없을까해서','1612941694320'),(10,'deerskin-vindictive','10.51.15.31','ㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋ','1612941695794'),(11,'deerskin-vindictive','10.51.15.31','그냥뭐 구조 참고용?','1612941700142'),(12,'deerskin-vindictive','10.51.15.31','git 받는데','1612941723321'),(13,'deerskin-vindictive','10.51.15.31','엄청ㅇ래걸린다던데','1612941726433'),(14,'deerskin-vindictive','10.51.15.31','혹여나 니가 조금이라도 1%라도 곤란하면','1612941800794'),(15,'deerskin-vindictive','10.51.15.31','어쩔수없곸ㅋㅋㅋㅋ','1612941805422'),(16,'집가고싶어요','10.51.115.88','ㅋㅋㅋㅋㅋㅋㅋ git 받으면 90기가??? ','1612941863534'),(17,'집가고싶어요','10.51.115.88','하드 용량 다 쓸판이에여','1612941869044'),(18,'deerskin-vindictive','10.51.15.31',';;;;','1612941868310'),(19,'deerskin-vindictive','10.51.15.31','90기가?','1612941870569'),(20,'deerskin-vindictive','10.51.15.31','ㅋㅋㅋㅋ','1612941871398'),(21,'deerskin-vindictive','10.51.15.31','못받겟네','1612941873441'),(22,'집가고싶어요','10.51.115.88','클론 받아놓고','1612941875908'),(23,'deerskin-vindictive','10.51.15.31','ㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋ','1612941874964'),(24,'집가고싶어요','10.51.115.88','밥먹고 와도 덜 되어있음..','1612941879879'),(25,'deerskin-vindictive','10.51.15.31','wehago 전체소스가','1612941882621'),(26,'deerskin-vindictive','10.51.15.31','한 git 프로젝트에','1612941885158'),(27,'집가고싶어요','10.51.115.88','브런치만 클론 받으면 될듯한데','1612941887540'),(28,'집가고싶어요','10.51.115.88','잠마녀','1612941888330'),(29,'deerskin-vindictive','10.51.15.31','다들어잇는거임?','1612941886759'),(30,'집가고싶어요','10.51.115.88','ㅇㅇㅇㅋㅋㅋㅋㅋ 도랏','1612941892424'),(31,'deerskin-vindictive','10.51.15.31','ㄷㄷㄷ','1612941892483'),(32,'deerskin-vindictive','10.51.15.31','구조적으로','1612941894381'),(33,'deerskin-vindictive','10.51.15.31','너무 오반데','1612941895374'),(34,'deerskin-vindictive','10.51.15.31','그건','1612941895885'),(35,'deerskin-vindictive','10.51.15.31','ㅋㅋㅋㅋㅋㅋㅋㅋㅋ','1612941897251'),(36,'deerskin-vindictive','10.51.15.31','아 그럼 너넨 서로 부서끼리','1612941915924'),(37,'deerskin-vindictive','10.51.15.31','소스코드','1612941917217'),(38,'deerskin-vindictive','10.51.15.31','다 보겠구나','1612941920367'),(39,'deerskin-vindictive','10.51.15.31','그건 좋네','1612941924742'),(40,'deerskin-vindictive','10.51.15.31','ㅋㅋㅋㅋㅋㅋㅋㅋ','1612941926248'),(41,'deerskin-vindictive','10.51.15.31','남이 짜놓은거 구경도하고','1612941929615'),(42,'deerskin-vindictive','10.51.15.31','근데 그거 하나씩 까보는건 ㄹㅇ; 개스트레겟다','1612941937444'),(43,'deerskin-vindictive','10.51.15.31','ㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋ','1612941939065'),(44,'집가고싶어요','10.51.115.88','ㅇㅇㅇ 근데 만든거 또 만들어둔거 투ㅜ성이라서','1612941947506'),(45,'deerskin-vindictive','10.51.15.31','왜 그렇게 잡앗다냐','1612941948050'),(46,'집가고싶어요','10.51.115.88','구조도 똥이에여','1612941950858'),(47,'집가고싶어요','10.51.115.88','http://wiki.duzon.com:8080/pages/viewpage.action?pageId=49165796','1612941951949'),(48,'deerskin-vindictive','10.51.15.31','ㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋ','1612941950508'),(49,'집가고싶어요','10.51.115.88','요거 들어가지나여','1612941955670'),(50,'deerskin-vindictive','10.51.15.31','놉 ㅍ','1612941961479'),(51,'deerskin-vindictive','10.51.15.31','ㅠㅠ','1612941962290'),(52,'deerskin-vindictive','10.51.15.31','ㅋㅋㅋㅋㅋㅋㅋ','1612941963481'),(53,'집가고싶어요','10.51.115.88','servicedev 브랜치만 받으면 됫듯','1612941968540'),(54,'집가고싶어요','10.51.115.88','사진으로 드릴게여','1612941978128'),(55,'집가고싶어요','10.51.115.88','비즈박스 잠시','1612941980448'),(56,'deerskin-vindictive','10.51.15.31','ㅇㅋㄷㅋ','1612941982295'),(57,'집가고싶어요','10.51.115.88','사진 갔나여','1612942050645'),(58,'집가고싶어요','10.51.115.88','저걸로 하면 브랜치 하나만 받는거라 용량 줄어들ㅇ여','1612942068948'),(59,'deerskin-vindictive','10.51.15.31','ㅇㅇㅇ 땡큐','1612942154689'),(60,'deerskin-vindictive','10.51.15.31','근데 내가 접근할수가없네 ㅋㅋㅋ','1612942161071'),(61,'deerskin-vindictive','10.51.15.31','gitlab 이제?','1612942164410'),(62,'deerskin-vindictive','10.51.15.31','아마 ip로 접근해야할꺼같네 다음에 받아보지뭐','1612942179386'),(63,'deerskin-vindictive','10.51.15.31','ㅋㅋㅋ','1612942180057'),(64,'집가고싶어요','10.51.115.88','넵넵 gitlat','1612942225489'),(65,'집가고싶어요','10.51.115.88','접근 아예 안된여','1612942231179'),(66,'집가고싶어요','10.51.115.88','여기 알림 기능 넣어주세욬ㅋㅋㅋ','1612942347818'),(67,'deerskin-vindictive','10.51.15.31','ㅇㅇ 내생각엔 아이피 바꾸고','1612942353418'),(68,'deerskin-vindictive','10.51.15.31','니계정까지 얻어야','1612942356338'),(69,'deerskin-vindictive','10.51.15.31','가능할듯','1612942357280'),(70,'deerskin-vindictive','10.51.15.31','ㅋㅋㅋㅋㅋㅋㅋㅋ','1612942358534'),(71,'deerskin-vindictive','10.51.15.31','근데 애초에','1612942360333'),(72,'deerskin-vindictive','10.51.15.31','이컴퓨터에 받을 용량이없어서','1612942364977'),(73,'deerskin-vindictive','10.51.15.31','다음에 한번 도전해야겟다','1612942372151'),(74,'deerskin-vindictive','10.51.15.31','ㅋㅋㅋㅋ이서버 죽은서버','1612942376875'),(75,'deerskin-vindictive','10.51.15.31','더이상 기능추가없습니다','1612942379732'),(76,'deerskin-vindictive','10.51.15.31','ㅋㅋㅋㅋ','1612942381004'),(77,'집가고싶어요','10.51.115.88','ㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋ 서버 확장해주시져 ㅠ','1612942393296'),(78,'deerskin-vindictive','10.51.15.31','내 직업도 개발자고 하니깐','1612942399458'),(79,'deerskin-vindictive','10.51.15.31','외장하드','1612942402459'),(80,'deerskin-vindictive','10.51.15.31','하나 사야겟다','1612942403912'),(81,'deerskin-vindictive','10.51.15.31','내가 햇던 소스같은거 다 넣어가지고','1612942412214'),(82,'deerskin-vindictive','10.51.15.31','찾을려고 하니깐 잘안보이더라고 맨날 ㄷㄷ;','1612942416925'),(83,'deerskin-vindictive','10.51.15.31','예전에한거','1612942418062'),(84,'deerskin-vindictive','10.51.15.31','이번에 카뱅 포폴도 그래서 못냄','1612942432859'),(85,'deerskin-vindictive','10.51.15.31','ㅋㅋㅋㅋ','1612942433672'),(86,'deerskin-vindictive','10.51.15.31','바로 버그','1612942461145'),(87,'deerskin-vindictive','10.51.15.31','ㅋㅋㅋㅋ','1612942463273'),(88,'deerskin-vindictive','10.51.15.31','이채팅도 문제많습니다 ㅠ','1612942468714'),(89,'dispatcher-unwary','10.51.115.88','ㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋ 계속 확장 시켜주세ㅕㅇ ㅋㅋㅋㅋㅋ','1612942490439'),(90,'dispatcher-unwary','10.51.115.88','요걸로 톡하니까 보안 걱정은 없네여','1612942496979'),(91,'deerskin-vindictive','10.51.15.31','거ㅡㄷ네 궁금하네','1612942495352'),(92,'deerskin-vindictive','10.51.15.31','알림이나','1612942499914'),(93,'deerskin-vindictive','10.51.15.31','그런거','1612942500677'),(94,'deerskin-vindictive','10.51.15.31','해바짜 웹으로밖에','1612942505708'),(95,'deerskin-vindictive','10.51.15.31','못뛰우는거아님?','1612942507705'),(96,'deerskin-vindictive','10.51.15.31','우리 비즈박스 대화방 알림처럼','1612942515435'),(97,'dispatcher-unwary','10.51.115.88','ㅇㅇㅇ 크롬에서 데스크탑 알림 띄우는거나','1612942521843'),(98,'deerskin-vindictive','10.51.15.31','windows에 띄울수 잇음?','1612942521167'),(99,'dispatcher-unwary','10.51.115.88','모바일 푸ㅜ시','1612942524137'),(100,'dispatcher-unwary','10.51.115.88','ㅇㅇㅇ 크롬에서만 띄워져여','1612942533090'),(101,'deerskin-vindictive','10.51.15.31','크롬에서 데스크탑 알림을','1612942532498'),(102,'deerskin-vindictive','10.51.15.31','띄울수잇구나','1612942534096'),(103,'deerskin-vindictive','10.51.15.31','오','1612942536686'),(104,'deerskin-vindictive','10.51.15.31','심심하면 한번 구현해봄','1612942543081'),(105,'deerskin-vindictive','10.51.15.31','ㅋㅋㅋ','1612942543989'),(106,'dispatcher-unwary','10.51.115.88','https 에서만 띄울수 있다고는 하는데 로컬로는 돌아가긴 하더라고여','1612942554896'),(107,'dispatcher-unwary','10.51.115.88','ㅋㅋㅋㅋ 어서 적용시켜 주세여','1612942561435'),(108,'deerskin-vindictive','10.51.15.31','저기 성혜님','1612942681884'),(109,'deerskin-vindictive','10.51.15.31','git clone 받기위해 마지막 단계가 남아있는뎈ㅋㅋㅋ','1612942712391'),(110,'deerskin-vindictive','10.51.15.31','계정 가능하십니까..? 비밀번호라 좀 불편하면 다른걸 구해보겟음','1612942739076'),(111,'deerskin-vindictive','10.51.15.31','ㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋ','1612942740996'),(112,'deerskin-vindictive','10.51.15.31','주말에와서 git clone 땡겨야겟다 다음에','1612942749593'),(113,'deerskin-vindictive','10.51.15.31','주말에 컴터 끄고 퇴근하시죠?','1612942765644'),(114,'deerskin-vindictive','10.51.15.31','성혜님 아이피 비릴게','1612942775373'),(115,'deerskin-vindictive','10.51.15.31','ㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋ','1612942776737'),(116,'deerskin-vindictive','10.51.15.31','성혜님 ip + git id 면 clone 이 안될수없을듯','1612942794062'),(117,'dispatcher-unwary','10.51.115.88','ㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋ 아 저 컴터 챙겨가는뎈ㅋㅋㅋㅋㅋ','1612943172140'),(118,'dispatcher-unwary','10.51.115.88','여기 파일 업로드 되나여','1612943182452'),(119,'deerskin-vindictive','10.51.15.31','아니아니 ㅋㅋ','1612943244473'),(120,'deerskin-vindictive','10.51.15.31','내 컴퓨터에서 할껀데','1612943247680'),(121,'deerskin-vindictive','10.51.15.31','git 계정이 있어야 받을수있을꺼같아섴ㅋㅋ','1612943257694'),(122,'deerskin-vindictive','10.51.15.31','시도는안해봣는데','1612943261164'),(123,'deerskin-vindictive','10.51.15.31','파일업로드 당연히 안됩니다','1612943575057'),(124,'deerskin-vindictive','10.51.15.31','ㅋㅋㅋㅋ','1612943575916'),(125,'dispatcher-unwary','10.51.115.88','아 ㅋㅋㅋㅋㅋㅋ 파일 업로드 만들어주세여','1612943818798'),(126,'dispatcher-unwary','10.51.115.88','다른 서비스 프로젝트도 잇어서','1612943838360'),(127,'dispatcher-unwary','10.51.115.88','포탈만 받으셔야할듯여','1612943844097'),(128,'deerskin-vindictive','10.51.15.31','너네팀은 wifi 안쓰고 다 랜선 씀요 ㅇ?','1612944003778'),(129,'dispatcher-unwary','10.51.115.88','ㄴㄴㄴ 젛희 다 wifi 써영','1612944088924'),(130,'deerskin-vindictive','10.51.15.31','개인 ip도 있지않음 그럼ㅇ?','1612944124920'),(131,'dispatcher-unwary','10.51.115.88','10.51.115.88','1612944157744'),(132,'dispatcher-unwary','10.51.115.88','gps03155 / 박성혜1! 함 해보세여','1612944166716'),(133,'deerskin-vindictive','10.51.15.31','10.51.115.88 -> 이거는 wifi 아이피아니가','1612944167634'),(134,'deerskin-vindictive','10.51.15.31','ㅋㅋㅋㅋ','1612944169255'),(135,'dispatcher-unwary','10.51.115.88','근데 깃풀이 안되낟ㅋㅋㅋㅋㅋ','1612944174976'),(136,'deerskin-vindictive','10.51.15.31','땡큐!','1612944172755'),(137,'deerskin-vindictive','10.51.15.31','아니 저렇게만 알면 ㄱ','1612944179323'),(138,'dispatcher-unwary','10.51.115.88','ㅋㅋㅋㅋㅋㅋㅋㅋ 비번 바꾸고 나서 풀이 안되넨염','1612944183205'),(139,'deerskin-vindictive','10.51.15.31','쌉가능하지','1612944181108'),(140,'deerskin-vindictive','10.51.15.31','ㄳㄳ','1612944182349'),(141,'dispatcher-unwary','10.51.115.88','ㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋ','1612944186857'),(142,'deerskin-vindictive','10.51.15.31','아 그거는','1612944187700'),(143,'dispatcher-unwary','10.51.115.88','포탈만 받으셔야할듯여','1612944190654'),(144,'deerskin-vindictive','10.51.15.31','아마도 너 git에 저장되있는','1612944191659'),(145,'deerskin-vindictive','10.51.15.31','정보랑 ','1612944192854'),(146,'deerskin-vindictive','10.51.15.31','달라서그런거임','1612944194357'),(147,'dispatcher-unwary','10.51.115.88','프로젝트 소스 퍼지면 안되니께','1612944200054'),(148,'dispatcher-unwary','10.51.115.88','ㅇㅇㅇㅇ 함 찾아봅니다 ㅋㅋㅋㅋㅋ','1612944205468'),(149,'deerskin-vindictive','10.51.15.31','10.51.115.88 이거','1612944223087'),(150,'deerskin-vindictive','10.51.15.31','wifi ip아니가 ?','1612944226624'),(151,'deerskin-vindictive','10.51.15.31','내가 저걸로 ip변경하면 충돌날텐데 지금','1612944232001'),(152,'deerskin-vindictive','10.51.15.31','git 비번 일단 원래대로 돌렼ㅋㅋㅋㅋ','1612944253234'),(153,'deerskin-vindictive','10.51.15.31','지금 받기도 애매할듯','1612944263926'),(154,'deerskin-vindictive','10.51.15.31','erp10 소스도 궁금하면','1612944288299'),(155,'deerskin-vindictive','10.51.15.31','언제든 알려줄수잇다','1612944290949'),(156,'deerskin-vindictive','10.51.15.31','ㅋㅋㅋㅋㅋㅋ','1612944292107'),(157,'deerskin-vindictive','10.51.15.31','공부용으로 보고싶다면','1612944296200'),(158,'deerskin-vindictive','10.51.15.31','후 1시간남앗다','1612944343933'),(159,'dispatcher-unwary','10.51.115.88','ㅋㅋㅋㅋㅋㅋㅋ앜ㅋㅋㅋㅋ 넹넹 erp10도 어케 개발하는지 궁금하네여 ㅋㅋㅋㅋㅋ','1612944349151'),(160,'deerskin-vindictive','10.51.15.31','우리는','1612944354493'),(161,'deerskin-vindictive','10.51.15.31','메인 프로젝트가','1612944357994'),(162,'deerskin-vindictive','10.51.15.31','하나있고','1612944360017'),(163,'deerskin-vindictive','10.51.15.31','걔 밑으로 jar 식으로','1612944364877'),(164,'deerskin-vindictive','10.51.15.31','개발자들이 개발한걸 붙임','1612944368022'),(165,'deerskin-vindictive','10.51.15.31','그래서 모든 파일을 다받는게아니라','1612944373045'),(166,'deerskin-vindictive','10.51.15.31','필요한거만 받아서 실행시키는데','1612944376544'),(167,'deerskin-vindictive','10.51.15.31','그럼에도 느리네','1612944381521'),(168,'deerskin-vindictive','10.51.15.31','10.51.115.88 -> 이거는 wifi ip 주소아니가?','1612944392679'),(169,'deerskin-vindictive','10.51.15.31','성혜니 개인주소임?','1612944395328'),(170,'dispatcher-unwary','10.51.115.88','오 뭔라 라이브러리 개발해서 붙이는 그런 느낌인가여','1612944398799'),(171,'deerskin-vindictive','10.51.15.31','ㅇㅇㅇ','1612944402899'),(172,'dispatcher-unwary','10.51.115.88','와이파이ㅕ','1612944406200'),(173,'deerskin-vindictive','10.51.15.31','라이브러리 개발이라기엔 애매한데','1612944406669'),(174,'dispatcher-unwary','10.51.115.88','지금 접속되어있는거','1612944409216'),(175,'dispatcher-unwary','10.51.115.88','jar만 받아서 붙이면 저희쪽도 쓸수있는건가여','1612944424809'),(176,'deerskin-vindictive','10.51.15.31','화면돌아가도록하는','1612944424412'),(177,'deerskin-vindictive','10.51.15.31','소스들을','1612944425387'),(178,'deerskin-vindictive','10.51.15.31','개발해서 ','1612944426901'),(179,'deerskin-vindictive','10.51.15.31','붙이지','1612944428272'),(180,'deerskin-vindictive','10.51.15.31','니 개인 ip 주소가 뭐임?','1612944440479'),(181,'deerskin-vindictive','10.51.15.31','그걸 알아야 내가 그걸로 하면될꺼같아서','1612944446212'),(182,'deerskin-vindictive','10.51.15.31','뭐 구조적으로 잘잡으면','1612944469434'),(183,'deerskin-vindictive','10.51.15.31','당연히 가능가능','1612944472620'),(184,'deerskin-vindictive','10.51.15.31','아 지름신 와서','1612944519338'),(185,'deerskin-vindictive','10.51.15.31','외장하드','1612944520393'),(186,'deerskin-vindictive','10.51.15.31','질럿다','1612944521177'),(187,'deerskin-vindictive','10.51.15.31','10만우너','1612944523217'),(188,'deerskin-vindictive','10.51.15.31','ㅋㅋㅋㅋ','1612944524168'),(189,'dispatcher-unwary','10.51.115.88','ㅋㅋㅋㅋㅋㅋㅋㅋㅋ 엄청납니다! 211.169.69.254','1612944526515'),(190,'deerskin-vindictive','10.51.15.31','이번설에가서 소스 다가져와야겟네','1612944528209'),(191,'deerskin-vindictive','10.51.15.31','어 걔는 ip주소가','1612944531869'),(192,'deerskin-vindictive','10.51.15.31','15층 주소랑좀다르네?','1612944534674'),(193,'deerskin-vindictive','10.51.15.31','10.51.15.31','1612944539243'),(194,'deerskin-vindictive','10.51.15.31','요런 형태여야할텐데','1612944541479'),(195,'dispatcher-unwary','10.51.115.88','ㅋㅋㅋㅋㅋㅋㅋ 와 바로 외장하드 지르셨나옄ㅋㅋㅋㅋ','1612944545709'),(196,'dispatcher-unwary','10.51.115.88','ㅇㅇㅇ 아까 그게 와이파이','1612944551981'),(197,'dispatcher-unwary','10.51.115.88','10.51.115.88','1612944556109'),(198,'deerskin-vindictive','10.51.15.31','dkt','1612944766285'),(199,'deerskin-vindictive','10.51.15.31','앗','1612944767067'),(200,'deerskin-vindictive','10.51.15.31','ip 바꾸다가','1612944805852'),(201,'deerskin-vindictive','10.51.15.31','서버꺼짐ㅋㅋㅋ','1612944807368'),(202,'deerskin-vindictive','10.51.15.31','게이트웨이','1612944808644'),(203,'deerskin-vindictive','10.51.15.31','도알아야할꺼가틍ㄴ데','1612944810912'),(204,'deerskin-vindictive','10.51.15.31','ip 주소 + 게이트웨이','1612944823738'),(205,'blacklist-leathery','10.51.115.88','게이트웨이요???','1612944854228'),(206,'blacklist-leathery','10.51.115.88','ㄸㄸㄸ','1612944855588'),(207,'deerskin-vindictive','10.51.15.31','dsn 서버주소도','1612944856002'),(208,'deerskin-vindictive','10.51.15.31','확인차','1612944857308'),(209,'deerskin-vindictive','10.51.15.31','ㅋㅋㅋㅋㅋ','1612944858373'),(210,'deerskin-vindictive','10.51.15.31','이런거 설정 자주안바꾸나보네','1612944863649'),(211,'deerskin-vindictive','10.51.15.31','나는 막 왔다리가따리해서','1612944867017'),(212,'deerskin-vindictive','10.51.15.31','외우고잇는데','1612944868376'),(213,'deerskin-vindictive','10.51.15.31','아니면 그냥 퇴근전에 영원히한테 부탁한번 해봐야겟닼ㅋㅋㅋ','1612944891254'),(214,'deerskin-vindictive','10.51.15.31','다음에','1612944893521'),(215,'deerskin-vindictive','10.51.15.31','영원이','1612944896477'),(216,'deerskin-vindictive','10.51.15.31','거기 wifi 연결한뒤에 영원이 아디로 받으면 받아지것지뭐','1612944915339'),(217,'deerskin-vindictive','10.51.15.31','ㅋㅋㅋㅋㅋ','1612944916339'),(218,'blacklist-leathery','10.51.115.88','ㅋㅋㅋㅋㅋㅋ넹넹 설정 같은거 안바꿔가지고 잘 몰께쎈여 ㅠㅠ','1612944940799'),(219,'deerskin-vindictive','10.51.15.31','오키 일단 땡큐','1612944949187'),(220,'blacklist-leathery','10.51.115.88','예엡','1612944957858'),(221,'blacklist-leathery','10.51.115.88','열일하세여','1612944959488'),(222,'blacklist-leathery','10.51.115.88','ㅋㅋㅋㅋㅋㅋㅋㅋ','1612944961480'),(223,'blacklist-leathery','10.51.115.88','꿀잼이네여','1612944963808'),(224,'deerskin-vindictive','10.51.15.31','덕분에 내지식이 + 될듯','1612944969546'),(225,'deerskin-vindictive','10.51.15.31','ㅋㅋㅋ','1612944970517'),(226,'deerskin-vindictive','10.51.15.31','어쨰되잇는지 궁금하넹','1612944977588'),(227,'deerskin-vindictive','10.51.15.31','ㅋㅋㅋㅋ','1612944978510'),(228,'deerskin-vindictive','10.51.15.31','근데 90g면 뭐.. 보다가 때려칠꺼같긴한데','1612944995351'),(229,'blacklist-leathery','10.51.115.88','ㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋ 볼거는 딱히 없을거에여','1612944998351'),(230,'deerskin-vindictive','10.51.15.31','ㅋㅋㅋㅋㅋㅋ','1612944996382'),(231,'deerskin-vindictive','10.51.15.31','상상 그이상이네;','1612945004690'),(232,'blacklist-leathery','10.51.115.88','ㅋㅋㅋㅋㅋㅋ 클론하다가 때려칠거같은뎈ㅋㅋㅋㅋㅋㅋㅋ','1612945010260'),(233,'blacklist-leathery','10.51.115.88','엄청납니다','1612945012293'),(234,'deerskin-vindictive','10.51.15.31','우리는','1612945024539'),(235,'deerskin-vindictive','10.51.15.31','1.45g네','1612945026005'),(236,'deerskin-vindictive','10.51.15.31','서버 딱 실행하는데 필요한 파일은','1612945029745'),(237,'blacklist-leathery','10.51.115.88','아 1.45요???? 145로 보고 깜놀랬네여','1612945164391'),(238,'deerskin-vindictive','10.51.15.31','wkatl','1612945170412'),(239,'deerskin-vindictive','10.51.15.31','잠시','1612945171596'),(240,'deerskin-vindictive','10.51.15.31','영원이 초대함','1612945173114'),(241,'deerskin-vindictive','10.51.15.31','ㅋㅋㅋㅋ영원이','1612945183242'),(242,'deerskin-vindictive','10.51.15.31','내 영석인데','1612945188739'),(243,'deerskin-vindictive','10.51.15.31','그 뭐냐','1612945190633'),(244,'deerskin-vindictive','10.51.15.31','이거 보임?','1612945217594'),(245,'deerskin-vindictive','10.51.15.31','아 ㅋㅋㅋ','1612945243592'),(246,'statuette-brassy','10.51.115.251','ㅇㅇㅇ','1612945250570'),(247,'deerskin-vindictive','10.51.15.31','곤란하면 괜찮다 ㅇㅇ','1612945248448'),(248,'deerskin-vindictive','10.51.15.31','뭔가 할라는건','1612945249935'),(249,'statuette-brassy','10.51.115.251','?','1612945252346'),(250,'deerskin-vindictive','10.51.15.31','아니고','1612945250575'),(251,'deerskin-vindictive','10.51.15.31','ㅋㅋㅋㅋㅋㅋㅋ','1612945252036'),(252,'deerskin-vindictive','10.51.15.31','그냥 erp10 구조 빽앤드','1612945258563'),(253,'blacklist-leathery','10.51.115.88','오 다중채틴','1612945262659'),(254,'deerskin-vindictive','10.51.15.31','다까봐가지고','1612945261655'),(255,'deerskin-vindictive','10.51.15.31','다른거뭐 까볼꺼없나해서','1612945264898'),(256,'deerskin-vindictive','10.51.15.31','공부용으로 소스 받을랫는데 ㄲㅂ','1612945269888'),(257,'deerskin-vindictive','10.51.15.31','ㅇㅋㅇㅋ','1612945271399'),(258,'portent-lingering','10.51.115.88','??? 나가신건가여','1612945300660'),(259,'deerskin-vindictive','10.51.15.31','ㄴㄴ 있는거임','1612945302621'),(260,'deerskin-vindictive','10.51.15.31','ㅋㅋㅋㅋㅋ','1612945303751'),(261,'deerskin-vindictive','10.51.15.31','이 채팅방','1612945311490'),(262,'deerskin-vindictive','10.51.15.31','버그많아서','1612945312543'),(263,'deerskin-vindictive','10.51.15.31','믿을수는없지만','1612945314446'),(264,'deerskin-vindictive','10.51.15.31','ㅋㅋㅋㅋㅋㅋㅋㅋ','1612945315938'),(265,'portent-lingering','10.51.115.88','ㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋ 혼란스럽ㅋㅋㅋㅋㅋㅋ','1612945360942'),(266,'정영석','10.51.15.31','뭐 어쨋든 둘다 고마움 ㅎㅅㅎ','1612945409153'),(267,'정영석','10.51.15.31','아 30분남앗다','1612945418158'),(268,'정영석','10.51.15.31','설렁설렁하자','1612945419674'),(269,'portent-lingering','10.51.115.88','ㅋㅋㅋㅋㅋㅋㅋㅋ 어서 퇴근 준비하시죠','1612945425202'),(270,'정영석','10.51.15.31','회사에 충성해서 뭐하노','1612945423516'),(271,'정영석','10.51.15.31','이미 2시간전부터','1612945428365'),(272,'정영석','10.51.15.31','마음은 집에있따','1612945430157'),(273,'portent-lingering','10.51.115.88','ㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋ 마리모 밥주고 올게요~~~','1612945439959'),(274,'정영석','10.51.15.31','마리모?','1612945446326'),(275,'portent-lingering','10.51.115.88','ㅋㅋㅋㅋㅋㅋㅋ 애견 이끼','1612945516587'),(276,'portent-lingering','10.51.115.88','졸귀입니다','1612945519327'),(277,'정영석','10.51.15.31','우리도 식물키우는데','1612945526770'),(278,'정영석','10.51.15.31','가끔 물줘야해서 귀찮다','1612945530135'),(279,'정영석','10.51.15.31','ㅋㅋㅋㅋ','1612945531252'),(280,'정영석','10.51.15.31','amaranth10 이거','1612945542979'),(281,'정영석','10.51.15.31','왤케 렉걸리노','1612945545497'),(282,'portent-lingering','10.51.115.88','ㅋㅋㅋㅋㅋㅋ 대화창 닫으면 아마란스가 꺼짐ㅋㅋㅋㅋㅋㅋ','1612945583214'),(283,'정영석','10.51.15.31','님들 30분남앗습니다','1612945879486'),(284,'정영석','10.51.15.31','서버는  off 각입니다','1612945883548'),(285,'prevention-ablaze','10.51.115.88','ㅋㅋㅋ 이미 퇴근 준비중입니다','1612945892147'),(286,'정영석','10.51.15.31','일하지말고','1612945891029'),(287,'정영석','10.51.15.31','퇴근하세요','1612945892210'),(288,'prevention-ablaze','10.51.115.88','ㅋㅋㅋㅋ 온르 하루종일 논듯','1612945899702'),(289,'정영석','10.51.15.31','용우형한테 충성해도 별거없습니다','1612945898933'),(290,'prevention-ablaze','10.51.115.88','일일보고 할게없당','1612945902326'),(291,'정영석','10.51.15.31','나도 하루종일','1612945901326'),(292,'정영석','10.51.15.31','일 1도안햇네','1612945903495'),(293,'prevention-ablaze','10.51.115.88','ㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋ','1612945906102'),(294,'정영석','10.51.15.31','ㅋㅋㅋㅋㅋㅋㅋㅋ','1612945905128'),(295,'prevention-ablaze','10.51.115.88','뭐했느지 몰겠어옄','1612945909453'),(296,'정영석','10.51.15.31','아 여원이 있을때','1612945908996'),(297,'정영석','10.51.15.31','이렇게 일안햇다고 ','1612945911517'),(298,'정영석','10.51.15.31','말해도되나','1612945913493'),(299,'정영석','10.51.15.31','ㅋㅋㅋㅋㅋㅋ','1612945914557'),(300,'prevention-ablaze','10.51.115.88','앗','1612945917686'),(301,'prevention-ablaze','10.51.115.88','열일했습니다','1612945921395'),(302,'정영석','10.51.15.31','맨날 바쁘게일하던데 요즘','1612945919143'),(303,'정영석','10.51.15.31','ㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋ','1612945921020'),(304,'정영석','10.51.15.31','ㅋㅋㅋㅋㅋㅋㅋㅋ','1612945923019'),(305,'prevention-ablaze','10.51.115.88','ㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋ','1612945926250'),(306,'prevention-ablaze','10.51.115.88','빨리 집가고 싶네요','1612945942340'),(307,'정영석','10.51.15.31','오후에 spring cloud 한다해놓고','1612945952797'),(308,'정영석','10.51.15.31','하루종일 놀고잇다','1612945957678'),(309,'정영석','10.51.15.31','ㅋㅋㅋㅋㅋㅋㅋㅋ','1612945963577'),(310,'prevention-ablaze','10.51.115.88','ㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋ 나가지 마여','1612946169293'),(311,'prevention-ablaze','10.51.115.88','돌아오세ㅕㅇ','1612946171853');
/*!40000 ALTER TABLE `sc_chat_history` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sc_schedule`
--

DROP TABLE IF EXISTS `sc_schedule`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sc_schedule` (
  `no` int NOT NULL,
  `start_date` datetime DEFAULT NULL,
  `location` varchar(200) DEFAULT NULL,
  `content` varchar(200) DEFAULT NULL,
  `rmk` varchar(200) DEFAULT NULL,
  `type` varchar(45) DEFAULT NULL,
  `end_date` datetime DEFAULT NULL,
  PRIMARY KEY (`no`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sc_schedule`
--

LOCK TABLES `sc_schedule` WRITE;
/*!40000 ALTER TABLE `sc_schedule` DISABLE KEYS */;
INSERT INTO `sc_schedule` VALUES (1,'2020-04-13 18:30:00','센텀역근처 공터',NULL,NULL,NULL,NULL),(2,'2020-06-10 03:04:00','ㅋㅋ',NULL,NULL,NULL,'2020-06-10 02:04:00'),(3,'2021-02-11 02:01:00','123123',NULL,NULL,NULL,'2021-02-11 00:01:00'),(4,NULL,'설날',NULL,NULL,NULL,NULL),(5,NULL,'설날',NULL,NULL,NULL,'2021-02-12 00:06:00');
/*!40000 ALTER TABLE `sc_schedule` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sc_user`
--

DROP TABLE IF EXISTS `sc_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sc_user` (
  `no` int NOT NULL,
  `id` varchar(45) NOT NULL,
  `name` varchar(45) DEFAULT NULL,
  `role` varchar(45) DEFAULT NULL,
  `password` varchar(200) NOT NULL,
  PRIMARY KEY (`no`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sc_user`
--

LOCK TABLES `sc_user` WRITE;
/*!40000 ALTER TABLE `sc_user` DISABLE KEYS */;
INSERT INTO `sc_user` VALUES (1,'1','정영석','AUTH','$2a$10$VSP5l5li2fo9Ss.ffpWQS.AnLklLWy/4k8i7qwMTWuSjJ82rY7zjS');
/*!40000 ALTER TABLE `sc_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `site`
--

DROP TABLE IF EXISTS `site`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `site` (
  `title` varchar(200) NOT NULL COMMENT '제목',
  `welcome` text NOT NULL COMMENT '환영메세지',
  `profile` varchar(400) NOT NULL COMMENT '프로필',
  `desc` text NOT NULL COMMENT '설명'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='사이트';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `site`
--

LOCK TABLES `site` WRITE;
/*!40000 ALTER TABLE `site` DISABLE KEYS */;
/*!40000 ALTER TABLE `site` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `NO` int NOT NULL,
  `ID` varchar(10) DEFAULT NULL,
  `NAME` varchar(10) DEFAULT NULL,
  `PASSWORD` varchar(100) DEFAULT NULL,
  `JOIN_DATE` datetime DEFAULT NULL,
  PRIMARY KEY (`NO`),
  UNIQUE KEY `ID_UNIQUE` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='	';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'mana129','정영석','$2a$10$x9x25LAbJWbdY4VoAax.wOBIumG/197h3mt3/iBOAefU8P1UFWYpe','2020-02-05 10:56:57'),(2,'test','test','$2a$10$BcX0AMOVoq03n2SKS3MwVeWGeMjsM7TkE3fQ93HF0j9WSlRsftBAm','2020-02-05 18:00:28'),(3,'aa','최기석','$2a$10$DjyqExiQLGsjn157OLXOT.s4JFQSijiQgQAucJctdV0QR/5vusJEi','2020-04-03 16:01:35'),(4,'12','123123','$2a$10$96VR0PMGNm7Pj/N3DRyALeI9Kw45LoOcfl12QJAF/DKBPZweUrUnO','2020-07-23 16:19:06');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-03-26 11:44:58
