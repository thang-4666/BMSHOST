SET DEFINE OFF;DELETE FROM CRBTXMAPEXT WHERE 1 = 1 AND NVL(OBJNAME,'NULL') = NVL('6666','NULL');Insert into CRBTXMAPEXT   (OBJTYPE, OBJNAME, TRFCODE, FLDNAME, FLDTYPE, AMTEXP, CMDSQL) Values   ('T', '6666', 'TRFODSFEE', 'SECACCOUNT', 'C', '$03', '');Insert into CRBTXMAPEXT   (OBJTYPE, OBJNAME, TRFCODE, FLDNAME, FLDTYPE, AMTEXP, CMDSQL) Values   ('T', '6666', 'TRFODSFEE', 'BANKACCTNO', 'C', '$93', '');Insert into CRBTXMAPEXT   (OBJTYPE, OBJNAME, TRFCODE, FLDNAME, FLDTYPE, AMTEXP, CMDSQL) Values   ('T', '6666', 'TRFODSFEE', 'ORDERID', 'C', '$04', '');Insert into CRBTXMAPEXT   (OBJTYPE, OBJNAME, TRFCODE, FLDNAME, FLDTYPE, AMTEXP, CMDSQL) Values   ('T', '6666', 'TRFODSFEE', 'TXNUM', 'C', '$11', '');Insert into CRBTXMAPEXT   (OBJTYPE, OBJNAME, TRFCODE, FLDNAME, FLDTYPE, AMTEXP, CMDSQL) Values   ('T', '6666', 'TRFODSFEE', 'CUSTNAME', 'C', '$90', '');Insert into CRBTXMAPEXT   (OBJTYPE, OBJNAME, TRFCODE, FLDNAME, FLDTYPE, AMTEXP, CMDSQL) Values   ('T', '6666', 'TRFODSFEE', 'DESACCTNO', 'C', '$05', '');Insert into CRBTXMAPEXT   (OBJTYPE, OBJNAME, TRFCODE, FLDNAME, FLDTYPE, AMTEXP, CMDSQL) Values   ('T', '6666', 'TRFODSFEE', 'DESACCTNAME', 'C', '$07', '');Insert into CRBTXMAPEXT   (OBJTYPE, OBJNAME, TRFCODE, FLDNAME, FLDTYPE, AMTEXP, CMDSQL) Values   ('T', '6666', 'TRFODSFEE', 'BANKNAME', 'C', '$94', '');COMMIT;