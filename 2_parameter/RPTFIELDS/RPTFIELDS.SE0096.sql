SET DEFINE OFF;
(SELECT ''ALL'' CDVAL ,''ALL'' cdcontent ,-1 LSTODR FROM DUAL
UNION ALL
SELECT CDVAL , cdcontent , LSTODR FROM ALLCODE WHERE CDTYPE=''SA'' AND CDNAME=''ORDERTYPE'' and cdval != ''9''
)ORDER BY LSTODR', '', 'ALL', 'Y', 'N', 'Y', '', '', 'N', 'C', '', '', '', '', '', '', '', '', '', '', '', '', 'Y', 'C', 'N');