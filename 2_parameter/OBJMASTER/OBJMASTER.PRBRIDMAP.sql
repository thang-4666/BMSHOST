SET DEFINE OFF;DELETE FROM OBJMASTER WHERE 1 = 1 AND NVL(OBJNAME,'NULL') = NVL('PR.BRIDMAP','NULL');Insert into OBJMASTER   (MODCODE, OBJNAME, OBJTITLE, EN_OBJTITLE, USEAUTOID, CAREBYCHK, OBJBUTTONS) Values   ('PR', 'PR.BRIDMAP', 'DS chi nhánh', 'Branch ', 'Y', 'N', 'NNNNYYY');COMMIT;