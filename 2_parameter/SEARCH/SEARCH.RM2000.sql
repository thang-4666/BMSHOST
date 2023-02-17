SET DEFINE OFF;
SELECT mst.REQID,mst.TRFCODE,mst.REFCODE,mst.TXDATE,mst.OBJKEY, cf.custodycd, mst.AFACCTNO,
    mst.diraccname accname,mst.TXAMT, mst.DIRBANKCODE BANKCODE,mst.BANKACCT,  mst.dirbankname
BANKNAME, mst.dirbankcity BANKCITY,
    fn_gettcdtdesbankacc(substr(mst.AFACCTNO,1,4)) DESACCTNO,  fn_gettcdtdesbankname(substr
(mst.AFACCTNO,1,4)) DESACCTNAME, A1.CDCONTENT STATUS, mst.NOTES, MST.ERRORDESC
FROM (select * from CRBTXREQ union all select * from CRBTXREQhist)MST,CIREMITTANCE rm, afmast af, cfmast cf, ALLCODE A1
WHERE MST.OBJTYPE = ''T'' AND MST.VIA = ''DIR'' and mst.afacctno = af.acctno and af.custid = cf.custid
and mst.txdate = rm.txdate (+) and rm.txnum(+) = mst.objkey
AND MST.STATUS = A1.CDVAL AND A1.CDTYPE = ''RM'' AND A1.CDNAME = ''CRBSTATUS''', 'CRBTXREQ', '', '', '6655', NULL, 50, 'N', 30, 'NYNNYYYNNN', 'Y', 'T', '', 'N', '', '');