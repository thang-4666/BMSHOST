SET DEFINE OFF;
SELECT   B.CUSTODYCD,
         BANKACC,
         b.fullname,
         BANKNAME,
         ACNIDCODE,
         ACNIDPLACE,
         CITYEF,
         CITYBANK,
         fEECD,
         A.BANKCODE, substr(B.custid,1,4) brid
  FROM   CFOTHERACC A, CFMAST B
 WHERE   TYPE = ''1'' AND A.CFCUSTID = B.CUSTID', 'AFMAST', '', '', '', NULL, 100, 'N', 30, '', 'Y', 'T', '', 'N', '', '');