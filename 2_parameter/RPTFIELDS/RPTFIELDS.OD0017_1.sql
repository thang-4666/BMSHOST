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
(SELECT ''ALL'' CDVAL ,''ALL'' cdcontent ,-1 LSTODR FROM DUAL
UNION ALL
SELECT ''Y'' CDVAL ,''KH lưu ký '' cdcontent ,0 LSTODR FROM DUAL
UNION ALL
SELECT ''N'' CDVAL ,''KH không lưu ký'' cdcontent ,1 LSTODR FROM DUAL
)ORDER BY LSTODR', '', 'ALL', 'Y', 'N', 'Y', '', '', 'N', 'C', '', '', '', '', '', '', '', '', '', '', '', '', 'Y', 'C', 'N');