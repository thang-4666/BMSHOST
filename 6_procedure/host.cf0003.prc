SET DEFINE OFF;
CREATE OR REPLACE PROCEDURE "CF0003"
   (
   PV_REFCURSOR   IN OUT   PKG_REPORT.REF_CURSOR,
   OPT            IN       VARCHAR2,
   pv_BRID           IN       VARCHAR2,
   TLGOUPS        IN       VARCHAR2,
   TLSCOPE        IN       VARCHAR2,
   F_DATE         IN       VARCHAR2,
   T_DATE         IN       VARCHAR2,
   PV_TYPE        IN       VARCHAR2,
   PV_VSD        IN       VARCHAR2,
   MAKER          IN       VARCHAR2,
   I_BRIDGD       IN       VARCHAR2,
   I_TABLE     IN       VARCHAR2,
   I_FLDNAME       IN       VARCHAR2,
   PV_AREA        IN       VARCHAR2,
   PV_ACCTYPE     IN       VARCHAR2


   ) IS

--
-- BAO CAO THAY DOI THONG TIN KHACH HANG
-- NGOCVTT 18/06/2015
----------------------------------------------

   V_STROPT         VARCHAR2(5);
   V_STRBRID        VARCHAR2(100);
   V_INBRID         VARCHAR2(5);
   V_TYPE           VARCHAR2(100);
   V_MAKER          VARCHAR2(100);
    V_I_BRID        VARCHAR2(100);
    V_FLDNAME       VARCHAR2(500);

    V_STRAREA       VARCHAR2(100);

    V_STRVSD        VARCHAR2(100);
    V_CUDATE       DATE;

    V_STRTABLE    VARCHAR2(500);
    V_ACCTYPE           VARCHAR2(5);
