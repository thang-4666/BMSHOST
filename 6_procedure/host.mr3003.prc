SET DEFINE OFF;
CREATE OR REPLACE PROCEDURE mr3003 (
   PV_REFCURSOR         IN OUT   PKG_REPORT.REF_CURSOR,
   p_OPT                IN       VARCHAR2,
   pv_BRID              IN       VARCHAR2,
   TLGOUPS              IN       VARCHAR2,
   TLSCOPE              IN       VARCHAR2,
   INMONTH              IN       VARCHAR2
  )
IS
--
-- BAO CAO DANH MUC CHUNG KHOAN THUC HIEN GIAO DICH KI QUY
-- MODIFICATION HISTORY
-- PERSON       DATE                COMMENTS
-- ---------   ------  -------------------------------------------
-- QUOCTA      17-02-2012           CREATED
-- NGOCVTT      23/07/1              EDIT

   CUR                      PKG_REPORT.REF_CURSOR;
    l_OPT varchar2(10);
    l_BRID varchar2(1000);
    l_BRID_FILTER varchar2(1000);

   V_FROMDATE       DATE;
   V_TODATE         DATE;
   V_CFROMDATE      DATE;
   V_CTODATE        DATE;
   V_CURRDATE       DATE;

   V_COUNTMR_HT     NUMBER(20,0);
   V_COUNTD_CK       NUMBER(20,0);
   V_COUNTM_CK       NUMBER(20,0);
   V_COUNTD_GK       NUMBER(20,0);
   V_COUNTM_GK       NUMBER(20,0);

   V_MR_BG      NUMBER(20,0);
   V_MR_END     NUMBER(20,0);
   V_PAID_END    NUMBER(20,0);
   V_RLS_BG     NUMBER(20,0);
   V_RLS_END    NUMBER(20,0);

   l_COUNTMRACC_BG          NUMBER(20,0);
   l_COUNTMRACC_END         NUMBER(20,0);
   l_MAXDEBT_BG                NUMBER(20,0);
   l_MAXDEBT_END                NUMBER(20,0);

   l_ODAMT_BG               NUMBER(20,0);
   l_ODAMT_END              NUMBER(20,0);

   l_SEREALASS_BG              NUMBER(20,0);
   l_SEREALASS_END              NUMBER(20,0);

   l_INTAMT_BG              NUMBER(20,0);
   l_INTAMT_END             NUMBER(20,0);

   l_FEEAMT_BG              NUMBER(20,0);
   l_FEEAMT_END             NUMBER(20,0);

   l_TOP5SYMBOL_BG             varchar2(200);
   l_TOP5SYMBOL_END             varchar2(200);

   l_totalMRAMT_BG         number(20,0);
   l_totalMRAMT_END        number(20,0);

   l_totalMRSE_BG         number(20,0);
   l_totalMRSE_END        number(20,0);

   l_OtherFee_BG              NUMBER(20,0);
   l_OtherFee_END             NUMBER(20,0);

BEGIN

   SELECT TO_DATE(VARVALUE, SYSTEMNUMS.C_DATE_FORMAT) INTO   V_CURRDATE
   FROM   SYSVAR  WHERE  grname = 'SYSTEM' AND varname = 'CURRDATE';

