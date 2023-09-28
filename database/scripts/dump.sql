-- MySQL dump 10.13  Distrib 8.0.33, for Linux (x86_64)
--
-- Host: localhost    Database: zadania
-- ------------------------------------------------------
-- Server version	8.0.33-0ubuntu0.22.04.2

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
-- Table structure for table `classes`
--

DROP TABLE IF EXISTS `classes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `classes` (
  `id_class` int NOT NULL AUTO_INCREMENT,
  `class` varchar(45) NOT NULL,
  PRIMARY KEY (`id_class`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `classes`
--

LOCK TABLES `classes` WRITE;
/*!40000 ALTER TABLE `classes` DISABLE KEYS */;
INSERT INTO `classes` VALUES (1,'3a1'),(2,'3a2');
/*!40000 ALTER TABLE `classes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `current_class`
--

DROP TABLE IF EXISTS `current_class`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `current_class` (
  `current_class` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `current_class`
--

LOCK TABLES `current_class` WRITE;
/*!40000 ALTER TABLE `current_class` DISABLE KEYS */;
INSERT INTO `current_class` VALUES ('3a1');
/*!40000 ALTER TABLE `current_class` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `password`
--

DROP TABLE IF EXISTS `password`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `password` (
  `idpassword` int NOT NULL AUTO_INCREMENT,
  `password` varchar(255) NOT NULL,
  PRIMARY KEY (`idpassword`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `password`
--

LOCK TABLES `password` WRITE;
/*!40000 ALTER TABLE `password` DISABLE KEYS */;
INSERT INTO `password` VALUES (1,'askompecdl2@');
/*!40000 ALTER TABLE `password` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `students_data`
--

DROP TABLE IF EXISTS `students_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `students_data` (
  `id_student` int NOT NULL AUTO_INCREMENT,
  `ip_address` varchar(45) DEFAULT NULL,
  `number_in_diary` varchar(45) DEFAULT NULL,
  `id_class` int DEFAULT NULL,
  PRIMARY KEY (`id_student`),
  KEY `fk_klasa_idx` (`id_class`),
  CONSTRAINT `fk_klasa` FOREIGN KEY (`id_class`) REFERENCES `classes` (`id_class`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `students_data`
--

LOCK TABLES `students_data` WRITE;
/*!40000 ALTER TABLE `students_data` DISABLE KEYS */;
/*!40000 ALTER TABLE `students_data` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tasks`
--

DROP TABLE IF EXISTS `tasks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tasks` (
  `id` int NOT NULL AUTO_INCREMENT,
  `content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  `answer_1` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  `answer_2` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  `answer_3` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  `answer_4` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  `has_file` int DEFAULT NULL,
  `file_name` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  `question_hash` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  `nr_egzaminu` int DEFAULT NULL,
  `c_answer` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

DELIMITER $$
CREATE PROCEDURE `VerifyPassword`(
	IN inputPassword varchar(255)
)
BEGIN
	SELECT COUNT(password) AS "PasswordOK"
    FROM password
    WHERE password.password = inputPassword;
END$$
DELIMITER ;

--
-- Dumping data for table `tasks`
--

LOCK TABLES `tasks` WRITE;
/*!40000 ALTER TABLE `tasks` DISABLE KEYS */;
INSERT INTO `tasks` VALUES (1,'Używanie na platformie do zarządzania projektem informatycznym komunikatów pisemnych w celu porozumiewania się szefa ze współpracownikami spowoduje','opóźnienie terminu realizacji projektu z powodu niewiedzy pracowników.','lepszy przepływ informacji niż tradycyjna komunikacja ustna.','brak odpowiedzialności za realizowane zadania.','trudności w komunikacji z dużą grupą pracowników.',0,'','',3,'answer_4'),(2,'Na podstawie przedstawionej na ilustracji konfiguracji kart sieciowych można stwierdzić, że','karta przewodowa ma adres MAC 8C-70-5A-F3-75-BC','interfejs Bluetooth ma przydzielony adres IPv4 192.168.0.102','karta bezprzewodowa ma nazwę Net11','wszystkie karty uzyskują adresy poprzez protokół DHCP',1,'/f0730000-bb04-7aea-a068-08da2a13f770.PNG','',3,'answer_4'),(3,'Zgodnie z Kodeksem pracy do obowiązków pracownika w zakresie bezpieczeństwa i higieny pracy należy','prowadzenie spójnej polityki zapobiegania wypadkom przy pracy.','dbanie o właściwy stan maszyn, urządzeń, narzędzi i sprzętu.','zapewnianie wykonywania zaleceń społecznego inspektora pracy.','odpowiedzialność za stan BHP w zakładzie pracy.',0,'','',3,'answer_3'),(4,'Wskaż technologię wykorzystywaną do udostępniania Internetu wraz z usługą telewizji kablowej, w której jako medium transmisyjne jest wykorzystywany światłowód oraz kabel koncentryczny.','GPRS','PLC','HFC','xDSL',0,'','',3,NULL),(5,'Centralny punkt infrastruktury sieciowej, z którego rozprowadzane jest okablowanie szkieletowe, to punkt','dystrybucyjny.','abonencki.','dostępowy.','pośredni.',0,'','',3,NULL),(6,'Którym poleceniem w systemie Linux można przypisać adres IP i maskę podsieci dla interfejsu eth0?','ifconfig eth0 172.16.31.1 mask 255.255.0.0','ipconfig eth0 172.16.31.1 mask 255.255.0.0','ifconfig eth0 172.16.31.1 netmask 255.255.0.0','ipconfig eth0 172.16.31.1 netmask 255.255.0.0',0,'','',3,'answer_1'),(7,'Programem umożliwiającym wydzielenie logicznych części dysku twardego w systemie GNU/Linux jest','truncate','format','convert','fdisk',0,'','',3,'answer_4'),(8,'Które zmiany w funkcjonowaniu organizmu w płaszczyźnie fizjologicznej może powodować stres?','Poczucie osamotnienia.','Odczuwanie lęku.','Przyśpieszony puls.','Rozdrażnienie.',0,'','',3,NULL),(9,'Parametrem opóźnienia określającym czas potrzebny do odczytania danych przez kontroler pamięci od \nmomentu wysłania żądania jest','RAS Precharge (RP).','Serial presence detect (SPD).','Command Rate (CR).','CAS Latency (CL).',0,'','',3,NULL),(10,'Do usuwania plików lub katalogów w systemie Linux służy polecenie','cat','rm','tar','ls',0,'','',3,'answer_2'),(11,'Odpowiednikiem maski 255.255.252.0 jest prefiks','/23','/24','/22','/25',0,'','',3,'answer_3'),(12,'W systemie Windows profil użytkownika tworzony podczas pierwszego logowania do komputera i przechowywany na lokalnym dysku twardym komputera, charakteryzujący się tym, że każda jego modyfikacja dotyczy jedynie komputera, na którym została ona wprowadzona, to profil','tymczasowy.','mobilny.','obowiązkowy.','lokalny.',0,'','',3,NULL),(13,'Aby uzyskać maksymalną wydajność obliczeniową komputera, którego płyta główna jest przedstawiona na ilustracji, zaleca się','zainstalowanie dwóch procesorów.','zastosowanie kontrolera RAID.','zastosowanie dysku SAS.','zainstalowanie pamięci RAM we wszystkich gniazdach.',1,'/47ec0000-f683-928a-85c6-08da29c51941.PNG','',3,NULL),(14,'Który z wymienionych mechanizmów zapewni najwyższy poziom bezpieczeństwa sieci bezprzewodowych standardu 802.11n?','WPA (Wi-Fi Protected Access)','WPS (Wi-Fi Protected Setup)','WPA2 (Wi-Fi Protected Access II)','WEP (Wired Equivalent Privacy)',0,'','',3,NULL),(15,'Co stanie się w wyniku wykonania przedstawionego skryptu?','Zawartość pliku ola.txt zostanie skopiowana do pliku ala.txt','Zawartość pliku ala.txt zostanie skopiowana do pliku ola.txt','Zostanie wpisany tekst \"ola.txt\"\" do pliku ala.txt\"','Zostanie wpisany tekst \"ala.txt\"\" do pliku ola.txt\"',1,'/f0730000-bb04-7aea-c1a2-08da29ebd8bc.PNG','',3,NULL),(16,'W filmie przedstawiono adapter','HDMI - FireWire','DisplayPort - DVI','HDMI - D-Sub','DisplayPort - HDMI',1,'/47ec0000-f683-928a-2fa3-08da29f72abd.mp4','',3,'answer_4'),(17,'Która topologia fizyczna charakteryzuje się nadmiarowymi połączeniami pomiędzy urządzeniami sieci?','Siatki.','Magistrali.','Pierścienia.','Gwiazdy.',0,'','',3,NULL),(18,'Symbolem literowym P oznaczana jest ','rezystancja.','moc.','częstotliwość.','indukcyjność.',0,'','',3,NULL),(19,'Wykonanie polecenia net localgroup w systemie Windows spowoduje','skompresowanie wszystkich plików.','wyświetlenie lokalnych grup użytkowników.','utworzenie dowolnej grupy użytkowników.','defragmentację plików.',0,'','',3,NULL),(20,'Aby w sieci komputerowej była możliwa praca w wydzielonych logicznie mniejszych podsieciach, należy w przełączniku dokonać konfiguracji sieci','WLAN','WAN','VLAN','VPN',0,'','',3,NULL),(21,'Protokołem aplikacyjnym używanym przez WWW jest','HTTPS','SFTP','LAGP','IPSec',0,'','',3,NULL),(22,'Elementem elektronicznym zdolnym do gromadzenia ładunku elektrycznego jest','dioda.','tranzystor.','kondensator.','rezystor.',0,'','',3,NULL),(23,'Jedną z przyczyn pokazanego na ilustracji problemu z wydrukiem z drukarki laserowej może być','brak tonera w kasecie.','uszkodzony bęben światłoczuły.','uszkodzony podajnik papieru.','zaschnięty tusz na głowicy drukującej.',1,'/47ec0000-f683-928a-bff7-08da29f7ef0b.PNG','',3,NULL),(24,'Na którym rysunku przedstawiono topologię sieci typu rozszerzona gwiazda?','Na rysunku 3.','Na rysunku 4.','Na rysunku 2.','Na rysunku 1.',1,'/f0730000-bb04-7aea-3cc4-08da29951fdb.JPG','',3,'answer_2'),(25,'Ile bitów przeznaczonych jest na adresację hostów w sieci z maską 255.255.255.224?','4 bity','5 bitów','6 bitów','3 bity',0,'','',3,NULL),(26,'Aby, za pomocą polecenia ping, było możliwe sprawdzenie poprawności komunikacji z innymi urządzeniami pracującymi w sieci, należy w zaporze Windows skonfigurować reguły dotyczące protokołu','ICMP','UDP','IGMP','TCP',0,'','',3,NULL),(27,'Przedstawione na ilustracji urządzenie można wykorzystać do pomiarów okablowania','światłowodowego.','koncentrycznego.','skrętki kategorii 5e/6.','telefonicznego kategorii 3.',1,'/f0730000-bb04-7aea-fb58-08da2a126c50.PNG','',3,NULL),(28,'Przedstawiony schemat obrazuje zasadę działania skanera','3D.','2D.','płaskiego.','ręcznego.',1,'/47ec0000-f683-928a-9c14-08da37283be5.jpg','',3,NULL),(29,'Na podstawie instrukcji przełącznika wskaż, która z opcji menu przywraca ustawienia fabryczne.','Firmware Upgrade','Reset System','Save Configuration','Reboot Device',1,'/f0730000-bb04-7aea-667f-08da2a1579e1.PNG','',3,NULL),(30,'Serwer Windows z zainstalowaną i skonfigurowaną usługą Active Directory, kontrolujący uwierzytelnianie i autoryzację użytkowników domenowych nosi nazwę','kontrolera domeny.','kontrolera portów.','serwera DHCP.','serwera WWW.',0,'','',3,NULL),(31,'W systemie operacyjnym Windows, aby włączyć lub wyłączyć usługi, można posłużyć się przystawką','dcpol.msc','usrmgr.msc','services.msc','dfsgui.msc',0,'','',3,NULL),(32,'Ile par przewodów skrętki miedzianej kategorii 5e wykorzystuje się do transmisji danych w standardzie sieci Ethernet 100Base-TX?','2','1','3','4',0,'','',3,NULL),(33,'Do serwisu komputerowego dostarczono laptop z matrycą bardzo słabo wyświetlającą obraz. Ponadto obraz jest bardzo ciemny i widoczny tylko z bliska. Przyczyną usterki jest','zerwane łącze między płytą główną a matrycą.','uszkodzony inwerter.','pęknięta matryca.','uszkodzone gniazdo HDMI.',0,'','',3,NULL),(34,'Poleceniem służącym do wyświetlania i modyfikacji tabel translacji adresów IP na adresy fizyczne jest','mmc','expand','path','arp',0,'','',3,NULL),(35,'Który port na przedstawionej płycie głównej umożliwia podłączenie zewnętrznego dysku poprzez interfejs e-SATA?','4','2','1','3',1,'/f0730000-bb04-7aea-a88a-08da29ec9f58.PNG','',3,NULL),(36,'Którego polecenia, z odpowiednimi parametrami należy użyć, aby ustawić w systemach operacyjnych rodziny Windows właściwość pliku na tylko do odczytu?','chmod','attrib','set','ftype',0,'','',3,NULL),(37,'Toner jest stosowany w drukarkach','sublimacyjnych.','laserowych.','igłowych.','atramentowych.',0,'','',3,NULL),(38,'Które urządzenie jest przedstawione na ilustracji?','Koncentrator.','Zasilacz PoE.','Przełącznik.','Punkt dostępowy.',1,'/f0730000-bb04-7aea-6598-08da2a14d848.PNG','',3,NULL),(39,'Do podłączenia dysku wyposażonego w interfejs SAS należy zastosować','złącze 4.','złącze 3.','złącze 1.','złącze 2.',1,'/f0730000-bb04-7aea-425a-08da29995981.JPG','',3,NULL),(40,'Przedstawiony opis dotyczy','procedury wymiany radiatora z wentylatorem.','podłączenia zasilacza awaryjnego.','podłączania zasilania do płyty głównej.','montażu procesora na płycie głównej.',1,'/f0730000-bb04-7aea-34ba-08da2a19b4f3.PNG','',3,'answer_3'),(41,'Adresem IPv6 hosta skonfigurowanym na karcie sieciowej enp0s25 jest','172.16.21.255','fe80::3d6:e6d2:1c93:56e2','172.16.21.100','a0:b3:cc:28:8f:37',1,'/f0730000-bb04-7aea-bdad-08dad3d3a0bd.JPG','',3,NULL),(42,'W modelu hierarchicznym sieci komputery użytkowników są elementami warstwy ','dostępu. ','rdzenia.','szkieletowej. ','dystrybucji. ',0,'','',3,NULL),(43,'Użytkownikom pracującym poza biurem uzyskanie zdalnego dostępu do serwera w sieci prywatnej przy \nwykorzystaniu infrastruktury sieci publicznej, takiej jak Internet, umożliwia połączenie','VPN ','FTP','SMTP','IMAP',0,'','',3,NULL),(44,'Które polecenie należy wydać w systemie Windows, aby sprawdzić tabelę translacji adresów IP na adresy \nfizyczne? ','ipconfig ','netstat -r ','arp -a ','route print ',0,'','',3,NULL),(45,'Wskaż zapis liczby -1210 metodą znak-moduł w postaci ośmiobitowej liczby dwójkowej. ','-1.11000zm','+1.11000zm','10001100zm','00001100zm',0,'','',3,NULL),(46,'Serwerowa płyta główna do poprawnego działania wymaga pamięci z rejestrem. Który z wymienionych \nmodułów pamięci będzie kompatybilny z taka płytą?','Kingston Hynix B 8GB 1600MHz DDR3L CL11 ECC SODIMM 1,35V','Kingston 4GB 1600MHz DDR3 ECC CL11 DIMM 1,5 V','Kingston 4GB 1333MHz DDR3 Non-ECC CL9 DIMM','Kingston 8GB 1333MHz DDR3 ECC REG CL9 DIMM 2Rx8 ',0,'','',3,NULL),(47,'IMAP jest protokołem obsługującym ','monitorowanie urządzeń sieciowych. ','odbiór poczty elektronicznej.','synchronizację czasu z serwerami.','wysyłanie poczty elektronicznej.',0,'','',3,NULL),(48,'Przedstawiony na ilustracji wtyk 8P8C (złącze męskie modularne) jest stosowany jako zakończenie kabla','koncentrycznego ','F/UTP','YTDY','światłowodowego',1,'/f0730000-bb04-7aea-a669-08dad3ccc03c.JPG','',3,NULL),(49,'Głównym zadaniem usługi DNS jest','rozwiązywanie nazw domenowych na adresy fizyczne.','sprawdzanie poprawności adresów IP.','sprawdzanie poprawności adresów domenowych. ','rozwiązywanie nazw domenowych na adresy IP. ',0,'','',3,NULL),(50,'Zgodnie z przedstawioną instrukcją montażu płyty głównej należy ','dotykać w dowolny sposób i w dowolnej kolejności metalowe przewody lub złącza. ','umieścić podzespół w dowolnym miejscu i dowolnym opakowaniu przed jego zainstalowaniem. ','unikać wyłączania zasilania sieciowego przed demontażem płyty głównej.','w przypadku braku opaski ESD, przed dotknięciem elementów elektronicznych, najpierw dotknąć \nmetalowy przedmiot. ',1,'/f0730000-bb04-7aea-9713-08dad3d41805.JPG','',3,NULL),(51,'W systemie Linux do monitorowania bieżących procesów służy polecenie','ps','test','free ','dd ',0,'','',3,NULL),(52,'Który z typów rekordów DNS definiuje alias (alternatywną nazwę) rekordu A dla kanonicznej (rzeczywistej) \nnazwy hosta?','CNAME ','NS','AAAA','PTR',0,'','',3,NULL),(53,'Udostępnienie linuksowych usług drukowania oraz serwera plików stacjom roboczym Windows, OS X, Linux \numożliwia serwer','APACHE','SQUID','SAMBA','POSTFIX',0,'','',3,NULL),(54,'W systemie Windows, aby ustawić routing statyczny do sieci 192.168.10.0, należy wydać polecenie','static route 92.168.10.1 MASK 255.255.255.0 192.168.10.0 5','static 192.168.10.0 MASK 255.255.255.0 192.168.10.1 5 route ','route 192.168.10.1 MASK 255.255.255.0 192.168.10.0 5 ADD','route ADD 192.168.10.0 MASK 255.255.255.0 192.168.10.15',0,'','',3,NULL),(55,'Jeśli pracownik przebywał na zwolnieniu lekarskim dłużej niż 30 dni, to przed powrotem do pracy musi przejść \nbadania','tymczasowe. ','okresowe.','wstępne.','kontrolne.',0,'','',3,NULL),(56,'Liczby 1001 oraz 100 w wierszu pliku /etc/passwd oznaczają','liczbę dni od ostatniej zmiany hasła i liczbę dni do wygaśnięcia hasła.','numer koloru czcionki i numer koloru tła w terminalu. ','liczbę udanych i nieudanych prób logowania.','identyfikatory użytkownika i grupy w systemie. ',1,'/f0730000-bb04-7aea-bd09-08dad3c8de78.JPG','',3,NULL),(57,'Program df działający w systemach rodziny Linux umożliwia wyświetlenie','zawartości ukrytego katalogu. ','tekstu pasującego do wzorca. ','informacji o wolnej przestrzeni dyskowej.','nazwy bieżącego katalogu.',0,'','',3,NULL),(58,'Aby zabezpieczyć sieć bezprzewodową przed nieautoryzowanym dostępem, należy między innymi ','korzystać wyłącznie z kanałów używanych przez inne sieci Wi-Fi.','włączyć filtrowanie adresów MAC. ','zastosować nazwę identyfikatora sieci SSID o długości minimum 16 znaków. ','wyłączyć szyfrowanie danych.',0,'','',3,NULL),(59,'Które urządzenie należy zainstalować w serwerze, by można było automatycznie archiwizować dane na \ntaśmach magnetycznych? ','Dysk SSD','Streamer','Napęd DVD ','Blu-Ray ',0,'','',3,NULL),(60,'Która technologia umożliwia dostęp do Internetu? ','OCR','SLI ','CLIP ','xDSL',0,'','',3,NULL),(61,'Elementem odpowiedzialnym za wymianę danych między procesorem a magistralą PCI-E jest','cache procesora. ','chipset. ','układ Super I/O.','pamięć RAM.',0,'','',3,NULL),(62,'W układzie SI jednostką miary napięcia elektrycznego jest','wat [W]. ','amper [A].','herc [Hz]. ','wolt [V]. ',0,'','',3,NULL),(63,'Program tar umożliwia ','wyświetlanie listy aktywnych procesów.','konfigurowanie karty sieciowej. ','archiwizowanie plików. ','zarządzanie pakietami.',0,'','',3,'answer_3'),(64,'Ile urządzeń maksymalnie można zaadresować w sieci o adresie 192.168.0.0/24? ','2024','254 ','126','65534',0,'','',3,NULL),(65,'Na ilustracji została przedstawiona topologia','pierścienia. ','pełnej siatki.','magistrali.','gwiazdy rozszerzonej. ',1,'/47ec0000-f683-928a-ca65-08dad3c3a74f.JPG','',3,NULL),(66,'Aby zwiększyć wydajność procesora rodziny Intel poprzez jego „podkręcenie” (ang. overclocking) można \nzastosować procesor oznaczony ','literą K','literą Y','literą B ','literą U ',0,'','',3,NULL),(67,'Wskaż domyślną maskę szesnastobitowego adresu IPv4. ','255.255.0.0','255.255.255.255','255.0.0.0','255.255.255.0',0,'','',3,NULL),(68,'Który materiał eksploatacyjny nie jest wykorzystywany w ploterach?','Atrament.','Pisak. ','Filament.','Tusz. ',0,'','',3,NULL),(69,'Przedstawiony na ilustracji symbol, stosowany w dokumentacji technicznej, oznacza','konieczność zastosowania koszy w kolorze żółtym i niebieskim.','brak możliwości składowania odpadów aluminiowych oraz innych tworzyw metalicznych.','wymóg selektywnej zbiórki sprzętu elektronicznego.','zielony punkt upoważniający do wniesienia opłaty pieniężnej na rzecz organizacji odzysku opakowań.',1,'/f0730000-bb04-7aea-901c-08dad3c7ba3d.JPG','',3,NULL),(70,'Na ilustracji przedstawione jest oprogramowanie monitorujące technologię ','S.M.A.R.T.','NCQ ','IRDA','SAS',1,'/f0730000-bb04-7aea-4485-08dad3cb02ee.JPG','',3,'answer_1'),(71,'Przypisanie licencji oprogramowania wyłącznie do jednego komputera lub jego podzespołów jest cechą \nlicencji ','TRIAL ','AGPL ','BOX','OEM',0,'','',3,NULL),(72,'Błąd wczytywania pytania','pozwoli zmienić hasło na takie samo po 4 dniach.','wymusi utworzenia hasła zawierającego nie mniej niż 12 znaków.','będzie rejestrował zdarzenia, jeśli hasło będzie krótsze niż 8 znaków.','wymusi na użytkowniku zmianę hasła po 10 dniach.',1,'/f0730000-bb04-7aea-d667-08dad3d02c16.mp4','',3,NULL),(73,'Który mechanizm musi być uruchomiony na ruterze, aby ruter mógł zmieniać źródłowe i docelowe adresy IP \nprzy przekazywaniu pakietów pomiędzy sieciami? ','UDP ','NAT','FTP','TCP',0,'','',3,NULL),(74,'Profil użytkownika systemu Windows wykorzystywany do logowania na dowolnym komputerze w sieci, który \njest przechowywany na serwerze i może być modyfikowany przez użytkownika, to profil ','mobilny. ','lokalny. ','obowiązkowy.','tymczasowy. ',0,'','',3,NULL),(75,'Psychicznym skutkiem przewlekłego stresu może być','depresja.','choroba układu krążenia.','atopowe zapalenie skóry i chroniczne zapalenie oczu.','nawracająca infekcja. ',0,'','',3,NULL),(76,'Elementem zestawu komputerowego przetwarzającym zarówno dane wejściowe, jak i wyjściowe, jest','drukarka. ','skaner.','modem. ','ploter. ',0,'','',3,NULL),(77,'Który styl zarządzania grupą, odbywający się w trybie rozkazów, jest skierowany na wykonanie zadania bez \nwzględu na interesy pracowników? ','Delegujący. ','Wspierający.','Dyrektywny. ','Trenerski.',0,'','',3,NULL),(78,'Które porty należy odblokować w zaporze sieciowej komputera, aby można było korzystać z zainstalowanej \nusługi FTP w trybie aktywnym na standardowych portach? ','25 i 110','20 i 21 ','53 i 137','80 i 443 ',0,'','',3,NULL),(79,'Do pomiaru wartości mocy czynnej metodą bezpośrednią należy użyć','omomierza.','woltomierza.','amperomierza.','watomierza.',0,'','',3,NULL),(80,'Menedżer usług IIS (Internet Information Services) systemu Windows służy do konfiguracji serwera','wydruku ','DNS','WWW','terminali',0,'','',3,NULL),(81,'Funkcją serwera FTP jest','monitoring sieci.','synchronizacja czasu.','udostępnianie plików.','zarządzanie kontami poczty.',0,'','',3,NULL),(82,'Na podstawie ilustracji przedstawiającej okno konfiguracji przełącznika można stwierdzić, że','czas między wysyłaniem kolejnych komunikatów o poprawnej pracy urządzenia wynosi 3 sekundy.','maksymalny czas pomiędzy zmianami statusu łącza wynosi 5 sekund.','minimalny czas krążenia w sieci komunikatów protokołu BPDU wynosi 25 sekund.','maksymalny czas krążenia w sieci komunikatów protokołu BPDU wynosi 20 sekund.',1,'/f0730000-bb04-7aea-f7c7-08da293ba7e5.JPG','',3,NULL),(83,'Na ilustracji przedstawiono ','czujnik temperatury.','impulsator.','sondę logiczną.','tester płyt głównych.',1,'/47ec0000-f683-928a-af29-08da292bebc9.JPG','',3,NULL),(84,'Urządzeniem stosowanym do połączenia 6 komputerów w sieć lokalną jest','przełącznik.','wzmacniak.','transceiver.','most.',0,'','',3,NULL),(85,'Wynik działania polecenia ls -l użytego w systemie Linux jest przedstawiony na','wyniku 2.','wyniku 1.','wyniku 4.','wyniku 3.',1,'/47ec0000-f683-928a-ab2e-08da292835a6.JPG','',3,NULL),(86,'Nadzorem i kontrolą w zakresie przestrzegania zasad bezpieczeństwa i higieny pracy oraz przepisów \nzwiązanych z zatrudnieniem w Polsce zajmuje się','Zakład Ubezpieczeń Społecznych.','Państwowa Inspekcja Pracy.','Rządowe Centrum Legislacji.','Biuro Bezpieczeństwa Narodowego.',0,'','',3,NULL),(87,'Moc zasilacza wynosi 450 W, co w przeliczeniu jest równe','4,5 MW','45 GW','0,045 hW','0,45 kW',0,'','',3,NULL),(88,'Oznaczenie przedstawionego procesora informuje o','bardzo niskim zużyciu energii przez procesor.','jego małej obudowie.','wersji mobilnej procesora.','braku blokady mnożnika (unlocked).',1,'/47ec0000-f683-928a-c0c0-08da29211756.JPG','',3,NULL),(89,'Na ilustracji jest przedstawiony symbol graficzny','rutera.','mostu.','punktu dostępowego.','przełącznika.',1,'/47ec0000-f683-928a-94c1-08da292ecca4.JPG','',3,NULL),(90,'Do sprawdzenia prawidłowości przebiegów i wartości napięć układu urządzenia elektronicznego można użyć','testera płyt głównych.','miernika uniwersalnego.','oscyloskopu cyfrowego.','watomierza.',0,'','',3,NULL),(91,'Aby była możliwa komunikacja między różnymi sieciami VLAN, należy zastosować','modem.','regenerator.','ruter.','koncentrator.',0,'','',3,NULL),(92,'Na ilustracji jest przedstawiony','panel krosowy.','przełącznik. ','ruter.','koncentrator.',1,'/f0730000-bb04-7aea-735d-08da29381410.JPG','',3,NULL),(93,'Adresem rozgłoszeniowym sieci, w której pracuje host o adresie IP 195.120.252.32 i masce podsieci \n255.255.255.192 jest','195.120.255.255','195.120.252.255','195.120.252.0','195.120.252.63',0,'','',3,NULL),(94,'Podczas podłączenia sprawnego monitora do innego komputera jest wyświetlany komunikat przedstawiony \nna ilustracji. Pojawienie się komunikatu jest spowodowane','uszkodzeniem monitora podczas podłączania.','wyłączeniem komputera.','zbyt wysoko ustawioną ostrością obrazu.','zbyt wysoką lub zbyt niską częstotliwością sygnału.',1,'/47ec0000-f683-928a-3818-08da292dbae7.JPG','',3,NULL),(95,'Atak komputerowy, polegający na wyłudzaniu poufnych informacji osobistych przez podszywanie się pod \ngodną zaufania osobę lub instytucję, to','phishing.','DDoS.','spam.','backscatter.',0,'','',3,NULL),(96,'Wynikiem dodawania liczb 33(8) oraz 71(8) jest liczba','1001100(2)','1010100(2)','1100101(2)','1010101(2)',0,'','',3,NULL),(97,'W tabeli przedstawiono parametry zestawu komputerowego. Ponieważ jego karta graficzna uległa \nuszkodzeniu, należy ją wymienić na kartę graficzną o parametrach przedstawionych w ramce. W związku \nz tym modernizacja tego komputera wymaga również wymiany','karty sieciowej.','zasilacza.','procesora.','płyty głównej.',1,'/47ec0000-f683-928a-f0ce-08da2921cf4e.JPG','',3,NULL),(98,'W systemie Windows Server zdalny dostęp do sieci organizacji zapewnia usługa','RRAS','SMB','FTP','IIS',0,'','',3,NULL),(99,'Na ilustracji jest przedstawione okno konfiguracji urządzenia dostępu do lokalnej sieci bezprzewodowej. Aby\nzmienić identyfikator sieci wykorzystywany podczas próby nawiązywania połączenia z punktem dostępowym,\nnależy użyć pole oznaczone numerem','2.','3.','1.','4.',1,'/f0730000-bb04-7aea-abcb-08da293cde9c.JPG','',3,NULL),(100,'Co jest charakterystyczne dla architektury sieci lokalnych typu klient - serwer?','Wszystkie komputery klienckie mają dostęp do zasobów pozostałych komputerów.','Żaden z komputerów nie pełni roli nadrzędnej w stosunku do pozostałych.','Każdy komputer zarówno udostępnia pewne zasoby, jak i korzysta z zasobów innych komputerów.','Wyróżnione komputery pełnią rolę serwerów udostępniających zasoby, a pozostałe komputery z tych \nzasobów korzystają.',0,'','',3,NULL),(101,'Przed wykonaniem prac serwisowych związanych z modyfikacją rejestru systemu Windows należy wykonać','oczyszczanie dysku za pomocą programu cleanmgr.','kopię rejestru za pomocą programu regedit.','defragmentację dysku za pomocą programu defrag.','czyszczenie rejestru za pomocą programu defraggler.',0,'','',3,NULL),(102,'Aby przeprowadzić aktualizację do wyższej wersji systemu Ubuntu Linux należy użyć między innymi\npolecenia','sudo apt-get dist-upgrade','install source update','apt-get sudo su update','upgrade install dist high',0,'','',3,NULL),(103,'Którego kodu numerycznego należy użyć w poleceniu zmiany praw do pliku w systemie Linux, aby jego \nwłaściciel miał prawa zapisu i odczytu, grupa miała prawa odczytu i wykonania, a pozostali użytkownicy tylko \nprawo odczytu?','751','765','123','654',0,'','',3,NULL),(104,'Aby zmienić właściciela pliku w systemie Linux, należy użyć polecenia','chown','pwd','chmod','ps',0,'','',3,NULL),(105,'Na ilustracji jest przedstawiona konfiguracja','rezerwacji adresów MAC.','sieci bezprzewodowej.','przekierowania portów.','wirtualnych sieci.',1,'/f0730000-bb04-7aea-fef8-08da293c4165.JPG','',3,NULL),(106,'Wskaż, zgodną z obowiązującymi normami, maksymalną odległość pomiędzy urządzeniami sieciowymi, \npołączonymi bezpośrednio skrętką kategorii 5e?','100 m','500 m','10 m','1 000 m',0,'','',3,NULL),(107,'Użycie przedstawionego w ramce polecenia w systemie Linux spowoduje','utworzenie archiwum dane.tar zawierające kopię katalogu /home','skopiowanie pliku dane.tar do katalogu /home','wyświetlenie informacji o zawartości pliku dane.tar','wyodrębnienie danych z archiwum o nazwie dane.tar',0,'','',3,NULL),(108,'Aby udrożnić zatkane dysze kartridża drukarki atramentowej, należy oczyścić dysze','środkiem smarującym.','alkoholem izopropylowym.','drobnym papierem ściernym.','za pomocą drucianego zmywaka.',0,'','',3,NULL),(109,'Zespoły doraźne powoływane są','do realizacji zadań powtarzalnych i przewidywalnych.','na stałe i są trwale umiejscowione w strukturze organizacji. ','na potrzeby realizacji nieprzewidzianych zadań lub rozwiązywania niespodziewanych problemów. ','do wykonania zaplanowanego i określonego projektu lub zadania.',0,'','',3,NULL),(110,'Oprogramowanie sprzętowe zainstalowane na stałe w urządzeniu, które umożliwia jego obsługę to w języku \nangielskim','shareware.','ransomware.','stealware.','firmware.',0,'','',3,NULL),(111,'Transmisja za pomocą fal radiowych korzystających z pasma ISM jest realizowana w interfejsie','HDMI ','FireWire','Bluetooth','IrDA',0,'','',3,NULL),(112,'Ile maksymalnie komputerów może być zaadresowanych w podsieci o adresie 192.168.1.0/25?','126','510','254','62',0,'','',3,NULL),(113,'','utworzenia polisy dla komputera o nazwie Stacja002, aby mógł łączyć się do rutera łączem\nprzewodowym.','rezerwacji adresu IP z puli adresów określonych przez serwer DHCP dla komputera o podanym\nadresie MAC.','klonowania adresu fizycznego rutera z puli testowej i zachowania go pod nazwą Stacja002.','zablokowania podanego adresu fizycznego urządzenia sieciowego w zakresie sieci LAN.',0,'','',3,NULL),(114,'Aby zagwarantować użytkownikom Active Directory możliwość zalogowania do domeny na wypadek awarii \nkontrolera domeny, należy','udostępnić użytkownikom numer do Help Desk.','przekopiować wszystkie zasoby sieci na każdy komputer w domenie.','dodać wszystkich użytkowników do grupy Administratorzy.','promować drugi kontroler domeny.',0,'','',3,NULL),(115,'W tabeli jest przedstawiony fragment procesu komunikacji serwera ze stacją roboczą przechwycony przez \nprogram Wireshark. Której usługi dotyczy ta komunikacja?','DNS','FTP','DHCP','WWW',1,'/f0730000-bb04-7aea-441b-08da293f57c2.JPG','',3,NULL),(116,'Protokół DNS odpowiada za','odwzorowanie nazw domenowych na adresy IP.','statyczne przydzielanie adresacji urządzeniom sieciowym.','automatyczne przydzielanie adresacji urządzeniom sieciowym.','odwzorowanie adresów fizycznych MAC na adresy IP.',0,'','',3,NULL),(117,'Zgodnie z zasadami etykiety związanymi ze spotkaniami służbowymi należy pamiętać, aby','mężczyźni całowali wszystkie kobiety w rękę.','wchodząc do miejsc publicznych pukać przed wejściem, z wyjątkiem pokoju szefa urzędu.','unikać nadmiernej gestykulacji oraz piskliwego i wysokiego tonu głosu.','nie przedstawiać się i bez pytania usiąść na wolnym krześle.',0,'','',3,NULL),(118,'W Wierszu polecenia wydano komendę: wykonaj.bat przyklad.txt\nWykonanie skryptu spowoduje','zabezpieczenie pliku przykład.txt hasłem hsr','nadanie dla pliku przykład.txt atrybutów ukryty, skompresowany, tylko do odczytu','nadanie dla pliku wykonaj.bat atrybutów ukryty, systemowy, tylko do odczytu','dopisanie ciągu znaków „hsr” do zawartości pliku wykonaj.bat',1,'/47ec0000-f683-928a-240f-08da37267d3d.png','',3,NULL),(119,'Parametrem określającym o ile zmniejszy się moc sygnału w danej parze przewodów po przejściu przez cały \ntor kablowy, jest','tłumienie.','przesłuch zdalny.','przesłuch zbliżny.','długość.',0,'','',3,NULL),(120,'Wskaż zakres grupy, który jest ustawiany domyślnie dla nowo utworzonej grupy w kontrolerze domeny \nsystemu Windows Serwer?','Uniwersalny.','Dystrybucyjny.','Globalny.','Lokalny.',0,'','',3,NULL);
/*!40000 ALTER TABLE `tasks` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-09-28  4:45:59
