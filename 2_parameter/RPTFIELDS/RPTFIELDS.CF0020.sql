SET DEFINE OFF;
(SELECT ''ALL'' CDVAL ,''ALL'' cdcontent ,-1 LSTODR FROM DUAL
UNION ALL
SELECT CDVAL , cdcontent , LSTODR FROM ALLCODE WHERE CDTYPE=''CF'' AND CDNAME=''ACTIVESTS''
)ORDER BY LSTODR', '', 'ALL', 'Y', 'N', 'Y', '', '', 'N', 'C', '', '', '', '', '', '', '', '', '', '', '', '', 'Y', 'C', 'N');
UNION ALL
SELECT ''Sở giao dịch chứng khoán Hồ Chí Minh'' VALUECD, ''Sở giao dịch chứng khoán Hồ Chí Minh'' VALUE, ''Sở giao dịch chứng khoán Hồ Chí Minh'' DISPLAY FROM DUAL', '', '', 'Y', 'N', 'Y', '', '', 'N', 'C', '', '', '', '', '', '', '', '', '', '', '', '', 'Y', 'C', 'N');
FROM      (SELECT ''N'' CDVAL, ''Không'' CDCONTENT, 0 LSTODR FROM DUAL
UNION ALL SELECT ''Y'' CDVAL, ''Có'' CDCONTENT, 1 LSTODR FROM DUAL
UNION ALL SELECT ''ALL'' CDVAL, ''ALL'' CDCONTENT, 2 LSTODR FROM DUAL) ORDER BY LSTODR', '', 'ALL', 'Y', 'N', 'Y', '', '', 'N', 'C', '', '', '', '', '', '', '', '', '', '', '', '', 'Y', 'C', 'N');
FROM (SELECT ''N'' CDVAL, ''Không'' CDCONTENT, 1 LSTODR FROM DUAL
UNION ALL SELECT ''Y'' CDVAL, ''Có'' CDCONTENT, 0 LSTODR FROM DUAL) ORDER BY LSTODR', '', '', 'Y', 'N', 'Y', '', '', 'N', 'C', '', '', '', '', '', '', '', '', '', '', '', '', 'Y', 'C', 'N');
FROM (SELECT ''F'' CDVAL, ''Mở tại quầy'' CDCONTENT, 1 LSTODR FROM DUAL
UNION ALL SELECT ''I'' CDVAL, ''Mở theo danh sách Import'' CDCONTENT, 2 LSTODR FROM DUAL
UNION ALL SELECT ''O'' CDVAL, ''Mở trên online'' CDCONTENT, 3 LSTODR FROM DUAL
UNION ALL SELECT ''C'' CDVAL, ''Online bán chéo'' CDCONTENT, 4 LSTODR FROM DUAL
UNION ALL SELECT ''A'' CDVAL, ''Tất cả'' CDCONTENT, 0 LSTODR FROM DUAL) ORDER BY LSTODR', '', 'A', 'Y', 'N', 'Y', '', '', 'N', 'C', '', '', '', '', '', '', '', '', '', '', '', '', 'Y', 'C', 'N');