SET DEFINE OFF;
CREATE OR REPLACE PROCEDURE "CI0001_OLD" (
   PV_REFCURSOR   IN OUT   PKG_REPORT.REF_CURSOR,
   OPT            IN       VARCHAR2,
   BRID           IN       VARCHAR2,
   TLGOUPS        IN       VARCHAR2,
   TLSCOPE        IN       VARCHAR2,
   F_DATE         IN       VARCHAR2,
   T_DATE         IN       VARCHAR2,
   CCYCD          IN       VARCHAR2,
   OVDTYPE        IN       VARCHAR2,
   AFTYPE         IN       VARCHAR2,
   TYPELG         IN       VARCHAR2,
   STATUS         IN       VARCHAR2,
  ONL            VARCHAR2 DEFAULT NULL

       )
IS
--
-- PURPOSE: BRIEFLY EXPLAIN THE FUNCTIONALITY OF THE PROCEDURE
-- BAO CAO TAI KHOAN TIEN TONG HOP CUA NGUOI DAU TU
-- MODIFICATION HISTORY
-- PERSON      DATE    COMMENTS
-- NAMNT   20-DEC-06  CREATED
-- ---------   ------  -------------------------------------------

   V_STROPTION    VARCHAR2 (5);            -- A: ALL; B: BRANCH; S: SUB-BRANCH
   V_STRBRID      VARCHAR2 (4);            -- USED WHEN V_NUMOPTION > 0
   V_STRAFACCTNO  VARCHAR2 (20);
   V_STRCCYCD     VARCHAR2(20);
   V_STRAFTYPE    VARCHAR2(10);
   V_STRTYPELG    VARCHAR2(10);
   V_STRSTATUS    VARCHAR2(10);

   CUR            PKG_REPORT.REF_CURSOR;
   V_DATE         DATE;
   V_D_CUR        DATE;
   V_NUMCTT       NUMBER (20, 2);
   V_NUMTD       NUMBER (20, 2);
    V_ONL       VARCHAR2(20);
BEGIN
   V_STROPTION := OPT;

   IF (V_STROPTION <> 'A') AND (BRID <> 'ALL')
   THEN
      V_STRBRID := BRID;
   ELSE
      V_STRBRID := '%%';
   END IF;

   -- GET REPORT'S PARAMETERS
   IF  (CCYCD <> 'ALL')
   THEN
      V_STRCCYCD := CCYCD;
   ELSE
      V_STRCCYCD := '%%';
   END IF;

   IF  (AFTYPE <> 'ALL')
   THEN
      V_STRAFTYPE := AFTYPE;
   ELSE
      V_STRAFTYPE := '%%';
   END IF;

   IF  (TYPELG <> 'ALL')
   THEN
      V_STRTYPELG := TYPELG;
    ELSE
      V_STRTYPELG := '%%';
    END IF;

   IF  (STATUS <> 'ALL')
   THEN
      V_STRSTATUS := STATUS;
   ELSE
      V_STRSTATUS := '%%';
   END IF;


  IF  (ONL = 'ALL'or ONL is null )
   THEN
        V_ONL := '%%';
   ELSE
        V_ONL := ONL;
   END IF;

OPEN    CUR
FOR
SELECT TO_DATE(VARVALUE,'DD/MM/YYYY') FROM SYSVAR  WHERE VARNAME='CURRDATE';

LOOP
  FETCH    CUR
  INTO V_D_CUR ;
  EXIT WHEN    CUR%NOTFOUND;
END LOOP;
CLOSE    CUR;

--NGAY TINH TIEN CHO NHAN VE

IF  TO_DATE(T_DATE,'DD/MM/YYYY') < V_D_CUR THEN

OPEN    CUR
FOR
SELECT A.SBDATE
FROM
(SELECT ROWNUM DAY,SBDATE
    FROM
    (   SELECT  SBDATE FROM SBCLDR
        WHERE CLDRTYPE='001' AND HOLIDAY='N' AND
        SBDATE < TO_DATE(T_DATE  ,'DD/MM/YYYY')
        ORDER BY SBDATE  DESC
    )SBCLDR
)A
WHERE A.DAY = 3;

LOOP
  FETCH    CUR
  INTO V_DATE ;
  EXIT WHEN    CUR%NOTFOUND;
END LOOP;
CLOSE    CUR;


OPEN    CUR
    FOR

