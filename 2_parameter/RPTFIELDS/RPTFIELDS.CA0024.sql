SET DEFINE OFF;
 brid display, brname en_display, brname description FROM (SELECT brid, brname,
  1 lstodr FROM brgrp UNION SELECT ''ALL'' brid, ''ALL'' brname, -1 lstodr FROM DUAL) ORDER BY lstodr', '', 'ALL', 'Y', 'N', 'Y', '', '', 'Y', 'C', '', '', '', '', '', '', '', '', '', '', '', '', 'Y', 'T', 'N');
SELECT ''ALL'' VALUECD, ''ALL'' VALUE, ''ALL'' DISPLAY FROM DUAL
UNION ALL
SELECT ''Y'' VALUECD, ''Y'' VALUE, ''Corebank'' DISPLAY FROM DUAL
UNION ALL
SELECT ''N'' VALUECD, ''N'' VALUE, ''Tại BSC'' DISPLAY FROM DUAL
', '', 'ALL', 'Y', 'N', 'Y', '', '', 'N', 'C', '', '', '', '', '', '', '', '', '', '', '', '', 'Y', 'C', 'N');
SELECT CDVAL VALUE,CDVAL VALUECD, CDCONTENT DISPLAY, CDCONTENT EN_DISPLAY, CDCONTENT DESCRIPTION
FROM (SELECT CDVAL, CDCONTENT, LSTODR FROM ALLCODE WHERE CDTYPE = ''CF'' AND CDNAME = ''BANKNAME''
      UNION SELECT ''ALL'' CDVAL, ''Tất cả'' CDCONTENT, -1 LSTODR FROM DUAL
      ) ORDER BY LSTODR', '', 'ALL', 'Y', 'N', 'Y', '', '', 'Y', 'C', '', '', '', '', '', '', '', '', '', '', '', '', 'Y', '', 'N');