SET DEFINE OFF;
SELECT ''ALL'' VALUECD, ''ALL'' VALUE, ''ALL'' DISPLAY FROM DUAL
UNION ALL
SELECT ''Y'' VALUECD, ''Y'' VALUE, ''Corebank'' DISPLAY FROM DUAL
UNION ALL
SELECT ''N'' VALUECD, ''N'' VALUE, ''Tại VCBS'' DISPLAY FROM DUAL
', '', 'ALL', 'Y', 'N', 'Y', '', '', 'N', 'C', '', '', '', '', '', '', '', '', '', '', '', '', 'Y', 'C', 'N');
 SELECT ''ALL'' VALUECD, ''ALL'' VALUE ,''ALL'' DISPLAY, -2 LSTODR FROM DUAL
 UNION ALL
 SELECT  CDVAL VALUECD, CDVAL VALUE, CDCONTENT DISPLAY, LSTODR FROM
 ALLCODE WHERE CDTYPE = ''CF'' AND CDNAME = ''BANKNAME'') ORDER BY LSTODR ', '', 'ALL', 'Y', 'N', 'Y', '', '', 'Y', 'C', '', '', '', '', '', '', '', '', '', '', '', '', 'Y', 'T', 'N');
SELECT ''ALL'' VALUECD, ''ALL'' VALUE, ''ALL'' DISPLAY FROM DUAL
UNION ALL
SELECT ''01'' VALUECD, ''01'' VALUE, ''Còn Nợ'' DISPLAY FROM DUAL
UNION ALL
SELECT ''02'' VALUECD, ''02'' VALUE, ''Không còn nợ'' DISPLAY FROM DUAL', '', '', 'Y', 'N', 'Y', '', '', 'N', 'C', '', '', '', '', '', '', '', '', '', '', '', '', 'Y', 'C', 'N');