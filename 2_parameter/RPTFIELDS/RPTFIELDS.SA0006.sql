SET DEFINE OFF;
DISPLAY EN_DISPLAY, DISPLAY DESCRIPTION
 FROM ( SELECT ''ALL'' VALUE, ''ALL'' DISPLAY FROM DUAL
UNION ALL
SELECT  ''Y'' VALUE, ''Hoạt động'' DISPLAY FROM DUAL
UNION ALL
SELECT  ''N'' VALUE, ''Không hoạt động'' DISPLAY FROM DUAL)', '', 'ALL', 'Y', 'N', 'Y', '', '', 'N', 'C', '', '', '', '', '', '', '', '', '', '', '', '', 'Y', 'C', 'N');