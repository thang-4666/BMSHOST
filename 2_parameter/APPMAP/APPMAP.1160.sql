SET DEFINE OFF;DELETE FROM APPMAP WHERE 1 = 1 AND NVL(TLTXCD,'NULL') = NVL('1160','NULL');Insert into APPMAP   (TLTXCD, APPTYPE, APPTXCD, ACFLD, AMTEXP, COND, ACFLDREF, APPTYPEREF, FLDKEY, ISRUN, TRDESC, ODRNUM) Values   ('1160', 'CI', '0022', '03', '11', '', '03', 'CI', 'ACCTNO', '@1', '', 0);Insert into APPMAP   (TLTXCD, APPTYPE, APPTXCD, ACFLD, AMTEXP, COND, ACFLDREF, APPTYPEREF, FLDKEY, ISRUN, TRDESC, ODRNUM) Values   ('1160', 'CI', '0030', '03', '<$BUSDATE>', '', '', '', 'ACCTNO', '@1', '', 0);Insert into APPMAP   (TLTXCD, APPTYPE, APPTXCD, ACFLD, AMTEXP, COND, ACFLDREF, APPTYPEREF, FLDKEY, ISRUN, TRDESC, ODRNUM) Values   ('1160', 'CI', '0041', '03', '<$BUSDATE>', '', '', '', 'ACCTNO', '@1', '', 0);COMMIT;