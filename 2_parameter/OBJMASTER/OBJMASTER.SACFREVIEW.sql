SET DEFINE OFF;DELETE FROM OBJMASTER WHERE 1 = 1 AND NVL(OBJNAME,'NULL') = NVL('SA.CFREVIEW','NULL');Insert into OBJMASTER   (MODCODE, OBJNAME, OBJTITLE, EN_OBJTITLE, USEAUTOID, CAREBYCHK, OBJBUTTONS) Values   ('SA', 'SA.CFREVIEW', 'Thông tin kỳ review khách hàng', 'Review customer', 'Y', 'N', 'NNNYYYY');COMMIT;