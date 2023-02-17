SET DEFINE OFF;
       (case when c.vsdstatus = ''A'' then ''REGI'' else ''DELE'' end) ACCLINKTYPE
from cfdomain c, cfmast cf, domain d, allcode a0
where c.custid = cf.custid
      and c.vsdstatus = a0.cdval and a0.cdname = ''CFDOMAINSTS''
      and c.vsdstatus in (''A'',''U'')
      and c.domaincode = d.domaincode', 'CF0103', 'frm', 'CUSTODYCD', '0103', 0, 50, 'N', 30, 'NNNNYNYNNN', 'Y', 'T', 'CUSTODYCD', 'N', '', '');