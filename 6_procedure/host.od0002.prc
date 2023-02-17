SET DEFINE OFF;
CREATE OR REPLACE PROCEDURE od0002 (
   PV_REFCURSOR   IN OUT   PKG_REPORT.REF_CURSOR,
   OPT            IN       VARCHAR2,
   pv_BRID           IN       VARCHAR2,
   TLGOUPS        IN       VARCHAR2,
   TLSCOPE        IN       VARCHAR2,
   F_DATE         IN       VARCHAR2,
   T_DATE         IN       VARCHAR2,
   SYMBOL         IN       VARCHAR2,
   EXECTYPE       IN       VARCHAR2,
   TRADEPLACE     IN       VARCHAR2,
   VOUCHER        IN       VARCHAR2,
   PRICETYPE      IN       VARCHAR2,
   MATCHTYPE      IN       VARCHAR2,
   VIA            IN       VARCHAR2,
   GRCAREBY       IN       VARCHAR2,
   ISDISPOSAL     IN       VARCHAR2,
   TLID            IN       VARCHAR2,
   CUSTTYPE        IN       VARCHAR2,
   CUSTATCOM      IN       VARCHAR2,
   MAKER          IN       VARCHAR2,
   PV_CUSTODYCD   IN       VARCHAR2,
   BRGID          IN       VARCHAR2,
   MARGIN         IN       VARCHAR2,
   CONFIRM        IN       VARCHAR2
   )
IS
--
-- PURPOSE: BRIEFLY EXPLAIN THE FUNCTIONALITY OF THE PROCEDURE
-- TONG HOP KET QUA KHOP LENH
-- MODIFICATION HISTORY
-- PERSON      DATE    COMMENTS
-- NAMNT   21-NOV-06  CREATED
-- ---------   ------  -------------------------------------------
   V_STROPTION          VARCHAR2 (5);            -- A: ALL; B: BRANCH; S: SUB-BRANCH
   V_STREXECTYPE        VARCHAR2 (5);
   V_STRSYMBOL          VARCHAR2 (20);
   V_STRTRADEPLACE      VARCHAR2 (3);
   V_STRVOUCHER         VARCHAR2 (3);
  -- V_STRTYPEORDER       VARCHAR2 (3);
   V_STRPRICETYPE       VARCHAR2 (10);
   V_STRVIA             VARCHAR2 (10);
   V_NUMFEEACR          NUMBER := 0;
   V_NUMFEEACR_BRO      NUMBER := 0;
   V_NUMEXECAMT__BRO    NUMBER := 0;
   V_STRMATCHTYPE         VARCHAR2 (5);
   V_StrCAREBY VARCHAR2 (20);
   V_STRTLID           VARCHAR2(6);
   V_ISDISPOSAL        VARCHAR2(6);
   V_STRCUSTTYPE       VARCHAR2(20);
   V_STRCUSTATCOM      VARCHAR2(20);
   V_STRMAKER           VARCHAR2(20);
   V_STRCONFIRM         VARCHAR2(20);
   V_NBNUMFEEACR        NUMBER := 0;
   V_NSNUMFEEACR        NUMBER := 0;
   /*V_NUMFEEACR          := 0;
   V_NUMFEEACR_BRO      := 0;
   V_NUMEXECAMT__BRO    := 0;

    */
   V_INBRID        VARCHAR2(4);
   V_STRBRID      VARCHAR2 (50);
   V_CURRDATE       DATE;

   V_STRCUSTODYCD   VARCHAR2(20);
   V_I_BRID          VARCHAR2(20);
   V_STRMARGIN      VARCHAR2(20);

   CUR            PKG_REPORT.REF_CURSOR;

-- DECLARE PROGRAM VARIABLES AS SHOWN ABOVE
BEGIN
   V_STROPTION := OPT;
V_STRTLID:= TLID;
   IF (V_STROPTION <> 'A') AND (pv_BRID <> 'ALL')
   THEN
      V_STRBRID := pv_BRID;
   ELSE
      V_STRBRID := '%%';
   END IF;

/*   V_STRTLID:= TLID;
   V_STROPTION := upper(OPT);
 V_INBRID := pv_BRID;
    if(V_STROPTION = 'A') then
        V_STRBRID := '%%';
    else
        if(V_STROPTION = 'B') then
            select br.mapid into V_STRBRID from brgrp br where  br.brid = V_INBRID;
        else
            V_STRBRID := V_INBRID;
        end if;
    end if;
*/
    -- GET REPORT'S PARAMETERS
   IF (TRADEPLACE <> 'ALL')
   THEN
      V_STRTRADEPLACE := TRADEPLACE;
   ELSE
      V_STRTRADEPLACE := '%%';
   END IF;

   IF (ISDISPOSAL <> 'ALL')
   THEN
      V_ISDISPOSAL := ISDISPOSAL;
   ELSE
      V_ISDISPOSAL := '%%';
   END IF;


   --
    IF (SYMBOL <> 'ALL')
   THEN
      V_STRSYMBOL := SYMBOL;
   ELSE
      V_STRSYMBOL := '%%';
   END IF;
   --
   IF (EXECTYPE <> 'ALL')
   THEN
      V_STREXECTYPE := EXECTYPE;
   ELSE
      V_STREXECTYPE := '%%';
   END IF;

    IF (VOUCHER <> 'ALL')
   THEN
      V_STRVOUCHER := VOUCHER;
   ELSE
      V_STRVOUCHER := '%%';
   END IF;

   IF (VIA <> 'ALL')
   THEN
      V_STRVIA := VIA;
   ELSE
      V_STRVIA := '%%';
   END IF;

    --IF (TYPEORDER <> 'ALL')
  -- THEN
    --  V_STRTYPEORDER := TYPEORDER;
  -- ELSE
   --   V_STRTYPEORDER := '%%';
 ---  END IF;

    IF (PRICETYPE <> 'ALL')
   THEN
      V_STRPRICETYPE := PRICETYPE;
   ELSE
      V_STRPRICETYPE := '%%';
   END IF;

   if (MATCHTYPE <> 'ALL')
   then
    V_STRMATCHTYPE := MATCHTYPE;
   else
    V_STRMATCHTYPE := '%';
   end if;

   IF (GRCAREBY <> 'ALL')
  THEN
     V_StrCAREBY := GRCAREBY;
  ELSE
      V_StrCAREBY:='%';
   END IF;

    if(CUSTTYPE = 'ALL' ) THEN
        V_STRCUSTTYPE := '%';
    else
        V_STRCUSTTYPE := CUSTTYPE;
    end if;

        if(PV_CUSTODYCD = 'ALL' ) THEN
        V_STRCUSTODYCD := '%';
    else
        V_STRCUSTODYCD := PV_CUSTODYCD;
    end if;

    if(BRGID = 'ALL' ) THEN
        V_I_BRID := '%';
    else
        V_I_BRID := BRGID;
    end if;

    if(MARGIN = 'ALL' ) THEN
        V_STRMARGIN := '%';
    elsif MARGIN='Không' then
        V_STRMARGIN := 'N';
    ELSE
      V_STRMARGIN:='T';
    end if;

    if(CONFIRM = 'ALL' ) THEN
        V_STRCONFIRM := '%';
    elsif CONFIRM='Không' then
        V_STRCONFIRM := 'N';
    else
        V_STRCONFIRM := 'Y';
    end if;

      if(CUSTATCOM = 'ALL' ) THEN
        V_STRCUSTATCOM := '%';
    else
        V_STRCUSTATCOM := CUSTATCOM||'%';
    end if;


    if(UPPER(MAKER) = 'ALL' or LENGTH(MAKER) <= 1 ) THEN
        V_STRMAKER := '%';
    else
        V_STRMAKER := MAKER;
    end if;

        SELECT TO_DATE(VARVALUE,'DD/MM/RRRR') INTO V_CURRDATE FROM SYSVAR WHERE VARNAME='CURRDATE';
   --- TINH GT KHOP MG