--SET THANG TRUOC
   IF TO_NUMBER(SUBSTR(INMONTH,1,2)) <= 12 THEN
        V_CFROMDATE := TO_DATE('01/' || SUBSTR(INMONTH,1,2) || '/' || SUBSTR(INMONTH,4,4),'DD/MM/RRRR');
    ELSE
        V_CFROMDATE := TO_DATE('31/12/9999','DD/MM/RRRR');
    END IF;

        V_CTODATE := LAST_DAY(V_CFROMDATE);

    SELECT TO_DATE(V_CFROMDATE,'DD/MM/RRRR')-1 INTO V_TODATE FROM DUAL;
    SELECT TO_DATE('01/' || SUBSTR(V_TODATE,4,2) || '/' || SUBSTR(V_TODATE,7,4),'DD/MM/RRRR') INTO V_FROMDATE FROM DUAL;


  --SO LUONG TAI KHOAN GIAO DICH KY QUY HIEN TAI
  SELECT COUNT(1) INTO V_COUNTMR_HT
  FROM AFMAST AF, AFTYPE AFT, MRTYPE MR
  WHERE AF.ACTYPE=AFT.ACTYPE AND AFT.MRTYPE=MR.ACTYPE
  AND MR.MRTYPE='T' AND AF.OPNDATE <= V_CURRDATE
 -- AND(AF.STATUS='A' OR (AF.STATUS <>'C' AND INSTR(af.pstatus,'A') <> 0));
  --AND(AF.STATUS='A' OR (AF.STATUS ='P' AND af.pstatus IS NOT NULL))
  AND      AF.status not in ('P','R','E')
      AND AF.producttype ='NM';
  -- SO LUONG DONG CUOI KY
     SELECT COUNT(AF.ACCTNO) INTO V_COUNTD_CK
    FROM VW_TLLOG_ALL TL,AFMAST AF, AFTYPE AFT, MRTYPE MR
    WHERE TL.TLTXCD = '2249'
    AND TL.DELTD<>'Y' AND AF.ACCTNO=TL.MSGACCT
    AND  AF.ACTYPE=AFT.ACTYPE AND AFT.MRTYPE=MR.ACTYPE
    AND MR.MRTYPE='T' AND TL.TXDATE >V_CTODATE
    AND TL.TXSTATUS  IN ('1','7');
   --SO LUONG MO CUOI KY
    SELECT COUNT(CUSTID) INTO V_COUNTM_CK FROM(
    SELECT AF.ACCTNO CUSTID
    FROM AFMAST AF, AFTYPE AFT, MRTYPE MR
    WHERE  AF.ACTYPE=AFT.ACTYPE AND AFT.MRTYPE=MR.ACTYPE
    AND MR.MRTYPE='T' AND AF.OPNDATE >V_CTODATE
    AND      AF.status not in ('P','R','E')
        AND AF.producttype ='NM'
    UNION ALL
    SELECT AF.ACCTNO CUSTID
    FROM VW_TLLOG_ALL TL,CFMAST CF,AFMAST AF, AFTYPE AFT, MRTYPE MR
    WHERE TL.TLTXCD = '0067'
    AND TL.DELTD<>'Y'
    AND CF.CUSTID=AF.CUSTID
    AND AF.ACTYPE=AFT.ACTYPE AND AFT.MRTYPE=MR.ACTYPE AND MR.MRTYPE='T'
    AND CF.CUSTID=TL.MSGACCT AND TL.TXDATE >V_CTODATE
    AND TL.TXSTATUS  IN ('1','7'));
    --SO LUONG DONG GIUA KY
     SELECT COUNT(AF.ACCTNO) INTO V_COUNTD_GK
    FROM VW_TLLOG_ALL TL,AFMAST AF, AFTYPE AFT, MRTYPE MR
    WHERE TL.TLTXCD = '2249'
    AND TL.DELTD<>'Y' AND AF.ACCTNO=TL.MSGACCT
    AND  AF.ACTYPE=AFT.ACTYPE AND AFT.MRTYPE=MR.ACTYPE
    AND MR.MRTYPE='T' AND TL.TXDATE BETWEEN V_CFROMDATE AND V_CTODATE
    AND TL.TXSTATUS  IN ('1','7');
    --SO LUONG MO GIUA KY
    SELECT COUNT(CUSTID) INTO V_COUNTM_GK FROM(
    SELECT AF.ACCTNO CUSTID
    FROM AFMAST AF, AFTYPE AFT, MRTYPE MR
    WHERE  AF.ACTYPE=AFT.ACTYPE AND AFT.MRTYPE=MR.ACTYPE
    AND MR.MRTYPE='T' AND AF.OPNDATE BETWEEN V_CFROMDATE AND V_CTODATE
    AND      AF.status not in ('P','R','E')
    AND AF.producttype ='NM'
    UNION ALL
    SELECT AF.ACCTNO CUSTID
    FROM VW_TLLOG_ALL TL,CFMAST CF,AFMAST AF, AFTYPE AFT, MRTYPE MR
    WHERE TL.TLTXCD = '0067'
    AND TL.DELTD<>'Y'
    AND CF.CUSTID=AF.CUSTID
    AND AF.ACTYPE=AFT.ACTYPE AND AFT.MRTYPE=MR.ACTYPE AND MR.MRTYPE='T'
    AND CF.CUSTID=TL.MSGACCT AND TL.TXDATE BETWEEN V_CFROMDATE AND V_CTODATE
    AND TL.TXSTATUS  IN ('1','7'));



  --- HAN MUC TIN DUNG GIAO DICH KI QUI (DAU KI NHU CUOI KI VA LAY HIEN TAI)
  select NVL(max(prlimit),0) INTO l_MAXDEBT_END from prmaster where POOLTYPE='SY';


  -- DU NO VAY HIEN TAI + DA TRA CUOI KY

    SELECT NVL(SUM(PRINNML+PRINOVD),0) INTO V_MR_END FROM LNMAST ;

    SELECT NVL(SUM(NAMT),0) INTO V_PAID_END FROM VW_CITRAN_GEN WHERE TLTXCD IN ('5540','5567') AND FIELD='BALANCE'
    AND INSTR(TRDESC,'g')>0 and txdate  > V_CTODATE;

  -- DU NO KHI GIAI NGAN CUOI KY
    SELECT NVL(SUM(LS.NML+LS.OVD+LS.PAID),0) AMT INTO V_RLS_END
    FROM VW_LNSCHD_ALL LS, VW_LNMAST_ALL LN
    WHERE LS.REFTYPE='P'
    AND LN.ACCTNO=LS.ACCTNO AND LS.RLSDATE > V_CTODATE
    AND LN.FTYPE='AF';
      -- DU NO VAY HIEN TAI + DA TRA GIUA KY

    SELECT NVL(SUM(NAMT),0) INTO V_MR_BG FROM VW_CITRAN_GEN WHERE TLTXCD IN ('5540','5567') AND FIELD='BALANCE'
    AND INSTR(TRDESC,'g')>0 and txdate BETWEEN V_CFROMDATE AND V_CTODATE;

  -- DU NO KHI GIAI NGAN GIUA KY
    SELECT NVL(SUM(LS.NML+LS.OVD+LS.PAID),0) AMT INTO V_RLS_BG
    FROM VW_LNSCHD_ALL LS, VW_LNMAST_ALL LN
    WHERE LS.REFTYPE='P'
    AND LN.ACCTNO=LS.ACCTNO AND LS.RLSDATE BETWEEN V_CFROMDATE AND V_CTODATE
    AND LN.FTYPE='AF' ;

  --- TONG GIA TRI CHUNG KHOAN KI QUY DAU KY

    SELECT NVL(SUM(GIA_TRI),0) into l_SEREALASS_BG  FROM
    (
          SELECT V_CURRDATE INDATE,SB.CODEID,SB.SYMBOL,RM.MRMAXQTTY,SB.BASICPRICE,RM.SEQTTY,RM.SEQTTY*SB.BASICPRICE GIA_TRI
          FROM SECURITIES_INFO SB, V_GETMARGINROOMINFO RM
          WHERE SB.CODEID=RM.CODEID
                AND (RM.MRMAXQTTY+RM.SEQTTY)<>0
          UNION ALL
          SELECT * FROM log_mr0056
      )  WHERE INDATE IN  ( SELECT MAX(INDATE)FROM( SELECT V_CURRDATE INDATE FROM DUAL
                          WHERE V_CURRDATE BETWEEN  V_FROMDATE AND V_TODATE
                          UNION ALL SELECT MAX(INDATE) INDATE FROM log_mr0056
                          WHERE INDATE BETWEEN  V_FROMDATE  AND V_TODATE));

  /*
    SELECT SUM(SEREAL) into l_SEREALASS_BG FROM tbl_mr3007_log LG,AFMAST AF, AFTYPE AFT,MRTYPE MR
    WHERE LG.AFACCTNO=AF.ACCTNO AND AF.actype = AFT.actype
        AND AFT.MRTYPE=MR.ACTYPE AND MR.MRTYPE='T'
        AND NVL(LG.SEASS,0)<>0
        AND LG.TXDATE IN (SELECT MAX(TXDATE) FROM tbl_mr3007_log
        WHERE substr(TXDATE,4,2)= SUBSTR(V_TODATE,4,2) AND substr(TXDATE,7,4)= SUBSTR(V_TODATE,7,4)) ;*/

    --- TONG GIA TRI CHUNG KHOAN KI QUY CUOI KY

      SELECT NVL(SUM(GIA_TRI),0) into l_SEREALASS_END  FROM
    (
          SELECT V_CURRDATE INDATE,SB.CODEID,SB.SYMBOL,RM.MRMAXQTTY,SB.BASICPRICE,RM.SEQTTY,RM.SEQTTY*SB.BASICPRICE GIA_TRI
          FROM SECURITIES_INFO SB, V_GETMARGINROOMINFO RM
          WHERE SB.CODEID=RM.CODEID
                AND (RM.MRMAXQTTY+RM.SEQTTY)<>0
          UNION ALL
          SELECT * FROM log_mr0056
      )  WHERE INDATE IN  ( SELECT MAX(INDATE)FROM( SELECT V_CURRDATE INDATE FROM DUAL
                          WHERE V_CURRDATE BETWEEN  V_CFROMDATE AND V_CTODATE
                          UNION ALL SELECT MAX(INDATE) INDATE FROM log_mr0056
                          WHERE INDATE BETWEEN  V_CFROMDATE  AND V_CTODATE));
