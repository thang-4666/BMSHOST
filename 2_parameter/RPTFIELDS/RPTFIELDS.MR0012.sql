SET DEFINE OFF;
FROM (
SELECT ''ALL'' CDVAL, ''ALL'' CDCONTENT, -1 LSTODR FROM DUAL
UNION
SELECT ''001'' CDVAL, ''Tất toán'' CDCONTENT, 0 LSTODR FROM DUAL
UNION
SELECT ''002'' CDVAL, ''Chưa tất toán'' CDCONTENT, 1 LSTODR FROM DUAL)
 ORDER BY LSTODR DESC', '', '002', 'Y', 'N', 'Y', '', '', 'N', 'C', '', '', '', '', '', '', '', '', '', '', '', '', 'Y', 'C', 'N');
FROM (
SELECT ''ALL'' CDVAL, ''ALL'' CDCONTENT, -1 LSTODR FROM DUAL
UNION
SELECT ''001'' CDVAL, ''Trong hạn'' CDCONTENT, 0 LSTODR FROM DUAL
UNION
SELECT ''002'' CDVAL, ''Đến hạn'' CDCONTENT, 1 LSTODR FROM DUAL
UNION
SELECT ''003'' CDVAL, ''Qúa hạn'' CDCONTENT, 2 LSTODR FROM DUAL
)
 ORDER BY LSTODR', '', 'ALL', 'Y', 'N', 'Y', '', '', 'N', 'C', '', '', '', '', '', '', '', '', '', '', '', '', 'Y', 'C', 'N');
(SELECT ''ALL'' CDVAL ,''ALL'' cdcontent ,0 LSTODR FROM DUAL
UNION ALL
SELECT CDVAL, cdcontent,LSTODR FROM ALLCODE WHERE CDTYPE=''CF'' AND CDNAME=''PRODUCTTYPE'' AND CDVAL IN (''NM'',''QM'')
)ORDER BY LSTODR ', '', 'ALL', 'Y', 'N', 'Y', '', '', 'Y', 'C', '', '', '', '', '', '', '', '', '', '', '', '', 'Y', '', 'N');