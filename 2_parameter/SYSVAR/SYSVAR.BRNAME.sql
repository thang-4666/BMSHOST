SET DEFINE OFF;DELETE FROM SYSVAR WHERE 1 = 1 AND NVL(VARNAME,'NULL') = NVL('BRNAME','NULL');Insert into SYSVAR   (GRNAME, VARNAME, VARVALUE, VARDESC, EN_VARDESC, EDITALLOW, STATUS, PSTATUS) Values   ('SYSTEM', 'BRNAME', 'CÔNG TY CỔ PHẦN CHỨNG KHOÁN BẢO MINH', 'Branch name', '', 'N', 'A', 'P');COMMIT;