BEGIN


      V_STROPT := OPT;

   IF (V_STROPT <> 'A') AND (pv_BRID <> 'ALL')
   THEN
      V_STRBRID := pv_BRID;
   ELSE
      V_STRBRID := '%%';
   END IF;



   IF(PV_TYPE <> 'ALL')
   THEN
        V_TYPE  := PV_TYPE;
   ELSE
        V_TYPE  := '%%';
   END IF;

  -- V_TYPE:=PV_TYPE;

   IF(PV_VSD <> 'ALL')
   THEN
        V_STRVSD  := PV_VSD;
   ELSE
        V_STRVSD  := '%%';
   END IF;


      IF(MAKER <> 'ALL')
   THEN
        V_MAKER  := MAKER;
   ELSE
        V_MAKER  := '%%';
   END IF;

         IF(I_BRIDGD <> 'ALL')
   THEN
        V_I_BRID  := I_BRIDGD;
   ELSE
        V_I_BRID  := '%%';
   END IF;

   IF(I_FLDNAME <> 'ALL')
   THEN
        V_FLDNAME  := I_FLDNAME;
   ELSE
        V_FLDNAME  := '%%';
   END IF;

   IF(I_TABLE <> 'ALL')
   THEN
        V_STRTABLE  := I_TABLE;
   ELSE
        V_STRTABLE  := '%%';
   END IF;

      IF(PV_AREA <> 'ALL')
   THEN
        V_STRAREA  := PV_AREA;
   ELSE
        V_STRAREA  := '%%';
   END IF;
    IF(PV_ACCTYPE <> 'ALL')
   THEN
        V_ACCTYPE  := PV_ACCTYPE;
   ELSE
        V_ACCTYPE  := '%%';
   END IF;


   SELECT TO_DATE(VARVALUE,'DD/MM/RRRR') INTO V_CUDATE FROM SYSVAR WHERE VARNAME='CURRDATE';
     ---GET REPORT DATA:

   OPEN PV_REFCURSOR
   FOR
 SELECT * FROM (
--0017
SELECT CF.CUSTID,CF.FULLNAME,CFLOG.TXDATE, CF.CUSTODYCD,CFLOG.TYPE_ORDER,CFLOG.OLD,CFLOG.NEW,'Y' VSD,
       (CASE WHEN SUBSTR(CFLOG.TXNUM,1,2)='68' THEN 'Online' ELSE TLP.TLNAME END) MAKER,
       (CASE WHEN SUBSTR(CFLOG.TXNUM,1,2)='68' THEN 'Online' ELSE TLP1.TLNAME END) CHECKER,
       (CASE WHEN SUBSTR(CFLOG.TXNUM,1,2)='68' THEN 'Y' ELSE 'N' END) MA_TYPE,
       (CASE WHEN CFLOG.CONFIRMTXNUM IS NULL THEN 'N' ELSE 'Y' END) STATUS_VSD
FROM
            (SELECT CUSTID,(CASE WHEN OFULLNAME<>NFULLNAME THEN FLD.CAPTION ELSE '' END) TYPE_ORDER,
                   OFULLNAME OLD, NFULLNAME NEW,TXDATE,TXNUM, CONFIRMTXDATE,CONFIRMTXNUM
            FROM CFVSDLOG, FLDMASTER FLD
            WHERE (CASE WHEN OFULLNAME<>NFULLNAME THEN FLD.CAPTION ELSE '' END) IS NOT NULL
                  AND FLD.OBJNAME='CF.CFMAST'
                  AND FLD.FLDNAME='FULLNAME'
                  AND FLD.FLDNAME LIKE V_FLDNAME
            UNION ALL
            SELECT CUSTID,(CASE WHEN OIDCODE<>NIDCODE THEN FLD.CAPTION ELSE '' END) TYPE_ORDER,
                   OIDCODE OLD, NIDCODE NEW,TXDATE,TXNUM, CONFIRMTXDATE,CONFIRMTXNUM
            FROM CFVSDLOG, FLDMASTER FLD
            WHERE (CASE WHEN OIDCODE<>NIDCODE THEN FLD.CAPTION ELSE '' END) IS NOT NULL
                  AND FLD.OBJNAME='CF.CFMAST'
                  AND FLD.FLDNAME='IDCODE'
                  AND FLD.FLDNAME LIKE V_FLDNAME
            UNION ALL
            SELECT CUSTID,(CASE WHEN OADDRESS<>NADDRESS THEN FLD.CAPTION ELSE '' END) TYPE_ORDER,
                   OADDRESS OLD, NADDRESS NEW,TXDATE,TXNUM, CONFIRMTXDATE,CONFIRMTXNUM
            FROM CFVSDLOG, FLDMASTER FLD
            WHERE (CASE WHEN OADDRESS<>NADDRESS THEN FLD.CAPTION ELSE '' END) IS NOT NULL
                  AND FLD.OBJNAME='CF.CFMAST'
                  AND FLD.FLDNAME='ADDRESS'
                  AND FLD.FLDNAME LIKE V_FLDNAME
            UNION ALL
            SELECT CUSTID,(CASE WHEN OIDDATE<>NIDDATE THEN FLD.CAPTION ELSE '' END) TYPE_ORDER,
                   TO_CHAR(OIDDATE,'DD/MM/YYYY') OLD, TO_CHAR(NIDDATE,'DD/MM/YYYY') NEW,TXDATE,TXNUM, CONFIRMTXDATE,CONFIRMTXNUM
            FROM CFVSDLOG, FLDMASTER FLD
            WHERE (CASE WHEN OIDDATE<>NIDDATE THEN FLD.CAPTION ELSE '' END) IS NOT NULL
                  AND FLD.OBJNAME='CF.CFMAST'
                  AND FLD.FLDNAME='IDDATE'
                  AND FLD.FLDNAME LIKE V_FLDNAME
           /* UNION ALL
            SELECT CUSTID,(CASE WHEN OIDEXPIRED<>NIDEXPIRED THEN FLD.CAPTION ELSE '' END) TYPE_ORDER,
                   TO_CHAR(OIDEXPIRED,'DD/MM/YYYY') OLD, TO_CHAR(NIDEXPIRED,'DD/MM/YYYY') NEW,TXDATE,TXNUM, CONFIRMTXDATE,CONFIRMTXNUM
            FROM CFVSDLOG, FLDMASTER FLD
            WHERE (CASE WHEN OIDEXPIRED<>NIDEXPIRED THEN FLD.CAPTION ELSE '' END) IS NOT NULL
                  AND FLD.OBJNAME='CF.CFMAST'
                  AND FLD.FLDNAME='IDEXPIRED'
                  AND FLD.FLDNAME LIKE V_FLDNAME*/
            UNION ALL
            SELECT CUSTID,(CASE WHEN OIDPLACE<>NIDPLACE THEN FLD.CAPTION ELSE '' END) TYPE_ORDER,
                   OIDPLACE OLD, NIDPLACE NEW,TXDATE,TXNUM, CONFIRMTXDATE,CONFIRMTXNUM
            FROM CFVSDLOG, FLDMASTER FLD
            WHERE (CASE WHEN OIDPLACE<>NIDPLACE THEN FLD.CAPTION ELSE '' END) IS NOT NULL
                  AND FLD.OBJNAME='CF.CFMAST'
                  AND FLD.FLDNAME='IDPLACE'
                  AND FLD.FLDNAME LIKE V_FLDNAME
            UNION ALL
            SELECT CUSTID,(CASE WHEN OCUSTTYPE<>NCUSTTYPE THEN FLD.CAPTION ELSE '' END) TYPE_ORDER,
                   OCUSTTYPE OLD, NCUSTTYPE NEW,TXDATE,TXNUM, CONFIRMTXDATE,CONFIRMTXNUM
            FROM CFVSDLOG, FLDMASTER FLD
            WHERE (CASE WHEN OCUSTTYPE<>NCUSTTYPE THEN FLD.CAPTION ELSE '' END) IS NOT NULL
                  AND FLD.OBJNAME='CF.CFMAST'
                  AND FLD.FLDNAME='CUSTTYPE'
                  AND FLD.FLDNAME LIKE V_FLDNAME
            UNION ALL
            SELECT CUSTID,(CASE WHEN OTRADINGCODE<>NTRADINGCODE THEN FLD.CAPTION ELSE '' END) TYPE_ORDER,
                   TO_CHAR(OTRADINGCODE) OLD, NTRADINGCODE NEW,TXDATE,TXNUM, CONFIRMTXDATE,CONFIRMTXNUM
            FROM CFVSDLOG, FLDMASTER FLD
            WHERE (CASE WHEN OTRADINGCODE<>NTRADINGCODE THEN FLD.CAPTION ELSE '' END) IS NOT NULL
                  AND FLD.OBJNAME='CF.CFMAST'
                  AND FLD.FLDNAME='TRADINGCODE'
                  AND FLD.FLDNAME LIKE V_FLDNAME
            UNION ALL
            SELECT CUSTID,(CASE WHEN OTRADINGCODEDT<>NTRADINGCODEDT THEN FLD.CAPTION ELSE '' END) TYPE_ORDER,
                   TO_CHAR(OTRADINGCODEDT,'DD/MM/YYYY') OLD, TO_CHAR(NTRADINGCODEDT,'DD/MM/YYYY') NEW,TXDATE,TXNUM, CONFIRMTXDATE,CONFIRMTXNUM
            FROM CFVSDLOG, FLDMASTER FLD
            WHERE (CASE WHEN OTRADINGCODEDT<>NTRADINGCODEDT THEN FLD.CAPTION ELSE '' END) IS NOT NULL
                  AND FLD.OBJNAME='CF.CFMAST'
                  AND FLD.FLDNAME='TRADINGCODEDT'
                  AND FLD.FLDNAME LIKE V_FLDNAME
            UNION ALL
            SELECT CUSTID,(CASE WHEN OCOUNTRY<>NCOUNTRY THEN FLD.CAPTION ELSE '' END) TYPE_ORDER,
                   TO_CHAR(OCOUNTRY) OLD, NCOUNTRY NEW,TXDATE,TXNUM, CONFIRMTXDATE,CONFIRMTXNUM
            FROM CFVSDLOG, FLDMASTER FLD
            WHERE (CASE WHEN OCOUNTRY<>NCOUNTRY THEN FLD.CAPTION ELSE '' END) IS NOT NULL
                  AND FLD.OBJNAME='CF.CFMAST'
                  AND FLD.FLDNAME='COUNTRY'
                  AND FLD.FLDNAME LIKE V_FLDNAME
                  )  CFLOG,

 (SELECT * FROM CFMAST WHERE FNC_VALIDATE_SCOPE(BRID, CAREBY, TLSCOPE, pv_BRID, TLGOUPS)=0) CF,
 VW_TLLOG_ALL TL, TLPROFILES TLP,TLPROFILES TLP1,
 (SELECT *FROM CFMASTTEMP WHERE STATUS='A' UNION ALL SELECT * FROM CFMASTTEMP_HIST WHERE STATUS='A') TEMP

WHERE CFLOG.CUSTID=CF.CUSTID
    AND CF.IDCODE=TEMP.IDCODE(+)
    AND CFLOG.TXDATE=TL.TXDATE
    AND (CASE WHEN CF.OPNDATE=CFLOG.TXDATE AND TEMP.IDCODE IS NOT NULL THEN 'Y' ELSE 'N' end) LIKE V_STRAREA
    AND CFLOG.TXNUM=TL.TXNUM
    AND TL.TLID=TLP.TLID(+)
    AND 'CFMAST' LIKE V_STRTABLE
    AND CF.BRID LIKE V_I_BRID
    AND CF.CUSTTYPE LIKE V_ACCTYPE
    AND NVL(TL.OFFID,'000')=TLP1.TLID(+)
--MAINTAINLOG
 UNION ALL
 SELECT CF.CUSTID,CF.FULLNAME,MA.MAKER_DT TXDATE,CF.CUSTODYCD,(CASE WHEN MA.COLUMN_NAME ='MOBILE' THEN 'Số Mobile 2'
WHEN MA.COLUMN_NAME ='MOBILESMS' THEN 'Số Mobile 1'  ELSE FLD.CAPTION END)TYPE_ORDER, NVL(MA.FROM_VALUE,'') OLD,
        NVL(MA.TO_VALUE,'') NEW,'N' VSD,
       (CASE WHEN SUBSTR(MA.MAKER_ID,1,2)='68' THEN 'Online' ELSE TLP.TLNAME END) MAKER,
       (CASE WHEN SUBSTR(MA.MAKER_ID,1,2)='68' THEN 'Online' ELSE TLP1.TLNAME END) CHECKER,
       (CASE WHEN SUBSTR(MA.MAKER_ID,1,2)='68' THEN 'Y' ELSE 'N' END) MA_TYPE,
       'Z' STATUS_VSD
FROM MAINTAIN_LOG MA, (SELECT * FROM CFMAST WHERE FNC_VALIDATE_SCOPE(BRID, CAREBY, TLSCOPE, pv_BRID, TLGOUPS)=0)  CF,
        TLPROFILES TLP, TLPROFILES TLP1,FLDMASTER FLD,
        (SELECT *FROM CFMASTTEMP WHERE STATUS='A' UNION ALL SELECT * FROM CFMASTTEMP_HIST WHERE STATUS='A') TEMP
WHERE MA.TABLE_NAME='CFMAST'
        AND MA.ACTION_FLAG='EDIT'
        AND CF.IDCODE=TEMP.IDCODE(+)
        AND (CASE WHEN CF.OPNDATE=MA.MAKER_DT AND TEMP.IDCODE IS NOT NULL THEN 'Y'
        WHEN CF.OPNDATE=MA.MAKER_DT AND TEMP.IDCODE IS NULL AND MA.ACTION_FLAG='ADD' THEN 'Z'
         ELSE 'N' end) LIKE V_STRAREA
        AND SUBSTR(MA.RECORD_KEY,11,10)=CF.CUSTID
        AND CF.CUSTODYCD IS NOT NULL
        AND (INSTR(CF.PSTATUS,'A')<>0 OR CF.STATUS='A')
        AND MA.COLUMN_NAME NOT IN ('CAREBY','ACTYPE','ISUSEOADVRES')
        AND NVL(MA.APPROVE_DT, MA.MAKER_DT)>=CF.OPNDATE
        AND 'CFMAST' LIKE V_STRTABLE
        AND MA.CHILD_TABLE_NAME IS NULL
        AND   (MA.APPROVE_ID IS  NULL OR MA.APPROVE_DT IS NOT NULL)
        AND CF.BRID LIKE V_I_BRID
        AND NVL(MA.MAKER_ID,'000')=TLP.TLID(+)
        AND NVL(MA.APPROVE_ID,'000')=TLP1.TLID(+)
        AND FLD.OBJNAME  IN ('CF.CFMAST')
        AND FLD.FLDNAME LIKE V_FLDNAME
         AND CF.CUSTTYPE LIKE V_ACCTYPE
      --  AND MA.FROM_VALUE <> MA.TO_VALUE
        AND FLD.FLDNAME=MA.COLUMN_NAME

UNION ALL

/*SELECT CF.CUSTID,CF.FULLNAME,MA.MAKER_DT TXDATE,CF.CUSTODYCD, 'Số TK ngân hàng chuyển tiền trực tuyến' TYPE_ORDER, NVL(MA.FROM_VALUE,'') OLD,
        NVL(MA.TO_VALUE,'') NEW,'N' VSD,
       (CASE WHEN SUBSTR(MA.MAKER_ID,1,2)='68' THEN 'Online' ELSE TLP.TLNAME END) MAKER,
       (CASE WHEN SUBSTR(MA.MAKER_ID,1,2)='68' THEN 'Online' ELSE TLP1.TLNAME END) CHECKER,
       (CASE WHEN SUBSTR(MA.MAKER_ID,1,2)='68' THEN 'Y' ELSE 'N' END) MA_TYPE,
       'N' STATUS_VSD
FROM MAINTAIN_LOG MA, (SELECT * FROM CFMAST WHERE FNC_VALIDATE_SCOPE(BRID, CAREBY, TLSCOPE, pv_BRID, TLGOUPS)=0)  CF,
        TLPROFILES TLP, TLPROFILES TLP1
WHERE MA.TABLE_NAME='CFMAST'
        AND MA.ACTION_FLAG='EDIT'
        AND SUBSTR(MA.RECORD_KEY,11,10)=CF.CUSTID
        AND CF.CUSTODYCD IS NOT NULL
        AND (INSTR(CF.PSTATUS,'A')<>0 OR CF.STATUS='A')
        AND NVL(MA.APPROVE_DT, V_CUDATE)>=CF.OPNDATE
        AND   (MA.APPROVE_ID IS  NULL OR MA.APPROVE_DT IS NOT NULL)
        AND CF.BRID LIKE V_I_BRID
        AND NVL(MA.MAKER_ID,'000')=TLP.TLID(+)
        AND NVL(MA.APPROVE_ID,'000')=TLP1.TLID(+)
        AND MA.COLUMN_NAME LIKE V_FLDNAME
        AND MA.COLUMN_NAME='BANKACC'*/
        SELECT CF.CUSTID,CF.FULLNAME,MA.MAKER_DT TXDATE,CF.CUSTODYCD,
(CASE WHEN MA.COLUMN_NAME ='BANKACC' THEN 'Số TK ngân hàng chuyển tiền trực tuyến'  ELSE FLD.CAPTION END)TYPE_ORDER,
 NVL(MA.FROM_VALUE,'') OLD,NVL(MA.TO_VALUE,'') NEW,'N' VSD,
       (CASE WHEN SUBSTR(MA.MAKER_ID,1,2)='68' THEN 'Online' ELSE TLP.TLNAME END) MAKER,
       (CASE WHEN SUBSTR(MA.MAKER_ID,1,2)='68' THEN 'Online' ELSE TLP1.TLNAME END) CHECKER,
       (CASE WHEN SUBSTR(MA.MAKER_ID,1,2)='68' THEN 'Y' ELSE 'N' END) MA_TYPE,
       'Z' STATUS_VSD
FROM MAINTAIN_LOG MA, (SELECT * FROM CFMAST WHERE FNC_VALIDATE_SCOPE(BRID, CAREBY, TLSCOPE, pv_BRID, TLGOUPS)=0)  CF,
        TLPROFILES TLP, TLPROFILES TLP1,FLDMASTER FLD,
         (SELECT *FROM CFMASTTEMP WHERE STATUS='A' UNION ALL SELECT * FROM CFMASTTEMP_HIST WHERE STATUS='A') TEMP
WHERE MA.TABLE_NAME='CFMAST'
     --  AND MA.ACTION_FLAG='EDIT'
        AND CF.IDCODE=TEMP.IDCODE(+)
        AND (CASE WHEN CF.OPNDATE=MA.MAKER_DT AND TEMP.IDCODE IS NOT NULL THEN 'Y'
        WHEN CF.OPNDATE=MA.MAKER_DT AND TEMP.IDCODE IS NULL AND MA.ACTION_FLAG='ADD' THEN 'Z'
         ELSE 'N' end) LIKE V_STRAREA
        AND SUBSTR(MA.RECORD_KEY,11,10)=CF.CUSTID
        AND CF.CUSTODYCD IS NOT NULL
        AND (INSTR(CF.PSTATUS,'A')<>0 OR CF.STATUS='A')
        AND NVL(MA.APPROVE_DT, MA.MAKER_DT)>=CF.OPNDATE
        AND   (MA.APPROVE_ID IS  NULL OR MA.APPROVE_DT IS NOT NULL)
        and ma.child_table_name in ('CFAUTH','OTRIGHT','CFRELATION','CFCONTACT','AFMAST')
        AND MA.COLUMN_NAME NOT IN ('CAREBY','ACTYPE','ISUSEOADVRES')
        AND ma.child_table_name LIKE V_STRTABLE
        AND FLD.OBJNAME='CF.'||ma.child_table_name AND FLD.FLDNAME=MA.COLUMN_NAME
        AND CF.BRID LIKE V_I_BRID
        AND NVL(MA.MAKER_ID,'000')=TLP.TLID(+)
        AND NVL(MA.APPROVE_ID,'000')=TLP1.TLID(+)
        AND MA.COLUMN_NAME LIKE V_FLDNAME
         AND CF.CUSTTYPE LIKE V_ACCTYPE
UNION ALL
       SELECT CF.CUSTID,CF.FULLNAME,MA.MAKER_DT TXDATE,CF.CUSTODYCD,
        (CASE WHEN MA.COLUMN_NAME ='BANKACC' THEN 'Số TK ngân hàng chuyển tiền trực tuyến'  ELSE FLD.CAPTION END)TYPE_ORDER,
         NVL(MA.FROM_VALUE,'') OLD,NVL(MA.TO_VALUE,'') NEW,'N' VSD,
       (CASE WHEN SUBSTR(MA.MAKER_ID,1,2)='68' THEN 'Online' ELSE TLP.TLNAME END) MAKER,
       (CASE WHEN SUBSTR(MA.MAKER_ID,1,2)='68' THEN 'Online' ELSE TLP1.TLNAME END) CHECKER,
       (CASE WHEN SUBSTR(MA.MAKER_ID,1,2)='68' THEN 'Y' ELSE 'N' END) MA_TYPE,
       'Z' STATUS_VSD
FROM MAINTAIN_LOG MA, (SELECT * FROM CFMAST WHERE FNC_VALIDATE_SCOPE(BRID, CAREBY, TLSCOPE, pv_BRID, TLGOUPS)=0)  CF,
        TLPROFILES TLP, TLPROFILES TLP1,FLDMASTER FLD,
         (SELECT *FROM CFMASTTEMP WHERE STATUS='A' UNION ALL SELECT * FROM CFMASTTEMP_HIST WHERE STATUS='A') TEMP
WHERE MA.TABLE_NAME='CFMAST'
     --  AND MA.ACTION_FLAG='EDIT'
        AND CF.IDCODE=TEMP.IDCODE(+)
        AND (CASE WHEN CF.OPNDATE=MA.MAKER_DT AND TEMP.IDCODE IS NOT NULL THEN 'Y'
        WHEN CF.OPNDATE=MA.MAKER_DT AND TEMP.IDCODE IS NULL AND MA.ACTION_FLAG='ADD' THEN 'Z'
         ELSE 'N' end) LIKE V_STRAREA
        AND SUBSTR(MA.RECORD_KEY,11,10)=CF.CUSTID
        AND CF.CUSTODYCD IS NOT NULL
        AND (INSTR(CF.PSTATUS,'A')<>0 OR CF.STATUS='A')
        AND NVL(MA.APPROVE_DT, MA.MAKER_DT)>=CF.OPNDATE
        AND   (MA.APPROVE_ID IS  NULL OR MA.APPROVE_DT IS NOT NULL)
        and ma.child_table_name in ('AFTEMPLATES','CFOTHERACC','ISSUER_MEMBER')
        AND MA.COLUMN_NAME NOT IN ('CAREBY','ACTYPE','ISUSEOADVRES')
         AND ma.child_table_name LIKE V_STRTABLE
        AND FLD.OBJNAME='SA.'||ma.child_table_name AND FLD.FLDNAME=MA.COLUMN_NAME
        AND CF.BRID LIKE V_I_BRID
        AND NVL(MA.MAKER_ID,'000')=TLP.TLID(+)
        AND NVL(MA.APPROVE_ID,'000')=TLP1.TLID(+)
        AND MA.COLUMN_NAME LIKE V_FLDNAME
         AND CF.CUSTTYPE LIKE V_ACCTYPE
 )
 WHERE TXDATE BETWEEN TO_DATE(F_DATE,'DD/MM/YYYY') AND TO_DATE(T_DATE,'DD/MM/YYYY')
       AND MA_TYPE LIKE V_MAKER
       AND VSD LIKE V_TYPE
       and STATUS_VSD LIKE V_STRVSD
 ORDER BY CUSTODYCD,TXDATE,TYPE_ORDER
    ;


EXCEPTION
    WHEN OTHERS THEN
        RETURN ;
END; -- Procedure
 
 
 
 
/