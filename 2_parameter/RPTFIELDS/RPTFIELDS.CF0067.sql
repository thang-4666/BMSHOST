SET DEFINE OFF;
description FROM (SELECT ACTYPE, TYPENAME, 1 lstodr FROM AFTYPE UNION SELECT ''ALL'' brid, ''ALL'' brname, -1 lstodr FROM DUAL)
ORDER BY lstodr, value', '', 'ALL', 'Y', 'N', 'Y', '', '', 'Y', 'C', '', '', '', '', '', '', '', '', '', '', '', '', 'Y', 'T', 'N');