SET DEFINE OFF;
     FROM SBSECURITIES SEC, SECURITIES_INFO SEINFO
      WHERE SEC.CODEID=SEINFO.CODEID
        AND SEC.SECTYPE <> ''004''
      ORDER BY SEC.SYMBOL', ' ', ' ', 'Y', 'Y', 'N', ' ', ' ', 'Y', 'C', '', '', '', 'CODEID', '##########', '', '', '', '', 'T', 'N', 'MAIN', '', '', '', 'N', '', 'Y', '', 'N', '', '', '', 'N');