SET DEFINE OFF;
CREATE OR REPLACE PROCEDURE "SE00314" (
   PV_REFCURSOR   IN OUT   PKG_REPORT.REF_CURSOR,
   OPT            IN       VARCHAR2,
   BRID           IN       VARCHAR2,
   TLGOUPS        IN       VARCHAR2,
   TLSCOPE        IN       VARCHAR2,
   F_DATE         IN       VARCHAR2,
   T_DATE         IN       VARCHAR2,
   PV_CUSTODYCD   IN       VARCHAR2,
   PV_AFACCTNO    IN       VARCHAR2,
   PLSENT         IN       VARCHAR2
)
IS

-- RP NAME : YEU CAU CHUYEN KHOAN CHUNG KHOAN TAT TOAN TAI KHOAN
-- PERSON --------------DATE---------------------COMMENTS
-- THANHNM            17/07/2012                 CREATE
-- SE00311: report main
-- ---------   ------  -------------------------------------------
   V_STRAFACCTNO  VARCHAR2 (15);
   V_CUSTODYCD VARCHAR2 (15);
   V_TYPE  VARCHAR2(10);
   V_CURRDATE DATE;
   V_FLAG NUMBER(2,0);
   V_INBRID        VARCHAR2(4);
   V_STRBRID      VARCHAR2 (50);
   V_STROPTION    VARCHAR2(5);


BEGIN
-- GET REPORT'S PARAMETERS
   V_STROPTION := upper(OPT);
   V_INBRID := BRID;
    if(V_STROPTION = 'A') then
        V_STRBRID := '%%';
    else
        if(V_STROPTION = 'B') then
            select br.mapid into V_STRBRID from brgrp br where  br.brid = V_INBRID;
        else
            V_STRBRID := V_INBRID;
        end if;
    end if;
    V_CUSTODYCD := UPPER( PV_CUSTODYCD);

    SELECT TO_DATE(VARVALUE,'DD/MM/RRRR') INTO V_CURRDATE
     FROM SYSVAR WHERE VARNAME = 'CURRDATE' AND GRNAME = 'SYSTEM';

   IF  (PV_AFACCTNO <> 'ALL')
   THEN
         V_STRAFACCTNO := PV_AFACCTNO;
   ELSE
         V_STRAFACCTNO := '%';
   END IF;


-- GET REPORT'S DATA
 OPEN PV_REFCURSOR
 FOR
 -- CA.RIGHTOFFRATE Sua lai lay ty le thuc hien
        SELECT DT.*,
           A0.CDCONTENT SAN_GD
        FROM (
        SELECT MAX(CF.CUSTODYCD) CUSTODYCD, MAX(REPLACE(SB.SYMBOL,'_WFT',''))  SYMBOL, CA.REPORTDATE,
        MAX(DECODE(CA.CATYPE,'014', CA.RIGHTOFFRATE,'021',CA.SPLITRATE,'006',CA.DEVIDENTSHARES,'011',CA.DEVIDENTSHARES,
        '005',CA.DEVIDENTSHARES,'010', CA.DEVIDENTRATE,'023',CA.EXRATE, '1/1')) CA_TYLE,
        SUM(CAS.TRADE)  REPORT_QTTY, SUM(CAS.CUTPBALANCE) CUTPBALANCE,

        SUM( cas.pbalance + cas.sendpbalance + cas.cutpbalance+ cas.balance)  QTTY,
        SUM(CAS.CUTAQTTY) CUTAQTTY
        , SUM(CAS.AMT + cas.cutamt + cas.sendamt)   AMT,
        0 CP_LE, 0 RIGHT_QTTY, sum(CAS.QTTY + cas.cutqtty + cas.sendqtty)  CK_MUA, ' ' NOTE
        FROM CASCHD  CAS, CAMAST CA, CFMAST CF,
         AFMAST AF, SBSECURITIES SB
        WHERE CF.CUSTODYCD = V_CUSTODYCD AND CF.CUSTID = AF.CUSTID
        AND CAS.AFACCTNO = AF.ACCTNO AND CA.CAMASTID = CAS.CAMASTID
                    AND CAS.CODEID = SB.CODEID
        AND CA.CATYPE='014' AND AF.ACCTNO LIKE V_STRAFACCTNO AND CAS.DELTD<>'Y'
        AND (af.brid LIKE V_STRBRID or instr(V_STRBRID,af.brid) <> 0 )
        AND CAS.STATUS  IN ('O','A','S') GROUP BY CA.CAMASTID,CA.REPORTDATE )DT, SBSECURITIES SB  , ALLCODE A0 WHERE DT.SYMBOL = SB.SYMBOL AND
        A0.CDTYPE='SE' AND A0.CDNAME='TRADEPLACE' AND A0.CDVAL=SB.TRADEPLACE
      /*  UNION ALL

          SELECT V_CUSTODYCD  CUSTODYCD, 'XXX' SYMBOL, TO_DATE(F_DATE,'DD/MM/YYYY') REPORTDATE,
        ' ' CA_TYLE,
       0  REPORT_QTTY,
        0 CUTPBALANCE, 0  QTTY,
         0 CUTAQTTY
        , 0   AMT, 0 CP_LE, 0 RIGHT_QTTY, 0 CK_MUA, ' ' NOTE,'C. UPCOM' SAN_GD
       FROM DUAL*/
         ;

EXCEPTION
   WHEN OTHERS
   THEN
      RETURN;
END;
 
 
 
 
/
