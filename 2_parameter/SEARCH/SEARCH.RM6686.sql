SET DEFINE OFF;
, MST.CREATETST, MST.SENDTST,FN_CRB_GETVOUCHERNO(MST.TRFCODE, MST.TXDATE, MST.VERSION) VOUCHERNO,MST.TRFCODE,MST.STATUS,
A0.CDCONTENT DESC_STATUS,ERR.ERRDESC, A1.CDCONTENT DESC_TRFCODE,MST.NOTES,MST.TLID,TL.TLNAME,MST.OFFID,TL1.TLNAME OFFNAME
FROM CRBTRFLOG MST, ALLCODE A0, ALLCODE A1,TLPROFILES TL,TLPROFILES TL1,CRBDEFBANK CRB,DEFERROR ERR
WHERE MST.TLID=TL.TLID(+) AND MST.OFFID = TL1.TLID(+) AND MST.ERRCODE=ERR.ERRNUM(+)
AND MST.REFBANK=CRB.BANKCODE(+) AND A0.CDTYPE=''RM'' AND A0.CDNAME=''TRFLOGSTS''
AND A0.CDVAL=MST.STATUS AND A1.CDTYPE=''SY'' AND A1.CDNAME=''TRFCODE''
AND MST.TRFCODE NOT IN (
    SELECT DISTINCT TRFCODE FROM CRBDEFACCT WHERE cspks_rmproc.is_number(MSGID)=1
)
AND A1.CDVAL=MST.TRFCODE AND MST.STATUS IN (''A'')', 'CRBTRFLOG', '', '', '6686', 0, 50, 'N', 30, '', 'Y', 'T', '', 'N', '', '');