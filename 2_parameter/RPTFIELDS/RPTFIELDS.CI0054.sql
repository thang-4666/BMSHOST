SET DEFINE OFF;
FROM (SELECT SHORTNAME, FULLNAME,1 LSTODR FROM BANKNOSTRO  UNION SELECT ''ALL'' SHORTNAME, ''ALL'' FULLNAME, -1 LSTODR FROM DUAL)
 ORDER BY LSTODR', '', 'ALL', 'Y', 'N', 'Y', '', '', 'Y', 'C', '', '', '', '', '', '', 'BANKNOSTRO', 'SA', '', '', '', '', 'Y', 'T', 'N');
(SELECT ''ALL'' CDVAL ,''ALL'' cdcontent ,-1 LSTODR FROM DUAL
UNION ALL
SELECT CDVAL , cdcontent , LSTODR FROM ALLCODE WHERE CDTYPE=''CF'' AND CDNAME=''PRODUCTTYPE''
)ORDER BY LSTODR', '', 'ALL', 'Y', 'N', 'Y', '', '', 'N', 'C', '', '', '', '', '', '', '', '', '', '', '', '', 'Y', 'C', 'N');