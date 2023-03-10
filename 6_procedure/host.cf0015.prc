SET DEFINE OFF;
CREATE OR REPLACE PROCEDURE "CF0015" (
   PV_REFCURSOR           IN OUT   PKG_REPORT.REF_CURSOR,
   OPT            IN       VARCHAR2,
   BRID           IN       VARCHAR2,
   TLGOUPS        IN       VARCHAR2,
   TLSCOPE        IN       VARCHAR2,
   F_DATE         IN       VARCHAR2,
   T_DATE         IN       VARCHAR2,
   AFACCTNO       IN       VARCHAR2,
   ONL       VARCHAR2  DEFAULT  NULL,
   CURRENT_INDEX	 	 NUMBER  DEFAULT NULL,
   OFFSET_NUMBER	 	 NUMBER  DEFAULT NULL

  )
IS
--
-- PURPOSE: BRIEFLY EXPLAIN THE FUNCTIONALITY OF THE PROCEDURE
-- BAO CAO TAI KHOAN TIEN TONG HOP CUA NGUOI DAU TU
-- MODIFICATION HISTORY
-- PERSON      DATE    COMMENTS
-- NAMNT   20-DEC-06  CREATED
-- ---------   ------  -------------------------------------------

   CUR            PKG_REPORT.REF_CURSOR;
   V_STROPTION    VARCHAR2 (5);            -- A: ALL; B: BRANCH; S: SUB-BRANCH
   V_STRBRID      VARCHAR2 (4);                   -- USED WHEN V_NUMOPTION > 0
   V_STRAFACCTNO  VARCHAR2 (20);
   V_NUMSDDK      NUMBER (20, 2);
   V_NUMCTT       NUMBER (20, 2);
   V_NUMKQ        NUMBER (20, 2);
   V_NUMPT        NUMBER (20, 2);
   V_NUMMBLOCK        NUMBER (20, 2);
   V_STRFULLNAME       VARCHAR2 (100);
   V_STRMOBILE         VARCHAR2 (20);
   V_STRLG              VARCHAR2 (20);
   V_DATE          DATE;
   V_D_CUR         DATE;

BEGIN

   V_STROPTION := OPT;

   IF (V_STROPTION <> 'A') AND (BRID <> 'ALL')
   THEN
      V_STRBRID := BRID;
   ELSE
      V_STRBRID := '%%';
   END IF;

   -- GET REPORT'S PARAMETERS

       V_STRAFACCTNO :=  AFACCTNO;

   -- END OF GETTING REPORT'S PARAMETERS
 --TINH THONG TIN KHACH HANG

SELECT CF.FULLNAME , CF.MOBILE,nvl(SUBSTR(CF.CUSTODYCD,4,1),'C') LG INTO V_STRFULLNAME, V_STRMOBILE ,V_STRLG
FROM AFMAST AF, CFMAST CF
WHERE AF.CUSTID =CF.CUSTID
AND AF.ACCTNO =  V_STRAFACCTNO;

