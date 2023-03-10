SET DEFINE OFF;
CREATE OR REPLACE PROCEDURE "SE0017" (
   PV_REFCURSOR   IN OUT   PKG_REPORT.REF_CURSOR,
   OPT            IN       VARCHAR2,
   BRID           IN       VARCHAR2,
   TLGOUPS        IN       VARCHAR2,
   TLSCOPE        IN       VARCHAR2,
   F_DATE         IN       VARCHAR2,
   T_DATE         IN       VARCHAR2,
   SYMBOL         IN       VARCHAR2
)
IS
--
-- PURPOSE: BRIEFLY EXPLAIN THE FUNCTIONALITY OF THE PROCEDURE
--
-- MODIFICATION HISTORY
-- PERSON      DATE    COMMENTS
-- MINHTK   21-NOV-06  CREATED
-- ---------   ------  -------------------------------------------
   V_STROPTION        VARCHAR2 (5);       -- A: ALL; B: BRANCH; S: SUB-BRANCH
   V_STRBRID          VARCHAR2 (4);              -- USED WHEN V_NUMOPTION > 0
   V_ACTYPE           VARCHAR2 (16);
   V_STRSYMBOL        VARCHAR2 (50);

-- DECLARE PROGRAM VARIABLES AS SHOWN ABOVE
BEGIN
-- INSERT INTO TEMP_BUG(TEXT) VALUES('CF0001');COMMIT;
   V_STROPTION := OPT;

   IF (V_STROPTION <> 'A') AND (BRID <> 'ALL')
   THEN
      V_STRBRID := BRID;
   ELSE
      V_STRBRID := '%%';
   END IF;

   -- GET REPORT'S PARAMETERS

   IF (SYMBOL <> 'ALL')
   THEN
      V_STRSYMBOL := SYMBOL;
   ELSE
      V_STRSYMBOL := '%%';
   END IF;


OPEN PV_REFCURSOR
    FOR
SELECT SE.SYMBOL, nvl(BE_BALANCE.AMT,0) BE_BALANCE ,nvl(BALANCE.DR,0) DR ,nvl(BALANCE.CR,0) CR
FROM SBSECURITIES SE,

(SELECT SUBSTR(SE.ACCTNO,11,6) CODEID ,SUM(SE.MORTAGE - NVL(NUM.AMT,0)) AMT
FROM SEMAST SE
LEFT JOIN
(
 SELECT NVL(SUM(AMT ),0) AMT, CODEID
 FROM
 (
 SELECT(CASE WHEN APP.TXTYPE = 'D'THEN -TR.NAMT WHEN  APP.TXTYPE = 'C' THEN TR.NAMT ELSE 0  END ) AMT , SUBSTR(TR.ACCTNO,11,6) CODEID
   FROM APPTX APP, SETRAN TR, TLLOG TL
       WHERE TR.TXCD = APP.TXCD
             AND TL.TXNUM =TR.TXNUM
             AND APP.APPTYPE = 'SE'
             AND APP.TXTYPE IN ('C', 'D')
             AND TL.DELTD <>'Y'
             AND  TR.NAMT<>0
             AND TL.BUSDATE  > TO_DATE (F_DATE   ,'DD/MM/YYYY')
             AND TRIM (APP.FIELD) IN   ('MORTAGE')

  UNION ALL
 SELECT (CASE WHEN APP.TXTYPE = 'D'THEN -TR.NAMT WHEN APP.TXTYPE = 'C' THEN TR.NAMT ELSE 0 END ) AMT,  SUBSTR(TR.ACCTNO,11,6) CODEID
         FROM APPTX APP, SETRANA TR ,TLLOGALL TL
         WHERE TR.TXCD = APP.TXCD
               AND TL.TXNUM =TR.TXNUM
               AND TL.TXDATE =TR.TXDATE
               AND APP.APPTYPE = 'SE'
               AND APP.TXTYPE IN ('C', 'D')
               AND TL.BUSDATE  >TO_DATE (F_DATE  ,'DD/MM/YYYY')
               AND TRIM (APP.FIELD) IN   ('MORTAGE')
               AND TL.DELTD <>'Y'
               AND  TR.NAMT<>0
     )
 GROUP BY CODEID
)NUM
ON NUM.CODEID =SUBSTR(SE.ACCTNO,11,6)
WHERE (SE.MORTAGE - NVL(NUM.AMT,0))<>0
GROUP BY  SUBSTR(SE.ACCTNO,11,6)
)BE_BALANCE,
(
 SELECT  AMT.CODEID,SUM (AMT.DR) DR ,SUM (AMT.CR) CR
 FROM
 (SELECT SUM(CASE WHEN APP.TXTYPE = 'D'THEN TR.NAMT  ELSE 0  END ) DR ,
        SUM(CASE WHEN APP.TXTYPE = 'C'THEN TR.NAMT  ELSE 0  END ) CR ,
             SUBSTR(TR.ACCTNO,11,6) CODEID
   FROM APPTX APP, SETRAN TR, TLLOG TL
       WHERE TR.TXCD = APP.TXCD
             AND TL.TXNUM =TR.TXNUM
             AND APP.APPTYPE = 'SE'
             AND APP.TXTYPE IN ('C', 'D')
             AND TL.DELTD <>'Y'
             AND  TR.NAMT<>0
             AND TL.BUSDATE  >=TO_DATE (F_DATE   ,'DD/MM/YYYY')
             AND TL.BUSDATE  <=TO_DATE (T_DATE   ,'DD/MM/YYYY')
              AND TRIM (APP.FIELD) IN   ('MORTAGE')
            GROUP BY  SUBSTR(TR.ACCTNO,11,6)

  UNION ALL
 SELECT SUM(CASE WHEN APP.TXTYPE = 'D'THEN TR.NAMT  ELSE 0  END ) DR ,
        SUM(CASE WHEN APP.TXTYPE = 'C'THEN TR.NAMT  ELSE 0  END ) CR ,
             SUBSTR(TR.ACCTNO,11,6) CODEID
         FROM APPTX APP, SETRANA TR ,TLLOGALL TL
         WHERE TR.TXCD = APP.TXCD
               AND TL.TXNUM =TR.TXNUM
               AND TL.TXDATE =TR.TXDATE
               AND APP.APPTYPE = 'SE'
               AND APP.TXTYPE IN ('C', 'D')
               AND TL.BUSDATE  >=TO_DATE (F_DATE  ,'DD/MM/YYYY')
               AND TL.BUSDATE <=TO_DATE (T_DATE  ,'DD/MM/YYYY')
               AND TRIM (APP.FIELD) IN   ('MORTAGE')
               AND TL.DELTD <>'Y'
               AND  TR.NAMT<>0
             GROUP BY  SUBSTR(TR.ACCTNO,11,6)
            )   AMT
      GROUP BY   AMT.CODEID

   )BALANCE
   WHERE SE.CODEID= BE_BALANCE.CODEID(+)
   AND SE.CODEID =BALANCE.CODEID(+)
AND ( BALANCE.DR<>0 OR BALANCE.CR<>0 OR BE_BALANCE.AMT<>0);


 EXCEPTION
   WHEN OTHERS
   THEN

      RETURN;
END;                                                              -- PROCEDURE

 
 
 
 
/
