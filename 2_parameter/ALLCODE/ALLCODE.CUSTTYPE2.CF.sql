SET DEFINE OFF;DELETE FROM ALLCODE WHERE 1 = 1 AND NVL(CDNAME,'NULL') = NVL('CUSTTYPE2','NULL') AND NVL(CDTYPE,'NULL') = NVL('CF','NULL');Insert into ALLCODE   (CDTYPE, CDNAME, CDVAL, CDCONTENT, LSTODR, CDUSER, EN_CDCONTENT, CHSTATUS) Values   ('CF', 'CUSTTYPE2', '000', 'ALL', -1, 'Y', 'ALL', 'C');Insert into ALLCODE   (CDTYPE, CDNAME, CDVAL, CDCONTENT, LSTODR, CDUSER, EN_CDCONTENT, CHSTATUS) Values   ('CF', 'CUSTTYPE2', '001', 'Cá nhân trong nước', 0, 'Y', 'Cá nhân trong nước', 'C');Insert into ALLCODE   (CDTYPE, CDNAME, CDVAL, CDCONTENT, LSTODR, CDUSER, EN_CDCONTENT, CHSTATUS) Values   ('CF', 'CUSTTYPE2', '002', 'Tổ chức trong nước', 1, 'Y', 'Tổ chức trong nước', 'C');Insert into ALLCODE   (CDTYPE, CDNAME, CDVAL, CDCONTENT, LSTODR, CDUSER, EN_CDCONTENT, CHSTATUS) Values   ('CF', 'CUSTTYPE2', '003', 'Cá nhân nước ngoài', 2, 'Y', 'Cá nhân nước ngoài', 'C');Insert into ALLCODE   (CDTYPE, CDNAME, CDVAL, CDCONTENT, LSTODR, CDUSER, EN_CDCONTENT, CHSTATUS) Values   ('CF', 'CUSTTYPE2', '004', 'Tổ chức nước ngoài', 3, 'Y', 'Tổ chức nước ngoài', 'C');COMMIT;