SET DEFINE OFF;
(SELECT ''ALL'' CDVAL ,''ALL'' cdcontent ,0 LSTODR FROM DUAL
UNION ALL
SELECT ''001'' CDVAL ,''Margin'' cdcontent ,1 LSTODR FROM DUAL
UNION ALL
SELECT ''002'' CDVAL ,''T3'' cdcontent ,2 LSTODR FROM DUAL
UNION ALL
SELECT ''003'' CDVAL ,''Thường'' cdcontent ,3 LSTODR FROM DUAL)ORDER BY LSTODR ', '', 'ALL', 'Y', 'N', 'Y', '', 'ALL', 'Y', 'C', '', '', '', '', '', '', '', '', '', '', '', '', 'Y', '', 'N');