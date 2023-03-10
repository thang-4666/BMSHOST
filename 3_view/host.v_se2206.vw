SET DEFINE OFF;
CREATE OR REPLACE FORCE VIEW V_SE2206
(SUBACCTNO, SYMBOL, TOTAL_QTTY, TRADE_QTTY, WTRADE, 
 DEALFINANCING_QTTY, ORDERQTTY_NORMAL, ORDERQTTY_BLOCKED, ORDERQTTY_BUY, MORTGAGE_QTTY, 
 NETTING_QTTY, BLOCKED_QTTY, SECURITIES_RECEIVING_T0, SECURITIES_RECEIVING_T1, SECURITIES_RECEIVING_T2, 
 SECURITIES_RECEIVING_T3, SECURITIES_RECEIVING_TN, SECURITIES_SENDING_T0, SECURITIES_SENDING_T1, SECURITIES_SENDING_T2, 
 SECURITIES_SENDING_T3, SECURITIES_SENDING_TN, FULLNAME, IDCODE, ADDRESS, 
 CUSTODYCD)
BEQUEATH DEFINER
AS 
SELECT vw."SUBACCTNO",vw."SYMBOL",vw."TOTAL_QTTY",vw."TRADE_QTTY",vw."WTRADE",vw."DEALFINANCING_QTTY",vw."ORDERQTTY_NORMAL",vw."ORDERQTTY_BLOCKED",vw."ORDERQTTY_BUY",vw."MORTGAGE_QTTY",vw."NETTING_QTTY",vw."BLOCKED_QTTY",vw."SECURITIES_RECEIVING_T0",vw."SECURITIES_RECEIVING_T1",vw."SECURITIES_RECEIVING_T2",vw."SECURITIES_RECEIVING_T3",vw."SECURITIES_RECEIVING_TN",vw."SECURITIES_SENDING_T0",vw."SECURITIES_SENDING_T1",vw."SECURITIES_SENDING_T2",vw."SECURITIES_SENDING_T3",vw."SECURITIES_SENDING_TN", cf.fullname,cf.idcode,cf.address,cf.custodycd FROM
(SELECT MST.AFACCTNO SUBACCTNO,SB.SYMBOL, MAX(MST.TRADE+MST.MORTAGE+MST.BLOCKED+MST.NETTING+MST.WTRADE) TOTAL_QTTY,
    MAX(MST.TRADE)-MAX(NVL(REFORDER.SECUREAMT,0)) TRADE_QTTY,MAX(MST.WTRADE) WTRADE, MAX(NVL(DF.DEALQTTY,0)) DEALFINANCING_QTTY,
    MAX(NVL(REFORDER.SECUREAMT,0)) ORDERQTTY_NORMAL, MAX(NVL(REFORDER.SECUREMTG,0)) ORDERQTTY_BLOCKED,
    MAX(NVL(REFORDER_BUY.SERECEIVING,0)) ORDERQTTY_BUY, MAX(-MST.STANDING) MORTGAGE_QTTY,
    MAX(MST.NETTING) NETTING_QTTY, MAX(MST.BLOCKED) BLOCKED_QTTY,
    SUM(CASE WHEN ST.DUETYPE='RS' AND ST.TDAY=0 THEN ST.ST_QTTY-ST.ST_AQTTY ELSE 0 END) SECURITIES_RECEIVING_T0,
    SUM(CASE WHEN ST.DUETYPE='RS' AND ST.TDAY=1 THEN ST.ST_QTTY-ST.ST_AQTTY ELSE 0 END) SECURITIES_RECEIVING_T1,
    SUM(CASE WHEN ST.DUETYPE='RS' AND ST.TDAY=2 THEN ST.ST_QTTY-ST.ST_AQTTY ELSE 0 END) SECURITIES_RECEIVING_T2,
    SUM(CASE WHEN ST.DUETYPE='RS' AND ST.TDAY=3 THEN ST.ST_QTTY-ST.ST_AQTTY ELSE 0 END) SECURITIES_RECEIVING_T3,
    SUM(CASE WHEN ST.DUETYPE='RS' AND ST.TDAY>3 THEN ST.ST_QTTY-ST.ST_AQTTY ELSE 0 END) SECURITIES_RECEIVING_TN,
    SUM(CASE WHEN ST.DUETYPE='SS' AND ST.NDAY=0 THEN ST.ST_QTTY-ST.ST_AQTTY ELSE 0 END) SECURITIES_SENDING_T0,
    SUM(CASE WHEN ST.DUETYPE='SS' AND ST.NDAY=-1 THEN ST.ST_QTTY-ST.ST_AQTTY ELSE 0 END) SECURITIES_SENDING_T1,
    SUM(CASE WHEN ST.DUETYPE='SS' AND ST.NDAY=-2 THEN ST.ST_QTTY-ST.ST_AQTTY ELSE 0 END) SECURITIES_SENDING_T2,
    SUM(CASE WHEN ST.DUETYPE='SS' AND ST.NDAY=-3 THEN ST.ST_QTTY-ST.ST_AQTTY ELSE 0 END) SECURITIES_SENDING_T3,
    SUM(CASE WHEN ST.DUETYPE='SS' AND ST.NDAY<-3 THEN ST.ST_QTTY-ST.ST_AQTTY ELSE 0 END) SECURITIES_SENDING_TN

    FROM SEMAST MST, AFMAST AF, CFMAST CF, (SELECT * FROM SBSECURITIES WHERE SECTYPE<>'004') SB, V_GETSELLORDERINFO REFORDER,V_GETBUYORDERINFO_BY_SYMBOL REFORDER_BUY,
    (SELECT DF.CODEID, DF.AFACCTNO,  SUM(DF.DFQTTY+DF.RCVQTTY+DF.BLOCKQTTY+DF.CARCVQTTY) DEALQTTY
    FROM DFMAST DF WHERE DF.STATUS IN ('P','A','N') GROUP BY DF.CODEID, DF.AFACCTNO) DF,
    (SELECT * FROM VW_BD_PENDING_SETTLEMENT WHERE DUETYPE='RS' OR DUETYPE='SS') ST
    WHERE MST.AFACCTNO=AF.ACCTNO AND AF.CUSTID=CF.CUSTID AND MST.CODEID=SB.CODEID
    AND MST.ACCTNO=REFORDER.SEACCTNO (+) AND MST.ACCTNO=REFORDER_BUY.SEACCTNO (+) AND MST.CODEID=DF.CODEID (+) AND MST.AFACCTNO=DF.AFACCTNO (+) AND MST.AFACCTNO=ST.AFACCTNO (+) AND MST.CODEID=ST.CODEID (+)
    GROUP BY MST.AFACCTNO, SB.SYMBOL) vw, cfmast cf ,afmast
    WHERE vw.SUBACCTNO=afmast.acctno AND afmast.custid=cf.custid
/
