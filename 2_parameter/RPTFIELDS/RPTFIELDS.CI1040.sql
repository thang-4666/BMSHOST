SET DEFINE OFF;
description FROM (SELECT to_char(ACTYPE) ACTYPE, TYPENAME, 1 lstodr FROM CIFEEDEF_EXT
 UNION SELECT ''ALL'' ACTYPE, ''ALL'' TYPENAME, -1 lstodr FROM DUAL) ORDER BY lstodr, value', '', 'ALL', 'Y', 'N', 'Y', '', '', 'Y', 'C', '', '', '', '', '', '', '', '', '', '', '', '', 'Y', 'T', 'N');
description FROM (SELECT ACTYPE, TYPENAME, 1 lstodr FROM CFTYPE
 UNION SELECT ''ALL'' ACTYPE, ''ALL'' TYPENAME, -1 lstodr FROM DUAL) ORDER BY lstodr, value', '', 'ALL', 'Y', 'N', 'Y', '', '', 'Y', 'C', '', '', '', '', '', '', '', '', '', '', '', '', 'Y', 'T', 'N');
FROM
(
    SELECT CDVAL, CDCONTENT, LSTODR
    FROM ALLCODE WHERE CDNAME = ''STATUS'' AND CDTYPE = ''CF''
    UNION
    SELECT ''ALL'' CDVAL, ''ALL'' CDCONTENT, -1 LSTODR FROM DUAL
) ORDER BY LSTODR', '', 'ALL', 'Y', 'N', 'Y', '', '', 'N', 'C', '', '', '', '', '', '', '', '', '', '', '', '', 'Y', 'C', 'N');