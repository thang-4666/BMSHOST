SET DEFINE OFF;
SELECT  CDVAL VALUECD, CDVAL VALUE, CDCONTENT DISPLAY FROM ALLCODE WHERE CDTYPE = ''OD'' AND CDNAME = ''BRKFEETYPE'' AND CDUSER=''Y'' ORDER BY LSTODR
', '', '', 'Y', 'N', 'Y', '', '', 'N', 'C', '', '', '', '', '', '', '', '', '', 'C', 'N', 'MAIN', '', '', '', 'N', '', 'Y', '', 'N', '', '', '', 'N');
    from sysvar 
    where grname = ''SYSTEM'' and varname = ''CLEARDAY''', 'Y', 'N', 'Y', '', '', 'N', 'N', '', '', '', '', '', '', '', '', '', 'T', 'N', 'MAIN', '', '', '', 'N', '', 'Y', '0', 'N', '', '', '', 'N');
SELECT *
  FROM (
         SELECT MST.CODEID VALUECD, MST.CODEID VALUE,
                to_char(MST.SYMBOL || '': '' || REFMST.FULLNAME) DISPLAY,
                to_char(MST.SYMBOL || '': '' || REFMST.FULLNAME) EN_DISPLAY,
                to_char(REFMST.FULLNAME) DESCRIPTION, to_char(MST.SYMBOL) SYMBOL
           FROM SBSECURITIES MST, ISSUERS REFMST
          WHERE REFMST.ISSUERID = MST.ISSUERID AND tradeplace <> ''006'' AND SECTYPE <> ''004'' UNION ALL SELECT  '''' VALUECD,
          '''' VALUE, ''--ALL--'' DISPLAY, ''--ALL--'' EN_DISPLAY, ''--ALL--'' DESCRIPTION,
          ''--ALL--'' SYMBOL FROM DUAL) ORDER BY symbol', '', '', 'Y', 'N', 'N', '', '', 'Y', 'C', '', '', '', '', '', '', '', '', '', 'C', 'N', 'MAIN', '', '', '', 'N', '', 'Y', '', 'N', '', '', '', 'N');
 =''Y'' ORDER BY LSTODR', '', '', 'Y', 'N', 'Y', '', '', 'N', 'C', '', '', '', '', '', '', '', '', '', 'C', 'N', 'MAIN', '', '', '', 'N', '', 'Y', '', 'N', '', '', '', 'N');