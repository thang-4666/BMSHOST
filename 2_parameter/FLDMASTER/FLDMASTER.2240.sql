SET DEFINE OFF;
        FROM SBSECURITIES SEC, SECURITIES_INFO SEINFO, ISSUERS ISS
           WHERE SEC.CODEID=SEINFO.CODEID
               AND SEC.SECTYPE <> ''004''
               AND SEC.issuerid= ISS.issuerid
              ORDER BY SEC.SYMBOL', ' ', ' ', 'Y', 'N', 'Y', ' ', ' ', 'Y', 'C', '', '', '', 'CODEID', '##########', '', 'SEC_NAME', 'SA', '', 'C', 'N', 'MAIN', '', '', '', 'N', 'P_CODEID', 'Y', '', 'N', '', '', '', 'N');
        FROM ALLCODE AL WHERE CDNAME =''YESNO'' AND CDTYPE =''SY''', ' ', ' ', 'Y', 'N', 'Y', ' ', ' ', 'Y', 'C', '', '', '', 'ISCONFIRM', '##########', '', '', '', '', 'C', 'N', 'MAIN', '', '', '', 'N', '', 'Y', '', 'N', '', '', '', 'N');