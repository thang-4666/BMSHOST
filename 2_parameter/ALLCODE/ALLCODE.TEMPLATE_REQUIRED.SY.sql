SET DEFINE OFF;DELETE FROM ALLCODE WHERE 1 = 1 AND NVL(CDNAME,'NULL') = NVL('TEMPLATE_REQUIRED','NULL') AND NVL(CDTYPE,'NULL') = NVL('SY','NULL');Insert into ALLCODE   (CDTYPE, CDNAME, CDVAL, CDCONTENT, LSTODR, CDUSER, EN_CDCONTENT, CHSTATUS) Values   ('SY', 'TEMPLATE_REQUIRED', 'Y', 'Bắt buộc đăng ký', 1, 'Y', 'Require register to receive', 'C');Insert into ALLCODE   (CDTYPE, CDNAME, CDVAL, CDCONTENT, LSTODR, CDUSER, EN_CDCONTENT, CHSTATUS) Values   ('SY', 'TEMPLATE_REQUIRED', 'N', 'Không cần đăng ký', 2, 'Y', 'Alway receive', 'C');COMMIT;