SELECT NVL(SUM(STS.AMT),0) STS FROM
(
SELECT ACCTNO,AMT FROM STSCHD
WHERE DUETYPE ='SM' AND  TXDATE < =TO_DATE (T_DATE ,'DD/MM/YYYY')
AND TXDATE > V_DATE
and deltd <>'Y'
UNION ALL
SELECT ACCTNO,AMT FROM STSCHDHIST
WHERE DUETYPE ='SM'  AND TXDATE <= TO_DATE (T_DATE ,'DD/MM/YYYY')
AND TXDATE >  V_DATE
and deltd <>'Y'
)STS,
(SELECT af.acctno  FROM afmast af, cfmast cf
 WHERE af.custid = cf.custid
 AND substr(cf.custodycd, 4, 1) <> 'P'
AND SUBSTR(AF.ACCTNO,1,4) LIKE V_STRBRID
AND AF.aftype LIKE V_STRAFTYPE
AND  NVL( SUBSTR(CF.CUSTODYCD,4,1) ,'O')  LIKE V_STRTYPELG
AND AF.STATUS LIKE V_STRSTATUS

) AF
WHERE STS.ACCTNO = AF.ACCTNO

    ;




ELSE

OPEN    CUR
FOR
SELECT A.SBDATE
FROM
(  SELECT ROWNUM DAY,SBDATE
    FROM
    (   SELECT  SBDATE FROM SBCLDR
        WHERE CLDRTYPE='001' AND HOLIDAY='N' AND
        SBDATE < TO_DATE(T_DATE  ,'DD/MM/YYYY')
        ORDER BY SBDATE  DESC
    )SBCLDR
)A
WHERE A.DAY = 4;


LOOP
  FETCH    CUR
  INTO V_DATE ;
  EXIT WHEN    CUR%NOTFOUND;
END LOOP;
CLOSE    CUR;


OPEN    CUR
    FOR

SELECT NVL(SUM(STS.AMT),0) STS FROM
(
SELECT ACCTNO,AMT FROM STSCHD
WHERE DUETYPE ='SM' AND  TXDATE < TO_DATE (T_DATE ,'DD/MM/YYYY')
AND TXDATE > V_DATE
and deltd <>'Y'
UNION ALL
SELECT ACCTNO,AMT FROM STSCHDHIST
WHERE DUETYPE ='SM'  AND TXDATE < TO_DATE (T_DATE ,'DD/MM/YYYY')
AND TXDATE >  V_DATE
and deltd <>'Y'
)STS,
(SELECT af.acctno  FROM afmast af, cfmast cf
 WHERE af.custid = cf.custid
 AND substr(cf.custodycd, 4, 1) <> 'P'
 AND SUBSTR(AF.ACCTNO,1,4) LIKE V_STRBRID
AND AF.aftype LIKE V_STRAFTYPE
AND  NVL( SUBSTR(CF.CUSTODYCD,4,1) ,'O')  LIKE V_STRTYPELG
AND AF.STATUS LIKE V_STRSTATUS

) AF
WHERE STS.ACCTNO = AF.ACCTNO
AND SUBSTR(STS.ACCTNO,1,4) LIKE V_STRBRID  ;

END IF;

LOOP
      FETCH    CUR
       INTO V_NUMCTT;
      EXIT WHEN    CUR%NOTFOUND;
   END LOOP;
   CLOSE    CUR;





--TINH NGAY NHAN THANH TOAN BU TRU

-- XAC DINH SO DU CUA TU DOANH

OPEN    CUR
    FOR
   SELECT SUM( CI.BAMT + CI.BALANCE -  NVL(DTL.B,0))
      FROM CIMAST CI , AFMAST AF, CFMAST CF,
      (
         SELECT SUM(A.AMT) B,A.ACCTNO  ACCTNO
         FROM (SELECT   SUM ((CASE WHEN APP.TXTYPE = 'D'THEN -TR.NAMT
                                   WHEN APP.TXTYPE = 'C' THEN TR.NAMT
                                   ELSE 0   END )) AMT,TR.ACCTNO ACCTNO
               FROM APPTX APP, CITRAN TR ,TLLOG TL
               WHERE TR.TXCD = APP.TXCD
                    AND TL.TXNUM =TR.TXNUM
                    AND TL.DELTD <>'Y'
                    AND TR.NAMT<>0
                    AND APP.APPTYPE = 'CI'
                    AND APP.TXTYPE IN ('C', 'D')
                    AND TRIM (APP.FIELD) IN ('BAMT','BALANCE','MBLOCK')
                    AND  TL.BUSDATE  > TO_DATE (T_DATE ,'DD/MM/YYYY')
               GROUP BY TR.ACCTNO
           UNION ALL
              SELECT   SUM ((CASE WHEN APP.TXTYPE = 'D'THEN -TR.NAMT
                                 WHEN  APP.TXTYPE = 'C'THEN TR.NAMT
                                 ELSE 0 END )) AMT,TR.ACCTNO ACCTNO
              FROM APPTX APP, CITRANA TR,TLLOGALL TL
              WHERE TR.TXCD = APP.TXCD
                    AND TL.TXNUM =TR.TXNUM
                    AND TL.DELTD <>'Y'
                    AND TR.NAMT<>0
                    AND TL.TXDATE =TR.TXDATE
                    AND APP.APPTYPE = 'CI'
                    AND APP.TXTYPE IN ('C', 'D')
                    AND TRIM (APP.FIELD) IN ('BAMT','BALANCE','MBLOCK')
                    AND  TL.BUSDATE  > TO_DATE (T_DATE ,'DD/MM/YYYY')
              GROUP BY TR.ACCTNO
                ) A
                  GROUP BY A.ACCTNO)DTL
       WHERE CI.ACCTNO=DTL.ACCTNO (+)
       AND AF.ACCTNO = CI.ACCTNO
       AND AF.CUSTID = CF.CUSTID
       AND CF.CUSTODYCD ='021P222222'
       AND SUBSTR(AF.ACCTNO,1,4) LIKE V_STRBRID
       AND AF.aftype LIKE V_STRAFTYPE
       AND  NVL( SUBSTR(CF.CUSTODYCD,4,1) ,'O')  LIKE V_STRTYPELG
       AND AF.STATUS LIKE V_STRSTATUS
  ;


