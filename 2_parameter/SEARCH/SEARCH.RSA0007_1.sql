SET DEFINE OFF;
(SELECT ''Branch'' objtype, ''B'' || br.brid objid, br.brname objname
FROM brgrp br
UNION ALL
SELECT ''Group'' objtype, ''G'' || tlg.grpid objid, tlg.grpname objname
FROM tlgroups tlg WHERE TLG.GRPTYPE=''2''
UNION ALL
SELECT ''User'' objtype, ''U'' || tl.tlid objid, tl.tlname objname
FROM tlprofiles tl) A
WHERE 0 = 0 ', 'TLGROUPS', 'frmTLGROUPS', 'OBJTYPE, OBJID', '', NULL, 50, 'N', 30, '', 'Y', 'T', '', 'N', '', '');