SET DEFINE OFF;DELETE FROM SEARCH WHERE 1 = 1 AND NVL(SEARCHCODE,'NULL') = NVL('SE2225','NULL');Insert into SEARCH   (SEARCHCODE, SEARCHTITLE, EN_SEARCHTITLE, SEARCHCMDSQL, OBJNAME, FRMNAME, ORDERBYCMDSQL, TLTXCD, CNTRECORD, ROWPERPAGE, AUTOSEARCH, INTERVAL, AUTHCODE, ROWLIMIT, CMDTYPE, CONDDEFFLD, BANKINQ, BANKACCT, CHKSCOPECMDSQL) Values   ('SE2225', 'Điều chỉnh ngày tự động giao dịch trở lại cho chứng khoán WFT(2225) ', 'Điều chỉnh ngày tự động giao dịch trở lại cho chứng khoán WFT (2225) ', 'SELECT LOG.TXNUM,LOG.TXDATE,LOG.CODEID,LOG.AFACCTNO,LOG.TRADE,LOG.BLOCKED,LOG.DEPOTYPE,LOG.ISWFT,LOG.DELTD,LOG.TRADEDATE
,LOG.STATUS,LOG.REF ,CF.FULLNAME,CF.CUSTODYCD,SEC.SYMBOL ,A1.CDCONTENT DEPOTYPEDIS,log.tradedate oldtradedate, least(SE.TRADE,LOG.trade )TRADE_MAX,
 least (SE.BLOCKED, LOG.BLOCKED) BLOCKED_MAX , CASE WHEN SE.TRADE < LOG.trade OR SE.BLOCKED < LOG.BLOCKED THEN ''Y'' ELSE ''N'' END ISCHANGE

FROM SEDEPOWFTLOG LOG, CFMAST CF, AFMAST AF,SBSECURITIES SEC ,allcode a1,semast se
WHERE LOG.AFACCTNO=AF.ACCTNO AND AF.CUSTID=CF.CUSTID
AND LOG.AFACCTNO = SE.AFACCTNO AND LOG.CODEID = SE.CODEID
AND SEC.CODEID=LOG.CODEID AND LOG.ISWFT=''Y'' AND LOG.DELTD <> ''Y'' AND LOG.STATUS=''A''
AND A1.CDNAME=''DEPOTYPE'' AND A1.CDTYPE=''SE'' AND A1.CDVAL=LOG.DEPOTYPE', 'SEDEPOWFTLOG', 'frm', '', '2225', 0, 50, 'N', 30, '', 'Y', 'T', 'CUSTODYCD', 'N', '', '');COMMIT;