LOOP
      FETCH    CUR
       INTO V_NUMTD ;
      EXIT WHEN    CUR%NOTFOUND;
   END LOOP;
 CLOSE    CUR;






CASE  WHEN OVDTYPE LIKE '002' THEN

    -- GET REPORT'S DATA

OPEN PV_REFCURSOR
FOR
SELECT NVL(V_NUMCTT,0) V_NUMCTT,NVL(V_NUMTD,0) V_NUMTD,  ACC.FULLNAME, ROUND(NVL(ACC.BALANCE,0)+ NVL(ACC.BAMT,0)-NVL(NUM.AMT,0)) BE_BALANCE,
        ROUND( NVL(BALANCE.DRAMT,0)) DRAMT,ROUND(NVL(BALANCE.CRAMT,0)) CRAMT,
        ACC.ACCTNO ,ACC.SHORTCD,ACC.CCYCD,abs(NVL(OVD.AMT,0)) OVD
FROM
 --THONG TIN KHACH HANG
(   SELECT  AF.ACCTNO  ,CF.FULLNAME, SB.SHORTCD,CI.BALANCE,SB.CCYCD,CI.BAMT
    FROM AFMAST AF,CFMAST CF,SBCURRENCY SB,CIMAST CI
    WHERE CF.CUSTID =AF.CUSTID
    AND SB.CCYCD = CI.CCYCD
    AND CI.ACCTNO =AF.ACCTNO
    AND AF.aftype LIKE V_STRAFTYPE
    AND  NVL( SUBSTR(CF.CUSTODYCD,4,1) ,'O')  LIKE V_STRTYPELG
    AND AF.STATUS LIKE V_STRSTATUS
    AND SUBSTR(AF.ACCTNO,1,4) LIKE V_STRBRID
    AND AF.ACCTNO LIKE V_ONL
 ) ACC

