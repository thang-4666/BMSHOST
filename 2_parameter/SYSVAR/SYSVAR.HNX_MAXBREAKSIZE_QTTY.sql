SET DEFINE OFF;DELETE FROM SYSVAR WHERE 1 = 1 AND NVL(VARNAME,'NULL') = NVL('HNX_MAXBREAKSIZE_QTTY','NULL');Insert into SYSVAR   (GRNAME, VARNAME, VARVALUE, VARDESC, EN_VARDESC, EDITALLOW, STATUS, PSTATUS) Values   ('SYSTEM', 'HNX_MAXBREAKSIZE_QTTY', '99900', 'Khá»‘i lÆ°á»£ng tÃ¡ch lá»‡nh tá»‘i Ä‘a', 'HSX: Maximum quantiy break size', 'N', 'A', 'P');COMMIT;