/*
     SELECT SUM(SEREAL) into l_SEREALASS_END FROM tbl_mr3007_log LG,AFMAST AF, AFTYPE AFT,MRTYPE MR
    WHERE LG.AFACCTNO=AF.ACCTNO AND AF.actype = AFT.actype
        AND AFT.MRTYPE=MR.ACTYPE AND MR.MRTYPE='T'
        AND NVL(LG.SEASS,0)<>0
        AND LG.TXDATE IN (SELECT MAX(TXDATE) FROM tbl_mr3007_log
        WHERE substr(TXDATE,4,2)= SUBSTR(V_CTODATE,4,2) AND substr(TXDATE,7,4)= SUBSTR(V_CTODATE,7,4)) ;*/

  ------------ DOANH THU TU HOAT DONG GIAO DICH KI QUI (LAI) -------------
  --TIEN LAI DAU KY
      SELECT NVL(SUM(NAMT),0) INTO l_INTAMT_BG FROM VW_CITRAN_GEN WHERE TLTXCD IN ('5540','5567') AND FIELD='BALANCE'
      AND INSTR(TRDESC,'g')=0  and INSTR(TRDESC,'/BL/')=0 and txdate BETWEEN V_FROMDATE AND V_TODATE;

/*    select nvl(sum(log.intpaid),0) into l_INTAMT_BG
    FROM vw_lnmast_all ln, lntype lnt, vw_lnschd_all ls,
    (SELECT * FROM VW_LNSCHDLOG_ALL WHERE INTPAID+FEEINTPAID+FEEPAID+FEEPAID2>0 AND DELTD<>'Y') LOG
    where log.txdate BETWEEN V_FROMDATE AND V_TODATE
    and ln.acctno = ls.acctno and ls.autoid = log.autoid and ls.reftype = 'P'
    and ln.actype = lnt.actype and lnt.chksysctrl = 'Y' and ln.ftype = 'AF'
    and log.deltd <> 'Y';
*/

    --TIEN LAI CUOI KY
      SELECT NVL(SUM(NAMT),0) INTO l_INTAMT_END FROM VW_CITRAN_GEN WHERE TLTXCD IN ('5540','5567') AND FIELD='BALANCE'
     AND INSTR(TRDESC,'g')=0 and INSTR(TRDESC,'/BL/')=0 and txdate BETWEEN V_cFROMDATE AND V_cTODATE;
