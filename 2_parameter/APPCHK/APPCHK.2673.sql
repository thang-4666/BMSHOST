SET DEFINE OFF;DELETE FROM APPCHK WHERE 1 = 1 AND NVL(TLTXCD,'NULL') = NVL('2673','NULL');Insert into APPCHK   (TLTXCD, APPTYPE, ACFLD, RULECD, AMTEXP, FLDKEY, DELTDCHK, ISRUN, CHKLEV) Values   ('2673', 'SE', '05', '12', '12', 'ACCTNO', 'N', '@1', 0);Insert into APPCHK   (TLTXCD, APPTYPE, ACFLD, RULECD, AMTEXP, FLDKEY, DELTDCHK, ISRUN, CHKLEV) Values   ('2673', 'CI', '50', '01', '@ANT', 'ACCTNO', 'N', '51', 0);Insert into APPCHK   (TLTXCD, APPTYPE, ACFLD, RULECD, AMTEXP, FLDKEY, DELTDCHK, ISRUN, CHKLEV) Values   ('2673', 'SE', '05', '04', '22', 'ACCTNO', 'N', '@1', 0);Insert into APPCHK   (TLTXCD, APPTYPE, ACFLD, RULECD, AMTEXP, FLDKEY, DELTDCHK, ISRUN, CHKLEV) Values   ('2673', 'CF', '03', '01', '@A', 'ACCTNO', 'N', '@1', 0);COMMIT;