SET DEFINE OFF;
from vw_mr0101 v, (select * from tlgroups where GRPTYPE = ''2'') t
where v.careby = t.grpid(+)
and exists (SELECT 1 FROM TLGRPUSERS TLGRP WHERE TLGRP.GRPID = v.CAREBY and TLID = ''<$TELLERID>'')', 'MRTYPE', '', '', '', NULL, 50, 'N', 30, 'NYNNYYYNNN', 'Y', 'T', '', 'N', '', '');