OPEN CUR
 FOR

SELECT NVL(SUM(case when nvl(repo.leg,'N') = 'N' then IO.MATCHPRICE*IO.MATCHQTTY else repo.amt1 end),0)
FROM (
SELECT od.* FROM  ODMAST OD, afmast af,ALLCODE A1,AFTYPE AFT, MRTYPE MR,
       (SELECT CF.*,(CASE WHEN CF.CUSTATCOM='Y' THEN 'KH luu ký' ELSE 'KH không luu ký' END ) CUSTAT FROM CFMAST CF) cf
WHERE /*OD.DELTD <>'Y' and*/ od.afacctno = af.acctno and af.careby like V_StrCAREBY
      AND  OD.TXDATE <= TO_DATE (T_DATE ,'DD/MM/YYYY') AND OD.TXDATE >= TO_DATE (F_DATE ,'DD/MM/YYYY')
      AND OD.EXECTYPE LIKE  V_STREXECTYPE AND  nvl(OD.VOUCHER,'N')  LIKE V_STRVOUCHER
      --AND AF.ACTYPE NOT IN ('0000')
      AND A1.CDTYPE='CF' AND A1.CDNAME='CUSTTYPE' AND A1.CDVAL=CF.CUSTTYPE
      AND A1.CDCONTENT  LIKE V_STRCUSTTYPE
      AND CF.CUSTAT LIKE V_STRCUSTATCOM
      AND OD.TLID LIKE V_STRMAKER
      AND  OD.PRICETYPE LIKE V_STRPRICETYPE AND OD.via LIKE V_STRVIA
      and af.custid = cf.custid
      AND AF.ACTYPE=AFT.ACTYPE AND AFT.MRTYPE=MR.ACTYPE
      AND MR.MRTYPE LIKE V_STRMARGIN
      AND CF.BRID LIKE V_I_BRID
      AND CF.CUSTODYCD LIKE V_STRCUSTODYCD
      AND OD.ISDISPOSAL  LIKE V_ISDISPOSAL
--AND(SUBSTR(OD.ORDERID,1,4) LIKE V_STRBRID OR SUBSTR(OD.AFACCTNO,1,4) LIKE V_STRBRID)
UNION  ALL
SELECT od.* FROM  ODMASTHIST OD, afmast af,ALLCODE A1, AFTYPE AFT, MRTYPE MR,
 (SELECT CF.*,(CASE WHEN CF.CUSTATCOM='Y' THEN 'KH luu ký' ELSE 'KH không luu ký' END ) CUSTAT FROM CFMAST CF ) cf
WHERE /*OD.DELTD <>'Y' and*/ od.afacctno = af.acctno and af.careby like V_StrCAREBY
      AND  OD.TXDATE <= TO_DATE (T_DATE ,'DD/MM/YYYY') AND OD.TXDATE >= TO_DATE (F_DATE ,'DD/MM/YYYY')
      AND OD.EXECTYPE LIKE  V_STREXECTYPE AND  nvl(OD.VOUCHER,'N')  LIKE V_STRVOUCHER
     -- AND AF.ACTYPE NOT IN ('0000')
      AND  OD.PRICETYPE LIKE V_STRPRICETYPE AND OD.via LIKE V_STRVIA
      and cf.custid = af.custid
       AND A1.CDTYPE='CF' AND A1.CDNAME='CUSTTYPE' AND A1.CDVAL=CF.CUSTTYPE
        AND AF.ACTYPE=AFT.ACTYPE AND AFT.MRTYPE=MR.ACTYPE
      AND MR.MRTYPE LIKE V_STRMARGIN
      AND CF.BRID LIKE V_I_BRID
      AND CF.CUSTODYCD LIKE V_STRCUSTODYCD
      AND A1.CDCONTENT  LIKE V_STRCUSTTYPE
      AND CF.CUSTAT LIKE V_STRCUSTATCOM
      AND OD.TLID LIKE V_STRMAKER
      AND OD.ISDISPOSAL  LIKE V_ISDISPOSAL
--AND(SUBSTR(OD.ORDERID,1,4) LIKE V_STRBRID OR SUBSTR(OD.AFACCTNO,1,4) LIKE V_STRBRID)
) OD ,
(SELECT * FROM IOD where DELTD<> 'Y' AND SUBSTR(custodycd,4,1)  ='P' UNION ALL SELECT * FROM IODHIST where DELTD<> 'Y' AND SUBSTR(custodycd,4,1)  ='P')IO,
(SELECT * FROM SBSECURITIES WHERE SYMBOL  LIKE  V_STRSYMBOL AND TRADEPLACE  LIKE V_STRTRADEPLACE)sb,CONFIRMODRSTS CON,
(SELECT ORDERID, REPOACCTNO, TXDATE, QTTY, AMT1,FEEAMT, LEG  FROM BONDREPO) repo
WHERE OD.ORDERID= IO.ORGORDERID AND  OD.CODEID=SB.CODEID AND OD.ORDERID= CON.ORDERID(+)
and od.ORDERID = repo.ORDERID(+)
AND NVL(CON.CONFIRMED,'N') LIKE V_STRCONFIRM

  ;
LOOP
  FETCH CUR
       INTO V_NUMEXECAMT__BRO ;
       EXIT WHEN CUR%NOTFOUND;
  END LOOP;
CLOSE CUR;
--- TINH TONG PHI

OPEN CUR
 FOR
 SELECT SUM(AMT.FEEACR)
