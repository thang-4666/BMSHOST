SET DEFINE OFF;DELETE FROM APPCHK WHERE 1 = 1 AND NVL(TLTXCD,'NULL') = NVL('8881','NULL');Insert into APPCHK   (TLTXCD, APPTYPE, ACFLD, RULECD, AMTEXP, FLDKEY, DELTDCHK, ISRUN, CHKLEV) Values   ('8881', 'OD', '01', '09', '@P', 'ORDERID', 'N', '@1', 0);COMMIT;