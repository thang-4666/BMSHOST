SET DEFINE OFF;
WHERE cdname = ''VSDPAYTYPE'' AND cdtype = ''CA'' AND cduser = ''Y'' ORDER BY lstodr', ' ', 'CASH', 'Y', 'N', 'Y', ' ', ' ', 'Y', 'C', '', '', '', 'VSDPAYTYPE', '##########', '', '', '', '', 'C', 'N', 'MAIN', '', '', '', 'N', '', 'Y', '', 'N', '', '', '', 'N');
     FROM SBSECURITIES SEC, SECURITIES_INFO SEINFO
      WHERE SEC.CODEID=SEINFO.CODEID
        AND SEC.SECTYPE <> ''004''
        and nvl(sec.refcodeid,''a'') =''a''
      ORDER BY SEC.SYMBOL', ' ', ' ', 'Y', 'Y', 'Y', ' ', ' ', 'Y', 'C', '', '', '', 'CODEID', '##########', '', '', '', '', 'C', 'N', 'MAIN', '', '', '', 'N', '', 'Y', '', 'N', '', '', '', 'N');