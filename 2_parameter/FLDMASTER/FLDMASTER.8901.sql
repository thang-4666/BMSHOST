SET DEFINE OFF;
     FROM SBSECURITIES SEC, SECURITIES_INFO SEINFO
      WHERE SEC.CODEID=SEINFO.CODEID
        AND SEC.SECTYPE <> ''004''
      ORDER BY SEC.SYMBOL', ' ', ' ', 'Y', 'N', 'Y', ' ', ' ', 'Y', 'C', '', '', '', 'CODEID', '##########', '', '', '', '', 'C', 'N', 'MAIN', '', '', '', 'N', '', 'Y', '', 'N', '', '', '', 'N');
    (CASE WHEN CDVAL=''S'' THEN 1 ELSE 0 END) CHKQTTY
    FROM ALLCODE WHERE CDTYPE=''SA'' AND CDNAME=''BONDBORS'' AND CDVAL IN (''B'',''S'')', ' ', 'I', 'Y', 'N', 'Y', ' ', ' ', 'Y', 'C', '', '', '', 'BORS', '##########', '', '', '', '', 'C', 'N', 'MAIN', '', '', '', 'N', '', 'Y', '', 'N', '', '', '', 'N');