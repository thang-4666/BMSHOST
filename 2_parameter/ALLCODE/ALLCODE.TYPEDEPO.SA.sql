SET DEFINE OFF;DELETE FROM ALLCODE WHERE 1 = 1 AND NVL(CDNAME,'NULL') = NVL('TYPEDEPO','NULL') AND NVL(CDTYPE,'NULL') = NVL('SA','NULL');Insert into ALLCODE   (CDTYPE, CDNAME, CDVAL, CDCONTENT, LSTODR, CDUSER, EN_CDCONTENT, CHSTATUS) Values   ('SA', 'TYPEDEPO', 'N', 'Lưu ký mới', 1, 'Y', 'Lưu ký mới', 'C');Insert into ALLCODE   (CDTYPE, CDNAME, CDVAL, CDCONTENT, LSTODR, CDUSER, EN_CDCONTENT, CHSTATUS) Values   ('SA', 'TYPEDEPO', 'O', 'Đã lưu ký tại BMSC', 2, 'Y', 'Đã lưu ký tại BMSC', 'C');COMMIT;