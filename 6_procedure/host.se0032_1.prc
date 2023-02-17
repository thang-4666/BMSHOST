SET DEFINE OFF;
CREATE OR REPLACE PROCEDURE "SE0032_1" (
   PV_REFCURSOR   IN OUT   PKG_REPORT.REF_CURSOR,
   OPT            IN       VARCHAR2,
   pv_BRID           IN       VARCHAR2,
   TLGOUPS        IN       VARCHAR2,
   TLSCOPE        IN       VARCHAR2,
   F_DATE         IN       VARCHAR2,
   T_DATE         IN       VARCHAR2,
   PV_CUSTODYCD   IN       VARCHAR2,
   PV_AFACCTNO    IN       VARCHAR2,
   PLSENT         in       varchar2
)
IS

-- RP NAME : BAO CAO BANG KE CHUNG KHOAN GIAY TO CO GIA
-- PERSON --------------DATE---------------------COMMENTS

-- ---------   ------  -------------------------------------------
   V_STRAFACCTNO  VARCHAR2 (15);
   V_CUSTODYCD VARCHAR2 (15);
   V_TYPE  VARCHAR2(10);
   V_FROMDATE DATE;
   V_TODATE DATE;
   V_CURRDATE date;
   v_flag number(2,0);
   V_INBRID        VARCHAR2(4);
   V_STRBRID      VARCHAR2 (50);
   V_STROPTION    VARCHAR2(5);

BEGIN
-- GET REPORT'S PARAMETERS
   V_STROPTION := upper(OPT);
   V_INBRID := pv_BRID;
    if(V_STROPTION = 'A') then
        V_STRBRID := '%%';
    else
        if(V_STROPTION = 'B') then
            select br.brid into V_STRBRID from brgrp br where  br.brid = V_INBRID;
        else
            V_STRBRID := V_INBRID;
        end if;
    end if;


    V_CUSTODYCD := upper( PV_CUSTODYCD);
    select to_date(varvalue,'DD/MM/RRRR') into V_CURRDATE
     from sysvar where varname = 'CURRDATE' and grname = 'SYSTEM';


   IF  (PV_AFACCTNO <> 'ALL')
   THEN
         V_STRAFACCTNO := PV_AFACCTNO;
   ELSE
         V_STRAFACCTNO := '%';
   END IF;

     V_FROMDATE := TO_DATE(F_DATE, 'DD/MM/RRRR');
     V_TODATE := TO_DATE(T_DATE, 'DD/MM/RRRR');

-- GET REPORT'S DATA
 OPEN PV_REFCURSOR
 FOR
SELECT PLSENT SENTO, FULLNAME, CUSTODYCD, ACCTNO,SYMBOL, IDCODE, IDDATE,IDPLACE, ADDRESS,MOBILE,RECUSTODYCD,RECUSTNAME,outward,
       SUM(QTTY) QTTY, parvalue,LOAI_CK,SAN,DEPOSITNAME,LD_CK,OPNDATE,EXPDATE,TERM,INTCOUPON, Gtcg
FROM(
SELECT CF.FULLNAME , CF.CUSTODYCD, AF.ACCTNO , SB2.SYMBOL SYMBOL,CF.IDCODE, CF.IDDATE,CF.IDPLACE,CF.ADDRESS,
       NVL(CF.MOBILE,'') MOBILE,OU.RECUSTODYCD, OU.RECUSTNAME, OU.outward,NVL(SB.ISSUEDATE,'') OPNDATE,NVL(SB.EXPDATE,'') EXPDATE,
      NVL(SB.TERM,0) TERM,NVL(SB.INTCOUPON,0)INTCOUPON, trade /*+  caqtty*/ + strade /*+  scaqtty*/ + ctrade /*+  ccaqtty*/ QTTY , SB.parvalue,
       CASE WHEN SB.REFCODEID IS NULL THEN  '1' ELSE '7'END LOAI_CK,
        CASE  when sb2.tradeplace='002' then 'HNX'
          when sb2.tradeplace='001' then 'HOSE'
          when sb2.tradeplace='005' then 'UPCOM'
          when sb2.tradeplace='007' then 'TRÁI PHIÊU CHUYÊN BIỆT'
          when sb2.tradeplace='008' then 'TÍN PHIẾU'
          when sb2.tradeplace='009' then 'ĐCCNY'
          else ''END SAN, PLSENT SENTO, MEM.FULLNAME DEPOSITNAME,
            to_number(ou.trtype) LD_CK, OU.Gtcg        
FROM SESENDOUT OU,  (SELECT * FROM CFMAST WHERE FNC_VALIDATE_SCOPE(BRID, CAREBY, TLSCOPE, pv_BRID, TLGOUPS)=0) CF, AFMAST AF, sbsecurities SB, sbsecurities SB2, deposit_member MEM,
 (SELECT * FROM VW_TLLOGFLD_ALL WHERE FLDCD='31') FLD,(SELECT * FROM VW_TLLOGFLD_ALL WHERE FLDCD='05') FLD1
WHERE OU.DELTD <> 'Y'
AND CF.CUSTID = AF.CUSTID
AND SUBSTR(OU.ACCTNO,1,10) = AF.ACCTNO
AND OU.CODEID = SB.CODEID
AND OU.TXDATE=FLD.TXDATE
AND OU.TXNUM=FLD.TXNUM
AND FLD.CVALUE='016'
AND OU.TXDATE=FLD1.TXDATE
AND OU.TXNUM=FLD1.TXNUM
AND FLD1.CVALUE='501'
AND OU.TXDATE <= V_TODATE AND  OU.TXDATE >= V_FROMDATE
AND OU.DELTD<>'Y'
AND NVL(SB.refcodeid,SB.codeid) = SB2.CODEID
AND OU.outward = MEM.depositid (+)
--AND OU.ID2255 IS NOT NULL
AND CF.CUSTODYCD = V_CUSTODYCD
AND AF.ACCTNO LIKE V_STRAFACCTNO
AND  TRADE /*+ CAQTTY*/ + STRADE /*+ SCAQTTY*/ + CTRADE /*+ CCAQTTY*/+BLOCKED + SBLOCKED + CBLOCKED > 0
AND (af.brid LIKE V_STRBRID or instr(V_STRBRID,af.brid) <> 0 )
)
GROUP BY FULLNAME, CUSTODYCD, ACCTNO,SYMBOL, IDCODE, IDDATE,IDPLACE, ADDRESS,MOBILE,RECUSTODYCD,RECUSTNAME,outward,
       parvalue,LOAI_CK,SAN,DEPOSITNAME,LD_CK,OPNDATE,EXPDATE,TERM,INTCOUPON,PLSENT, Gtcg
