SET DEFINE OFF;
   FROM vw_tllog_all lg, afmast af, cfmast cf
   WHERE af.custid = cf.custid AND lg.msgacct = af.acctno
   AND lg.tltxcd = ''0088''
   group by cf.custodycd,cf.fullname, cf.custid,
   cf.idcode, cf.iddate, cf.idplace, cf.address) where 0=0 ', 'CFLINK', 'frmCFMAST', '', '', NULL, 50, 'N', 30, '', 'Y', 'T', '', 'N', '', '');