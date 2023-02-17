SET DEFINE OFF;
description FROM (SELECT ACTYPE, TYPENAME, 1 lstodr FROM CFTYPE WHERE ACTYPE NOT IN (''0001'', ''0008'', ''0014'', ''0000'', ''0009'', ''0015'', ''0007'')
 UNION SELECT ''ALL'' ACTYPE, ''ALL'' TYPENAME, -1 lstodr FROM DUAL) ORDER BY lstodr, value', '', 'ALL', 'Y', 'N', 'Y', '', '', 'Y', 'C', '', '', '', '', '', '', '', '', '', '', '', '', 'Y', 'T', 'N');
description FROM (SELECT to_char(AUTOID) autoid, FULLNAME, 1 lstodr FROM odprobrkmst
 UNION SELECT ''ALL'' AUTOID, ''ALL'' FULLNAME, -1 lstodr FROM DUAL) ORDER BY lstodr, value', '', 'ALL', 'Y', 'N', 'Y', '', '', 'Y', 'C', '', '', '', '', '', '', '', '', '', '', '', '', 'Y', 'T', 'N');