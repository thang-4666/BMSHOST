SET DEFINE OFF;
FROM
(
SELECT ''ALL'' SYMBOL ,''ALL'' fullname ,1 LSTODR FROM DUAL
UNION ALL
SELECT ''YES'' SYMBOL ,''YES'' fullname ,2 LSTODR FROM DUAL
UNION ALL
SELECT ''NO'' SYMBOL ,''YES'' fullname ,3 LSTODR FROM DUAL
)ORDER BY LSTODR', '', 'ALL', 'Y', 'N', 'Y', '', '', 'N', 'C', '', '', '', '', '', '', '', '', '', '', '', '', 'Y', 'C', 'N');