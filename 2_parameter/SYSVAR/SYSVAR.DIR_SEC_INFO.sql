SET DEFINE OFF;DELETE FROM SYSVAR WHERE 1 = 1 AND NVL(VARNAME,'NULL') = NVL('DIR_SEC_INFO','NULL');Insert into SYSVAR   (GRNAME, VARNAME, VARVALUE, VARDESC, EN_VARDESC, EDITALLOW, STATUS, PSTATUS) Values   ('SYSTEM', 'DIR_SEC_INFO', 'SECURITY.DAT', '', '', 'N', 'A', 'P');COMMIT;