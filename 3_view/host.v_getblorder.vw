SET DEFINE OFF;
CREATE OR REPLACE FORCE VIEW V_GETBLORDER
(TRADERID, BLACCTNO, CUSTODYCD, AFACCTNO, ORDERID, 
 EXECTYPE, PRICETYPE, DESC_EXECTYPE, SYMBOL, ORDERQTTY, 
 QUOTEPRICE, STATUS, DESC_STATUS, DESC_PRICETYPE, EXECQTTY, 
 EXECAMT, REMAINQTTY, CANCELQTTY, ADJUSTQTTY, CANCELSTATUS, 
 AMENDSTATUS, TRADEPLACE, EDSTATUS, TIMETYPE, ORSTATUSVALUE, 
 TIMETYPEVALUE, MATCHTYPEVALUE, FOACCTNO, ERR_DESC, TRADEPLACEVL, 
 TXTIME)
BEQUEATH DEFINER
AS 
(
SELECT F.TRADERID, BL.BLACCTNO, CF.CUSTODYCD, AF.ACCTNO AFACCTNO, MST.ORDERID, MST.EXECTYPE,
                MST.PRICETYPE, CD2.CDCONTENT DESC_EXECTYPE, TO_CHAR(SB.SYMBOL) SYMBOL, 
                MST.ORDERQTTY,MST.QUOTEPRICE, MST.ORSTATUS STATUS, CD1.CDCONTENT DESC_STATUS, 
                CD7.CDCONTENT DESC_PRICETYPE, MST.EXECQTTY, MST.EXECAMT, MST.REMAINQTTY, MST.CANCELQTTY, MST.ADJUSTQTTY,
                (CASE WHEN MST.CANCELQTTY>0 THEN 'CANCELLED'  WHEN MST.EDITSTATUS='C' THEN 'CANCELLING' ELSE '----' END) CANCELSTATUS,
                (CASE WHEN MST.ADJUSTQTTY>0 THEN 'AMENDED'  WHEN MST.EDITSTATUS='A' THEN 'AMENDING' ELSE '----' END) AMENDSTATUS,
                CD10.CDCONTENT TRADEPLACE,MST.EDITSTATUS EDSTATUS,CD4.CDCONTENT TIMETYPE,
                MST.ORSTATUSVALUE,MST.TIMETYPE TIMETYPEVALUE, MST.MATCHTYPE MATCHTYPEVALUE,
            CASE WHEN MST.ORDERID = F.ORGACCTNO THEN F.ACCTNO ELSE MST.ORDERID END FOACCTNO, '' ERR_DESC, SB.TRADEPLACE TRADEPLACEVL,
                MST.TXTIME
            FROM CFMAST CF, AFMAST AF, (SELECT * FROM OOD UNION SELECT * FROM OODHIST) OOD,
                (SELECT MST.*,
                    (CASE WHEN MST.REMAINQTTY <> 0 AND MST.EDITSTATUS='C' THEN 'C'
                    WHEN MST.REMAINQTTY <> 0 AND MST.EDITSTATUS='A' THEN 'A'
                    WHEN MST.EDITSTATUS IS NULL AND MST.CANCELQTTY <> 0 THEN '5'
                    WHEN MST.REMAINQTTY = 0 AND MST.CANCELQTTY <> 0 AND MST.EDITSTATUS='C' THEN '3'
                    WHEN MST.REMAINQTTY = 0 AND MST.ADJUSTQTTY>0 THEN '10'
                    WHEN MST.REMAINQTTY = 0 AND MST.EXECQTTY>0 AND MST.ORSTATUS = '4' THEN '12' ELSE MST.ORSTATUS END) ORSTATUSVALUE
                FROM
                    (SELECT OD1.*,OD2.EDSTATUS EDITSTATUS
                    FROM ODMAST OD1,(SELECT * FROM ODMAST WHERE EDSTATUS IN ('C','A')) OD2
                    WHERE OD1.ORDERID=OD2.REFORDERID(+) AND SUBSTR(OD1.EXECTYPE,1,1) <> 'C'
                        AND SUBSTR(OD1.EXECTYPE,1,1) <> 'A'
                        AND OD1.VIA = 'L'
                    ) MST
                ) MST,
                SBSECURITIES SB, ALLCODE CD1,ALLCODE CD2, ALLCODE CD4, ALLCODE CD7, ALLCODE CD10,FOMAST F, BL_TRADEREF BL
            WHERE MST.ORSTATUS <> '7' AND AF.ACCTNO=MST.AFACCTNO
                AND MST.ORDERID=OOD.ORGORDERID(+)
                AND BL.AFACCTNO = AF.ACCTNO AND BL.TRADERID = F.TRADERID AND BL.STATUS = 'A'
                AND CF.CUSTID=AF.CUSTID AND SB.CODEID = MST.CODEID
                AND CD1.CDTYPE ='OD' AND CD1.CDNAME='ORSTATUS'
                AND CD1.CDVAL= MST.ORSTATUSVALUE
                AND CD2.CDTYPE ='OD' AND CD2.CDNAME='BUFEXECTYPE' AND CD2.CDVAL=MST.EXECTYPE||MST.MATCHTYPE
                AND CD4.CDTYPE ='OD' AND CD4.CDNAME='TIMETYPE' AND CD4.CDVAL=MST.TIMETYPE
                AND CD10.CDTYPE ='OD' AND CD10.CDNAME='TRADEPLACE' AND CD10.CDVAL=SB.TRADEPLACE
                AND CD7.CDTYPE ='OD' AND CD7.CDNAME='PRICETYPE' AND CD7.CDVAL=MST.PRICETYPE 
               AND MST.ORDERID = F.ORGACCTNO(+) AND MST.EXECTYPE = F.EXECTYPE(+)
)
/