FROM (
SELECT  ------ SUM(FEEACR) FEEACR
    sum(case when nvl(repo.leg,'N') <> 'N' and od.execamt > 0 then repo.feeamt
         else
        (CASE WHEN OD.EXECAMT >0 AND OD.FEEACR =0 AND OD.STSSTATUS = 'N' AND OD.TXDATE=V_CURRDATE THEN ROUND(OD.EXECAMT * ODT.DEFFEERATE/100)
        WHEN OD.EXECAMT >0 AND OD.FEEACR =0  AND OD.TXDATE <> V_CURRDATE THEN 0 ELSE OD.FEEACR END) end) FEEACR
    FROM ODMAST od,AFTYPE AFT, MRTYPE MR,CONFIRMODRSTS CON,
        (SELECT * FROM SBSECURITIES WHERE SYMBOL  LIKE  V_STRSYMBOL AND TRADEPLACE  LIKE V_STRTRADEPLACE)sb,
        afmast af, ODTYPE odt,ALLCODE A1,
         (SELECT CF.*,(CASE WHEN CF.CUSTATCOM='Y' THEN 'KH luu ký' ELSE 'KH không luu ký' END ) CUSTAT FROM CFMAST CF ) cf,
         (SELECT ORDERID, REPOACCTNO, TXDATE, QTTY, AMT1,FEEAMT, LEG  FROM BONDREPO) repo
 WHERE /*od.DELTD <>'Y' and */od.afacctno = af.acctno and af.careby like V_StrCAREBY
       -- AND AF.ACTYPE NOT IN ('0000')
        and odt.actype = OD.ACTYPE
        and af.custid = cf.custid
        AND OD.ORDERID= CON.ORDERID(+)
        AND NVL(CON.CONFIRMED,'N') LIKE V_STRCONFIRM
         AND AF.ACTYPE=AFT.ACTYPE AND AFT.MRTYPE=MR.ACTYPE
      AND MR.MRTYPE LIKE V_STRMARGIN
      AND CF.BRID LIKE V_I_BRID
      AND CF.CUSTODYCD LIKE V_STRCUSTODYCD
        AND  od.TXDATE <= TO_DATE (T_DATE ,'DD/MM/YYYY') AND od.TXDATE >= TO_DATE (F_DATE ,'DD/MM/YYYY')
        AND  od.EXECTYPE LIKE  V_STREXECTYPE AND od.CODEID=SB.CODEID
        AND  nvl(od.VOUCHER,'N')  LIKE V_STRVOUCHER  AND od.PRICETYPE LIKE V_STRPRICETYPE
        and od.orderid = repo.orderid(+)
--AND (SUBSTR(od.ORDERID,1,4) LIKE V_STRBRID OR SUBSTR(od.AFACCTNO,1,4) LIKE V_STRBRID)

        AND od.via LIKE V_STRVIA
       AND A1.CDTYPE='CF' AND A1.CDNAME='CUSTTYPE' AND A1.CDVAL=CF.CUSTTYPE
      AND A1.CDCONTENT  LIKE V_STRCUSTTYPE
        AND CF.CUSTAT LIKE V_STRCUSTATCOM
        AND OD.TLID LIKE V_STRMAKER
        AND OD.ISDISPOSAL  LIKE V_ISDISPOSAL
UNION ALL
SELECT ---SUM(FEEACR) FEEACR
    sum(case when nvl(repo.leg,'N') <> 'N' and od.execamt > 0 then repo.feeamt
        else
       (CASE WHEN OD.EXECAMT >0 AND OD.FEEACR =0 AND OD.STSSTATUS = 'N' AND OD.TXDATE=V_CURRDATE
        THEN ROUND(OD.EXECAMT * ODT.DEFFEERATE/100)
          WHEN OD.EXECAMT >0 AND OD.FEEACR =0  AND OD.TXDATE <> V_CURRDATE then 0
          ELSE OD.FEEACR END) end) FEEACR
FROM ODMASTHIST od,(SELECT * FROM SBSECURITIES WHERE SYMBOL  LIKE  V_STRSYMBOL AND TRADEPLACE  LIKE V_STRTRADEPLACE)sb ,
    afmast af, ODTYPE odt, ALLCODE A1, AFTYPE AFT, MRTYPE MR,CONFIRMODRSTS CON,
    (SELECT CF.*,(CASE WHEN CF.CUSTATCOM='Y' THEN 'KH luu ký' ELSE 'KH không luu ký' END ) CUSTAT FROM CFMAST CF) cf,
    (SELECT ORDERID, REPOACCTNO, TXDATE, QTTY, AMT1,FEEAMT, LEG  FROM BONDREPO) repo
WHERE /*od.DELTD <>'Y' and*/ od.afacctno = af.acctno and af.careby like V_StrCAREBY
       and odt.actype = OD.ACTYPE
       AND OD.ORDERID= CON.ORDERID(+)
        AND NVL(CON.CONFIRMED,'N') LIKE V_STRCONFIRM
       --AND AF.ACTYPE NOT IN ('0000')
        AND AF.ACTYPE=AFT.ACTYPE AND AFT.MRTYPE=MR.ACTYPE
      AND MR.MRTYPE LIKE V_STRMARGIN
      AND CF.BRID LIKE V_I_BRID
      AND CF.CUSTODYCD LIKE V_STRCUSTODYCD
       AND  od.TXDATE <= TO_DATE (T_DATE ,'DD/MM/YYYY') AND od.TXDATE >= TO_DATE (F_DATE ,'DD/MM/YYYY')
       AND od.EXECTYPE LIKE  V_STREXECTYPE
-- AND  VOUCHER  LIKE V_STRTYPEORDER
      AND od.PRICETYPE LIKE V_STRPRICETYPE
      AND od.CODEID=SB.CODEID
      AND AF.CUSTID=CF.CUSTID
      AND A1.CDTYPE='CF' AND A1.CDNAME='CUSTTYPE' AND A1.CDVAL=CF.CUSTTYPE
      AND A1.CDCONTENT  LIKE V_STRCUSTTYPE
      AND CF.CUSTAT LIKE V_STRCUSTATCOM
      AND OD.TLID LIKE V_STRMAKER
      AND OD.ISDISPOSAL  LIKE V_ISDISPOSAL
      and od.orderid = repo.orderid(+)
--AND (SUBSTR(od.ORDERID,1,4) LIKE V_STRBRID OR SUBSTR(od.AFACCTNO,1,4) LIKE V_STRBRID)
      AND od.via LIKE V_STRVIA
)AMT

  ;
LOOP
  FETCH CUR
       INTO V_NUMFEEACR ;
       EXIT WHEN CUR%NOTFOUND;
  END LOOP;
CLOSE CUR;

--Tinh tong phi theo loai lenh NB
OPEN CUR
 FOR
 SELECT SUM(AMT.FEEACR)
