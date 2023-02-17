SET DEFINE OFF;
      FROM SBSECURITIES SEC, SECURITIES_INFO SEINFO
        WHERE SEC.CODEID=SEINFO.CODEID
          AND SEC.SECTYPE <> ''004''
            ORDER BY SEC.SYMBOL', ' ', ' ', 'Y', 'N', 'Y', ' ', ' ', 'Y', 'C', '', '', '', 'CODEID', '##########', '', 'SEC_NAME', 'SA', '', 'C', 'N', 'MAIN', '', '', '', 'N', '', 'Y', '', 'N', '', '', '', 'N');
SELECT CDVAL VALUECD, CDVAL VALUE, CDCONTENT DISPLAY, CDCONTENT EN_DISPLAY, CDCONTENT DESCRIPTION
FROM ALLCODE WHERE CDTYPE=''SE'' AND CDNAME=''QTTYTYPE'' AND CDVAL IN (''002'',''007'') ORDER BY CDVAL
', ' ', '007', 'Y', 'N', 'Y', ' ', ' ', 'Y', 'C', '', '', '', 'QTTYTYPE', '##########', '', '', '', '', 'C', 'N', 'MAIN', '', '', '', 'N', '', 'Y', '', 'N', '', '', '', 'N');