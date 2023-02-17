SET DEFINE OFF;
CREATE OR REPLACE FORCE VIEW V_ORDERUPCOM
(ORDERID, REFORDERID, TRADEPLACE, AFACCTNO, CUSTODYCD, 
 SYMBOL, ORSTATUS, EDSTATUS, ACTYPE, VIA, 
 MAKER, OFFICER, MAKETIME, APPRTIME, SENDTIME, 
 TIMETYPE, TXNUM, TXDATE, EXPDATE, BRATIO, 
 EXECTYPE, NORK, MATCHTYPE, CLEARDAY, CLEARCD, 
 PRICETYPE, QUOTEPRICE, STOPPRICE, LIMITPRICE, ORDERQTTY, 
 REMAINQTTY, EXECQTTY, STANDQTTY, CANCELQTTY, ADJUSTQTTY, 
 REJECTQTTY, REJECTCD, EXPRICE, EXQTTY, DELTD, 
 MAPORDERID, FOACCTNO, PUTTYPE, CONTRAORDERID, CONTRAFRM)
BEQUEATH DEFINER
AS 
SELECT OD.ORDERID ORDERID, OD.REFORDERID,A0.CDCONTENT TRADEPLACE,SUBSTR (OD.AFACCTNO, 1, 4) || '.'|| SUBSTR (OD.AFACCTNO, 5, 6) AFACCTNO,
SUBSTR (CF.CUSTODYCD, 1, 3) || '.'|| SUBSTR (CF.CUSTODYCD, 4, 1)|| '.' || SUBSTR (CF.CUSTODYCD, 5, 6) CUSTODYCD,
SE.SYMBOL SYMBOL, A1.CDCONTENT ORSTATUS,A10.CDCONTENT EDSTATUS, OT.TYPENAME ACTYPE,A2.CDCONTENT VIA, MK.TLNAME MAKER, OFC.TLNAME OFFICER,
OD.TXTIME MAKETIME,NVL(TLG.OFFTIME,'____') APPRTIME,NVL(OD.SENDTIME,'____') SENDTIME,A3.CDCONTENT TIMETYPE, OD.TXNUM, OD.TXDATE, OD.EXPDATE,
OD.BRATIO, A4.CDCONTENT EXECTYPE, OD.NORK, A5.CDCONTENT MATCHTYPE,OD.CLEARDAY, A6.CDCONTENT CLEARCD, A7.CDCONTENT PRICETYPE,OD.QUOTEPRICE, OD.STOPPRICE, OD.LIMITPRICE, OD.ORDERQTTY,
OD.REMAINQTTY, OD.EXECQTTY, OD.STANDQTTY, OD.CANCELQTTY, OD.ADJUSTQTTY,OD.REJECTQTTY, A8.CDCONTENT REJECTCD, OD.EXPRICE, OD.EXQTTY,
A9.CDCONTENT DELTD,OD.MAPORDERID ,OD.FOACCTNO,OD.PUTTYPE,OD.CONTRAORDERID,OD.CONTRAFRM
FROM AFMAST AF,CFMAST CF,SBSECURITIES SE,ODTYPE OT,ALLCODE A0,ALLCODE A1,ALLCODE A2,
ALLCODE A3,ALLCODE A4,ALLCODE A5,ALLCODE A6,ALLCODE A7,ALLCODE A8,ALLCODE A9,ALLCODE A10,
(
    SELECT OD.*, OOD.TXTIME SENDTIME FROM
        (
            SELECT OD.*, NVL(BK.ORDERNUMBER,'') MAPORDERID FROM ODMAST OD, STCORDERBOOK BK WHERE OD.ORDERID=BK.ORDERID (+)
            UNION ALL
            SELECT OD.*, NVL(BK.ORDERNUMBER,'') MAPORDERID FROM ODMASTHIST OD, STCORDERBOOKHIST BK WHERE OD.ORDERID=BK.ORDERID (+)
            AND OD.TXDATE >=TO_DATE ((SELECT VARVALUE FROM SYSVAR WHERE VARNAME = 'DUEDATE' AND GRNAME = 'SYSTEM'),'DD/MM/YYYY')
         ) OD,
        (SELECT TXTIME ,ORGORDERID,oodstatus FROM OOD) OOD,
        SBSECURITIES SB
    WHERE OD.ORDERID=OOD.ORGORDERID(+) AND OD.CODEID=SB.CODEID
    AND OD.MATCHTYPE='P' AND OD.TIMETYPE='T' AND SB.TRADEPLACE='005' AND SB.STATUS='Y' AND SB.SECTYPE='001'
    AND OD.PUTTYPE='N' AND OOD.oodstatus='N' AND OD.ORDERID NOT IN (SELECT NVL(CONTRAORDERID,'XXX') FROM ODMAST)
) OD,
(SELECT TLID, TLNAME FROM TLPROFILES UNION ALL  SELECT '____' TLID, '____' TLNAME FROM DUAL UNION ALL  SELECT '0000' TLID, 'Auto' TLNAME FROM DUAL) MK,
(SELECT TLID, TLNAME FROM TLPROFILES UNION ALL  SELECT '____' TLID, '____' TLNAME FROM DUAL UNION ALL  SELECT '0000' TLID, 'Auto' TLNAME FROM DUAL) OFC,
(
    SELECT TXDATE, TXNUM, TLID, OFFID, TXTIME, OFFTIME, TLTXCD, DELTD,TXSTATUS FROM TLLOG
    UNION ALL SELECT TXDATE, TXNUM, TLID, OFFID, TXTIME, OFFTIME, TLTXCD, DELTD,TXSTATUS FROM TLLOGALL
) TLG
WHERE OD.AFACCTNO = AF.ACCTNO AND AF.CUSTID = CF.CUSTID AND OD.CODEID = SE.CODEID AND OD.ACTYPE = OT.ACTYPE
AND A10.CDTYPE = 'OD' AND A10.CDNAME = 'EDSTATUS' AND A10.CDVAL = OD.EDSTATUS
AND A0.CDTYPE = 'OD' AND A0.CDNAME = 'TRADEPLACE' AND A0.CDVAL = SE.TRADEPLACE AND A2.CDTYPE = 'OD' AND A2.CDNAME = 'VIA'
AND A2.CDVAL = OD.VIA AND A3.CDTYPE = 'OD' AND A3.CDNAME = 'TIMETYPE' AND A3.CDVAL = OD.TIMETYPE AND A4.CDTYPE = 'OD'
AND A4.CDNAME = 'EXECTYPE' AND A4.CDVAL = OD.EXECTYPE AND A5.CDTYPE = 'OD' AND A5.CDNAME = 'MATCHTYPE' AND A5.CDVAL = OD.MATCHTYPE
AND A6.CDTYPE = 'OD' AND A6.CDNAME = 'CLEARCD' AND A6.CDVAL = OD.CLEARCD AND A7.CDTYPE = 'OD' AND A7.CDNAME = 'PRICETYPE'
AND A7.CDVAL = OD.PRICETYPE AND A8.CDTYPE = 'OD' AND A8.CDNAME = 'REJECTCD' AND A8.CDVAL = OD.REJECTCD AND A9.CDTYPE = 'SY'
AND A9.CDNAME = 'YESNO' AND A9.CDVAL = OD.DELTD AND NVL(TLG.TLID,'____') = MK.TLID AND NVL( TLG.OFFID,'____') =OFC.TLID
AND OD.TXDATE = TLG.TXDATE AND OD.TXNUM = TLG.TXNUM AND A1.CDNAME = 'ORSTATUS'
AND (CASE
        WHEN (TLG.OFFID IS NULL) AND TLG.TLTXCD NOT IN ('8874','8875','8876', '8877', '8882', '8883', '8884', '8885','8890','8891','8886') THEN '9'
        WHEN (TLG.OFFID IS NOT NULL) AND TLG.TXSTATUS = '5' THEN '6' WHEN (TLG.OFFID IS NOT NULL) AND TLG.TXSTATUS = '8' THEN '0'
        ELSE OD.ORSTATUS END
    ) = A1.CDVAL
AND OD.CONTRAFRM IS NULL
/
