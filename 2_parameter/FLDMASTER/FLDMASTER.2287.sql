SET DEFINE OFF;
    FROM SBSECURITIES SEC, SECURITIES_INFO SEINFO, ISSUERS ISS
      WHERE SEC.CODEID=SEINFO.CODEID
        AND SEC.issuerid= ISS.issuerid
        AND SEC.SECTYPE <> ''004''
       ORDER BY SEC.SYMBOL', ' ', ' ', 'Y', 'N', 'Y', ' ', ' ', 'Y', 'C', '', '', '', 'CODEID', '##########', '', '', '', '', 'C', 'N', 'MAIN', '', '', '', 'N', 'P_CODEID', 'Y', '', 'N', '', '', '', 'N');