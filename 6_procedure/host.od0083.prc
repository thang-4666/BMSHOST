SET DEFINE OFF;
CREATE OR REPLACE PROCEDURE od0083 (
   PV_REFCURSOR   IN OUT   PKG_REPORT.REF_CURSOR,
   OPT            IN       VARCHAR2,
   pv_BRID           IN       VARCHAR2 ,
   TLGOUPS        IN       VARCHAR2,
   TLSCOPE        IN       VARCHAR2,
   F_DATE         IN       VARCHAR2,
   T_DATE         IN       VARCHAR2,
   PV_CUSTODYCD   IN       VARCHAR2
)
IS

   V_STROPTION          VARCHAR2 (5);
   V_STRBRID            VARCHAR2 (4);
   v_strcustodycd       VARCHAR2 (20);

   V_F_date             date;
   V_T_date             date;
   V_CRRDATE            date;

BEGIN


    V_F_date := TO_DATE(F_date,'dd/mm/rrrr');
    V_T_date := TO_DATE(T_date,'dd/mm/rrrr');
    V_STROPTION := OPT;

   IF (V_STROPTION <> 'A') AND (pv_BRID <> 'ALL')
   THEN
      V_STRBRID := pv_BRID;
   ELSE
      V_STRBRID := '%%';
   END IF;

   IF (PV_CUSTODYCD = 'ALL') OR (PV_CUSTODYCD is null)
   THEN
      v_strcustodycd := '%';
   ELSE
      v_strcustodycd := upper(PV_CUSTODYCD);
   END IF;

   select to_date(varvalue,'dd/mm/rrrr') into V_CRRDATE  from sysvar where varname = 'CURRDATE';

-- GET REPORT'S DATA
OPEN PV_REFCURSOR FOR

SELECT SWA.TXDATE, SWA.TXNUM, CF.FULLNAME, CF.CUSTODYCD, SWA.AFACCTNO, SWA.AFACCTNOCR,
    SB.SYMBOL, SWA.ORDERQTTY, SWA.ORDERID, SWA.ODTXDATE , TL.TLID, TL.OFFID,
    TLP.TLNAME MAKER, TLP2.TLNAME APPROVENAME
FROM SWAPODMASTLOG SWA, (SELECT * FROM CFMAST WHERE FNC_VALIDATE_SCOPE(BRID, CAREBY, TLSCOPE, pv_BRID, TLGOUPS)=0) CF,
    AFMAST AF, SBSECURITIES SB, VW_TLLOG_ALL TL, TLPROFILES TLP, TLPROFILES TLP2
WHERE SWA.AFACCTNO = AF.ACCTNO AND CF.CUSTID = AF.CUSTID
    AND SWA.CODEID = SB.CODEID AND SWA.TXDATE = TL.TXDATE
    AND SWA.TXNUM = TL.TXNUM AND TL.TLTXCD = '8830'
    AND TL.TLID = TLP.TLID AND NVL(TL.OFFID,TL.TLID) = TLP2.TLID(+)
    AND SWA.TXDATE >= V_F_DATE AND SWA.TXDATE <= V_T_DATE
    AND TL.TXDATE >= V_F_DATE AND TL.TXDATE <= V_T_DATE
    AND CF.CUSTODYCD LIKE V_STRCUSTODYCD
;
EXCEPTION
   WHEN OTHERS
   THEN
      RETURN;
END;

 
 
 
 
/
