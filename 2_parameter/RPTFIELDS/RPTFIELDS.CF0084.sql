SET DEFINE OFF;
description FROM (SELECT ACTYPE, TYPENAME, 1 lstodr FROM CFTYPE )
ORDER BY lstodr, value', '', 'ALL', 'Y', 'N', 'Y', '', '', 'N', 'C', '', '', '', '', '', '', '', '', '', 'PV_CUSTODYCD', 'SELECT ACTYPE VALUE,ACTYPE VALUECD,  TYPENAME display, TYPENAME en_display, TYPENAME
description FROM (SELECT ACTYPE, TYPENAME, 1 lstodr FROM CFTYPE 
UNION ALL SELECT ''ALL'' brid, ''ALL'' brname, -1 lstodr FROM DUAL where upper(''<$TAGFIELD>'') <> ''ALL'')
ORDER BY lstodr, value', '', 'Y', 'C', 'N');