/*    select nvl(sum(log.intpaid),0) into l_INTAMT_END
    FROM vw_lnmast_all ln, lntype lnt, vw_lnschd_all ls,
    (SELECT * FROM VW_LNSCHDLOG_ALL WHERE INTPAID+FEEINTPAID+FEEPAID+FEEPAID2>0 AND DELTD<>'Y') LOG
    where log.txdate BETWEEN V_CFROMDATE AND V_CTODATE
    and ln.acctno = ls.acctno and ls.autoid = log.autoid and ls.reftype = 'P'
    and ln.actype = lnt.actype and lnt.chksysctrl = 'Y' and ln.ftype = 'AF'
    and log.deltd <> 'Y';*/

  ------------ DOANH THU TU HOAT DONG GIAO DICH KI QUI (PHI GD) -------------
  -- PHI GIAO DICH DAU KY
    SELECT NVL(SUM(CASE WHEN OD.EXECAMT=0 THEN 0
    ELSE (CASE WHEN IOD.IODFEEACR=0 AND OD.TXDATE=V_CURRDATE THEN ROUND(IOD.matchqtty * IOD.matchprice * ODT.deffeerate / 100, 2)
               ELSE IOD.IODFEEACR END) END),0) FEEAMT INTO l_FEEAMT_BG
    FROM VW_IOD_ALL IOD,VW_ODMAST_ALL OD , AFMAST AF,AFTYPE AFT, MRTYPE MR,ODTYPE ODT
    WHERE OD.AFACCTNO=AF.ACCTNO AND IOD.ORGORDERID=OD.ORDERID AND OD.ACTYPE=ODT.ACTYPE
    AND AF.ACTYPE=AFT.ACTYPE AND AFT.MRTYPE =MR.ACTYPE AND MR.MRTYPE='T'
    AND IOD.DELTD<>'Y'
    AND OD.TXDATE BETWEEN V_FROMDATE AND V_TODATE;

   -- PHI GIAO DICH CUOI KY
    SELECT NVL(SUM(CASE WHEN OD.EXECAMT=0 THEN 0
    ELSE (CASE WHEN IOD.IODFEEACR=0 AND OD.TXDATE=V_CURRDATE THEN ROUND(IOD.matchqtty * IOD.matchprice * ODT.deffeerate / 100, 2)
               ELSE IOD.IODFEEACR END) END),0) FEEAMT INTO l_FEEAMT_END
    FROM VW_IOD_ALL IOD,VW_ODMAST_ALL OD , AFMAST AF,AFTYPE AFT, MRTYPE MR,ODTYPE ODT
    WHERE OD.AFACCTNO=AF.ACCTNO AND IOD.ORGORDERID=OD.ORDERID AND OD.ACTYPE=ODT.ACTYPE
    AND AF.ACTYPE=AFT.ACTYPE AND AFT.MRTYPE =MR.ACTYPE AND MR.MRTYPE='T'
    AND IOD.DELTD<>'Y'
    AND OD.TXDATE BETWEEN V_CFROMDATE AND V_CTODATE;


     -- Top 5 Ma du no nhieu nhat dau ky
    select max(decode(rn,1,symbol))
    || ',' || max(decode(rn,2,symbol))
    || ',' || max(decode(rn,3,symbol))
    || ',' || max(decode(rn,4,symbol))
    || ',' || max(decode(rn,5,symbol))
       into l_TOP5SYMBOL_BG
    from
    (   select rownum rn, symbol, seamt from
            (
                SELECT SYMBOL,MAX(QTTY) SEAMT
                FROM(  SELECT MAX(INDATE) INDATE, SYMBOL ,GIA_TRI QTTY FROM
                (
                      SELECT V_CURRDATE INDATE,SB.CODEID,SB.SYMBOL,RM.MRMAXQTTY,SB.BASICPRICE,RM.SEQTTY,RM.SEQTTY*SB.BASICPRICE GIA_TRI
                      FROM SECURITIES_INFO SB, V_GETMARGINROOMINFO RM
                      WHERE SB.CODEID=RM.CODEID
                            AND (RM.MRMAXQTTY+RM.SEQTTY)<>0
                      UNION ALL
                      SELECT l.* FROM log_mr0056 l, afserisk r where l.codeid = r.codeid
                  )  WHERE INDATE IN  ( SELECT MAX(INDATE)FROM( SELECT V_CURRDATE INDATE FROM DUAL
                                      WHERE V_CURRDATE BETWEEN  V_FROMDATE AND V_TODATE
                                      UNION ALL SELECT MAX(INDATE) INDATE FROM log_mr0056
                                      WHERE INDATE BETWEEN  V_FROMDATE AND V_TODATE))
                   GROUP BY /*INDATE,*/SYMBOL,GIA_TRI
                  )GROUP BY SYMBOL
                  ORDER BY SEAMT DESC
        ) where rownum <= 5
    )mst;

    -- Top 5 Ma du no nhieu nhat.
    select max(decode(rn,1,symbol))
    || ',' || max(decode(rn,2,symbol))
    || ',' || max(decode(rn,3,symbol))
    || ',' || max(decode(rn,4,symbol))
    || ',' || max(decode(rn,5,symbol))
        into l_TOP5SYMBOL_end
    from
    (   select rownum rn, symbol, seamt from
        (
            (
                 SELECT SYMBOL,MAX(QTTY) SEAMT
                FROM(  SELECT MAX(INDATE) INDATE, SYMBOL ,GIA_TRI QTTY FROM
                (
                      SELECT V_CURRDATE INDATE,SB.CODEID,SB.SYMBOL,RM.MRMAXQTTY,SB.BASICPRICE,RM.SEQTTY,RM.SEQTTY*SB.BASICPRICE GIA_TRI
                      FROM SECURITIES_INFO SB, V_GETMARGINROOMINFO RM
                      WHERE SB.CODEID=RM.CODEID
                            AND (RM.MRMAXQTTY+RM.SEQTTY)<>0
                      UNION ALL
                      SELECT l.* FROM log_mr0056 l, afserisk r where l.codeid = r.codeid
                  ) WHERE INDATE IN  ( SELECT MAX(INDATE)FROM( SELECT V_CURRDATE INDATE FROM DUAL
                                      WHERE V_CURRDATE BETWEEN  V_CFROMDATE AND V_CTODATE
                                      UNION ALL SELECT MAX(INDATE) INDATE FROM log_mr0056
                                      WHERE INDATE BETWEEN  V_CFROMDATE AND V_CTODATE))
                   GROUP BY /*INDATE,*/SYMBOL,GIA_TRI
                  )GROUP BY SYMBOL
                  ORDER BY SEAMT DESC
            )
        ) where rownum <= 5
    )mst;

