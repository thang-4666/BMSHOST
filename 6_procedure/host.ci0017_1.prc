SET DEFINE OFF;
CREATE OR REPLACE PROCEDURE "CI0017_1" (
   PV_REFCURSOR   IN OUT   PKG_REPORT.REF_CURSOR,
   OPT            IN       VARCHAR2,
   pv_BRID        IN       VARCHAR2,
   TLGOUPS        IN       VARCHAR2,
   TLSCOPE        IN       VARCHAR2,
   P_CUSTODYCD    IN       VARCHAR2,
   P_AFACCTNO     IN       VARCHAR2,
   F_DATE         IN       VARCHAR2,
   T_DATE         IN       VARCHAR2,
   F_CDATE        IN       VARCHAR2,
   T_CDATE        IN       VARCHAR2,
   F_ODATE        IN       VARCHAR2,
   T_ODATE        IN       VARCHAR2,
   I_BRID         IN       VARCHAR2,
   I_ADTYPE       IN       VARCHAR2,
   VIA          IN       VARCHAR2,
   PV_CLEARDT     IN       VARCHAR2
 /*  CASHPLACE      IN       VARCHAR2*/
 )
IS

--
-- PURPOSE: BRIEFLY EXPLAIN THE FUNCTIONALITY OF THE PROCEDURE
-- BANG KE TRA TIEN UONG TRUOC TIEN BAN NGUON NGAN HANG
-- MODIFICATION HISTORY
-- PERSON      DATE    COMMENTS
-- NGOCVTT   22-MAY-15  CREATED
-- ---------   ------  -------------------------------------------
   V_STROPT     VARCHAR2 (5);            -- A: ALL; B: BRANCH; S: SUB-BRANCH
   V_STRBRID    VARCHAR2 (40);                   -- USED WHEN V_NUMOPTION > 0
   V_INBRID     VARCHAR2 (5);


   V_STRAFACCTNO   VARCHAR2 (20);
   V_STRCUSTODYCD  VARCHAR2 (20);

   V_STRISBRID      VARCHAR2 (5);
   V_FROMDATE       DATE;
   V_TODATE         DATE;
   V_CFROMDATE       DATE;
   V_CTODATE         DATE;
   V_OFROMDATE       DATE;
   V_OTODATE         DATE;
   V_ADVFEERATE NUMBER(20,6);

   V_TRADELOG CHAR(20);
   V_AUTOID NUMBER;
   V_INSTANCE VARCHAR2 (20);
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
/*    IF  (CASHPLACE <> 'ALL')
    THEN
      V_STRCASHPLACE := CASHPLACE;
    ELSE
      V_STRCASHPLACE := '%';
    END IF;*/

    IF (UPPER(I_BRID) = 'ALL' OR I_BRID IS NULL)
    THEN
      V_STRISBRID := '%%';
    ELSE
      V_STRISBRID := I_BRID;
    END IF;
