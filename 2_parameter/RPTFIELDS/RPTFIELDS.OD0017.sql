SET DEFINE OFF;
union
SELECT ''N'' VALUE, ''N'' VALUECD, ''BSC'' DISPLAY, ''BSC'' EN_DISPLAY, ''BSC'' DESCRIPTION FROM Dual
union
SELECT ''ALL'' VALUE, ''ALL'' VALUECD, ''ALL'' DISPLAY, ''ALL'' EN_DISPLAY, ''ALL'' DESCRIPTION FROM Dual', '', 'ALL', 'Y', 'N', 'Y', '', '', 'Y', 'C', '', '', '', '', '', '', '', '', '', '', '', '', 'Y', 'T', 'N');
GRPNAME EN_DISPLAY,GRPNAME DESCRIPTION FROM (SELECT
GRPID, GRPNAME,1 LSTODR FROM TLGROUPS WHERE GRPTYPE =''2''
UNION SELECT''ALL'' TLID, ''ALL'' TLFULLNAME, -1 LSTODR FROM
DUAL) ORDER BY LSTODR', '', 'ALL', 'Y', 'N', 'Y', '', '', 'Y', 'C', '', '', '', '', '', '', '', '', '', '', '', '', 'Y', 'T', 'N');
UNION ALL
SELECT ''B'' VALUECD, ''B'' VALUE, ''Tổ chức'' DISPLAY FROM DUAL
UNION ALL
SELECT ''I'' VALUECD, ''I'' VALUE, ''Cá nhân'' DISPLAY FROM DUAL', '', '', 'Y', 'N', 'Y', '', '', 'N', 'C', '', '', '', '', '', '', '', '', '', '', '', '', 'Y', 'C', 'N');
SELECT ''ALL'' VALUECD, ''ALL'' VALUE, ''ALL'' DISPLAY FROM DUAL
UNION ALL
SELECT ''003 006 222 012'' VALUECD, ''003 006 222 012'' VALUE, ''Trái phiếu'' DISPLAY FROM DUAL
UNION ALL
SELECT ''001 002'' VALUECD, ''001 002'' VALUE, ''Cổ phiếu'' DISPLAY FROM DUAL
UNION ALL
SELECT ''008'' VALUECD, ''008'' VALUE, ''CCQ'' DISPLAY FROM DUAL
UNION ALL
SELECT ''011'' VALUECD, ''011'' VALUE, ''CW'' DISPLAY FROM DUAL
', '', '', 'Y', 'N', 'Y', '', '', 'N', 'C', '', '', '', '', '', '', '', '', '', '', '', '', 'Y', 'C', 'N');