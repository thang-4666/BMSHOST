SET DEFINE OFF;DELETE FROM VSDTRFCODE WHERE 1 = 1 AND NVL(TRFCODE,'NULL') = NVL('542.NEWM.SETR//REDI..NAK','NULL');Insert into VSDTRFCODE   (TRFCODE, DESCRIPTION, VSDMT, STATUS, TYPE, TLTXCD, SEARCHCODE, FILTERNAME, REQTLTXCD, AUTOCONF, EN_DESCRIPTION, REJTLTXCD, TRFTYPE) Values   ('542.NEWM.SETR//REDI..NAK', 'Điện rút chứng khoán bị NAK', '542', 'Y', 'NAK', '2294', '', '', '2292', 'Y', '', '', 'DR');COMMIT;