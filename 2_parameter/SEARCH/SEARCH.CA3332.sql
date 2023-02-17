SET DEFINE OFF;
cs.AUTOID caschdid, ca.camastid, ca.DESCRIPTION, ca.codeid, sb.symbol, cs.amt, cs.qtty, cs.aqtty, cs.pqtty, cs.rqtty, cs.trade, cs.isse, cs.isci,
a1.cdcontent CATYPE,(case when ca.catype=''014'' then ''Y'' else ''N'' end) ISRIGHTOFF
from camast ca, caschd cs,  cfmast cf, afmast af, sbsecurities sb,allcode A1
where ca.camastid = cs.camastid
and ca.deltd <> ''Y'' and cs.deltd <> ''Y''
and cs.afacctno = af.acctno and af.custid = cf.custid
and ca.codeid = sb.codeid
and cs.STATUS IN (''V'',''S'',''G'',''H'',''M'',''A'') and ca.STATUS IN (''V'',''S'',''I'',''G'',''H'',''M'',''A'')
AND ((cs.ISCI =''N'' and cs.AMT > 0) or (cs.ISSE =''N'' and (cs.qtty > 0 OR cs.Aqtty>0)) or cs.rqtty > 0
or (ca.catype=''014'' and cs.status in (''V'',''M'')))
and cs.ISCI = ''N'' and cs.ISSE =''N''
and a1.cdname=''CATYPE'' and a1.cdval=ca.catype and a1.cdtype=''CA''
', 'CAMAST', '', '', '3332', NULL, 50, 'N', 30, 'NYNNYYYNNN', 'Y', 'T', '', 'N', '', 'CUSTODYCD');