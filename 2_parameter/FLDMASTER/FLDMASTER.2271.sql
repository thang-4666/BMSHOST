SET DEFINE OFF;
   FROM SBSECURITIES SB,SECURITIES_INFO SEC 
     WHERE SB.CODEID=SEC.CODEID
        AND SB.SECTYPE <> ''004''
      ORDER BY SB.SYMBOL', ' ', ' ', 'Y', 'N', 'Y', ' ', ' ', 'Y', 'C', '', '', '', 'CODEID', '##########', '', '', '', '', 'C', 'N', 'MAIN', '', '', '', 'N', '', 'Y', '', 'N', '', '', '', 'N');