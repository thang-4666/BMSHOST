SET DEFINE OFF;
DF.ORGAMT -DF.RLSAMT AMT, DF.LNACCTNO , DF.STATUS DEALSTATUS ,DF.ACTYPE ,DF.RRTYPE, DF.DFTYPE, DF.CUSTBANK, DF.CIACCTNO,DF.FEEMIN,
DF.TAX,DF.AMTMIN,DF.IRATE,DF.MRATE,DF.LRATE,DF.RLSAMT,DF.DESCRIPTION,df.txdate ,
(case when df.ciacctno is not null then df.ciacctno when df.custbank is not null then   df.custbank else '''' end )
RRID , decode (df.RRTYPE,''O'',1,0) CIDRAWNDOWN,decode (df.RRTYPE,''B'',1,0) BANKDRAWNDOWN,
decode (df.RRTYPE,''C'',1,0) CMPDRAWNDOWN,dftype.AUTODRAWNDOWN,df.calltype
from dfgroup df, dftype, lnmast ln, afmast af , cfmast cf, allcode al1,V_DFGRPAMT V
where df.lnacctno= ln.acctno and df.afacctno= af.acctno and af.custid= cf.custid and df.actype=dftype.actype
and df.flagtrigger=al1.cdval and al1.cdname=''FLAGTRIGGER''AND V.GROUPID = DF.GROUPID', 'DFGROUP', '', 'GROUPID DESC', '', NULL, 50, 'N', 30, '', 'Y', 'T', '', 'N', '', '');