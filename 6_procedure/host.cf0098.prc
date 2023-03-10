SET DEFINE OFF;
CREATE OR REPLACE PROCEDURE cf0098 (
   PV_REFCURSOR   IN OUT   PKG_REPORT.REF_CURSOR,
   OPT            IN       VARCHAR2,
   PV_BRID           IN       VARCHAR2,
   TLGOUPS        IN       VARCHAR2,
   TLSCOPE        IN       VARCHAR2,
   CUSTODYCD      IN       VARCHAR2,
   AFACCTNO       IN       VARCHAR2,
   SYMBOL         IN       VARCHAR2
  )
IS
--
-- PURPOSE: BRIEFLY EXPLAIN THE FUNCTIONALITY OF THE PROCEDURE
-- DANH MUC DAU TU - OPEN POSITION
-- MODIFICATION HISTORY
-- PERSON      DATE    COMMENTS
-- DUNGNH   18-AUG-10  CREATED
-- ---------   ------  -------------------------------------------

   CUR             PKG_REPORT.REF_CURSOR;
   V_STROPTION    VARCHAR2 (5);            -- A: ALL; B: BRANCH; S: SUB-BRANCH
   V_STRBRID      VARCHAR2 (4);            -- USED WHEN V_NUMOPTION > 0

   V_STRAFACCTNO  VARCHAR2(20);
   V_STRUTODYCD   VARCHAR2(20);
   V_STRSYMBOL    VARCHAR2(20);
   V_VATRATE      NUMBER(20,4)  ;
   V_DEFFEERATE   NUMBER(20,4)  ;

BEGIN
   V_STROPTION := OPT;

   IF (V_STROPTION <> 'A') AND (PV_BRID <> 'ALL')
   THEN
      V_STRBRID := PV_BRID;
   ELSE
      V_STRBRID := '%%';
   END IF;

   -- GET REPORT'S PARAMETERS

   IF (SYMBOL <> 'ALL' )
   THEN
      V_STRSYMBOL := SYMBOL;
   ELSE
      V_STRSYMBOL := '%';
   END IF;

   IF (CUSTODYCD <> 'ALL' )
   THEN
      V_STRUTODYCD  := CUSTODYCD;
   ELSE
      V_STRUTODYCD := '%';
   END IF;

   IF (AFACCTNO <> 'ALL' )
   THEN
      V_STRAFACCTNO := AFACCTNO;
   ELSE
      V_STRAFACCTNO := '%';
   END IF;


   --V_STRAFACCTNO := AFACCTNO;
   --V_STRUTODYCD  := CUSTODYCD;

   --TI LE PHI GIAO DICH CAO NHAT TINH THEO SO TIEU KHOAN

    SELECT SUM(nvl(RATE,0)) INTO V_DEFFEERATE
    FROM
    (
        SELECT ICRATE RATE
        FROM ICCFTYPEDEF ICC, AFMAST AF
        WHERE EVENTCODE = 'DTRADEFEE'
            AND ICC.ACTYPE = AF.ACTYPE
            AND AF.ACCTNO = V_STRAFACCTNO
        UNION ALL
        SELECT MAX(DELTA) RATE
        FROM ICCFTIER ICC, AFMAST AF
        WHERE EVENTCODE = 'DTRADEFEE'
            AND ICC.ACTYPE = AF.ACTYPE
            AND AF.ACCTNO = V_STRAFACCTNO
    );
    --TI LE THUE THU NHAP CA NHAN.

    SELECT max(nvl(ICRATE,0)) INTO V_VATRATE
    FROM ICCFTYPEDEF ICC, AFMAST AF
    WHERE  EVENTCODE = 'CFSELLVAT'
        AND ICC.ACTYPE = AF.ACTYPE
        AND AF.ACCTNO = V_STRAFACCTNO;

   -- END OF GETTING REPORT'S PARAMETERS

   -- GET REPORT'S DATA

OPEN PV_REFCURSOR
FOR
    SELECT SE.AFACCTNO CUSTID, SE.CUSTODYCD, SE.SYMBOL, SE.COSTPRICE, SE.TRADE_QTTY, SE.BLOCKED,
        SE.SECURITIES_RECEIVING, SE.CPQUYENVE, SE.CPTHUONG,
        SE.COTUCTIEN, nvl(SEINFO.currprice,0) CURRPRICE,
        nvl(V_VATRATE,0) VATRATE, nvl(V_DEFFEERATE,0) DEFFEERATE
    FROM VW_STRADE_OPEN_POSITION SE, securities_info SEINFO
    WHERE SE.SYMBOL LIKE V_STRSYMBOL
        AND SE.SYMBOL = SEINFO.SYMBOL(+)
        AND SE.CUSTODYCD LIKE V_STRUTODYCD
        AND SE.AFACCTNO LIKE V_STRAFACCTNO
    ;

EXCEPTION
   WHEN OTHERS
   THEN
      RETURN;
END;                                                              -- PROCEDURE
 
/
