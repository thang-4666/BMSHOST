SET DEFINE OFF;
SELECT  v.*, (v.dfqtty + v.rcvqtty + v.carcvqtty + v.blockqtty)  SENDQTTY
FROM v_getdealinfo v WHERE  v.status in (''N'',''P'') and  v.dfqtty + v.rcvqtty + v.carcvqtty + v.blockqtty>0
', 'DFMAST', '', 'ACCTNO DESC', '2682', NULL, 50, 'N', 30, 'NYNNYYYNNN', 'Y', 'T', '', 'N', '', '');