LEFT JOIN
--SO DU DAU KY
(   SELECT NVL(SUM(AMT ),0) AMT, ACCTNO
    FROM(
        SELECT   SUM ((CASE WHEN APP.TXTYPE = 'D'THEN -TR.NAMT WHEN
        APP.TXTYPE = 'C' THEN TR.NAMT ELSE 0  END )) AMT, TR.ACCTNO ACCTNO
        FROM APPTX APP, CITRAN TR, TLLOG TL
        WHERE TR.TXCD = APP.TXCD
        AND TL.txnum =TR.txnum
        AND APP.APPTYPE = 'CI' AND APP.TXTYPE IN ('C', 'D')
        AND TL.busdate>=TO_DATE (F_DATE  ,'DD/MM/YYYY')
        AND TRIM (APP.FIELD) IN ('BAMT','BALANCE','MBLOCK')
        AND TL.DELTD <>'Y'
        GROUP BY  TR.ACCTNO
        UNION ALL
        SELECT   SUM ((CASE WHEN APP.TXTYPE = 'D'THEN -TR.NAMT WHEN
                APP.TXTYPE = 'C' THEN TR.NAMT ELSE 0 END )) AMT, TR.ACCTNO ACCTNO
        FROM APPTX APP, CITRANA TR ,TLLOGALL TL
        WHERE TR.TXCD = APP.TXCD
        AND TL.txnum =TR.txnum
        AND TL.txdate =TR.txdate
        AND APP.APPTYPE = 'CI'  AND APP.TXTYPE IN ('C', 'D')
        AND TRIM (APP.FIELD) IN ('BAMT','BALANCE','MBLOCK')
        AND TL.DELTD <>'Y'  AND TL.busdate  >=TO_DATE (F_DATE  ,'DD/MM/YYYY')
        GROUP BY  TR.ACCTNO
        )
    GROUP BY ACCTNO
)NUM
ON NUM.ACCTNO=ACC.ACCTNO
LEFT JOIN
-- PHAT SINH
(SELECT     NVL(SUM (DRAMT),0) DRAMT, NVL(SUM (CRAMT),0) CRAMT,ACCTNO
 FROM (
     SELECT   SUM  ((CASE WHEN APP.TXTYPE = 'D'THEN TR.NAMT  ELSE 0  END )) DRAMT,
              SUM  ((CASE WHEN APP.TXTYPE = 'C'THEN TR.NAMT  ELSE 0  END )) CRAMT
              ,TR.ACCTNO ACCTNO
         FROM APPTX APP, CITRAN TR ,TLLOG TL
         WHERE TR.TXCD = APP.TXCD
              AND TL.txnum =TR.txnum
              AND APP.APPTYPE = 'CI'
              AND APP.TXTYPE IN ('C', 'D')
              AND TRIM (APP.FIELD) IN  ('BAMT','BALANCE','MBLOCK')
              AND TL.tltxcd NOT IN('1145' ,'1144','1164','1165')
              AND TL.DELTD <>'Y'
              AND TL.busdate >=TO_DATE (F_DATE ,'DD/MM/YYYY')
              AND TL.busdate <=TO_DATE (T_DATE ,'DD/MM/YYYY')
              GROUP BY TR.ACCTNO
    UNION ALL
      SELECT   SUM  ((CASE WHEN APP.TXTYPE = 'D'THEN TR.NAMT  ELSE 0  END )) DRAMT,
               SUM  ((CASE WHEN APP.TXTYPE = 'C'THEN TR.NAMT  ELSE 0  END )) CRAMT
                  ,TR.ACCTNO ACCTNO
         FROM APPTX APP, CITRANA TR,TLLOGALL TL
         WHERE TR.TXCD = APP.TXCD
              AND TL.txnum =TR.txnum
              AND TL.txdate= TR.txdate
              AND APP.APPTYPE = 'CI'
              AND APP.TXTYPE IN ('C', 'D')
              AND TRIM (APP.FIELD) IN ('BAMT','BALANCE','MBLOCK')
              AND TL.tltxcd NOT IN('1145' ,'1144','1164','1165')
              AND TL.DELTD <>'Y'
              AND TL.busdate >=TO_DATE (F_DATE  ,'DD/MM/YYYY')
              AND TL.busdate <=TO_DATE (T_DATE ,'DD/MM/YYYY')
             GROUP BY TR.ACCTNO
   )
   GROUP BY ACCTNO ) BALANCE
   ON ACC.ACCTNO =  BALANCE.ACCTNO

LEFT JOIN
--TAM UNG THAU CHI
(

SELECT NVL(SUM(AMT ),0) AMT, ACCTNO
          FROM(
          SELECT   SUM ((CASE WHEN APP.TXTYPE = 'D'THEN -TR.NAMT WHEN
          APP.TXTYPE = 'C' THEN TR.NAMT ELSE 0  END )) AMT, TR.ACCTNO ACCTNO
          FROM APPTX APP, CITRAN TR, TLLOG TL
          WHERE TR.TXCD = APP.TXCD
               AND TL.txnum =TR.txnum
               AND APP.APPTYPE = 'CI'
               AND APP.TXTYPE IN ('C', 'D')
               AND TL.busdate>=TO_DATE (F_DATE  ,'DD/MM/YYYY')
               AND TRIM (APP.FIELD) IN ('BAMT','BALANCE','MBLOCK')
               AND TL.tltxcd  IN('1164','1165')
               AND TL.DELTD <>'Y'
               GROUP BY  TR.ACCTNO
  UNION ALL
         SELECT   SUM ((CASE WHEN APP.TXTYPE = 'D'THEN -TR.NAMT WHEN
         APP.TXTYPE = 'C' THEN TR.NAMT ELSE 0 END )) AMT, TR.ACCTNO ACCTNO
         FROM APPTX APP, CITRANA TR ,TLLOGALL TL
         WHERE TR.TXCD = APP.TXCD
               AND TL.txnum =TR.txnum
               AND TL.txdate =TR.txdate
               AND APP.APPTYPE = 'CI'
               AND APP.TXTYPE IN ('C', 'D')
               AND TRIM (APP.FIELD) IN ('BAMT','BALANCE','MBLOCK')
               AND TL.tltxcd  IN('1164','1165')
               AND TL.DELTD <>'Y'
               AND TL.busdate  >=TO_DATE (F_DATE  ,'DD/MM/YYYY')
               GROUP BY  TR.ACCTNO
             )
         GROUP BY ACCTNO ) OVD
   ON ACC.ACCTNO =  OVD.ACCTNO


 WHERE ccycd LIKE V_STRCCYCD
 AND SUBSTR(ACC.ACCTNO,1,4) LIKE V_STRBRID
 AND(ROUND(NVL(ACC.BALANCE,0)+ NVL(ACC.BAMT,0)-NVL(NUM.AMT,0))<>0 OR ROUND(NVL(BALANCE.DRAMT,0))<>0 OR ROUND(NVL(BALANCE.CRAMT,0))<>0)
 AND( NVL(ACC.BALANCE,0)+ NVL(ACC.BAMT,0)-NVL(NUM.AMT,0)- ROUND( NVL(BALANCE.DRAMT,0))+ROUND( NVL(BALANCE.CRAMT,0))) < 0

 ORDER BY  ACC.ACCTNO ;

