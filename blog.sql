-- MySQL dump 10.13  Distrib 8.0.30, for Win64 (x86_64)
--
-- Host: localhost    Database: v4_blog
-- ------------------------------------------------------
-- Server version	8.0.30

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
-- Table structure for table `api_email`
--

DROP TABLE IF EXISTS `api_email`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `api_email` (
  `nid` int NOT NULL AUTO_INCREMENT,
  `email` varchar(254) NOT NULL,
  `content` longtext NOT NULL,
  `create_date` datetime(6) NOT NULL,
  PRIMARY KEY (`nid`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `api_email`
--

LOCK TABLES `api_email` WRITE;
/*!40000 ALTER TABLE `api_email` DISABLE KEYS */;
INSERT INTO `api_email` VALUES (1,'3128909688@qq.com','涓轰粈涔堥獋鎴?,'2023-08-30 15:00:06.034061');
/*!40000 ALTER TABLE `api_email` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `app01_advert`
--

DROP TABLE IF EXISTS `app01_advert`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `app01_advert` (
  `nid` int NOT NULL AUTO_INCREMENT,
  `title` varchar(32) DEFAULT NULL,
  `href` varchar(200) NOT NULL,
  `img` varchar(100) DEFAULT NULL,
  `img_list` longtext,
  `is_show` tinyint(1) NOT NULL,
  `author` varchar(32) DEFAULT NULL,
  `abstract` varchar(128) DEFAULT NULL,
  PRIMARY KEY (`nid`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `app01_advert`
--

LOCK TABLES `app01_advert` WRITE;
/*!40000 ALTER TABLE `app01_advert` DISABLE KEYS */;
INSERT INTO `app01_advert` VALUES (1,'鐗规湕鏅甆FT','https://twitter.com/home','advert/ad2.png','',1,'鐗规湕鏅?,'鐗规湕鏅帹骞跨殑NFT'),(2,'灏忔潕瀛怤FT','https://www.youtube.com/','advert/ad3_mG9T2Ih.png','http://i0.hdslb.com/bfs/archive/644be5057df9e76ea73a36adf1af5f59f90d1f9b.jpg@100w_100h_1c.png\r\nhttp://i1.hdslb.com/bfs/archive/1cd07a5d19dbba75b94836ef78082ba86631d619.jpg@100w_100h_1c.png',1,'鑾辨槀绾冲','鍗庡皵琛椾箣鐙间笓灞濶FT');
/*!40000 ALTER TABLE `app01_advert` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `app01_articles`
--

DROP TABLE IF EXISTS `app01_articles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `app01_articles` (
  `nid` int NOT NULL AUTO_INCREMENT,
  `title` varchar(32) DEFAULT NULL,
  `abstract` varchar(128) DEFAULT NULL,
  `content` longtext,
  `create_date` datetime(6) DEFAULT NULL,
  `change_date` datetime(6) DEFAULT NULL,
  `status` int NOT NULL,
  `recommend` tinyint(1) NOT NULL,
  `look_count` int NOT NULL,
  `comment_count` int NOT NULL,
  `digg_count` int NOT NULL,
  `collects_count` int NOT NULL,
  `category` int DEFAULT NULL,
  `pwd` varchar(32) DEFAULT NULL,
  `author` varchar(16) DEFAULT NULL,
  `source` varchar(32) DEFAULT NULL,
  `link` varchar(200) DEFAULT NULL,
  `word` int NOT NULL,
  `cover_id` int DEFAULT NULL,
  PRIMARY KEY (`nid`),
  KEY `app01_articles_cover_id_02b692b0_fk_app01_cover_nid` (`cover_id`),
  CONSTRAINT `app01_articles_cover_id_02b692b0_fk_app01_cover_nid` FOREIGN KEY (`cover_id`) REFERENCES `app01_cover` (`nid`)
) ENGINE=InnoDB AUTO_INCREMENT=48 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `app01_articles`
--

LOCK TABLES `app01_articles` WRITE;
/*!40000 ALTER TABLE `app01_articles` DISABLE KEYS */;
INSERT INTO `app01_articles` VALUES (1,'鏈哄櫒瀛︿範鐨勫疄璺?,'娴佺▼鎺у埗璇彞-switch\n浣跨敤switch涔熷彲浠ユ牴鎹垽鏂笉鍚岀殑鎯呭喌鍋氫笉鍚岀殑澶勭悊銆俓n鏍煎紡\n~~~~java switch (琛ㄨ揪寮? { case 鍊?: 璇彞浣?; break;','# 娴佺▼鎺у埗璇彞-switch\n\n浣跨敤switch涔熷彲浠ユ牴鎹垽鏂笉鍚岀殑鎯呭喌鍋氫笉鍚岀殑澶勭悊銆俓n\n## 鏍煎紡\n\n~~~~java\n		switch (琛ㄨ揪寮? {\n			case 鍊?:\n				璇彞浣?;\n				break;\n			case 鍊?:\n				璇彞浣?;\n				break;\n			case 鍊?:\n				璇彞浣?;\n				break;\n			...\n			default:\n				璇彞浣搉+1;\n				break; // 鏈€鍚庝竴涓猙reak璇彞鍙互鐪佺暐锛屼絾鏄帹鑽愪笉瑕佺渷鐣n		}\n\n~~~~\n\nswitch鍚庨潰灏忔嫭鍙峰綋涓彧鑳芥槸涓嬪垪鏁版嵁绫诲瀷锛歕n			**鍩烘湰鏁版嵁绫诲瀷锛歜yte/short/char/int**\n			**寮曠敤鏁版嵁绫诲瀷锛歋tring瀛楃涓层€乪num鏋氫妇**\n\n渚嬪锛歕n\n~~~~java\n    public static void main(String[] args) {\n        int num = 2;\n        switch (num){\n            case 1:\n                System.out.println(1);\n                break;\n            case 2:\n                System.out.println(2);\n                break;\n            case 3:\n                System.out.println(3);\n                break;\n            default:\n                System.out.println(\"default\");\n                break;\n        }\n    }\n~~~~\n\n## 鎵ц娴佺▼\n\n鈥?     浠庝笂鍒颁笅渚濇鐪嬭〃杈惧紡鐨勭粨鏋滃拰鍝釜case鍚庨潰鐨勫€肩浉鍚?鐩稿悓灏辨墽琛岄偅涓猚ase鍚庨潰鐨勮鍙ヤ綋,纰板埌break灏辩粨鏉焥witch.\n鈥?  濡傛灉娌℃湁绗﹀悎瑕佹眰鐨刢ase鍒欐墽琛宒efault鍚庨潰鐨勮鍙ヤ綋.\n\n## 娉ㄦ剰浜嬮」\n\n鈥?鈶爏witch鍙互娌℃湁default,浣嗘槸涓€鑸兘浼氬姞涓?绫讳技if鍙互娌℃湁else)\n鈥?鈶ase璇彞鍚庨潰鍙互涓嶅姞break.浣嗘槸濡傛灉涓嶅姞break灏卞彲鑳戒細鍑虹幇**case绌块€忛棶棰?*.鍖归厤鍝竴涓猚ase灏变粠鍝竴涓綅缃悜涓嬫墽琛岋紝鐩村埌閬囧埌浜哹reak鎴栬€呮暣涓猻witch缁撴潫涓烘;\n\n## 灏忔€濊€僜n\nswitch鍜宨f閮藉彲浠ュ仛澶氱鎯呭喌鐨勫垽鏂?閭ｄ粬浠箣闂存湁浠€涔堝尯鍒憿?浣犺寰楄皝鏇寸伒娲?\n\n> tips:鍙互浠庝粬浠皬鎷彿閲岃兘鍐欑殑琛ㄨ揪寮忕殑绫诲瀷鏂归潰鍘昏€冭檻\n> if鐨勫皬鎷彿涓槸甯冨皵琛ㄨ揪寮忥紝switch鏄痓yte,short...\n\n绛旀锛歕n\nif鐨勮〃杈惧紡鐨勫竷灏旇〃杈惧紡锛屽彲浠ヨ繘琛屾洿澶嶆潅鏉′欢鐨勫垽鏂?渚嬪锛氬€煎湪鏌愪釜鑼冨洿鍐咃紝澶氫釜鏉′欢鍚屾椂绗﹀悎绛?\n\n鑰宻witch鐨勮〃杈惧紡鐨勬暟鎹被鍨嬪彧鑳介€傚悎鍋氭湁闄愪釜鏁扮殑绛夊€煎垽鏂€傛墍浠ュ鏋滄槸鏈夐檺涓暟鐨勭瓑鍊煎垽鏂殑璇漵witch鏈夌殑鏃跺€欎細鏇存柟渚裤€傚叾浠栨儏鍐典笅if浼氭洿閫傚悎銆?\n\n**鑷繁鐨勮瘽:if鏇撮€傚悎鎶借薄鏉′欢鐨勬瘮杈?switch鏇撮€傚悎鍏蜂綋鍊肩殑鍒掑垎.(娉ㄦ剰switch鐨勯瀛楁瘝s鏄皬鍐?**','2023-07-29 13:45:44.389620','2023-08-10 02:23:25.407443',1,1,26,-16,19,2,2,NULL,'椋庡笇','灏忓彾鍗氬',NULL,1384,11),(2,'Linux鍜孶nix','鐩墠寰堝浼佷笟绾х殑椤圭洰閮戒細閮ㄧ讲鍒癓inux/Unix绯荤粺涓婏紝Linux鐨勪紒楣呭悏绁ョ墿鏄疞inux鍒涘浜虹殑鑰佸﹩璁惧畾鐨勶紝鍘熷洜鏄疞inus鍒版境澶у埄浜氬姩鐗╁洯鍘荤帺鐨勬椂鍊欒浼侀箙鍜簡涓€鍙ｃ€?,'# 9锛氭爣璇嗙\r\n\r\n鏍囪瘑绗﹀氨鏄垜浠湪鍐檍ava浠ｇ爜鐨勮繃绋嬩腑缁欏彉閲忥紝鏂规硶鍜岀被绛夊彇鐨勫悕瀛椼€俓r\n\r\n鎴戜滑鍙栧悕鐨勬椂鍊欓渶瑕侀伒寰竴瀹氱殑鍛藉悕瑙勫垯(纭€ц瀹?鍜屽懡鍚嶈鑼?绾﹀畾淇楁垚,涔熷氨鏄綔瑙勫垯)銆俓r\n\r\n## 鍛藉悕瑙勫垯(閾佸緥)\r\n\r\n- 鐢卞瓧姣嶃€佹暟瀛椼€佷笅鍒掔嚎鈥淿鈥濄€佺編鍏冪鍙封€?鈥濈粍鎴愩€俓r\n- 涓嶈兘浠ユ暟瀛楀紑澶碶r\n- 涓嶈兘浣跨敤java涓殑鍏抽敭瀛椼€?(杩欓噷鐨勫叧閿瓧鏄寚Java涓竴浜涘凡缁忔湁浜嗙壒娈婂惈涔夌殑璇嶄緥濡?void銆乫loat杩欎簺璇?\r\n\r\n## 鍛藉悕瑙勮寖(杞緥)\r\n\r\n* 灏忛┘宄板紡鍛藉悕锛氬彉閲忓悕銆佹柟娉曞悕\r\n\r\n鈥?	棣栧瓧姣嶅皬鍐欙紝浠庣浜屼釜鍗曡瘝寮€濮嬫瘡涓崟璇嶇殑棣栧瓧姣嶅ぇ鍐欍€?**渚嬪锛? nickname  setAge  getAge getArrayMax**\r\n\r\n* 澶ч┘宄板紡鍛藉悕锛氱被鍚峔r\n\r\n鈥?	姣忎釜鍗曡瘝鐨勯瀛楁瘝閮藉ぇ鍐欍€? **渚嬪锛欻elloWorld  FileUploadController**\r\n\r\n- 鏍囪瘑绗﹀懡鍚嶈瑙佸悕鐭ヤ箟,涓嶈閲囩敤鎷奸煶鍜岃嫳鏂囨贩鍚堢殑鏂瑰紡銆俓r\n\r\n# 9鐨勪綔涓歕r\n\r\n鍒ゆ柇涓嬪垪鍛藉悕鏄惁绗﹀悎鏍囪瘑绗︾殑鍛藉悕瑙勫垯\r\n\r\nhelloworld                                 绗﹀悎\r\n\r\nname                                          绗﹀悎\r\n\r\n_abc                                            绗﹀悎\r\n\r\n$sgct                                           绗﹀悎\r\n\r\n3gct                                             涓嶇鍚?涓嶈兘浠ユ暟瀛楀紑澶?,'2023-07-29 13:47:56.619841','2023-08-10 02:23:25.405444',1,1,45,-13,6,1,2,NULL,'闊╃珛','灏忓彾鍗氬',NULL,734,5),(41,'澶氱嚎绋嬭繖灏辨槸涓浗锛侊紒涓浗鑷俊锛侊紒涓浗浜猴紒','澶氱嚎绋嬬畝浠嬪浠诲姟锛氫竴杈瑰悆楗紝涓€杈圭帺鎵嬫満銆傜湅璧锋潵鏄涓换鍔?,'## 澶氱嚎绋嬬畝浠媆n\n### 澶氫换鍔★細\n\n> 涓€杈瑰悆楗紝涓€杈圭帺鎵嬫満銆傜湅璧锋潵鏄涓换鍔￠兘鍦ㄥ仛,浣嗘湰璐ㄤ笂鎴戜滑鐨勫ぇ鑴戝湪鍚屼竴鏃堕棿渚濇棫鍙仛浜嗕竴浠朵簨銆?澶ц剳鏄崟鏍哥殑,鐢变簬鍒囨崲鐨勫緢蹇?鎵€浠ュ氨鏈夊悓鏃舵墽琛岀殑閿欒)\n\n### 杩涚▼锛圥rocess锛夛細\n\n> 鎵ц绋嬪簭鐨勭殑涓€娆℃墽琛岃繃绋嬨€傚畠鏄竴涓姩鎬佺殑姒傚康銆傛槸绯荤粺璧勬簮鍒嗛厤鐨勫崟浣嶃€俓n> **涓€涓繘绋嬪彲浠ユ湁寰堝涓嚎绋?濡傝棰戜腑鍚屾椂鍚０闊?鐪嬪浘鍍?鐪嬪脊骞曪紝绛夌瓑.)锛屼竴涓繘绋嬭嚦灏戞湁涓€涓嚎绋?**\n\n### 绾跨▼锛圱hread锛夛細\n\n> 绾跨▼灏辨槸鐙珛鐨勬墽琛岃矾寰勩€傜嚎绋嬫槸CPU璋冨害鍜屾墽琛岀殑鍗曚綅銆俓n\n澶氳繘绋嬪苟琛?澶氱嚎绋嬪苟鍙?\n\n### 澶氱嚎绋嬶細\n\n鐪熸鐨勫绾跨▼鏄寚鏈夊涓狢PU,鍗冲鏍?濡傛湇鍔″櫒銆俓n\n骞惰鏄寚涓や釜鎴栬€呭涓簨浠跺湪鍚屼竴鏃跺埢鍙戠敓锛岃€屽苟鍙戞槸鎸囦袱涓垨澶氫釜浜嬩欢鍦ㄥ悓涓€鏃堕棿闂撮殧鍙戠敓銆俓n\n骞惰:鍚屾椂鎵ц澶氫釜浠诲姟\n\n> 澶氭潯鎵ц璺緞锛屼富绾跨▼鍜屽瓙绾跨▼骞惰浜ゆ浛鎵ц銆俓n\n### 鏍稿績姒傚康:\n\n-  绾跨▼灏辨槸鐙珛鐨勬墽琛岃矾寰?\n-  鍦ㄧ▼搴忚繍琛屾椂,鍗充娇娌℃湁鑷繁鍒涘缓绾跨▼,鍚庡彴涔熶細鏈夊涓嚎绋?濡備富绾跨▼,gc绾跨▼;\n-  main()绉颁箣涓轰富绾跨▼,涓虹郴缁熺殑鍏ュ彛,鐢ㄤ簬鎵ц鏁翠釜绋嬪簭;\n-  鍦ㄤ竴涓繘绋嬩腑,濡傛灉寮€杈熶簡澶氫釜绾跨▼,绾跨▼鐨勮繍琛岀敱璋冨害鍣?CPU)瀹夋帓璋冨害,璋冨害鍣ㄦ槸涓庢搷浣滅郴缁熺揣瀵嗙浉鍏崇殑,鍏堝悗椤哄簭鏄笉鑳戒汉涓虹殑骞查鐨?\n-  瀵瑰悓涓€浠借祫婧愭搷浣滄椂,浼氬瓨鍦ㄨ祫婧愭姠澶虹殑闂,闇€瑕佸姞鍏ュ苟鍙戞帶鍒?\n-  绾跨▼浼氬甫鏉ラ澶栫殑寮€閿€,濡侰PU璋冨害鏃堕棿,骞跺彂鎺у埗寮€閿€;\n-  姣忎釜绾跨▼鍦ㄨ嚜宸辩殑宸ヤ綔鍐呭瓨浜や簰,鍐呭瓨鎺у埗涓嶅綋浼氶€犳垚鏁版嵁涓嶄竴鑷淬€?,'2023-08-06 12:11:46.853741','2023-08-10 02:23:25.403228',1,1,17,0,0,3,2,NULL,'闊╃珛','灏忓彾鍗氬',NULL,693,10),(42,'Java娉ㄨВ','娉ㄨВ鍜屽弽灏勬槸鎵€鏈夋鏋剁殑搴曞眰\n娉ㄨВ(Annotation)鍏ラ棬','娉ㄨВ鍜屽弽灏勬槸鎵€鏈夋鏋剁殑搴曞眰\n\n## 娉ㄨВ(Annotation)鍏ラ棬\n\n1. Annotation鏄粠JDK5.0寮€濮嬪紩鍏ョ殑鏂版妧鏈€俓n2. Annotation浣滅敤\n   - 涓嶆槸绋嬪簭鏈韩锛屽彲浠ュ绋嬪簭浣滃嚭瑙ｉ噴(杩欎竴鐐瑰拰娉ㄩ噴(comment)娌′粈涔堝尯鍒?\n   - **鍙互琚叾浠栫▼搴忥紙姣斿缂栬瘧鍣ㄧ瓑锛夎鍙?鍔ㄦ€佹€?**\n   - Annotation鏍煎紡锛氭敞瑙ｄ互鈥淍娉ㄩ噴鍚嶁€濆湪浠ｇ爜涓瓨鍦紝杩樺彲浠ユ坊鍔犱竴浜涘弬鏁板€硷紝渚嬪鍐呯疆娉ㄨВ闀囧帇璀﹀憡@SupperssWarnings(value=鈥漸nchecked鈥?\n   - 娉ㄨВ杩樻湁鏍￠獙鍜岃瀹氱害鏉熺殑浣滅敤\n3. Annotation鍦ㄥ摢閲屼娇鐢?\n   - 鍙互闄勫姞鍦╬ackage銆乧lass銆乵ethod銆乫ield(瀛楁)绛変笂闈紝鐩稿綋浜庣粰浠栦滑娣诲姞浜嗛澶栫殑杈呭姪淇℃伅锛屾垜浠彲浠ラ€氳繃鍙嶅皠鏈哄埗缂栫▼瀹炵幇瀵硅繖浜涘厓鏁版嵁鐨勮闂甛n\n## 鍐呯疆娉ㄨВ\n\nJava閲屾渶甯歌鐨勪笁涓唴缃敞瑙?\n\n- @Override(閲嶅啓鐨勬敞瑙?:瀹氫箟鍦╦ava.lang.Override涓紝姝ゆ敞瑙ｅ彧閫傜敤浜庝慨楗版柟娉曪紝琛ㄧず涓€涓柟娉曞０鏄庢墦绠楅噸鍐欒秴绫讳腑鐨勫彟涓€涓柟娉曞０鏄庛€俓n\n- @Deprecated: 瀹氫箟鍦╦ava.lang.deprecated涓紝姝ゆ敞瑙ｅ彲浠ョ敤鏉ヤ慨楗版柟娉曘€佸睘鎬с€佺被锛岃〃绀?宸茶繃鏃剁殑)涓嶉紦鍔辩▼搴忓憳浣跨敤杩欐牱鐨勫厓绱狅紝閫氬父鏄洜涓哄畠寰堝嵄闄╂垨鑰呭瓨鍦ㄦ洿濂界殑閫夋嫨\n\n- @SuppressWarnings:瀹氫箟鍦╦ava.lang.suppressWarnings涓紝鐢ㄦ潵鎶戝埗缂栬瘧鏃剁殑璀﹀憡淇℃伅(榛勮壊淇℃伅).\n\n  涓庡墠涓や釜娉ㄨВ鏈夋墍涓嶅悓锛岄渶瑕佹坊鍔犱竴涓弬鏁版墠鑳芥纭娇鐢紝杩欎簺鍙傛暟閮芥槸宸茬粡瀹氫箟濂界殑锛屾垜浠€夋嫨浣跨敤灏卞ソ浜?   		   @SuppressWarnings(\"all\") //闀囧帇鍏ㄩ儴璀﹀憡  \n\n  @SuppressWarnings(\"unchecked\") //闀囧帇鏈鏌ョ殑璀﹀憡   \n\n  @SuppressWarnings(value={\"unchecked\", \"deprecation\"})\n\n  绛夌瓑......\n\n## 鍏冩敞瑙n\n1. 杩欎簺娉ㄨВ鐨勭被鍨嬪拰瀹冧滑鎵€鏀寔鐨勭被鍦╦ava.lang.annotation鍖呬腑鍙互鎵惧埌銆俓n2. 鍏冩敞瑙ｇ殑浣滅敤灏辨槸璐熻矗娉ㄨВ(瑙ｉ噴)鍏朵粬娉ㄨВ锛宩ava瀹氫箟浜?涓爣鍑嗙殑meta-annotation绫诲瀷锛屼粬浠鐢ㄦ潵鎻愪緵瀵瑰叾浠朅nnotation绫诲瀷浣滆鏄庯紙[@Target](https://github.com/Target) [@Retention](https://github.com/Retention) [@Documented](https://github.com/Documented) [@Inherited](https://github.com/Inherited)锛塡n3. 鍏冩敞瑙ｇ殑浣跨敤(Target鍜孯etention鏈€閲嶈)\n   - [@Target](https://github.com/Target)锛氱敤浜庢弿杩版敞瑙ｇ殑浣跨敤鑼冨洿锛堝嵆锛氳鎻忚堪鐨勬敞瑙ｅ彲浠ョ敤鍦ㄤ粈涔堝湴鏂癸級\n   - [@Retention](https://github.com/Retention): 琛ㄧず闇€瑕佸湪浠€涔堢骇鍒繚瀛樿娉ㄨВ淇℃伅锛岀敤浜庢弿杩版敞瑙ｇ殑鐢熷懡鍛ㄦ湡锛圫OURCE < CLASS < RUNTIME锛塡n   - [@Documented](https://github.com/Documented): 璇存槑璇ユ敞瑙ｅ皢琚寘鍚湪Javadoc涓?鏂囨。娉ㄩ噴.\n   - [@Inherited](https://github.com/Inherited): 璇存槑瀛愮被鍙互**缁ф壙**鐖剁被涓殑璇ユ敞瑙n\n[@Documented](https://github.com/Documented)//琛ㄧず鏄惁灏嗘垜浠殑娉ㄨВ鐢熸垚鍦↗avadoc涓璡n[@Inherited](https://github.com/Inherited)//琛ㄧず瀛愮被鍙互缁ф壙鐖剁被鐨勬敞瑙n[@Retention](https://github.com/Retention)(value = RetentionPolicy.RUNTIME)//琛ㄧず鎴戜滑鐨勬敞瑙ｅ湪浠€涔堝湴鏂硅繕鏈夋晥 runtime>class>sources\n[@Target](https://github.com/Target)(value = {ElementType.TYPE, ElementType.METHOD})//Target琛ㄧず鎴戜滑鐨勬敞瑙ｅ彲浠ョ敤鍦ㄥ摢浜涘湴鏂筡n\n## 鑷畾涔夋敞瑙n\n 浣跨敤@interface鑷畾涔夋敞瑙ｆ椂锛岃嚜鍔ㄧ户鎵夸簡java.lang.annotation.Annotation鎺ュ彛\n\n 鍒嗘瀽:\n\n-  @interface鐢ㄦ潵澹版槑涓€涓敞瑙ｏ紝鏍煎紡涓猴細public @interface 娉ㄨВ鍚?{瀹氫箟鍐呭}\n-  鍏朵腑鐨勬瘡涓€涓柟娉曞疄闄呬笂鏄０鏄庝簡涓€涓厤缃弬鏁帮紱\n-  鏂规硶鐨勫悕绉板氨鏄弬鏁板悕绉帮紱\n-  杩斿洖鍊肩被鍨嬪氨鏄弬鏁扮被鍨嬶紙杩斿洖鍊煎彧鑳芥槸鍩烘湰绫诲瀷锛孋lass銆丼tring銆乪num锛夈€俓n-  **鍙互閫氳繃default鏉ュ０鏄庡弬鏁扮殑榛樿绫诲瀷**\n-  **濡傛灉鍙湁涓€涓弬鏁版垚鍛橈紝涓€鑸弬鏁板悕涓簐alue**\n-  娉ㄨВ鍏冪礌蹇呴』瑕佹湁鍊硷紝鎴戜滑瀹氫箟娉ㄨВ鍏冪礌鏄紝缁忓父浣跨敤绌哄瓧绗︼紝0浣滀负榛樿鍊笺€俓n\n```java\n//鑷畾涔夋敞瑙npublic class Test03 {\n    //娉ㄨВ鏈夐粯璁ゅ€兼椂璋冪敤鏃跺彲浠ヤ笉璧嬪€?浣嗘槸浠嶅彲鏄惧紡璧嬪€?濡傛灉娌℃湁榛樿鍊?鎴戜滑灏卞繀椤荤粰娉ㄨВ璧嬪€糪n    @MyAnnotation2(age = 18)\n    public void test(){ }\n\n    @MyAnnotation3(\"鍖椾含澶у\")\n    public void test2(){ }\n}\n\n\n@Target({ElementType.TYPE,ElementType.METHOD})\n@Retention(RetentionPolicy.RUNTIME)\n@interface MyAnnotation2{\n    //鍛藉悕瑕佹眰\n    //娉ㄨВ鐨勫弬鏁?: 鍙傛暟绫诲瀷 + 鍙傛暟鍚?();\n    String name() default \"\";\n    int age() default 0;\n    int id() default -1;//濡傛灉榛樿鍊间负-1,浠ｈ〃涓嶅瓨鍦?\n\n    String[] schools() default {\"娓呭崕澶у\"};\n}\n\n@Target({ElementType.TYPE,ElementType.METHOD})\n@Retention(RetentionPolicy.RUNTIME)\n@interface MyAnnotation3{\n    String value();//濡傛灉鍙湁涓€涓€?寤鸿浣跨敤value鍛藉悕,鍙兘鏄痸alue鏃舵墠鍙互鍦ㄤ笂闈㈢渷鐣alue,鍏朵粬鐨勫懡鍚嶄笉鍙互.\n}\n\n```','2023-08-08 02:18:47.176198','2023-08-10 02:23:25.401208',1,1,5,0,0,1,2,NULL,'澶ц','灏忓彾鍗氬',NULL,2875,11),(43,'JavaSE璇█','鍔ㄦ€佽瑷€\n鎸囪繍琛屾椂鍙互鏀瑰彉鍏剁粨鏋勭殑璇█锛氫緥濡傛柊鐨勫嚱鏁般€佸璞°€佺敋鑷充唬鐮佸彲浠ヨ寮曡繘锛屽凡鏈夌殑鍑芥暟鍙互琚垹闄ゆ垨鏄叾浠栫粨鏋勪笂鐨勫彉鍖栥€傞€氫織鐐硅灏辨槸鍦ㄨ繍琛屾椂浠ｇ爜鍙互鏍规嵁鏌愪簺鏉′欢鏀瑰彉鑷韩缁撴瀯銆?渚?,'## 鍔ㄦ€佽瑷€\n\n1. 鎸囪繍琛屾椂鍙互鏀瑰彉鍏剁粨鏋勭殑璇█锛氫緥濡傛柊鐨勫嚱鏁般€佸璞°€佺敋鑷充唬鐮佸彲浠ヨ寮曡繘锛屽凡鏈夌殑鍑芥暟鍙互琚垹闄ゆ垨鏄叾浠栫粨鏋勪笂鐨勫彉鍖栥€傞€氫織鐐硅灏辨槸鍦ㄨ繍琛屾椂浠ｇ爜鍙互鏍规嵁鏌愪簺鏉′欢鏀瑰彉鑷韩缁撴瀯銆?渚嬪缃戦〉涓婄殑寮圭獥)\n2. Object-C 銆丆# 銆丣avaScript銆?php銆?python\n\n## 闈欐€佽瑷€\n\n1. 杩愯鏃剁粨鏋勪笉鍙彉鐨勮瑷€灏辨槸闈欐€佽瑷€銆俓n2. java銆丆銆?C++\n3. java涓嶆槸鍔ㄦ€佽瑷€锛屼絾java鍙互绉颁箣涓衡€滃噯鍔ㄦ€佽瑷€鈥濄€傚嵆java鏈変竴瀹氱殑鍔ㄦ€佹€?浣嗕篃鍚屾椂澧炲姞浜嗕笉瀹夊叏鎬?锛屾垜浠彲浠ュ埄鐢ㄥ弽灏勬満鍒惰幏寰楃被浼煎姩鎬佽瑷€鐨勭壒鎬с€俲ava鐨勫姩鎬佹€ц缂栫▼鐨勬椂鍊欐洿鍔犵伒娲?\n\n## 绫荤殑鍔犺浇\n\n褰撶▼搴忚浣跨敤鏌愪釜绫绘椂锛屽鏋滆绫昏繕鏈鍔犺浇鍒板唴瀛樹腑锛屽垯绯荤粺浼氶€氱煡鍔犺浇(Load)锛岄摼鎺?Link)锛屽垵濮嬪寲(Initialize)涓夋鏉ュ疄鐜板杩欎釜绫昏繘琛屽垵濮嬪寲銆俓n\n- 鍔犺浇锛氬皢class鏂囦欢瀛楄妭鐮佸唴瀹瑰姞杞藉埌鍐呭瓨涓紝骞跺皢杩欎簺闈欐€佹暟鎹浆鎹㈡垚鏂规硶鍖虹殑杩愯鏃舵暟鎹粨鏋勶紝鐒跺悗鐢熸垚涓€涓唬琛ㄨ繖涓被鐨刯ava.lang.class瀵硅薄銆俓n\n- 閾炬帴锛氬皢Java绫荤殑浜岃繘鍒朵唬鐮佸悎骞跺埌JVM鐨勮繍琛岀姸鎬佷箣涓殑杩囩▼銆俓n\n  楠岃瘉锛氱‘淇濆姞杞界殑绫讳俊鎭鍚圝VM瑙勮寖锛屾病鏈夊畨鍏ㄦ柟闈㈢殑闂銆俓n\n  鍑嗗锛氭寮忎负绫诲彉閲忥紙static锛夊垎閰嶅唴瀛樺苟璁剧疆鍙橀噺榛樿鍒濆鍊肩殑闃舵锛岃繖浜涘唴瀛橀兘灏嗗湪鏂规硶鍖轰腑杩涜鍒嗛厤銆俓n\n  瑙ｆ瀽锛氳櫄鎷熸満甯搁噺姹犲唴鐨勭鍙峰紩鐢紙甯搁噺鍚嶏級鏇挎崲涓虹洿鎺ュ紩鐢紙鍦板潃锛夌殑杩囩▼銆俓n\n- 鍒濆鍖栵細    \n\n  鎵ц绫绘瀯閫犲櫒<clinit>()鏂规硶鐨勮繃绋嬨€傜被鏋勯€犲櫒<clinit>()鏂规硶鏄湁缂栬瘧鏈熻嚜鍔ㄦ敹闆嗙被涓墍鏈夌被鍙橀噺鐨勮祴鍊煎姩浣滃拰闈欐€佷唬鐮佸潡涓殑        璇彞鍚堝苟浜х敓鐨勩€傦紙绫绘瀯閫犲櫒鏄瀯閫犵被淇℃伅鐨勶紝涓嶆槸鏋勯€犺绫诲璞＄殑鏋勯€犲櫒锛?   \n\n  褰撳垵濮嬪寲涓€涓被鐨勬椂鍊欙紝濡傛灉鍙戠幇鍏剁埗绫昏繕娌℃湁杩涜鍒濆鍖栵紝鍒欓渶瑕佸厛瑙﹀彂鍏剁埗绫荤殑鍒濆鍖栥€?   \n\n  铏氭嫙鏈轰細淇濊瘉涓€涓被鐨?clinit>()鏂规硶鍦ㄥ绾跨▼鐜涓姝ｇ‘鍔犻攣鍜屽悓姝ャ€俓n\n  ```java\n  public class Test05 {\n      public static void main(String[] args) {\n          A a = new A();\n          System.out.println(A.m);\n  \n          /*\n          1.鍔犺浇鍒板唴瀛?浼氫骇鐢熶竴涓被瀵瑰簲鐨凜lass瀵硅薄\n          2.閾炬帴,閾炬帴缁撴潫鍚巑 = 0\n          3.鍒濆鍖朶n                <clinit>(){\n                      System.out.println(\"A绫婚潤鎬佷唬鐮佸潡鍒濆鍖朶");\n                          m = 300;\n                          m = 100;\n                }\n                \n                m = 100\n           */\n  \n      }\n  }\n  \n  class A{\n      static {\n          System.out.println(\"A绫婚潤鎬佷唬鐮佸潡鍒濆鍖朶");\n          m = 300;\n      }\n  \n      /*\n      m = 300\n      m = 100\n       */\n  \n  \n      static int m = 100;\n  \n      public A() {\n          System.out.println(\"A绫荤殑鏃犲弬鏋勯€犲垵濮嬪寲\");\n      }\n  }\n  ```','2023-08-08 02:19:59.574026','2023-08-10 02:23:25.398671',1,1,4,0,0,1,2,NULL,'寮犻搧','灏忓彾鍗氬',NULL,1589,2),(44,'Java绫诲垵濮嬪寲鐨勬椂鏈?,'绫荤殑涓诲姩寮曠敤(涓€瀹氫細鍙戠敓绫荤殑鍒濆鍖?\n褰撹櫄鎷熸満鍚姩锛屽厛鍒濆鍖杕ain鏂规硶鎵€鍦ㄧ殑绫伙紱\nnew涓€涓被瀵硅薄;\n璋冪敤绫荤殑闈欐€佹垚鍛橈紙闄や簡final甯搁噺锛夊拰闈欐€佹柟娉曪紱\n浣跨敤java.lang.','### 绫荤殑涓诲姩寮曠敤(涓€瀹氫細鍙戠敓绫荤殑鍒濆鍖?\n\n- 褰撹櫄鎷熸満鍚姩锛屽厛鍒濆鍖杕ain鏂规硶鎵€鍦ㄧ殑绫伙紱\n- new涓€涓被瀵硅薄;\n- 璋冪敤绫荤殑闈欐€佹垚鍛橈紙闄や簡final甯搁噺锛夊拰闈欐€佹柟娉曪紱\n- 浣跨敤java.lang.reflect鍖呯殑鏂规硶瀵圭被杩涜鍙嶅皠璋冪敤锛沑n- 褰撳垵濮嬪寲涓€涓被锛屽鏋滃叾鐖剁被娌℃湁琚垵濮嬪寲锛屽垯鍏堜細鍒濆鍖栧畠鐨勭埗绫汇€?绫荤殑涓€涓墽琛岃繃绋?\n\n### 绫荤殑琚姩寮曠敤(涓€瀹氫笉浼氬彂鐢熺被鐨勫垵濮嬪寲)\n\n- 褰撹闂竴涓潤鎬佸煙鏃讹紝鍙湁鐪熸澹版槑杩欎釜鍩熺殑绫绘墠浼氳鍒濆鍖栥€傚锛氬綋閫氳繃瀛愮被璁块棶浠庣埗绫荤户鎵胯繃鏉ョ殑闈欐€佸彉閲忔垨鑰呴潤鎬佹柟寮忔椂鍊欙紝涓嶄細瀵艰嚧瀛愮被鍒濆鍖栵紝浼氳繘琛岀埗绫诲垵濮嬪寲銆俓n\n- 閫氳繃鏁扮粍瀹氫箟绫诲紩鐢紝涓嶄細瑙﹀彂姝ょ被鐨勫垵濮嬪寲銆俓n\n- 寮曠敤甯搁噺涓嶄細瑙﹀彂姝ょ被鐨勫垵濮嬪寲锛堝父閲忓湪閾炬帴闃舵灏卞瓨鍏ヨ皟鐢ㄧ被鐨勫父閲忔睜涓級\n\n  ```java\n  //娴嬭瘯绫讳粈涔堟椂鍊欎細鍒濆鍖朶n  public class Test06 {\n      static {\n          System.out.println(\"Main绫昏鍔犺浇\");\n      }\n  \n      public static void main(String[] args) throws ClassNotFoundException {\n          //1.涓诲姩寮曠敤\n          //Son son = new Son();\n  \n          //鍙嶅皠涔熶細浜х敓涓诲姩寮曠敤\n          //Class c1 = Class.forName(\"com.ye.reflection.Son\");\n  \n          //涓嶄細浜х敓绫荤殑寮曠敤鐨勬柟娉昞n  //        System.out.println(Son.b);\n  \n  //        Son[] array = new Son[5];\n  \n          System.out.println(Son.M);\n      }\n  }\n  \n  class Father{\n  \n      static int b = 2;\n  \n      static {\n          System.out.println(\"鐖剁被琚姞杞絓");\n      }\n  }\n  \n  class Son extends Father{\n  \n      static {\n          System.out.println(\"瀛愮被琚姞杞絓");\n          m = 300;\n      }\n  \n      static int m = 100;\n      static final int M = 1;\n  }\n  ```\n\n### 绫诲姞杞藉櫒\n\n绫诲姞杞藉櫒鐨勪綔鐢細灏哻lass鏂囦欢瀛楄妭鐮佸唴瀹瑰姞杞藉埌鍐呭瓨涓紝骞跺皢杩欎簺闈欐€佹暟鎹浆鎹㈡垚鏂规硶鍖轰腑鐨勮繍琛屾椂鏁版嵁缁撴瀯锛岀劧鍚庡湪鍫嗕腑鐢熸垚涓€涓唬琛ㄨ繖涓被鐨刯ava.lang.class瀵硅薄锛屼綔涓烘柟娉曞尯涓被鏁版嵁鐨勮闂叆鍙ｃ€?鎶婄被:Class瑁呰浇杩涘唴瀛?)\n\n绫荤紦瀛橈細鏍囧噯鐨刯avaSE绫诲姞杞藉櫒鍙互鎸夎姹傛煡鎵剧被锛屼絾涓€鏃︽煇涓被琚姞杞藉埌绫诲姞杞藉櫒涓紝瀹冨皢缁存寔鍔犺浇锛堢紦瀛橈級涓€娈垫椂闂淬€備笉杩嘕VM鍨冨溇鍥炴敹鏈哄埗鍙互鏀跺洖杩欎簺class瀵硅薄\n\n鈥?绫诲姞杞藉櫒鐨勭粍鎴愶細    \n\n- 鏍圭被鍔犺浇鍣?Bootstrap ClassLoader) ,涔熻绉颁负寮曞绫诲姞杞藉櫒,璐熻矗java鏍稿績绫荤殑鍔犺浇,鍦↗DK涓璊RE鐨刲ib鐩綍涓媟t.jar鏂囦欢涓€?rt鏍稿績绫诲簱鏄敱C++缂栧啓鐨?    \n\n- 鎵╁睍绫诲姞杞藉櫒(Extension ClassLoader),璐熻矗JRE鐨勬墿灞曠洰褰曚腑jar鍖呯殑鍔犺浇,鍦↗DK涓璊RE鐨刲ib鐩綍涓媏xt鐩綍銆?  \n\n- 绯荤粺绫诲姞杞藉櫒(System ClassLoader),璐熻矗鍦↗VM鍚姩鏃跺姞杞芥潵鑷猨ava鍛戒护鐨刢lass鏂囦欢(鑷繁鍐欑殑绫?,浠ュ強classpath鐜鍙橀噺鎵€鎸囧畾鐨刯ar鍖呭拰绫昏矾寰勩€俓n\n  ```java\n  public class Test07 {\n      public static void main(String[] args) throws ClassNotFoundException {\n  \n          //鑾峰彇绯荤粺绫荤殑鍔犺浇鍣╘n          ClassLoader systemClassLoader = ClassLoader.getSystemClassLoader();\n          System.out.println(systemClassLoader);\n  \n          //鑾峰彇绯荤粺绫诲姞杞藉櫒鐨勭埗绫诲姞杞藉櫒->鎵╁睍绫诲姞杞藉櫒\n          ClassLoader parent = systemClassLoader.getParent();\n          System.out.println(parent);\n  \n          //鑾峰彇鎵╁睍绫诲姞杞藉櫒鐨勭埗绫诲姞杞藉櫒->鏍瑰姞杞藉櫒(C/C++)\n          ClassLoader parent1 = parent.getParent();\n          System.out.println(parent1);\n  \n          //娴嬭瘯褰撳墠绫绘槸鍝釜鍔犺浇鍣ㄥ姞杞界殑\n          ClassLoader classLoader = Class.forName(\"com.ye.reflection.Test07\").getClassLoader();\n          System.out.println(classLoader);\n  \n          //娴嬭瘯JDK鍐呯疆鐨勭被鏄皝鍔犺浇鐨刓n          classLoader = Class.forName(\"java.lang.Object\").getClassLoader();\n          System.out.println(classLoader);\n  \n          //濡備綍鑾峰緱绯荤粺绫诲姞杞藉櫒鍙互鍔犺浇鐨勮矾寰刓n          System.out.println(System.getProperty(\"java.class.path\"));\n  \n          //鍙屼翰濮旀淳鏈哄埗\n          //java.lang.string-->寰€涓婃帹\n      }\n  }\n  ```','2023-08-08 02:20:58.917548','2023-08-10 02:23:25.396635',1,1,9,1,0,1,2,NULL,'鑻︾','灏忓彾鍗氬',NULL,2663,9),(45,'shiy','涓婚〉鏂囩珷鍒嗙被鏄剧ず浼樺寲\n灏辨槸鍦ㄥ崥瀹㈡枃绔犵殑鍙充笂瑙掑鍔犱笂鍒嗙被鍥炬銆?鐢ㄤ竴绉嶆瘮杈冪編瑙傜殑鏂瑰紡灞曠ず鏂囩珷鐨勫垎绫汇€?,'# 涓婚〉鏂囩珷鍒嗙被鏄剧ず浼樺寲\n灏辨槸鍦ㄥ崥瀹㈡枃绔犵殑鍙充笂瑙掑鍔犱笂鍒嗙被鍥炬銆俓n鐢ㄤ竴绉嶆瘮杈冪編瑙傜殑鏂瑰紡灞曠ず鏂囩珷鐨勫垎绫汇€俓n![](https://yt3.ggpht.com/FgkAIKvIU0YKz8rDiMQ7fnnggHEmBwWZ06cW42IajnuYbtcHbSK30Ai7vpS-UTZa6GbBS1Is=s68-c-k-c0x00ffffff-no-rj)','2023-08-16 02:49:38.756900','2023-08-16 02:49:38.756900',1,1,21,2,3,3,3,'','gaf','rfdawghiuy',NULL,0,6),(46,'fsd','鍓嶇\n灏濊瘯','# 鍓嶇\n灏濊瘯','2023-08-16 02:54:09.205311','2023-08-16 02:54:09.205311',1,1,69,1,0,1,1,'1234','fdaws','dfas',NULL,0,6),(47,'灏忓彾鍗氬','灏忓彾鍗氬鐨勭畝浠嬶紝杩樻病鍐欏ソ锛屽媺寮虹湅涓€涓嬪晩','鎴戝彨椋樺皬鍙躲€俓n杩欐槸鎴戠殑灏忓彾鍗氬銆?,'2023-08-24 08:27:56.249277','2023-08-24 08:27:56.249277',1,1,49,5,0,0,NULL,NULL,'椋樺皬鍙?,'灏忓彾鍗氬',NULL,0,2);
/*!40000 ALTER TABLE `app01_articles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `app01_articles_tag`
--

DROP TABLE IF EXISTS `app01_articles_tag`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `app01_articles_tag` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `articles_id` int NOT NULL,
  `tags_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `app01_articles_tag_articles_id_tags_id_f201463d_uniq` (`articles_id`,`tags_id`),
  KEY `app01_articles_tag_tags_id_e0760570_fk_app01_tags_nid` (`tags_id`),
  CONSTRAINT `app01_articles_tag_articles_id_c377df22_fk_app01_articles_nid` FOREIGN KEY (`articles_id`) REFERENCES `app01_articles` (`nid`),
  CONSTRAINT `app01_articles_tag_tags_id_e0760570_fk_app01_tags_nid` FOREIGN KEY (`tags_id`) REFERENCES `app01_tags` (`nid`)
) ENGINE=InnoDB AUTO_INCREMENT=122 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `app01_articles_tag`
--

LOCK TABLES `app01_articles_tag` WRITE;
/*!40000 ALTER TABLE `app01_articles_tag` DISABLE KEYS */;
INSERT INTO `app01_articles_tag` VALUES (101,1,1),(2,2,4),(109,41,1),(110,41,2),(111,41,3),(108,41,5),(98,42,5),(104,43,5),(102,44,5),(120,45,1),(121,45,2),(119,46,3);
/*!40000 ALTER TABLE `app01_articles_tag` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `app01_avatars`
--

DROP TABLE IF EXISTS `app01_avatars`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `app01_avatars` (
  `nid` int NOT NULL AUTO_INCREMENT,
  `url` varchar(100) NOT NULL,
  PRIMARY KEY (`nid`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `app01_avatars`
--

LOCK TABLES `app01_avatars` WRITE;
/*!40000 ALTER TABLE `app01_avatars` DISABLE KEYS */;
INSERT INTO `app01_avatars` VALUES (1,'avatars/head_08.png'),(2,'avatars/head_05.png'),(3,'avatars/head_03.png'),(4,'avatars/head_02.png'),(5,'avatars/head_09.png'),(6,'avatars/head_16.png'),(7,'avatars/head_19.png'),(8,'avatars/head_18.png'),(9,'avatars/head_17.png'),(10,'avatars/head_15.png'),(11,'avatars/head_14.png'),(12,'avatars/head_13.png'),(13,'avatars/head_12.png'),(14,'avatars/head_11.png'),(15,'avatars/head_10.png'),(16,'avatars/head_07.png'),(17,'avatars/head_01.png'),(18,'avatars/head_04.png'),(19,'avatars/head_06.png'),(20,'avatars/head_20.png'),(21,'avatars/head_21.png');
/*!40000 ALTER TABLE `app01_avatars` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `app01_comment`
--

DROP TABLE IF EXISTS `app01_comment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `app01_comment` (
  `nid` int NOT NULL AUTO_INCREMENT,
  `digg_count` int NOT NULL,
  `content` longtext NOT NULL,
  `comment_count` int NOT NULL,
  `drawing` longtext,
  `create_time` datetime(6) NOT NULL,
  `article_id` int NOT NULL,
  `parent_comment_id` int DEFAULT NULL,
  `user_id` int DEFAULT NULL,
  PRIMARY KEY (`nid`),
  KEY `app01_comment_article_id_2bf4f73b_fk_app01_articles_nid` (`article_id`),
  KEY `app01_comment_parent_comment_id_6a8024a5_fk_app01_comment_nid` (`parent_comment_id`),
  KEY `app01_comment_user_id_7f913f03_fk_app01_userinfo_nid` (`user_id`),
  CONSTRAINT `app01_comment_article_id_2bf4f73b_fk_app01_articles_nid` FOREIGN KEY (`article_id`) REFERENCES `app01_articles` (`nid`),
  CONSTRAINT `app01_comment_parent_comment_id_6a8024a5_fk_app01_comment_nid` FOREIGN KEY (`parent_comment_id`) REFERENCES `app01_comment` (`nid`),
  CONSTRAINT `app01_comment_user_id_7f913f03_fk_app01_userinfo_nid` FOREIGN KEY (`user_id`) REFERENCES `app01_userinfo` (`nid`)
) ENGINE=InnoDB AUTO_INCREMENT=81 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `app01_comment`
--

LOCK TABLES `app01_comment` WRITE;
/*!40000 ALTER TABLE `app01_comment` DISABLE KEYS */;
INSERT INTO `app01_comment` VALUES (57,2,'鍋滅數涔?,1,NULL,'2023-08-04 07:02:49.138326',1,NULL,1),(66,28,'椋?,1,NULL,'2023-08-04 08:53:45.455749',2,NULL,6),(67,2,'laile',0,NULL,'2023-08-04 11:06:11.466837',2,66,6),(70,0,'鍙互',0,NULL,'2023-08-23 14:41:02.475891',46,NULL,1),(71,0,'鍋滅暀',0,NULL,'2023-08-24 05:34:02.472809',45,NULL,1),(72,0,'璇曚竴涓?,0,NULL,'2023-08-24 07:21:20.556865',45,NULL,1),(73,0,'浣犲ソ鍟?,0,NULL,'2023-08-24 07:25:47.676594',44,NULL,1),(76,0,'## 灏忓彾鍗氬绗竴寮?,0,NULL,'2023-08-28 06:52:12.485116',47,NULL,1),(77,0,'### 娴嬭瘯璇勮\n\n```python\n\nprint(\"Hello World\")\n\n```',1,NULL,'2023-08-28 06:57:30.995519',47,NULL,1),(78,0,'### 瀛愯瘎璁?,0,NULL,'2023-08-28 06:57:55.269453',47,77,1),(79,0,'灏濊瘯',0,NULL,'2023-08-28 08:34:19.713670',47,NULL,1),(80,0,'![emoji](https://face.t.sinajs.cn/t4/appstyle/expression/ext/normal/6e/2018new_guzhang_thumb.png)',0,NULL,'2023-08-28 08:34:39.890749',47,NULL,1);
/*!40000 ALTER TABLE `app01_comment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `app01_cover`
--

DROP TABLE IF EXISTS `app01_cover`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `app01_cover` (
  `nid` int NOT NULL AUTO_INCREMENT,
  `url` varchar(100) NOT NULL,
  `dominant_hue` varchar(16) DEFAULT NULL,
  `is_dark` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`nid`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `app01_cover`
--

LOCK TABLES `app01_cover` WRITE;
/*!40000 ALTER TABLE `app01_cover` DISABLE KEYS */;
INSERT INTO `app01_cover` VALUES (1,'article_img/article_01.png',NULL,NULL),(2,'article_img/article_02.png',NULL,NULL),(5,'article_img/article_05.png',NULL,NULL),(6,'article_img/article_06.png',NULL,NULL),(9,'article_img/article_09.png',NULL,NULL),(10,'article_img/article_10.png',NULL,NULL),(11,'article_img/article_11.png',NULL,NULL),(12,'article_img/article_12.png',NULL,NULL);
/*!40000 ALTER TABLE `app01_cover` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `app01_feedback`
--

DROP TABLE IF EXISTS `app01_feedback`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `app01_feedback` (
  `nid` int NOT NULL AUTO_INCREMENT,
  `email` varchar(254) NOT NULL,
  `content` longtext NOT NULL,
  `status` tinyint(1) NOT NULL,
  `processing_content` longtext,
  PRIMARY KEY (`nid`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `app01_feedback`
--

LOCK TABLES `app01_feedback` WRITE;
/*!40000 ALTER TABLE `app01_feedback` DISABLE KEYS */;
INSERT INTO `app01_feedback` VALUES (1,'3128909688@qq.com','绁栧浗浜鸿触绫?,0,NULL),(2,'3128909688@qq.com','绁栧浗浜虹殑璐ョ被锛侊紒锛?,1,'涓轰粈涔堥獋鎴?),(3,'zjl18838139339@126.com','鎴戞兂鍚冭嫻鏋滀簡',1,'6灏忔椂鍚庡悆');
/*!40000 ALTER TABLE `app01_feedback` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `app01_history`
--

DROP TABLE IF EXISTS `app01_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `app01_history` (
  `nid` int NOT NULL AUTO_INCREMENT,
  `title` varchar(32) NOT NULL,
  `content` longtext NOT NULL,
  `create_date` date DEFAULT NULL,
  `drawing` longtext,
  PRIMARY KEY (`nid`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `app01_history`
--

LOCK TABLES `app01_history` WRITE;
/*!40000 ALTER TABLE `app01_history` DISABLE KEYS */;
INSERT INTO `app01_history` VALUES (2,'婊氬姩鏉℃牱寮忕編鍖?,'浣跨敤elementUI缇庡寲婊氬姩鏉nonscroll鍔犺浇闂澶勭悊','2023-08-18','http://rzmhapg08.hn-bkt.clouddn.com/blog/1692449715.png'),(4,'澶勭悊Django涓婁紶鍥剧墖澶у皬闄愬埗','鍦╯ettings.py涓慨鏀归粯璁ゅ€?,'2023-08-19','http://rzmhapg08.hn-bkt.clouddn.com/blog/1692450008.png\nhttp://rzmhapg08.hn-bkt.clouddn.com/blog/1692450022.png'),(5,'鏂板涓冪墰浜戝浘鐗囦笂浼?,'瀹炵幇涓冪墰浜戠殑鍥剧墖涓婁紶\n鍥剧墖棰勮','2023-08-19','http://rzmhapg08.hn-bkt.clouddn.com/blog/1692444810.png'),(7,'鍔犺浇鍥?,'鍥剧墖浜嬩欢','2023-08-20','');
/*!40000 ALTER TABLE `app01_history` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `app01_menu`
--

DROP TABLE IF EXISTS `app01_menu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `app01_menu` (
  `nid` int NOT NULL AUTO_INCREMENT,
  `menu_title` varchar(16) DEFAULT NULL,
  `menu_title_en` varchar(32) DEFAULT NULL,
  `title` varchar(32) DEFAULT NULL,
  `abstract` longtext,
  `abstract_time` int NOT NULL,
  `rotation` tinyint(1) NOT NULL,
  `menu_rotation` tinyint(1) NOT NULL,
  `menu_time` int NOT NULL,
  PRIMARY KEY (`nid`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `app01_menu`
--

LOCK TABLES `app01_menu` WRITE;
/*!40000 ALTER TABLE `app01_menu` DISABLE KEYS */;
INSERT INTO `app01_menu` VALUES (1,'棣栭〉','index','灏忓彾鍗氬','鍏充簬灏忓彾鍗氬 鏇村揩鏇村己鏇村叏闈紒\r\n鍏ㄦ柊鍥涗唬鍗氬 鍥剧伒瀹屽锛?,8,1,1,4),(2,'鏂伴椈','news','浠婃棩鐑悳','涓嶅嚭闂ㄥ敖鐭ュぉ涓嬩簨涔?,8,1,1,8),(3,'蹇冩儏','moods','鍙戝竷浣犵殑蹇冩儏','涓嶉渶瑕佺櫥褰曞氨鍙互鍙戦€佸摝~;璧剁揣鏉ュ彂涓€绡囧惂~',8,1,0,8),(4,'鍥炲繂褰?,'history','寤虹珯鍥炲繂褰?,'寤虹珯鍘嗙▼,涓庤浣嶅叡鍕?,8,0,1,8),(5,'鍏充簬','about','缃戠珯鍏充簬','杩欓噷鏄皬鍙跺崥瀹㈢殑閬撳満',8,0,1,8);
/*!40000 ALTER TABLE `app01_menu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `app01_menu_menu_url`
--

DROP TABLE IF EXISTS `app01_menu_menu_url`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `app01_menu_menu_url` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `menu_id` int NOT NULL,
  `menuimg_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `app01_menu_menu_url_menu_id_menuimg_id_9b80b024_uniq` (`menu_id`,`menuimg_id`),
  KEY `app01_menu_menu_url_menuimg_id_c89e39bd_fk_app01_menuimg_nid` (`menuimg_id`),
  CONSTRAINT `app01_menu_menu_url_menu_id_fe74c303_fk_app01_menu_nid` FOREIGN KEY (`menu_id`) REFERENCES `app01_menu` (`nid`),
  CONSTRAINT `app01_menu_menu_url_menuimg_id_c89e39bd_fk_app01_menuimg_nid` FOREIGN KEY (`menuimg_id`) REFERENCES `app01_menuimg` (`nid`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `app01_menu_menu_url`
--

LOCK TABLES `app01_menu_menu_url` WRITE;
/*!40000 ALTER TABLE `app01_menu_menu_url` DISABLE KEYS */;
INSERT INTO `app01_menu_menu_url` VALUES (2,1,2),(15,1,4),(20,1,7),(4,2,4),(6,2,6),(21,2,7),(9,3,7),(7,3,8),(8,3,9),(10,4,2),(19,4,6),(18,5,6),(17,5,10);
/*!40000 ALTER TABLE `app01_menu_menu_url` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `app01_menuimg`
--

DROP TABLE IF EXISTS `app01_menuimg`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `app01_menuimg` (
  `nid` int NOT NULL AUTO_INCREMENT,
  `url` varchar(100) NOT NULL,
  `dominant_hue` varchar(16) DEFAULT NULL,
  `is_dark` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`nid`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `app01_menuimg`
--

LOCK TABLES `app01_menuimg` WRITE;
/*!40000 ALTER TABLE `app01_menuimg` DISABLE KEYS */;
INSERT INTO `app01_menuimg` VALUES (1,'site_bg/article_01.png',NULL,NULL),(2,'site_bg/article_02.png',NULL,NULL),(3,'site_bg/article_03.png',NULL,NULL),(4,'site_bg/article_04.png',NULL,NULL),(5,'site_bg/article_05.png',NULL,NULL),(6,'site_bg/article_06.png',NULL,NULL),(7,'site_bg/article_07.png',NULL,NULL),(8,'site_bg/article_08.png',NULL,NULL),(9,'site_bg/article_09.png',NULL,NULL),(10,'site_bg/article_10.png',NULL,NULL);
/*!40000 ALTER TABLE `app01_menuimg` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `app01_moodcomment`
--

DROP TABLE IF EXISTS `app01_moodcomment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `app01_moodcomment` (
  `nid` int NOT NULL AUTO_INCREMENT,
  `name` varchar(16) DEFAULT NULL,
  `content` longtext NOT NULL,
  `digg_count` int NOT NULL,
  `ip` char(39) NOT NULL,
  `addr` longtext,
  `create_date` datetime(6) NOT NULL,
  `avatar_id` int DEFAULT NULL,
  `mood_id` int DEFAULT NULL,
  PRIMARY KEY (`nid`),
  KEY `app01_moodcomment_avatar_id_20ee4ce3_fk_app01_avatars_nid` (`avatar_id`),
  KEY `app01_moodcomment_mood_id_f0b5317e_fk_app01_moods_nid` (`mood_id`),
  CONSTRAINT `app01_moodcomment_avatar_id_20ee4ce3_fk_app01_avatars_nid` FOREIGN KEY (`avatar_id`) REFERENCES `app01_avatars` (`nid`),
  CONSTRAINT `app01_moodcomment_mood_id_f0b5317e_fk_app01_moods_nid` FOREIGN KEY (`mood_id`) REFERENCES `app01_moods` (`nid`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `app01_moodcomment`
--

LOCK TABLES `app01_moodcomment` WRITE;
/*!40000 ALTER TABLE `app01_moodcomment` DISABLE KEYS */;
INSERT INTO `app01_moodcomment` VALUES (10,'澹叺76','鐜板湪鏄€冨叺',11,'127.0.0.1','涓浗鍐呯綉','2023-08-14 06:57:40.934021',16,1);
/*!40000 ALTER TABLE `app01_moodcomment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `app01_moods`
--

DROP TABLE IF EXISTS `app01_moods`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `app01_moods` (
  `nid` int NOT NULL AUTO_INCREMENT,
  `name` varchar(16) NOT NULL,
  `ip` char(39) NOT NULL,
  `addr` longtext,
  `create_date` datetime(6) NOT NULL,
  `content` longtext NOT NULL,
  `drawing` longtext,
  `comment_count` int NOT NULL,
  `digg_count` int NOT NULL,
  `avatar_id` int DEFAULT NULL,
  PRIMARY KEY (`nid`),
  KEY `app01_moods_avatar_id_f891277b_fk_app01_avatars_nid` (`avatar_id`),
  CONSTRAINT `app01_moods_avatar_id_f891277b_fk_app01_avatars_nid` FOREIGN KEY (`avatar_id`) REFERENCES `app01_avatars` (`nid`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `app01_moods`
--

LOCK TABLES `app01_moods` WRITE;
/*!40000 ALTER TABLE `app01_moods` DISABLE KEYS */;
INSERT INTO `app01_moods` VALUES (1,'姝荤','103.172.116.190','浜氬お鍦板尯','2023-08-13 07:40:46.632736','绗竴鏉″績鎯?,NULL,1,4,5),(2,'鐜嬩簩','120.228.2.238','婀栧崡鐪佸紶瀹剁晫甯?,'2023-08-13 07:40:46.641735','浠婂ぉ蹇冩儏涓嶅ソ',NULL,0,0,7),(4,'娉曡€佷箣楣?,'45.63.122.98','鏃ユ湰','2023-08-13 07:40:46.652798','澶╅檷姝ｄ箟','https://gimg2.baidu.com/image_search/src=http%3A%2F%2Fc-ssl.duitang.com%2Fuploads%2Fitem%2F201606%2F24%2F20160624203007_QTZyG.thumb.1000_0.jpeg&refer=http%3A%2F%2Fc-ssl.duitang.com&app=2002&size=f9999,10000&q=a80&n=0&g=0n&fmt=auto?sec=1694445467&t=328e9ef1232dabc8a978deefd4170151',0,1,6),(13,'s','127.0.0.1','涓浗鍐呯綉','2023-08-13 14:04:17.556439','s','https://img0.baidu.com/it/u=144689340,2857856282&fm=253&fmt=auto&app=138&f=JPG?w=500&h=500\nhttps://img0.baidu.com/it/u=144689340,2857856282&fm=253&fmt=auto&app=138&f=JPG?w=500&h=500\nhttps://img0.baidu.com/it/u=144689340,2857856282&fm=253&fmt=auto&app=138&f=JPG?w=500&h=500',0,3,13);
/*!40000 ALTER TABLE `app01_moods` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `app01_navs`
--

DROP TABLE IF EXISTS `app01_navs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `app01_navs` (
  `nid` int NOT NULL AUTO_INCREMENT,
  `title` varchar(32) NOT NULL,
  `abstract` varchar(128) DEFAULT NULL,
  `href` varchar(200) NOT NULL,
  `icon_href` varchar(200) DEFAULT NULL,
  `create_date` datetime(6) NOT NULL,
  `collects_count` int NOT NULL,
  `digg_count` int NOT NULL,
  `status` int NOT NULL,
  PRIMARY KEY (`nid`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `app01_navs`
--

LOCK TABLES `app01_navs` WRITE;
/*!40000 ALTER TABLE `app01_navs` DISABLE KEYS */;
INSERT INTO `app01_navs` VALUES (4,'澶氫鸡澶氭柟鑴?,'鍔犳嬁澶х埍鍥介潚骞?,'https://www.youtube.com/@Torontobigface','https://yt3.googleusercontent.com/CkhcsHLOHH94lWB-p9kXH0sQ4DA527KXd35tKnYCpRu2reuQjDx2AKvjSZtats3AgNOzAFxf6w=s176-c-k-c0x00ffffff-no-rj','2023-08-22 15:11:08.620438',1,459,1),(5,'灏忕害缈板彲姹?,'閫氳窘鐖卞浗闈掑勾','https://www.youtube.com/@wbclg','https://yt3.googleusercontent.com/FUC3zjxTkXQGS0tD7QDd5E5hvQo2wg1JZBZBdeyw22pDFX8aFO9Kl8bwaJB6N06hvfJA1o82kw=s176-c-k-c0x00ffffff-no-rj','2023-08-22 15:11:35.214799',1,34,1),(6,'鐜嬪織瀹?,'澶钁楀悕璁拌€?浜虹О鐜嬪眬.','https://www.youtube.com/@wangzhian','https://yt3.googleusercontent.com/ZC9IMkqrw-OuYVM5zU5-shKEK7DfCoym6Dl5HPcwh4pj_u5gdkJXxggDa91GZiDgwcbmPjgw4S0=s176-c-k-c0x00ffffff-no-rj','2023-08-22 15:11:28.072151',1,13,1),(7,'Uncle Roger','椹潵瑗夸簹钁楀悕鑴卞彛绉€婕斿憳','https://www.youtube.com/@mrnigelng','https://yt3.googleusercontent.com/eLCADxKBRj3JGsifnxitZwfsbeV3DDlS3r8SzN5QPT2juw0fTV34T09vIZWfEF3D4JmV2z6hZA=s176-c-k-c0x00ffffff-no-rj','2023-08-22 15:11:54.416924',1,56,1),(8,'鞙り长歆€','闊╁浗钁楀悕婕敾瀹?,'https://www.youtube.com/@Yoongonji','https://yt3.googleusercontent.com/FgkAIKvIU0YKz8rDiMQ7fnnggHEmBwWZ06cW42IajnuYbtcHbSK30Ai7vpS-UTZa6GbBS1Is=s176-c-k-c0x00ffffff-no-rj','2023-08-22 15:11:48.633837',0,2002,1),(11,'鏉庡鎱?,'闊╁浗钁楀悕鍟﹀暒闃熸垚鍛?浜虹О涔愬ぉ濂冲.','https://www.youtube.com/@lee_dahye','https://yt3.googleusercontent.com/gMGqIPhctVLS1YILZWeN4IXhMd__Xf0gFiuBi9d8j34trHaP7KE3J0XSiTg2BPJFTzBOnZMLdA=s176-c-k-c0x00ffffff-no-rj','2023-08-22 15:11:43.088606',0,1900,1),(12,'闄堜竴鍙戝効','鏈夊織闈掑勾濂虫瓕鎵?,'https://www.youtube.com/@chenyifaer','https://yt3.googleusercontent.com/ytc/AOPolaSm9nuMQBsDlDs2CdIpFOZRycsHH_pE-2yi7gM=s176-c-k-c0x00ffffff-no-rj','2023-08-24 03:35:54.558684',0,0,1),(13,'澶╂动绀惧尯','璧板ぉ娑?鐪嬩笘鐣?,'https://twitter.com/home','https://yt3.ggpht.com/xH6qOCk2k5X4RNRqvMzAMa4xf9y3mGdYBuHe76KTqOFcU5xPi_BTpcCWEzlmyuJya1JaqXeRaZc=s108-c-k-c0x00ffffff-no-rj','2023-08-25 07:48:45.773440',0,0,1),(14,'灏忓矝娴惞','鏂板姞鍧＄埍鍥介潚骞?,'https://www.youtube.com/@xiaodaodalang','https://yt3.googleusercontent.com/ytc/AOPolaRLDafRdG2EvgiwGGDvIU3tNpBdvduEaw75-LoGcQ=s176-c-k-c0x00ffffff-no-rj','2023-08-25 07:52:30.443875',0,0,1);
/*!40000 ALTER TABLE `app01_navs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `app01_navs_tag`
--

DROP TABLE IF EXISTS `app01_navs_tag`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `app01_navs_tag` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `navs_id` int NOT NULL,
  `navtags_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `app01_navs_tag_navs_id_navtags_id_39e10941_uniq` (`navs_id`,`navtags_id`),
  KEY `app01_navs_tag_navtags_id_e997acfd_fk_app01_navtags_nid` (`navtags_id`),
  CONSTRAINT `app01_navs_tag_navs_id_64df90b2_fk_app01_navs_nid` FOREIGN KEY (`navs_id`) REFERENCES `app01_navs` (`nid`),
  CONSTRAINT `app01_navs_tag_navtags_id_e997acfd_fk_app01_navtags_nid` FOREIGN KEY (`navtags_id`) REFERENCES `app01_navtags` (`nid`)
) ENGINE=InnoDB AUTO_INCREMENT=87 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `app01_navs_tag`
--

LOCK TABLES `app01_navs_tag` WRITE;
/*!40000 ALTER TABLE `app01_navs_tag` DISABLE KEYS */;
INSERT INTO `app01_navs_tag` VALUES (54,4,1),(55,4,2),(56,4,3),(57,4,9),(63,5,1),(64,5,2),(65,5,8),(66,5,12),(67,5,13),(58,6,1),(59,6,2),(60,6,3),(61,6,10),(62,6,11),(47,7,1),(48,7,5),(49,7,6),(50,7,7),(24,8,1),(21,8,2),(22,8,3),(23,8,6),(43,11,1),(44,11,2),(45,11,3),(46,11,6),(82,12,12),(83,12,13),(84,12,14),(85,12,15),(81,13,16),(86,14,16);
/*!40000 ALTER TABLE `app01_navs_tag` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `app01_navtags`
--

DROP TABLE IF EXISTS `app01_navtags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `app01_navtags` (
  `nid` int NOT NULL AUTO_INCREMENT,
  `title` varchar(16) NOT NULL,
  PRIMARY KEY (`nid`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `app01_navtags`
--

LOCK TABLES `app01_navtags` WRITE;
/*!40000 ALTER TABLE `app01_navtags` DISABLE KEYS */;
INSERT INTO `app01_navtags` VALUES (1,'鎺ㄨ崘'),(2,'鏁欑▼'),(3,'鍓嶇'),(5,'Python'),(6,'Vue'),(7,'鍚庣'),(8,'Java'),(9,'React'),(10,'Django'),(11,'绠楁硶'),(12,'鏁版嵁搴?),(13,'Linux'),(14,'姹傝亴'),(15,'鍏ㄦ爤'),(16,'鍗氬');
/*!40000 ALTER TABLE `app01_navtags` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `app01_project`
--

DROP TABLE IF EXISTS `app01_project`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `app01_project` (
  `nid` int NOT NULL AUTO_INCREMENT,
  `title` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`nid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `app01_project`
--

LOCK TABLES `app01_project` WRITE;
/*!40000 ALTER TABLE `app01_project` DISABLE KEYS */;
/*!40000 ALTER TABLE `app01_project` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `app01_project_article`
--

DROP TABLE IF EXISTS `app01_project_article`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `app01_project_article` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `project_id` int NOT NULL,
  `articles_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `app01_project_article_project_id_articles_id_b7f48fe3_uniq` (`project_id`,`articles_id`),
  KEY `app01_project_article_articles_id_baf31051_fk_app01_articles_nid` (`articles_id`),
  CONSTRAINT `app01_project_article_articles_id_baf31051_fk_app01_articles_nid` FOREIGN KEY (`articles_id`) REFERENCES `app01_articles` (`nid`),
  CONSTRAINT `app01_project_article_project_id_07730480_fk_app01_project_nid` FOREIGN KEY (`project_id`) REFERENCES `app01_project` (`nid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `app01_project_article`
--

LOCK TABLES `app01_project_article` WRITE;
/*!40000 ALTER TABLE `app01_project_article` DISABLE KEYS */;
/*!40000 ALTER TABLE `app01_project_article` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `app01_tags`
--

DROP TABLE IF EXISTS `app01_tags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `app01_tags` (
  `nid` int NOT NULL AUTO_INCREMENT,
  `title` varchar(16) NOT NULL,
  PRIMARY KEY (`nid`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `app01_tags`
--

LOCK TABLES `app01_tags` WRITE;
/*!40000 ALTER TABLE `app01_tags` DISABLE KEYS */;
INSERT INTO `app01_tags` VALUES (1,'Python'),(2,'Go'),(3,'JavaScript'),(4,'Linux'),(5,'Java'),(6,'C#'),(7,'C++'),(8,'C'),(9,'HTML'),(10,'CSS'),(11,'Solidity'),(12,'Move'),(13,'AI'),(14,'Android'),(15,'IOS'),(16,'React'),(18,'Vue'),(19,'Django');
/*!40000 ALTER TABLE `app01_tags` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `app01_userinfo`
--

DROP TABLE IF EXISTS `app01_userinfo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `app01_userinfo` (
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  `nid` int NOT NULL AUTO_INCREMENT,
  `nick_name` varchar(16) DEFAULT NULL,
  `avatar_url` varchar(200) DEFAULT NULL,
  `tel` varchar(12) DEFAULT NULL,
  `integral` int NOT NULL,
  `token` varchar(64) DEFAULT NULL,
  `ip` char(39) NOT NULL,
  `addr` longtext,
  `sign_status` int NOT NULL,
  `account_status` int NOT NULL,
  `avatar_id` int DEFAULT NULL,
  PRIMARY KEY (`nid`),
  UNIQUE KEY `username` (`username`),
  KEY `app01_userinfo_avatar_id_4d8395aa_fk_app01_avatars_nid` (`avatar_id`),
  CONSTRAINT `app01_userinfo_avatar_id_4d8395aa_fk_app01_avatars_nid` FOREIGN KEY (`avatar_id`) REFERENCES `app01_avatars` (`nid`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `app01_userinfo`
--

LOCK TABLES `app01_userinfo` WRITE;
/*!40000 ALTER TABLE `app01_userinfo` DISABLE KEYS */;
INSERT INTO `app01_userinfo` VALUES ('pbkdf2_sha256$600000$oYNgvrapCe6LO0sLPdSEQz$nywrNVb27qZfzgQmr2B8BWa2TzAeNH51SXQyhYPEXvc=','2023-08-31 06:49:08.701704',1,'LoopLove','','','1335443862@qq.com',1,1,'2023-07-28 01:54:00.000000',1,NULL,NULL,NULL,20,NULL,'120.228.2.238','',0,0,21),('pbkdf2_sha256$600000$ZAlaboV0DuPlK8mU0G78js$L6RcKs57kCRqkWfuo+eMaH8EcJW2D9UmslF7cLcsJ7Q=',NULL,0,'澶ц','','','',0,1,'2023-07-28 05:19:00.000000',3,NULL,NULL,NULL,20,NULL,'120.228.2.238','',0,0,5),('pbkdf2_sha256$600000$57hEeeP4O5QSYoVWJEgmjc$IDB2V/XRvqsIuyc/qnkBZApJz6iywGGsyH0XKUw7QK8=','2023-08-31 03:55:19.253685',0,'鑻︾','','','',0,1,'2023-07-28 05:35:00.000000',4,NULL,NULL,NULL,20,NULL,'120.228.2.238','',0,0,3),('pbkdf2_sha256$600000$FkT4e7MnzEchSbShsYD2zC$i8pN3Bpn9/oQ41XHKks8cDIl8AfeihcMs8iBHugUVlc=','2023-08-17 08:48:37.036535',0,'闊╃珛','','','',0,1,'2023-07-28 06:37:00.000000',5,NULL,NULL,NULL,20,NULL,'120.228.2.238','',0,0,1),('pbkdf2_sha256$600000$NfPYj54lCQxX0uE9knnWXG$Y5ImiaNNkY8mUITMIgWosmPiP8iwyfmHbzPVlL+luWc=','2023-08-30 07:28:58.622511',0,'椋庡笇','','','',0,1,'2023-07-28 08:44:00.000000',6,NULL,NULL,NULL,20,NULL,'120.228.2.238','',0,0,4),('pbkdf2_sha256$600000$CEZmbSckhpAYvczOLeKFHd$nbVnRJUN8kIC/CmFu1eAGWgOATaEWhmViawb6HxEmFw=','2023-07-28 14:36:00.000000',0,'寮犻搧','','','',0,1,'2023-07-28 14:36:00.000000',7,NULL,NULL,NULL,20,NULL,'120.228.2.238','',0,0,2),('pbkdf2_sha256$600000$B7W3uZ4BOsEWw4JpnVOpJW$ikfY11e5Auvk4uy64jAdt96RybCf5nyXH6oNUVVSsQY=','2023-08-03 13:34:13.905244',0,'鍟奸瓊','','','',0,1,'2023-08-03 13:34:13.706366',8,NULL,NULL,NULL,20,NULL,'120.228.2.238',NULL,0,0,6),('pbkdf2_sha256$600000$6CeIQQf1kFdhTCbrvjpwVj$k8LSKaj/HJgzJba/Qd0v94autjMXMoUlarZ1ATYFTi8=','2023-08-30 14:27:47.960960',0,'绉︽','','','',0,1,'2023-08-30 14:27:47.688583',9,NULL,NULL,NULL,20,NULL,'120.228.2.238',NULL,0,0,10);
/*!40000 ALTER TABLE `app01_userinfo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `app01_userinfo_collects`
--

DROP TABLE IF EXISTS `app01_userinfo_collects`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `app01_userinfo_collects` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `userinfo_id` int NOT NULL,
  `articles_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `app01_userinfo_collects_userinfo_id_articles_id_73774dcd_uniq` (`userinfo_id`,`articles_id`),
  KEY `app01_userinfo_colle_articles_id_c3773049_fk_app01_art` (`articles_id`),
  CONSTRAINT `app01_userinfo_colle_articles_id_c3773049_fk_app01_art` FOREIGN KEY (`articles_id`) REFERENCES `app01_articles` (`nid`),
  CONSTRAINT `app01_userinfo_colle_userinfo_id_eab70bce_fk_app01_use` FOREIGN KEY (`userinfo_id`) REFERENCES `app01_userinfo` (`nid`)
) ENGINE=InnoDB AUTO_INCREMENT=45 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `app01_userinfo_collects`
--

LOCK TABLES `app01_userinfo_collects` WRITE;
/*!40000 ALTER TABLE `app01_userinfo_collects` DISABLE KEYS */;
INSERT INTO `app01_userinfo_collects` VALUES (35,1,41),(32,1,42),(31,1,43),(30,1,44),(42,1,45),(41,6,41),(40,6,45),(39,6,46);
/*!40000 ALTER TABLE `app01_userinfo_collects` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `app01_userinfo_groups`
--

DROP TABLE IF EXISTS `app01_userinfo_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `app01_userinfo_groups` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `userinfo_id` int NOT NULL,
  `group_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `app01_userinfo_groups_userinfo_id_group_id_48ba2aa6_uniq` (`userinfo_id`,`group_id`),
  KEY `app01_userinfo_groups_group_id_30b9b2c4_fk_auth_group_id` (`group_id`),
  CONSTRAINT `app01_userinfo_groups_group_id_30b9b2c4_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `app01_userinfo_groups_userinfo_id_04be482a_fk_app01_userinfo_nid` FOREIGN KEY (`userinfo_id`) REFERENCES `app01_userinfo` (`nid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `app01_userinfo_groups`
--

LOCK TABLES `app01_userinfo_groups` WRITE;
/*!40000 ALTER TABLE `app01_userinfo_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `app01_userinfo_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `app01_userinfo_navs`
--

DROP TABLE IF EXISTS `app01_userinfo_navs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `app01_userinfo_navs` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `userinfo_id` int NOT NULL,
  `navs_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `app01_userinfo_navs_userinfo_id_navs_id_197774e8_uniq` (`userinfo_id`,`navs_id`),
  KEY `app01_userinfo_navs_navs_id_1ea72c9c_fk_app01_navs_nid` (`navs_id`),
  CONSTRAINT `app01_userinfo_navs_navs_id_1ea72c9c_fk_app01_navs_nid` FOREIGN KEY (`navs_id`) REFERENCES `app01_navs` (`nid`),
  CONSTRAINT `app01_userinfo_navs_userinfo_id_40eb4ed6_fk_app01_userinfo_nid` FOREIGN KEY (`userinfo_id`) REFERENCES `app01_userinfo` (`nid`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `app01_userinfo_navs`
--

LOCK TABLES `app01_userinfo_navs` WRITE;
/*!40000 ALTER TABLE `app01_userinfo_navs` DISABLE KEYS */;
INSERT INTO `app01_userinfo_navs` VALUES (15,1,4),(10,1,5),(16,1,6),(11,1,7);
/*!40000 ALTER TABLE `app01_userinfo_navs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `app01_userinfo_user_permissions`
--

DROP TABLE IF EXISTS `app01_userinfo_user_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `app01_userinfo_user_permissions` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `userinfo_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `app01_userinfo_user_perm_userinfo_id_permission_i_8bd06903_uniq` (`userinfo_id`,`permission_id`),
  KEY `app01_userinfo_user__permission_id_826033c9_fk_auth_perm` (`permission_id`),
  CONSTRAINT `app01_userinfo_user__permission_id_826033c9_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `app01_userinfo_user__userinfo_id_3a67a872_fk_app01_use` FOREIGN KEY (`userinfo_id`) REFERENCES `app01_userinfo` (`nid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `app01_userinfo_user_permissions`
--

LOCK TABLES `app01_userinfo_user_permissions` WRITE;
/*!40000 ALTER TABLE `app01_userinfo_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `app01_userinfo_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_group` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group`
--

LOCK TABLES `auth_group` WRITE;
/*!40000 ALTER TABLE `auth_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group_permissions`
--

DROP TABLE IF EXISTS `auth_group_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_group_permissions` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `group_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group_permissions`
--

LOCK TABLES `auth_group_permissions` WRITE;
/*!40000 ALTER TABLE `auth_group_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_permission`
--

DROP TABLE IF EXISTS `auth_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_permission` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=89 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can view log entry',1,'view_logentry'),(5,'Can add permission',2,'add_permission'),(6,'Can change permission',2,'change_permission'),(7,'Can delete permission',2,'delete_permission'),(8,'Can view permission',2,'view_permission'),(9,'Can add group',3,'add_group'),(10,'Can change group',3,'change_group'),(11,'Can delete group',3,'delete_group'),(12,'Can view group',3,'view_group'),(13,'Can add content type',4,'add_contenttype'),(14,'Can change content type',4,'change_contenttype'),(15,'Can delete content type',4,'delete_contenttype'),(16,'Can view content type',4,'view_contenttype'),(17,'Can add session',5,'add_session'),(18,'Can change session',5,'change_session'),(19,'Can delete session',5,'delete_session'),(20,'Can view session',5,'view_session'),(21,'Can add user info',6,'add_userinfo'),(22,'Can change user info',6,'change_userinfo'),(23,'Can delete user info',6,'delete_userinfo'),(24,'Can view user info',6,'view_userinfo'),(25,'Can add advert',7,'add_advert'),(26,'Can change advert',7,'change_advert'),(27,'Can delete advert',7,'delete_advert'),(28,'Can view advert',7,'view_advert'),(29,'Can add articles',8,'add_articles'),(30,'Can change articles',8,'change_articles'),(31,'Can delete articles',8,'delete_articles'),(32,'Can view articles',8,'view_articles'),(33,'Can add avatars',9,'add_avatars'),(34,'Can change avatars',9,'change_avatars'),(35,'Can delete avatars',9,'delete_avatars'),(36,'Can view avatars',9,'view_avatars'),(37,'Can add cover',10,'add_cover'),(38,'Can change cover',10,'change_cover'),(39,'Can delete cover',10,'delete_cover'),(40,'Can view cover',10,'view_cover'),(41,'Can add feedback',11,'add_feedback'),(42,'Can change feedback',11,'change_feedback'),(43,'Can delete feedback',11,'delete_feedback'),(44,'Can view feedback',11,'view_feedback'),(45,'Can add history',12,'add_history'),(46,'Can change history',12,'change_history'),(47,'Can delete history',12,'delete_history'),(48,'Can view history',12,'view_history'),(49,'Can add menu img',13,'add_menuimg'),(50,'Can change menu img',13,'change_menuimg'),(51,'Can delete menu img',13,'delete_menuimg'),(52,'Can view menu img',13,'view_menuimg'),(53,'Can add nav tags',14,'add_navtags'),(54,'Can change nav tags',14,'change_navtags'),(55,'Can delete nav tags',14,'delete_navtags'),(56,'Can view nav tags',14,'view_navtags'),(57,'Can add tags',15,'add_tags'),(58,'Can change tags',15,'change_tags'),(59,'Can delete tags',15,'delete_tags'),(60,'Can view tags',15,'view_tags'),(61,'Can add project',16,'add_project'),(62,'Can change project',16,'change_project'),(63,'Can delete project',16,'delete_project'),(64,'Can view project',16,'view_project'),(65,'Can add navs',17,'add_navs'),(66,'Can change navs',17,'change_navs'),(67,'Can delete navs',17,'delete_navs'),(68,'Can view navs',17,'view_navs'),(69,'Can add moods',18,'add_moods'),(70,'Can change moods',18,'change_moods'),(71,'Can delete moods',18,'delete_moods'),(72,'Can view moods',18,'view_moods'),(73,'Can add mood comment',19,'add_moodcomment'),(74,'Can change mood comment',19,'change_moodcomment'),(75,'Can delete mood comment',19,'delete_moodcomment'),(76,'Can view mood comment',19,'view_moodcomment'),(77,'Can add menu',20,'add_menu'),(78,'Can change menu',20,'change_menu'),(79,'Can delete menu',20,'delete_menu'),(80,'Can view menu',20,'view_menu'),(81,'Can add comment',21,'add_comment'),(82,'Can change comment',21,'change_comment'),(83,'Can delete comment',21,'delete_comment'),(84,'Can view comment',21,'view_comment'),(85,'Can add email',22,'add_email'),(86,'Can change email',22,'change_email'),(87,'Can delete email',22,'delete_email'),(88,'Can view email',22,'view_email');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_admin_log` (
  `id` int NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int DEFAULT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_app01_userinfo_nid` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_app01_userinfo_nid` FOREIGN KEY (`user_id`) REFERENCES `app01_userinfo` (`nid`),
  CONSTRAINT `django_admin_log_chk_1` CHECK ((`action_flag` >= 0))
) ENGINE=InnoDB AUTO_INCREMENT=166 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
INSERT INTO `django_admin_log` VALUES (1,'2023-07-29 13:39:30.758952','1','Python',1,'[{\"added\": {}}]',15,1),(2,'2023-07-29 13:39:42.230893','2','Go',1,'[{\"added\": {}}]',15,1),(3,'2023-07-29 13:39:51.711100','3','JavaScript',1,'[{\"added\": {}}]',15,1),(4,'2023-07-29 13:41:28.832213','1','article_img/article_01.png',1,'[{\"added\": {}}]',10,1),(5,'2023-07-29 13:41:37.272785','2','article_img/article_02.png',1,'[{\"added\": {}}]',10,1),(6,'2023-07-29 13:41:42.746861','3','article_img/article_03.png',1,'[{\"added\": {}}]',10,1),(7,'2023-07-29 13:41:49.578989','4','article_img/article_04.png',1,'[{\"added\": {}}]',10,1),(8,'2023-07-29 13:41:54.690377','5','article_img/article_05.png',1,'[{\"added\": {}}]',10,1),(9,'2023-07-29 13:42:00.058859','6','article_img/article_06.png',1,'[{\"added\": {}}]',10,1),(10,'2023-07-29 13:42:05.088244','7','article_img/article_07.png',1,'[{\"added\": {}}]',10,1),(11,'2023-07-29 13:42:10.617150','8','article_img/article_08.png',1,'[{\"added\": {}}]',10,1),(12,'2023-07-29 13:42:16.183181','9','article_img/article_09.png',1,'[{\"added\": {}}]',10,1),(13,'2023-07-29 13:42:21.361716','10','article_img/article_10.png',1,'[{\"added\": {}}]',10,1),(14,'2023-07-29 13:42:26.264323','11','article_img/article_11.png',1,'[{\"added\": {}}]',10,1),(15,'2023-07-29 13:42:31.426007','12','article_img/article_12.png',1,'[{\"added\": {}}]',10,1),(16,'2023-07-29 13:45:44.394742','1','鏈哄櫒瀛︿範鐨勫疄璺?,1,'[{\"added\": {}}]',8,1),(17,'2023-07-29 13:47:08.688458','4','Linux',1,'[{\"added\": {}}]',15,1),(18,'2023-07-29 13:47:56.622035','2','Linux鍜孶nix',1,'[{\"added\": {}}]',8,1),(19,'2023-07-30 02:19:03.528647','1','鏈哄櫒瀛︿範鐨勫疄璺?,2,'[{\"changed\": {\"fields\": [\"\\u6587\\u7ae0\\u5185\\u5bb9\"]}}]',8,1),(20,'2023-07-30 02:47:57.230447','2','Linux鍜孶nix',2,'[{\"changed\": {\"fields\": [\"\\u6587\\u7ae0\\u5185\\u5bb9\"]}}]',8,1),(21,'2023-07-30 02:48:31.019943','2','Linux鍜孶nix',2,'[{\"changed\": {\"fields\": [\"\\u6587\\u7ae0\\u5185\\u5bb9\"]}}]',8,1),(22,'2023-07-30 02:49:15.979811','1','鏈哄櫒瀛︿範鐨勫疄璺?,2,'[{\"changed\": {\"fields\": [\"\\u6587\\u7ae0\\u5185\\u5bb9\"]}}]',8,1),(23,'2023-07-31 03:03:05.291466','5','Java',1,'[{\"added\": {}}]',15,1),(24,'2023-07-31 03:03:13.037813','6','C#',1,'[{\"added\": {}}]',15,1),(25,'2023-07-31 03:03:16.401336','7','C++',1,'[{\"added\": {}}]',15,1),(26,'2023-07-31 03:03:21.524416','8','C',1,'[{\"added\": {}}]',15,1),(27,'2023-07-31 03:03:25.165499','9','HTML',1,'[{\"added\": {}}]',15,1),(28,'2023-07-31 03:03:29.579071','10','CSS',1,'[{\"added\": {}}]',15,1),(29,'2023-07-31 03:03:36.645842','11','Solidity',1,'[{\"added\": {}}]',15,1),(30,'2023-07-31 03:03:43.009059','12','Move',1,'[{\"added\": {}}]',15,1),(31,'2023-07-31 03:03:48.397989','13','AI',1,'[{\"added\": {}}]',15,1),(32,'2023-07-31 03:03:59.820338','14','Android',1,'[{\"added\": {}}]',15,1),(33,'2023-07-31 03:04:03.976625','15','IOS',1,'[{\"added\": {}}]',15,1),(34,'2023-08-02 08:26:16.028241','40','娴嬭瘯瀵嗙爜绗簩浠?,3,'',8,1),(35,'2023-08-02 08:26:16.031334','39','娴嬭瘯瀵嗙爜绗竴浠?,3,'',8,1),(36,'2023-08-02 08:26:16.035239','38','闆峰吔',3,'',8,1),(37,'2023-08-02 08:26:16.036805','37','閿欒',3,'',8,1),(38,'2023-08-02 08:26:16.038524','36','閿欒',3,'',8,1),(39,'2023-08-02 08:26:16.039549','35','閿欒',3,'',8,1),(40,'2023-08-02 08:26:16.041890','34','閿欒',3,'',8,1),(41,'2023-08-02 08:26:16.042905','33','閿欒',3,'',8,1),(42,'2023-08-02 08:26:16.044909','32','楸煎簵涓?,3,'',8,1),(43,'2023-08-02 08:26:16.046623','31','閿欒',3,'',8,1),(44,'2023-08-02 08:26:16.047624','30','淇敼',3,'',8,1),(45,'2023-08-02 08:26:16.048623','29','dsaf',3,'',8,1),(46,'2023-08-02 08:26:16.050624','28','鍒嗙被',3,'',8,1),(47,'2023-08-02 08:26:16.052907','27','鍐嶆潵鍝?,3,'',8,1),(48,'2023-08-02 08:26:16.054658','26','閲嶅惎',3,'',8,1),(49,'2023-08-02 08:26:16.056384','25','娴嬭瘯',3,'',8,1),(50,'2023-08-02 08:26:16.058002','24','b',3,'',8,1),(51,'2023-08-02 08:26:16.059015','23','鍒嗙被娴嬭瘯2',3,'',8,1),(52,'2023-08-02 08:26:16.062599','22','鍒嗙被娴嬭瘯涓€',3,'',8,1),(53,'2023-08-02 08:26:16.064153','21','鏁戞晳鎴?,3,'',8,1),(54,'2023-08-02 08:26:16.065609','20','鏍囬',3,'',8,1),(55,'2023-08-02 08:26:16.067020','19','鍒嗙被',3,'',8,1),(56,'2023-08-02 08:26:16.068368','18','娴嬭瘯',3,'',8,1),(57,'2023-08-02 08:26:16.069064','17','娴嬭瘯',3,'',8,1),(58,'2023-08-02 08:26:16.071100','16','涓粙娴嬭瘯',3,'',8,1),(59,'2023-08-02 08:26:16.072398','15','鍝庡憖鍛€',3,'',8,1),(60,'2023-08-02 08:26:16.073776','14','淇敼娴嬭瘯',3,'',8,1),(61,'2023-08-02 08:26:16.074788','13','鏍?,3,'',8,1),(62,'2023-08-02 08:26:16.076759','12','鏍囬',3,'',8,1),(63,'2023-08-02 08:26:16.078288','11','鏍峰紡鍌婚€?,3,'',8,1),(64,'2023-08-02 08:26:16.079144','10','鍐嶈瘯涓€娆?,3,'',8,1),(65,'2023-08-02 08:26:16.081147','9','鎴戠湡涓嶆兂鎶ラ敊',3,'',8,1),(66,'2023-08-02 08:26:16.083233','8','鍒姤閿?,3,'',8,1),(67,'2023-08-02 08:26:16.084907','7','鍙堟潵浜嗙畝鍐?,3,'',8,1),(68,'2023-08-02 08:26:16.086531','6','鍐嶆娴嬭瘯',3,'',8,1),(69,'2023-08-02 08:26:16.089175','5','娴嬭瘯鏍囬',3,'',8,1),(70,'2023-08-02 08:26:16.090175','4','娴嬭瘯绠€鍐?,3,'',8,1),(71,'2023-08-02 08:26:16.093225','3','娴嬭瘯',3,'',8,1),(72,'2023-08-02 12:00:30.019072','1','杩欏ぉ涓?鎴戝敖鍙幓涔?鍝堝搱鍝堝搱.鈥斺€旂埗璇勮',1,'[{\"added\": {}}]',21,1),(73,'2023-08-02 12:00:36.228351','1','杩欏ぉ涓?鎴戝敖鍙幓涔?鍝堝搱鍝堝搱.鈥斺€旂埗璇勮1',2,'[{\"changed\": {\"fields\": [\"\\u8bc4\\u8bba\\u5185\\u5bb9\"]}}]',21,1),(74,'2023-08-02 12:01:27.523669','2','澶ф仼浜洪甯?澶氳阿椋庨浄缈呪€斺€旂埗璇勮2',1,'[{\"added\": {}}]',21,1),(75,'2023-08-02 12:02:33.932641','3','椋庡笇,鐪嬫垜璞＄敳鍔熶箣濞?鈥斺€斿瓙璇勮1',1,'[{\"added\": {}}]',21,1),(76,'2023-08-02 12:03:44.364316','4','鐓岀厡濞佺伒,閬靛惥鏁曞懡,鏂╂棤璧︹€斺€斿瓙璇勮2',1,'[{\"added\": {}}]',21,1),(77,'2023-08-02 12:04:27.980127','5','鐨嗕负鎴戞帉鎻♀€斺€斿瓙璇勮11',1,'[{\"added\": {}}]',21,1),(78,'2023-08-02 12:07:16.732261','6','澶ц瀹濈粡鈥斺€斿瓙璇勮12',1,'[{\"added\": {}}]',21,1),(79,'2023-08-02 15:42:32.236621','1','avatars/head_08.png',1,'[{\"added\": {}}]',9,1),(80,'2023-08-02 15:42:47.912603','2','avatars/head_05.png',1,'[{\"added\": {}}]',9,1),(81,'2023-08-02 15:43:08.727960','3','avatars/head_03.png',1,'[{\"added\": {}}]',9,1),(82,'2023-08-02 15:43:14.454161','4','avatars/head_02.png',1,'[{\"added\": {}}]',9,1),(83,'2023-08-02 15:45:16.245261','5','闊╃珛',2,'[{\"changed\": {\"fields\": [\"Last login\", \"\\u7528\\u6237\\u5934\\u50cf\"]}}]',6,1),(84,'2023-08-02 15:45:23.399908','5','闊╃珛',2,'[]',6,1),(85,'2023-08-02 15:45:32.284269','6','椋庡笇',2,'[{\"changed\": {\"fields\": [\"Last login\", \"\\u7528\\u6237\\u5934\\u50cf\"]}}]',6,1),(86,'2023-08-02 15:45:41.737105','4','鑻︾',2,'[{\"changed\": {\"fields\": [\"Last login\", \"\\u7528\\u6237\\u5934\\u50cf\"]}}]',6,1),(87,'2023-08-02 15:45:49.877912','7','寮犻搧',2,'[{\"changed\": {\"fields\": [\"Last login\", \"\\u7528\\u6237\\u5934\\u50cf\"]}}]',6,1),(88,'2023-08-02 15:46:01.483025','5','avatars/head_09.png',1,'[{\"added\": {}}]',9,1),(89,'2023-08-02 15:46:10.477952','3','澶ц',2,'[{\"changed\": {\"fields\": [\"\\u7528\\u6237\\u5934\\u50cf\"]}}]',6,1),(90,'2023-08-02 15:46:26.038606','6','avatars/head_16.png',1,'[{\"added\": {}}]',9,1),(91,'2023-08-02 15:46:34.539429','1','LoopLove',2,'[{\"changed\": {\"fields\": [\"Last login\", \"\\u7528\\u6237\\u5934\\u50cf\"]}}]',6,1),(92,'2023-08-08 02:45:25.927866','1','鏈哄櫒瀛︿範鐨勫疄璺碘€斺€斿叧涔庝簬鑷姩椹鹃┒浠ュ強涓浗浜虹殑鑷俊鑷皧鑷己闂灞曞紑',2,'[{\"changed\": {\"fields\": [\"\\u6807\\u9898\"]}}]',8,1),(93,'2023-08-08 02:45:40.922700','1','鏈哄櫒瀛︿範鐨勫疄璺?,2,'[{\"changed\": {\"fields\": [\"\\u6807\\u9898\"]}}]',8,1),(94,'2023-08-08 03:12:53.390452','41','澶氱嚎绋媧sgfhweiakfghera',2,'[{\"changed\": {\"fields\": [\"\\u6807\\u9898\", \"\\u6587\\u7ae0\\u7b80\\u4ecb\", \"\\u6587\\u7ae0\\u5185\\u5bb9\"]}}]',8,1),(95,'2023-08-08 03:13:02.423223','41','澶氱嚎绋媧sgfhweiakfgheraadasgfasfgasf',2,'[{\"changed\": {\"fields\": [\"\\u6807\\u9898\"]}}]',8,1),(96,'2023-08-08 03:15:44.200417','41','澶氱嚎绋嬭繖灏辨槸涓浗锛侊紒涓浗鑷俊锛侊紒涓浗浜猴紒',2,'[{\"changed\": {\"fields\": [\"\\u6807\\u9898\"]}}]',8,1),(97,'2023-08-09 07:05:46.362842','17','Vue',3,'',15,1),(98,'2023-08-10 07:39:44.808427','1','Advert object (1)',1,'[{\"added\": {}}]',7,1),(99,'2023-08-10 07:41:17.940808','2','Advert object (2)',1,'[{\"added\": {}}]',7,1),(100,'2023-08-10 08:26:25.666934','2','Advert object (2)',2,'[{\"changed\": {\"fields\": [\"\\u56fe\\u7247\\u7ec4\"]}}]',7,1),(101,'2023-08-10 08:27:00.089372','2','Advert object (2)',2,'[{\"changed\": {\"fields\": [\"\\u56fe\\u7247\\u7ec4\"]}}]',7,1),(102,'2023-08-10 13:02:12.964502','2','Advert object (2)',2,'[{\"changed\": {\"fields\": [\"\\u56fe\\u7247\\u5730\\u5740\"]}}]',7,1),(103,'2023-08-10 13:02:36.043752','2','Advert object (2)',2,'[{\"changed\": {\"fields\": [\"\\u56fe\\u7247\\u5730\\u5740\"]}}]',7,1),(104,'2023-08-10 13:06:11.197046','2','Advert object (2)',2,'[{\"changed\": {\"fields\": [\"\\u662f\\u5426\\u5c55\\u793a\"]}}]',7,1),(105,'2023-08-10 13:06:15.120870','1','Advert object (1)',2,'[{\"changed\": {\"fields\": [\"\\u662f\\u5426\\u5c55\\u793a\"]}}]',7,1),(106,'2023-08-10 13:06:21.144082','2','Advert object (2)',2,'[{\"changed\": {\"fields\": [\"\\u662f\\u5426\\u5c55\\u793a\"]}}]',7,1),(107,'2023-08-10 13:06:24.418302','1','Advert object (1)',2,'[{\"changed\": {\"fields\": [\"\\u662f\\u5426\\u5c55\\u793a\"]}}]',7,1),(108,'2023-08-12 12:47:55.234032','7','avatars/head_19.png',1,'[{\"added\": {}}]',9,1),(109,'2023-08-12 12:48:00.222764','8','avatars/head_18.png',1,'[{\"added\": {}}]',9,1),(110,'2023-08-12 12:48:03.555981','9','avatars/head_17.png',1,'[{\"added\": {}}]',9,1),(111,'2023-08-12 12:48:08.373381','10','avatars/head_15.png',1,'[{\"added\": {}}]',9,1),(112,'2023-08-12 12:48:11.949794','11','avatars/head_14.png',1,'[{\"added\": {}}]',9,1),(113,'2023-08-12 12:48:15.572780','12','avatars/head_13.png',1,'[{\"added\": {}}]',9,1),(114,'2023-08-12 12:48:19.701730','13','avatars/head_12.png',1,'[{\"added\": {}}]',9,1),(115,'2023-08-12 12:48:22.899014','14','avatars/head_11.png',1,'[{\"added\": {}}]',9,1),(116,'2023-08-12 12:48:26.419319','15','avatars/head_10.png',1,'[{\"added\": {}}]',9,1),(117,'2023-08-12 12:48:31.796002','16','avatars/head_07.png',1,'[{\"added\": {}}]',9,1),(118,'2023-08-12 12:48:44.271135','17','avatars/head_01.png',1,'[{\"added\": {}}]',9,1),(119,'2023-08-12 12:48:47.821322','18','avatars/head_04.png',1,'[{\"added\": {}}]',9,1),(120,'2023-08-12 12:48:57.399692','19','avatars/head_06.png',1,'[{\"added\": {}}]',9,1),(121,'2023-08-17 13:31:40.480861','1','site_bg/article_01.png',1,'[{\"added\": {}}]',13,1),(122,'2023-08-17 13:31:46.045771','2','site_bg/article_02.png',1,'[{\"added\": {}}]',13,1),(123,'2023-08-17 13:31:54.043765','3','site_bg/article_03.png',1,'[{\"added\": {}}]',13,1),(124,'2023-08-17 13:31:57.956213','4','site_bg/article_04.png',1,'[{\"added\": {}}]',13,1),(125,'2023-08-17 13:32:01.139124','5','site_bg/article_05.png',1,'[{\"added\": {}}]',13,1),(126,'2023-08-17 13:32:04.889160','6','site_bg/article_06.png',1,'[{\"added\": {}}]',13,1),(127,'2023-08-17 13:32:08.115655','7','site_bg/article_07.png',1,'[{\"added\": {}}]',13,1),(128,'2023-08-17 13:32:11.456098','8','site_bg/article_08.png',1,'[{\"added\": {}}]',13,1),(129,'2023-08-17 13:32:19.142018','9','site_bg/article_09.png',1,'[{\"added\": {}}]',13,1),(130,'2023-08-17 13:32:23.821850','10','site_bg/article_10.png',1,'[{\"added\": {}}]',13,1),(131,'2023-08-17 14:00:55.695183','1','Menu object (1)',1,'[{\"added\": {}}]',20,1),(132,'2023-08-17 14:03:14.995634','2','Menu object (2)',1,'[{\"added\": {}}]',20,1),(133,'2023-08-17 14:05:17.058128','3','Menu object (3)',1,'[{\"added\": {}}]',20,1),(134,'2023-08-18 02:20:18.420565','3','Menu object (3)',2,'[{\"changed\": {\"fields\": [\"Slogan\\u4ecb\\u7ecd\"]}}]',20,1),(135,'2023-08-21 08:51:22.535526','1','灏忓彾鍗氬',1,'[{\"added\": {}}]',17,1),(136,'2023-08-21 08:53:34.595844','2','element UI',1,'[{\"added\": {}}]',17,1),(137,'2023-08-21 08:59:52.024165','2','element UI',2,'[{\"changed\": {\"fields\": [\"\\u5bfc\\u822a\\u72b6\\u6001\"]}}]',17,1),(138,'2023-08-21 08:59:57.435862','1','灏忓彾鍗氬',2,'[{\"changed\": {\"fields\": [\"\\u5bfc\\u822a\\u72b6\\u6001\"]}}]',17,1),(139,'2023-08-22 07:58:16.909502','3','',3,'',17,1),(140,'2023-08-22 08:05:45.695008','2','element UI',3,'',17,1),(141,'2023-08-22 08:05:45.697644','1','灏忓彾鍗氬',3,'',17,1),(142,'2023-08-22 08:13:27.134922','5','灏忕害缈板彲姹?,2,'[{\"changed\": {\"fields\": [\"\\u7f51\\u7ad9\\u6807\\u7b7e\"]}}]',17,1),(143,'2023-08-22 08:15:40.559520','6','鐜嬪織瀹?,2,'[{\"changed\": {\"fields\": [\"\\u7f51\\u7ad9\\u6807\\u7b7e\"]}}]',17,1),(144,'2023-08-22 12:35:48.397524','8','鞙り长歆€',2,'[{\"changed\": {\"fields\": [\"\\u7f51\\u7ad9\\u6807\\u7b7e\"]}}]',17,1),(145,'2023-08-22 14:36:14.210654','10','鞚措嫟順?,3,'',17,1),(146,'2023-08-22 14:36:23.752063','11','鏉庡鎱?,2,'[{\"changed\": {\"fields\": [\"\\u5bfc\\u822a\\u72b6\\u6001\"]}}]',17,1),(147,'2023-08-22 15:11:08.622285','4','澶氫鸡澶氭柟鑴?,2,'[{\"changed\": {\"fields\": [\"\\u70b9\\u8d5e\\u6570\"]}}]',17,1),(148,'2023-08-22 15:11:28.074152','6','鐜嬪織瀹?,2,'[{\"changed\": {\"fields\": [\"\\u70b9\\u8d5e\\u6570\"]}}]',17,1),(149,'2023-08-22 15:11:35.217337','5','灏忕害缈板彲姹?,2,'[{\"changed\": {\"fields\": [\"\\u70b9\\u8d5e\\u6570\"]}}]',17,1),(150,'2023-08-22 15:11:43.090616','11','鏉庡鎱?,2,'[{\"changed\": {\"fields\": [\"\\u70b9\\u8d5e\\u6570\"]}}]',17,1),(151,'2023-08-22 15:11:48.635419','8','鞙り长歆€',2,'[{\"changed\": {\"fields\": [\"\\u70b9\\u8d5e\\u6570\"]}}]',17,1),(152,'2023-08-22 15:11:54.418933','7','Uncle Roger',2,'[{\"changed\": {\"fields\": [\"\\u70b9\\u8d5e\\u6570\"]}}]',17,1),(153,'2023-08-24 03:35:48.409945','12','闄堜竴鍙戝効',2,'[]',17,1),(154,'2023-08-24 03:35:54.561677','12','闄堜竴鍙戝効',2,'[{\"changed\": {\"fields\": [\"\\u7f51\\u7ad9\\u6807\\u7b7e\"]}}]',17,1),(155,'2023-08-25 07:52:30.444875','14','灏忓矝娴惞',2,'[{\"changed\": {\"fields\": [\"\\u5bfc\\u822a\\u72b6\\u6001\"]}}]',17,1),(156,'2023-08-25 14:48:06.213162','3','鎴戞兂鍚冭嫻鏋滀簡',2,'[{\"changed\": {\"fields\": [\"\\u56de\\u590d\\u7684\\u5185\\u5bb9\"]}}]',11,1),(157,'2023-08-26 14:32:18.392752','4','Menu object (4)',1,'[{\"added\": {}}]',20,1),(158,'2023-08-26 14:59:38.446228','5','Menu object (5)',1,'[{\"added\": {}}]',20,1),(159,'2023-08-28 14:57:46.903723','1','Menu object (1)',2,'[{\"changed\": {\"fields\": [\"\\u83dc\\u5355\\u56fe\\u7247\"]}}]',20,1),(160,'2023-08-28 14:59:20.279016','5','Menu object (5)',2,'[{\"changed\": {\"fields\": [\"\\u83dc\\u5355\\u56fe\\u7247\"]}}]',20,1),(161,'2023-08-28 14:59:36.625431','4','Menu object (4)',2,'[{\"changed\": {\"fields\": [\"\\u83dc\\u5355\\u56fe\\u7247\"]}}]',20,1),(162,'2023-08-28 14:59:54.641421','1','Menu object (1)',2,'[{\"changed\": {\"fields\": [\"\\u83dc\\u5355\\u56fe\\u7247\"]}}]',20,1),(163,'2023-08-28 14:59:56.557328','1','Menu object (1)',2,'[]',20,1),(164,'2023-08-28 15:00:05.324050','2','Menu object (2)',2,'[{\"changed\": {\"fields\": [\"\\u83dc\\u5355\\u56fe\\u7247\"]}}]',20,1),(165,'2023-08-30 15:00:06.036452','2','绁栧浗浜虹殑璐ョ被锛侊紒锛?,2,'[{\"changed\": {\"fields\": [\"\\u56de\\u590d\\u7684\\u5185\\u5bb9\"]}}]',11,1);
/*!40000 ALTER TABLE `django_admin_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_content_type` (
  `id` int NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (1,'admin','logentry'),(22,'api','email'),(7,'app01','advert'),(8,'app01','articles'),(9,'app01','avatars'),(21,'app01','comment'),(10,'app01','cover'),(11,'app01','feedback'),(12,'app01','history'),(20,'app01','menu'),(13,'app01','menuimg'),(19,'app01','moodcomment'),(18,'app01','moods'),(17,'app01','navs'),(14,'app01','navtags'),(16,'app01','project'),(15,'app01','tags'),(6,'app01','userinfo'),(3,'auth','group'),(2,'auth','permission'),(4,'contenttypes','contenttype'),(5,'sessions','session');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_migrations` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2023-07-21 06:41:58.443447'),(2,'contenttypes','0002_remove_content_type_name','2023-07-21 06:41:58.475875'),(3,'auth','0001_initial','2023-07-21 06:41:58.606202'),(4,'auth','0002_alter_permission_name_max_length','2023-07-21 06:41:58.635939'),(5,'auth','0003_alter_user_email_max_length','2023-07-21 06:41:58.640434'),(6,'auth','0004_alter_user_username_opts','2023-07-21 06:41:58.645903'),(7,'auth','0005_alter_user_last_login_null','2023-07-21 06:41:58.651425'),(8,'auth','0006_require_contenttypes_0002','2023-07-21 06:41:58.654065'),(9,'auth','0007_alter_validators_add_error_messages','2023-07-21 06:41:58.658871'),(10,'auth','0008_alter_user_username_max_length','2023-07-21 06:41:58.663777'),(11,'auth','0009_alter_user_last_name_max_length','2023-07-21 06:41:58.669769'),(12,'auth','0010_alter_group_name_max_length','2023-07-21 06:41:58.681557'),(13,'auth','0011_update_proxy_permissions','2023-07-21 06:41:58.686687'),(14,'auth','0012_alter_user_first_name_max_length','2023-07-21 06:41:58.691314'),(15,'app01','0001_initial','2023-07-21 06:41:59.678094'),(16,'admin','0001_initial','2023-07-21 06:41:59.744999'),(17,'admin','0002_logentry_remove_auto_add','2023-07-21 06:41:59.754508'),(18,'admin','0003_logentry_add_action_flag_choices','2023-07-21 06:41:59.764367'),(19,'sessions','0001_initial','2023-07-21 06:41:59.784632'),(20,'api','0001_initial','2023-08-30 14:41:16.337167'),(21,'api','0002_email_create_date','2023-08-30 14:57:02.559430'),(22,'app01','0002_userinfo_login_date','2023-08-31 02:51:24.660618'),(23,'app01','0003_remove_userinfo_login_date','2023-08-31 02:59:11.956328');
/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
INSERT INTO `django_session` VALUES ('3ibht2eny1zhzxufnn2jh8db44kqttwf','.eJxVjDsOgzAQRO_iOrLWa4jtlPQpcgLL3l0CCQKJT5ood4-RaOhG783MV33S0HOkiUXdVDM8ZnVRMW1rF7dF5thzwebMcqK3jLvgVxqfk6ZpXOc-672iD7voe_kcmqN7OujS0pV169CKyVA5yEhGbKhaDxSACWsGZ8l7sEQmePHIkPCKwZkSpK6rjOr3B2FXPZc:1qQHBZ:rDTTdXHO9rdcFZ02kYyFynT6bZfVr6oFm8oGciwlxVo','2023-08-14 00:54:57.619597'),('3oqcapglpjpdvd3hmaw1czbtrkbvkyqx','.eJxVjDsOwjAQRO_iGlnrdRLblFRQcAbL3t2QAEqkfGgQd8eR0qQbvTczX_VJ754jjSzqrG62uaqTimldurjOMsWeCzZHlhO9ZNgEP9PwGDWNwzL1WW8VvdtZ38vn-7J3Dwddmruybh1aMRkqBxnJiA1V64ECMGHN4Cx5D5bIBC8eGRI2GJwpQeq6yqh-fxB0PSA:1qQzRD:7S4FM7OU0s_xrKTp8DAOV-IjdaAI5VNlPHg7iGLWV3M','2023-08-16 00:10:03.269715'),('j5jj2tvxftcnnjn28wecv52hvpt7pmvv','.eJzFl99u2yAUxl-l4jppwMY29K7bM1S7WKroGHCC5j8RtnNT5d0HTrqu1C2u12RSpJNwPh_8_TjB-AkdoNRyIxqp0B36QeQDWiBlTGPsWF936A4v0Ab6brfpW2U2WloZQa_GchC_VO0SsN9jcjuUvHX52-992zXVt7Pg1VU7aHf2kphToDyWopDKfShJkyQXLMfAOScRp0xkjEuRE8LzKAYVUU65xDLhkMaxK1qpum9trZ9Pa1RDpdbo7maN7vd6jRb2ixZNfRoqwNwUsBTaiFKdkpV1XrYu_frq9brnGJQNVBWpDUksyTCIyYSyvSlPuRXIStcr2OuVqkCXq1MepHx4V2KTZ1luFEhh-iofucWwwePi5qtMHR9dWmnpsgTjyB8g_mT3rhn-bQUSlRUuUAqzmNsbsN8PynQfYf9LNZl82NoI--l2fLh0pFqasMyGDBSeD8d02kraIJ5n3WUBTbfkA0oC1Sx1gYdWz9JoNi7R2C4JsTqJrgfqM9Z8bGmwdsrw8CvP1GxsHWyDHTZorgltujEfWjZSO0si5opGcTYbk3ss6rpoQqj-6C6La7olHxALVHPPHSFdx3LGZuMqlJLu6PEGV92X5TWgfMaGj4iHa_OYuoBFMX97P0AHJry7n2XX66fP2PPQETxWGyR3AecuMCyEmylN56NzZ8oQt0FzYWgzjfnQ3pzOPqxt1yUt5u_3jouutlPwOdn_IjjJpQ8yGpuiSMjLTEleuClYFM0_tNZwCP5rB82F2c005kOLR2qzXNAh5PMxiaayTRQ83D_LLgtruiEfD_WfDuO84FRekOEdgg19HLNhT81o_HbO1s3Z7rQq5RLKLvi2lSlrYLyKO3K0S9Fs31kN-1a_2pqm33-wFC-aievwNabH2nqSUX-VUn8gOT6i42-VcVBx:1qbcLG:tzAREGHScx6LsF3KbCp8SlCwoNIzdLgR0o9-5AnECP0','2023-09-14 07:43:50.440253'),('jdjbjobusn4k1g1ztjmfn6v8134u80s5','.eJzFl9tu4yAQhl8l8nUOYGMbetfdZ9irTRWNASdofYh8yE2Vd19w0m1L3OLQJitFmoQZ__j_mGD8HGyg73abvpXNRongIcDB_O1YBvyPrEwC9nuElwcolFia_PJn33Z1-eNc8O6qHbQ7fUnECBAWCZ4LaT4EJ3GccZohYIzhkBHKU8oEzzBmWRiBDAkjTCARM0iiyIiWsupbrfX7eR1UUMp18DBbB497tQ7m-ovidXUayqGZ5bDgquGFPCXLWsiiNen3V6_XPUMgdSAyT3SII4GHQYQnyPZNccqtQJSqWsFerWQJqlid8iDErw9LdPJcljUSBG_6Mhu5RbfB43z2XaaOTyYtlTBZjFBoD2B7skfTDF9bgVimuQmEgBdzfQP6-0E23WfY31RNJu-2NsJ-uh0bLhlRS2Ka6pCCRP5wmk7pktaJ56XutoCmW7IBxQ41TZ2jodXTJPTGxWvdJS5Wp6L7gbrGmo0tcWonFA2_slR6Y-tg6-ywoeae0KYbs6GlI9ppHFIjGkapNybzWFRVXrtQ_au7La7plmxA1KFmnjtcmI5llHrjyqUU5uhxgavqi-IeUK6xYSNibm0WERMQz_239wN00Lh393PZ_frpGnsWOozGtEEwE1BmAkWcm5mSxB-dOVO6uA01N4bmacyGdnE6-1Rbr0uS--_3hosqt1PwmbL_RXCSSxtkODZFHuPXmeIsN1PQMPQ_tFZwcP5rh5obs_M0ZkOLRrRpxskQMn9MvC51EzkP9y9lt4U13ZCNh9hPh3FecJLneHiHoEMfR3TYU1MSXc7ZmjnbnZKFWEDROd-2UqkNjKuYI0e74PX2g9XQb_WrbVP3-0-W4rVm4jp8j-mxtp5k1F6lxB6Ij0_B8S8wPESs:1qbbUK:hvWvpovWJzVN1fKEm6KFVXXAl-46QmazyZ0qu5NV3ik','2023-09-14 06:49:08.727706');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-08-31 16:01:18