------------ DOANH THU TU HOAT DONG GIAO DICH KI QUI (CAC KHOAN THU KHAC) -------------
  --CAC KHOAN THU KHAC DAU KY

    SELECT NVL(SUM(NAMT),0) INTO l_OtherFee_BG
    FROM VW_CITRAN_GEN ci, afmast af, aftype aft, mrtype mrt
    WHERE ci.acctno = af.acctno
        and af.actype = aft.actype
        and aft.mrtype=MRT.ACTYPE
        and mrt.mrtype = 'T'
        and  ci.TLTXCD IN ('1153') AND ci.FIELD='BALANCE'  and ci.txtype='D'
        and ci.deltd <> 'Y'
     AND  ci.txdate BETWEEN V_FROMDATE AND V_TODATE;

    --TIEN LAI CUOI KY
    SELECT NVL(SUM(NAMT),0) INTO l_OtherFee_END
    FROM VW_CITRAN_GEN ci, afmast af, aftype aft, mrtype mrt
    WHERE ci.acctno = af.acctno
        and af.actype = aft.actype
        and aft.mrtype=MRT.ACTYPE
        and mrt.mrtype = 'T'
        and  ci.TLTXCD IN ('1153') AND ci.FIELD='BALANCE'  and ci.txtype='D'
        and ci.deltd <> 'Y'
     AND  ci.txdate BETWEEN V_cFROMDATE AND V_cTODATE;

