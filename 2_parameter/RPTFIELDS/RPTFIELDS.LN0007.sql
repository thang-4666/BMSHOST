SET DEFINE OFF;
        (SELECT ''ALL'' CDVAL, ''Tất cả'' CDCONTENT, -1 LSTODR FROM DUAL
        union all
        select cdval, cdcontent, lstodr from allcode where cdname = ''LOANTYPE'' and cdtype = ''LN''
        ) ORDER BY LSTODR', '', '', 'Y', 'N', 'Y', '', '', 'N', 'C', '', '', '', '', '', '', '', '', '', '', '', '', 'Y', 'C', 'N');
        (SELECT ''ALL'' CDVAL, ''Tất cả'' CDCONTENT, -1 LSTODR FROM DUAL
        UNION SELECT ''DF'' CDVAL, ''CTy'' CDCONTENT, 0 LSTODR FROM DUAL
        UNION SELECT ''VSD'' CDVAL, ''VSD'' CDCONTENT, 1 LSTODR FROM DUAL
        ) ORDER BY LSTODR', '', 'ALL', 'Y', 'N', 'Y', '', '', 'Y', 'C', '', '', '', '', '', '', '', '', '', '', '', '', 'Y', '', 'N');
FROM (
SELECT ''ALL'' CDVAL, ''ALL'' CDCONTENT, -1 LSTODR FROM DUAL
UNION
SELECT ''001'' CDVAL, ''Tất toán'' CDCONTENT, 0 LSTODR FROM DUAL
UNION
SELECT ''002'' CDVAL, ''Chưa tất toán'' CDCONTENT, 1 LSTODR FROM DUAL)
 ORDER BY LSTODR', '', '002', 'Y', 'N', 'Y', '', '', 'Y', 'C', '', '', '', '', '', '', '', '', '', '', '', '', 'Y', '', 'N');
(SELECT ''ALL'' CDVAL ,''ALL'' cdcontent ,0 LSTODR FROM DUAL
UNION ALL
SELECT ''001'' CDVAL ,''Margin'' cdcontent ,1 LSTODR FROM DUAL
UNION ALL
SELECT ''002'' CDVAL ,''T3'' cdcontent ,2 LSTODR FROM DUAL
UNION ALL
SELECT ''003'' CDVAL ,''Thường'' cdcontent ,3 LSTODR FROM DUAL)ORDER BY LSTODR ', '', 'ALL', 'Y', 'N', 'Y', '', 'ALL', 'Y', 'C', '', '', '', '', '', '', '', '', '', '', '', '', 'Y', '', 'N');
(SELECT ''ALL'' CDVAL ,''ALL'' cdcontent ,0 LSTODR FROM DUAL
UNION ALL
SELECT ''001'' CDVAL ,''Yes'' cdcontent ,1 LSTODR FROM DUAL
UNION ALL
SELECT ''002'' CDVAL ,''No'' cdcontent ,2 LSTODR FROM DUAL)ORDER BY LSTODR ', '', 'ALL', 'Y', 'N', 'Y', '', 'ALL', 'Y', 'C', '', '', '', '', '', '', '', '', '', '', '', '', 'Y', '', 'N');