---DIEU KIEN TIM KIEM >=

WHEN OVDTYPE LIKE '001' THEN

  OPEN PV_REFCURSOR
       FOR
     SELECT NVL(V_NUMCTT,0) V_NUMCTT,NVL(V_NUMTD,0) V_NUMTD, ACC.FULLNAME, ROUND(NVL(ACC.BALANCE,0)+ NVL(ACC.BAMT,0)-NVL(NUM.AMT,0)) BE_BALANCE,ROUND( NVL(BALANCE.DRAMT,0)) DRAMT,ROUND(NVL(BALANCE.CRAMT,0)) CRAMT
        ,ACC.ACCTNO ,ACC.SHORTCD,ACC.CCYCD,abs(NVL(OVD.AMT,0)) OVD
        FROM
 --THONG TIN KHACH HANG
      (SELECT  AF.ACCTNO  ,CF.FULLNAME, SB.SHORTCD,CI.BALANCE,SB.CCYCD,CI.BAMT
        FROM AFMAST AF,CFMAST CF,SBCURRENCY SB,CIMAST CI
        WHERE CF.CUSTID =AF.CUSTID
        AND SB.CCYCD = CI.CCYCD
        AND CI.ACCTNO =AF.ACCTNO
        AND AF.aftype LIKE V_STRAFTYPE
        AND  NVL( SUBSTR(CF.CUSTODYCD,4,1) ,'O')  LIKE V_STRTYPELG
        AND AF.status LIKE V_STRSTATUS
        AND SUBSTR(AF.acctno,1,4) LIKE V_STRBRID
        AND AF.ACCTNO LIKE V_ONL
       ) ACC

LEFT JOIN
--SO DU DAU KY
( SELECT NVL(SUM(AMT ),0) AMT, ACCTNO
          FROM(
          SELECT   SUM ((CASE WHEN APP.TXTYPE = 'D'THEN -TR.NAMT WHEN
          APP.TXTYPE = 'C' THEN TR.NAMT ELSE 0  END )) AMT, TR.ACCTNO ACCTNO
          FROM APPTX APP, CITRAN TR, TLLOG TL
          WHERE TR.TXCD = APP.TXCD
               AND TL.txnum =TR.txnum
               AND APP.APPTYPE = 'CI'
               AND APP.TXTYPE IN ('C', 'D')
               AND TL.busdate>=TO_DATE (F_DATE  ,'DD/MM/YYYY')
               AND TRIM (APP.FIELD) IN ('BAMT','BALANCE','MBLOCK')
               AND TL.DELTD <>'Y'
               GROUP BY  TR.ACCTNO
  UNION ALL
         SELECT   SUM ((CASE WHEN APP.TXTYPE = 'D'THEN -TR.NAMT WHEN
         APP.TXTYPE = 'C' THEN TR.NAMT ELSE 0 END )) AMT, TR.ACCTNO ACCTNO
         FROM APPTX APP, CITRANA TR ,TLLOGALL TL
         WHERE TR.TXCD = APP.TXCD
               AND TL.txnum =TR.txnum
               AND TL.txdate =TR.txdate
               AND APP.APPTYPE = 'CI'
               AND APP.TXTYPE IN ('C', 'D')
               AND TRIM (APP.FIELD) IN ('BAMT','BALANCE','MBLOCK')
               AND TL.DELTD <>'Y'
               AND TL.busdate  >=TO_DATE (F_DATE  ,'DD/MM/YYYY')
               GROUP BY  TR.ACCTNO
             )
         GROUP BY ACCTNO
             )NUM
        ON NUM.ACCTNO=ACC.ACCTNO
