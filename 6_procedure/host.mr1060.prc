SET DEFINE OFF;
CREATE OR REPLACE PROCEDURE mr1060 (
   PV_REFCURSOR   IN OUT   PKG_REPORT.REF_CURSOR,
   pv_OPT         IN       VARCHAR2,
   pv_BRID        IN       VARCHAR2,
   TLGOUPS        IN       VARCHAR2,
   TLSCOPE        IN       VARCHAR2,
  /* F_DATE         IN       VARCHAR2,
   T_DATE         IN       VARCHAR2,*/
   I_DATE         IN       VARCHAR2,
   I_BRID         IN       VARCHAR2
)
IS
--BAO CAO CAC MON VAY CON NO CHUA TRA
--NGOCVTT  01/05/15

-- ---------   ------  -------------------------------------------
   l_STROPTION        VARCHAR2 (5);       -- A: ALL; B: BRANCH; S: SUB-BRANCH
   l_STRBRID          VARCHAR2 (4);

   V_CUDATE        DATE;
   V_INDATE        DATE;
   V_INBRID         VARCHAR2(4);
   V_STRBRID        VARCHAR2 (50);
   V_STROPTION      VARCHAR2(10);
   v_BRID        VARCHAR2(20);
   v_nextdate    DATE;

BEGIN

   V_STROPTION := upper(pv_OPT);
   V_INBRID := pv_BRID;

 -- END OF GETTING REPORT'S PARAMETERS

    if(upper(I_BRID) = 'ALL' or I_BRID is null) then
        v_BRID := '%%';
    else
        v_BRID := UPPER(I_BRID);
    end if ;

  V_INDATE:=TO_DATE(I_DATE,'DD/MM/RRRR');
    SELECT TO_DATE(VARVALUE,'DD/MM/RRRR') INTO V_CUDATE FROM SYSVAR WHERE VARNAME='CURRDATE';

    SELECT getduedate (V_INDATE,'B','001',1  ) INTO v_nextdate  FROM dual ;



   ----
-- GET REPORT'S DATA
IF V_INDATE= V_CUDATE THEN

  OPEN PV_REFCURSOR FOR

  SELECT * FROM ( SELECT getcurrdate NGAY_IN, cf.fullname, br.brname, cf.custodycd, lnm.trfacctno,
       SUM( ROUND(LNS.NML+LNS.OVD+LNS.PAID)) GIAI_NGAN,
       SUM(  ROUND(LNS.NML+LNS.OVD)) PHAI_TRA,SUM(ROUND(LNS.PAID)) PAID,SUM(ROUND(LNS.INTNMLACR+LNS.INTOVD+LNS.INTOVDPRIN+LNS.FEEINTNMLACR+LNS.FEEDUE+LNS.INTDUE
         +LNS.FEEOVD+LNS.FEEINTOVDACR+LNS.FEEINTNMLOVD+LNS.FEEINTDUE+LNS.OVDFEEINT+LNS.FEEINTNML+LNS.FEEINTOVD)) LAI_DUKIEN,0 GTGT
   FROM LNMAST  lnm, (SELECT * FROM CFMAST WHERE FNC_VALIDATE_SCOPE(BRID, CAREBY, TLSCOPE, pv_BRID, TLGOUPS)=0) cf,  afmast af, brgrp br, LNSCHD lns
   WHERE  af.custid=cf.custid
        AND LNM.ACCTNO=LNS.ACCTNO
        AND af.acctno =lnm.trfacctno
        AND br.brid=cf.brid
        and lnm.rlsamt >0
        AND LNM.STATUS<>'Y'
        AND LNM.FTYPE='AF'
        AND LNS.RLSDATE IS NOT NULL
        AND CF.BRID LIKE v_BRID
        group by cf.fullname, br.brname, cf.custodycd, lnm.trfacctno
        )
WHERE PHAI_TRA+LAI_DUKIEN>0
  ;

ELSE
OPEN PV_REFCURSOR FOR
/*
SELECT V_INDATE NGAY_IN, LN.ACCTNO,LN.FULLNAME,LN.BRNAME,LN.CUSTODYCD,LN.TRFACCTNO,
       LN.RLSDATE,LN.OVERDUEDATE,LN.GIAI_NGAN,LN.PHAI_TRA,LN.PAID,LN.LAI_DUKIEN,LN.GTGT
   FROM TBL_MR0060 LN, (SELECT * FROM CFMAST WHERE FNC_VALIDATE_SCOPE(BRID, CAREBY, TLSCOPE, pv_BRID, TLGOUPS)=0)CF
   WHERE CF.BRID LIKE v_BRID
   AND CF.CUSTODYCD=LN.CUSTODYCD
   and fn_get_prevdate(LN.NGAY_IN,1)=V_INDATE
   AND LN.PHAI_TRA+LN.LAI_DUKIEN>0
   ORDER BY LN.RLSDATE,LN.overduedate;*/

