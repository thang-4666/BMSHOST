SET DEFINE OFF;DELETE FROM CRBTXMAP WHERE 1 = 1 AND NVL(OBJNAME,'NULL') = NVL('6665','NULL');Insert into CRBTXMAP   (OBJTYPE, OBJNAME, TRFCODE, FLDBANK, FLDACCTNO, FLDBANKACCT, FLDREFCODE, FLDNOTES, AMTEXP, AFFECTDATE, SUBCOREBANK, AUTOGENRPT, GRPTRFCODE) Values   ('T', '6665', 'TRFODSELL', '$95', '$03', '$93', '$04', '$30', '10', '$08', 'Y', 'N', '');COMMIT;