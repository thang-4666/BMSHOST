SET DEFINE OFF;DELETE FROM SYSVAR WHERE 1 = 1 AND NVL(VARNAME,'NULL') = NVL('BONDCLEARINGAUTO','NULL');Insert into SYSVAR   (GRNAME, VARNAME, VARVALUE, VARDESC, EN_VARDESC, EDITALLOW, STATUS, PSTATUS) Values   ('SYSTEM', 'BONDCLEARINGAUTO', 'M', 'Active luồng xử lý tự động thanh toán bù trừ TP T + 1.5 (A-Auto/M-Manual)', 'Active stream processing automatic clearing Bond T + 1.5 (A-Auto/M-Manual)', 'Y', 'A', 'APAPAPAPAPAP');COMMIT;