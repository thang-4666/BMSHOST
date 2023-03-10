SET DEFINE OFF;
CREATE OR REPLACE PROCEDURE "CI0043" (
   PV_REFCURSOR   IN OUT   PKG_REPORT.REF_CURSOR,
   OPT            IN       VARCHAR2,
   pv_BRID        IN       VARCHAR2,
   TLGOUPS        IN       VARCHAR2,
   TLSCOPE        IN       VARCHAR2,
   F_DATE         IN       VARCHAR2,
   T_DATE         IN       VARCHAR2,
   PV_CUSTODYCD    IN       VARCHAR2,
   I_BRID         IN       VARCHAR2,
   PV_ADTYPE       IN       VARCHAR2
 )
IS

--
-- PURPOSE: BRIEFLY EXPLAIN THE FUNCTIONALITY OF THE PROCEDURE
-- BẢNG KÊ TÀI SẢN ĐẢM BẢO ĐỐI VỚI CÁC PHÁT SINH GIAO DỊCH VAY ỨNG TRƯỚC TIỀN BÁN CHỨNG KHOÁN
-- MODIFICATION HISTORY
-- PERSON      DATE    COMMENTS
-- NGOCVTT  24-SEP-15  CREATED
-- ---------   ------  -------------------------------------------
   V_STROPT     VARCHAR2 (5);            -- A: ALL; B: BRANCH; S: SUB-BRANCH
   V_STRBRID    VARCHAR2 (40);                   -- USED WHEN V_NUMOPTION > 0
   V_INBRID     VARCHAR2 (5);


   V_STRCUSTODYCD  VARCHAR2 (20);

   V_STRISBRID      VARCHAR2 (5);
   V_TODATE         DATE;
    V_FROMDATE         DATE;
   V_ADTYPE         VARCHAR2(20);
   V_STRBANKRATE    NUMBER;
   V_STRBANKID       VARCHAR2(20);
   V_BANKSHORT      VARCHAR2(50);
   V_BANKNAME       VARCHAR2(1000);


BEGIN

   V_STROPT := OPT;

   IF (V_STROPT <> 'A') AND (PV_BRID <> 'ALL')
   THEN
      V_STRBRID := PV_BRID;
   ELSE
      V_STRBRID := '%%';
   END IF;

    IF (UPPER(I_BRID) = 'ALL' OR I_BRID IS NULL)
    THEN
      V_STRISBRID := '%%';
    ELSE
      V_STRISBRID := I_BRID;
    END IF;
-----------------
    IF (UPPER(PV_CUSTODYCD) = 'ALL' OR PV_CUSTODYCD IS NULL)
    THEN
      V_STRCUSTODYCD := '%%';
    ELSE
      V_STRCUSTODYCD := PV_CUSTODYCD;
    END IF;

  --------------------------
     V_ADTYPE := PV_ADTYPE;


   V_FROMDATE   := TO_DATE(F_DATE,'DD/MM/RRRR');
   V_TODATE   := TO_DATE(T_DATE,'DD/MM/RRRR');

   SELECT BANKRATE, BANKID, CF.SHORTNAME,CF.FULLNAME INTO V_STRBANKRATE, V_STRBANKID, V_BANKSHORT, V_BANKNAME
   FROM CFLIMIT CFL, CFMAST CF WHERE CFL.LMSUBTYPE='ADV' AND CF.CUSTID=CFL.BANKID AND CFL.BANKID=V_ADTYPE;
   -- GET REPORT'S DATA

    OPEN  PV_REFCURSOR FOR

        SELECT distinct V_STRBANKRATE V_STRBANKRATE, V_STRBANKID V_STRBANKID,
        (CASE WHEN V_BANKSHORT IS NULL THEN V_BANKNAME ELSE V_BANKSHORT END) V_BANKSHORT, V_BANKNAME V_BANKNAME,
          V_STRBRID V_STRBRID, CF.FULLNAME,CF.BRID,CF.CUSTID,CF.CUSTODYCD,CF.IDCODE,AD.TXDATE,AD.CLEARDT,AD.ACCTNO,
        ST.AMT,SB.SYMBOL,ADV.RRTYPE,ADV.CUSTBANK, TO_CHAR(AD.TXDATE,'DD/MM/YYYY') ADVDATE
        FROM (SELECT * FROM ADSCHD UNION ALL SELECT * FROM ADSCHDHIST) AD, VW_ADVSRESLOG_ALL ADV,
        CFMAST CF,AFMAST AF,VW_STSCHD_ALL ST,SBSECURITIES SB
        WHERE  AD.TXDATE=ADV.TXDATE
        AND AD.TXNUM=ADV.TXNUM
        AND ADV.RRTYPE='B' AND ADV.DELTD<>'Y' AND ST.DELTD<>'Y'
        AND CF.CUSTID=AF.CUSTID
        AND AF.ACCTNO=AD.ACCTNO
        AND ST.DUETYPE='RM'
        AND AD.TXDATE BETWEEN V_FROMDATE AND V_TODATE
        AND ADV.CUSTBANK LIKE V_ADTYPE
        AND CF.CUSTODYCD LIKE V_STRCUSTODYCD
        AND CF.BRID LIKE V_STRISBRID
        AND AD.ACCTNO=ST.AFACCTNO
        AND AD.CLEARDT=ST.CLEARDATE
        AND ST.CODEID=SB.CODEID
        ORDER BY AD.TXDATE,AD.CLEARDT,CF.CUSTODYCD;

EXCEPTION
   WHEN OTHERS
   THEN
      RETURN;
END;                                                              -- PROCEDURE

 
 
 
 
/
