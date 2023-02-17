SET DEFINE OFF;
     FROM SBSECURITIES SEC, SECURITIES_INFO SEINFO
      WHERE SEC.CODEID=SEINFO.CODEID
        AND SEC.SECTYPE <> ''004''
        and nvl(sec.refcodeid,''a'')=''a''
      ORDER BY SEC.SYMBOL', ' ', ' ', 'Y', 'Y', 'Y', ' ', ' ', 'Y', 'C', '', '', '', 'SYMBOL', '##########', '', '', '', '', 'C', 'N', 'MAIN', '', '', '', 'N', '', 'Y', '', 'N', '', '', '', 'N');