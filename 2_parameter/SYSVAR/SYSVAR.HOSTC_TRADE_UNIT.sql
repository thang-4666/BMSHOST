SET DEFINE OFF;DELETE FROM SYSVAR WHERE 1 = 1 AND NVL(VARNAME,'NULL') = NVL('HOSTC_TRADE_UNIT','NULL');Insert into SYSVAR   (GRNAME, VARNAME, VARVALUE, VARDESC, EN_VARDESC, EDITALLOW, STATUS, PSTATUS) Values   ('SYSTEM', 'HOSTC_TRADE_UNIT', '10', 'TRADE UNIT CUA SAN HCM', '', 'N', 'A', 'P');COMMIT;