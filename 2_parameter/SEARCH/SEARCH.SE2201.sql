SET DEFINE OFF;
SEWD.WITHDRAW  WITHDRAW,SEWD.blockWITHDRAW ,SEMAST.CODEID,SYM.PARVALUE,SEWD.PRICE  PRICE ,CF.FULLNAME, CF.IDCODE LICENSE, CF.IDDATE,CF.IDPLACE,CF.ADDRESS ,SEMAST.LASTDATE SELASTDATE,AF.LASTDATE AFLASTDATE, CONFIRMTXDATE LASTDATE,CF.CUSTODYCD,A1.CDCONTENT TRADEPLACE, SEWD.TXDATETXNUM, SEWD.TXDATE, SEWD.TXNUM,
SEWD.WITHDRAW+SEWD.blockWITHDRAW sumqtty, ISSU.fullname ISSFULLNAME,  TLP.tlfullname, BR.brid brname
FROM SEMAST,SBSECURITIES SYM,AFMAST AF,CFMAST CF,ALLCODE A1, SECURITIES_INFO SEINFO, SEWITHDRAWDTL SEWD,
    ISSUERS ISSU, tlprofiles TLP, brgrp BR
WHERE SYM.CODEID=SEINFO.CODEID
AND A1.CDTYPE = ''SE'' AND A1.CDNAME = ''TRADEPLACE'' AND A1.CDVAL = SYM.TRADEPLACE
AND BR.brid = ''<$BRID>'' AND TLP.tlid = ''<$TELLERID>''
AND CF.CUSTID =AF.CUSTID AND SYM.ISSUERID = ISSU.ISSUERID(+)
AND SYM.CODEID = SEMAST.CODEID
AND SEMAST.afacctno= AF.acctno
AND SEMAST.WITHDRAW +SEMAST.blockWITHDRAW>0
AND SEMAST.ACCTNO = SEWD.ACCTNO
AND SEWD.STATUS = ''A''
AND NOT EXISTS (
        select fld.cvalue  from tllog4dr tl, tllogfld4dr fld
        where tl.tltxcd =''2201''
        and tl.txnum = fld.txnum and tl.txdate = fld.txdate and fld.fldcd =''07''
        and tl.deltd <> ''Y'' and tl.txstatus =''4''
        and fld.cvalue = to_char(SEWD.txdate,''DD/MM/RRRR'') || SEWD.txnum
        and not  EXISTS (select 1 from tllog t where t.txnum = tl.txnum and t.deltd=''Y'' and txstatus =''1'')
     )', 'SEMAST', '', '', '2201', NULL, 50, 'N', 30, 'NYNNYYYNNN', 'Y', 'T', '', 'N', '', '');