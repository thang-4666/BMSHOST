SET DEFINE OFF;
FROM ( SELECT ''ALL'' CDVAL, ''Tất cả'' CDCONTENT, -1 LSTODR FROM DUAL UNION  SELECT ''Y'' CDVAL, ''Có'' CDCONTENT, 0 LSTODR FROM DUAL
UNION SELECT ''N'' CDVAL, ''Không'' CDCONTENT, 1 LSTODR FROM DUAL
) ORDER BY LSTODR', '', '', 'Y', 'N', 'Y', '', '', 'N', 'C', '', '', '', '', '', '', '', '', '', '', '', '', 'Y', 'C', 'N');
FROM (SELECT ''ALL'' CDVAL, ''Tất cả'' CDCONTENT, -1 LSTODR FROM DUAL UNION SELECT ''Y'' CDVAL, ''Có đồng ý'' CDCONTENT, 0 LSTODR FROM DUAL
UNION SELECT ''N'' CDVAL, ''Không đồng ý'' CDCONTENT, 1 LSTODR FROM DUAL
) ORDER BY LSTODR', '', '', 'Y', 'N', 'Y', '', '', 'N', 'C', '', '', '', '', '', '', '', '', '', '', '', '', 'Y', 'C', 'N');
FROM (SELECT ''ALL'' CDVAL, ''Tất cả'' CDCONTENT, -1 LSTODR FROM DUAL UNION SELECT ''Y'' CDVAL, ''Có'' CDCONTENT, 0 LSTODR FROM DUAL
UNION SELECT ''N'' CDVAL, ''Không'' CDCONTENT, 1 LSTODR FROM DUAL
) ORDER BY LSTODR', '', '', 'Y', 'N', 'Y', '', '', 'N', 'C', '', '', '', '', '', '', '', '', '', '', '', '', 'Y', 'C', 'N');
FROM (SELECT ''ALL'' CDVAL, ''Tất cả'' CDCONTENT, -1 LSTODR FROM DUAL UNION SELECT ''Y'' CDVAL, ''Có'' CDCONTENT, 0 LSTODR FROM DUAL
UNION SELECT ''N'' CDVAL, ''Không'' CDCONTENT, 1 LSTODR FROM DUAL
) ORDER BY LSTODR', '', '', 'Y', 'N', 'Y', '', '', 'N', 'C', '', '', '', '', '', '', '', '', '', '', '', '', 'Y', 'C', 'N');
FROM (SELECT ''ALL'' CDVAL, ''Tất cả'' CDCONTENT, -1 LSTODR FROM DUAL UNION SELECT ''Y'' CDVAL, ''Có'' CDCONTENT, 0 LSTODR FROM DUAL
UNION SELECT ''N'' CDVAL, ''Không'' CDCONTENT, 1 LSTODR FROM DUAL
) ORDER BY LSTODR', '', '', 'Y', 'N', 'Y', '', '', 'N', 'C', '', '', '', '', '', '', '', '', '', '', '', '', 'Y', 'C', 'N');