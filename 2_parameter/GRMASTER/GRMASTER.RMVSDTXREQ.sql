SET DEFINE OFF;DELETE FROM GRMASTER WHERE 1 = 1 AND NVL(OBJNAME,'NULL') = NVL('RM.VSDTXREQ','NULL');Insert into GRMASTER   (MODCODE, OBJNAME, ODRNUM, GRNAME, GRTYPE, GRBUTTONS, GRCAPTION, EN_GRCAPTION, CAREBYCHK, SEARCHCODE) Values   ('RM', 'RM.VSDTXREQ', 0, 'MAIN', 'N', 'NNNNNNNN', 'TT chung', 'Common', 'N', '');Insert into GRMASTER   (MODCODE, OBJNAME, ODRNUM, GRNAME, GRTYPE, GRBUTTONS, GRCAPTION, EN_GRCAPTION, CAREBYCHK, SEARCHCODE) Values   ('RM', 'RM.VSDTXREQ', 1, 'VSDTXMAPEXT', 'G', 'EEEENNNN', 'Điện gửi lên VSD', 'External', 'N', 'VSDTXMAPEXT');Insert into GRMASTER   (MODCODE, OBJNAME, ODRNUM, GRNAME, GRTYPE, GRBUTTONS, GRCAPTION, EN_GRCAPTION, CAREBYCHK, SEARCHCODE) Values   ('RM', 'RM.VSDTXREQ', 2, 'VSDTRFLOGDTL', 'G', 'EEEENNNN', 'Điện nhận về từ VSD', 'External', 'N', 'VSDTRFLOGDTL');COMMIT;