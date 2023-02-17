SET DEFINE OFF;
CREATE OR REPLACE PROCEDURE "CI00241" (
   PV_REFCURSOR   IN OUT   PKG_REPORT.REF_CURSOR,
   OPT            IN       VARCHAR2,
   pv_BRID        IN       VARCHAR2,
   TLGOUPS        IN       VARCHAR2,
   TLSCOPE        IN       VARCHAR2,
   I_DATE         IN       VARCHAR2,
   PV_CUSTODYCD    IN       VARCHAR2,
   I_BRID         IN       VARCHAR2,
   PV_ADTYPE       IN       VARCHAR2
 )
IS

--
-- PURPOSE: BRIEFLY EXPLAIN THE FUNCTIONALITY OF THE PROCEDURE
-- HOP DONG UNG TRUOC TIEN BAN
-- MODIFICATION HISTORY
-- PERSON      DATE    COMMENTS
-- NGOCVTT  09-MAY-15  CREATED
-- ---------   ------  -------------------------------------------
   V_STROPT     VARCHAR2 (5);            -- A: ALL; B: BRANCH; S: SUB-BRANCH
   V_STRBRID    VARCHAR2 (40);                   -- USED WHEN V_NUMOPTION > 0
   V_INBRID     VARCHAR2 (5);


   V_STRCUSTODYCD  VARCHAR2 (20);

   V_STRISBRID      VARCHAR2 (5);
   V_INDATE         DATE;
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
/*-----------------
    IF (UPPER(PV_CUSTODYCD) = 'ALL' OR PV_CUSTODYCD IS NULL)
    THEN
      V_STRCUSTODYCD := '%%';
    ELSE
      V_STRCUSTODYCD := PV_CUSTODYCD;
    END IF;
*/
V_STRCUSTODYCD := PV_CUSTODYCD;
  --------------------------
     V_ADTYPE := PV_ADTYPE;


   V_INDATE   := TO_DATE(I_DATE,'DD/MM/RRRR');

   SELECT BANKRATE, BANKID, CF.SHORTNAME,CF.FULLNAME INTO V_STRBANKRATE, V_STRBANKID, V_BANKSHORT, V_BANKNAME
   FROM CFLIMIT CFL, CFMAST CF WHERE CFL.LMSUBTYPE='ADV' AND CF.CUSTID=CFL.BANKID AND CFL.BANKID=V_ADTYPE;
   -- GET REPORT'S DATA

    OPEN  PV_REFCURSOR FOR

               SELECT CF.CUSTODYCD,OD.TXDATE, REPLACE(SB.SYMBOL,'_WFT') SYMBOL,OD.ORDERID,ST.CLEARDATE NUM_DATE,
                      (CASE WHEN OD.EXECAMT >0 AND OD.FEEACR =0 AND OD.STSSTATUS = 'N' and OD.TXDATE=getcurrdate THEN ST.AMT-ROUND(OD.EXECAMT * ODT.DEFFEERATE/100)
                      WHEN OD.EXECAMT >0 AND OD.FEEACR =0 AND  OD.TXDATE <> getcurrdate THEN ST.AMT  ELSE ST.AMT-OD.FEEACR END) AMT
               FROM (SELECT * FROM STSCHDHIST WHERE DUETYPE='RM' /*AND AAMT<=0*/ 
                     UNION ALL SELECT * FROM STSCHD WHERE DUETYPE='RM'/* AND AAMT<=0*/) ST,
                      VW_ODMAST_ALL OD, SBSECURITIES SB, (SELECT * FROM CFMAST WHERE FNC_VALIDATE_SCOPE(BRID, CAREBY, TLSCOPE, pv_BRID, TLGOUPS)=0) CF, AFMAST AF,ODTYPE ODT
               WHERE ST.ORGORDERID=OD.ORDERID
                    AND OD.EXECTYPE IN ('NS','MS','SS')
                    AND OD.CODEID=SB.CODEID
                    AND CF.CUSTID=AF.CUSTID
                    AND OD.AFACCTNO=AF.ACCTNO
                    AND ODT.ACTYPE = OD.ACTYPE
                    AND CF.CUSTODYCD LIKE V_STRCUSTODYCD
                    AND CF.BRID LIKE V_STRISBRID
                    AND OD.TXDATE<= V_INDATE
                    AND ST.CLEARDATE> V_INDATE


        ORDER BY OD.TXDATE,CF.CUSTODYCD;

EXCEPTION
   WHEN OTHERS
   THEN
      RETURN;
END;                                                              -- PROCEDURE
 
 
 
 
/