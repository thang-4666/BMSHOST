SET DEFINE OFF;
to_date(substr(a.BACKUPDT,1,10),''DD/MM/YYYY'') BKDATE,substr(a.BACKUPDT,12,8) BKTIME,
to_date(substr(a.IMPORTDT,1,10),''DD/MM/YYYY'') IMPDATE,substr(a.IMPORTDT,12,8) IMPTIME from secbaskethist a, sbsecurities b where a.symbol=b.symbol
', 'SECURITIES_INFO', '', '', '', NULL, 50, 'N', 30, '', 'Y', 'T', '', 'N', '', '');