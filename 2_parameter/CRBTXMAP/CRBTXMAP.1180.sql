SET DEFINE OFF;DELETE FROM CRBTXMAP WHERE 1 = 1 AND NVL(OBJNAME,'NULL') = NVL('1180','NULL');Insert into CRBTXMAP   (OBJTYPE, OBJNAME, TRFCODE, FLDBANK, FLDACCTNO, FLDBANKACCT, FLDREFCODE, FLDNOTES, AMTEXP, AFFECTDATE, SUBCOREBANK, AUTOGENRPT, GRPTRFCODE) Values   ('T', '1180', 'TRFSEFEE', '', '$03', '', '', '$30', '10', '<$TXDATE>', 'N', 'Y', '');COMMIT;