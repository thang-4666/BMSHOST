SET DEFINE OFF;
        (SELECT ''ALL'' CDVAL, ''Tất cả'' CDCONTENT, -1 LSTODR FROM DUAL
        UNION SELECT ''AD'' CDVAL, ''Ứng trước tiền bán'' CDCONTENT, 0 LSTODR FROM DUAL
        UNION SELECT ''AF'' CDVAL, ''Margin'' CDCONTENT, 1 LSTODR FROM DUAL
        UNION SELECT ''DF'' CDVAL, ''Cầm cố'' CDCONTENT, 2 LSTODR FROM DUAL
        UNION SELECT ''GR'' CDVAL, ''Bảo lãnh tiền mua'' CDCONTENT, 3 LSTODR FROM DUAL
        ) ORDER BY LSTODR', '', '', 'Y', 'N', 'Y', '', '', 'N', 'C', '', '', '', '', '', '', '', '', '', '', '', '', 'Y', 'C', 'N');