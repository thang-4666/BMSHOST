SET DEFINE OFF;
CREATE OR REPLACE PROCEDURE "CF0066"
   (
   PV_REFCURSOR   IN OUT   PKG_REPORT.REF_CURSOR,
   OPT            IN       VARCHAR2,
   pv_BRID           IN       VARCHAR2,
   TLGOUPS        IN       VARCHAR2,
   TLSCOPE        IN       VARCHAR2

   ) IS


   V_STROPT         VARCHAR2(5);
   V_STRBRID        VARCHAR2(100);


BEGIN

      V_STROPT := OPT;

   IF (V_STROPT <> 'A') AND (pv_BRID <> 'ALL')
   THEN
      V_STRBRID := pv_BRID;
   ELSE
      V_STRBRID := '%%';
   END IF;


     ---GET REPORT DATA:

OPEN PV_REFCURSOR
FOR

     SELECT CFT.ACTYPE CFTYPE, CFT.TYPENAME CFNAME,AF.ACTYPE AFTYPE, AF.TYPENAME AFNAME FROM CFTYPE CFT, CFAFTYPE CFA, AFTYPE AF
     WHERE CFT.ACTYPE=CFA.CFTYPE
           AND CFA.AFTYPE=AF.ACTYPE
     ORDER BY CFT.ACTYPE, AF.ACTYPE
         ;


EXCEPTION
    WHEN OTHERS THEN
        RETURN ;
END; -- Procedure

 
 
 
 
/