IF  ONL   IS NULL THEN
--So du cuoi ky
SELECT  CI.RECEIVING  -  NVL(DTL.RECEIVING_AMT,0), CI.BAMT + NVL(I.ADVAMT,0) +  NVL(I.SECUREAMT,0) -  NVL(DTL.BAMT_AMT,0), CI.EMKAMT  -  NVL(DTL.EMKAMT_AMT,0), CI.MBLOCK  -  NVL(DTL.MBLOCK_AMT,0) INTO V_NUMCTT, V_NUMKQ ,V_NUMPT,V_NUMMBLOCK
FROM (SELECT * FROM  CIMAST WHERE AFACCTNO  = V_STRAFACCTNO)  CI,
      (  SELECT SUM(A.RECEIVING_AMT) RECEIVING_AMT , SUM(A.BAMT_AMT) BAMT_AMT ,SUM(A.EMKAMT_AMT) EMKAMT_AMT,SUM(A.MBLOCK_AMT) MBLOCK_AMT ,A.ACCTNO  ACCTNO
         FROM (SELECT
         (CASE WHEN APP.TXTYPE = 'D'  AND APP.FIELD ='RECEIVING' THEN -TR.NAMT WHEN APP.TXTYPE = 'C'  AND APP.FIELD ='RECEIVING' THEN TR.NAMT ELSE 0  END )RECEIVING_AMT ,
         (CASE WHEN APP.TXTYPE = 'D'  AND APP.FIELD ='BAMT' THEN -TR.NAMT WHEN APP.TXTYPE = 'C'  AND APP.FIELD ='BAMT' THEN TR.NAMT ELSE 0   END ) BAMT_AMT ,
         (CASE WHEN APP.TXTYPE = 'D'  AND APP.FIELD ='EMKAMT' THEN -TR.NAMT WHEN APP.TXTYPE = 'C'  AND APP.FIELD ='EMKAMT' THEN TR.NAMT ELSE 0   END ) EMKAMT_AMT ,
            (CASE WHEN APP.TXTYPE = 'D'  AND APP.FIELD ='MBLOCK' THEN -TR.NAMT WHEN APP.TXTYPE = 'C'  AND APP.FIELD ='MBLOCK' THEN TR.NAMT ELSE 0   END ) MBLOCK_AMT ,
               TR.ACCTNO ACCTNO
               FROM APPTX APP, CITRAN TR ,TLLOG TL
               WHERE TR.TXCD = APP.TXCD
                    AND TL.TXNUM =TR.TXNUM
                    AND TL.DELTD <>'Y'
                    AND TR.NAMT<>0
                    AND APP.APPTYPE = 'CI'
                    AND APP.TXTYPE IN ('C', 'D')
                    AND APP.FIELD IN ('RECEIVING','BAMT','EMKAMT','MBLOCK')
                    AND  TL.BUSDATE  > TO_DATE (T_DATE   ,'DD/MM/YYYY')
           UNION ALL
              SELECT
         (CASE WHEN APP.TXTYPE = 'D'  AND APP.FIELD ='RECEIVING' THEN -TR.NAMT WHEN APP.TXTYPE = 'C'  AND APP.FIELD ='RECEIVING' THEN TR.NAMT ELSE 0  END )RECEIVING_AMT ,
         (CASE WHEN APP.TXTYPE = 'D'  AND APP.FIELD ='BAMT' THEN -TR.NAMT WHEN APP.TXTYPE = 'C'  AND APP.FIELD ='BAMT' THEN TR.NAMT ELSE 0   END ) BAMT_AMT ,
         (CASE WHEN APP.TXTYPE = 'D'  AND APP.FIELD ='EMKAMT' THEN -TR.NAMT WHEN APP.TXTYPE = 'C'  AND APP.FIELD ='EMKAMT' THEN TR.NAMT ELSE 0   END ) EMKAMT_AMT ,
         (CASE WHEN APP.TXTYPE = 'D'  AND APP.FIELD ='MBLOCK' THEN -TR.NAMT WHEN APP.TXTYPE = 'C'  AND APP.FIELD ='MBLOCK' THEN TR.NAMT ELSE 0   END ) MBLOCK_AMT ,
                   TR.ACCTNO ACCTNO
              FROM APPTX APP, CITRANA TR,TLLOGALL TL
              WHERE TR.TXCD = APP.TXCD
                    AND TL.TXNUM =TR.TXNUM
                    AND TL.DELTD <>'Y'
                    AND TR.NAMT<>0
                    AND TL.TXDATE =TR.TXDATE
                    AND APP.APPTYPE = 'CI'
                    AND APP.TXTYPE IN ('C', 'D')
                    AND APP.FIELD IN ('RECEIVING','BAMT','EMKAMT','MBLOCK')
                    AND  TL.BUSDATE  > TO_DATE (T_DATE   ,'DD/MM/YYYY')
                ) A
                  GROUP BY A.ACCTNO)DTL,
                  (SELECT OVERAMT, AFACCTNO,ADVAMT, SECUREAMT FROM V_GETBUYORDERINFO) I
       WHERE  CI.AFACCTNO =DTL.ACCTNO (+)
              AND CI.AFACCTNO =I.AFACCTNO(+)
       ;



