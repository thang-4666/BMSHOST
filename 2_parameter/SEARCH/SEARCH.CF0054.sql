SET DEFINE OFF;
SELECT   B1.CUSTODYCD,
         B2.CUSTODYCD CUSTODYCD_N,
         B2.FULLNAME
  FROM   CFOTHERACC A, CFMAST B1, CFMAST B2,AFMAST AF
 WHERE   TYPE = ''0'' AND A.CFCUSTID = B1.CUSTID
 AND A.CIACCOUNT=AF.ACCTNO
 AND AF.CUSTID =B2.CUSTID', 'AFMAST', '', '', '', NULL, 100, 'N', 30, '', 'Y', 'T', '', 'N', '', 'CUSTODYCD');