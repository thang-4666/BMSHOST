SET DEFINE OFF;
CREATE OR REPLACE FORCE VIEW VW_ORDERPTADV
(AUTOID, CREATETIME, SECURITYSYMBOL, SIDE, VOLUME, 
 PRICE, CONTACT, BOARD, STATUS, REASON, 
 SENDTIME, DELETED, ISSEND, ISACTIVE)
BEQUEATH DEFINER
AS 
SELECT OD.AUTOID, OD.TIMESTAMP CREATETIME, OD.SECURITYSYMBOL, CD0.CDCONTENT SIDE, OD.VOLUME,
       OD.PRICE, OD.CONTACT, CD1.CDCONTENT BOARD, CD2.CDCONTENT STATUS, 'N/A' REASON, OD.SENDTIME,
       OD.DELETED, OD.ISSEND, OD.ISACTIVE
FROM ALLCODE CD0, ALLCODE CD1, ALLCODE CD2, ORDERPTADV OD
     LEFT JOIN (SELECT AUTOID, REFID FROM ORDERPTADV WHERE MESSAGETYPE = 'C' AND STATUS <> 'R') OC ON OD.AUTOID = OC.REFID(+)
WHERE CD0.CDTYPE = 'OD' AND CD0.CDNAME = 'BORS' AND CD0.CDVAL = OD.SIDE
  AND CD1.CDTYPE = 'OD' AND CD1.CDNAME = 'BOARD' AND CD1.CDVAL = OD.BOARD
  AND CD2.CDTYPE = 'OD' AND CD2.CDNAME = 'ADVSTATUS'
  AND CASE WHEN OC.AUTOID IS NOT NULL AND od.status <> 'C' THEN 'E'
           WHEN OD.DELETED = 'Y' THEN 'D'
           WHEN OD.ISACTIVE = 'N' THEN 'P'
           WHEN OD.STATUS = 'N' AND OD.ISSEND = 'Y' THEN 'B'
           ELSE OD.STATUS
      END = CD2.CDVAL
  AND OD.MESSAGETYPE = 'N'
ORDER BY OD.TIMESTAMP DESC
/