SET DEFINE OFF;DELETE FROM ALLCODE WHERE 1 = 1 AND NVL(CDNAME,'NULL') = NVL('ALLOCTYP','NULL') AND NVL(CDTYPE,'NULL') = NVL('PR','NULL');Insert into ALLCODE   (CDTYPE, CDNAME, CDVAL, CDCONTENT, LSTODR, CDUSER, EN_CDCONTENT, CHSTATUS) Values   ('PR', 'ALLOCTYP', 'T', 'Tạm thời', 0, 'Y', 'Temporary', 'C');Insert into ALLCODE   (CDTYPE, CDNAME, CDVAL, CDCONTENT, LSTODR, CDUSER, EN_CDCONTENT, CHSTATUS) Values   ('PR', 'ALLOCTYP', 'M', 'Đã đánh dấu', 1, 'Y', 'Marked', 'C');COMMIT;