LEFT JOIN
-- PHAT SINH
(SELECT     NVL(SUM (DRAMT),0) DRAMT, NVL(SUM (CRAMT),0) CRAMT,ACCTNO
 FROM (
     SELECT   SUM  ((CASE WHEN APP.TXTYPE = 'D'THEN TR.NAMT  ELSE 0  END )) DRAMT,
              SUM  ((CASE WHEN APP.TXTYPE = 'C'THEN TR.NAMT  ELSE 0  END )) CRAMT
              ,TR.ACCTNO ACCTNO
         FROM APPTX APP, CITRAN TR ,TLLOG TL
         WHERE TR.TXCD = APP.TXCD
              AND TL.txnum =TR.txnum
              AND APP.APPTYPE = 'CI'
              AND APP.TXTYPE IN ('C', 'D')
              AND TRIM (APP.FIELD) IN  ('BAMT','BALANCE','MBLOCK')
              AND TL.tltxcd NOT IN('1145' ,'1144','1164','1165')
              AND TL.DELTD <>'Y'
              AND TL.busdate >=TO_DATE (F_DATE ,'DD/MM/YYYY')
              AND TL.busdate <=TO_DATE (T_DATE ,'DD/MM/YYYY')
              GROUP BY TR.ACCTNO
    UNION ALL
      SELECT   SUM  ((CASE WHEN APP.TXTYPE = 'D'THEN TR.NAMT  ELSE 0  END )) DRAMT,
               SUM  ((CASE WHEN APP.TXTYPE = 'C'THEN TR.NAMT  ELSE 0  END )) CRAMT
                  ,TR.ACCTNO ACCTNO
         FROM APPTX APP, CITRANA TR,TLLOGALL TL
         WHERE TR.TXCD = APP.TXCD
              AND TL.txnum =TR.txnum
              AND TL.txdate= TR.txdate
              AND APP.APPTYPE = 'CI'
              AND APP.TXTYPE IN ('C', 'D')
              AND TRIM (APP.FIELD) IN ('BAMT','BALANCE','MBLOCK')
              AND TL.tltxcd NOT IN('1145' ,'1144','1164','1165')
              AND TL.DELTD <>'Y'
              AND TL.busdate >=TO_DATE (F_DATE  ,'DD/MM/YYYY')
              AND TL.busdate <=TO_DATE (T_DATE ,'DD/MM/YYYY')
             GROUP BY TR.ACCTNO
   )
   GROUP BY ACCTNO ) BALANCE
   ON ACC.ACCTNO =  BALANCE.ACCTNO

LEFT JOIN
--TAM UNG THAU CHI
(

SELECT NVL(SUM(AMT ),0) AMT, ACCTNO
          FROM(
          SELECT   SUM ((CASE WHEN APP.TXTYPE = 'D'THEN -TR.NAMT WHEN
          APP.TXTYPE = 'C' THEN TR.NAMT ELSE 0  END )) AMT, TR.ACCTNO ACCTNO
          FROM APPTX APP, CITRAN TR, TLLOG TL
          WHERE TR.TXCD = APP.TXCD
               AND TL.txnum =TR.txnum
               AND APP.APPTYPE = 'CI'
               AND APP.TXTYPE IN ('C', 'D')
               AND TL.busdate>=TO_DATE (F_DATE  ,'DD/MM/YYYY')
               AND TRIM (APP.FIELD) IN ('BAMT','BALANCE','MBLOCK')
               AND TL.tltxcd  IN('1164','1165')
               AND TL.DELTD <>'Y'
               GROUP BY  TR.ACCTNO
  UNION ALL
         SELECT   SUM ((CASE WHEN APP.TXTYPE = 'D'THEN -TR.NAMT WHEN
         APP.TXTYPE = 'C' THEN TR.NAMT ELSE 0 END )) AMT, TR.ACCTNO ACCTNO
         FROM APPTX APP, CITRANA TR ,TLLOGALL TL
         WHERE TR.TXCD = APP.TXCD
               AND TL.txnum =TR.txnum
               AND TL.txdate =TR.txdate
               AND APP.APPTYPE = 'CI'
               AND APP.TXTYPE IN ('C', 'D')
               AND TRIM (APP.FIELD) IN ('BAMT','BALANCE','MBLOCK')
               AND TL.tltxcd  IN('1164','1165')
               AND TL.DELTD <>'Y'
               AND TL.busdate  >=TO_DATE (F_DATE  ,'DD/MM/YYYY')
               GROUP BY  TR.ACCTNO
             )
         GROUP BY ACCTNO ) OVD
   ON ACC.ACCTNO =  OVD.ACCTNO


 WHERE ccycd LIKE V_STRCCYCD
 AND(ROUND(NVL(ACC.BALANCE,0)+ NVL(ACC.BAMT,0)-NVL(NUM.AMT,0))<>0 OR ROUND(NVL(BALANCE.DRAMT,0))<>0 OR ROUND(NVL(BALANCE.CRAMT,0))<>0)
 AND( NVL(ACC.BALANCE,0)+ NVL(ACC.BAMT,0)-NVL(NUM.AMT,0)- ROUND( NVL(BALANCE.DRAMT,0))+ROUND( NVL(BALANCE.CRAMT,0))) >= 0
 ORDER BY  ACC.ACCTNO ;