FROM (
SELECT  ------ SUM(FEEACR) FEEACR
    sum(case when nvl(repo.leg,'N') <> 'N' and od.execamt > 0 then repo.feeamt
         else
        (CASE WHEN OD.EXECAMT >0 AND OD.FEEACR =0 AND OD.STSSTATUS = 'N' AND OD.TXDATE=V_CURRDATE THEN ROUND(OD.EXECAMT * ODT.DEFFEERATE/100)
        WHEN OD.EXECAMT >0 AND OD.FEEACR =0  AND OD.TXDATE <> V_CURRDATE THEN 0 ELSE OD.FEEACR END) end) FEEACR
    FROM ODMAST od,AFTYPE AFT, MRTYPE MR,CONFIRMODRSTS CON,
        (SELECT * FROM SBSECURITIES WHERE SYMBOL  LIKE  V_STRSYMBOL AND TRADEPLACE  LIKE V_STRTRADEPLACE)sb,
        afmast af, ODTYPE odt,ALLCODE A1,
         (SELECT CF.*,(CASE WHEN CF.CUSTATCOM='Y' THEN 'KH luu ký' ELSE 'KH không luu ký' END ) CUSTAT FROM CFMAST CF ) cf,
         (SELECT ORDERID, REPOACCTNO, TXDATE, QTTY, AMT1,FEEAMT, LEG  FROM BONDREPO) repo
 WHERE /*od.DELTD <>'Y' and */od.afacctno = af.acctno and af.careby like V_StrCAREBY
       -- AND AF.ACTYPE NOT IN ('0000')
        and odt.actype = OD.ACTYPE
        and af.custid = cf.custid
        AND OD.ORDERID= CON.ORDERID(+)
        AND NVL(CON.CONFIRMED,'N') LIKE V_STRCONFIRM
         AND AF.ACTYPE=AFT.ACTYPE AND AFT.MRTYPE=MR.ACTYPE
         AND (od.exectype = 'NB' OR od.exectype='AB' OR od.exectype='BC')
      AND MR.MRTYPE LIKE V_STRMARGIN
      AND CF.BRID LIKE V_I_BRID
      AND CF.CUSTODYCD LIKE V_STRCUSTODYCD
        AND  od.TXDATE <= TO_DATE (T_DATE ,'DD/MM/YYYY') AND od.TXDATE >= TO_DATE (F_DATE ,'DD/MM/YYYY')
        AND  od.EXECTYPE LIKE  V_STREXECTYPE AND od.CODEID=SB.CODEID
        AND  nvl(od.VOUCHER,'N')  LIKE V_STRVOUCHER  AND od.PRICETYPE LIKE V_STRPRICETYPE
        and od.orderid = repo.orderid(+)
--AND (SUBSTR(od.ORDERID,1,4) LIKE V_STRBRID OR SUBSTR(od.AFACCTNO,1,4) LIKE V_STRBRID)

        AND od.via LIKE V_STRVIA
       AND A1.CDTYPE='CF' AND A1.CDNAME='CUSTTYPE' AND A1.CDVAL=CF.CUSTTYPE
      AND A1.CDCONTENT  LIKE V_STRCUSTTYPE
        AND CF.CUSTAT LIKE V_STRCUSTATCOM
        AND OD.TLID LIKE V_STRMAKER
        AND OD.ISDISPOSAL  LIKE V_ISDISPOSAL
UNION ALL
SELECT ---SUM(FEEACR) FEEACR
    sum(case when nvl(repo.leg,'N') <> 'N' and od.execamt > 0 then repo.feeamt
        else
       (CASE WHEN OD.EXECAMT >0 AND OD.FEEACR =0 AND OD.STSSTATUS = 'N' AND OD.TXDATE=V_CURRDATE
        THEN ROUND(OD.EXECAMT * ODT.DEFFEERATE/100)
          WHEN OD.EXECAMT >0 AND OD.FEEACR =0  AND OD.TXDATE <> V_CURRDATE then 0
          ELSE OD.FEEACR END) end) FEEACR
FROM ODMASTHIST od,(SELECT * FROM SBSECURITIES WHERE SYMBOL  LIKE  V_STRSYMBOL AND TRADEPLACE  LIKE V_STRTRADEPLACE)sb ,
    afmast af, ODTYPE odt, ALLCODE A1, AFTYPE AFT, MRTYPE MR,CONFIRMODRSTS CON,
    (SELECT CF.*,(CASE WHEN CF.CUSTATCOM='Y' THEN 'KH luu ký' ELSE 'KH không luu ký' END ) CUSTAT FROM CFMAST CF) cf,
    (SELECT ORDERID, REPOACCTNO, TXDATE, QTTY, AMT1,FEEAMT, LEG  FROM BONDREPO) repo
WHERE /*od.DELTD <>'Y' and*/ od.afacctno = af.acctno and af.careby like V_StrCAREBY
       and odt.actype = OD.ACTYPE
       AND OD.ORDERID= CON.ORDERID(+)
       AND (od.exectype = 'NB' OR od.exectype='AB' OR od.exectype='BC')
        AND NVL(CON.CONFIRMED,'N') LIKE V_STRCONFIRM
       --AND AF.ACTYPE NOT IN ('0000')
        AND AF.ACTYPE=AFT.ACTYPE AND AFT.MRTYPE=MR.ACTYPE
      AND MR.MRTYPE LIKE V_STRMARGIN
      AND CF.BRID LIKE V_I_BRID
      AND CF.CUSTODYCD LIKE V_STRCUSTODYCD
       AND  od.TXDATE <= TO_DATE (T_DATE ,'DD/MM/YYYY') AND od.TXDATE >= TO_DATE (F_DATE ,'DD/MM/YYYY')
       AND od.EXECTYPE LIKE  V_STREXECTYPE
-- AND  VOUCHER  LIKE V_STRTYPEORDER
      AND od.PRICETYPE LIKE V_STRPRICETYPE
      AND od.CODEID=SB.CODEID
      AND AF.CUSTID=CF.CUSTID
      AND A1.CDTYPE='CF' AND A1.CDNAME='CUSTTYPE' AND A1.CDVAL=CF.CUSTTYPE
      AND A1.CDCONTENT  LIKE V_STRCUSTTYPE
      AND CF.CUSTAT LIKE V_STRCUSTATCOM
      AND OD.TLID LIKE V_STRMAKER
      AND OD.ISDISPOSAL  LIKE V_ISDISPOSAL
      and od.orderid = repo.orderid(+)
--AND (SUBSTR(od.ORDERID,1,4) LIKE V_STRBRID OR SUBSTR(od.AFACCTNO,1,4) LIKE V_STRBRID)
      AND od.via LIKE V_STRVIA
)AMT

  ;
LOOP
  FETCH CUR
       INTO V_NBNUMFEEACR ;
       EXIT WHEN CUR%NOTFOUND;
  END LOOP;
CLOSE CUR;

--Tinh tong phi theo loai lenh NS
OPEN CUR
 FOR
 SELECT SUM(AMT.FEEACR)
