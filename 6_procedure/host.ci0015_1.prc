SET DEFINE OFF;
CREATE OR REPLACE PROCEDURE "CI0015_1" (
   PV_REFCURSOR   IN OUT   PKG_REPORT.REF_CURSOR,
   OPT            IN       VARCHAR2,
   pv_BRID           IN       VARCHAR2,
   TLGOUPS        IN       VARCHAR2,
   TLSCOPE        IN       VARCHAR2,
   F_DATE         IN       VARCHAR2,
   T_DATE         IN       VARCHAR2,
   F_CDATE        IN       VARCHAR2,
   T_CDATE        IN       VARCHAR2,
   F_ODATE        IN       VARCHAR2,
   T_ODATE        IN       VARCHAR2,
   I_BRID         IN       VARCHAR2,
   I_ADTYPE       IN       VARCHAR2,
   VIA          IN       VARCHAR2,
   PV_CLEARDT     IN       VARCHAR2,
   CASHPLACE      IN       VARCHAR2
 )
IS

--

-- ---------   ------  -------------------------------------------
   V_STROPT     VARCHAR2 (10);            -- A: ALL; B: BRANCH; S: SUB-BRANCH
   V_STRBRID    VARCHAR2 (40);                   -- USED WHEN V_NUMOPTION > 0
   V_INBRID     VARCHAR2 (10);


   V_STRAFACCTNO   VARCHAR2 (20);
   V_STRCUSTODYCD  VARCHAR2 (20);

   V_STRISBRID      VARCHAR2 (10);
   V_FROMDATE       DATE;
   V_TODATE         DATE;
   V_CFROMDATE       DATE;
   V_CTODATE         DATE;
   V_OFROMDATE       DATE;
   V_OTODATE         DATE;
   V_ADVFEERATE NUMBER(20,6);

    -- ADDED BY TRUONG FOR LOGGING
   V_TRADELOG CHAR(20);
   V_AUTOID NUMBER;
   V_INSTANCE VARCHAR2 (10);
   V_ADTYPE     VARCHAR2(20);
   V_STRVIA     VARCHAR2(20);
   V_PV_CLEARDT   NUMBER;
   V_STRCASHPLACE      VARCHAR2(1000);