-----------------
    IF (UPPER(P_CUSTODYCD) = 'ALL' OR P_CUSTODYCD IS NULL)
    THEN
      V_STRCUSTODYCD := '%%';
    ELSE
      V_STRCUSTODYCD := P_CUSTODYCD;
    END IF;

        IF (UPPER(P_AFACCTNO) = 'ALL' OR P_AFACCTNO IS NULL)
    THEN
      V_STRAFACCTNO := '%%';
    ELSE
      V_STRAFACCTNO := P_AFACCTNO;
    END IF;
  --------------------------
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

   SELECT LN.*,NVL(RE.REFULLNAME,'') MG_CHINH,NVL(REFT.REFULLNAME,'')MG_PHU, V_CFROMDATE FROMDATE,V_CTODATE TODATE
   FROM (SELECT FULLNAME,BRID,CUSTODYCD,IDCODE,TXDATE,CLEARDT,NGAYUT,CUSTBANK,CUSTID,
               MAX(BANKFEERATE) BANKFEERATE,SUM(NAMT) NAMT, SUM(FEEAMT) FEEAMT, SUM(AMT) AMT, SUM(bankfee) bankfee, SUM(vatamt) vatamt
          FROM(SELECT  CF.BRID ,CF.IDCODE, TO_CHAR(AD.TXDATE,'DD/MM/YYYY') TXDATE, CF.CUSTODYCD ,CF.CUSTID,
                  CF.FULLNAME FULLNAME,AD.CLEARDT CLEARDT, ADT.AMT NAMT, ADT.FEEADVB  bankfee, ADT.RRTYPE,
                  ADT.FEEADVC vatamt, NVL(ADT.CUSTBANK,'') BANK,
                  NVL(ADT.ADVRATE,0)  FEE, NVL(ADT.BANKRATE,0)  BANKFEERATE,
                  ADT.FEEADV FEEAMT, ADT.AMT -ADT.FEEADV AMT,ADT.VAT,     
                  NVL(CF2.SHORTNAME,CF2.MNEMONIC) CUSTBANK,
                  TO_NUMBER(AD.CLEARDT-AD.TXDATE) NGAYUT

        FROM (SELECT * FROM
                        (
                    SELECT AUTOID, ACCTNO, TXDATE,RRTYPE, TXNUM, CLEARDT, AMT, FEEAMT, PAIDAMT, DELTD,CUSTBANK, ODDATE, bankfee, vatamt ,
                        to_char(txdate,'DDMMRRRR') || substr(txnum,5,6) txkey, ADTYPE
                    FROM ADSCHD
                    UNION ALL
                    SELECT AUTOID, ACCTNO, TXDATE,RRTYPE, TXNUM, CLEARDT, AMT, FEEAMT, PAIDAMT, DELTD,CUSTBANK, ODDATE, bankfee, vatamt,
                        to_char(txdate,'DDMMRRRR') || substr(txnum,5,6) txkey, ADTYPE
                    FROM ADSCHDHIST
                )
             ) AD, AFMAST AF,(SELECT * FROM CFMAST WHERE FNC_VALIDATE_SCOPE(BRID, CAREBY, TLSCOPE, pv_BRID, TLGOUPS)=0) CF,VW_TLLOG_ALL TL,
             CFMAST CF2,
             VW_ADVSRESLOG_ALL ADT,ADTYPE ADTY
        WHERE AD.DELTD <> 'Y' AND ADT.DELTD<>'Y'
            AND AF.ACCTNO = AD.ACCTNO
            AND AF.CUSTID = CF.CUSTID
            AND AD.TXNUM = TL.TXNUM
            AND AD.TXDATE = TL.TXDATE
            AND AD.TXDATE >= V_FROMDATE
            AND AD.TXDATE <= V_TODATE
            and AD.ODDATE >= V_OFROMDATE
            and AD.ODDATE <= V_OTODATE
            AND NVL(ADT.CUSTBANK,'000') = CF2.CUSTID
            AND AD.ADTYPE=ADTY.ACTYPE
            AND AD.TXDATE = ADT.TXDATE
            AND AD.TXNUM=ADT.TXNUM
            AND ADT.RRTYPE='B'
            AND AD.PAIDAMT>0
            AND CF.CUSTODYCD LIKE V_STRCUSTODYCD
            AND AF.ACCTNO LIKE V_STRAFACCTNO
            AND NVL(ADT.CUSTBANK,'0000') LIKE V_ADTYPE
            AND CF.BRID LIKE V_STRISBRID
            AND (CASE WHEN V_PV_CLEARDT = 0 THEN V_PV_CLEARDT ELSE TO_NUMBER(AD.CLEARDT-AD.TXDATE)END) LIKE V_PV_CLEARDT
            AND ((CASE WHEN SUBSTR(AD.TXNUM,1,2) = '68' THEN 'O' ELSE 'FA' END) LIKE V_STRVIA
            OR (CASE WHEN SUBSTR(AD.TXNUM,1,2) = '68' THEN 'O'
                WHEN SUBSTR(AD.TXNUM,1,2) = '99' THEN 'A' ELSE 'F' END) LIKE V_STRVIA)
                  )
                  GROUP BY FULLNAME,BRID,CUSTODYCD,IDCODE,TXDATE,CLEARDT,NGAYUT,CUSTBANK,CUSTID
          )LN
                  LEFT JOIN
       (--moi gioi chinh-tu van dau tu vip
      SELECT CFRE.CUSTID RECUSTID, CFRE.FULLNAME REFULLNAME, A0.CDCONTENT DESC_REROLE,
      CF.CUSTODYCD, CF.FULLNAME CUSTNAME, LNK.AFACCTNO ACCTNO, LNK.FRDATE, LNK.TODATE
      FROM REAFLNK LNK, CFMAST CF, REMAST RE, RETYPE TYP, CFMAST CFRE, ALLCODE A0 , RECFLNK RF
      WHERE CF.CUSTID=LNK.AFACCTNO AND LNK.STATUS='A' AND TYP.REROLE='CS'
      AND RE.ACTYPE=TYP.ACTYPE AND RE.CUSTID=CFRE.CUSTID AND RE.ACCTNO=LNK.REACCTNO
      AND A0.CDTYPE='RE' AND A0.CDNAME='REROLE' AND A0.CDVAL=TYP.REROLE
       AND LNK.refrecflnkid=RF.autoid
       ) RE

      ON RE.ACCTNO=LN.CUSTID AND  LN.TXDATE >=re.frdate AND LN.TXDATE < re.todate

      LEFT JOIN
       (--moi gioi phu-cham soc ho
      SELECT CFRE.CUSTID RECUSTID, CFRE.FULLNAME REFULLNAME, A0.CDCONTENT DESC_REROLE,
      CF.CUSTODYCD, CF.FULLNAME CUSTNAME, LNK.AFACCTNO ACCTNO, LNK.FRDATE, LNK.TODATE
      FROM REAFLNK LNK, CFMAST CF, REMAST RE, RETYPE TYP, CFMAST CFRE, ALLCODE A0 , RECFLNK RF
      WHERE CF.CUSTID=LNK.AFACCTNO AND LNK.STATUS='A' AND TYP.REROLE='DG'
      AND RE.ACTYPE=TYP.ACTYPE AND RE.CUSTID=CFRE.CUSTID AND RE.ACCTNO=LNK.REACCTNO
      AND A0.CDTYPE='RE' AND A0.CDNAME='REROLE' AND A0.CDVAL=TYP.REROLE
       AND LNK.refrecflnkid=RF.autoid 
       ) REFT

      ON REFT.ACCTNO=LN.CUSTID AND  LN.TXDATE >=reft.frdate AND LN.TXDATE < reft.todate
      ORDER BY LN.CLEARDT, LN.NGAYUT, LN.CUSTODYCD,LN.CUSTBANK;

EXCEPTION
   WHEN OTHERS
   THEN
   pr_error('CI0015',SQLERRM || '. At row: '|| dbms_utility.format_error_backtrace);
      RETURN;
END;                                                              -- PROCEDURE

 
 
 
 
/