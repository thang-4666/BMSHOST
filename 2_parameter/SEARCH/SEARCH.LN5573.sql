SET DEFINE OFF;
cf.address,cf.custodycd,ROUND(lnc.nml) AMT,lnc.overduedate,lntype.typename  PRODUCTNAME
from  lnschd lnc , lnmast ln, afmast af , cfmast cf,lntype
where lnc.acctno = ln.acctno and ln.trfacctno= af.acctno
and af.custid = cf.custid  and lntype.actype= ln.actype', 'SEMAST', 'frmSEMAST', '', '5573', NULL, 50, 'N', 30, 'NYNNYYYNNN', 'Y', 'T', '', 'N', '', '');