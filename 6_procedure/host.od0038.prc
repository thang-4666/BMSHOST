SET DEFINE OFF;
CREATE OR REPLACE PROCEDURE "OD0038" (
   PV_REFCURSOR   IN OUT   PKG_REPORT.REF_CURSOR,
   OPT            IN       VARCHAR2,
   pv_BRID           IN       VARCHAR2,
   TLGOUPS        IN       VARCHAR2,
   TLSCOPE        IN       VARCHAR2,
   I_DATE         IN       VARCHAR2,
   PV_CUSTODYCD      IN       VARCHAR2,
   KHOP        IN      VARCHAR2,
   LOAI       IN       VARCHAR2

 )
IS

-- ---------   ------  -------------------------------------------
   V_STROPTION        VARCHAR2 (5);       -- A: ALL; B: BRANCH; S: SUB-BRANCH
   V_STRBRID          VARCHAR2 (40);        -- USED WHEN V_NUMOPTION > 0
   V_INBRID           VARCHAR2 (4);

   V_STRCUSTODYCD           VARCHAR2 (20);
   V_STRKHOP              VARCHAR2(20);
   V_STRLOAI             VARCHAR2 (6);


BEGIN
   V_STROPTION := upper(OPT);
   V_INBRID := pv_BRID;
   IF (V_STROPTION = 'A') THEN
      V_STRBRID := '%';
   ELSE if (V_STROPTION = 'B') then
            select brgrp.BRID into V_STRBRID from brgrp where brgrp.brid = V_INBRID;
        else
            V_STRBRID := V_INBRID;
        end if;
   END IF;

   V_STRCUSTODYCD:=UPPER(PV_CUSTODYCD);
   V_STRKHOP :=UPPER(KHOP);
   V_STRLOAI :=UPPER(LOAI);
OPEN PV_REFCURSOR
  FOR
SELECT * FROM (
       SELECT CF.CUSTODYCD, CF.FULLNAME, CF.IDCODE,SB.SYMBOL,OD.ORDERID,OD.TXDATE, OD.TXTIME,OD.EXECTYPE,
              OD.PRICETYPE, (CASE WHEN OD.MATCHTYPE='N' THEN 'N' ELSE 'P' END) MATCHTYPE,OD.ORSTATUS, OD.QUOTEPRICE, OD.ORDERQTTY,OD.LIMITPRICE,TL.TLNAME MAKER,
               OD.FEEACR,/*NVL(IO.MATCHPRICE,0)*/ 0 MATCHPRICE, /*NVL(IO.MATCHQTTY,0)*/0 MATCHQTTY,/*NVL(IO.ORGORDERID,'')*/ NULL ORGORDERID,
               MR.MRTYPE KHOP
       FROM VW_ODMAST_ALL OD, (SELECT * FROM CFMAST WHERE FNC_VALIDATE_SCOPE(BRID, CAREBY, TLSCOPE, pv_BRID, TLGOUPS)=0)
        CF, AFMAST AF, SBSECURITIES SB, /*VW_IOD_ALL IO,*/TLPROFILES TL, AFTYPE AFT, MRTYPE MR,CONFIRMODRSTS CON
       WHERE OD.AFACCTNO=AF.ACCTNO
             AND CF.CUSTID=AF.CUSTID
             --AND OD.VIA IN ('F','T')
             AND OD.CODEID=SB.CODEID
             AND OD.EXECTYPE IN ('NB','BC')
              AND OD.ORDERID=CON.ORDERID(+)
             AND NVL(CON.CONFIRMED,'N')='N'
           --  AND OD.ORDERID=IO.ORGORDERID(+)
             AND OD.TLID=TL.TLID(+)
             AND CF.CUSTTYPE='B'
             AND OD.DELTD<>'Y'
             AND AF.ACTYPE=AFT.ACTYPE
             AND AFT.MRTYPE=MR.ACTYPE
             AND OD.MATCHTYPE LIKE V_STRLOAI
             AND CF.CUSTODYCD LIKE V_STRCUSTODYCD
             AND OD.TXDATE=TO_DATE(I_DATE,'DD/MM/YYYY')
) WHERE  KHOP LIKE V_STRKHOP

ORDER BY TXTIME
;



EXCEPTION
   WHEN OTHERS
   THEN

      RETURN;
End;

 
 
 
 
/