FROM (
SELECT  ------ SUM(FEEACR) FEEACR
    sum(case when nvl(repo.leg,'N') <> 'N' and od.execamt > 0 then repo.feeamt
         else
        (CASE WHEN OD.EXECAMT >0 AND OD.FEEACR =0 AND OD.STSSTATUS = 'N' AND OD.TXDATE=V_CURRDATE THEN ROUND(OD.EXECAMT * ODT.DEFFEERATE/100)
        WHEN OD.EXECAMT >0 AND OD.FEEACR =0  AND OD.TXDATE <> V_CURRDATE THEN 0 ELSE OD.FEEACR END) end) FEEACR
    FROM ODMAST od,AFTYPE AFT, MRTYPE MR,CONFIRMODRSTS CON,
        (SELECT * FROM SBSECURITIES WHERE SYMBOL  LIKE  V_STRSYMBOL AND TRADEPLACE  LIKE V_STRTRADEPLACE)sb,
        afmast af, ODTYPE odt,ALLCODE A1,
         (SELECT CF.*,(CASE WHEN CF.CUSTATCOM='Y' THEN 'KH luu ký' ELSE 'KH không luu ký' END ) CUSTAT FROM CFMAST CF ) cf,
         (SELECT ORDERID, REPOACCTNO, TXDATE, QTTY, AMT1,FEEAMT, LEG  FROM BONDREPO) repo
 WHERE /*od.DELTD <>'Y' and */od.afacctno = af.acctno and af.careby like V_StrCAREBY
       -- AND AF.ACTYPE NOT IN ('0000')
        and odt.actype = OD.ACTYPE
        and af.custid = cf.custid
        AND OD.ORDERID= CON.ORDERID(+)
        AND (od.exectype = 'NS' OR od.exectype = 'AS' OR od.exectype ='MS' OR od.exectype = 'SS')
        AND NVL(CON.CONFIRMED,'N') LIKE V_STRCONFIRM
         AND AF.ACTYPE=AFT.ACTYPE AND AFT.MRTYPE=MR.ACTYPE
      AND MR.MRTYPE LIKE V_STRMARGIN
      AND CF.BRID LIKE V_I_BRID
      AND CF.CUSTODYCD LIKE V_STRCUSTODYCD
        AND  od.TXDATE <= TO_DATE (T_DATE ,'DD/MM/YYYY') AND od.TXDATE >= TO_DATE (F_DATE ,'DD/MM/YYYY')
        AND  od.EXECTYPE LIKE  V_STREXECTYPE AND od.CODEID=SB.CODEID
        AND  nvl(od.VOUCHER,'N')  LIKE V_STRVOUCHER  AND od.PRICETYPE LIKE V_STRPRICETYPE
        and od.orderid = repo.orderid(+)
--AND (SUBSTR(od.ORDERID,1,4) LIKE V_STRBRID OR SUBSTR(od.AFACCTNO,1,4) LIKE V_STRBRID)

        AND od.via LIKE V_STRVIA
       AND A1.CDTYPE='CF' AND A1.CDNAME='CUSTTYPE' AND A1.CDVAL=CF.CUSTTYPE
      AND A1.CDCONTENT  LIKE V_STRCUSTTYPE
        AND CF.CUSTAT LIKE V_STRCUSTATCOM
        AND OD.TLID LIKE V_STRMAKER
        AND OD.ISDISPOSAL  LIKE V_ISDISPOSAL
UNION ALL
SELECT ---SUM(FEEACR) FEEACR
    sum(case when nvl(repo.leg,'N') <> 'N' and od.execamt > 0 then repo.feeamt
        else
       (CASE WHEN OD.EXECAMT >0 AND OD.FEEACR =0 AND OD.STSSTATUS = 'N' AND OD.TXDATE=V_CURRDATE
        THEN ROUND(OD.EXECAMT * ODT.DEFFEERATE/100)
          WHEN OD.EXECAMT >0 AND OD.FEEACR =0  AND OD.TXDATE <> V_CURRDATE then 0
          ELSE OD.FEEACR END) end) FEEACR
FROM ODMASTHIST od,(SELECT * FROM SBSECURITIES WHERE SYMBOL  LIKE  V_STRSYMBOL AND TRADEPLACE  LIKE V_STRTRADEPLACE)sb ,
    afmast af, ODTYPE odt, ALLCODE A1, AFTYPE AFT, MRTYPE MR,CONFIRMODRSTS CON,
    (SELECT CF.*,(CASE WHEN CF.CUSTATCOM='Y' THEN 'KH luu ký' ELSE 'KH không luu ký' END ) CUSTAT FROM CFMAST CF) cf,
    (SELECT ORDERID, REPOACCTNO, TXDATE, QTTY, AMT1,FEEAMT, LEG  FROM BONDREPO) repo
WHERE /*od.DELTD <>'Y' and*/ od.afacctno = af.acctno and af.careby like V_StrCAREBY
       and odt.actype = OD.ACTYPE
       AND OD.ORDERID= CON.ORDERID(+)
       AND (od.exectype = 'NS' OR od.exectype = 'AS' OR od.exectype ='MS' OR od.exectype = 'SS')
        AND NVL(CON.CONFIRMED,'N') LIKE V_STRCONFIRM
       --AND AF.ACTYPE NOT IN ('0000')
        AND AF.ACTYPE=AFT.ACTYPE AND AFT.MRTYPE=MR.ACTYPE
      AND MR.MRTYPE LIKE V_STRMARGIN
      AND CF.BRID LIKE V_I_BRID
      AND CF.CUSTODYCD LIKE V_STRCUSTODYCD
       AND  od.TXDATE <= TO_DATE (T_DATE ,'DD/MM/YYYY') AND od.TXDATE >= TO_DATE (F_DATE ,'DD/MM/YYYY')
       AND od.EXECTYPE LIKE  V_STREXECTYPE
-- AND  VOUCHER  LIKE V_STRTYPEORDER
      AND od.PRICETYPE LIKE V_STRPRICETYPE
      AND od.CODEID=SB.CODEID
      AND AF.CUSTID=CF.CUSTID
      AND A1.CDTYPE='CF' AND A1.CDNAME='CUSTTYPE' AND A1.CDVAL=CF.CUSTTYPE
      AND A1.CDCONTENT  LIKE V_STRCUSTTYPE
      AND CF.CUSTAT LIKE V_STRCUSTATCOM
      AND OD.TLID LIKE V_STRMAKER
      AND OD.ISDISPOSAL  LIKE V_ISDISPOSAL
      and od.orderid = repo.orderid(+)
--AND (SUBSTR(od.ORDERID,1,4) LIKE V_STRBRID OR SUBSTR(od.AFACCTNO,1,4) LIKE V_STRBRID)
      AND od.via LIKE V_STRVIA
)AMT

  ;
LOOP
  FETCH CUR
       INTO V_NSNUMFEEACR ;
       EXIT WHEN CUR%NOTFOUND;
  END LOOP;
CLOSE CUR;

--- TINH TONG PHI MOI GIOI
OPEN CUR
 FOR
 SELECT SUM(AMT.FEEACR)
FROM (
SELECT ---SUM(FEEACR) FEEACR
    sum(case when nvl(repo.leg,'N') <> 'N' and od.execamt > 0 then repo.feeamt else
       (CASE WHEN OD.EXECAMT >0 AND OD.FEEACR =0 AND OD.STSSTATUS = 'N' and OD.TXDATE=V_CURRDATE THEN ROUND(OD.EXECAMT * ODT.DEFFEERATE/100)
   WHEN OD.EXECAMT >0 AND OD.FEEACR =0 AND  OD.TXDATE <> V_CURRDATE THEN 0  ELSE OD.FEEACR END) end) FEEACR
FROM ODMAST OD,AFMAST AF , (SELECT CF.*,(CASE WHEN CF.CUSTATCOM='Y' THEN 'KH luu ký' ELSE 'KH không luu ký' END ) CUSTAT FROM CFMAST CF ) cf
,(SELECT * FROM SBSECURITIES WHERE SYMBOL  LIKE  V_STRSYMBOL AND TRADEPLACE  LIKE V_STRTRADEPLACE)sb
    , ODTYPE odt,ALLCODE A1,AFTYPE AFT, MRTYPE MR,CONFIRMODRSTS CON,
    (SELECT ORDERID, REPOACCTNO, TXDATE, QTTY, AMT1,FEEAMT, LEG  FROM BONDREPO) repo
WHERE /*OD.DELTD <>'Y' AND*/  OD.afacctno = AF.acctno AND AF.custid =CF.custid
       and odt.actype = OD.ACTYPE
       and af.careby like V_StrCAREBY
       AND OD.ORDERID= CON.ORDERID(+)
        AND NVL(CON.CONFIRMED,'N') LIKE V_STRCONFIRM
      -- AND AF.ACTYPE NOT IN ('0000')
       AND AF.ACTYPE=AFT.ACTYPE AND AFT.MRTYPE=MR.ACTYPE
      AND MR.MRTYPE LIKE V_STRMARGIN
      AND CF.BRID LIKE V_I_BRID
      AND CF.CUSTODYCD LIKE V_STRCUSTODYCD
       AND  OD.TXDATE <= TO_DATE (T_DATE ,'DD/MM/YYYY') AND OD.TXDATE >= TO_DATE (F_DATE ,'DD/MM/YYYY')
       AND SUBSTR(CF.custodycd,4,1)  ='P' AND OD.CODEID=SB.CODEID
       AND OD.EXECTYPE LIKE  V_STREXECTYPE AND  nvl(OD.VOUCHER,'N')  LIKE V_STRVOUCHER  AND OD.PRICETYPE LIKE V_STRPRICETYPE
--AND (SUBSTR(OD.ORDERID,1,4) LIKE V_STRBRID OR SUBSTR(OD.AFACCTNO,1,4) LIKE V_STRBRID)
      AND OD.via LIKE V_STRVIA
     AND A1.CDTYPE='CF' AND A1.CDNAME='CUSTTYPE' AND A1.CDVAL=CF.CUSTTYPE
      AND A1.CDCONTENT  LIKE V_STRCUSTTYPE
      AND CF.CUSTAT LIKE V_STRCUSTATCOM
      AND OD.TLID LIKE V_STRMAKER
      AND OD.ISDISPOSAL  LIKE V_ISDISPOSAL
      and od.orderid = repo.orderid(+)
UNION ALL
SELECT ---SUM(FEEACR) FEEACR
    sum(case when nvl(repo.leg,'N') <> 'N' and od.execamt > 0 then repo.feeamt else
       (CASE WHEN OD.EXECAMT >0 AND OD.FEEACR =0 AND OD.STSSTATUS = 'N' AND OD.TXDATE=V_CURRDATE
        THEN ROUND(OD.EXECAMT * ODT.DEFFEERATE/100)
        WHEN OD.EXECAMT >0 AND OD.FEEACR =0  AND OD.TXDATE <>V_CURRDATE THEN 0   ELSE OD.FEEACR END) end) FEEACR
FROM ODMASTHIST OD,AFMAST AF , ALLCODE A1,(SELECT CF.*,(CASE WHEN CF.CUSTATCOM='Y' THEN 'KH luu ký' ELSE 'KH không luu ký' END ) CUSTAT FROM CFMAST CF ) cf
,(SELECT * FROM SBSECURITIES WHERE SYMBOL  LIKE  V_STRSYMBOL AND TRADEPLACE  LIKE V_STRTRADEPLACE)sb
    , ODTYPE odt,AFTYPE AFT,MRTYPE MR,CONFIRMODRSTS CON,
    (SELECT ORDERID, REPOACCTNO, TXDATE, QTTY, AMT1,FEEAMT, LEG  FROM BONDREPO) repo
WHERE /*OD.DELTD <>'Y' AND*/  OD.afacctno = AF.acctno AND AF.custid =CF.custid
       and af.careby like V_StrCAREBY
       AND OD.ORDERID= CON.ORDERID(+)
        AND NVL(CON.CONFIRMED,'N') LIKE V_STRCONFIRM
       --AND AF.ACTYPE NOT IN ('0000')
       and odt.actype = OD.ACTYPE
        AND AF.ACTYPE=AFT.ACTYPE AND AFT.MRTYPE=MR.ACTYPE
      AND MR.MRTYPE LIKE V_STRMARGIN
      AND CF.BRID LIKE V_I_BRID
      AND CF.CUSTODYCD LIKE V_STRCUSTODYCD
       AND  OD.TXDATE <= TO_DATE (T_DATE ,'DD/MM/YYYY') AND OD.TXDATE >= TO_DATE (F_DATE ,'DD/MM/YYYY')
       AND SUBSTR(CF.custodycd,4,1)  ='P' AND OD.CODEID=SB.CODEID
       AND OD.EXECTYPE LIKE  V_STREXECTYPE AND  nvl(OD.VOUCHER,'N')  LIKE V_STRVOUCHER  AND OD.PRICETYPE LIKE V_STRPRICETYPE
--AND (SUBSTR(OD.ORDERID,1,4) LIKE V_STRBRID OR SUBSTR(OD.AFACCTNO,1,4) LIKE V_STRBRID)
      AND OD.via LIKE V_STRVIA
       AND A1.CDTYPE='CF' AND A1.CDNAME='CUSTTYPE' AND A1.CDVAL=CF.CUSTTYPE
      AND A1.CDCONTENT  LIKE V_STRCUSTTYPE
      AND CF.CUSTAT LIKE V_STRCUSTATCOM
AND OD.TLID LIKE V_STRMAKER
AND OD.ISDISPOSAL  LIKE V_ISDISPOSAL
and od.orderid = repo.orderid(+)
)AMT;

