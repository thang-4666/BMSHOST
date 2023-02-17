SET DEFINE OFF;
 FROM SBSECURITIES SEC, SECURITIES_INFO SEINFO
  WHERE SEC.CODEID=SEINFO.CODEID
  AND SEC.SECTYPE <> ''004''
   ORDER BY SEC.SYMBOL', ' ', ' ', 'Y', 'Y', 'N', ' ', ' ', 'N', 'C', '', '', '', 'SYMBOL', '##########', '', '', '', '', 'C', 'N', 'MAIN', '', '', '', 'N', '', 'Y', '', 'N', '', '', '', 'N');
FROM ALLCODE WHERE CDNAME = ''CONFIRM_STATUS'' AND CDTYPE=''ST'' AND CDUSER=''Y''
ORDER BY LSTODR', '', 'CONF', 'Y', 'Y', 'Y', ' ', ' ', 'Y', 'C', '', '', '', 'CONFIRMSTATUS', '##########', '', '', '', '', 'C', 'N', 'MAIN', '', '', '', 'N', '', 'Y', '', 'N', '', '', '', 'N');