SET DEFINE OFF;
SELECT ''ALL'' VALUECD, ''ALL'' VALUE, ''ALL'' DISPLAY FROM DUAL
UNION ALL
SELECT ''IC'' VALUECD, ''IC'' VALUE, ''Cá nhân trong nước'' DISPLAY FROM DUAL
UNION ALL
SELECT ''BC'' VALUECD, ''BC'' VALUE, ''Tổ chức trong nước'' DISPLAY FROM DUAL
UNION ALL
SELECT ''IF'' VALUECD, ''IF'' VALUE, ''Cá nhân nước ngoài'' DISPLAY FROM DUAL
UNION ALL
SELECT ''BF'' VALUECD, ''BF'' VALUE, ''Tổ chức nước ngoài'' DISPLAY FROM DUAL
', '', 'ALL', 'Y', 'N', 'Y', '', '', 'N', 'C', '', '', '', '', '', '', '', '', '', '', '', '', 'Y', 'C', 'N');
 brid display, brname en_display, brname description FROM (SELECT brid, brname,
  1 lstodr FROM brgrp UNION SELECT ''ALL'' brid, ''ALL'' brname, -1 lstodr FROM DUAL) ORDER BY lstodr', '', 'ALL', 'Y', 'N', 'Y', '', '', 'Y', 'C', '', '', '', '', '', '', '', '', '', '', '', '', 'Y', 'T', 'N');
SELECT VALUE, display, en_cdcontent, display description
FROM (
SELECT ''ALL'' VALUE, ''ALL'' display, ''ALL'' en_cdcontent, -1 lstodr FROM DUAL
UNION ALL
select cdval VALUE, cdcontent display, en_cdcontent en_display, lstodr
from allcode where cdname = ''CATYPE''
AND CDUSER = ''Y'' ) ORDER BY lstodr
', '', 'ALL', 'Y', 'N', 'Y', '', '', 'Y', 'C', '', '', '', '', '', '', '', '', '', '', '', '', 'Y', 'T', 'N');