LOOP
  FETCH CUR
       INTO V_NUMFEEACR_BRO ;
       EXIT WHEN CUR%NOTFOUND;
  END LOOP;
CLOSE CUR;

   --

   -- GET REPORT'S DATA
if TO_DATE (F_DATE, 'DD/MM/YYYY') = TO_DATE (T_DATE, 'DD/MM/YYYY')  and TO_DATE (T_DATE, 'DD/MM/YYYY') = V_CURRDATE then

OPEN PV_REFCURSOR
       FOR
         SELECT nvl(V_NUMFEEACR,0) V_NUMFEEACR, nvl(V_NUMFEEACR_BRO,0) V_NUMFEEACR_BRO ,nvl(V_NUMEXECAMT__BRO,0) V_NUMEXECAMT__BRO , NVL(V_NBNUMFEEACR,0) NBNUMFEEACR, NVL(V_NSNUMFEEACR,0) NSNUMFEEACR,

         T.ORDERID, T.TXDATE, T.SYMBOL, T.QUOTEPRICE , T.ORDERQTTY, T.CIACCTNO, T.FULLNAME,
         (CASE WHEN  NVL(IO.MATCHQTTY,0) <= 0 THEN 0 ELSE T.FEEACR END) FEEACR,
         T.TRADEPLACE,T.CUSTODYCD , T.VIA, T.TXTIME,T.MATCHTYPE,
         T.EXTY,T.EXECTYPE, T.TYORDER, T.CUSTTYPE, T.MAKER, T.APP, T.CUSTATCOM,

         NVL(IO.MATCHQTTY,0) MATCHQTTY,NVL(IO.MATCHPRICE,0) MATCHPRICE,NVL(IO.TXTIME,'') TXTIME_KHOP,
         CASE WHEN NVL(IO.MATCHQTTY,0) > 0 then (case when t.LEG = 'V' then t.REPOAMT else NVL(IO.MATCHQTTY,0) * NVL(IO.MATCHPRICE,0) end ) else 0 end MATCHamt
         FROM (
                  SELECT OD.ORDERID,OD.TXDATE,SB.SYMBOL,(CASE WHEN OD.PRICETYPE IN ('ATO','ATC')THEN  OD.PRICETYPE
                        ELSE TO_CHAR(OD.QUOTEPRICE) END )QUOTEPRICE ,OD.ORDERQTTY,OD.CIACCTNO,CF.FULLNAME,
                        case when nvl(repo.leg,'N') <> 'N' then repo.feeamt
                          else
                        (CASE WHEN OD.EXECAMT >0 AND OD.FEEACR =0 AND OD.STSSTATUS = 'N' AND OD.TXDATE=V_CURRDATE THEN ROUND(OD.EXECAMT * ODT.DEFFEERATE/100)
                          WHEN OD.EXECAMT >0 AND OD.FEEACR =0 AND OD.TXDATE <> V_CURRDATE THEN 0 ELSE OD.FEEACR END) END FEEACR,
                         sb.TRADEPLACE TRADEPLACE,CF.CUSTODYCD , OD.VIA  VIA, OD.TXTIME,OD.MATCHTYPE,
                         (CASE  WHEN OD.REFORDERID IS NOT NULL THEN 'C' ELSE OD.EXECTYPE END)EXTY,OD.EXECTYPE,
                         (CASE  WHEN OD.REFORDERID IS NOT NULL THEN 'C' ELSE 'O' END ) TYORDER,
                          A1.CDCONTENT CUSTTYPE,nvl(TLP.TLNAME,' ') MAKER,NVL(TL.TLNAME,' ') APP,
                         (CASE WHEN CF.CUSTATCOM='Y' THEN 'KH luu ký' ELSE 'KH không luu ký' END ) CUSTATCOM,
                         NVL(REPO.LEG,'N') LEG, NVL(REPO.AMT1,0) REPOAMT
                 FROM ( select * from odmast where TXDATE >= TO_DATE (F_DATE, 'DD/MM/YYYY')
                       AND TXDATE <= TO_DATE (T_DATE, 'DD/MM/YYYY')
                        ) OD,
                        SBSECURITIES SB,AFMAST AF ,
                        (SELECT tl.txdate, tl.txnum, NVL(tl2.tlname,' ') tlname from tllog tl, tlprofiles tl2
                                where deltd <> 'Y' and TXDATE >= TO_DATE (F_DATE, 'DD/MM/YYYY')
                                       AND TXDATE <= TO_DATE (T_DATE, 'DD/MM/YYYY')  AND tl.offid = tl2.tlid(+)
                          ) TL, /*TLPROFILES TLP2,*/ ALLCODE A1,AFTYPE AFT, MRTYPE MR,
                        (SELECT * FROM CFMAST WHERE FNC_VALIDATE_SCOPE(BRID, CAREBY, TLSCOPE, pv_BRID, TLGOUPS)=0) CF, ODTYPE odt,tlprofiles tlp,
                        (SELECT ORDERID, REPOACCTNO, TXDATE, QTTY, AMT1,FEEAMT, LEG  FROM BONDREPO) repo
                  WHERE  OD.CODEID=SB.CODEID
                       AND OD.TXDATE=TL.TXDATE (+)
                       AND OD.TXNUM=TL.TXNUM (+)
                      -- AND TL.OFFID=TLP2.TLID(+)
                       AND od.tlid = tlp.tlid (+)
                       AND odt.actype = OD.ACTYPE
                       AND OD.CIACCTNO=AF.ACCTNO
                       AND AF.CUSTID=CF.CUSTID
                        AND A1.CDTYPE='CF' AND A1.CDNAME='CUSTTYPE' AND A1.CDVAL=CF.CUSTTYPE
                      -- AND AF.ACTYPE NOT IN ('0000')
                       /*AND SUBSTR(CF.CUSTODYCD,4,1)<>'P'*/
                        AND AF.ACTYPE=AFT.ACTYPE AND AFT.MRTYPE=MR.ACTYPE
                        AND MR.MRTYPE LIKE V_STRMARGIN
                        AND CF.BRID LIKE V_I_BRID
                        AND CF.CUSTODYCD LIKE V_STRCUSTODYCD
                       AND OD.TXDATE >= TO_DATE (F_DATE, 'DD/MM/YYYY')
                       AND OD.TXDATE <= TO_DATE (T_DATE, 'DD/MM/YYYY')
                       AND SB.SYMBOL LIKE V_STRSYMBOL
                       AND OD.EXECTYPE LIKE V_STREXECTYPE
                       AND OD.MATCHTYPE like V_STRMATCHTYPE
                       AND SB.TRADEPLACE LIKE  V_STRTRADEPLACE
                       AND OD.PRICETYPE LIKE V_STRPRICETYPE
                       AND nvl(OD.VOUCHER,'N') LIKE V_STRVOUCHER
                       AND OD.TLID LIKE V_STRMAKER
                       AND OD.Via like V_STRVIA
                       and af.careby like V_StrCAREBY
                       AND OD.ISDISPOSAL  LIKE V_ISDISPOSAL
                       and od.orderid = repo.orderid(+)
                       )T
                  LEFT JOIN
                  ( SELECT * FROM IOD
                   WHERE DELTD<>'Y' AND TXDATE >= TO_DATE (F_DATE, 'DD/MM/YYYY')
                       AND TXDATE <= TO_DATE (T_DATE, 'DD/MM/YYYY')
                  ) IO
                  ON IO.ORGORDERID=T.ORDERID
                 LEFT JOIN CONFIRMODRSTS CON ON CON.ORDERID=T.ORDERID
                 -- WHERE T.TYORDER LIKE V_STRTYPEORDER
                 WHERE T.CUSTTYPE LIKE V_STRCUSTTYPE
                       AND T.CUSTATCOM LIKE V_STRCUSTATCOM
                       AND NVL(CON.CONFIRMED,'N') LIKE V_STRCONFIRM
                  ORDER BY  T.EXECTYPE, T.SYMBOL,T.TXDATE,T.CIACCTNO
