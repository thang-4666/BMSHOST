SET DEFINE OFF;
FROM (SELECT ''N'' CDVAL, ''Không'' CDCONTENT, 1 LSTODR FROM DUAL
UNION ALL SELECT ''Y'' CDVAL, ''Có'' CDCONTENT, 0 LSTODR FROM DUAL) ORDER BY LSTODR', '', '', 'Y', 'N', 'Y', '', '', 'N', 'C', '', '', '', '', '', '', '', '', '', '', '', '', 'Y', 'C', 'N');