SET DEFINE OFF;
(SELECT ''ALL'' CDVAL ,''ALL'' cdcontent ,0 LSTODR FROM DUAL
UNION ALL
SELECT CDVAL, cdcontent,LSTODR FROM ALLCODE WHERE CDTYPE=''CF'' AND CDNAME=''PRODUCTTYPE'' AND CDVAL IN (''NM'',''QM'')
)ORDER BY LSTODR ', '', 'ALL', 'Y', 'N', 'Y', '', '', 'Y', 'C', '', '', '', '', '', '', '', '', '', '', '', '', 'Y', '', 'N');