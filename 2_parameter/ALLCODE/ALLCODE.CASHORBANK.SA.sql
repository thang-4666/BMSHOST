SET DEFINE OFF;DELETE FROM ALLCODE WHERE 1 = 1 AND NVL(CDNAME,'NULL') = NVL('CASHORBANK','NULL') AND NVL(CDTYPE,'NULL') = NVL('SA','NULL');Insert into ALLCODE   (CDTYPE, CDNAME, CDVAL, CDCONTENT, LSTODR, CDUSER, EN_CDCONTENT, CHSTATUS) Values   ('SA', 'CASHORBANK', 'C', 'Quỹ công ty', 0, 'Y', 'Cash', 'C');Insert into ALLCODE   (CDTYPE, CDNAME, CDVAL, CDCONTENT, LSTODR, CDUSER, EN_CDCONTENT, CHSTATUS) Values   ('SA', 'CASHORBANK', 'B', 'Quỹ ngân hàng', 1, 'Y', 'Bank', 'C');COMMIT;