SET DEFINE OFF;
CREATE OR REPLACE FORCE VIEW V_GETSECORDERINFO
(CUSTODYCD, AFACCTNO, SYMBOL, CODEID, REFIDTRADE, 
 REFIDMTG, TRADE, MORTAGE, SECUREAMT, SECUREMTG)
BEQUEATH DEFINER
AS 
(
SELECT cf.CUSTODYCD, A.AFACCTNO, B.SYMBOL,B.CODEID, NVL(ORDERID,'') REFIDTRADE, NVL(A.REFIDMTG,'') REFIDMTG ,
    A.TRADE-nvl(A.SECUREAMT,0)-nvl(A.SECUREAMTPT,0)+nvl(D.RECEIVING,0) TRADE, A.DFMORTAGE-nvl(D.SECUREMTG,0) MORTAGE,
            nvl(A.SECUREAMT,0) SECUREAMT,nvl(D.SECUREMTG,0) SECUREMTG
    FROM     SBSECURITIES B,
     (SELECT CODEID, BASICPRICE, TXDATE FROM SECURITIES_INFO WHERE TXDATE = (select to_date(VARVALUE,'DD/MM/YYYY') from sysvar where grname='SYSTEM' and varname='CURRDATE') ) C,

    (SELECT ORDERID,afacctno,SEACCTNO,CODEID,  SUM(SECUREAMT) SECUREAMT, SUM(SECUREMTG) SECUREMTG, SUM(RECEIVING) RECEIVING     FROM
                    (SELECT OD.ORDERID, od.afacctno, OD.SEACCTNO, OD.CODEID,
                    CASE WHEN OD.EXECTYPE IN ('NS', 'SS') AND OD.TXDATE =(select to_date(VARVALUE,'DD/MM/YYYY') from sysvar where grname='SYSTEM' and varname='CURRDATE') THEN REMAINQTTY + EXECQTTY ELSE 0 END SECUREAMT,
                                  CASE WHEN OD.EXECTYPE = 'MS'  AND OD.TXDATE =(select to_date(VARVALUE,'DD/MM/YYYY') from sysvar where grname='SYSTEM' and varname='CURRDATE') THEN REMAINQTTY + EXECQTTY ELSE 0 END SECUREMTG,
                    CASE WHEN OD.EXECTYPE = 'NB' THEN ST.QTTY ELSE 0 END RECEIVING           FROM ODMAST OD, STSCHD ST, ODTYPE TYP
                    WHERE OD.DELTD <> 'Y'  AND OD.EXECTYPE IN ('NS', 'SS','MS', 'NB')               AND OD.ORDERID = ST.ORGORDERID(+) AND ST.DUETYPE(+) = 'RS'
                                   And OD.ACTYPE = TYP.ACTYPE
                     AND (
                            (TYP.TRANDAY <= (SELECT SUM(CASE WHEN CLDR.HOLIDAY = 'Y' THEN 0 ELSE 1 END)-1
                                  FROM SBCLDR CLDR WHERE CLDR.CLDRTYPE = '000' AND CLDR.SBDATE >= ST.TXDATE AND
                                  CLDR.SBDATE <= (select to_date(VARVALUE,'DD/MM/YYYY') from sysvar where grname='SYSTEM' and varname='CURRDATE'))
                                  AND OD.EXECTYPE = 'NB') OR OD.EXECTYPE IN ('NS','SS','MS')
                         )
                     )
            WHERE SECUREAMT + SECUREMTG + RECEIVING >0
      GROUP BY ORDERID,SEACCTNO,CODEID,afacctno) D, AFMAST AF, CFMAST CF,
      (--SELECT NVL(V.SECUREAMT,0) SECUREAMT , NVL(V.SECUREMTG,0) SECUREMTG,A.* FROM SEMAST A LEFT JOIN v_getsellorderinfo V ON A.ACCTNO=V.SEACCTNO
        SELECT NVL(DF.ACCTNO,'') REFIDMTG, NVL(DF.DFQTTY,0) DFMORTAGE, A.* FROM (SELECT NVL(V.SECUREAMT,0) SECUREAMT, NVL(V.SECUREAMTPT,0) SECUREAMTPT ,A.*
            FROM SEMAST A LEFT JOIN (SELECT SEACCTNO, SUM(SECUREAMT) SECUREAMT,  SUM(SECUREAMTPT) SECUREAMTPT, SUM(SECUREMTG) SECUREMTG, SUM(RECEIVING) SERECEIVING
 FROM (
    SELECT OD.SEACCTNO,
           CASE WHEN OD.EXECTYPE IN ('NS', 'SS') AND OD.MATCHTYPE<>'P' THEN to_number(nvl(varvalue,0))* REMAINQTTY + EXECQTTY  ELSE 0 END SECUREAMT,
           CASE WHEN OD.EXECTYPE IN ('NS', 'SS') AND OD.MATCHTYPE='P' THEN to_number(nvl(varvalue,0))* REMAINQTTY + EXECQTTY  ELSE 0 END SECUREAMTPT,
           CASE WHEN OD.EXECTYPE = 'MS'  THEN to_number(nvl(varvalue,0)) * REMAINQTTY + EXECQTTY ELSE 0 END SECUREMTG,
           0 RECEIVING
       FROM ODMAST OD, ODTYPE TYP, SYSVAR SY
       WHERE OD.STSSTATUS='N' AND OD.EXECTYPE IN ('NS', 'SS','MS')
           and sy.grname='SYSTEM' and sy.varname='HOSTATUS'
           And OD.ACTYPE = TYP.ACTYPE
           AND OD.TXDATE =(select to_date(VARVALUE,'DD/MM/YYYY') from sysvar where grname='SYSTEM' and varname='CURRDATE')
           AND NVL(OD.GRPORDER,'N')<>'Y'
    )
GROUP BY SEACCTNO) V ON A.ACCTNO=V.SEACCTNO) A
              LEFT JOIN DFMAST DF ON A.ACCTNO=DF.AFACCTNO||DF.CODEID AND NVL(DEALTYPE,'N')='N' AND DF.DFQTTY>0
      ) A

WHERE A.CODEID = B.CODEID AND A.CODEID = C.CODEID (+) AND A.ACCTNO=D.SEACCTNO(+)
    AND a.afacctno=af.acctno and cf.custid=af.custid
    AND A.TRADE + A.DFMORTAGE-nvl(D.SECUREMTG,0)-nvl(D.SECUREAMT,0)+nvl(D.RECEIVING,0) <> 0 AND  B.SECTYPE <>'004'

)
/