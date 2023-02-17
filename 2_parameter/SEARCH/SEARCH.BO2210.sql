SET DEFINE OFF;
    BON.ENDDATE, BON.INTERRESTRATE, BON.AMT2, BON.AMT1, BON.QTTY, BON.PARTNER, SB.SYMBOL, SB.CODEID, od.exectype, BON.TERM, OD.CLEARDAY,
    (CASE WHEN od.exectype = ''NB'' THEN ''NS'' ELSE ''NB'' END ) REFexectype
from  bondrepo bon, vw_odmast_all od, afmast af, cfmast cf, sbsecurities SB
where bon.refrepoacctno Is null
      And bon.enddate <= getcurrdate and bon.status = ''A'' and od.deltd <> ''Y''
      and bon.orderid = od.orderid and od.afacctno = af.acctno AND NVL(OD.execqtty,0) > 0
 and af.custid = cf.custid AND OD.codeid = SB.codeid', 'BONDIPO', 'frmBONDIPO', '', '2210', NULL, 50, 'N', 30, 'NYNNYYYNNN', 'Y', 'T', '', 'N', '', '');