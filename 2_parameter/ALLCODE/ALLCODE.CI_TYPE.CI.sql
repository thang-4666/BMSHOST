SET DEFINE OFF;DELETE FROM ALLCODE WHERE 1 = 1 AND NVL(CDNAME,'NULL') = NVL('CI_TYPE','NULL') AND NVL(CDTYPE,'NULL') = NVL('CI','NULL');Insert into ALLCODE   (CDTYPE, CDNAME, CDVAL, CDCONTENT, LSTODR, CDUSER, EN_CDCONTENT, CHSTATUS) Values   ('CI', 'CI_TYPE', '001', 'Giao dịch có qua CI', 1, 'Y', 'Giao dịch có qua CI', 'C');Insert into ALLCODE   (CDTYPE, CDNAME, CDVAL, CDCONTENT, LSTODR, CDUSER, EN_CDCONTENT, CHSTATUS) Values   ('CI', 'CI_TYPE', '002', 'Giao dịch không qua CI', 2, 'Y', 'Giao dịch không qua CI', 'C');COMMIT;