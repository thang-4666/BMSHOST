SET DEFINE OFF;DELETE FROM FILEMASTER WHERE 1 = 1 AND NVL(FILECODE,'NULL') = NVL('I063','NULL');Insert into FILEMASTER   (EORI, FILECODE, FILENAME, FILEPATH, TABLENAME, SHEETNAME, ROWTITLE, DELTD, EXTENTION, PAGE, PROCNAME, PROCFILLTER, OVRRQD, MODCODE, RPTID, CMDCODE, EXCELFILENAME) Values   ('T', 'I063', 'Import đổi loại hình tiểu khoản', '', 'TBLCHANGEAFTYPE', '1', 1, 'N', '.xls', 100, 'PR_FILE_TBLCHANGEAFTYPE', 'FILLTER_TBLCHANGEAFTYPE', 'Y', '', '', 'CF', '');COMMIT;