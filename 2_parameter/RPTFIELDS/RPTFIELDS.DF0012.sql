SET DEFINE OFF;
FROM (
SELECT ''ALL'' CDVAL, ''ALL'' CDCONTENT, -1 LSTODR FROM DUAL
UNION
SELECT ''001'' CDVAL, ''Tất toán'' CDCONTENT, 0 LSTODR FROM DUAL
UNION
SELECT ''002'' CDVAL, ''Chưa tất toán'' CDCONTENT, 1 LSTODR FROM DUAL)
 ORDER BY LSTODR', '', 'ALL', 'Y', 'N', 'Y', '', '', 'Y', 'C', '', '', '', '', '', '', '', '', '', '', '', '', 'Y', '', 'N');