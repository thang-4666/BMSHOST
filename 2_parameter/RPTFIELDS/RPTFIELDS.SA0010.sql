SET DEFINE OFF;
FROM TLPROFILES  UNION SELECT ''ALL'' TLID, ''ALL'' TLNAME, -1 LSTODR FROM DUAL) ORDER BY LSTODR', '', 'ALL', 'Y', 'N', 'Y', '', '', 'N', 'C', '', '', '', '', '', '', 'TLPROFILES', 'SA', '', '', '', '', 'Y', 'T', 'N');
(SELECT ''A'' CDVAL ,''Toàn bộ'' cdcontent ,0 LSTODR FROM DUAL
UNION ALL
SELECT ''B'' CDVAL ,''Xung đột'' cdcontent ,0 LSTODR FROM DUAL
)ORDER BY LSTODR ', '', 'ALL', 'Y', 'N', 'Y', '', '', 'N', 'C', '', '', '', '', '', '', '', '', '', '', '', '', 'Y', 'C', 'N');