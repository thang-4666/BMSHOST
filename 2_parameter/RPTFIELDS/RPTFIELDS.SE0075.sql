SET DEFINE OFF;
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
from BRGRP where brid in (''0101'',''0102'',''0103'')
))ORDER BY LSTODR ', '', 'ALL', 'Y', 'N', 'Y', '', '', 'Y', 'C', '', '', '', '', '', '', '', '', '', '', '', '', 'Y', 'T', 'N');