SET DEFINE OFF;
ci.afacctno,af.corebank,ci.balance,ci.receiving,
ci.netting , holdbalance   from cimast ci, cfmast cf  ,
afmast af
where ci.custid= cf.custid
and ci.afacctno = af.acctno', 'BANKINFO', 'CI1180', 'CUSTODYCD, AFACCTNO', '', NULL, 50, 'N', 30, 'NYNNYYYNNN', 'Y', 'T', '', 'N', '', 'CUSTODYCD');