SET DEFINE OFF;
FROM (
SELECT ''ALL'' CDVAL, ''ALL'' CDCONTENT, -1 LSTODR FROM DUAL
UNION
SELECT ''Y'' CDVAL, ''Tuân thủ'' CDCONTENT, 0 LSTODR FROM DUAL
UNION
SELECT ''N'' CDVAL, ''Không tuân thủ'' CDCONTENT, 1 LSTODR FROM DUAL)
 ORDER BY LSTODR', '', 'ALL', 'Y', 'N', 'Y', '', '', 'Y', 'C', '', '', '', '', '', '', '', '', '', '', '', '', 'Y', '', 'N');