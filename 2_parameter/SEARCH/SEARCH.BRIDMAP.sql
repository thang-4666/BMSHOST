SET DEFINE OFF;
SELECT bridmap.autoid, bridmap.prcode, bridmap.brid, decode(bridmap.brid,''ALL'',''Toan he thong'',brgrp.brname) brname FROM bridmap, brgrp WHERE bridmap.brid = brgrp.brid(+) AND bridmap.prcode = ''<$KEYVAL>''
', 'PR.BRIDMAP', 'BRID', '', '', NULL, 50, 'N', 30, '', 'Y', 'T', '', 'N', '', '');