SET DEFINE OFF;DELETE FROM VSDTRFCODE WHERE 1 = 1 AND NVL(TRFCODE,'NULL') = NVL('564.REPL.CAEV//DVSE','NULL');Insert into VSDTRFCODE   (TRFCODE, DESCRIPTION, VSDMT, STATUS, TYPE, TLTXCD, SEARCHCODE, FILTERNAME, REQTLTXCD, AUTOCONF, EN_DESCRIPTION, REJTLTXCD, TRFTYPE) Values   ('564.REPL.CAEV//DVSE', 'Thay đổi thông tin quyền chia cổ tức bằng cổ phiếu', '564', 'Y', 'INF', '', '', '', '', 'N', '', '', 'DR');COMMIT;