BEGIN

  /*
    V_STROPT := UPPER(OPT);
    V_INBRID := pv_BRID;

    IF(V_STROPT = 'A') THEN
        V_STRBRID := '%';
    ELSE
        IF(V_STROPT = 'B') THEN
            SELECT BR.MAPID INTO V_STRBRID FROM BRGRP BR WHERE  BR.BRID = V_INBRID;
        ELSE
            V_STRBRID := pv_BRID;
        END IF;
    END IF;
*/
   V_STROPT := OPT;

   IF (V_STROPT <> 'A') AND (PV_BRID <> 'ALL')
   THEN
      V_STRBRID := PV_BRID;
   ELSE
      V_STRBRID := '%%';
   END IF;
    -- GET REPORT'S PARAMETERS
    IF  (CASHPLACE <> 'ALL')
    THEN
      V_STRCASHPLACE := CASHPLACE;
    ELSE
      V_STRCASHPLACE := '%';
    END IF;

    IF (UPPER(I_BRID) = 'ALL' OR I_BRID IS NULL)
    THEN
      V_STRISBRID := '%%';
    ELSE
      V_STRISBRID := I_BRID;
    END IF;

    IF I_ADTYPE = 'ALL' OR I_ADTYPE IS NULL THEN
        V_ADTYPE := '%%';
    ELSE
        V_ADTYPE := I_ADTYPE;
    END IF;


    IF UPPER(VIA) = 'ALL' OR VIA IS NULL THEN
        V_STRVIA := '%';
    ELSE
        V_STRVIA := VIA;
    END IF;

    IF(UPPER(PV_CLEARDT) = 'ALL')OR PV_CLEARDT IS NULL THEN
        V_PV_CLEARDT := 0;
    ELSE
        V_PV_CLEARDT := PV_CLEARDT;
    END IF;

   V_FROMDATE   := TO_DATE(F_DATE,'DD/MM/RRRR');
   V_TODATE     := TO_DATE(T_DATE,'DD/MM/RRRR');
   V_CFROMDATE  := TO_DATE(F_CDATE,'DD/MM/RRRR');
   V_CTODATE    := TO_DATE(T_CDATE,'DD/MM/RRRR');
   V_OFROMDATE  := TO_DATE(F_ODATE,'DD/MM/RRRR');
   V_OTODATE    := TO_DATE(T_ODATE,'DD/MM/RRRR');
    SELECT TO_NUMBER(VARVALUE)/360 INTO V_ADVFEERATE
    FROM SYSVAR WHERE VARNAME = 'AINTRATE' AND GRNAME = 'SYSTEM';
   -- END OF GETTING REPORT'S PARAMETERS

   -- GET REPORT'S DATA

    OPEN  PV_REFCURSOR FOR
      SELECT TO_CHAR(AD.ODDATE,'DD/MM/RRRR') ODDATE, BR.BRNAME BRNAME,CF.BRID CAREBY,
            TO_CHAR(AD.TXDATE,'DD/MM/RRRR') TXDATE, TO_CHAR(AD.TXNUM) TXNUM , CF.CUSTODYCD, AF.ACCTNO,
             CF.FULLNAME FULLNAME,TO_CHAR(AD.CLEARDT,'DD/MM/RRRR') CLEARDT, ADT.AMT NAMT,    
             ADT.FEEADVB  bankfee, ADT.RRTYPE,
            ADT.FEEADVC vatamt, NVL(ADT.CUSTBANK,'') BANK,
            NVL(ADT.ADVRATE,0)  FEE, NVL(ADT.BANKRATE,0)  BANKFEERATE,
            ADT.FEEADV FEEAMT, ADT.AMT -ADT.FEEADV AMT,ADT.VAT,     
            NVL(CF2.SHORTNAME,CF2.MNEMONIC) CUSTBANK,
            TO_NUMBER(AD.CLEARDT-AD.TXDATE) NGAYUT,
            DECODE(V_ADTYPE,'%%','ALL',NVL(CF2.SHORTNAME,CF2.MNEMONIC)) ADVBANK, AD.ADTYPE,
            DECODE(V_STRISBRID,'%%','ALL',NVL(BR.BRNAME,'')) BRANCH,
            (CASE WHEN SUBSTR(AD.TXNUM,1,2) = '68' THEN '68'
                WHEN SUBSTR(AD.TXNUM,1,2) = '99' THEN '99' ELSE '00' END) KENH,  CASE WHEN SUBSTR(AF.ACCTNO,1,2)= SUBSTR(AD.TXNUM,1,2) OR substr(AD.TXNUM,1,2) IN ('99','68')   THEN '1'  ELSE '2' END TYPEBRID,
            ad.txkey
        FROM (SELECT * FROM
                (
                    SELECT ACCTNO, TXDATE,RRTYPE, TXNUM, CLEARDT, AMT, FEEAMT, PAIDAMT, DELTD,CUSTBANK, NVL(ADTYPE,'----') ADTYPE, ODDATE, bankfee, vatamt ,
                        to_char(txdate,'DDMMRRRR') || substr(txnum,5,6) txkey
                    FROM ADSCHD
                    UNION ALL
                    SELECT ACCTNO, TXDATE,RRTYPE, TXNUM, CLEARDT, AMT, FEEAMT, PAIDAMT, DELTD,CUSTBANK, NVL(ADTYPE,'----') ADTYPE, ODDATE, bankfee, vatamt,
                        to_char(txdate,'DDMMRRRR') || substr(txnum,5,6) txkey
                    FROM ADSCHDHIST
                )
             ) AD, (select * from afmast where (case when CASHPLACE = 'ALL' then 'ALL'
                                                        when CASHPLACE = '000' or CASHPLACE = '---' then corebank
                                                        when CASHPLACE = '111' then corebank
                                                        else corebank || bankname end)
                                                   = case when CASHPLACE = 'ALL' then 'ALL'
                                                        when CASHPLACE = '000'  or CASHPLACE = '---' then 'N'
                                                        when CASHPLACE = '111'  then 'Y'
                                                        else 'Y' || V_STRCASHPLACE  end ) AF,
              (SELECT * FROM CFMAST WHERE FNC_VALIDATE_SCOPE(BRID, CAREBY, TLSCOPE, pv_BRID, TLGOUPS)=0 ) CF, BRGRP BR ,
             (SELECT * FROM TLLOG UNION ALL SELECT * FROM  TLLOGALL) TL,
             CFMAST CF2,VW_ADVSRESLOG_ALL ADT
        WHERE  (AD.DELTD = 'Y' OR ADT.DELTD='Y')
            AND AF.ACCTNO = AD.ACCTNO
            AND AF.CUSTID = CF.CUSTID
            AND AD.TXNUM = TL.TXNUM
            AND AD.TXDATE = TL.TXDATE
            AND TL.BRID = BR.BRID
            AND AD.TXDATE >= V_FROMDATE
            AND AD.TXDATE <= V_TODATE
            AND AD.CLEARDT >= V_CFROMDATE
            AND AD.CLEARDT <= V_CTODATE
            and AD.ODDATE >= V_OFROMDATE
            and AD.ODDATE <= V_OTODATE
            AND ADT.CUSTBANK = CF2.CUSTID
             AND AD.TXDATE = ADT.TXDATE
            AND AD.TXNUM=ADT.TXNUM
            AND NVL(ADT.CUSTBANK,'0000') LIKE V_ADTYPE
            AND CF.BRID LIKE V_STRISBRID
            AND (CASE WHEN V_PV_CLEARDT = 0 THEN V_PV_CLEARDT ELSE TO_NUMBER(AD.CLEARDT-AD.TXDATE)END) LIKE V_PV_CLEARDT
            AND ((CASE WHEN SUBSTR(AD.TXNUM,1,2) = '68' THEN 'O' ELSE 'FA' END) LIKE V_STRVIA
            OR (CASE WHEN SUBSTR(AD.TXNUM,1,2) = '68' THEN 'O'
                WHEN SUBSTR(AD.TXNUM,1,2) = '99' THEN 'A' ELSE 'F' END) LIKE V_STRVIA)
        ORDER BY AD.TXDATE, AD.ACCTNO, AD.TXNUM;

EXCEPTION
   WHEN OTHERS
   THEN
      RETURN;
END;                                                              -- PROCEDURE

 
 
 
 
/