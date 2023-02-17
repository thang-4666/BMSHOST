SET DEFINE OFF;
FROM AFMAST AF, CIMAST CI, SEMAST SE, CFMAST CF,
(SELECT mst.catype, schd.* FROM CASCHD schd, camast mst WHERE mst.camastid = schd.camastid AND schd.DELTD=''N'') CA, AFTYPE TYP, sbsecurities sb
WHERE TYP.ACTYPE=AF.ACTYPE AND AF.ACCTNO= CI.ACCTNO AND CF.CUSTID=AF.CUSTID AND  AF.ACCTNO =SE.AFACCTNO(+) AND sb.codeid = nvl(se.codeid,sb.codeid)
AND AF.STATUS=''N'' AND AF.ACCTNO = CA.AFACCTNO (+)
AND (CA.AFACCTNO IS NULL OR CA.STATUS NOT IN (''A'',''S'') or (ca.isse = ''Y'' AND ca.qtty > 0) or (ca.isci = ''Y'' and ca.amt > 0) or (ca.status = ''A'' and ca.catype = ''014'')or (ca.status = ''S'' and ca.catype = ''014'' and ca.qtty = 0 ))
AND sb.sectype <> ''004''
GROUP BY AF.ACCTNO,CF.CUSTODYCD,AF.LASTDATE --,NVL(SE.LASTDATE,AF.LASTDATE)
HAVING SUM(NVL(SE.DTOCLOSE,0))+SUM(NVL(SE.trade,0)) +SUM(NVL(SE.blockdtoclose,0))=0', 'SEMAST', '', '', '2249', NULL, 50, 'N', 30, 'NYNNYYYNNN', 'Y', 'T', '', 'N', '', '');