SET DEFINE OFF;DELETE FROM ALLCODE WHERE 1 = 1 AND NVL(CDNAME,'NULL') = NVL('ACTYPE','NULL') AND NVL(CDTYPE,'NULL') = NVL('GL','NULL');Insert into ALLCODE   (CDTYPE, CDNAME, CDVAL, CDCONTENT, LSTODR, CDUSER, EN_CDCONTENT, CHSTATUS) Values   ('GL', 'ACTYPE', 'A', 'Tài sản', 0, 'Y', 'Tài sản', 'C');Insert into ALLCODE   (CDTYPE, CDNAME, CDVAL, CDCONTENT, LSTODR, CDUSER, EN_CDCONTENT, CHSTATUS) Values   ('GL', 'ACTYPE', 'C', 'Vốn', 1, 'Y', 'Vốn', 'C');Insert into ALLCODE   (CDTYPE, CDNAME, CDVAL, CDCONTENT, LSTODR, CDUSER, EN_CDCONTENT, CHSTATUS) Values   ('GL', 'ACTYPE', 'E', 'Chi phí', 2, 'Y', 'Chi phí', 'C');Insert into ALLCODE   (CDTYPE, CDNAME, CDVAL, CDCONTENT, LSTODR, CDUSER, EN_CDCONTENT, CHSTATUS) Values   ('GL', 'ACTYPE', 'I', 'Thu nhập', 3, 'Y', 'Thu nhập', 'C');Insert into ALLCODE   (CDTYPE, CDNAME, CDVAL, CDCONTENT, LSTODR, CDUSER, EN_CDCONTENT, CHSTATUS) Values   ('GL', 'ACTYPE', 'L', 'Phải trả', 4, 'Y', 'Phải trả', 'C');Insert into ALLCODE   (CDTYPE, CDNAME, CDVAL, CDCONTENT, LSTODR, CDUSER, EN_CDCONTENT, CHSTATUS) Values   ('GL', 'ACTYPE', 'M', 'Ngoại bảng', 5, 'Y', 'Ngoại bảng', 'C');Insert into ALLCODE   (CDTYPE, CDNAME, CDVAL, CDCONTENT, LSTODR, CDUSER, EN_CDCONTENT, CHSTATUS) Values   ('GL', 'ACTYPE', 'B', 'Ngân hàng', 6, 'Y', 'Bank', 'C');COMMIT;