OPEN PV_REFCURSOR FOR

SELECT (V_COUNTMR_HT-V_COUNTM_CK+V_COUNTD_CK)-V_COUNTM_GK+V_COUNTD_GK COUNTMRACC_BG, (V_COUNTMR_HT-V_COUNTM_CK+V_COUNTD_CK) COUNTMRACC_END,
       l_MAXDEBT_END MAXDEBT_BG, l_MAXDEBT_END MAXDEBT_END,
       (V_MR_END+V_PAID_END-V_RLS_END)+V_MR_BG-V_RLS_BG ODAMT_BG, (V_MR_END+V_PAID_END-V_RLS_END) ODAMT_END,
       l_SEREALASS_BG SEREALASS_BG, l_SEREALASS_END SEREALASS_END,
       l_INTAMT_BG INTAMT_BG, l_INTAMT_END INTAMT_END, l_FEEAMT_BG FEEAMT_BG,l_FEEAMT_END FEEAMT_END,
       l_TOP5SYMBOL_BG TOP5SYMBOL_BG, l_TOP5SYMBOL_END TOP5SYMBOL_END,
       to_char(V_FromDate,'DD/MM/RRRR') FRDATE, to_char(V_CToDate,'DD/MM/RRRR') TODATE, pv_BRID BRID,
       l_OtherFee_BG OtherFee_BG, l_OtherFee_END OtherFee_END
FROM DUAL;

EXCEPTION
  WHEN OTHERS
   THEN
      RETURN;
END;
 
/