/*   SELECT V_INDATE NGAY_IN, LN.ACCTNO,LN.FULLNAME,LN.BRNAME,LN.CUSTODYCD,LN.TRFACCTNO,
       LN.RLSDATE,LN.OVERDUEDATE,LN.GIAI_NGAN,LN.PHAI_TRA,LN.PAID,LN.LAI_DUKIEN,LN.GTGT
   FROM TBL_MR0060 LN, (SELECT * FROM CFMAST WHERE FNC_VALIDATE_SCOPE(BRID, CAREBY, TLSCOPE, pv_BRID, TLGOUPS)=0)CF
   WHERE CF.BRID LIKE v_BRID
   AND CF.CUSTODYCD=LN.CUSTODYCD
   and LN.NGAY_IN= v_nextdate
   AND LN.PHAI_TRA+LN.LAI_DUKIEN>0
   ORDER BY LN.RLSDATE,LN.overduedate;*/

   SELECT V_INDATE NGAY_IN, LN.FULLNAME,LN.BRNAME,LN.CUSTODYCD,LN.TRFACCTNO
       ,SUM(LN.GIAI_NGAN) GIAI_NGAN,SUM(LN.PHAI_TRA) PHAI_TRA, SUM(LN.PAID) PAID ,SUM(LN.LAI_DUKIEN - NVL(GL.amount,0)) LAI_DUKIEN, SUM(LN.GTGT) GTGT
   FROM TBL_MR0060 LN, (SELECT * FROM CFMAST WHERE FNC_VALIDATE_SCOPE(BRID, CAREBY, TLSCOPE, pv_BRID, TLGOUPS)=0)CF,
   ( SELECT CUSTODYCD, SUM (amount) amount, AFACCTNO FROM gljournal WHERE TLTXCD LIKE '5580'  AND SUBSTR(TXNUM,1,1)='9' AND TXDATE = v_nextdate  GROUP BY CUSTODYCD, AFACCTNO) GL
   WHERE CF.BRID LIKE v_BRID
   AND CF.CUSTODYCD=LN.CUSTODYCD
   AND LN.custodycd = GL.AFACCTNO(+)
   and LN.NGAY_IN= v_nextdate
   AND LN.PHAI_TRA+LN.LAI_DUKIEN>0
  GROUP BY  LN.FULLNAME,LN.BRNAME,LN.CUSTODYCD,LN.TRFACCTNO ;




END IF;
/*SELECT * FROM ( SELECT getcurrdate NGAY_IN,LNS.AUTOID ACCTNO, cf.fullname, br.brname, cf.custodycd, lnm.trfacctno,LNS.RLSDATE,lns.overduedate,
ROUND(LNS.NML+LNS.OVD+LNS.PAID) GIAI_NGAN,
 ROUND(LNS.NML+LNS.OVD) PHAI_TRA,ROUND(LNS.PAID) PAID,ROUND(LNS.INTNMLACR+LNS.INTOVD+LNS.INTOVDPRIN+LNS.FEEINTNMLACR+LNS.FEEDUE+LNS.INTDUE
 +LNS.FEEOVD+LNS.FEEINTOVDACR+LNS.FEEINTNMLOVD+LNS.FEEINTDUE+LNS.OVDFEEINT+LNS.FEEINTNML+LNS.FEEINTOVD) LAI_DUKIEN,0 GTGT
   FROM vw_lnmast_all  lnm, cfmast cf,  afmast af, brgrp br, vw_lnschd_all lns
   WHERE  af.custid=cf.custid
        AND LNM.ACCTNO=LNS.ACCTNO
        AND af.acctno =lnm.trfacctno
        AND br.brid=cf.brid
        and lnm.rlsamt >0
        AND LNM.STATUS<>'Y'
        AND LNS.RLSDATE IS NOT NULL
        AND CF.BRID LIKE V_INBRID
        AND CF.BRID LIKE v_BRID)
WHERE PHAI_TRA+LAI_DUKIEN>0
ORDER BY RLSDATE,overduedate*/


 EXCEPTION
   WHEN OTHERS
   THEN
        RETURN;
END;

 
 
 
 
/
