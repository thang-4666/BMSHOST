SET DEFINE OFF;
CREATE OR REPLACE FORCE VIEW GET_ADVANCELINE_USER
(ACCTNO, ACCLIMITHIST, ACCLIMIT)
BEQUEATH DEFINER
AS 
SELECT U.ACCTNO, NVL(ACCLIMITHIST,0)-NVL(ACCLIMIT,0) ACCLIMITHIST, NVL(ACCLIMIT,0) ACCLIMIT FROM
    (
      SELECT ACCTNO,  SUM(ACCLIMIT) ACCLIMITHIST
      FROM USERAFLIMIT WHERE USERAFLIMIT.TYPERECEIVE ='T0'
      GROUP BY ACCTNO
     )U,
    (
      SELECT acctno, SUM(T0.allocatedlimit-T0.retrievedlimit) ACCLIMIT
      FROM t0limitschd T0
      GROUP BY acctno
    ) T0
    WHERE U.ACCTNO=T0.ACCTNO(+)
/
