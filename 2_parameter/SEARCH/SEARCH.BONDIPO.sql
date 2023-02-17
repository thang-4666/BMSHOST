SET DEFINE OFF;DELETE FROM SEARCH WHERE 1 = 1 AND NVL(SEARCHCODE,'NULL') = NVL('BONDIPO','NULL');Insert into SEARCH   (SEARCHCODE, SEARCHTITLE, EN_SEARCHTITLE, SEARCHCMDSQL, OBJNAME, FRMNAME, ORDERBYCMDSQL, TLTXCD, CNTRECORD, ROWPERPAGE, AUTOSEARCH, INTERVAL, AUTHCODE, ROWLIMIT, CMDTYPE, CONDDEFFLD, BANKINQ, BANKACCT, CHKSCOPECMDSQL) Values   ('BONDIPO', 'Đấu thầu', 'Bond ipo', 'SELECT MST.BONDID, MST.PERIOD, MST.TERM, MST.AUTOID, MST.CUSTID, MST.ISSTMPDATE TXDATE, MST.ISSDATE, MST.EXPDATE, MST.NOTES, mst.CODEID SYMBOL,
MST.BIDQTTY, MST.WINQTTY, MST.BIDBLKRATIO, MST.BIDOTHFEE, MST.OWNAMT, MST.CFAMT, MST.BIDBLK, MST.BONDTYPE, A1.cdcontent BONDISSUER,
MST.VOUCHFEE, MST.CODEID, a.cdcontent TREASURYBILL, mst.coupon COUPON, mst.WININTEREST, mst.MININTEREST, mst.MAXINTEREST,
mst.BIDRATE,mst.WINRATE, MST.TOTALQTTY TOTALQTTY,
(CASE WHEN NVL(MST.STATUS,''A'') IN (''P'') THEN ''Y'' ELSE ''N'' END) APRALLOW, A2.CDCONTENT STATUS
FROM BONDIPO MST,SBSECURITIES SB, allcode a, allcode a1, allcode a2
WHERE MST.CODEID=SB.symbol(+) and mst.TREASURYBILL = a.cdval and a.cdtype = ''SA'' and a.cdname = ''TREASURYBILL''
    and a1.cdname = ''ISSTMP'' AND A1.cdtype = ''SA'' AND MST.ISSTMP = A1.cdval
    and a2.cdname = ''STATUS'' AND A2.cdtype = ''SA'' AND nvl(MST.status,''A'') = A2.cdval', 'BONDIPO', 'frmBONDIPO', '', '', NULL, 50, 'N', 30, '', 'Y', 'T', '', 'N', '', '');COMMIT;