SET DEFINE OFF;
FROM (SELECT brid, brname, 1 lstodr FROM brgrp
      UNION ALL SELECT ''ALL'' brid, ''ALL'' brname, -1 lstodr FROM DUAL
      UNION ALL SELECT ''00011'' brid, ''Phong giao dich Giang Vo'' brname, 2 lstodr FROM DUAL
      UNION ALL SELECT ''01011'' brid, ''VPĐD Đồng Nai'' brname, 2 lstodr FROM DUAL
      UNION ALL SELECT ''01012'' brid, ''VPĐD An Giang'' brname, 2 lstodr FROM DUAL) ORDER BY lstodr', '', 'ALL', 'Y', 'N', 'Y', '', '', 'Y', 'C', '', '', '', '', '', '', '', '', '', '', '', '', 'Y', 'T', 'N');
UNION ALL SELECT ''Y'' VALUECD, ''Y'' VALUE, ''CP&&CCQ'' DISPLAY FROM DUAL
UNION ALL SELECT ''N'' VALUECD, ''N'' VALUE, ''Trái phiếu'' DISPLAY FROM DUAL ', '', 'ALL', 'Y', 'N', 'Y', '', '', 'N', 'C', '', '', '', '', '', '', '', '', '', '', '', '', 'Y', 'C', 'N');