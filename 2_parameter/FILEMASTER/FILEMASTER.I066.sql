SET DEFINE OFF;DELETE FROM FILEMASTER WHERE 1 = 1 AND NVL(FILECODE,'NULL') = NVL('I066','NULL');Insert into FILEMASTER   (EORI, FILECODE, FILENAME, FILEPATH, TABLENAME, SHEETNAME, ROWTITLE, DELTD, EXTENTION, PAGE, PROCNAME, PROCFILLTER, OVRRQD, MODCODE, RPTID, CMDCODE, EXCELFILENAME) Values   ('T', 'I066', 'Import đổi CAREBY', '', 'TBLCHANGECAREBY', '1', 1, 'N', '.xls', 100, 'PR_FILE_TBLCHANGECAREBY', 'FILLTER_TBLCHANGECAREBY', 'Y', '', '', 'CF', 'IMPORT_CAREBY');COMMIT;