UNION ALL

SELECT PLSENT SENTO, FULLNAME, CUSTODYCD, ACCTNO,SYMBOL, IDCODE, IDDATE,IDPLACE, ADDRESS,MOBILE,RECUSTODYCD,RECUSTNAME,outward,
       SUM(QTTY) QTTY,parvalue,LOAI_CK,SAN,DEPOSITNAME,LD_CK,OPNDATE,EXPDATE,TERM,INTCOUPON, Gtcg
FROM(SELECT CF.FULLNAME , CF.CUSTODYCD, AF.ACCTNO , SB2.SYMBOL SYMBOL,CF.IDCODE, CF.IDDATE,CF.IDPLACE,CF.ADDRESS,
       NVL(CF.MOBILE,'') MOBILE,OU.RECUSTODYCD, OU.RECUSTNAME, OU.outward,NVL(SB.ISSUEDATE,'') OPNDATE,NVL(SB.EXPDATE,'') EXPDATE,
      NVL(SB.TERM,0) TERM,NVL(SB.INTCOUPON,0)INTCOUPON,
        blocked + sblocked + cblocked QTTY, SB.parvalue,
       CASE WHEN SB.REFCODEID IS NULL THEN  '2' ELSE '8'END LOAI_CK,
        CASE  when sb2.tradeplace='002' then 'HNX'
          when sb2.tradeplace='001' then 'HOSE'
          when sb2.tradeplace='005' then 'UPCOM'
          when sb2.tradeplace='007' then 'TRÁI PHIÊU CHUYÊN BIỆT'
          when sb2.tradeplace='008' then 'TÍN PHIẾU'
          when sb2.tradeplace='009' then 'ĐCCNY'
          else ''END SAN, PLSENT SENTO, MEM.FULLNAME DEPOSITNAME,
            to_number(ou.trtype) LD_CK,OU.Gtcg
FROM SESENDOUT OU,  (SELECT * FROM CFMAST WHERE FNC_VALIDATE_SCOPE(BRID, CAREBY, TLSCOPE, pv_BRID, TLGOUPS)=0) CF, AFMAST AF, sbsecurities SB, sbsecurities SB2, deposit_member MEM,
 (SELECT * FROM VW_TLLOGFLD_ALL WHERE FLDCD='31') FLD,(SELECT * FROM VW_TLLOGFLD_ALL WHERE FLDCD='05') FLD1
WHERE OU.DELTD <> 'Y'
AND CF.CUSTID = AF.CUSTID
AND SUBSTR(OU.ACCTNO,1,10) = AF.ACCTNO
AND OU.CODEID = SB.CODEID
AND OU.TXDATE=FLD.TXDATE
AND OU.TXNUM=FLD.TXNUM
AND FLD.CVALUE='016'
AND OU.TXDATE=FLD1.TXDATE
AND OU.TXNUM=FLD1.TXNUM
AND FLD1.CVALUE='501'
AND OU.TXDATE <= V_TODATE AND  OU.TXDATE >= V_FROMDATE
AND OU.DELTD<>'Y'
AND NVL(SB.refcodeid,SB.codeid) = SB2.CODEID
AND OU.outward = MEM.depositid (+)
--AND OU.ID2255 IS NOT NULL
AND CF.CUSTODYCD = V_CUSTODYCD
AND AF.ACCTNO LIKE V_STRAFACCTNO
AND  BLOCKED + SBLOCKED + CBLOCKED > 0
AND (af.brid LIKE V_STRBRID or instr(V_STRBRID,af.brid) <> 0 )
)
GROUP BY FULLNAME, CUSTODYCD, ACCTNO,SYMBOL, IDCODE, IDDATE,IDPLACE, ADDRESS,MOBILE,RECUSTODYCD,RECUSTNAME,outward,
       parvalue,LOAI_CK,SAN,DEPOSITNAME,LD_CK,OPNDATE,EXPDATE,TERM,INTCOUPON,PLSENT, Gtcg
ORDER BY SYMBOL
 ;

EXCEPTION
   WHEN OTHERS
   THEN
      RETURN;
END;

 
 
 
 
/