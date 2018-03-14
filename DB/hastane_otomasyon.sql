/*
 Navicat Premium Data Transfer

 Source Server         : localhost
 Source Server Type    : MySQL
 Source Server Version : 100121
 Source Host           : localhost:3306
 Source Schema         : hastane_otomasyon

 Target Server Type    : MySQL
 Target Server Version : 100121
 File Encoding         : 65001

 Date: 12/01/2018 19:25:23
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for doktorlar
-- ----------------------------
DROP TABLE IF EXISTS `doktorlar`;
CREATE TABLE `doktorlar`  (
  `did` int(11) NOT NULL AUTO_INCREMENT,
  `dkid` int(11) NULL DEFAULT NULL,
  `dadi` varchar(255) CHARACTER SET utf8 COLLATE utf8_turkish_ci NULL DEFAULT NULL,
  `dsoyadi` varchar(255) CHARACTER SET utf8 COLLATE utf8_turkish_ci NULL DEFAULT NULL,
  `ddurum` tinyint(1) NULL DEFAULT NULL,
  PRIMARY KEY (`did`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_turkish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of doktorlar
-- ----------------------------
INSERT INTO `doktorlar` VALUES (1, 1, 'Hüssam', 'Durak', 1);
INSERT INTO `doktorlar` VALUES (2, 1, 'Yavuz', 'Türk', 1);
INSERT INTO `doktorlar` VALUES (3, 2, 'Ahmet', 'Yalvaç', 2);
INSERT INTO `doktorlar` VALUES (4, 1, 'Hüseyin', 'Mor', 1);

-- ----------------------------
-- Table structure for durumlar
-- ----------------------------
DROP TABLE IF EXISTS `durumlar`;
CREATE TABLE `durumlar`  (
  `duid` int(11) NOT NULL AUTO_INCREMENT,
  `duadi` varchar(255) CHARACTER SET utf8 COLLATE utf8_turkish_ci NULL DEFAULT NULL,
  PRIMARY KEY (`duid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8 COLLATE = utf8_turkish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of durumlar
-- ----------------------------
INSERT INTO `durumlar` VALUES (1, 'Aktif');
INSERT INTO `durumlar` VALUES (2, 'Pasif');
INSERT INTO `durumlar` VALUES (3, 'Geldi');
INSERT INTO `durumlar` VALUES (4, 'Gelmedi');
INSERT INTO `durumlar` VALUES (5, 'İptal');
INSERT INTO `durumlar` VALUES (6, 'Dolu');
INSERT INTO `durumlar` VALUES (7, 'Boş');

-- ----------------------------
-- Table structure for hastalar
-- ----------------------------
DROP TABLE IF EXISTS `hastalar`;
CREATE TABLE `hastalar`  (
  `htckn` int(11) NOT NULL,
  `hadi` varchar(255) CHARACTER SET utf8 COLLATE utf8_turkish_ci NULL DEFAULT NULL,
  `hsoyadi` varchar(255) CHARACTER SET utf8 COLLATE utf8_turkish_ci NULL DEFAULT NULL,
  `hbabaAdi` varchar(255) CHARACTER SET utf8 COLLATE utf8_turkish_ci NULL DEFAULT NULL,
  `hanneAdi` varchar(255) CHARACTER SET utf8 COLLATE utf8_turkish_ci NULL DEFAULT NULL,
  `hdogumYeri` varchar(255) CHARACTER SET utf8 COLLATE utf8_turkish_ci NULL DEFAULT NULL,
  `hdogumTarihi` date NULL DEFAULT NULL,
  `hcinsiyet` varchar(255) CHARACTER SET utf8 COLLATE utf8_turkish_ci NULL DEFAULT NULL,
  `htelefon` int(11) NULL DEFAULT NULL,
  `hmail` varchar(255) CHARACTER SET utf8 COLLATE utf8_turkish_ci NULL DEFAULT NULL,
  `hduid` tinyint(1) NULL DEFAULT NULL,
  PRIMARY KEY (`htckn`) USING BTREE,
  UNIQUE INDEX `tckn`(`htckn`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_turkish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of hastalar
-- ----------------------------
INSERT INTO `hastalar` VALUES (1, 'Hüssam', 'Durak', 'a', 'a', 'a', '2018-01-03', 'Erkek', 3333333, 'mail', 1);
INSERT INTO `hastalar` VALUES (2, 'Muharrem', 'Didici', 'b', 'b', 'b', '2018-01-07', 'Erkek', 4444444, 'mail', 2);
INSERT INTO `hastalar` VALUES (3, 'Yavuz', 'Türk', 'a', 'a', 'a', '2018-01-09', 'Erkek', 5555555, 'mail', 1);
INSERT INTO `hastalar` VALUES (4, 'Ahmet', 'Yalvaç', 'a', 'a', 'a', '2018-01-09', 'Erkek', 3334455, 'mail', 1);
INSERT INTO `hastalar` VALUES (5, 'a', 'a', 'a', 'a', 'a', '2018-01-10', 'a', 1, 'a', 2);
INSERT INTO `hastalar` VALUES (6, 'a', 'a', 'a', 'a', 'a', '2018-01-10', 'a', 1, 'a', 2);
INSERT INTO `hastalar` VALUES (7, 'a', 'a', 'a', 'a', 'a', '2018-01-11', 'a', 1, 'a', 1);
INSERT INTO `hastalar` VALUES (8, 'a', 'a', 'a', 'a', 'a', '2018-01-11', 'a', 1, 'a', 1);
INSERT INTO `hastalar` VALUES (9, 'a', 'a', 'a', 'a', 'a', '2018-01-11', 'a', 1, 'a', 2);
INSERT INTO `hastalar` VALUES (10, 'a', 'a', 'a', 'a', 'a', '2018-01-11', 'a', 1, 'a', 2);

-- ----------------------------
-- Table structure for ilaclar
-- ----------------------------
DROP TABLE IF EXISTS `ilaclar`;
CREATE TABLE `ilaclar`  (
  `iid` int(11) NOT NULL AUTO_INCREMENT,
  `iadi` varchar(255) CHARACTER SET utf8 COLLATE utf8_turkish_ci NULL DEFAULT NULL,
  PRIMARY KEY (`iid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8 COLLATE = utf8_turkish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of ilaclar
-- ----------------------------
INSERT INTO `ilaclar` VALUES (1, 'abc');
INSERT INTO `ilaclar` VALUES (2, 'b');
INSERT INTO `ilaclar` VALUES (3, 'c');
INSERT INTO `ilaclar` VALUES (4, 'd');
INSERT INTO `ilaclar` VALUES (5, 'e');
INSERT INTO `ilaclar` VALUES (6, 'f');

-- ----------------------------
-- Table structure for klinikler
-- ----------------------------
DROP TABLE IF EXISTS `klinikler`;
CREATE TABLE `klinikler`  (
  `kid` int(11) NOT NULL AUTO_INCREMENT,
  `kadi` enum('İç Hastalıkları','Genel Cerrahi','Göz Hastalıkları','Kardiyoloji','Çocuk Sağlığı ve Hastalıkları') CHARACTER SET utf8 COLLATE utf8_turkish_ci NULL DEFAULT NULL,
  PRIMARY KEY (`kid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8 COLLATE = utf8_turkish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of klinikler
-- ----------------------------
INSERT INTO `klinikler` VALUES (1, 'İç Hastalıkları');
INSERT INTO `klinikler` VALUES (2, 'Genel Cerrahi');
INSERT INTO `klinikler` VALUES (3, 'Göz Hastalıkları');
INSERT INTO `klinikler` VALUES (4, 'Kardiyoloji');
INSERT INTO `klinikler` VALUES (5, 'Çocuk Sağlığı ve Hastalıkları');

-- ----------------------------
-- Table structure for muayene
-- ----------------------------
DROP TABLE IF EXISTS `muayene`;
CREATE TABLE `muayene`  (
  `mvraid` int(11) NOT NULL,
  `msikayeti` varchar(255) CHARACTER SET utf8 COLLATE utf8_turkish_ci NULL DEFAULT NULL,
  `mhikayesi` varchar(255) CHARACTER SET utf8 COLLATE utf8_turkish_ci NULL DEFAULT NULL,
  `mozgecmisi` varchar(255) CHARACTER SET utf8 COLLATE utf8_turkish_ci NULL DEFAULT NULL,
  `mrecid` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`mvraid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_turkish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of muayene
-- ----------------------------
INSERT INTO `muayene` VALUES (6, NULL, NULL, NULL, NULL);

-- ----------------------------
-- Table structure for personeller
-- ----------------------------
DROP TABLE IF EXISTS `personeller`;
CREATE TABLE `personeller`  (
  `ptckn` int(11) NOT NULL,
  `prolid` int(11) NULL DEFAULT NULL,
  `padi` varchar(255) CHARACTER SET utf8 COLLATE utf8_turkish_ci NULL DEFAULT NULL,
  `psoyadi` varchar(255) CHARACTER SET utf8 COLLATE utf8_turkish_ci NULL DEFAULT NULL,
  `ptelefon` int(11) NULL DEFAULT NULL,
  `pmail` varchar(255) CHARACTER SET utf8 COLLATE utf8_turkish_ci NULL DEFAULT NULL,
  `psifre` varchar(255) CHARACTER SET utf8 COLLATE utf8_turkish_ci NULL DEFAULT NULL,
  `pdurum` tinyint(1) NULL DEFAULT NULL,
  PRIMARY KEY (`ptckn`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_turkish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of personeller
-- ----------------------------
INSERT INTO `personeller` VALUES (1, 1, 'Hüssam', 'Durak', 44444444, 'mail', '1', 2);
INSERT INTO `personeller` VALUES (2, 2, 'Personel', 'Personel', 4, 'm', '1', 1);
INSERT INTO `personeller` VALUES (3, 3, 'Doktor', 'Doktor', 4, 'm', '1', 1);

-- ----------------------------
-- Table structure for randevular
-- ----------------------------
DROP TABLE IF EXISTS `randevular`;
CREATE TABLE `randevular`  (
  `raid` int(11) NOT NULL AUTO_INCREMENT,
  `rakid` int(11) NULL DEFAULT NULL,
  `radid` int(11) NULL DEFAULT NULL,
  `ragun` date NULL DEFAULT NULL,
  `rasid` int(11) NULL DEFAULT NULL,
  `rduid` tinyint(1) NULL DEFAULT NULL,
  PRIMARY KEY (`raid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 9 CHARACTER SET = utf8 COLLATE = utf8_turkish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of randevular
-- ----------------------------
INSERT INTO `randevular` VALUES (1, 1, 1, '2018-01-12', 1, 3);
INSERT INTO `randevular` VALUES (2, 1, 1, '2018-01-12', 24, 3);
INSERT INTO `randevular` VALUES (3, 1, 1, '2018-01-12', 23, 4);
INSERT INTO `randevular` VALUES (4, 1, 1, '2018-01-12', 12, 4);
INSERT INTO `randevular` VALUES (5, 1, 1, '2018-01-12', 12, 3);
INSERT INTO `randevular` VALUES (6, 1, 1, '2018-01-12', 11, 4);
INSERT INTO `randevular` VALUES (7, 2, 2, '2018-01-12', 10, 4);
INSERT INTO `randevular` VALUES (8, NULL, NULL, NULL, NULL, NULL);

-- ----------------------------
-- Table structure for recete
-- ----------------------------
DROP TABLE IF EXISTS `recete`;
CREATE TABLE `recete`  (
  `recid` int(11) NOT NULL AUTO_INCREMENT,
  `rechtckn` int(11) NULL DEFAULT NULL,
  `rectid` int(11) NULL DEFAULT NULL,
  `reciid1` int(11) NULL DEFAULT NULL,
  `reciid2` int(11) NULL DEFAULT NULL,
  `reciid3` int(11) NULL DEFAULT NULL,
  `reciid4` int(11) NULL DEFAULT NULL,
  `rectarih` date NULL DEFAULT NULL,
  PRIMARY KEY (`recid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 9 CHARACTER SET = utf8 COLLATE = utf8_turkish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of recete
-- ----------------------------
INSERT INTO `recete` VALUES (1, 1, NULL, 1, NULL, NULL, NULL, '2018-01-19');
INSERT INTO `recete` VALUES (8, 1, NULL, 1, NULL, NULL, NULL, NULL);

-- ----------------------------
-- Table structure for roller
-- ----------------------------
DROP TABLE IF EXISTS `roller`;
CREATE TABLE `roller`  (
  `rid` int(11) NOT NULL AUTO_INCREMENT,
  `radi` enum('Admin','Doktor','Personel') CHARACTER SET utf8 COLLATE utf8_turkish_ci NULL DEFAULT NULL,
  PRIMARY KEY (`rid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_turkish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of roller
-- ----------------------------
INSERT INTO `roller` VALUES (1, 'Admin');
INSERT INTO `roller` VALUES (2, 'Doktor');
INSERT INTO `roller` VALUES (3, 'Personel');

-- ----------------------------
-- Table structure for rsaat
-- ----------------------------
DROP TABLE IF EXISTS `rsaat`;
CREATE TABLE `rsaat`  (
  `sid` int(11) NOT NULL AUTO_INCREMENT,
  `sadi` time(0) NULL DEFAULT NULL,
  PRIMARY KEY (`sid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 27 CHARACTER SET = utf8 COLLATE = utf8_turkish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of rsaat
-- ----------------------------
INSERT INTO `rsaat` VALUES (1, '09:00:00');
INSERT INTO `rsaat` VALUES (2, '09:15:00');
INSERT INTO `rsaat` VALUES (3, '09:30:00');
INSERT INTO `rsaat` VALUES (4, '09:45:00');
INSERT INTO `rsaat` VALUES (5, '10:00:00');
INSERT INTO `rsaat` VALUES (6, '10:15:00');
INSERT INTO `rsaat` VALUES (7, '10:30:00');
INSERT INTO `rsaat` VALUES (8, '10:45:00');
INSERT INTO `rsaat` VALUES (9, '11:00:00');
INSERT INTO `rsaat` VALUES (10, '11:15:00');
INSERT INTO `rsaat` VALUES (11, '11:30:00');
INSERT INTO `rsaat` VALUES (12, '11:45:00');
INSERT INTO `rsaat` VALUES (13, '13:30:00');
INSERT INTO `rsaat` VALUES (14, '13:45:00');
INSERT INTO `rsaat` VALUES (15, '14:00:00');
INSERT INTO `rsaat` VALUES (16, '14:15:00');
INSERT INTO `rsaat` VALUES (17, '14:30:00');
INSERT INTO `rsaat` VALUES (18, '14:45:00');
INSERT INTO `rsaat` VALUES (19, '15:00:00');
INSERT INTO `rsaat` VALUES (20, '15:15:00');
INSERT INTO `rsaat` VALUES (21, '15:30:00');
INSERT INTO `rsaat` VALUES (22, '15:45:00');
INSERT INTO `rsaat` VALUES (23, '16:00:00');
INSERT INTO `rsaat` VALUES (24, '16:15:00');
INSERT INTO `rsaat` VALUES (25, '16:30:00');
INSERT INTO `rsaat` VALUES (26, '16:45:00');

-- ----------------------------
-- Table structure for teshisler
-- ----------------------------
DROP TABLE IF EXISTS `teshisler`;
CREATE TABLE `teshisler`  (
  `tid` int(11) NOT NULL AUTO_INCREMENT,
  `tadi` varchar(255) CHARACTER SET utf8 COLLATE utf8_turkish_ci NULL DEFAULT NULL,
  PRIMARY KEY (`tid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8 COLLATE = utf8_turkish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of teshisler
-- ----------------------------
INSERT INTO `teshisler` VALUES (1, 'Grip');
INSERT INTO `teshisler` VALUES (2, 'Kızamık');
INSERT INTO `teshisler` VALUES (3, 'Soğuk Algınlığı');
INSERT INTO `teshisler` VALUES (4, 'r');
INSERT INTO `teshisler` VALUES (5, 't');
INSERT INTO `teshisler` VALUES (6, 'y');

-- ----------------------------
-- Table structure for vrlnrandevular
-- ----------------------------
DROP TABLE IF EXISTS `vrlnrandevular`;
CREATE TABLE `vrlnrandevular`  (
  `vraid` int(11) NOT NULL,
  `vhtckn` int(11) NULL DEFAULT NULL,
  `vduid` tinyint(4) NULL DEFAULT NULL,
  PRIMARY KEY (`vraid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_turkish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of vrlnrandevular
-- ----------------------------
INSERT INTO `vrlnrandevular` VALUES (1, 1, 3);
INSERT INTO `vrlnrandevular` VALUES (2, 1, 3);
INSERT INTO `vrlnrandevular` VALUES (3, 1, 4);
INSERT INTO `vrlnrandevular` VALUES (4, 2, 4);
INSERT INTO `vrlnrandevular` VALUES (5, 2, 3);
INSERT INTO `vrlnrandevular` VALUES (6, 2, 4);
INSERT INTO `vrlnrandevular` VALUES (7, 1, 4);

-- ----------------------------
-- Procedure structure for doktorAdArama
-- ----------------------------
DROP PROCEDURE IF EXISTS `doktorAdArama`;
delimiter ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `doktorAdArama`(IN `ara` VARCHAR(255))
BEGIN
	
	SELECT dadi, dsoyadi, kadi FROM doktorlar LEFT JOIN klinikler ON doktorlar.dkid = klinikler.kid 
	WHERE dadi LIKE CONCAT('%',ara,'%');

END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for doktorListele
-- ----------------------------
DROP PROCEDURE IF EXISTS `doktorListele`;
delimiter ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `doktorListele`()
BEGIN
	
	SELECT dadi, dsoyadi, kadi FROM doktorlar LEFT JOIN klinikler ON doktorlar.dkid = klinikler.kid ;

END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for doktorRandevuListele
-- ----------------------------
DROP PROCEDURE IF EXISTS `doktorRandevuListele`;
delimiter ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `doktorRandevuListele`(IN `did` int)
BEGIN
	SELECT ha.htckn, ha.hadi, ha.hsoyadi, ha.hdogumTarihi,ha.hcinsiyet, ra.ragun, sa.sadi, du.duadi
FROM randevular as ra INNER JOIN vrlnrandevular as ve ON ra.raid = ve.vraid  
INNER JOIN hastalar as ha ON ve.vhtckn = ha.htckn INNER JOIN rsaat as sa ON ra.rasid = sa.sid
INNER JOIN durumlar as du ON ve.vduid = du.duid WHERE ra.radid = did And ra.ragun = DATE(NOW()) ;

END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for hastaEkle
-- ----------------------------
DROP PROCEDURE IF EXISTS `hastaEkle`;
delimiter ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `hastaEkle`(IN `tckn` int,IN `adi` varchar(255),IN `soyadi` varchar(255),IN `babaAdi` varchar(255),IN `anneAdi` varchar(255),IN `dogumYeri` varchar(255),IN `dogumTarihi` date,IN `cinsiyet` varchar(255),IN `telefon` int,IN `mail` varchar(255),IN `durum` tinyint)
BEGIN
	
	INSERT INTO `hastane_otomasyon`.`hastalar`(`htckn`, `hadi`, `hsoyadi`, `hbabaAdi`, `hanneAdi`, `hdogumYeri`, `hdogumTarihi`, `hcinsiyet`, `htelefon`, `hmail`, `hduid`) VALUES (tckn, adi, soyadi, babaAdi, anneAdi, dogumYeri, dogumTarihi, cinsiyet, telefon, mail, durum );

END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for hastaRandevuEkle
-- ----------------------------
DROP PROCEDURE IF EXISTS `hastaRandevuEkle`;
delimiter ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `hastaRandevuEkle`(IN `raid` int,IN `tckn` int,IN `durum` int)
BEGIN
	
	INSERT INTO `hastane_otomasyon`.`vrlnrandevular`(`vraid`, `vhtckn`, `vduid`) VALUES (raid, tckn, durum);

END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for hastaRandevuGetir
-- ----------------------------
DROP PROCEDURE IF EXISTS `hastaRandevuGetir`;
delimiter ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `hastaRandevuGetir`(IN `htckn` int)
BEGIN
	
	SELECT * FROM vrlnrandevular WHERE vhtckn = htckn ;

END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for hastaSil
-- ----------------------------
DROP PROCEDURE IF EXISTS `hastaSil`;
delimiter ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `hastaSil`(IN `tckn` int)
BEGIN
	
	UPDATE `hastane_otomasyon`.`hastalar` SET `hduid` = 2 WHERE `htckn` = tckn;

END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for ilacArama
-- ----------------------------
DROP PROCEDURE IF EXISTS `ilacArama`;
delimiter ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `ilacArama`(IN `ara` VARCHAR(255) )
BEGIN
	
	SELECT * FROM ilaclar WHERE iadi LIKE CONCAT('%',ara,'%');

END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for ilacGetir
-- ----------------------------
DROP PROCEDURE IF EXISTS `ilacGetir`;
delimiter ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `ilacGetir`()
BEGIN
	
	SELECT*FROM ilaclar;

END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for klinikRandevuGetir
-- ----------------------------
DROP PROCEDURE IF EXISTS `klinikRandevuGetir`;
delimiter ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `klinikRandevuGetir`(IN `kid` int)
BEGIN
	
	SELECT * FROM randevular WHERE rakid = kid ;

END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for personelGiris
-- ----------------------------
DROP PROCEDURE IF EXISTS `personelGiris`;
delimiter ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `personelGiris`(IN `tckn` int)
BEGIN
	
	SELECT pdurum, prolid, psifre FROM personeller WHERE ptckn = tckn;

END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for randevuGunGetir
-- ----------------------------
DROP PROCEDURE IF EXISTS `randevuGunGetir`;
delimiter ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `randevuGunGetir`()
BEGIN

	SELECT * FROM randevular  WHERE ragun = DATE(NOW()) ;

END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for randevuSayiGetir
-- ----------------------------
DROP PROCEDURE IF EXISTS `randevuSayiGetir`;
delimiter ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `randevuSayiGetir`()
BEGIN
	
	SELECT COUNT(raid) as toplam, (SELECT COUNT(raid) FROM randevular WHERE rduid =7 ) as dolu, (SELECT COUNT(raid) FROM randevular WHERE rduid = 6) as bos  FROM randevular ;

END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for teshisArama
-- ----------------------------
DROP PROCEDURE IF EXISTS `teshisArama`;
delimiter ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `teshisArama`(IN `ara` varchar(255))
BEGIN
	SELECT * FROM teshisler WHERE tadi LIKE CONCAT('%',ara,'%');

END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for teshisGetir
-- ----------------------------
DROP PROCEDURE IF EXISTS `teshisGetir`;
delimiter ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `teshisGetir`()
BEGIN
	
	SELECT * FROM teshisler ;

END
;;
delimiter ;

-- ----------------------------
-- Triggers structure for table vrlnrandevular
-- ----------------------------
DROP TRIGGER IF EXISTS `randevu_ekleme`;
delimiter ;;
CREATE TRIGGER `randevu_ekleme` AFTER INSERT ON `vrlnrandevular` FOR EACH ROW BEGIN
	
	SET @raid = new.vraid;
	SET @durum = new.vduid;
	UPDATE `hastane_otomasyon`.`randevular` SET `rduid` = @durum WHERE `raid` = @raid;
	INSERT INTO `hastane_otomasyon`.`muayene`(`mvraid`,`msikayeti`, `mhikayesi`, `mozgecmisi`,`mrecid`) VALUES (@raid,null,null,null,null);
	

END
;;
delimiter ;

-- ----------------------------
-- Triggers structure for table vrlnrandevular
-- ----------------------------
DROP TRIGGER IF EXISTS `randevu_guncelleme`;
delimiter ;;
CREATE TRIGGER `randevu_guncelleme` AFTER UPDATE ON `vrlnrandevular` FOR EACH ROW BEGIN
	
	SET @raid = new.vraid;
	SET @durum = new.vduid;
	UPDATE `hastane_otomasyon`.`randevular` SET `rduid` = @durum WHERE `raid` = @raid;

END
;;
delimiter ;

SET FOREIGN_KEY_CHECKS = 1;