---SO DU DAU KY

     SELECT  CI.BALANCE + CI.BAMT +CI.MBLOCK - round( NVL(DTL.B,0)) INTO V_NUMSDDK
      FROM (SELECT * FROM  CIMAST WHERE AFACCTNO  = V_STRAFACCTNO)  CI,
      (
         SELECT SUM(A.AMT) B,A.ACCTNO  ACCTNO
         FROM (SELECT  (CASE WHEN APP.TXTYPE = 'D'THEN -TR.NAMT
                                   WHEN APP.TXTYPE = 'C' THEN TR.NAMT
                                   ELSE 0   END ) AMT,TR.ACCTNO ACCTNO
               FROM APPTX APP, CITRAN TR ,TLLOG TL
               WHERE TR.TXCD = APP.TXCD
                    AND TL.TXNUM =TR.TXNUM
                    AND TL.DELTD <>'Y'
                    AND TR.NAMT<>0
                    AND APP.APPTYPE = 'CI'
                    AND APP.TXTYPE IN ('C', 'D')
                    AND APP.FIELD IN ('BALANCE','BAMT', 'MBLOCK')
                    AND  TL.BUSDATE  >= TO_DATE (F_DATE ,'DD/MM/YYYY')
          UNION ALL
              SELECT   (CASE WHEN APP.TXTYPE = 'D'THEN -TR.NAMT
                                 WHEN  APP.TXTYPE = 'C'THEN TR.NAMT
                                 ELSE 0 END ) AMT,TR.ACCTNO ACCTNO
              FROM APPTX APP, CITRANA TR,TLLOGALL TL
              WHERE TR.TXCD = APP.TXCD
                    AND TL.TXNUM =TR.TXNUM
                    AND TL.DELTD <>'Y'
                    AND TR.NAMT<>0
                    AND TL.TXDATE =TR.TXDATE
                    AND APP.APPTYPE = 'CI'
                    AND APP.TXTYPE IN ('C', 'D')
                    AND APP.FIELD IN ('BALANCE','BAMT', 'MBLOCK')
                    AND  TL.BUSDATE  >= TO_DATE (F_DATE ,'DD/MM/YYYY')

                ) A
                  GROUP BY A.ACCTNO
                  )DTL
       WHERE  CI.AFACCTNO=DTL.ACCTNO (+);
