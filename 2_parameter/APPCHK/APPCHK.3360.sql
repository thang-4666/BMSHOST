SET DEFINE OFF;DELETE FROM APPCHK WHERE 1 = 1 AND NVL(TLTXCD,'NULL') = NVL('3360','NULL');Insert into APPCHK   (TLTXCD, APPTYPE, ACFLD, RULECD, AMTEXP, FLDKEY, DELTDCHK, ISRUN, CHKLEV) Values   ('3360', 'CA', '01', '02', '@AS', 'AUTOID', 'N', '@1', 0);Insert into APPCHK   (TLTXCD, APPTYPE, ACFLD, RULECD, AMTEXP, FLDKEY, DELTDCHK, ISRUN, CHKLEV) Values   ('3360', 'CI', '03', '01', '@ATG', 'ACCTNO', 'N', '@1', 0);Insert into APPCHK   (TLTXCD, APPTYPE, ACFLD, RULECD, AMTEXP, FLDKEY, DELTDCHK, ISRUN, CHKLEV) Values   ('3360', 'SE', '08', '01', '@A', 'ACCTNO', 'N', '@1', 0);Insert into APPCHK   (TLTXCD, APPTYPE, ACFLD, RULECD, AMTEXP, FLDKEY, DELTDCHK, ISRUN, CHKLEV) Values   ('3360', 'SE', '09', '01', '@A', 'ACCTNO', 'N', '@1', 0);Insert into APPCHK   (TLTXCD, APPTYPE, ACFLD, RULECD, AMTEXP, FLDKEY, DELTDCHK, ISRUN, CHKLEV) Values   ('3360', 'SE', '09', '03', '13', 'ACCTNO', 'N', '@1', 0);COMMIT;