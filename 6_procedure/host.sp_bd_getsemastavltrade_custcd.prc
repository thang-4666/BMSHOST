SET DEFINE OFF;
CREATE OR REPLACE PROCEDURE "SP_BD_GETSEMASTAVLTRADE_CUSTCD" (PV_REFCURSOR IN OUT PKG_REPORT.REF_CURSOR, CUSTODYCD IN VARCHAR2)
  IS
  V_PARAFILTER VARCHAR2(10);
BEGIN
    V_PARAFILTER:=CUSTODYCD;
    OPEN PV_REFCURSOR FOR
    SELECT SB.SYMBOL, MAX(MST.TRADE)-MAX(NVL(REFORDER.SECUREAMT,0)) TRADE_QTTY,MAX(NVL(DFDEAL.DFTRADING ,0)) MORTGAGE_QTTY
    FROM SEMAST MST, SBSECURITIES SB, V_GETSELLORDERINFO REFORDER,CFMAST CF,
    ( SELECT DF.AFACCTNO,SUM(DF.DFTRADING) DFTRADING,DF.CODEID,(DF.AFACCTNO||DF.CODEID) SEACCTNO
     FROM V_GETDEALINFO DF GROUP BY df.AFACCTNO,DF.CODEID) DFDEAL
    WHERE MST.CODEID=SB.CODEID AND SB.SECTYPE<>'004' AND MST.CUSTID=CF.CUSTID AND CF.CUSTODYCD=V_PARAFILTER
    AND MST.ACCTNO=REFORDER.SEACCTNO (+) AND mst.acctno=dfdeal.seacctno(+)
    GROUP BY MST.CUSTID, SB.SYMBOL HAVING( MAX(MST.TRADE)-MAX(NVL(REFORDER.SECUREAMT,0))>0
                                             OR MAX(DFDEAL.DFTRADING ) >0) ;
EXCEPTION
    WHEN others THEN
        return;
END;

 
 
 
 
/
