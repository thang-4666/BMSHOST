SET DEFINE OFF;
rate1 , rate2, rate3, lncf.opndate, lncf.valdate,
lncf.expdate,cf.fullname, cf.custodycd,a3.cdcontent status, lncf.afacctno,
(CASE WHEN lncf.STATUS IN (''A'') THEN ''Y'' ELSE ''N'' END) EDITALLOW,
(CASE WHEN lncf.STATUS IN (''P'') THEN ''Y'' ELSE ''N'' END) APRALLOW, ''Y'' DELALLOW
FROM lnprminmast lnm, lnprmintcf lncf, cfmast cf, allcode al , allcode a3
WHERE lnm.autoid = lncf.refid
AND lncf.custid = cf.custid
AND al.cdval = lnm.typeln
AND al.cdname = ''LOANTYPE''
and a3.cdname =''APPRV_STS''
and a3.cdval =lncf.status
AND al.cdtype =''LN'' order by  CF.CUSTODYCD', 'LNPRMINTCF', 'frmLNPRMINTCF', '', '', 0, 50, 'N', 30, '', 'Y', 'T', '', 'N', '', '');