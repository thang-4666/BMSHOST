SET DEFINE OFF;
union all
SELECT ''ORDER'' VALUE, ''ORDER'' VALUECD, ''Mua, bán'' DISPLAY, ''Mua, bán'' EN_DISPLAY FROM DUAL
union all
SELECT ''CANCEL'' VALUE, ''CANCEL'' VALUECD, ''Hủy'' DISPLAY, ''Hủy'' EN_DISPLAY FROM DUAL
union all
SELECT ''ADJUST'' VALUE, ''ADJUST'' VALUECD, ''Sửa'' DISPLAY, ''Sửa'' EN_DISPLAY FROM DUAL', '', 'ALL', 'Y', 'N', 'Y', '', '', 'N', 'C', '', '', '', '', '', '', '', '', '', '', '', '', 'Y', 'C', 'N');
GRPNAME EN_DISPLAY,GRPNAME DESCRIPTION FROM (SELECT
GRPID, GRPNAME,1 LSTODR FROM TLGROUPS WHERE GRPTYPE =''2''
UNION SELECT''ALL'' TLID, ''ALL'' TLFULLNAME, -1 LSTODR FROM
DUAL) ORDER BY LSTODR', '', 'ALL', 'Y', 'N', 'Y', '', '', 'Y', 'C', '', '', '', '', '', '', '', '', '', '', '', '', 'Y', 'T', 'N');
DISPLAY EN_DISPLAY, DISPLAY DESCRIPTION
 FROM ( SELECT ''ALL'' VALUE, ''ALL'' DISPLAY FROM DUAL
UNION ALL
SELECT CDVAL VALUE, CDCONTENT DISPLAY FROM ALLCODE WHERE CDTYPE=''CF'' AND CDNAME=''CUSTTYPE'' )', '', 'ALL', 'Y', 'N', 'Y', '', '', 'N', 'C', '', '', '', '', '', '', '', '', '', '', '', '', 'Y', 'C', 'N');
(SELECT ''ALL'' CDVAL ,''ALL'' cdcontent ,-1 LSTODR FROM DUAL
UNION ALL
SELECT ''Y'' CDVAL ,''KH lưu ký '' cdcontent ,0 LSTODR FROM DUAL
UNION ALL
SELECT ''N'' CDVAL ,''KH không lưu ký'' cdcontent ,1 LSTODR FROM DUAL
)ORDER BY LSTODR', '', 'ALL', 'Y', 'N', 'Y', '', '', 'N', 'C', '', '', '', '', '', '', '', '', '', '', '', '', 'Y', 'C', 'N');
union all
SELECT ''N'' VALUE, ''N'' VALUECD, ''Không'' DISPLAY, ''Không'' EN_DISPLAY FROM DUAL
union all
SELECT ''T'' VALUE, ''T'' VALUECD, ''Có'' DISPLAY, ''Có'' EN_DISPLAY FROM DUAL', '', 'ALL', 'Y', 'N', 'Y', '', '', 'N', 'C', '', '', '', '', '', '', '', '', '', '', '', '', 'Y', 'C', 'N');
union all
SELECT ''N'' VALUE, ''N'' VALUECD, ''Không'' DISPLAY, ''Không'' EN_DISPLAY FROM DUAL
union all
SELECT ''Y'' VALUE, ''Y'' VALUECD, ''Có'' DISPLAY, ''Có'' EN_DISPLAY FROM DUAL', '', 'ALL', 'Y', 'N', 'Y', '', '', 'N', 'C', '', '', '', '', '', '', '', '', '', '', '', '', 'Y', 'C', 'N');