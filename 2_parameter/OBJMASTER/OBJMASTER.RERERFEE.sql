SET DEFINE OFF;DELETE FROM OBJMASTER WHERE 1 = 1 AND NVL(OBJNAME,'NULL') = NVL('RE.RERFEE','NULL');Insert into OBJMASTER   (MODCODE, OBJNAME, OBJTITLE, EN_OBJTITLE, USEAUTOID, CAREBYCHK, OBJBUTTONS) Values   ('RE', 'RE.RERFEE', 'Phí giảm trừ', 'Reduce fee', 'N', 'N', 'NNNNYYY');COMMIT;