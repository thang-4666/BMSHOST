SET DEFINE OFF;
(select tltxcd CDVAL, txdesc, en_txdesc , 1 LSTODR from tltx
UNION ALL
SELECT ''ALL'' CDVAL,''ALL'' txdesc, ''ALL'' en_txdesc, -1 LSTODR FROM DUAL)ORDER BY LSTODR , CDVAL', '', 'ALL', 'Y', 'N', 'Y', '', '', 'Y', 'C', '', '', '', '', '', '', '', '', '', '', '', '', 'Y', 'T', 'N');
UNION ALL
SELECT ''HCCN'' VALUE, ''HCCN'' VALUECD, ''HCCN'' DISPLAY, ''HCCN'' EN_DISPLAY, ''HCCN'' DESCRIPTION FROM DUAL
UNION ALL
SELECT ''CC'' VALUE, ''CC'' VALUECD, ''CC'' DISPLAY, ''CC'' EN_DISPLAY, ''CC'' DESCRIPTION FROM DUAL
UNION ALL
SELECT ''TU DO'' VALUE, ''TU DO'' VALUECD, ''TU DO'' DISPLAY, ''TU DO'' EN_DISPLAY, ''TU DO'' DESCRIPTION FROM DUAL
UNION ALL
SELECT ''PHONG TOA'' VALUE, ''PHONG TOA'' VALUECD, ''PHONG TOA'' DISPLAY, ''PHONG TOA'' EN_DISPLAY, ''PHONG TOA'' DESCRIPTION FROM DUAL ', '', 'ALL', 'Y', 'N', 'Y', '', '', 'N', 'C', '', '', '', '', '', '', '', '', '', '', '', '', 'Y', 'C', 'N');