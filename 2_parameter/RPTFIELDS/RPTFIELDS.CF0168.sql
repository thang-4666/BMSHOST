SET DEFINE OFF;
FROM
(   SELECT ''ALL'' CDVAL, ''ALL'' CDCONTENT, 0 LSTODR FROM DUAL
UNION ALL
SELECT CDVAL ,cdcontent cdcontent ,1 LSTODR 
    FROM ALLCODE
    WHERE CDNAME=''VIA'' 
 and cdtype=''FO''
 and CDVAL in (''A'',''O'')

)ORDER BY LSTODR', '', 'ALL', 'Y', 'N', 'Y', '', '', 'N', 'C', '', '', '', '', '', '', '', '', '', '', '', '', 'Y', 'C', 'N');
FROM
(
SELECT ''ALL'' CDVAL, ''ALL'' CDCONTENT, 0 LSTODR FROM DUAL
UNION ALL
SELECT CDVAL ,cdcontent cdcontent , 1 LSTODR
    FROM ALLCODE
    WHERE CDNAME=''OTAUTHTYPE''
        and cduser=''Y''
  

)  order by LSTODR,cdval', '', 'ALL', 'Y', 'N', 'Y', '', '', 'N', 'C', '', '', '', '', '', '', '', '', '', '', '', '', 'Y', 'C', 'N');