END IF ;




 OPEN PV_REFCURSOR
       FOR
       SELECT * FROM
   (SELECT ROWNUM ROWN,AFACCTNO  AFACCTNO,NVL(V_NUMSDDK,0) V_NUMSDDK,NVL(V_NUMMBLOCK,0) V_NUMMBLOCK,NVL(V_NUMCTT,0) V_NUMCTT, NVL(V_NUMKQ,0) V_NUMKQ , NVL(V_NUMPT,0) V_NUMPT,V_STRFULLNAME V_STRFULLNAME, V_STRMOBILE V_STRMOBILE,
             decode(V_STRLG,'P','C',V_STRLG)  LG,V.*
          FROM (
--  GIAO DICH CI KHAC LENH
        SELECT   TL.TXDATE TXDATE, TL.BUSDATE, TL.TXNUM TXNUM, TO_CHAR(TL.TXDESC) DESCRIPTION,
                 (CASE WHEN APP.TXTYPE='C' THEN CITR.NAMT ELSE 0 END)CRAMT_CI,
                 (CASE WHEN APP.TXTYPE='D' THEN CITR.NAMT ELSE 0 END)DRAMT_CI,0 CRAMT_SE, 0 DRAMT_SE,'' SYMBOL
         FROM (SELECT txdate , txnum , ( CASE WHEN TLTXCD ='0066' THEN  txdesc ||' ' || to_char( GETDATE(busdate) ,'dd/mm/yyyy') ELSE txdesc END ) txdesc ,busdate,tltxcd,deltd FROM TLLOG WHERE BUSDATE >= TO_DATE (F_DATE, 'DD/MM/YYYY')  AND BUSDATE <= TO_DATE (T_DATE, 'DD/MM/YYYY')
               AND ( SUBSTR(TLTXCD,1,2) <> '88' AND TLTXCD NOT IN ('1196','1168','1169')  OR TLTXCD  IN('8878' ,'8879') ))  TL,APPTX APP,CITRAN CITR
         WHERE TL.TXNUM = CITR.TXNUM
             AND TL.DELTD <>'Y'
             AND CITR.TXCD = APP.TXCD
             AND APP.APPTYPE = 'CI'
             AND APP.TXTYPE IN ('C', 'D')
             AND APP.FIELD IN ('BALANCE','BAMT', 'MBLOCK')
             AND  CITR.NAMT<>0
             AND TL.TXDATE =CITR.TXDATE
             AND CITR.ACCTNO =  V_STRAFACCTNO
             AND   INSTR( (CASE WHEN NVL(ONL,'ALL' )='ALL' THEN TL.TLTXCD  ELSE ONL END ), TL.TLTXCD )>0
      UNION ALL
         SELECT  TL.TXDATE TXDATE,TL.BUSDATE, TL.TXNUM TXNUM, TO_CHAR(TL.TXDESC) DESCRIPTION,
             (CASE WHEN APP.TXTYPE='C' THEN CITR.NAMT ELSE 0 END)CRAMT_CI,
             (CASE WHEN APP.TXTYPE='D' THEN CITR.NAMT ELSE 0 END)DRAMT_CI,0 CRAMT_SE, 0 DRAMT_SE,'' SYMBOL
          FROM (SELECT txdate , txnum ,( CASE WHEN TLTXCD ='0066' THEN  txdesc ||' ' || to_char( GETDATE(busdate) ,'dd/mm/yyyy') ELSE txdesc END ) txdesc  ,busdate,tltxcd,deltd FROM TLLOGALL WHERE BUSDATE >= TO_DATE (F_DATE, 'DD/MM/YYYY') AND
                                             BUSDATE <= TO_DATE (T_DATE, 'DD/MM/YYYY')
          AND  (SUBSTR(TLTXCD,1,2) <> '88' AND TLTXCD NOT IN ('1196','1168','1169')  OR TLTXCD  IN('8878' ,'8879')) ) TL,APPTX APP,CITRANA CITR
          WHERE  TL.TXNUM = CITR.TXNUM
             AND TL.DELTD <>'Y'
             AND CITR.TXCD = APP.TXCD
             AND APP.APPTYPE = 'CI'
             AND APP.TXTYPE IN ('C', 'D')
             AND APP.FIELD IN ('BALANCE','BAMT', 'MBLOCK')
             AND  CITR.NAMT<>0
             AND TL.TXDATE =CITR.TXDATE
             AND CITR.ACCTNO =  V_STRAFACCTNO
             AND INSTR( (CASE WHEN NVL(ONL,'ALL' )='ALL' THEN TL.TLTXCD  ELSE ONL END )  ,TL.TLTXCD )>0

   --  GIAO DICH CI LENH
               UNION ALL
    SELECT   MAX(TL.TXDATE) TXDATE,MAX(TL.BUSDATE) BUSDATE, MAX(TL.TXNUM) TXNUM, MAX(TO_CHAR(TL.TXDESC)) DESCRIPTION,
             SUM(CASE WHEN APP.TXTYPE='C' THEN CITR.NAMT ELSE 0 END)CRAMT_CI,
             SUM(CASE WHEN APP.TXTYPE='D' THEN CITR.NAMT ELSE 0 END)DRAMT_CI,0 CRAMT_SE, 0 DRAMT_SE,'' SYMBOL
            FROM (SELECT txdate , txnum ,txdesc ,busdate,tltxcd,deltd FROM TLLOG WHERE BUSDATE >= TO_DATE (F_DATE, 'DD/MM/YYYY') AND BUSDATE <= TO_DATE (T_DATE, 'DD/MM/YYYY')
                AND TLTXCD  IN ( '8821','8865','8866','8822','8861','8855','8856','8851')
                 ) TL,APPTX APP,CITRAN CITR
            WHERE    TL.TXNUM = CITR.TXNUM
                 AND TL.DELTD <>'Y'
                 AND CITR.TXCD = APP.TXCD
                 AND APP.APPTYPE = 'CI'
                 AND APP.TXTYPE IN ('C', 'D')
                 AND APP.FIELD IN ('BALANCE','BAMT', 'MBLOCK')
                 AND CITR.NAMT<>0
                 AND TL.TXDATE =CITR.TXDATE
                 AND CITR.ACCTNO =  V_STRAFACCTNO
                 AND INSTR( (CASE WHEN NVL(ONL,'ALL' )='ALL' THEN TL.TLTXCD  ELSE ONL END )  ,TL.TLTXCD )>0
        GROUP BY CITR.REF  ,APP.TXTYPE,TL.TLTXCD
        HAVING (SUM(CASE WHEN APP.TXTYPE='D' THEN -CITR.NAMT ELSE CITR.NAMT END) <> 0)

      UNION ALL
          SELECT
             MAX(TL.TXDATE) TXDATE,MAX(TL.BUSDATE) BUSDATE, MAX(TL.TXNUM) TXNUM, MAX(TO_CHAR(TL.TXDESC)) DESCRIPTION,
             SUM(CASE WHEN APP.TXTYPE='C' THEN CITR.NAMT ELSE 0 END)CRAMT_CI,
             SUM(CASE WHEN APP.TXTYPE='D' THEN CITR.NAMT ELSE 0 END)DRAMT_CI,0 CRAMT_SE, 0 DRAMT_SE,'' SYMBOL
           FROM (SELECT txdate , txnum ,txdesc ,busdate,tltxcd,deltd FROM TLLOGALL WHERE BUSDATE >= TO_DATE (F_DATE, 'DD/MM/YYYY') AND
                                              BUSDATE <= TO_DATE (T_DATE, 'DD/MM/YYYY')
                                       AND TLTXCD  IN ( '8821','8865','8866','8822','8861','8855','8856','8851')
                 ) TL,APPTX APP,CITRANA CITR
           WHERE TL.TXNUM = CITR.TXNUM
                 AND TL.DELTD <>'Y'
                 AND CITR.TXCD = APP.TXCD
                 AND APP.APPTYPE = 'CI'
                 AND APP.TXTYPE IN ('C', 'D')
                 AND APP.FIELD IN ('BALANCE','BAMT', 'MBLOCK')
                 AND  CITR.NAMT<>0
                 AND TL.TXDATE =CITR.TXDATE
                 AND CITR.ACCTNO =  V_STRAFACCTNO
                 AND INSTR( (CASE WHEN NVL(ONL,'ALL' )='ALL' THEN TL.TLTXCD  ELSE ONL END )  ,TL.TLTXCD )>0
           GROUP BY CITR.REF,APP.TXTYPE,TL.TLTXCD
           HAVING (SUM(CASE WHEN APP.TXTYPE='D' THEN -CITR.NAMT ELSE CITR.NAMT END) <> 0)
--GIAO DICH SE KHAC LENH

 UNION ALL


  SELECT  MAX(TL.TXDATE) TXDATE, MAX(TL.BUSDATE) BUSDATE, MAX(TL.TXNUM) TXNUM, MAX(TO_CHAR(TL.TXDESC)) DESCRIPTION,0 CRAMT_CI,0 DRAMT_CI,
          SUM((CASE WHEN APP.TXTYPE='C' THEN SETR.NAMT ELSE 0 END))CRAMT_SE,
          SUM((CASE WHEN APP.TXTYPE='D' THEN SETR.NAMT ELSE 0 END))DRAMT_SE,
          MAX(TO_CHAR(SB.SYMBOL)) SYMBOL

     FROM (SELECT txdate , txnum ,txdesc ,busdate,tltxcd,deltd FROM TLLOG WHERE BUSDATE >= TO_DATE (F_DATE, 'DD/MM/YYYY') AND BUSDATE <= TO_DATE (T_DATE, 'DD/MM/YYYY')
                 AND  (SUBSTR(TLTXCD,1,2) <> '88' AND TLTXCD NOT IN ('2297','2298','2250','2252','2251','2253') OR TLTXCD  IN('8878' ,'8879'))
          ) TL, APPTX APP,( SELECT * FROM  SETRAN  WHERE SUBSTR(ACCTNO,1,10) =  V_STRAFACCTNO  )SETR, SBSECURITIES SB
     WHERE
         TL.TXNUM = SETR.TXNUM
         AND SETR.TXCD = APP.TXCD
         AND SB.CODEID=SUBSTR (SETR.ACCTNO, 11, 6)
         AND APP.APPTYPE = 'SE'
         AND APP.TXTYPE IN ('C', 'D')
         AND APP.FIELD IN('TRADE','SECURED','MORTAGE')
         AND  SETR.NAMT<>0
         AND TL.DELTD<>'Y'
         AND TL.TXDATE =SETR.TXDATE
         AND INSTR( (CASE WHEN NVL(ONL,'ALL' )='ALL' THEN TL.TLTXCD  ELSE ONL END ), TL.TLTXCD )>0
         GROUP BY SETR.REF,APP.TXTYPE,TL.TLTXCD
         HAVING SUM(CASE WHEN APP.TXTYPE='D' THEN -SETR.NAMT ELSE SETR.NAMT END) <> 0

  UNION ALL

  SELECT  MAX(TL.TXDATE) TXDATE, MAX(TL.BUSDATE) BUSDATE, MAX(TL.TXNUM) TXNUM, MAX(TO_CHAR(TL.TXDESC)) DESCRIPTION,0 CRAMT_CI,0 DRAMT_CI,
          SUM((CASE WHEN APP.TXTYPE='C' THEN SETR.NAMT ELSE 0 END))CRAMT_SE,
          SUM((CASE WHEN APP.TXTYPE='D' THEN SETR.NAMT ELSE 0 END))DRAMT_SE,
          MAX(TO_CHAR(SB.SYMBOL)) SYMBOL
  FROM (SELECT txdate , txnum ,txdesc ,busdate,tltxcd,deltd FROM TLLOGALL WHERE BUSDATE >= TO_DATE (F_DATE, 'DD/MM/YYYY') AND BUSDATE <= TO_DATE (T_DATE, 'DD/MM/YYYY')
                   AND (SUBSTR(TLTXCD,1,2) <> '88' AND TLTXCD NOT IN ('2297','2298','2250','2252','2251','2253') OR TLTXCD  IN('8878' ,'8879'))
        ) TL, APPTX APP,( SELECT SETRANA.* FROM  SETRANA , SEMAST  WHERE
           SETRANA.acctno = SEMAST.acctno  AND  SEMAST.AFACCTNO = V_STRAFACCTNO  ) SETR,
              SBSECURITIES SB
  WHERE   TL.TXNUM = SETR.TXNUM
         AND SETR.TXCD = APP.TXCD
         AND SB.CODEID=SUBSTR (SETR.ACCTNO, 11, 6)
         AND APP.APPTYPE = 'SE'
         AND APP.TXTYPE IN ('C', 'D')
         AND APP.FIELD IN('TRADE','SECURED','MORTAGE')
         AND  SETR.NAMT<>0
         AND TL.DELTD<>'Y'
         AND TL.TXDATE =SETR.TXDATE
         AND    INSTR( (CASE WHEN NVL(ONL,'ALL' )='ALL' THEN TL.TLTXCD  ELSE ONL END )  ,TL.TLTXCD )>0
         GROUP BY SETR.REF,APP.TXTYPE,TL.TLTXCD
         HAVING SUM(CASE WHEN APP.TXTYPE='D' THEN -SETR.NAMT ELSE SETR.NAMT END) <> 0

 --GIAO DICH SE LENH
  UNION ALL

  SELECT  MAX(TL.TXDATE) TXDATE,MAX(TL.BUSDATE) BUSDATE, MAX(TL.TXNUM) TXNUM,MAX(TO_CHAR(TL.TXDESC)) DESCRIPTION,0 CRAMT_CI,0 DRAMT_CI,
          SUM(CASE WHEN APP.TXTYPE='C' THEN SETR.NAMT ELSE 0 END)CRAMT_SE,
          SUM(CASE WHEN APP.TXTYPE='D' THEN SETR.NAMT ELSE 0 END)DRAMT_SE,
          MAX(TO_CHAR(SB.SYMBOL)) SYMBOL
  FROM (SELECT txdate , txnum ,txdesc ,busdate,tltxcd,deltd FROM TLLOG WHERE BUSDATE >= TO_DATE (F_DATE, 'DD/MM/YYYY') AND BUSDATE <= TO_DATE (T_DATE, 'DD/MM/YYYY')
                    AND TLTXCD  IN( '8824' ,'8823', '8868', '8867')) TL,
     APPTX APP,( SELECT * FROM  SETRAN WHERE SUBSTR(ACCTNO,1,10) =  V_STRAFACCTNO  ) SETR,
     SBSECURITIES SB

  WHERE   TL.TXNUM = SETR.TXNUM
     and  SETR.TXCD = APP.TXCD
     AND SB.CODEID=SUBSTR (SETR.ACCTNO, 11, 6)
     AND APP.TXTYPE IN ('C', 'D')
     AND APP.FIELD IN('TRADE','SECURED','MORTAGE')
     AND  SETR.NAMT<>0
     AND TL.DELTD<>'Y'
     AND TL.TXDATE =SETR.TXDATE
        AND    INSTR( (CASE WHEN NVL(ONL,'ALL' )='ALL' THEN TL.TLTXCD  ELSE ONL END )  ,TL.TLTXCD )>0
      GROUP BY SETR.REF,APP.TXTYPE,TL.TLTXCD
      HAVING SUM(CASE WHEN APP.TXTYPE='D' THEN -SETR.NAMT ELSE SETR.NAMT END) <> 0
  UNION ALL
     SELECT  MAX(TL.TXDATE) TXDATE,MAX(TL.BUSDATE) BUSDATE, MAX(TL.TXNUM) TXNUM,MAX(TO_CHAR(TL.TXDESC)) DESCRIPTION,0 CRAMT_CI,0 DRAMT_CI,
          SUM(CASE WHEN APP.TXTYPE='C' THEN SETR.NAMT ELSE 0 END)CRAMT_SE,
          SUM(CASE WHEN APP.TXTYPE='D' THEN SETR.NAMT ELSE 0 END)DRAMT_SE,
          MAX(TO_CHAR(SB.SYMBOL)) SYMBOL
  FROM (SELECT txdate , txnum ,txdesc ,busdate,tltxcd,deltd FROM TLLOGALL WHERE BUSDATE >= TO_DATE (F_DATE, 'DD/MM/YYYY') AND BUSDATE <= TO_DATE (T_DATE, 'DD/MM/YYYY')
                    AND TLTXCD  IN( '8824' ,'8823', '8868', '8867')) TL,
     APPTX APP,( SELECT SETRANA.* FROM  SETRANA , SEMAST  WHERE   SETRANA.acctno = SEMAST.acctno  AND  SEMAST.AFACCTNO =  V_STRAFACCTNO ) SETR,
     SBSECURITIES SB
  WHERE   TL.TXNUM = SETR.TXNUM
      AND SETR.TXCD = APP.TXCD
     AND SB.CODEID=SUBSTR (SETR.ACCTNO, 11, 6)
     AND APP.APPTYPE = 'SE'
     AND APP.TXTYPE IN ('C', 'D')
     AND APP.FIELD IN('TRADE','SECURED','MORTAGE')
     AND  SETR.NAMT<>0
     AND TL.DELTD<>'Y'
     AND TL.TXDATE =SETR.TXDATE
     AND    INSTR( (CASE WHEN NVL(ONL,'ALL' )='ALL' THEN TL.TLTXCD  ELSE ONL END )  ,TL.TLTXCD )>0
     GROUP BY SETR.REF,APP.TXTYPE,TL.TLTXCD
     HAVING SUM(CASE WHEN APP.TXTYPE='D' THEN -SETR.NAMT ELSE SETR.NAMT END) <> 0
                              ) V
     ORDER BY V.BUSDATE)DT
   WHERE DT.ROWN BETWEEN (NVL(CURRENT_INDEX,1)-1)*NVL(OFFSET_NUMBER,1000000) +1 AND NVL(CURRENT_INDEX,1)*NVL(OFFSET_NUMBER,1000000)

 ;


EXCEPTION
   WHEN OTHERS
   THEN
      RETURN;
END;                                                              -- PROCEDURE

 
 
 
 
/
