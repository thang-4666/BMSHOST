SET DEFINE OFF;
FROM v_getdealinfo v, (select dfacctno, sum(sendingqtty - sentqtty) qtty from DFSENDVSDDTL group by dfacctno) senddtl
WHERE  senddtl.dfacctno = v.acctno and v.status =''A'' and v.dftype=''M'' AND SENDDTL.QTTY <> 0', 'DFMAST', '', 'v.ACCTNO DESC', '2681', NULL, 50, 'N', 30, 'NYNNYYYNNN', 'Y', 'T', '', 'N', '', '');