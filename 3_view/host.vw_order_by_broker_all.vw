SET DEFINE OFF;
CREATE OR REPLACE FORCE VIEW VW_ORDER_BY_BROKER_ALL
(ORDERID, AFACCTNO, CODEID, DFACCTNO, VIA, 
 BRID, BRNAME, TLID, TLNAME, EXECTYPE, 
 TXDATE, TXTIME)
BEQUEATH DEFINER
AS 
SELECT E.ORGACCTNO ORDERID, e.afacctno, e.codeid, e.dfacctno, e.via, BR.BRID, BR.BRNAME, e.username tlid,  nvl(F.TLNAME, 'ONLINE') TLNAME, E.EXECTYPE, TO_DATE(SUBSTR(CREATEDDT,1,10), 'DD/MM/YYYY') txdate, TO_CHAR(LAST_CHANGE, 'HH24:MI:SS') TXTIME
FROM  (Select * from Fomast union all Select * from fomasthist) E, TLPROFILES F, BRGRP BR
WHERE E.USERNAME = F.TLID(+)
      AND LENGTH(ORGACCTNO) = 16
      AND F.BRID=BR.BRID
UNION
SELECT B.ORDERID, b.afacctno, b.codeid, b.dfacctno, b.via, BRF.BRID, BRF.BRNAME, a.tlid,  NVL(D.TLNAME,'ONLINE') TLNAME, B.EXECTYPE, to_date(A.TXDATE, 'dd/mm/yyyy') txdate, B.TXTIME
FROM Vw_Tllog_All A, Vw_Odmast_All B, TLPROFILES D, BRGRP BRF
WHERE A.TXNUM = B.TXNUM AND A.TLID <> '0000' AND A.TLID = D.TLID(+)
       AND A.TXDATE = B.TXDATE AND b.via <> 'B'
       AND D.BRID=BRF.BRID
/
