SET DEFINE OFF;
  SELECT ''B'' VALUE ,''Chi nhánh'' DISPLAY, ''Branch'' EN_DISPLAY, ''Chi nhánh'' description, 1 odrnum FROM dual
  UNION all
  SELECT ''G'' VALUE ,''Nhóm KH'' DISPLAY, ''Group'' EN_DISPLAY, ''Nhóm KH'' description, 2 odrnum FROM dual
  UNION ALL
  SELECT ''U'' VALUE ,''Người sử dụng'' DISPLAY, ''User'' EN_DISPLAY, ''Người sử dụng'' description, 3 odrnum FROM dual
  ) ORDER BY odrnum ', '', '', 'Y', 'N', 'Y', '', '', 'Y', 'C', '', '', '', '', '', '', '', '', '', '', '', '', 'Y', 'T', 'N');
UNION ALL
SELECT objid FILTERCD,objid VALUE,objid VALUECD,objname DISPLAY, objname EN_DISPLAY,objname DESCRIPTION  FROM
(SELECT  ''B'' || br.brid objid, br.brname||''-''||br.brid  objname, ''B'' IDTYPE
FROM brgrp br
UNION ALL
SELECT  ''G'' || tlg.grpid objid, tlg.grpname||''-''||tlg.grpid  objname, ''G'' IDTYPE
FROM tlgroups tlg WHERE TLG.GRPTYPE=''2'' AND TLG.ACTIVE=''Y''
UNION ALL
SELECT ''U'' || tl.tlid objid, tl.tlname||''-''||tl.tlid  objname, ''U'' IDTYPE
FROM tlprofiles tl ) WHERE  SUBSTR(objid,1,1)= UPPER(''<$TAGFIELD>'')

ORDER BY DISPLAY,VALUE', '', 'Y', 'C', 'N');