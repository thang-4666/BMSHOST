SET DEFINE OFF;DELETE FROM ALLCODE WHERE 1 = 1 AND NVL(CDNAME,'NULL') = NVL('INTPERIODCD','NULL') AND NVL(CDTYPE,'NULL') = NVL('SE','NULL');Insert into ALLCODE   (CDTYPE, CDNAME, CDVAL, CDCONTENT, LSTODR, CDUSER, EN_CDCONTENT, CHSTATUS) Values   ('SE', 'INTPERIODCD', 'M', 'Hằng tháng', 0, 'Y', 'Hằng tháng', 'C');Insert into ALLCODE   (CDTYPE, CDNAME, CDVAL, CDCONTENT, LSTODR, CDUSER, EN_CDCONTENT, CHSTATUS) Values   ('SE', 'INTPERIODCD', 'Q', 'Hằng quý', 1, 'Y', 'Hằng quý', 'C');Insert into ALLCODE   (CDTYPE, CDNAME, CDVAL, CDCONTENT, LSTODR, CDUSER, EN_CDCONTENT, CHSTATUS) Values   ('SE', 'INTPERIODCD', 'H', 'Hằng nửa năm', 2, 'Y', 'Hằng nửa năm', 'C');Insert into ALLCODE   (CDTYPE, CDNAME, CDVAL, CDCONTENT, LSTODR, CDUSER, EN_CDCONTENT, CHSTATUS) Values   ('SE', 'INTPERIODCD', 'Y', 'Hằng năm', 3, 'Y', 'Hằng năm', 'C');COMMIT;