SET DEFINE OFF;
from (SELECT tltxcd, txdesc, 1 lstodr from tltx
UNION ALL SELECT ''ALL'' tltxcd,''ALL'' txdesc ,-1 LSTODR FROM DUAL ORDER BY tltxcd )
ORDER BY LSTODR , value', '', 'ALL', 'Y', 'N', 'Y', '', '', 'Y', 'C', '', '', '', '', '', '', '', '', '', '', '', '', 'Y', 'T', 'N');
UNION ALL
SELECT ''HCCN'' VALUE, ''HCCN'' VALUECD, ''HCCN'' DISPLAY, ''HCCN'' EN_DISPLAY, ''HCCN'' DESCRIPTION FROM DUAL
UNION ALL
SELECT ''CC'' VALUE, ''CC'' VALUECD, ''CC'' DISPLAY, ''CC'' EN_DISPLAY, ''CC'' DESCRIPTION FROM DUAL
UNION ALL
SELECT ''TU DO'' VALUE, ''TU DO'' VALUECD, ''TU DO'' DISPLAY, ''TU DO'' EN_DISPLAY, ''TU DO'' DESCRIPTION FROM DUAL ', '', 'ALL', 'Y', 'N', 'Y', '', '', 'N', 'C', '', '', '', '', '', '', '', '', '', '', '', '', 'Y', 'C', 'N');