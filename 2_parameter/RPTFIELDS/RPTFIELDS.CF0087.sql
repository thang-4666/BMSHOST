SET DEFINE OFF;
 AND CDNAME = ''AFTYPE'' AND CDVAL IN(''001'',''002'') UNION SELECT ''ALL'' CDVAL, ''ALL'' CDCONTENT, -1 LSTODR FROM DUAL )
 ORDER BY LSTODR', '', 'ALL', 'Y', 'N', 'Y', '', '', 'Y', 'C', '', '', '', '', '', '', '', '', '', '', '', '', 'Y', '', 'N');
FROM
(
    SELECT CDVAL, CDCONTENT, LSTODR
    FROM ALLCODE WHERE CDNAME = ''STATUS'' AND CDTYPE = ''CF''
    UNION
    SELECT ''ALL'' CDVAL, ''ALL'' CDCONTENT, -1 LSTODR FROM DUAL
) ORDER BY LSTODR', '', 'ALL', 'Y', 'N', 'Y', '', '', 'N', 'C', '', '', '', '', '', '', '', '', '', '', '', '', 'Y', 'C', 'N');