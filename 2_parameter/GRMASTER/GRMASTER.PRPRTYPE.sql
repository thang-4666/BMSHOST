SET DEFINE OFF;DELETE FROM GRMASTER WHERE 1 = 1 AND NVL(OBJNAME,'NULL') = NVL('PR.PRTYPE','NULL');Insert into GRMASTER   (MODCODE, OBJNAME, ODRNUM, GRNAME, GRTYPE, GRBUTTONS, GRCAPTION, EN_GRCAPTION, CAREBYCHK, SEARCHCODE) Values   ('PR', 'PR.PRTYPE', 0, 'MAIN', 'N', 'NNNNNNNN', 'TT chung', 'Common', 'N', '');Insert into GRMASTER   (MODCODE, OBJNAME, ODRNUM, GRNAME, GRTYPE, GRBUTTONS, GRCAPTION, EN_GRCAPTION, CAREBYCHK, SEARCHCODE) Values   ('PR', 'PR.PRTYPE', 1, 'TYPEIDMAP', 'G', 'EEEENNNN', 'Loại hình', 'Product limit', 'N', 'TYPEIDMAP');COMMIT;