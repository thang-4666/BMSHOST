SET DEFINE OFF;
DISPLAY EN_DISPLAY, DISPLAY DESCRIPTION
 FROM ( SELECT ''ALL'' VALUE, ''ALL'' DISPLAY FROM DUAL
UNION ALL
SELECT  ''O'' VALUE, ''Online'' DISPLAY FROM DUAL
UNION ALL
SELECT  ''M'' VALUE, ''Margin'' DISPLAY FROM DUAL
UNION ALL
SELECT  ''U'' VALUE, ''Ứng trước'' DISPLAY FROM DUAL
UNION ALL
SELECT  ''T'' VALUE, ''Ứng trước bên T3'' DISPLAY FROM DUAL
UNION ALL
SELECT  ''E'' VALUE, ''Email/SMS'' DISPLAY FROM DUAL)', '', 'ALL', 'Y', 'N', 'Y', '', '', 'N', 'C', '', '', '', '', '', '', '', '', '', '', '', '', 'Y', 'C', 'N');
FROM
(
    SELECT CDVAL, CDCONTENT, LSTODR
    FROM ALLCODE WHERE CDNAME = ''STATUS'' AND CDTYPE = ''CF''
    UNION
    SELECT ''ALL'' CDVAL, ''ALL'' CDCONTENT, -1 LSTODR FROM DUAL
) ORDER BY LSTODR', '', 'ALL', 'Y', 'N', 'Y', '', '', 'N', 'C', '', '', '', '', '', '', '', '', '', '', '', '', 'Y', 'C', 'N');