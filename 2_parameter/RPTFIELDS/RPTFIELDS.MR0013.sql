SET DEFINE OFF;
(SELECT ''ALL'' CDVAL ,''ALL'' cdcontent ,0 LSTODR FROM DUAL
UNION ALL
SELECT ''001'' CDVAL ,''Margin'' cdcontent ,1 LSTODR FROM DUAL
UNION ALL
SELECT ''002'' CDVAL ,''T3'' cdcontent ,2 LSTODR FROM DUAL
UNION ALL
SELECT ''003'' CDVAL ,''Thường'' cdcontent ,3 LSTODR FROM DUAL)ORDER BY LSTODR ', '', 'ALL', 'Y', 'N', 'Y', '', 'ALL', 'Y', 'C', '', '', '', '', '', '', '', '', '', '', '', '', 'Y', '', 'N');
        (SELECT ''ALL'' CDVAL, ''Tất cả'' CDCONTENT, -1 LSTODR FROM DUAL
        UNION SELECT ''001'' CDVAL, ''CTy'' CDCONTENT, 0 LSTODR FROM DUAL
        UNION SELECT ''002'' CDVAL, ''VSD'' CDCONTENT, 1 LSTODR FROM DUAL
        ) ORDER BY LSTODR', '', 'ALL', 'Y', 'N', 'Y', '', '', 'Y', 'C', '', '', '', '', '', '', '', '', '', '', '', '', 'Y', '', 'N');
        (SELECT ''ALL'' CDVAL, ''Tất cả'' CDCONTENT, -1 LSTODR FROM DUAL
        UNION SELECT ''BL'' CDVAL, ''Bảo lãnh'' CDCONTENT, 0 LSTODR FROM DUAL
        UNION SELECT ''CL'' CDVAL, ''Creditline'' CDCONTENT, 1 LSTODR FROM DUAL
        UNION SELECT ''DF'' CDVAL, ''Cầm cố'' CDCONTENT, 2 LSTODR FROM DUAL
        ) ORDER BY LSTODR', '', 'ALL', 'Y', 'N', 'Y', '', '', 'Y', 'C', '', '', '', '', '', '', '', '', '', '', '', '', 'Y', '', 'N');
FROM (
SELECT ''ALL'' CDVAL, ''ALL'' CDCONTENT, -1 LSTODR FROM DUAL
UNION
SELECT ''001'' CDVAL, ''Tất toán'' CDCONTENT, 0 LSTODR FROM DUAL
UNION
SELECT ''002'' CDVAL, ''Chưa tất toán'' CDCONTENT, 1 LSTODR FROM DUAL)
 ORDER BY LSTODR', '', '002', 'Y', 'N', 'Y', '', '', 'Y', 'C', '', '', '', '', '', '', '', '', '', '', '', '', 'Y', '', 'N');
FROM (
SELECT ''ALL'' CDVAL, ''ALL'' CDCONTENT, -1 LSTODR FROM DUAL
UNION
SELECT ''001'' CDVAL, ''Trong hạn'' CDCONTENT, 0 LSTODR FROM DUAL
UNION
SELECT ''002'' CDVAL, ''Ðến hạn'' CDCONTENT, 1 LSTODR FROM DUAL
UNION
SELECT ''003'' CDVAL, ''Quá hạn'' CDCONTENT, 2 LSTODR FROM DUAL
)
 ORDER BY LSTODR', '', 'ALL', 'Y', 'N', 'Y', '', '', 'Y', 'C', '', '', '', '', '', '', '', '', '', '', '', '', 'Y', '', 'N');