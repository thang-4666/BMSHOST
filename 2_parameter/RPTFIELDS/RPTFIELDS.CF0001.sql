SET DEFINE OFF;
(SELECT ''ALL'' CDVAL ,''ALL'' cdcontent ,0 LSTODR FROM DUAL
UNION ALL
SELECT CDVAL, cdcontent,LSTODR FROM ALLCODE WHERE CDTYPE=''CF'' AND CDNAME=''PRODUCTTYPE''
)ORDER BY LSTODR ', '', 'ALL', 'Y', 'N', 'Y', '', '', 'Y', 'C', '', '', '', '', '', '', '', '', '', '', '', '', 'Y', '', 'N');
(SELECT ''ALL'' CDVAL ,''ALL'' cdcontent ,-1 LSTODR FROM DUAL
UNION ALL
SELECT CDVAL , cdcontent , LSTODR FROM ALLCODE WHERE CDTYPE=''CF'' AND CDNAME=''ACTIVESTS''
)ORDER BY LSTODR', '', 'ALL', 'Y', 'N', 'Y', '', '', 'N', 'C', '', '', '', '', '', '', '', '', '', '', '', '', 'Y', 'C', 'N');
FROM      (SELECT ''N'' CDVAL, ''Không'' CDCONTENT, 0 LSTODR FROM DUAL
UNION ALL SELECT ''Y'' CDVAL, ''Có'' CDCONTENT, 1 LSTODR FROM DUAL
UNION ALL SELECT ''ALL'' CDVAL, ''ALL'' CDCONTENT, 2 LSTODR FROM DUAL) ORDER BY LSTODR', '', 'ALL', 'Y', 'N', 'Y', '', '', 'N', 'C', '', '', '', '', '', '', '', '', '', '', '', '', 'Y', 'C', 'N');
FROM (SELECT ''N'' CDVAL, ''Không'' CDCONTENT, 1 LSTODR FROM DUAL
UNION ALL SELECT ''Y'' CDVAL, ''Có'' CDCONTENT, 0 LSTODR FROM DUAL) ORDER BY LSTODR', '', '', 'Y', 'N', 'Y', '', '', 'N', 'C', '', '', '', '', '', '', '', '', '', '', '', '', 'Y', 'C', 'N');
FROM (SELECT ''F'' CDVAL, ''Mở tại quầy'' CDCONTENT, 1 LSTODR FROM DUAL
UNION ALL SELECT ''I'' CDVAL, ''Mở theo danh sách Import'' CDCONTENT, 2 LSTODR FROM DUAL
UNION ALL SELECT ''O'' CDVAL, ''Mở trên online'' CDCONTENT, 3 LSTODR FROM DUAL
UNION ALL SELECT ''A'' CDVAL, ''Tất cả'' CDCONTENT, 0 LSTODR FROM DUAL) ORDER BY LSTODR', '', 'A', 'Y', 'N', 'Y', '', '', 'N', 'C', '', '', '', '', '', '', '', '', '', '', '', '', 'Y', 'C', 'N');