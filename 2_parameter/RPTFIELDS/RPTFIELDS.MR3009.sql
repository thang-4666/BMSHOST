SET DEFINE OFF;
(select CDVAL,CDCONTENT,LSTODR from ALLCODE  WHERE CDNAME =''YESNO'' AND CDTYPE=''SY''   UNION SELECT ''ALL'' CDVAL, ''Tất cả'' CDCONTENT, -1 LSTODR FROM DUAL ) ORDER BY LSTODR', '', 'ALL', 'Y', 'N', 'Y', '', '', 'Y', 'C', '', '', '', '', '', '', '', '', '', '', '', '', 'Y', '', 'N');
(select CDVAL,CDCONTENT,LSTODR from ALLCODE  WHERE CDNAME =''YESNO'' AND CDTYPE=''SY'')  ORDER BY LSTODR', '', 'Y', 'Y', 'N', 'Y', '', '', 'Y', 'C', '', '', '', '', '', '', '', '', '', '', '', '', 'Y', '', 'N');
SELECT CDVAL VALUE, CDVAL VALUECD, CDCONTENT DISPLAY, CDCONTENT EN_DISPLAY, CDCONTENT DESCRIPTION, CDCONTENT EN_DESCRIPTION
FROM (SELECT ''T3'' CDVAL, ''T3'' CDCONTENT, 1 LSTODR FROM DUAL
     union
     SELECT ''Margin'' CDVAL, ''Margin'' CDCONTENT, 2 LSTODR FROM DUAL
     union
     SELECT ''Thường'' CDVAL, ''Thường'' CDCONTENT, 3 LSTODR FROM DUAL
    UNION
    SELECT ''ALL'' CDVAL, ''ALL'' CDCONTENT, 0 LSTODR FROM DUAL)
ORDER BY LSTODR
', '', 'ALL', 'Y', 'N', 'Y', '', '', 'N', 'C', '', '', '', '', '', '', '', '', '', '', '', '', 'Y', 'C', 'N');
        (SELECT ''ALL'' CDVAL, ''ALL'' CDCONTENT, -1 LSTODR FROM DUAL
        UNION SELECT ''AF'' CDVAL, ''Margin'' CDCONTENT, 1 LSTODR FROM DUAL
        UNION SELECT ''DF'' CDVAL, ''Cầm cố'' CDCONTENT, 2 LSTODR FROM DUAL
        UNION SELECT ''GR'' CDVAL, ''Bảo lãnh tiền mua'' CDCONTENT, 3 LSTODR FROM DUAL
        ) ORDER BY LSTODR', '', '', 'Y', 'N', 'Y', '', '', 'N', 'C', '', '', '', '', '', '', '', '', '', '', '', '', 'Y', 'C', 'N');