SET DEFINE OFF;
UNION ALL
SELECT CDVAL VALUECD, CDVAL VALUE, CDCONTENT DISPLAY
FROM ALLCODE WHERE CDNAME=''GRPTYPE'' AND CDTYPE=''SA'' AND CDVAL <>''2''
', '', 'ALL', 'Y', 'N', 'Y', '', '', 'N', 'C', '', '', '', '', '', '', '', '', '', '', '', '', 'Y', 'C', 'N');
SELECT ''ALL'' VALUECD, ''ALL'' VALUE, ''ALL'' DISPLAY FROM DUAL
UNION ALL
SELECT ''Y'' VALUECD, ''Y'' VALUE, ''Hoạt động'' DISPLAY FROM DUAL
UNION ALL
SELECT ''Y'' VALUECD, ''N'' VALUE, ''Không hoạt động'' DISPLAY FROM DUAL', '', '', 'Y', 'N', 'Y', '', '', 'N', 'C', '', '', '', '', '', '', '', '', '', '', '', '', 'Y', 'C', 'N');