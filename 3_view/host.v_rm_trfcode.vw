SET DEFINE OFF;
CREATE OR REPLACE FORCE VIEW V_RM_TRFCODE
(AUTOID, VERSION, VERSIONLOCAL, TXDATE, AFFECTDATE, 
 CRDATE, REFBANK, BANKQUEUE, TRFCODE, CREATETST, 
 SENDTST, VOUCHERNO, AMT, ITEMCNT, STATUS, 
 CHECKSTATUS, DESC_STATUS, DESC_TRFCODE, ERRDESC, APRALLOW, 
 EDITALLOW, DISPALLOW)
BEQUEATH DEFINER
AS 
SELECT MST.AUTOID, MST.VERSION,MST.VERSIONLOCAL, MST.TXDATE, MST.AFFECTDATE,DTL.CRDATE,
MST.REFBANK||':'||A2.CDCONTENT REFBANK,MST.REFBANK BANKQUEUE,MST.TRFCODE, MST.CREATETST, MST.SENDTST,
FN_CRB_GETVOUCHERNO(MST.TRFCODE, MST.TXDATE, MST.VERSION) VOUCHERNO,DTL.AMT,DTL.ITEMCNT,
CASE WHEN MST.STATUS='E' AND DTL.STATUS='Z' THEN 'D' ELSE MST.STATUS END STATUS,
CASE WHEN (MST.STATUS='S' AND MST.AFFECTDATE>(SELECT TO_DATE(SYS.VARVALUE,'DD/MM/RRRR')
                                              FROM SYSVAR SYS WHERE SYS.VARNAME='CURRDATE'))
           OR MST.STATUS IN ('F','C','B') THEN 'Y'
     WHEN MST.STATUS='H' AND DTL.STATUS='Z' THEN 'Y'
     WHEN CASE WHEN MST.STATUS='E' AND DTL.STATUS='Z' THEN 'D' ELSE MST.STATUS END='D' THEN 'Y'
           ELSE 'N' END CHECKSTATUS,
A0.CDCONTENT DESC_STATUS, A1.CDCONTENT DESC_TRFCODE, ERR.ERRDESC,
DECODE(MST.STATUS,'P','Y','N') APRALLOW, DECODE(MST.STATUS,'P','Y','N') EDITALLOW,
CASE WHEN MST.STATUS IN ('B') THEN 'N' ELSE 'Y' END DISPALLOW
FROM CRBTRFLOG MST, ALLCODE A0, ALLCODE A1,DEFERROR ERR,CRBDEFACCT CRA,ALLCODE A2,
(
    SELECT DTL.BANKCODE,DTL.VERSION,DTL.TRFCODE,DTL.TXDATE,MAX(REQ.TXDATE) CRDATE,SUM(DTL.AMT) AMT,COUNT(DTL.AUTOID) ITEMCNT,
    MAX(CASE WHEN DTL.STATUS IN ('D','B') THEN 'Z' ELSE 'A' END) STATUS
    FROM CRBTRFLOGDTL DTL,CRBTXREQ REQ
    WHERE DTL.REFREQID=REQ.REQID
    GROUP BY DTL.BANKCODE,DTL.VERSION,DTL.TRFCODE,DTL.TXDATE
) DTL
WHERE A0.CDTYPE='RM' AND A0.CDNAME='TRFLOGSTS' AND A0.CDVAL=(CASE WHEN MST.STATUS='E' AND DTL.STATUS='Z' THEN 'D' ELSE MST.STATUS END)
AND A1.CDTYPE='SY' AND A1.CDNAME='TRFCODE' AND A1.CDVAL=MST.TRFCODE
AND MST.REFBANK=A2.CDVAL AND A2.CDNAME='BANKNAME' AND A2.CDTYPE='CF'
AND MST.TRFCODE=CRA.TRFCODE
AND MST.REFBANK=CRA.REFBANK AND cspks_rmproc.is_number(CRA.MSGID)=1
AND MST.REFBANK=DTL.BANKCODE AND MST.TRFCODE=DTL.TRFCODE AND MST.TXDATE=DTL.TXDATE
AND MST.VERSION=DTL.VERSION AND MST.ERRCODE=ERR.ERRNUM(+)
AND MST.VERSION IS NOT NULL
AND MST.VERSIONLOCAL IS NOT NULL AND MST.VERSIONLOCAL <>'---' AND cspks_rmproc.is_number(CRA.MSGID)=1 AND (MST.STATUS IN ('S') or (MST.STATUS = 'E'))
ORDER BY MST.TXDATE DESC,MST.AFFECTDATE DESC,MST.REFBANK,MST.VERSION DESC
/