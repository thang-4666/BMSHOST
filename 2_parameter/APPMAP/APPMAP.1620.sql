SET DEFINE OFF;DELETE FROM APPMAP WHERE 1 = 1 AND NVL(TLTXCD,'NULL') = NVL('1620','NULL');Insert into APPMAP   (TLTXCD, APPTYPE, APPTXCD, ACFLD, AMTEXP, COND, ACFLDREF, APPTYPEREF, FLDKEY, ISRUN, TRDESC, ODRNUM) Values   ('1620', 'TD', '0042', '03', '20', '', '', '', 'ACCTNO', '@1', 'Trả gốc cầm cố tiết kiệm, gửi ngày #17, số tiền gửi ban đầu #16', 5);Insert into APPMAP   (TLTXCD, APPTYPE, APPTXCD, ACFLD, AMTEXP, COND, ACFLDREF, APPTYPEREF, FLDKEY, ISRUN, TRDESC, ODRNUM) Values   ('1620', 'TD', '0044', '03', '21', '', '', '', 'ACCTNO', '@1', 'Trả lãi cầm cố tiết kiệm, gửi ngày #17, số tiền gửi ban đầu #16', 6);Insert into APPMAP   (TLTXCD, APPTYPE, APPTXCD, ACFLD, AMTEXP, COND, ACFLDREF, APPTYPEREF, FLDKEY, ISRUN, TRDESC, ODRNUM) Values   ('1620', 'TD', '0047', '03', '20', '', '', '', 'ACCTNO', '@1', 'Trả gốc cầm cố tiết kiệm, gửi ngày #17, số tiền gửi ban đầu #16', 7);Insert into APPMAP   (TLTXCD, APPTYPE, APPTXCD, ACFLD, AMTEXP, COND, ACFLDREF, APPTYPEREF, FLDKEY, ISRUN, TRDESC, ODRNUM) Values   ('1620', 'TD', '0045', '03', '21', '', '', '', 'ACCTNO', '@1', 'Trả lãi cầm cố tiết kiệm, gửi ngày #17, số tiền gửi ban đầu #16', 8);Insert into APPMAP   (TLTXCD, APPTYPE, APPTXCD, ACFLD, AMTEXP, COND, ACFLDREF, APPTYPEREF, FLDKEY, ISRUN, TRDESC, ODRNUM) Values   ('1620', 'TD', '0024', '03', '10', '', '', '', 'ACCTNO', '@1', 'Rút gốc tiết kiệm, gửi ngày #17, số tiền gửi ban đầu #16', 0);Insert into APPMAP   (TLTXCD, APPTYPE, APPTXCD, ACFLD, AMTEXP, COND, ACFLDREF, APPTYPEREF, FLDKEY, ISRUN, TRDESC, ODRNUM) Values   ('1620', 'TD', '0023', '03', '10', '', '', '', 'ACCTNO', '@1', 'Rút gốc tiết kiệm, gửi ngày #17, số tiền gửi ban đầu #16', 0);Insert into APPMAP   (TLTXCD, APPTYPE, APPTXCD, ACFLD, AMTEXP, COND, ACFLDREF, APPTYPEREF, FLDKEY, ISRUN, TRDESC, ODRNUM) Values   ('1620', 'TD', '0032', '03', '10--15', '', '', '', 'ACCTNO', '@1', '', 0);Insert into APPMAP   (TLTXCD, APPTYPE, APPTXCD, ACFLD, AMTEXP, COND, ACFLDREF, APPTYPEREF, FLDKEY, ISRUN, TRDESC, ODRNUM) Values   ('1620', 'CI', '0029', '05', '10', '', '', '', 'ACCTNO', '@1', 'Rút gốc tiết kiệm, gửi ngày #17, số tiền gửi ban đầu #16', 0);Insert into APPMAP   (TLTXCD, APPTYPE, APPTXCD, ACFLD, AMTEXP, COND, ACFLDREF, APPTYPEREF, FLDKEY, ISRUN, TRDESC, ODRNUM) Values   ('1620', 'CI', '0011', '05', '20', '', '03', 'TD', 'ACCTNO', '@1', 'Trả gốc cầm cố tiết kiệm, gửi ngày #17, số tiền gửi ban đầu #16', 3);Insert into APPMAP   (TLTXCD, APPTYPE, APPTXCD, ACFLD, AMTEXP, COND, ACFLDREF, APPTYPEREF, FLDKEY, ISRUN, TRDESC, ODRNUM) Values   ('1620', 'CI', '0011', '05', '21', '', '03', 'TD', 'ACCTNO', '@1', 'Trả lãi cầm cố tiết kiệm, gửi ngày #17, số tiền gửi ban đầu #16', 4);COMMIT;