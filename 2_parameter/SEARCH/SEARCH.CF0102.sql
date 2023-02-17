SET DEFINE OFF;
       (case when c.vsdstatus = ''C'' then ''DELE'' else ''REGI'' end) ACCLINKTYPE
from cfdomain c, cfmast cf, domain d, allcode a0
where c.custid = cf.custid
      and c.vsdstatus = a0.cdval and a0.cdname = ''CFDOMAINSTS''
      and c.vsdstatus in (''P'',''C'',''F'')
      and cf.nsdstatus in (''C'',''W'')
      and c.domaincode = d.domaincode', 'CF0102', 'frm', 'CUSTODYCD', '0102', 0, 50, 'N', 30, 'NNNNYNYNNN', 'Y', 'T', '', 'N', '', '');