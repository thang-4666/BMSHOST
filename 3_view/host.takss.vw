SET DEFINE OFF;
CREATE OR REPLACE FORCE VIEW TAKSS
(ROWN, ORDERID, TXDATE, CUSTODYCD, EXECTYPE, 
 SYMBOL, QUOTEPRICE, ORDERQTTY, CIACCTNO, FULLNAME, 
 FEEACR, TRADEPLACE, EXECAMT, MATCHQTTY, MATCHPRICE, 
 VAL_IOD, PERFEE)
BEQUEATH DEFINER
AS 
(
SELECT  ROWNUM ROWN,T."ORDERID",T."TXDATE",T."CUSTODYCD",T."EXECTYPE",T."SYMBOL",T."QUOTEPRICE",T."ORDERQTTY",T."CIACCTNO",T."FULLNAME",T."FEEACR",T."TRADEPLACE",T."EXECAMT", NVL(IO.MATCHQTTY,0) MATCHQTTY,NVL(IO.MATCHPRICE,0) MATCHPRICE,NVL(IO.MATCHQTTY,0)*NVL(IO.MATCHPRICE,0) VAL_IOD ,
     round((CASE  WHEN  NVL(T.EXECAMT,0)= 0   THEN 0 ELSE T.FEEACR *100/NVL(T.EXECAMT,0) END ),4) PERFEE
      FROM (SELECT OD.ORDERID,OD.TXDATE,cf.custodycd,
            (CASE  WHEN OD.EXECTYPE IN('NB','BC','NS','SS') AND OD.REFORDERID IS NOT NULL AND OD.CORRECTIONNUMBER = 0 THEN 'C'  ELSE OD.EXECTYPE END)EXECTYPE
            ,SB.SYMBOL,(CASE WHEN OD.PRICETYPE IN ('ATO','ATC')THEN  OD.PRICETYPE  ELSE  TO_CHAR(OD.QUOTEPRICE) END )QUOTEPRICE ,
             OD.ORDERQTTY,OD.CIACCTNO,CF.FULLNAME,OD.FEEACR,
             SB.TRADEPLACE TRADEPLACE, ( CASE WHEN OD.EXECAMT > OD.MATCHAMT THEN OD.EXECAMT ELSE OD.MATCHAMT END  ) EXECAMT
               FROM
           ( SELECT* FROM ODMAST   WHERE DELTD <> 'Y' UNION ALL SELECT * FROM ODMASTHIST   WHERE DELTD<>'Y' )OD,
             SBSECURITIES SB,AFMAST AF ,CFMAST CF
             WHERE  OD.CODEID = SB.CODEID
                   AND OD.CIACCTNO = AF.ACCTNO
                   AND AF.CUSTID = CF.CUSTID
                   AND OD.TXDATE >= TO_DATE ('01/10/2010', 'DD/MM/YYYY')
                   AND OD.TXDATE <= TO_DATE ('03/11/2010', 'DD/MM/YYYY')
                   AND SB.SYMBOL in ('KSS')
                   AND AF.ACCTNO like '%'
           AND cf.custodycd like '%'
                   AND OD.EXECTYPE like '%'
               )T
              LEFT JOIN
                  ( SELECT * FROM IOD WHERE DELTD<>'Y'UNION ALL  SELECT * FROM IODHIST  WHERE DELTD<>'Y' ) IO
             ON IO.ORGORDERID=T.ORDERID

             )
/
