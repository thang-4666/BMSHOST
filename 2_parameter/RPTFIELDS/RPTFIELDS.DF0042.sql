SET DEFINE OFF;
SELECT ''01'' VALUECD, ''01'' VALUE, ''Chứng khoán'' DISPLAY FROM DUAL
UNION ALL
SELECT ''02'' VALUECD, ''02'' VALUE, ''Tiền'' DISPLAY FROM DUAL
UNION ALL
SELECT ''ALL'' VALUECD, ''ALL'' VALUE, ''Tất cả'' DISPLAY FROM DUAL', '', 'ALL', 'Y', 'N', 'Y', '', '', 'N', 'C', '', '', '', '', '', '', '', '', '', '', '', '', 'Y', 'C', 'N');
FROM (SELECT TLTXCD CDVAL, TXDESC CDCONTENT, EN_TXDESC DESCRIPTION, to_number(TLTXCD) LSTODR
     FROM TLTX where tltxcd like ''26%''
     union all
     SELECT ''ALL'' CDVAL, ''ALL'' CDCONTENT ,''ALL'' DESCRIPTION, -1 LSTODR FROM DUAL) ORDER BY LSTODR', '', 'ALL', 'Y', 'N', 'Y', '', '', 'Y', 'C', '', '', '', '', '', '', '', '', '', '', '', '', 'Y', '', 'N');