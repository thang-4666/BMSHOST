SET DEFINE OFF;
    mrt.mrtype||'': ''|| AF.ACCTNO || '': '' || AFT.TYPENAME DISPLAY,
    mrt.mrtype||'': ''|| AF.ACCTNO || '': '' || AFT.TYPENAME EN_DISPLAY, CF.FULLNAME DESCRIPTION
FROM CFMAST CF, AFMAST AF, AFTYPE AFT, mrtype mrt
WHERE CF.CUSTID=AF.CUSTID AND AF.ACTYPE=AFT.ACTYPE
AND af.status <> ''C'' AND af.actype = aft.actype
and aft.mrtype = mrt.actype AND CF.CUSTID = ''<$TAGFIELD>''', 'N', 'P_ACCTNO', 'Y', '', 'N', '', '', '', 'N');