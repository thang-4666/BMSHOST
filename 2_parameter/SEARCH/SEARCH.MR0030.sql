SET DEFINE OFF;
from vw_mr0030 v
where exists (SELECT 1 FROM TLGRPUSERS TLGRP WHERE TLGRP.GRPID = v.CAREBY and TLID = ''<$TELLERID>'')', 'MRTYPE', '', '', '', NULL, 50, 'N', 30, 'NYNNYYYNNN', 'Y', 'T', '', 'N', '', '');