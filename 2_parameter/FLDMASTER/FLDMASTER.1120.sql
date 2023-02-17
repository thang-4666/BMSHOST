SET DEFINE OFF;
select ''---'' VALUE, ''---'' VALUECD, ''---'' DISPLAY, ''---'' EN_DISPLAY
from dual
union all
SELECT cf.custodycd VALUE,cf.custodycd VALUECD,
cf.custodycd ||'': ''|| cf.fullname DISPLAY,cf.custodycd ||'': ''|| cf.fullname EN_DISPLAY
FROM cflink lnk, cfmast cf , cfmast cf2, afmast af2
WHERE lnk.acctno=''<$TAGFIELD>''
AND lnk.custid=cf.custid AND SUBSTR(lnk.linkauth,3,1)=''Y''
and lnk.acctno=af2.acctno
and af2.custid=cf2.custid
AND cf2.custtype=''B''
UNION ALL
SELECT cf.custodycd VALUE,cf.custodycd VALUECD,
cf.custodycd ||'': ''|| cf.fullname DISPLAY,cf.custodycd ||'': ''|| cf.fullname EN_DISPLAY
FROM cfauth cfa, cfmast cf
WHERE acctno=''<$TAGFIELD>''
AND cfa.custid=cf.custid AND SUBSTR(cfa.linkauth,3,1)=''Y'')
', 'N', 'P_CUSTODYCD3', 'Y', '', 'N', '', '', '', 'N');