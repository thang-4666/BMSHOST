SET DEFINE OFF;
DISPLAY EN_DISPLAY, DISPLAY DESCRIPTION
 FROM ( SELECT ''ALL'' VALUE, ''ALL'' DISPLAY FROM DUAL
UNION ALL
SELECT  ''IN'' VALUE, ''Trong nước'' DISPLAY FROM DUAL
UNION ALL
SELECT  ''OUT'' VALUE, ''Nước ngoài'' DISPLAY FROM DUAL)', '', 'ALL', 'Y', 'N', 'Y', '', '', 'N', 'C', '', '', '', '', '', '', '', '', '', '', '', '', 'Y', 'C', 'N');
DISPLAY EN_DISPLAY, DISPLAY DESCRIPTION
 FROM ( SELECT ''ALL'' VALUE, ''ALL'' DISPLAY FROM DUAL
UNION ALL
SELECT  ''B'' VALUE, ''Tổ chức'' DISPLAY FROM DUAL
UNION ALL
SELECT  ''I'' VALUE, ''Cá nhân'' DISPLAY FROM DUAL)', '', 'ALL', 'Y', 'N', 'Y', '', '', 'N', 'C', '', '', '', '', '', '', '', '', '', '', '', '', 'Y', 'C', 'N');
description FROM (SELECT ACTYPE, TYPENAME, 1 lstodr FROM CFTYPE UNION SELECT ''ALL'' brid, ''ALL'' brname, -1 lstodr FROM DUAL)
ORDER BY lstodr, value', '', 'ALL', 'Y', 'N', 'Y', '', '', 'Y', 'C', '', '', '', '', '', '', '', '', '', '', '', '', 'Y', 'T', 'N');