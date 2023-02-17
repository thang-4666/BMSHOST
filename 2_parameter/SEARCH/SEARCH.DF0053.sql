SET DEFINE OFF;
    DECODE(DF.LIMITCHK,''N'',0,1) LIMITCHECK ,
    DF.ORGAMT AMT, NVL(LNS.NML,0) + NVL(LNS.OVD,0) LNAMT, NVL(LNS.PAID,0) PAIDAMT , DF.LNACCTNO , DF.STATUS DEALSTATUS ,DF.ACTYPE ,DF.RRTYPE, DF.DFTYPE, DF.CUSTBANK, DF.CIACCTNO,DF.FEEMIN,
    DF.TAX,DF.AMTMIN,DF.IRATE,DF.MRATE,DF.LRATE,DF.RLSAMT,DF.DESCRIPTION,
    (case when df.ciacctno is not null then df.ciacctno when df.custbank is not null then   df.custbank else '''' end )
    RRID , decode (df.RRTYPE,''O'',1,0) CIDRAWNDOWN,decode (df.RRTYPE,''B'',1,0) BANKDRAWNDOWN,
    decode (df.RRTYPE,''C'',1,0) CMPDRAWNDOWN,dftype.AUTODRAWNDOWN,df.calltype,
    A4.CDCONTENT RRTYPENAME, CF.MOBILESMS FAX1, CF.EMAIL, ci.mblock DFBLOCKAMT
from dftype, afmast af , cfmast cf, allcode A4, cimast ci,
     dfgroup df LEFT JOIN LNSCHD LNS ON DF.LNACCTNO = LNS.ACCTNO AND LNS.REFTYPE=''P''
where df.afacctno= af.acctno and af.acctno=ci.acctno and af.custid= cf.custid and df.actype=dftype.actype
and A4.cdname = ''RRTYPE'' and A4.cdtype =''DF'' AND A4.CDVAL = DF.RRTYPE AND
dftype.isvsd=''N''', 'DFGROUP', 'frmViewDFMAST', 'GROUPID DESC', '', NULL, 50, 'N', 30, 'NYNNYYYNNN', 'Y', 'T', '', 'N', '', '');