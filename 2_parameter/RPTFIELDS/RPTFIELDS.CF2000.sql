SET DEFINE OFF;
FROM (SELECT TLTXCD CDVAL, TXDESC CDCONTENT, EN_TXDESC DESCRIPTION, to_number(TLTXCD) LSTODR
     FROM TLTX where tltxcd in( ''0033'',''0090'')
     union all
     SELECT ''ALL'' CDVAL, ''ALL'' CDCONTENT ,''ALL'' DESCRIPTION, -1 LSTODR FROM DUAL) ORDER BY LSTODR', '', 'ALL', 'Y', 'N', 'Y', '', '', 'Y', 'C', '', '', '', '', '', '', '', '', '', '', '', '', 'Y', '', 'N');