SET DEFINE OFF;
 FROM ALLCODE WHERE CDTYPE=''CF'' AND CDNAME=''VIA'' AND CDVAL IN (''F'',''O'')
UNION ALL
SELECT  ''ALL'' VALUECD, ''ALL'' VALUE, ''ALL'' DISPLAY ,-1 LSTORE FROM DUAL
ORDER BY LSTORE,VALUECD', '', 'ALL', 'Y', 'N', 'Y', '', '', 'N', 'C', '', '', '', '', '', '', '', '', '', '', '', '', 'Y', 'C', 'N');