--- TH CHON ALL

 ELSE

      OPEN PV_REFCURSOR
       FOR
     SELECT NVL(V_NUMCTT,0) V_NUMCTT,NVL(V_NUMTD,0) V_NUMTD,ACC.FULLNAME, ROUND(NVL(ACC.BALANCE,0)+ NVL(ACC.BAMT,0)-NVL(NUM.AMT,0)) BE_BALANCE,ROUND( NVL(BALANCE.DRAMT,0)) DRAMT,ROUND(NVL(BALANCE.CRAMT,0)) CRAMT
        ,ACC.ACCTNO ,ACC.SHORTCD,ACC.CCYCD,abs(NVL(OVD.AMT,0)) OVD
        FROM
 --THONG TIN KHACH HANG
      (SELECT  AF.ACCTNO  ,CF.FULLNAME, SB.SHORTCD,CI.BALANCE,SB.CCYCD,CI.BAMT
        FROM AFMAST AF,CFMAST CF,SBCURRENCY SB,CIMAST CI
        WHERE CF.CUSTID =AF.CUSTID
        AND SB.CCYCD = CI.CCYCD
        AND CI.ACCTNO =AF.ACCTNO
        AND AF.aftype LIKE V_STRAFTYPE
        AND  NVL( SUBSTR(CF.CUSTODYCD,4,1) ,'O')  LIKE V_STRTYPELG
        AND AF.status LIKE V_STRSTATUS
        AND SUBSTR(AF.acctno,1,4) LIKE V_STRBRID
        AND AF.ACCTNO LIKE V_ONL
       ) ACC

LEFT JOIN
--SO DU DAU KY
( SELECT NVL(SUM(AMT ),0) AMT, ACCTNO
          FROM(
          SELECT   SUM ((CASE WHEN APP.TXTYPE = 'D'THEN -TR.NAMT WHEN
          APP.TXTYPE = 'C' THEN TR.NAMT ELSE 0  END )) AMT, TR.ACCTNO ACCTNO
          FROM APPTX APP, CITRAN TR, TLLOG TL
          WHERE TR.TXCD = APP.TXCD
               AND TL.txnum =TR.txnum
               AND APP.APPTYPE = 'CI'
               AND APP.TXTYPE IN ('C', 'D')
               AND TL.busdate>=TO_DATE (F_DATE  ,'DD/MM/YYYY')
               AND TRIM (APP.FIELD) IN ('BAMT','BALANCE','MBLOCK')
               AND TL.DELTD <>'Y'
               GROUP BY  TR.ACCTNO
  UNION ALL
         SELECT   SUM ((CASE WHEN APP.TXTYPE = 'D'THEN -TR.NAMT WHEN
         APP.TXTYPE = 'C' THEN TR.NAMT ELSE 0 END )) AMT, TR.ACCTNO ACCTNO
         FROM APPTX APP, CITRANA TR ,TLLOGALL TL
         WHERE TR.TXCD = APP.TXCD
               AND TL.txnum =TR.txnum
               AND TL.txdate =TR.txdate
               AND APP.APPTYPE = 'CI'
               AND APP.TXTYPE IN ('C', 'D')
               AND TRIM (APP.FIELD) IN ('BAMT','BALANCE','MBLOCK')
               AND TL.DELTD <>'Y'
               AND TL.busdate  >=TO_DATE (F_DATE  ,'DD/MM/YYYY')
               GROUP BY  TR.ACCTNO
             )
         GROUP BY ACCTNO
             )NUM
        ON NUM.ACCTNO=ACC.ACCTNO
