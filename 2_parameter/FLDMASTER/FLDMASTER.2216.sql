SET DEFINE OFF;
        FROM SBSECURITIES SEC, ISSUERS ISS
           WHERE SEC.SECTYPE = ''006'' and sec.refcodeid is null AND SEC.issuerid= ISS.issuerid
              ORDER BY SEC.SYMBOL', ' ', ' ', 'Y', 'N', 'Y', ' ', ' ', 'Y', 'C', '', '', '', 'CODEID', '##########', '', 'SEC_NAME', 'SA', '', 'C', 'N', 'MAIN', '', '', '', 'N', 'P_CODEID', 'Y', '', 'N', '', '', '', 'N');
  (CASE WHEN CDVAL=''BONSEL'' THEN 1 ELSE 0 END) CHKQTTY
  FROM ALLCODE WHERE CDTYPE=''SA'' AND CDNAME=''IBDEALTYPE'' AND CDVAL IN (''BONIPO'',''BONBUY'',''BONSEL'')', ' ', 'I', 'Y', 'N', 'Y', ' ', ' ', 'Y', 'C', '', '', '', 'BORS', '##########', '', '', '', '', 'C', 'N', 'MAIN', '', '', '', 'N', '', 'Y', '', 'N', '', '', '', 'N');
        FROM ALLCODE WHERE CDTYPE=''SY'' AND CDNAME=''ISRUN''', ' ', '0', 'Y', 'Y', 'N', ' ', ' ', 'Y', 'C', '', '', '', 'CHKQTTY', '##########', '08CHKQTTY', '', 'SA', '', 'C', 'N', 'MAIN', '', '', '', 'N', 'P_CODEID', 'Y', '', 'N', '', '', '', 'N');