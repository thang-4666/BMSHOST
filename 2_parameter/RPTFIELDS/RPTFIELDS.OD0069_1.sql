SET DEFINE OFF;
SELECT CDVAL VALUE,CDVAL VALUECD, CDCONTENT DISPLAY, CDCONTENT EN_DISPLAY, CDCONTENT DESCRIPTION
FROM (SELECT CDVAL, CDCONTENT, LSTODR FROM ALLCODE WHERE CDTYPE = ''CF'' AND CDNAME = ''BANKNAME''
      UNION SELECT ''000'' CDVAL, ''Cty chứng khoán'' CDCONTENT, 0 LSTODR FROM DUAL
      UNION SELECT ''ALL'' CDVAL, ''Tất cả'' CDCONTENT, -1 LSTODR FROM DUAL
      ) ORDER BY LSTODR', '', 'ALL', 'Y', 'N', 'Y', '', '', 'Y', 'C', '', '', '', '', '', '', '', '', '', '', '', '', 'Y', '', 'N');
FROM (SELECT BRID, BRNAME ,1 LSTODR FROM BRGRP UNION ALL SELECT ''ALL'' BRID ,''ALL'' BRNAME ,-3 LSTODR FROM DUAL
UNION ALL select ''GROUP1'' BRID , (brname_0002 || '' , '' || brname_0001 || '' , '' || brname_0003) BRNAME, -2 LSTODR
from(select max(case when brid = ''0002'' then brname else '''' end) brname_0002,
max(case when brid = ''0001'' then brname else '''' end) brname_0001,
max(case when brid = ''0003'' then brname else '''' end) brname_0003
from BRGRP where brid in (''0002'',''0001'',''0003''))
UNION ALL
select ''GROUP2'' BRID , (brname_0101 || '' , '' || brname_0102 || '' , '' || brname_0103) BRNAME,-1 LSTODR
from(
select max(case when brid = ''0101'' then brname else '''' end) brname_0101,
max(case when brid = ''0102'' then brname else '''' end) brname_0102,
max(case when brid = ''0103'' then brname else '''' end) brname_0103
from BRGRP where brid in (''0101'',''0102'',''0103''))
)ORDER BY LSTODR ', '', 'ALL', 'Y', 'N', 'Y', '', '', 'Y', 'C', '', '', '', '', '', '', '', '', '', '', '', '', 'Y', 'T', 'N');
SELECT ''ALL'' VALUECD, ''ALL'' VALUE, ''ALL'' DISPLAY FROM DUAL
UNION ALL
SELECT ''C'' VALUECD, ''C'' VALUE, ''Môi giới trong nước'' DISPLAY FROM DUAL
UNION ALL
SELECT ''F'' VALUECD, ''F'' VALUE, ''Môi giới nước ngoài'' DISPLAY FROM DUAL
UNION ALL
SELECT ''P'' VALUECD, ''P'' VALUE, ''Tự doanh'' DISPLAY FROM DUAL
', '', 'ALL', 'Y', 'N', 'Y', '', '', 'N', 'C', '', '', '', '', '', '', '', '', '', '', '', '', 'Y', 'C', 'N');
SELECT CDVAL VALUE, CDVAL VALUECD, CDCONTENT DISPLAY, CDCONTENT EN_DISPLAY, CDCONTENT DESCRIPTION, CDCONTENT EN_DESCRIPTION
FROM (SELECT ''ALL'' CDVAL, ''ALL'' CDCONTENT, 0 LSTODR FROM DUAL
      UNION
      SELECT ''T0'' CDVAL, ''T0'' CDCONTENT, 1 LSTODR FROM DUAL
      UNION
      SELECT ''T2'' CDVAL, ''T2'' CDCONTENT, 2 LSTODR FROM DUAL)
ORDER BY LSTODR
', '', 'ALL', 'Y', 'N', 'Y', '', '', 'N', 'C', '', '', '', '', '', '', '', '', '', '', '', '', 'Y', 'C', 'N');