SET DEFINE OFF;
FN_CRB_GETVOUCHERNO(MST.TRFCODE, MST.TXDATE, MST.VERSION) VOUCHERNO,
A0.CDCONTENT DESC_STATUS, A1.CDCONTENT DESC_TRFCODE, ERR.ERRDESC,
DECODE(MST.STATUS,''P'',''Y'',''N'') APRALLOW, DECODE(MST.STATUS,''P'',''Y'',''N'') EDITALLOW
FROM CRBTRFLOG MST, ALLCODE A0, ALLCODE A1,DEFERROR ERR
WHERE A0.CDTYPE=''RM'' AND A0.CDNAME=''TRFLOGSTS'' AND A0.CDVAL=MST.STATUS
AND A1.CDTYPE=''SY'' AND A1.CDNAME=''TRFCODE'' AND A1.CDVAL=MST.TRFCODE
AND MST.TRFCODE IN (''LOANDRAWNDOWN'',''LOANPAYMENT'')
AND MST.ERRCODE=ERR.ERRNUM(+)', 'CRBTRFLOG', 'frmPRINT', '', '', NULL, 50, 'N', 0, 'NYYNYYNNNNY', 'Y', 'T', '', 'N', '', '');