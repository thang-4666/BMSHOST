SET DEFINE OFF;
FROM
(
    SELECT CDVAL, CDCONTENT, LSTODR
    FROM ALLCODE WHERE CDNAME = ''STATUS'' AND CDTYPE = ''CF''
    UNION
    SELECT ''ALL'' CDVAL, ''ALL'' CDCONTENT, -1 LSTODR FROM DUAL
) ORDER BY LSTODR', '', 'ALL', 'Y', 'N', 'Y', '', '', 'N', 'C', '', '', '', '', '', '', '', '', '', '', '', '', 'Y', 'C', 'N');