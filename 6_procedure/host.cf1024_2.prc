SET DEFINE OFF;
CREATE OR REPLACE PROCEDURE "CF1024_2"
   (
   PV_REFCURSOR   IN OUT   PKG_REPORT.REF_CURSOR,
   OPT            IN       VARCHAR2,
   pv_BRID        IN       VARCHAR2,
   TLGOUPS        IN       VARCHAR2,
   TLSCOPE        IN       VARCHAR2,
   F_DATE         IN       VARCHAR2,
   T_DATE         IN       VARCHAR2,
   PV_CUSTODYCD   IN       VARCHAR2

   ) IS


   V_STROPT         VARCHAR2(5);
   V_STRBRID        VARCHAR2(100);
   V_STRCUSTODYCD    VARCHAR(50);


BEGIN

      V_STROPT := OPT;

   IF (V_STROPT <> 'A') AND (pv_BRID <> 'ALL')
   THEN
      V_STRBRID := pv_BRID;
   ELSE
      V_STRBRID := '%%';
   END IF;

   IF (PV_CUSTODYCD <> 'ALL')
   THEN
      V_STRCUSTODYCD := PV_CUSTODYCD;
   ELSE
      V_STRCUSTODYCD := '%%';
   END IF;

--V_STRCUSTODYCD:= UPPER(PV_CUSTODYCD);
     ---GET REPORT DATA:

OPEN PV_REFCURSOR
FOR

        SELECT TL.TXDATE,NVL(TL.TXTIME,TL.CHKTIME) TXTIME,  TL.MSGACCT,CF.CUSTODYCD,
        TLP.TLNAME,(CASE WHEN SUBSTR(TL.TXNUM,1,2) in ('99','68') THEN 'ONLINE' ELSE 'FLEX' END) VIA,
        TL.TLTXCD||':'||TL.TXDESC TXDESC
        FROM VW_TLLOG_ALL TL, (SELECT * FROM CFMAST WHERE FNC_VALIDATE_SCOPE(BRID, CAREBY, TLSCOPE, pv_BRID, TLGOUPS)=0) CF, TLPROFILES TLP
        WHERE TLTXCD='0090'  AND TL.TXSTATUS IN ('1','7')
              AND TL.MSGACCT=CF.CUSTID
              AND NVL(TL.TLID,'000')=TLP.TLID(+)
              AND CF.CUSTODYCD LIKE V_STRCUSTODYCD
              AND TL.TXDATE BETWEEN TO_DATE(F_DATE,'DD/MM/YYYY') AND TO_DATE(T_DATE,'DD/MM/YYYY')
             -- and substr(tl.txnum,1,2)='00'


        UNION ALL

        SELECT TO_DATE(PA.TXDATE,'DD/MM/YYYY') TXDATE,to_char(PA.TXDATE,'hh24:mm:ss')  TXTIME, CF.CUSTID MSGACCT,CF.CUSTODYCD,
        'USERONLINE'  TLNAME,PA.MKID VIA,
        (CASE WHEN PA.TXDESC='LOGINPWD' THEN 'THAY DOI MAT KHAU DANG NHAP'
        WHEN PA.TXDESC='TRADINGPWD' THEN 'THAY DOI MAT KHAU DAT LENH'
        ELSE 'RESET MAT KHAU' END) TXDESC
        FROM PASS_CUSTOMER_LOG PA,(SELECT * FROM CFMAST WHERE FNC_VALIDATE_SCOPE(BRID, CAREBY, TLSCOPE, pv_BRID, TLGOUPS)=0) CF
        WHERE PA.USERNAME=CF.CUSTODYCD
        AND CF.CUSTODYCD LIKE V_STRCUSTODYCD
        AND TO_DATE(PA.TXDATE,'DD/MM/YYYY') BETWEEN TO_DATE(F_DATE,'DD/MM/YYYY') AND TO_DATE(T_DATE,'DD/MM/YYYY')
         ORDER BY TXDATE,CUSTODYCD, TXTIME
        ;


EXCEPTION
    WHEN OTHERS THEN
        RETURN ;
END; -- Procedure

 
 
 
 
/