;
  else
      OPEN PV_REFCURSOR
       FOR
         SELECT nvl(V_NUMFEEACR,0) V_NUMFEEACR, nvl(V_NUMFEEACR_BRO,0) V_NUMFEEACR_BRO ,nvl(V_NUMEXECAMT__BRO,0) V_NUMEXECAMT__BRO ,

         T.ORDERID, T.TXDATE, T.SYMBOL, T.QUOTEPRICE , T.ORDERQTTY, T.CIACCTNO, T.FULLNAME,
         (CASE WHEN  NVL(IO.MATCHQTTY,0) <= 0 THEN 0 ELSE T.FEEACR END) FEEACR,
         T.TRADEPLACE,T.CUSTODYCD , T.VIA, T.TXTIME,T.MATCHTYPE,
         T.EXTY,T.EXECTYPE, T.TYORDER, T.CUSTTYPE, T.MAKER, T.APP, T.CUSTATCOM,

         NVL(IO.MATCHQTTY,0) MATCHQTTY,NVL(IO.MATCHPRICE,0) MATCHPRICE,NVL(IO.TXTIME,'') TXTIME_KHOP,
         CASE WHEN NVL(IO.MATCHQTTY,0) > 0 then (case when t.LEG = 'V' then t.REPOAMT else NVL(IO.MATCHQTTY,0) * NVL(IO.MATCHPRICE,0) end ) else 0 end MATCHamt
         FROM (
                  SELECT OD.ORDERID,OD.TXDATE,SB.SYMBOL,(CASE WHEN OD.PRICETYPE IN ('ATO','ATC')THEN  OD.PRICETYPE
                        ELSE TO_CHAR(OD.QUOTEPRICE) END )QUOTEPRICE ,OD.ORDERQTTY,OD.CIACCTNO,CF.FULLNAME,
                        case when nvl(repo.leg,'N') <> 'N' then repo.feeamt
                          else
                        (CASE WHEN OD.EXECAMT >0 AND OD.FEEACR =0 AND OD.STSSTATUS = 'N' AND OD.TXDATE=V_CURRDATE THEN ROUND(OD.EXECAMT * ODT.DEFFEERATE/100)
                          WHEN OD.EXECAMT >0 AND OD.FEEACR =0 AND OD.TXDATE <> V_CURRDATE THEN 0 ELSE OD.FEEACR END) END FEEACR,
                         sb.TRADEPLACE TRADEPLACE,CF.CUSTODYCD , OD.VIA  VIA, OD.TXTIME,OD.MATCHTYPE,
                         (CASE  WHEN OD.REFORDERID IS NOT NULL THEN 'C' ELSE OD.EXECTYPE END)EXTY,OD.EXECTYPE,
                         (CASE  WHEN OD.REFORDERID IS NOT NULL THEN 'C' ELSE 'O' END ) TYORDER,
                          A1.CDCONTENT CUSTTYPE,nvl(TLP.TLNAME, ' ') MAKER,NVL(TL.TLNAME,' ') APP,
                         (CASE WHEN CF.CUSTATCOM='Y' THEN 'KH luu ký' ELSE 'KH không luu ký' END ) CUSTATCOM,
                         NVL(REPO.LEG,'N') LEG, NVL(REPO.AMT1,0) REPOAMT
                 FROM ( select ACTYPE,ORDERID,CODEID,AFACCTNO,SEACCTNO,CIACCTNO,TXNUM,TXDATE,TXTIME,EXPDATE,BRATIO,TIMETYPE,EXECTYPE,NORK,MATCHTYPE,VIA,CLEARDAY,CLEARCD,ORSTATUS,PRICETYPE,QUOTEPRICE,STOPPRICE,LIMITPRICE,ORDERQTTY,REMAINQTTY,EXECQTTY,STANDQTTY,CANCELQTTY,ADJUSTQTTY,REJECTQTTY,REJECTCD,CUSTID,EXPRICE,EXQTTY,ICCFCD,ICCFTIED,EXECAMT,EXAMT,FEEAMT,CONSULTANT,VOUCHER,ODTYPE,FEEACR,PORSTATUS,RLSSECURED,SECUREDAMT,MATCHAMT,DELTD,REFORDERID,BANKTRFAMT,BANKTRFFEE,EDSTATUS,CORRECTIONNUMBER,CONTRAFIRM,TRADERID,CLIENTID,CONFIRM_NO,FOACCTNO,HOSESESSION,CONTRAORDERID,PUTTYPE,CONTRAFRM,DFACCTNO,LAST_CHANGE,DFQTTY,STSSTATUS,FEEBRATIO,TLID,SSAFACCTNO,ADVIDREF,NOE,GRPORDER,GRPAMT,EXCFEEAMT,EXCFEEREFID,ISDISPOSAL,
                        TAXRATE,TAXSELLAMT,ERROD,ERRSTS,ERRREASON,FERROD,QUOTEQTTY, CONFIRMED, cancelstatus
                        from odmast where TXDATE >= TO_DATE (F_DATE, 'DD/MM/YYYY')
                       AND TXDATE <= TO_DATE (T_DATE, 'DD/MM/YYYY')
                        union all
                        select ACTYPE,ORDERID,CODEID,AFACCTNO,SEACCTNO,CIACCTNO,TXNUM,TXDATE,TXTIME,EXPDATE,BRATIO,TIMETYPE,EXECTYPE,NORK,MATCHTYPE,VIA,CLEARDAY,CLEARCD,ORSTATUS,PRICETYPE,QUOTEPRICE,STOPPRICE,LIMITPRICE,ORDERQTTY,REMAINQTTY,EXECQTTY,STANDQTTY,CANCELQTTY,ADJUSTQTTY,REJECTQTTY,REJECTCD,CUSTID,EXPRICE,EXQTTY,ICCFCD,ICCFTIED,EXECAMT,EXAMT,FEEAMT,CONSULTANT,VOUCHER,ODTYPE,FEEACR,PORSTATUS,RLSSECURED,SECUREDAMT,MATCHAMT,DELTD,REFORDERID,BANKTRFAMT,BANKTRFFEE,EDSTATUS,CORRECTIONNUMBER,CONTRAFIRM,TRADERID,CLIENTID,CONFIRM_NO,FOACCTNO,HOSESESSION,CONTRAORDERID,PUTTYPE,CONTRAFRM,DFACCTNO,LAST_CHANGE,DFQTTY,STSSTATUS,FEEBRATIO,TLID,SSAFACCTNO,ADVIDREF,NOE,GRPORDER,GRPAMT,EXCFEEAMT,EXCFEEREFID,ISDISPOSAL,
                        TAXRATE,TAXSELLAMT,ERROD,ERRSTS,ERRREASON,FERROD,QUOTEQTTY,CONFIRMED, cancelstatus
                        from odmasthist where TXDATE >= TO_DATE (F_DATE, 'DD/MM/YYYY')
                       AND TXDATE <= TO_DATE (T_DATE, 'DD/MM/YYYY') -- vw_odmast_tradeplace_all
                      --  WHERE deltd <>'Y' and (SUBSTR(ORDERID,1,4) LIKE V_STRBRID OR SUBSTR(AFACCTNO,1,4) LIKE V_STRBRID)
                                           ) OD,
                        SBSECURITIES SB,AFMAST AF ,
                        (select tl.txdate, tl.txnum, nvl(tp.tlname,' ') tlname from tllog tl, tlprofiles tp
                                where deltd <> 'Y' and TXDATE >= TO_DATE (F_DATE, 'DD/MM/YYYY') AND TXDATE <= TO_DATE (T_DATE, 'DD/MM/YYYY') AND tl.offid = tp.tlid(+)
                          union all
                          select tl.txdate, tl.txnum, nvl(tp.tlname,' ') tlname from tllogall tl, tlprofiles tp
                                 where deltd <> 'Y' and TXDATE >= TO_DATE (F_DATE, 'DD/MM/YYYY')  AND TXDATE <= TO_DATE (T_DATE, 'DD/MM/YYYY') AND tl.offid = tp.tlid(+)
                          ) TL, /*TLPROFILES TLP2,*/ ALLCODE A1,AFTYPE AFT, MRTYPE MR,
                        (SELECT * FROM CFMAST WHERE FNC_VALIDATE_SCOPE(BRID, CAREBY, TLSCOPE, pv_BRID, TLGOUPS)=0) CF, ODTYPE odt,tlprofiles tlp,
                        (SELECT ORDERID, REPOACCTNO, TXDATE, QTTY, AMT1,FEEAMT, LEG  FROM BONDREPO) repo
                  WHERE  OD.CODEID=SB.CODEID
                       AND OD.TXDATE=TL.TXDATE (+)
                       AND OD.TXNUM=TL.TXNUM (+)
                       --AND TL.OFFID=TLP2.TLID(+)
                       AND od.tlid = tlp.tlid (+)
                       AND odt.actype = OD.ACTYPE
                       AND OD.CIACCTNO=AF.ACCTNO
                       AND AF.CUSTID=CF.CUSTID
                        AND A1.CDTYPE='CF' AND A1.CDNAME='CUSTTYPE' AND A1.CDVAL=CF.CUSTTYPE
                      -- AND AF.ACTYPE NOT IN ('0000')
                       /*AND SUBSTR(CF.CUSTODYCD,4,1)<>'P'*/
                        AND AF.ACTYPE=AFT.ACTYPE AND AFT.MRTYPE=MR.ACTYPE
                        AND MR.MRTYPE LIKE V_STRMARGIN
                        AND CF.BRID LIKE V_I_BRID
                        AND CF.CUSTODYCD LIKE V_STRCUSTODYCD
                       AND OD.TXDATE >= TO_DATE (F_DATE, 'DD/MM/YYYY')
                       AND OD.TXDATE <= TO_DATE (T_DATE, 'DD/MM/YYYY')
                       AND SB.SYMBOL LIKE V_STRSYMBOL
                       AND OD.EXECTYPE LIKE V_STREXECTYPE
                       AND OD.MATCHTYPE like V_STRMATCHTYPE
                       AND SB.TRADEPLACE LIKE  V_STRTRADEPLACE
                       AND OD.PRICETYPE LIKE V_STRPRICETYPE
                       AND nvl(OD.VOUCHER,'N') LIKE V_STRVOUCHER
                       AND OD.TLID LIKE V_STRMAKER
                       AND OD.Via like V_STRVIA
                       and af.careby like V_StrCAREBY
                       AND OD.ISDISPOSAL  LIKE V_ISDISPOSAL
                       AND OD.ORDERID = REPO.ORDERID(+)
                       )T
                  LEFT JOIN
                  ( SELECT * FROM IOD
                   WHERE DELTD<>'Y' AND TXDATE >= TO_DATE (F_DATE, 'DD/MM/YYYY')
                       AND TXDATE <= TO_DATE (T_DATE, 'DD/MM/YYYY')
                  UNION ALL
                 SELECT * FROM IODHIST
                  WHERE DELTD<>'Y' AND TXDATE >= TO_DATE (F_DATE, 'DD/MM/YYYY')
                       AND TXDATE <= TO_DATE (T_DATE, 'DD/MM/YYYY')
                  ) IO
                  ON IO.ORGORDERID=T.ORDERID
                 LEFT JOIN CONFIRMODRSTS CON ON CON.ORDERID=T.ORDERID
                 -- WHERE T.TYORDER LIKE V_STRTYPEORDER
                 WHERE T.CUSTTYPE LIKE V_STRCUSTTYPE
                       AND T.CUSTATCOM LIKE V_STRCUSTATCOM
                       AND NVL(CON.CONFIRMED,'N') LIKE V_STRCONFIRM
                  ORDER BY  T.EXECTYPE, T.SYMBOL,T.TXDATE,T.CIACCTNO
;
end if;
EXCEPTION
   WHEN OTHERS
   THEN
      RETURN;
END;                                                              -- PROCEDURE

 
/