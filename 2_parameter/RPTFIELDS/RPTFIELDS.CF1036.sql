SET DEFINE OFF;
description FROM (SELECT to_char( AUTOID) AUTOID , DESCRIPTION , 1 lstodr FROM cfreview UNION SELECT ''ALL'' AUTOID, ''ALL'' DESCRIPTION, -1 lstodr FROM DUAL)
ORDER BY lstodr, value   ', '', 'ALL', 'Y', 'N', 'Y', '', '', 'Y', 'C', '', '', '', '', '', '', '', '', '', '', '', '', 'Y', 'T', 'N');
description FROM (SELECT ACTYPE, TYPENAME, 1 lstodr FROM CFTYPE UNION SELECT ''ALL'' brid, ''ALL'' brname, -1 lstodr FROM DUAL)
ORDER BY lstodr, value', '', 'ALL', 'Y', 'N', 'Y', '', '', 'Y', 'C', '', '', '', '', '', '', '', '', '', '', '', '', 'Y', 'T', 'N');
description FROM (SELECT ACTYPE, TYPENAME, 1 lstodr FROM CFTYPE UNION SELECT ''ALL'' brid, ''ALL'' brname, -1 lstodr FROM DUAL)
ORDER BY lstodr, value', '', 'ALL', 'Y', 'N', 'Y', '', '', 'Y', 'C', '', '', '', '', '', '', '', '', '', '', '', '', 'Y', 'T', 'N');