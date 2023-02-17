SET DEFINE OFF;
UNION ALL
SELECT  CDVAL VALUE, CDVAL VALUECD, CDCONTENT DISPLAY, EN_CDCONTENT EN_DISPLAY, CDCONTENT DESCRIPTION
FROM ALLCODE WHERE CDTYPE = ''CF'' AND CDNAME = ''CFSTATUS'' ', '', 'ALL', 'Y', 'N', 'Y', '', '', 'Y', 'C', '', '', '', '', '', '', '', '', '', '', '', '', 'Y', 'T', 'N');
FROM ( SELECT CDVAL, CDCONTENT, LSTODR FROM allcode WHERE cdtype = ''CF'' AND cdname = ''VIA'' AND CDVAL NOT IN ''F''
       UNION
       SELECT ''ALL'' CDVAL, ''ALL'' CDCONTENT, -1 LSTODR FROM DUAL )
 ORDER BY LSTODR', '', 'ALL', 'N', 'N', 'Y', '', '', 'Y', 'C', '', '', '', '', '', '', '', '', '', '', '', '', 'Y', 'T', 'N');