SET DEFINE OFF;DELETE FROM VSDTRFCODE WHERE 1 = 1 AND NVL(TRFCODE,'NULL') = NVL('564.CANC.CAEV//EXWA','NULL');Insert into VSDTRFCODE   (TRFCODE, DESCRIPTION, VSDMT, STATUS, TYPE, TLTXCD, SEARCHCODE, FILTERNAME, REQTLTXCD, AUTOCONF, EN_DESCRIPTION, REJTLTXCD, TRFTYPE) Values   ('564.CANC.CAEV//EXWA', 'Hủy thông tin thanh toán chứng quyền', '564', 'Y', 'INF', '', '', '', '', 'N', '', '', 'DR');COMMIT;