LEFT JOIN
-- PHAT SINH
(SELECT     NVL(SUM (DRAMT),0) DRAMT, NVL(SUM (CRAMT),0) CRAMT,ACCTNO
 FROM (
     SELECT   SUM  ((CASE WHEN APP.TXTYPE = 'D'THEN TR.NAMT  ELSE 0  END )) DRAMT,
              SUM  ((CASE WHEN APP.TXTYPE = 'C'THEN TR.NAMT  ELSE 0  END )) CRAMT
              ,TR.ACCTNO ACCTNO
         FROM APPTX APP, CITRAN TR ,TLLOG TL
         WHERE TR.TXCD = APP.TXCD
              AND TL.txnum =TR.txnum
              AND APP.APPTYPE = 'CI'
              AND APP.TXTYPE IN ('C', 'D')
              AND TRIM (APP.FIELD) IN  ('BAMT','BALANCE','MBLOCK')
              AND TL.tltxcd NOT IN('1145' ,'1144','1164','1165')
              AND TL.DELTD <>'Y'
              AND TL.busdate >=TO_DATE (F_DATE ,'DD/MM/YYYY')
              AND TL.busdate <=TO_DATE (T_DATE ,'DD/MM/YYYY')
              GROUP BY TR.ACCTNO
    UNION ALL
      SELECT   SUM  ((CASE WHEN APP.TXTYPE = 'D'THEN TR.NAMT  ELSE 0  END )) DRAMT,
               SUM  ((CASE WHEN APP.TXTYPE = 'C'THEN TR.NAMT  ELSE 0  END )) CRAMT
                  ,TR.ACCTNO ACCTNO
         FROM APPTX APP, CITRANA TR,TLLOGALL TL
         WHERE TR.TXCD = APP.TXCD
              AND TL.txnum =TR.txnum
              AND TL.txdate= TR.txdate
              AND APP.APPTYPE = 'CI'
              AND APP.TXTYPE IN ('C', 'D')
              AND TRIM (APP.FIELD) IN ('BAMT','BALANCE','MBLOCK')
              AND TL.tltxcd NOT IN('1145' ,'1144','1164','1165')
              AND TL.DELTD <>'Y'
              AND TL.busdate >=TO_DATE (F_DATE  ,'DD/MM/YYYY')
              AND TL.busdate <=TO_DATE (T_DATE ,'DD/MM/YYYY')
             GROUP BY TR.ACCTNO
   )
   GROUP BY ACCTNO ) BALANCE
   ON ACC.ACCTNO =  BALANCE.ACCTNO

LEFT JOIN
--TAM UNG THAU CHI
(

SELECT NVL(SUM(AMT ),0) AMT, ACCTNO
          FROM(
          SELECT   SUM ((CASE WHEN APP.TXTYPE = 'D'THEN -TR.NAMT WHEN
          APP.TXTYPE = 'C' THEN TR.NAMT ELSE 0  END )) AMT, TR.ACCTNO ACCTNO
          FROM APPTX APP, CITRAN TR, TLLOG TL
          WHERE TR.TXCD = APP.TXCD
               AND TL.txnum =TR.txnum
               AND APP.APPTYPE = 'CI'
               AND APP.TXTYPE IN ('C', 'D')
               AND TL.busdate>=TO_DATE (F_DATE  ,'DD/MM/YYYY')
               AND TRIM (APP.FIELD) IN ('BAMT','BALANCE','MBLOCK')
               AND TL.tltxcd  IN('1164','1165')
               AND TL.DELTD <>'Y'
               GROUP BY  TR.ACCTNO
  UNION ALL
         SELECT   SUM ((CASE WHEN APP.TXTYPE = 'D'THEN -TR.NAMT WHEN
         APP.TXTYPE = 'C' THEN TR.NAMT ELSE 0 END )) AMT, TR.ACCTNO ACCTNO
         FROM APPTX APP, CITRANA TR ,TLLOGALL TL
         WHERE TR.TXCD = APP.TXCD
               AND TL.txnum =TR.txnum
               AND TL.txdate =TR.txdate
               AND APP.APPTYPE = 'CI'
               AND APP.TXTYPE IN ('C', 'D')
               AND TRIM (APP.FIELD) IN ('BAMT','BALANCE','MBLOCK')
               AND TL.tltxcd  IN('1164','1165')
               AND TL.DELTD <>'Y'
               AND TL.busdate  >=TO_DATE (F_DATE  ,'DD/MM/YYYY')
               GROUP BY  TR.ACCTNO
             )
         GROUP BY ACCTNO ) OVD
   ON ACC.ACCTNO =  OVD.ACCTNO


 WHERE ccycd LIKE V_STRCCYCD
 AND(ROUND(NVL(ACC.BALANCE,0)+ NVL(ACC.BAMT,0)-NVL(NUM.AMT,0))<>0 OR ROUND(NVL(BALANCE.DRAMT,0))<>0 OR ROUND(NVL(BALANCE.CRAMT,0))<>0)
 ORDER BY  ACC.ACCTNO ;

 END CASE;

EXCEPTION
   WHEN OTHERS
   THEN
      RETURN;
END;                                                              -- PROCEDURE

 
 
 
 
/
